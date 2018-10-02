#ifndef __STM8L15x_H
	#include "stm8l15x.h"
#endif

/*********************************************************************
 
						DEFINES
 
 *********************************************************************/

#define HIGH 1
#define LOW	 0


/*********************************************************************
 
						PIN ASSIGNMENTS
 
*********************************************************************/

#define N_USED_PIN	1



/*********************************************************************

						FUNCTION PROTOTYPES
 
*********************************************************************/

void togglePE1(void);

void togglePE2(void);

void togglePE3(void);

void togglePE4(void);

void togglePE5(void);

void togglePE6(void);

void togglePE7(void);

void pinInit();

void enableInputComp();

void disableInputComp();

int readSlowCounter();

int readFastCounter();