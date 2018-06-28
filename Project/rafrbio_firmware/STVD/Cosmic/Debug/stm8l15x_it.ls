   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  46                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
  46                     ; 48 {
  47                     	switch	.text
  48  0000               f_NonHandledInterrupt:
  52                     ; 52 }
  55  0000 80            	iret	
  77                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 61 {
  78                     	switch	.text
  79  0001               f_TRAP_IRQHandler:
  83                     ; 65 }
  86  0001 80            	iret	
 108                     ; 71 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
 108                     ; 72 {
 109                     	switch	.text
 110  0002               f_FLASH_IRQHandler:
 114                     ; 76 }
 117  0002 80            	iret	
 140                     ; 82 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 140                     ; 83 {
 141                     	switch	.text
 142  0003               f_DMA1_CHANNEL0_1_IRQHandler:
 146                     ; 87 }
 149  0003 80            	iret	
 172                     ; 93 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 172                     ; 94 {
 173                     	switch	.text
 174  0004               f_DMA1_CHANNEL2_3_IRQHandler:
 178                     ; 98 }
 181  0004 80            	iret	
 203                     ; 104 INTERRUPT_HANDLER(RTC_IRQHandler, 4)
 203                     ; 105 {
 204                     	switch	.text
 205  0005               f_RTC_IRQHandler:
 209                     ; 109 }
 212  0005 80            	iret	
 235                     ; 115 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 235                     ; 116 {
 236                     	switch	.text
 237  0006               f_EXTIE_F_PVD_IRQHandler:
 241                     ; 120 }
 244  0006 80            	iret	
 266                     ; 127 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 266                     ; 128 {
 267                     	switch	.text
 268  0007               f_EXTIB_IRQHandler:
 272                     ; 132 }
 275  0007 80            	iret	
 297                     ; 139 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 297                     ; 140 {
 298                     	switch	.text
 299  0008               f_EXTID_IRQHandler:
 303                     ; 144 }
 306  0008 80            	iret	
 328                     ; 151 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 328                     ; 152 {
 329                     	switch	.text
 330  0009               f_EXTI0_IRQHandler:
 334                     ; 156 }
 337  0009 80            	iret	
 359                     ; 163 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 359                     ; 164 {
 360                     	switch	.text
 361  000a               f_EXTI1_IRQHandler:
 365                     ; 168 }
 368  000a 80            	iret	
 390                     ; 175 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 390                     ; 176 {
 391                     	switch	.text
 392  000b               f_EXTI2_IRQHandler:
 396                     ; 180 }
 399  000b 80            	iret	
 421                     ; 187 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 421                     ; 188 {
 422                     	switch	.text
 423  000c               f_EXTI3_IRQHandler:
 427                     ; 192 }
 430  000c 80            	iret	
 452                     ; 199 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 452                     ; 200 {
 453                     	switch	.text
 454  000d               f_EXTI4_IRQHandler:
 458                     ; 204 }
 461  000d 80            	iret	
 483                     ; 211 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 483                     ; 212 {
 484                     	switch	.text
 485  000e               f_EXTI5_IRQHandler:
 489                     ; 216 }
 492  000e 80            	iret	
 514                     ; 223 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 514                     ; 224 {
 515                     	switch	.text
 516  000f               f_EXTI6_IRQHandler:
 520                     ; 228 }
 523  000f 80            	iret	
 545                     ; 235 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 545                     ; 236 {
 546                     	switch	.text
 547  0010               f_EXTI7_IRQHandler:
 551                     ; 240 }
 554  0010 80            	iret	
 576                     ; 246 INTERRUPT_HANDLER(LCD_IRQHandler, 16)
 576                     ; 247 {
 577                     	switch	.text
 578  0011               f_LCD_IRQHandler:
 582                     ; 251 }
 585  0011 80            	iret	
 608                     ; 257 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 608                     ; 258 {
 609                     	switch	.text
 610  0012               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 614                     ; 262 }
 617  0012 80            	iret	
 640                     ; 269 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 640                     ; 270 {
 641                     	switch	.text
 642  0013               f_ADC1_COMP_IRQHandler:
 646                     ; 274 }
 649  0013 80            	iret	
 672                     ; 281 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 672                     ; 282 {
 673                     	switch	.text
 674  0014               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 678                     ; 286 }
 681  0014 80            	iret	
 704                     ; 293 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 704                     ; 294 {
 705                     	switch	.text
 706  0015               f_TIM2_CAP_IRQHandler:
 710                     ; 298 }
 713  0015 80            	iret	
 736                     ; 306 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 736                     ; 307 {
 737                     	switch	.text
 738  0016               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 742                     ; 311 }
 745  0016 80            	iret	
 768                     ; 317 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 768                     ; 318 {
 769                     	switch	.text
 770  0017               f_TIM3_CAP_IRQHandler:
 774                     ; 322 }
 777  0017 80            	iret	
 800                     ; 328 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 800                     ; 329 {
 801                     	switch	.text
 802  0018               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 806                     ; 333 }
 809  0018 80            	iret	
 832                     ; 339 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 832                     ; 340 {
 833                     	switch	.text
 834  0019               f_TIM1_CAP_IRQHandler:
 838                     ; 344 }
 841  0019 80            	iret	
 864                     ; 351 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 864                     ; 352 {
 865                     	switch	.text
 866  001a               f_TIM4_UPD_OVF_TRG_IRQHandler:
 870                     ; 356 }
 873  001a 80            	iret	
 895                     ; 362 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 895                     ; 363 {
 896                     	switch	.text
 897  001b               f_SPI1_IRQHandler:
 901                     ; 367 }
 904  001b 80            	iret	
 927                     ; 374 INTERRUPT_HANDLER(USART1_TX_IRQHandler, 27)
 927                     ; 375 {
 928                     	switch	.text
 929  001c               f_USART1_TX_IRQHandler:
 933                     ; 379 }
 936  001c 80            	iret	
 959                     ; 386 INTERRUPT_HANDLER(USART1_RX_IRQHandler, 28)
 959                     ; 387 {
 960                     	switch	.text
 961  001d               f_USART1_RX_IRQHandler:
 965                     ; 391 }
 968  001d 80            	iret	
 990                     ; 398 INTERRUPT_HANDLER(I2C1_IRQHandler, 29)
 990                     ; 399 {
 991                     	switch	.text
 992  001e               f_I2C1_IRQHandler:
 996                     ; 403 }
 999  001e 80            	iret	
