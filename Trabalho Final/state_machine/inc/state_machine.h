 /** Rodrigo Naves Rios - 16/0144094
 */
#ifndef STATE_MACHINE_H_
#define STATE_MACHINE_H_

#include <stdint.h>

#define STATE_FUNCTIONS_ARGS      int16_t *ex_data, int16_t *in_data
#define IN_BUFFER_SIZE            1
#define OUT_BUFFER_SIZE           2

typedef enum
{
   ST_NULL = 0,
   ST_SIN_OFF,
   ST_SIN_ON,
   ST_MOTOR_ON1,
   ST_MOTOR_ON2,
   ST_MOTOR_OFF,
   ST_EM_OFF,
   NUMBER_ST
} state_id;

typedef enum
{
   EV_NONE = 0,
   EV_SIN_OFF,
   EV_SIN_ON,
   EV_BMOTOR,
   EV_SENSOR_ON,
   EV_MOTOR_INV,
   EV_EM_OFF,
   EV_EM_ON,
   NUMBER_EV
} event_id;

typedef struct
{
   state_id st_id;
   int (*state_exe)(STATE_FUNCTIONS_ARGS);
} state_handler;

// Public function used to tell the SM what the new incoming event is. It can be called by an interrupt
// function or a polling one responsible for inputs reading. External interrupts are triggered by
// rise or falling edges of GPIOs and other peripherals. The polling method only reads the GPIOs states
// at the reading moment.
int sm_set_event(event_id event);

// Public function used to setup whatever the SM needs (peripherals registers, memory allocation, etc.)
void sm_setup(void);

// Public function which executes the current state function.
int sm_run(void);

// Public function used to turn things off, to deallocate memory, etc.
void sm_close(void);


#endif /* STATE_MACHINE_H_ */
