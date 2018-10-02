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
uint8_t readFastCounter()
{
	uint8_t read_bit = 0;
	iuint8_tnt value = 0;
	
	setMUX(0);
	read_bit = (GPIOE -> ODR) & 0x01;
	value = read_bit;
	
	setMUX(1);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 1) & 0b00000010
	value = value | read_bit;

	setMUX(2);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 2) & 0b00000100
	value = value | read_bit;

	setMUX(3);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 3) & 0b00001000
	value = value | read_bit;
	
	setMUX(4);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 4) & 0b00010000
	value = value | read_bit;

	setMUX(5);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 5) & 0b00100000
	value = value | read_bit;
	
	setMUX(6);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 6) & 0b01000000
	value = value | read_bit;
	
	setMUX(7);
	read_bit = (GPIOE -> ODR) & 0x01;
	read_bit = (read_bit << 7) & 0b10000000
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
uint8_t readSlowCounter_byte0()
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
uint8_t readSlowCounter_byte1()
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




/* --- OLD --- */

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




int readFastCounter()
{
	//				    76543210
	GPIOB -> DDR |=  (0b00001110); //Code 100
	
	
}




