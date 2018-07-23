   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  42                     ; 21 void togglePE1(void)
  42                     ; 22 {
  44                     	switch	.text
  45  0000               _togglePE1:
  49                     ; 25 	GPIOE -> ODR |=   0b00000010;
  51  0000 72125014      	bset	20500,#1
  52                     ; 26 	GPIOE -> ODR &= ~(0b00000010);
  54  0004 72135014      	bres	20500,#1
  55                     ; 27 }
  58  0008 81            	ret
  81                     ; 29 void togglePE2(void)
  81                     ; 30 {
  82                     	switch	.text
  83  0009               _togglePE2:
  87                     ; 33 	GPIOE -> ODR |=   0b00000100;
  89  0009 72145014      	bset	20500,#2
  90                     ; 34 	GPIOE -> ODR &= ~(0b00000100);
  92  000d 72155014      	bres	20500,#2
  93                     ; 35 }
  96  0011 81            	ret
 119                     ; 37 void togglePE3(void)
 119                     ; 38 {
 120                     	switch	.text
 121  0012               _togglePE3:
 125                     ; 41 	GPIOE -> ODR |=   0b00001000;
 127  0012 72165014      	bset	20500,#3
 128                     ; 42 	GPIOE -> ODR &= ~(0b00001000);
 130  0016 72175014      	bres	20500,#3
 131                     ; 43 }
 134  001a 81            	ret
 157                     ; 45 void togglePE4(void)
 157                     ; 46 {
 158                     	switch	.text
 159  001b               _togglePE4:
 163                     ; 49 	GPIOE -> ODR |=   0b00010000;
 165  001b 72185014      	bset	20500,#4
 166                     ; 50 	GPIOE -> ODR &= ~(0b00010000);
 168  001f 72195014      	bres	20500,#4
 169                     ; 51 }
 172  0023 81            	ret
 195                     ; 53 void togglePE5(void)
 195                     ; 54 {
 196                     	switch	.text
 197  0024               _togglePE5:
 201                     ; 57 	GPIOE -> ODR |=   0b00100000;
 203  0024 721a5014      	bset	20500,#5
 204                     ; 58 	GPIOE -> ODR &= ~(0b00100000);
 206  0028 721b5014      	bres	20500,#5
 207                     ; 59 }
 210  002c 81            	ret
 233                     ; 61 void togglePE6(void)
 233                     ; 62 {
 234                     	switch	.text
 235  002d               _togglePE6:
 239                     ; 65 	GPIOE -> ODR |=   0b0100000;
 241  002d 721a5014      	bset	20500,#5
 242                     ; 66 	GPIOE -> ODR &= ~(0b0100000);
 244  0031 721b5014      	bres	20500,#5
 245                     ; 67 }
 248  0035 81            	ret
 271                     ; 69 void togglePE7(void)
 271                     ; 70 {
 272                     	switch	.text
 273  0036               _togglePE7:
 277                     ; 73 	GPIOE -> ODR |=   0b1000000;
 279  0036 721c5014      	bset	20500,#6
 280                     ; 74 	GPIOE -> ODR &= ~(0b1000000);
 282  003a 721d5014      	bres	20500,#6
 283                     ; 75 }
 286  003e 81            	ret
 362                     ; 77 void main(void)
 362                     ; 78 {
 363                     	switch	.text
 364  003f               _main:
 366  003f 5207          	subw	sp,#7
 367       00000007      OFST:	set	7
 370                     ; 79 	int status = STATUS_IDLE;
 372  0041 5f            	clrw	x
 373  0042 1f01          	ldw	(OFST-6,sp),x
 375                     ; 80 	uint8_t requested_register = 0;
 377                     ; 82 	int send_value = VALUE_NULL;
 379  0044 5f            	clrw	x
 380  0045 1f06          	ldw	(OFST-1,sp),x
 382                     ; 90 	CLK -> ICKCR |= CLK_ICKCR_HSION;
 384  0047 721050c2      	bset	20674,#0
 385                     ; 108 	CLK -> PCKENR1 |= CLK_PCKENR1_TIM2;
 387  004b 721050c3      	bset	20675,#0
 388                     ; 111 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 390  004f 721650c3      	bset	20675,#3
 391                     ; 118 	GPIOB -> DDR = 0b00000001;
 393  0053 35015007      	mov	20487,#1
 394                     ; 119 	GPIOB -> CR1 = 0b00000001;
 396  0057 35015008      	mov	20488,#1
 397                     ; 120 	GPIOB -> CR2 = 0b00000000;
 399  005b 725f5009      	clr	20489
 400                     ; 123 	GPIOE -> DDR = 0b11111111;
 402  005f 35ff5016      	mov	20502,#255
 403                     ; 124 	GPIOE -> CR1 = 0b11111111;
 405  0063 35ff5017      	mov	20503,#255
 406                     ; 125 	GPIOE -> CR2 = 0b00000000;
 408  0067 725f5018      	clr	20504
 409                     ; 131 	TIM2 -> CCR1H = 0xFF;
 411  006b 35ff5261      	mov	21089,#255
 412                     ; 132 	TIM2 -> CCR1L = 0xFF;
 414  006f 35ff5262      	mov	21090,#255
 415                     ; 135 	TIM2 -> ARRH = 0xFF;
 417  0073 35ff525f      	mov	21087,#255
 418                     ; 136 	TIM2 -> ARRL = 0xFF;
 420  0077 35ff5260      	mov	21088,#255
 421                     ; 139 	TIM2 -> IER |= TIM_IER_CC1IE;
 423  007b 72125255      	bset	21077,#1
 424                     ; 153 	TIM2 -> CCMR1 = ((uint8_t)0b00110000);
 426  007f 35305259      	mov	21081,#48
 427                     ; 156 	TIM2 -> CCER1 |= TIM_CCER1_CC1P;
 429  0083 7212525b      	bset	21083,#1
 430                     ; 159 	TIM2 -> CCER1 |= TIM_CCER1_CC1E;
 432  0087 7210525b      	bset	21083,#0
 433                     ; 162 	TIM2 -> BKR |= TIM1_BKR_MOE;
 435  008b 721e5265      	bset	21093,#7
 436                     ; 165 	TIM2 -> SR1 = 0;
 438  008f 725f5256      	clr	21078
 439                     ; 166 	TIM2 -> CR1 |= TIM_CR1_CEN;
 441  0093 72105250      	bset	21072,#0
 442                     ; 173 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 444  0097 72115210      	bres	21008,#0
 445                     ; 176 	I2C1 -> FREQR |= ((uint8_t)0b010000);
 447  009b 72185212      	bset	21010,#4
 448                     ; 179 	I2C1 -> OARL = ((uint8_t)0x02);
 450  009f 35025213      	mov	21011,#2
 451                     ; 183 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 453  00a3 721c5214      	bset	21012,#6
 454                     ; 186 	I2C1 -> CR1 |= I2C_CR1_PE;
 456  00a7 72105210      	bset	21008,#0
 457                     ; 189 	I2C1 -> CR2 |= I2C_CR2_ACK;
 459  00ab 72145211      	bset	21009,#2
 460                     ; 196 	enableInterrupts();
 463  00af 9a            rim
 465  00b0               L371:
 466                     ; 203 		switch(status)
 468  00b0 1e01          	ldw	x,(OFST-6,sp)
 470                     ; 319 				break;
 471  00b2 5d            	tnzw	x
 472  00b3 270d          	jreq	L101
 473  00b5 5a            	decw	x
 474  00b6 2761          	jreq	L301
 475  00b8 5a            	decw	x
 476  00b9 2603cc0140    	jreq	L311
 477  00be acc501c5      	jpf	L102
 478  00c2               L101:
 479                     ; 205 			case(STATUS_IDLE):
 479                     ; 206 			sr1_value = I2C1 -> SR1 ;
 481  00c2 c65217        	ld	a,21015
 482  00c5 6b03          	ld	(OFST-4,sp),a
 484                     ; 208 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 486  00c7 7b03          	ld	a,(OFST-4,sp)
 487  00c9 a540          	bcp	a,#64
 488  00cb 2707          	jreq	L302
 489                     ; 210 					status = STATUS_RX;
 491  00cd ae0001        	ldw	x,#1
 492  00d0 1f01          	ldw	(OFST-6,sp),x
 495  00d2 200e          	jra	L502
 496  00d4               L302:
 497                     ; 213 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 499  00d4 7b03          	ld	a,(OFST-4,sp)
 500  00d6 a580          	bcp	a,#128
 501  00d8 2708          	jreq	L502
 502                     ; 215 					status = STATUS_TX;
 504  00da ae0002        	ldw	x,#2
 505  00dd 1f01          	ldw	(OFST-6,sp),x
 507                     ; 216 					togglePE2();
 509  00df cd0009        	call	_togglePE2
 511  00e2               L502:
 512                     ; 219 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 514  00e2 7b03          	ld	a,(OFST-4,sp)
 515  00e4 a502          	bcp	a,#2
 516  00e6 270d          	jreq	L112
 517                     ; 221 					togglePE1();
 519  00e8 cd0000        	call	_togglePE1
 521                     ; 223 					tmp = I2C1 -> SR1;
 523  00eb c65217        	ld	a,21015
 524  00ee 5f            	clrw	x
 525  00ef 97            	ld	xl,a
 526                     ; 224 					tmp = I2C1 -> SR3;
 528  00f0 c65219        	ld	a,21017
 529  00f3 5f            	clrw	x
 530  00f4 97            	ld	xl,a
 531  00f5               L112:
 532                     ; 227 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 534  00f5 7b03          	ld	a,(OFST-4,sp)
 535  00f7 a510          	bcp	a,#16
 536  00f9 270c          	jreq	L312
 537                     ; 229 					togglePE3();
 539  00fb cd0012        	call	_togglePE3
 541                     ; 231 					tmp = I2C1 -> SR1;
 543  00fe c65217        	ld	a,21015
 544  0101 5f            	clrw	x
 545  0102 97            	ld	xl,a
 546                     ; 232 					I2C1 -> CR2 |= I2C_CR2_ACK;
 548  0103 72145211      	bset	21009,#2
 549  0107               L312:
 550                     ; 235 				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
 552  0107 c65218        	ld	a,21016
 553  010a a504          	bcp	a,#4
 554  010c 2603          	jrne	L42
 555  010e cc01c5        	jp	L102
 556  0111               L42:
 557                     ; 238 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 559  0111 72155218      	bres	21016,#2
 560  0115 acc501c5      	jpf	L102
 561  0119               L301:
 562                     ; 243 			case(STATUS_RX):
 562                     ; 244 				requested_register = I2C1 -> DR;
 564  0119 c65216        	ld	a,21014
 565  011c 6b03          	ld	(OFST-4,sp),a
 567                     ; 246 				switch(requested_register)
 569  011e 7b03          	ld	a,(OFST-4,sp)
 571                     ; 258 						break;
 572  0120 4a            	dec	a
 573  0121 270a          	jreq	L501
 574  0123 4a            	dec	a
 575  0124 270e          	jreq	L701
 576  0126               L111:
 577                     ; 256 					default:
 577                     ; 257 						send_value = VALUE_NOREGISTER;
 579  0126 ae0006        	ldw	x,#6
 580  0129 1f06          	ldw	(OFST-1,sp),x
 582                     ; 258 						break;
 584  012b 200c          	jra	L122
 585  012d               L501:
 586                     ; 248 					case(ADD_DATA0):
 586                     ; 249 						send_value = VALUE_DATA0_BYTE0;
 588  012d ae0001        	ldw	x,#1
 589  0130 1f06          	ldw	(OFST-1,sp),x
 591                     ; 250 						break;
 593  0132 2005          	jra	L122
 594  0134               L701:
 595                     ; 252 					case(ADD_TEST1):
 595                     ; 253 						send_value = VALUE_TEST1;
 597  0134 ae0005        	ldw	x,#5
 598  0137 1f06          	ldw	(OFST-1,sp),x
 600                     ; 254 						break;
 602  0139               L122:
 603                     ; 261 				status = STATUS_IDLE;
 605  0139 5f            	clrw	x
 606  013a 1f01          	ldw	(OFST-6,sp),x
 608                     ; 262 				break;
 610  013c acc501c5      	jpf	L102
 611  0140               L311:
 612                     ; 264 			case(STATUS_TX):
 612                     ; 265 				switch(send_value)
 614  0140 1e06          	ldw	x,(OFST-1,sp)
 616                     ; 314 						break;
 617  0142 5d            	tnzw	x
 618  0143 2720          	jreq	L511
 619  0145 5a            	decw	x
 620  0146 2722          	jreq	L711
 621  0148 5a            	decw	x
 622  0149 272f          	jreq	L121
 623  014b 5a            	decw	x
 624  014c 273c          	jreq	L321
 625  014e 5a            	decw	x
 626  014f 2749          	jreq	L521
 627  0151 5a            	decw	x
 628  0152 2754          	jreq	L721
 629  0154 5a            	decw	x
 630  0155 275f          	jreq	L131
 631  0157               L331:
 632                     ; 309 					default:
 632                     ; 310 						//ERROR!
 632                     ; 311 						tmp = I2C1 -> SR1;
 634  0157 c65217        	ld	a,21015
 635  015a 5f            	clrw	x
 636  015b 97            	ld	xl,a
 637                     ; 312 						I2C1 -> DR = ((uint8_t)0x00);
 639  015c 725f5216      	clr	21014
 640                     ; 313 						send_value = VALUE_NULL;
 642  0160 5f            	clrw	x
 643  0161 1f06          	ldw	(OFST-1,sp),x
 645                     ; 314 						break;
 647  0163 205d          	jra	L522
 648  0165               L511:
 649                     ; 267 					case(VALUE_NULL):
 649                     ; 268 						//ERROR!
 649                     ; 269 						togglePE4();
 651  0165 cd001b        	call	_togglePE4
 653                     ; 270 						break;
 655  0168 2058          	jra	L522
 656  016a               L711:
 657                     ; 272 					case(VALUE_DATA0_BYTE0):
 657                     ; 273 						tmp = I2C1 -> SR1;
 659  016a c65217        	ld	a,21015
 660  016d 5f            	clrw	x
 661  016e 97            	ld	xl,a
 662                     ; 274 						I2C1 -> DR = ((uint8_t)0x50);
 664  016f 35505216      	mov	21014,#80
 665                     ; 275 						send_value = VALUE_DATA0_BYTE1;
 667  0173 ae0002        	ldw	x,#2
 668  0176 1f06          	ldw	(OFST-1,sp),x
 670                     ; 276 						break;
 672  0178 2048          	jra	L522
 673  017a               L121:
 674                     ; 278 					case(VALUE_DATA0_BYTE1):
 674                     ; 279 						tmp = I2C1 -> SR1;
 676  017a c65217        	ld	a,21015
 677  017d 5f            	clrw	x
 678  017e 97            	ld	xl,a
 679                     ; 280 						I2C1 -> DR = ((uint8_t)0x51);
 681  017f 35515216      	mov	21014,#81
 682                     ; 281 						send_value = VALUE_DATA0_BYTE2;
 684  0183 ae0003        	ldw	x,#3
 685  0186 1f06          	ldw	(OFST-1,sp),x
 687                     ; 282 						break;
 689  0188 2038          	jra	L522
 690  018a               L321:
 691                     ; 284 					case(VALUE_DATA0_BYTE2):
 691                     ; 285 						tmp = I2C1 -> SR1;
 693  018a c65217        	ld	a,21015
 694  018d 5f            	clrw	x
 695  018e 97            	ld	xl,a
 696                     ; 286 						I2C1 -> DR = ((uint8_t)0x52);
 698  018f 35525216      	mov	21014,#82
 699                     ; 287 						send_value = VALUE_DATA0_BYTE3;
 701  0193 ae0004        	ldw	x,#4
 702  0196 1f06          	ldw	(OFST-1,sp),x
 704                     ; 288 						break;
 706  0198 2028          	jra	L522
 707  019a               L521:
 708                     ; 290 					case(VALUE_DATA0_BYTE3):
 708                     ; 291 						tmp = I2C1 -> SR1;
 710  019a c65217        	ld	a,21015
 711  019d 5f            	clrw	x
 712  019e 97            	ld	xl,a
 713                     ; 292 						I2C1 -> DR = ((uint8_t)0x53);
 715  019f 35535216      	mov	21014,#83
 716                     ; 293 						send_value = VALUE_NULL;
 718  01a3 5f            	clrw	x
 719  01a4 1f06          	ldw	(OFST-1,sp),x
 721                     ; 295 						break;
 723  01a6 201a          	jra	L522
 724  01a8               L721:
 725                     ; 297 					case(VALUE_TEST1):
 725                     ; 298 						tmp = I2C1 -> SR1;
 727  01a8 c65217        	ld	a,21015
 728  01ab 5f            	clrw	x
 729  01ac 97            	ld	xl,a
 730                     ; 299 						I2C1 -> DR = ((uint8_t)0x54);
 732  01ad 35545216      	mov	21014,#84
 733                     ; 300 						send_value = VALUE_NULL;
 735  01b1 5f            	clrw	x
 736  01b2 1f06          	ldw	(OFST-1,sp),x
 738                     ; 301 						break;
 740  01b4 200c          	jra	L522
 741  01b6               L131:
 742                     ; 303 					case(VALUE_NOREGISTER):
 742                     ; 304 						tmp = I2C1 -> SR1;
 744  01b6 c65217        	ld	a,21015
 745  01b9 5f            	clrw	x
 746  01ba 97            	ld	xl,a
 747                     ; 305 						I2C1 -> DR = ((uint8_t)0x00);
 749  01bb 725f5216      	clr	21014
 750                     ; 306 						send_value = VALUE_NULL;
 752  01bf 5f            	clrw	x
 753  01c0 1f06          	ldw	(OFST-1,sp),x
 755                     ; 307 						break;
 757  01c2               L522:
 758                     ; 318 				status = STATUS_IDLE;
 760  01c2 5f            	clrw	x
 761  01c3 1f01          	ldw	(OFST-6,sp),x
 763                     ; 319 				break;
 765  01c5               L102:
 766                     ; 323 		togglePE6();
 768  01c5 cd002d        	call	_togglePE6
 771  01c8 acb000b0      	jpf	L371
 795                     ; 334 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 795                     ; 335 {
 797                     	switch	.text
 798  01cc               f_TIM2_CAP_IRQHandler:
 802                     ; 337 	TIM2 -> SR1 = 0;
 804  01cc 725f5256      	clr	21078
 805                     ; 342 	GPIOE -> ODR |=   0b00000001;
 807  01d0 72105014      	bset	20500,#0
 808                     ; 343 	GPIOE -> ODR &= ~(0b00000001);
 810  01d4 72115014      	bres	20500,#0
 811                     ; 345 }
 814  01d8 80            	iret
 837                     ; 348 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 837                     ; 349 {
 838                     	switch	.text
 839  01d9               f_TIM1_CAP_IRQHandler:
 843                     ; 351 	TIM2 -> SR1 = 0;
 845  01d9 725f5256      	clr	21078
 846                     ; 356 	GPIOE -> ODR |=   0b00000001;
 848  01dd 72105014      	bset	20500,#0
 849                     ; 357 	GPIOE -> ODR &= ~(0b00000001);
 851  01e1 72115014      	bres	20500,#0
 852                     ; 359 }
 855  01e5 80            	iret
 867                     	xdef	f_TIM1_CAP_IRQHandler
 868                     	xdef	f_TIM2_CAP_IRQHandler
 869                     	xdef	_main
 870                     	xdef	_togglePE7
 871                     	xdef	_togglePE6
 872                     	xdef	_togglePE5
 873                     	xdef	_togglePE4
 874                     	xdef	_togglePE3
 875                     	xdef	_togglePE2
 876                     	xdef	_togglePE1
 895                     	end
