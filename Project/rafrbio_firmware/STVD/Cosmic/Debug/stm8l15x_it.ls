   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  43                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
  43                     ; 48 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 52 }
  52  0000 80            	iret
  74                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 61 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 65 }
  83  0001 80            	iret
 105                     ; 71 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
 105                     ; 72 {
 106                     	switch	.text
 107  0002               f_FLASH_IRQHandler:
 111                     ; 76 }
 114  0002 80            	iret
 137                     ; 82 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 137                     ; 83 {
 138                     	switch	.text
 139  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 143                     ; 87 }
 146  0003 80            	iret
 169                     ; 93 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 169                     ; 94 {
 170                     	switch	.text
 171  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 175                     ; 98 }
 178  0004 80            	iret
 200                     ; 104 INTERRUPT_HANDLER(RTC_IRQHandler, 4)
 200                     ; 105 {
 201                     	switch	.text
 202  0005               f_RTC_IRQHandler:
 206                     ; 109 }
 209  0005 80            	iret
 232                     ; 115 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 232                     ; 116 {
 233                     	switch	.text
 234  0006               f_EXTIE_F_PVD_IRQHandler:
 238                     ; 120 }
 241  0006 80            	iret
 263                     ; 127 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 263                     ; 128 {
 264                     	switch	.text
 265  0007               f_EXTIB_IRQHandler:
 269                     ; 132 }
 272  0007 80            	iret
 294                     ; 139 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 294                     ; 140 {
 295                     	switch	.text
 296  0008               f_EXTID_IRQHandler:
 300                     ; 144 }
 303  0008 80            	iret
 325                     ; 151 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 325                     ; 152 {
 326                     	switch	.text
 327  0009               f_EXTI0_IRQHandler:
 331                     ; 156 }
 334  0009 80            	iret
 356                     ; 163 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 356                     ; 164 {
 357                     	switch	.text
 358  000a               f_EXTI1_IRQHandler:
 362                     ; 168 }
 365  000a 80            	iret
 387                     ; 175 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 387                     ; 176 {
 388                     	switch	.text
 389  000b               f_EXTI2_IRQHandler:
 393                     ; 180 }
 396  000b 80            	iret
 418                     ; 187 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 418                     ; 188 {
 419                     	switch	.text
 420  000c               f_EXTI3_IRQHandler:
 424                     ; 192 }
 427  000c 80            	iret
 449                     ; 199 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 449                     ; 200 {
 450                     	switch	.text
 451  000d               f_EXTI4_IRQHandler:
 455                     ; 204 }
 458  000d 80            	iret
 480                     ; 211 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 480                     ; 212 {
 481                     	switch	.text
 482  000e               f_EXTI5_IRQHandler:
 486                     ; 216 }
 489  000e 80            	iret
 511                     ; 223 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 511                     ; 224 {
 512                     	switch	.text
 513  000f               f_EXTI6_IRQHandler:
 517                     ; 228 }
 520  000f 80            	iret
 542                     ; 235 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 542                     ; 236 {
 543                     	switch	.text
 544  0010               f_EXTI7_IRQHandler:
 548                     ; 240 }
 551  0010 80            	iret
 573                     ; 246 INTERRUPT_HANDLER(LCD_IRQHandler, 16)
 573                     ; 247 {
 574                     	switch	.text
 575  0011               f_LCD_IRQHandler:
 579                     ; 251 }
 582  0011 80            	iret
 605                     ; 257 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 605                     ; 258 {
 606                     	switch	.text
 607  0012               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 611                     ; 262 }
 614  0012 80            	iret
 637                     ; 269 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 637                     ; 270 {
 638                     	switch	.text
 639  0013               f_ADC1_COMP_IRQHandler:
 643                     ; 274 }
 646  0013 80            	iret
 669                     ; 281 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 669                     ; 282 {
 670                     	switch	.text
 671  0014               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 675                     ; 286 }
 678  0014 80            	iret
 701                     ; 293 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 701                     ; 294 {
 702                     	switch	.text
 703  0015               f_TIM2_CAP_IRQHandler:
 707                     ; 298 }
 710  0015 80            	iret
 733                     ; 306 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 733                     ; 307 {
 734                     	switch	.text
 735  0016               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 739                     ; 311 }
 742  0016 80            	iret
 765                     ; 317 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 765                     ; 318 {
 766                     	switch	.text
 767  0017               f_TIM3_CAP_IRQHandler:
 771                     ; 322 }
 774  0017 80            	iret
 797                     ; 328 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 797                     ; 329 {
 798                     	switch	.text
 799  0018               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 803                     ; 333 }
 806  0018 80            	iret
 829                     ; 353 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 829                     ; 354 {
 830                     	switch	.text
 831  0019               f_TIM4_UPD_OVF_TRG_IRQHandler:
 835                     ; 358 }
 838  0019 80            	iret
 860                     ; 364 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 860                     ; 365 {
 861                     	switch	.text
 862  001a               f_SPI1_IRQHandler:
 866                     ; 369 }
 869  001a 80            	iret
 892                     ; 376 INTERRUPT_HANDLER(USART1_TX_IRQHandler, 27)
 892                     ; 377 {
 893                     	switch	.text
 894  001b               f_USART1_TX_IRQHandler:
 898                     ; 381 }
 901  001b 80            	iret
 924                     ; 388 INTERRUPT_HANDLER(USART1_RX_IRQHandler, 28)
 924                     ; 389 {
 925                     	switch	.text
 926  001c               f_USART1_RX_IRQHandler:
 930                     ; 393 }
 933  001c 80            	iret
 955                     ; 400 INTERRUPT_HANDLER(I2C1_IRQHandler, 29)
 955                     ; 401 {
 956                     	switch	.text
 957  001d               f_I2C1_IRQHandler:
 961                     ; 405 }
 964  001d 80            	iret
 976                     	xdef	f_I2C1_IRQHandler
 977                     	xdef	f_USART1_RX_IRQHandler
 978                     	xdef	f_USART1_TX_IRQHandler
 979                     	xdef	f_SPI1_IRQHandler
 980                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 981                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 982                     	xdef	f_TIM3_CAP_IRQHandler
 983                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 984                     	xdef	f_TIM2_CAP_IRQHandler
 985                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 986                     	xdef	f_ADC1_COMP_IRQHandler
 987                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
 988                     	xdef	f_LCD_IRQHandler
 989                     	xdef	f_EXTI7_IRQHandler
 990                     	xdef	f_EXTI6_IRQHandler
 991                     	xdef	f_EXTI5_IRQHandler
 992                     	xdef	f_EXTI4_IRQHandler
 993                     	xdef	f_EXTI3_IRQHandler
 994                     	xdef	f_EXTI2_IRQHandler
 995                     	xdef	f_EXTI1_IRQHandler
 996                     	xdef	f_EXTI0_IRQHandler
 997                     	xdef	f_EXTID_IRQHandler
 998                     	xdef	f_EXTIB_IRQHandler
 999                     	xdef	f_EXTIE_F_PVD_IRQHandler
1000                     	xdef	f_RTC_IRQHandler
1001                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1002                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1003                     	xdef	f_FLASH_IRQHandler
1004                     	xdef	f_TRAP_IRQHandler
1005                     	xdef	f_NonHandledInterrupt
1024                     	end
