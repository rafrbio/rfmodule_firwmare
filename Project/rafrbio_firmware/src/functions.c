#include "stm8l15x.h"
#include "functions.h"
/* --- FAST COUNTER --- */

/* Master reset
 MR -> PD7 */
void setMR(int state)
{	
	switch(state)
	{
		case LOW: /* Set pin low */
			/*                  76543210 */
			GPIOD -> ODR &= ~(0b10000000);
			break;
			
		case HIGH: /* Set pin high */
			/*                  76543210 */
			GPIOD -> ODR |=   0b10000000;
			break;
			
	}
}

/* Select the MUX output (position: 0,1,2,3...) */
void setMUX(uint8_t position)
{
	uint8_t tmp;
	uint8_t write_data;
	
	/* Remove bit in the position PB1-2-3 */
	tmp = (GPIOB -> ODR) & 0b11110001;
	
	/* Shift position value to PB1-2-3 */
	write_data = (position << 1) & 0b00001110;
	
	GPIOB -> ODR = tmp | write_data;
}



/* Read value */
uint8_t readFastCounter(void)
{
	uint8_t read_bit = 0;
	uint8_t value = 0;
	
	setMUX(0);
	read_bit = (GPIOE -> ODR) & 0x01;
	value = read_bit;
	
	setMUX(1);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 1) & 0b00000010;
	value = value | read_bit;

	setMUX(2);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 2) & 0b00000100;
	value = value | read_bit;

	setMUX(3);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 3) & 0b00001000;
	value = value | read_bit;
	
	setMUX(4);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 4) & 0b00010000;
	value = value | read_bit;

	setMUX(5);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 5) & 0b00100000;
	value = value | read_bit;
	
	setMUX(6);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 6) & 0b01000000;
	value = value | read_bit;
	
	setMUX(7);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 7) & 0b10000000;
	value = value | read_bit;


	return value;
}





/* --- COARSE COUNTER --- */

/* Output byte selection GAU
   !GAU -> PA4 */
void setGAU(int state)
{	
	switch(state)
	{
		case HIGH: /* Set pin low */
		/*                  76543210 */
		GPIOA -> ODR &= ~(0b00010000);
		break;
			
		case LOW: /* Set pin high */
		/*                  76543210 */
		GPIOA -> ODR |=   0b00010000;
		break;
		
	}
}


/* Output byte selection GAL
 !GAL -> PA5 */
void setGAL(int state)
{	
	switch(state)
	{
		case HIGH: /* Set pin low */
			/*                  76543210 */
			GPIOA -> ODR &= ~(0b00100000);
			break;
			
		case LOW: /* Set pin high */
			/*                  76543210 */
			GPIOA -> ODR |=   0b00100000;
			break;
			
	}
}


/* RESET pin
 !CCLR -> PB0 */
void setCCLR(int state)
{	
	switch(state)
	{
		case HIGH: /* Set pin low */
			/*                  76543210 */
			GPIOB -> ODR &= ~(0b00000001);
			break;
			
		case LOW: /* Set pin high */
			/*                  76543210 */
			GPIOB -> ODR |=   0b00000001;
			break;
			
	}
}


/* Read byte 0 */
uint8_t readSlowCounter_byte0(void)
{
	uint8_t nib0 = 0;
	uint8_t nib1 = 0;
	uint8_t value = 0;
	
	//								  76543210
	GPIOA -> ODR &=				  ~(0b00100000); //GAL LOW -> PA5 LOW (Read lower bit)
	nib0 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
	nib0 = (nib0 >> 2);
	nib0 = nib0&(0x0F);
	nib1 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
	nib1 = (nib1 << 4);
	nib1 = nib1&(0xF0);
	GPIOA -> ODR |=				   (0b00010000); //GAL HIGH -> PA5 HIGH
		
	value = nib0 | nib1;
	
	return value;
}

/* Read byte 1 */
uint8_t readSlowCounter_byte1(void)
{
	uint8_t nib2 = 0;
	uint8_t nib3 = 0;
	uint8_t value = 0;

	
	//								  76543210
	GPIOA -> ODR &=				  ~(0b00010000); //GAU LOW -> PA4 LOW (Read higher bit)
	nib2 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
	nib2 = (nib2 >> 2);
	nib2 = nib2&(0x0F);
	nib3 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
	nib3 = (nib3 << 4);
	nib3 = nib3&(0xF0);
	GPIOA -> ODR |=				   (0b00010000); //GAL HIGH -> PA4 HIGH
	
	value = nib2 | nib3;
	
	return value;
}




/* --- INPUT COMPARATOR --- */

/* latch enable
 LEA_TTL -> PA6 */
void setLEA(int state)
{	
	switch(state)
	{
		case LOW: /* Set pin low */
			/*                  76543210 */
			GPIOA -> ODR &= ~(0b01000000);
			break;
			
		case HIGH: /* Set pin high */
			/*                  76543210 */
			GPIOA -> ODR |=   0b01000000;
			break;
			
	}
}



/* --- OTHERS --- */

/* Read address value */
uint8_t readADR(void)
{	
	/* TODO */
}


/* Data enable output pin
 DE -> PE6 */
void setDE(int state)
{	
	switch(state)
	{
		case LOW: /* Set pin low */
			/*                  76543210 */
			GPIOE -> ODR &= ~(0b01000000);
			break;
			
		case HIGH: /* Set pin high */
			/*                  76543210 */
			GPIOE -> ODR |=   0b01000000;
			break;
			
	}
}





/* --- DEBUG --- */

/* debug output pin 1
 DEB1 -> PE7 */
void setDEB1(int state)
{	
	switch(state)
	{
		case LOW: /* Set pin low */
			/*                  76543210 */
			GPIOE -> ODR &= ~(0b10000000);
			break;
			
		case HIGH: /* Set pin high */
			/*                  76543210 */
			GPIOE -> ODR |=   0b10000000;
			break;
			
	}
}

/* debug output pin 2
 DEB2 -> PC3 */
void setDEB2(int state)
{	
	switch(state)
	{
		case LOW: /* Set pin low */
			/*                  76543210 */
			GPIOC -> ODR &= ~(0b00001000);
			break;
			
		case HIGH: /* Set pin high */
			/*                  76543210 */
			GPIOC -> ODR |=   0b00001000;
			break;
			
	}
}

void enableInputComp(void)
{
	//				    76543210
	GPIOE -> ODR |=   0b01000000; //PA6 HIGH
}

void disableInputComp(void)
{
	//				    76543210
	GPIOE -> ODR &= ~(0b01000000); //PA6 LOW
}



