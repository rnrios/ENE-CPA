/** Rodrigo Naves Rios - 16/0144094
 */
#include <stdio.h>
#include "state_machine.h"

#define SIMULATION_TIME      10


int main(void)
{
   int i = 0; // cycles counter
   int error = 0;
   int event_setting = 0;
   // Simulation of an events sequence. Change it in order to test the state machine.
   event_id string_from_E_star[SIMULATION_TIME] =
   {
      EV_NONE,
      EV_SIN_ON,
      EV_SENSOR_ON,
      EV_BMOTOR,
      EV_MOTOR_INV,
      EV_NONE,
      EV_MOTOR_INV,
      EV_SENSOR_ON,
      EV_SIN_OFF,
      EV_SIN_ON
   };

   sm_setup();

   //for(;;) { /* When the debugging is done, use this infinite loop */
   for(i = 0; i < SIMULATION_TIME; i++) {

      // Tell the SM a new event happened.
      // This simulation method is not realistic since it allows a new incoming event every cycle.
      // In practice, since the CPU is fast, a great number of cycles is executed without any new
      // occurrence. In order to make this more realistic, include a lot of 'EV_NONE' between the
      // legitimate DES events.
      event_setting = sm_set_event(string_from_E_star[i]);
      if(event_setting < 0) printf("\nEvent ignored\n");

      // Execute SM
      error = sm_run();

      // If error < 0, an internal error inside the state functions occurred or an invalid string was
      // simulated.
      if(error < 0) {
         printf("\nFatal error!\n");
         return -1;
      }
   }

   sm_close();

   return 0;
}


