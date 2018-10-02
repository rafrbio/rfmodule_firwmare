#include "stm8l15x.h"
#include "functions.h"

/* MACHINE STATUS */
#define STATUS_IDLE				0
#define STATUS_RX				1
#define STATUS_TX				2

/* I2C DATA ADDRESSES */
#define ADD_DATA0		((uint8_t)0x01)
#define ADD_TEST1		((uint8_t)0x02)

/* I2C TRANSMIT DATA */
#define VALUE_NULL			0
#define VALUE_DATA0_BYTE0	1
#define VALUE_DATA0_BYTE1	2
#define VALUE_DATA0_BYTE2	3
#define VALUE_TEST1			5
#define VALUE_NOREGISTER	6

/* DATA STORAGE */
#define DATA_A				0
#define DATA_B				1

int dataAvailable = 0;
int dataStorage	= DATA_A;

unit8_t byte0[2] = {0, 0};
unit8_t byte1[2] = {0, 0};
unit8_t byte2[2] = {0, 0};



void main(void)
{
	int status = STATUS_IDLE;
	uint8_t requested_register = 0;
	uint8_t sr1_value;
	int send_value = VALUE_NULL;
	int tmp;
	
	int dataStorageToSend = DATA_A;
	
	
	/* --- CLOCK SETUP --- */
	
	/* Enable high frequency external clock */
	CLK -> ECKCR |= CLK_ECKCR_HSEON;
	//CLK -> ICKCR |= CLK_ICKCR_HSION;
	
	/* System clock prescaler setting
	 000: System clock source/1
	 001: System clock source/2
	 010: System clock source/4
	 011: System clock source/8
	 100: System clock source/16
	 101: System clock source/32
	 110: System clock source/64
	 111: System clock source/128 */
	CLK -> CKDIVR &= 0b000;
	
	
	
	/* --- PHERIFERAL CLOCK GATING SETUP --- */
	
	/* TIM1 clock gating enable */
	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
	
	/* I2C clock gating enable */
	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
	
	
	
	/* --- GPIO SETUP --- */
	/* DDR -> 0: input, 1: output, 
	   CR1 -> (input)  0: floating,		 1: pull-up
			  (output) 0: open drain,	 1: push-pull
	   CR2 -> (input)  0: int. disabled, 1: int. enabled
			  (output) 0: 2 Mhz speed,	 1: 10 MHz speed	
	
	/* GPIO PORT A
	   PA4 -> !GAU		(out)
	   PA5 -> !GAL		(out)
	   PA6 -> LEA_TTL	(out)*/
	//				 76543210
	GPIOA -> DDR = 0b01110000;
	GPIOA -> CR1 = 0b01110000;
	GPIOA -> CR2 = 0b01110000;	
	

	/* GPIO PORT B
	   PB0 -> !CCLR (out)
	   PB1 -> SEL0	(out)
	   PB2 -> SEL1	(out)
	   PB3 -> SEL2	(out)*/
	//				 76543210
	GPIOB -> DDR = 0b00001111;
	GPIOB -> CR1 = 0b00001111;
	GPIOB -> CR2 = 0b00001111;	

	
	/* GPIO PORT C
	   PC3 -> DEB2 (out)
	   PC5 -> ADR1 (in)
	   PC6 -> ADR2 (in) */
	//				 76543210
	GPIOC -> DDR = 0b00001000;
	GPIOC -> CR1 = 0b01101000;
	GPIOC -> CR2 = 0b00001000;
	

	/* GPIO PORT D
	   PD0 -> Y4	  (in)
	   PD1 -> Y5	  (in)
	   PD2 -> Y6	  (in)
	   PD3 -> Y7	  (in)
	   PD4 -> !CE_TTL (out)
	   PD7 -> MR_TTL  (out) */
	//				 76543210
	GPIOD -> DDR = 0b10010000;
	GPIOD -> CR1 = 0b10010000;
	GPIOD -> CR2 = 0b10010000;	

	
	/* GPIO PORT E
	 PE0 -> MUX  (in)
	 PE2 -> Y0	 (in)
	 PE3 -> Y1	 (in)
	 PE4 -> Y2	 (in)
	 PE5 -> Y3	 (in)
	 PE6 -> DE   (out)
	 PE7 -> DEB1 (out) */
	//				 76543210
	GPIOE -> DDR = 0b11000000;
	GPIOE -> CR1 = 0b11000000;
	GPIOE -> CR2 = 0b11000000;	
	
	
	
	
	/* --- TIM1 CH2 OUTPUT COMPARE SETUP --- */
	
	/* Counter 1 compare register MS and LS bytes */
	TIM1 -> CCR1H = 0xFF;
	TIM1 -> CCR1L = 0xFF;
	
	/* Counter 1 auto-reload MS and LS bytes */
	TIM1 -> ARRH = 0xFF;
	TIM1 -> ARRL = 0xFF;
	
	/* Enable interrupt on compare event */
	TIM1 -> IER |= TIM_IER_CC1IE;
	
	/* Capture/compare mode setting
	 Bit 6-4:
	 000: Frozen
	 001: Set channel 1 to active level on match
	 010: Set channel 1 to inactive level on match
	 011: Toggle
	 100: Force inactive level
	 101: Force active level
	 Bit 3: 
	 0: preload register disabled
	 1: preload register enabled */
	//						Bit	76543210
	TIM1 -> CCMR1 = ((uint8_t)0b00110000);
	
	/* Set output polarity to active high */
	TIM1 -> CCER1 |= TIM_CCER1_CC1P;
	
	/* Enable compare 2 output */
	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
	
	/* Enable main output */
	TIM1-> BKR |= TIM1_BKR_MOE;
	
	/* Enable counter 1 */
	TIM1 -> SR1 = 0;
	TIM1 -> CR1 |= TIM_CR1_CEN;
	
	
	
	/* --- I2C SETUP --- */
	
	/* Disable peripheral */
	I2C1 -> CR1 &= ~I2C_CR1_PE;
	
	/* I2C frequency set to 16 Mhz (Standard Mode)*/
	I2C1 -> FREQR |= ((uint8_t)0b010000);
	
	/* Slave address */
	I2C1 -> OARL = ((uint8_t)0x02);
	
	/* Addressing mode: 7-bit slave address */
	//I2C1 -> OARH &= ~I2C_OARH_ADDMODE;
	I2C1 -> OARH |= I2C_OARH_ADDCONF;
	
	/* Enable peripheral */
	I2C1 -> CR1 |= I2C_CR1_PE;
	
	/* Acknowledge enable */
	I2C1 -> CR2 |= I2C_CR2_ACK;
	
	
	
	/* --- INTERRUPT SETUP --- */
	
	/* Enable interrupt */
	enableInterrupts();
	
	
	
	/* Infinite loop */
	while (1)
	{
		switch(status)
		{
			case(STATUS_IDLE):
			sr1_value = I2C1 -> SR1;
				
				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
				{
					status = STATUS_RX;
					//togglePE2();
				}
				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
				{
					status = STATUS_TX;
					togglePE2();
				}
				
				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
				{
					togglePE1();
					/* Read SR1 and SR3 to reset ADDR register */
					tmp = I2C1 -> SR1;
					tmp = I2C1 -> SR3;
				}
				
				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
				{
					togglePE3();
					/* Read SR1 and write CR2 to reset STOPF register */
					tmp = I2C1 -> SR1;
					I2C1 -> CR2 |= I2C_CR2_ACK;
				}
				
				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
				{
					/* Reset AF register */
					I2C1 -> SR2 &= ~(I2C_SR2_AF);
				}
				
				if( dataAvailable == 1)
				{
					/* Set data available pin on */
					setDE(HIGH);
				}
				else
				{
					setDE(LOW);
				}
				
				break;
				
			case(STATUS_RX):
				requested_register = I2C1 -> DR;
				
				switch(requested_register)
				{
					case(ADD_DATA0):
						send_value = VALUE_DATA0_BYTE0;						
						break;
						
					case(ADD_TEST1):
						send_value = VALUE_TEST1;
						break;
						
					default:
						send_value = VALUE_NOREGISTER;
						break;
				}
				
				status = STATUS_IDLE;
				break;

			case(STATUS_TX):
				switch(send_value)
				{
					case(VALUE_NULL):
						togglePE4();
						break;
						
					case(VALUE_DATA0_BYTE0):
						tmp = I2C1 -> SR1;
						
						/* Read the data storage allocation */
						dataStorageToSend = dataStorage;
						
						/* Data no more available */
						dataAvailable = 0;
						
						/* Read and transmit the data */
						I2C1 -> DR = byte0[dataStorageToSend];
						
						/* Go the next byte */
						send_value = VALUE_DATA0_BYTE1;
						break;
						
					case(VALUE_DATA0_BYTE1):
						tmp = I2C1 -> SR1;
						
						/* Read the data storage allocation */
						dataStorageToSend = dataStorage;
						
						/* Read and transmit the data */
						I2C1 -> DR = byte1[dataStorageToSend];
						
						/* Go the next byte */
						send_value = VALUE_DATA0_BYTE2;
						break;

					case(VALUE_DATA0_BYTE2):
						tmp = I2C1 -> SR1;
						
						/* Read the data storage allocation */
						dataStorageToSend = dataStorage;
						
						/* Read and transmit the data */
						I2C1 -> DR = byte2[dataStorageToSend];
						
						/* Go the next byte */
						send_value = VALUE_NULL;
						break;
						
					case(VALUE_TEST1):
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x54);
						send_value = VALUE_NULL;
						break;
					
					case(VALUE_NOREGISTER):
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x00);
						send_value = VALUE_NULL;
						break;
						
					default:
						//ERROR!
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x00);
						send_value = VALUE_NULL;
						break;
						
				} //switch(send_value)
				
				status = STATUS_IDLE;
				break;
				
		} //switch(status)
	
		/* Debug pin output */
		setDEB2(HIGH);
		setDEB2(LOW);
		
	} //while(1)
	
} //void main(void)




INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
{
	int store_data;
	
	/* Reset interrupt flag in the TIM1 status register */
	TIM2 -> SR1 = 0;
	
	/* Read the data */
	byte0[!dataStorage] = readFastCounter();
	byte1[!dataStorage] = readSlowCounter_byte0();
	byte2[!dataStorage] = readSlowCounter_byte1();
	
	/* Change the allocation in which you are storing the data */
	dataStorage = !dataStorage;
	
	/* New data is available */
	dataAvailable = 1;
	
	/* Reset the counters */
	setMR(HIGH);
	setMR(LOW);
	
	/* Debug pin output */
	setDEB1(HIGH);
	setDEB1(LOW);
}