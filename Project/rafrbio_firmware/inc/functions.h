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


void setMR(int state);

void setMUX(uint8_t position);

uint8_t readFastCounter(void);

void setGAU(int state);

void setGAL(int state);

void setCCLR(int state);

uint8_t readSlowCounter_byte0(void);

uint8_t readSlowCounter_byte1(void);

void setLEA(int state);

uint8_t readADR(void);

void setDE(int state);

void setDEB1(int state);

void setDEB2(int state);

void enableInputComp(void);

void disableInputComp(void);