/** Rodrigo Naves Rios - 16/0144094
 */
#include <dev_helper.h>
#include <state_machine.h>

/********************* Declaration of function headers ****************************/

// Declaração função de estado SIN OFF.
static int st_sin_off(STATE_FUNCTIONS_ARGS);

// Declaração função de estado SIN ON.
static int st_sin_on(STATE_FUNCTIONS_ARGS);

// Declaração função de estado MOTOR ON 1.
static int st_motor_on1(STATE_FUNCTIONS_ARGS);

// Declaração função de estado MOTOR ON 2.
static int st_motor_on2(STATE_FUNCTIONS_ARGS);

// Declaração função de estado MOTOR ON 1.
static int st_motor_on1(STATE_FUNCTIONS_ARGS);

// Declaração função de estado MOTOR OFF
static int st_motor_off(STATE_FUNCTIONS_ARGS);

// Declaração função de estado EM_OFF
static int st_em_off(STATE_FUNCTIONS_ARGS);

// Declaration of a private 'set' function used by internal states to allow
// external events recognition.
// static void sm_private_set_event(event_id event);

/********************* Global variables *******************************************/

static event_id _event = EV_NONE; // current event
static state_id _state = ST_SIN_OFF; // initial state (it could be declared inside sm_run)

// Function pointers array
// ----> Change this array accordingly to your automaton model
const static state_handler state_handler_container[NUMBER_ST] =
{
   [ST_SIN_OFF]       = {ST_SIN_OFF, st_sin_off},
   [ST_SIN_ON]       = {ST_SIN_ON, st_sin_on},
   [ST_MOTOR_ON1]       = {ST_MOTOR_ON1,st_motor_on1},
   [ST_MOTOR_ON2]       = {ST_MOTOR_ON2, st_motor_on2},
   [ST_MOTOR_OFF]       = {ST_MOTOR_OFF, st_motor_off},
   [ST_EM_OFF]       = {ST_EM_OFF, st_em_off}
};


/********************* Implementation of functions *************************************/

/********************* State functions *************************************************/

// ----> Implement your own state functions

// implementação SIN OFF
static int st_sin_off(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("sm_sin_off execution\n");

   // Configure GPIO and set its output to 0.
   // Return -1 if something goes wrong.

   return 0;
}


// Implementação SIN ON (SISTEMA FUNCIONANDO).
static int st_sin_on(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("sm_sin_on execution\n");


   return 0;
}

// Implementação MOTOR ON1 (MOTOR NO SENTIDO HORARIO + SINALIZADOR).
static int st_motor_on1(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("st_motor_on1 execution\n");

   return 0;
}

// Implementação MOTOR ON2 (MOTOR NO SENTIDO HORARIO + SINALIZADOR).
static int st_motor_on2(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("sm_motor_on2 execution\n");

   return 0;
}

static int st_motor_off(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("sm_motor_off\n");

   // Configure GPIO and set its output to 1.
   // Return -1 if something goes wrong.

   return 0;
}

static int st_em_off(STATE_FUNCTIONS_ARGS)
{
   PDEBUGY("sm_sin_em\n");

   // Configure GPIO and set its output to 1.
   // Return -1 if something goes wrong.

   return 0;
}

/********************* 'get' and 'set' functions *********************************************/

// sm_private_get_event implementation.
static event_id sm_private_get_event(void)
{
   event_id new_event;

   PDEBUG("sm_private_get_event execution\n");

   new_event = _event;
   _event = EV_NONE;

   return new_event;
}

// sm_set_event implementation.
int sm_set_event(event_id event)
{
   int ret = -1; // return -1 if event is ignored.

   PDEBUG("sm_set_event_event execution\n");

   // First check if event value is valid. Obs.: EV_NONE is not recognized because it would be useless.
   if((event > 0) && (event < NUMBER_EV)) {
       _event = event;
       ret = 0;
   }

   return ret;
}

/********************* Public SM functions *********************************************/

// sm_setup implementation.
void sm_setup(void)
{
   // Nothing to do in this fictitious firmware, just print a msg.
   PDEBUG("sm_setup execution\n");
}

// sm_run implementation
int sm_run(void)
{
   int ret = 0;
   event_id event = EV_NONE;
   state_id next_state = _state; // Current state

   // Dynamic memory allocation could be used (in setup function), but for microcontrollers with
   // bare-metal, monolithic firmware, this is usually better.
   static int16_t ex_data[OUT_BUFFER_SIZE];
   static int16_t in_data[IN_BUFFER_SIZE];

   // Transition function array: given a state and an event, it returns the next state.
   // Be careful! The events ordering defined in 'typedef enum event_id' must be obeyed.
   // ----> Change this transition function accordingly to your automaton model!
   const static state_id f[NUMBER_ST][NUMBER_EV] =
   {
      [ST_SIN_OFF]       = {ST_NULL, ST_NULL, ST_SIN_ON, ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_NULL},
      [ST_SIN_ON]       = {ST_NULL, ST_NULL, ST_NULL, ST_MOTOR_ON1, ST_MOTOR_OFF, ST_NULL, ST_EM_OFF, ST_NULL},
      [ST_MOTOR_ON1]       = {ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_MOTOR_OFF, ST_MOTOR_ON2, ST_EM_OFF, ST_NULL},
      [ST_MOTOR_ON2]       = {ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_MOTOR_OFF, ST_MOTOR_ON1, ST_EM_OFF, ST_NULL},
      [ST_MOTOR_OFF]       = {ST_NULL, ST_SIN_OFF, ST_NULL, ST_MOTOR_ON1, ST_MOTOR_ON1, ST_NULL, ST_EM_OFF, ST_NULL},
      [ST_EM_OFF]       = {ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_NULL, ST_SIN_ON}
   };

   PDEBUG("sm_run execution\n");

   // At each cycle, get the new event, which was set by 'external world' or by a SM internal state
   event = sm_private_get_event();

   // In order to save power, do something if there is a new event only.
   if(event != EV_NONE) {
      // Get the next state to be executed
      next_state = f[_state][event];

      if(next_state != ST_NULL) {
         // Update the current state variable
         _state = next_state;

         // Execute next state function, return 0 if everything went OK or -1 otherwise
         ret = state_handler_container[_state].state_exe(ex_data, in_data);
      }
      else {
         // If the new event is not recognized in current state, f returns a 'NULL' state, and the function
         // returns an error code.
         return -1;
      }
   }

   return ret;
}

// sm_close implementation.
void sm_close(void)
{
   // Nothing to do in this fictitious firmware, just print a msg.
   PDEBUG("sm_close execution\n");
}



