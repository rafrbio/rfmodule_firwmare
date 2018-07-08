#include "stm8l15x.h"

	
void main(void)
{
	/* Enable high frequency external clock */
	//CLK -> ECKCR |= CLK_ECKCR_HSEON;
	CLK -> ICKCR |= CLK_ICKCR_HSION;
	
	/* Enable Peripheral clock gating */
	CLK -> PCKENR1 |= CLK_PCKENR1_TIM2;
	
	/* Set PB0 pin in output mode*/
	GPIOB -> DDR = 0b00000001;
	GPIOB -> CR1 = 0b00000001;
	GPIOB -> CR2 = 0b00000000;
	
	/* Enable GPIO PORT E*/
	GPIOE -> DDR = 0b11111111;
	
	/* GPIO PORT E push-pull output*/
	GPIOE -> CR1 = 0b11111111;
	
	/* System clock prescaler setting
	 000: System clock source/1 
	 001: System clock source/2
	 010: System clock source/4 
	 011: System clock source/8 
	 100: System clock source/16 
	 101: System clock source/32 
	 110: System clock source/64 
	 111: System clock source/128 */
	//CLK -> CKDIVR &= 0b000;
	
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
	
	/* Enable interrupt */
	enableInterrupts();
	
  /* Infinite loop */
  while (1)
  {
	  
	  /* Toggle PORTA output */
	  /*                  76543210 */
	  GPIOE -> ODR |=   0b00010000;
	  GPIOE -> ODR &= ~(0b00010000);
	  
  }
}



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
