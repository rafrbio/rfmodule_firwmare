   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  43                     ; 4 void main(void)
  43                     ; 5 {
  45                     	switch	.text
  46  0000               _main:
  50                     ; 8 	CLK -> ICKCR |= CLK_ICKCR_HSION;
  52  0000 721050c2      	bset	20674,#0
  53                     ; 11 	CLK -> PCKENR1 |= CLK_PCKENR1_TIM2;
  55  0004 721050c3      	bset	20675,#0
  56                     ; 14 	GPIOB -> DDR = 0b00000001;
  58  0008 35015007      	mov	20487,#1
  59                     ; 15 	GPIOB -> CR1 = 0b00000001;
  61  000c 35015008      	mov	20488,#1
  62                     ; 16 	GPIOB -> CR2 = 0b00000000;
  64  0010 725f5009      	clr	20489
  65                     ; 19 	GPIOE -> DDR = 0b11111111;
  67  0014 35ff5016      	mov	20502,#255
  68                     ; 22 	GPIOE -> CR1 = 0b11111111;
  70  0018 35ff5017      	mov	20503,#255
  71                     ; 36 	TIM2 -> CCR1H = 0xFF;
  73  001c 35ff5261      	mov	21089,#255
  74                     ; 37 	TIM2 -> CCR1L = 0xFF;
  76  0020 35ff5262      	mov	21090,#255
  77                     ; 40 	TIM2 -> ARRH = 0xFF;
  79  0024 35ff525f      	mov	21087,#255
  80                     ; 41 	TIM2 -> ARRL = 0xFF;
  82  0028 35ff5260      	mov	21088,#255
  83                     ; 44 	TIM2 -> IER |= TIM_IER_CC1IE;
  85  002c 72125255      	bset	21077,#1
  86                     ; 58 	TIM2 -> CCMR1 = ((uint8_t)0b00110000);
  88  0030 35305259      	mov	21081,#48
  89                     ; 61 	TIM2 -> CCER1 |= TIM_CCER1_CC1P;
  91  0034 7212525b      	bset	21083,#1
  92                     ; 64 	TIM2 -> CCER1 |= TIM_CCER1_CC1E;
  94  0038 7210525b      	bset	21083,#0
  95                     ; 67 	TIM2 -> BKR |= TIM1_BKR_MOE;
  97  003c 721e5265      	bset	21093,#7
  98                     ; 70 	TIM2 -> SR1 = 0;
 100  0040 725f5256      	clr	21078
 101                     ; 71 	TIM2 -> CR1 |= TIM_CR1_CEN;
 103  0044 72105250      	bset	21072,#0
 104                     ; 74 	enableInterrupts();
 107  0048 9a            rim
 109  0049               L12:
 110                     ; 82 	  GPIOE -> ODR |=   0b00010000;
 112  0049 72185014      	bset	20500,#4
 113                     ; 83 	  GPIOE -> ODR &= ~(0b00010000);
 115  004d 72195014      	bres	20500,#4
 117  0051 20f6          	jra	L12
 141                     ; 90 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 141                     ; 91 {
 143                     	switch	.text
 144  0053               f_TIM2_CAP_IRQHandler:
 148                     ; 93 	TIM2 -> SR1 = 0;
 150  0053 725f5256      	clr	21078
 151                     ; 98 	GPIOE -> ODR |=   0b00000001;
 153  0057 72105014      	bset	20500,#0
 154                     ; 99 	GPIOE -> ODR &= ~(0b00000001);
 156  005b 72115014      	bres	20500,#0
 157                     ; 101 }
 160  005f 80            	iret
 183                     ; 104 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 183                     ; 105 {
 184                     	switch	.text
 185  0060               f_TIM1_CAP_IRQHandler:
 189                     ; 107 	TIM2 -> SR1 = 0;
 191  0060 725f5256      	clr	21078
 192                     ; 112 	GPIOE -> ODR |=   0b00000001;
 194  0064 72105014      	bset	20500,#0
 195                     ; 113 	GPIOE -> ODR &= ~(0b00000001);
 197  0068 72115014      	bres	20500,#0
 198                     ; 115 }
 201  006c 80            	iret
 213                     	xdef	f_TIM1_CAP_IRQHandler
 214                     	xdef	f_TIM2_CAP_IRQHandler
 215                     	xdef	_main
 234                     	end
