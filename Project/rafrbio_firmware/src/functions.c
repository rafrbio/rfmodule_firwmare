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


void pinInit()
{
	/* SN74LV8154 OUTPUT PINS
	 Y0 -> PE2
	 Y1 -> PE3
	 Y2 -> PE4
	 Y3 -> PE5
	 Y4 -> PD0
	 Y5 -> PD1
	 Y6 -> PD2
	 Y7 -> PD3 */
	//				    76543210
	GPIOE -> DDR |=  (0b00111100); 
	GPIOE -> CR1 |=  (0b00111100); //Push-pull output
	GPIOE -> CR2 &= ~(0b00111100); //10MHz max frequency
	//				    76543210
	GPIOD -> DDR |=  (0b00001111);
	GPIOD -> CR1 |=  (0b00001111); //Push-pull output
	GPIOD -> CR2 &= ~(0b00001111); //10MHz max frequency
	
					  
	
	/* SN74LV8154 OUTPUT PINS
	 GAU! -> PA4
	 GAL! -> PA5 */
	//				    76543210
	GPIOE -> DDR &= ~(0b00110000);
	GPIOE -> CR1 &= ~(0b00110000); //Floating input
	GPIOE -> CR2 &= ~(0b00110000); //Interrupt disabled 
	GPIOE -> ODR |=  (0b00110000); //PA4 PA5 HIGH

	
	
	/* MAX9389 OUTPUT PIN
	 Q -> PE0 */
	//				    76543210
	GPIOE -> DDR &= ~(0b00000001);
	GPIOE -> CR1 &= ~(0b00000001); //Floating input
	GPIOE -> CR2 &= ~(0b00000001); //Interrupt disabled 
					  
					  
	
	/* MAX9389 INPUT PIN
	 SEL0 -> PB1
	 SEL1 -> PB2
	 SEL2 -> PB3 */
	//				    76543210
	GPIOB -> DDR |=  (0b00001110); 
	GPIOB -> CR1 |=  (0b00001110); //Push-pull output
	GPIOB -> CR2 &= ~(0b00001110); //10MHz max frequency
 

	
	/* ADDRESS SELECTION PINS
	 ADR0 -> PC2
	 ADR1 -> PC3 */
	//				    76543210
	GPIOC -> DDR &= ~(0b00001100);
	GPIOC -> CR1 &= ~(0b00001100); //Floating input
	GPIOC -> CR2 &= ~(0b00001100); //Interrupt disabled
					  
					  
					  
	/* ADCMP551 ENABLE PIN
	 LEA_TTL -> PA6 */
	//				    76543210
	GPIOC -> DDR |=  (0b01000000);
	GPIOC -> CR1 |=  (0b01000000); //Push-pull output
	GPIOC -> CR2 &= ~(0b01000000); //10MHz max frequency
}



void enableInputComp()
{
	//				    76543210
	GPIOE -> ODR |=   0b01000000; //PA6 HIGH
}

void disableInputComp()
{
	//				    76543210
	GPIOE -> ODR &= ~(0b01000000); //PA6 LOW
}


int readSlowCounter()
{
	int nib0 = 0;
	int nib1 = 0;
	int nib2 = 0;
	int nib3 = 0;
	int value = 0;
	
	//								  76543210
	GPIOA -> ODR &=				  ~(0b00100000); //GAL LOW -> PA5 LOW (Read lower bit)
	nib0 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
	nib0 = (nib0 >> 2);
	nib1 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
	nib1 = (nib1 << 4);
	GPIOA -> ODR |=				   (0b00010000); //GAL HIGH -> PA5 HIGH
	//								  76543210
	GPIOA -> ODR &=				  ~(0b00010000); //GAU LOW -> PA4 LOW (Read lower bit)
	nib2 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
	nib2 = (nib2 << 6);
	nib3 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
	nib3 = (nib3 << 8);
	GPIOA -> ODR |=				   (0b00010000); //GAL LOW -> PA4 LOW (Read lower bit)
	
	value = nib0 | nib1 | nib2 | nib3;
	
	return value;
}


int readFastCounter()
{
	//				    76543210
	GPIOB -> DDR |=  (0b00001110); //Code 100
	
	
}