1011                     	xdef	f_I2C1_IRQHandler
1012                     	xdef	f_USART1_RX_IRQHandler
1013                     	xdef	f_USART1_TX_IRQHandler
1014                     	xdef	f_SPI1_IRQHandler
1015                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1016                     	xdef	f_TIM1_CAP_IRQHandler
1017                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1018                     	xdef	f_TIM3_CAP_IRQHandler
1019                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1020                     	xdef	f_TIM2_CAP_IRQHandler
1021                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1022                     	xdef	f_ADC1_COMP_IRQHandler
1023                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1024                     	xdef	f_LCD_IRQHandler
1025                     	xdef	f_EXTI7_IRQHandler
1026                     	xdef	f_EXTI6_IRQHandler
1027                     	xdef	f_EXTI5_IRQHandler
1028                     	xdef	f_EXTI4_IRQHandler
1029                     	xdef	f_EXTI3_IRQHandler
1030                     	xdef	f_EXTI2_IRQHandler
1031                     	xdef	f_EXTI1_IRQHandler
1032                     	xdef	f_EXTI0_IRQHandler
1033                     	xdef	f_EXTID_IRQHandler
1034                     	xdef	f_EXTIB_IRQHandler
1035                     	xdef	f_EXTIE_F_PVD_IRQHandler
1036                     	xdef	f_RTC_IRQHandler
1037                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1038                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1039                     	xdef	f_FLASH_IRQHandler
1040                     	xdef	f_TRAP_IRQHandler
1041                     	xdef	f_NonHandledInterrupt
1060                     	end
