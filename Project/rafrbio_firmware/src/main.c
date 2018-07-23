#include "stm8l15x.h"

#define STATUS_IDLE				0
#define STATUS_RX				1
#define STATUS_TX				2

#define ADD_DATA0		((uint8_t)0x01)
#define ADD_TEST1		((uint8_t)0x02)

#define VALUE_NULL			0
#define VALUE_DATA0_BYTE0	1
#define VALUE_DATA0_BYTE1	2
#define VALUE_DATA0_BYTE2	3
#define VALUE_DATA0_BYTE3	4

#define VALUE_TEST1			5

#define VALUE_NOREGISTER	6


void togglePE1(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00000010;
	GPIOE -> ODR &= ~(0b00000010);
}

void togglePE2(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00000100;
	GPIOE -> ODR &= ~(0b00000100);
}

void togglePE3(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00001000;
	GPIOE -> ODR &= ~(0b00001000);
}

void togglePE4(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00010000;
	GPIOE -> ODR &= ~(0b00010000);
}

void togglePE5(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00100000;
	GPIOE -> ODR &= ~(0b00100000);
}

void togglePE6(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b0100000;
	GPIOE -> ODR &= ~(0b0100000);
}

void togglePE7(void)
{
	/* Toggle PE1 output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b1000000;
	GPIOE -> ODR &= ~(0b1000000);
}


void enable



void main(void)
{
	int status = STATUS_IDLE;
	uint8_t requested_register = 0;
	uint8_t sr1_value;
	int send_value = VALUE_NULL;
	int tmp;
	
	
	/* --- CLOCK SETUP --- */
	
	/* Enable high frequency external clock */
	//CLK -> ECKCR |= CLK_ECKCR_HSEON;
	CLK -> ICKCR |= CLK_ICKCR_HSION;
	
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
	
	/* TIM2 clock gating enable */
	CLK -> PCKENR1 |= CLK_PCKENR1_TIM2;
	
	/* I2C clock gating enable */
	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
	
	
	
	/* --- GPIO SETUP --- */
	
	/* Set PB0 pin in output mode*/
	GPIOB -> DDR = 0b00000001;
	GPIOB -> CR1 = 0b00000001;
	GPIOB -> CR2 = 0b00000000;
	
	/* Enable GPIO PORT E*/
	GPIOE -> DDR = 0b11111111;
	GPIOE -> CR1 = 0b11111111;
	GPIOE -> CR2 = 0b00000000;
	
	
	/* --- TIM2 OUTPUT COMPARE SETUP --- */
	
	/* Counter 1 compare register MS and LS bytes */
	TIM2 -> CCR1H = 0xFF;
	TIM2 -> CCR1L = 0xFF;
	
	/* Counter 1 auto-reload MS and LS bytes */
	TIM2 -> ARRH = 0xFF;
	TIM2 -> ARRL = 0xFF;
	
	/* Enable interrupt on compare event */
	TIM2 -> IER |= TIM_IER_CC1IE;
	
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
	TIM2 -> CCMR1 = ((uint8_t)0b00110000);
	
	/* Set output polarity to active high */
	TIM2 -> CCER1 |= TIM_CCER1_CC1P;
	
	/* Enable compare 1 output */
	TIM2 -> CCER1 |= TIM_CCER1_CC1E;
	
	/* Enable main output */
	TIM2 -> BKR |= TIM1_BKR_MOE;
	
	/* Enable counter 1 */
	TIM2 -> SR1 = 0;
	TIM2 -> CR1 |= TIM_CR1_CEN;
	
	
	
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
			sr1_value = I2C1 -> SR1 ;
				
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
						I2C1 -> DR = ((uint8_t)0x50);
						send_value = VALUE_DATA0_BYTE1;
						break;
						
					case(VALUE_DATA0_BYTE1):
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x51);
						send_value = VALUE_DATA0_BYTE2;
						break;

					case(VALUE_DATA0_BYTE2):
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x52);
						send_value = VALUE_DATA0_BYTE3;
						break;

					case(VALUE_DATA0_BYTE3):
						tmp = I2C1 -> SR1;
						I2C1 -> DR = ((uint8_t)0x53);
						send_value = VALUE_NULL;
						//Disable DATA_ENABLE pin
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
	
		togglePE6();
		
	} //while(1)
	
} //void main(void)






INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
{
	/* Reset interrupt flag in the TIM1 status register */
	TIM2 -> SR1 = 0;
	
	/* Toggle PORTA output */
	/* Toggle PORTA output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00000001;
	GPIOE -> ODR &= ~(0b00000001);
	
}


INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
{
	/* Reset interrupt flag in the TIM1 status register */
	TIM2 -> SR1 = 0;
	
	/* Toggle PORTA output */
	/* Toggle PORTA output */
	/*                  76543210 */
	GPIOE -> ODR |=   0b00000001;
	GPIOE -> ODR &= ~(0b00000001);
	
}
