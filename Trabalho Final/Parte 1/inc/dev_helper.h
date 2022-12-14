/** Rodrigo Naves Rios - 16/0144094
 */
#ifndef DEV_HELPER_H_
#define DEV_HELPER_H_

#include <stdio.h>

// When debugging is finished, comment the line below:
//#define SM_DEBUG

#undef PDEBUG
#ifdef SM_DEBUG
#   define PDEBUG(msg, args...) printf("\nDebugging:" msg, ## args)
#else
#   define PDEBUG(msg, args...) /* not debugging: nothing */
#endif

// Sometimes is useful to enable just one 'print', keeping the others disabled. Just add an
// 'Y' to do so:
#undef PDEBUGY
#define PDEBUGY(msg, args...) printf("\nDebugging:" msg, ## args)


#endif /* DEV_HELPER_H_ */
