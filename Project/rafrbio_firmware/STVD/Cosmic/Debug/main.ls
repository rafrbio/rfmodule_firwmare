   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _dataAvailable:
  16  0000 0000          	dc.w	0
  17  0002               _byteData:
  18  0002 00            	dc.b	0
  19  0003 00            	dc.b	0
  20  0004 00            	dc.b	0
  21                     .const:	section	.text
  22  0000               L3_dataToSend:
  23  0000 00            	dc.b	0
  24  0001 00            	dc.b	0
  25  0002 00            	dc.b	0
 120                     ; 38 void main(void)
 120                     ; 39 {
 122                     	switch	.text
 123  0000               _main:
 125  0000 520a          	subw	sp,#10
 126       0000000a      OFST:	set	10
 129                     ; 40 	int status = STATUS_IDLE;
 131  0002 5f            	clrw	x
 132  0003 1f01          	ldw	(OFST-9,sp),x
 134                     ; 41 	uint8_t requested_register = 0;
 136                     ; 43 	int send_value = VALUE_NULL;
 138  0005 5f            	clrw	x
 139  0006 1f09          	ldw	(OFST-1,sp),x
 141                     ; 46 	uint8_t dataToSend[3] = {0, 0, 0};
 143  0008 96            	ldw	x,sp
 144  0009 1c0003        	addw	x,#OFST-7
 145  000c 90ae0000      	ldw	y,#L3_dataToSend
 146  0010 a603          	ld	a,#3
 147  0012 cd0000        	call	c_xymvx
 149                     ; 56 	CLK -> ICKCR != CLK_ICKCR_HSION;
 151  0015 c650c2        	ld	a,20674
 152  0018 a101          	cp	a,#1
 153  001a 2705          	jreq	L6
 154  001c ae0001        	ldw	x,#1
 155  001f 2001          	jra	L01
 156  0021               L6:
 157  0021 5f            	clrw	x
 158  0022               L01:
 159                     ; 67 	CLK -> CKDIVR &= 0b000;
 161  0022 725f50c0      	clr	20672
 162                     ; 74 	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
 164  0026 721250c4      	bset	20676,#1
 165                     ; 77 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 167  002a 721650c3      	bset	20675,#3
 168                     ; 80 	CLK -> PCKENR1 |= CLK_PCKENR1_DAC;
 170  002e 721e50c3      	bset	20675,#7
 171                     ; 96 	GPIOA -> DDR = 0b01110000;
 173  0032 35705002      	mov	20482,#112
 174                     ; 97 	GPIOA -> CR1 = 0b01110000;
 176  0036 35705003      	mov	20483,#112
 177                     ; 98 	GPIOA -> CR2 = 0b01110000;	
 179  003a 35705004      	mov	20484,#112
 180                     ; 107 	GPIOB -> DDR = 0b00001111;
 182  003e 350f5007      	mov	20487,#15
 183                     ; 108 	GPIOB -> CR1 = 0b00001111;
 185  0042 350f5008      	mov	20488,#15
 186                     ; 109 	GPIOB -> CR2 = 0b00001111;	
 188  0046 350f5009      	mov	20489,#15
 189                     ; 117 	GPIOC -> DDR = 0b01101000;
 191  004a 3568500c      	mov	20492,#104
 192                     ; 118 	GPIOC -> CR1 = 0b01101000;
 194  004e 3568500d      	mov	20493,#104
 195                     ; 119 	GPIOC -> CR2 = 0b00001000;
 197  0052 3508500e      	mov	20494,#8
 198                     ; 130 	GPIOD -> DDR = 0b10010000;
 200  0056 35905011      	mov	20497,#144
 201                     ; 131 	GPIOD -> CR1 = 0b10010000;
 203  005a 35905012      	mov	20498,#144
 204                     ; 132 	GPIOD -> CR2 = 0b00000000;	
 206  005e 725f5013      	clr	20499
 207                     ; 144 	GPIOE -> DDR = 0b11000000;
 209  0062 35c05016      	mov	20502,#192
 210                     ; 145 	GPIOE -> CR1 = 0b11000000;
 212  0066 35c05017      	mov	20503,#192
 213                     ; 146 	GPIOE -> CR2 = 0b00000000;	
 215  006a 725f5018      	clr	20504
 216                     ; 152 	GPIOF -> DDR = 0b00000001;
 218  006e 3501501b      	mov	20507,#1
 219                     ; 153 	GPIOF -> CR1 = 0b00000001;
 221  0072 3501501c      	mov	20508,#1
 222                     ; 154 	GPIOF -> CR2 = 0b00000000;	
 224  0076 725f501d      	clr	20509
 225                     ; 167 	setTH(LOW);
 227  007a 5f            	clrw	x
 228  007b cd0000        	call	_setTH
 230                     ; 173 	TIM1 -> CCR1H = 0xFF;
 232  007e 35ff52c6      	mov	21190,#255
 233                     ; 174 	TIM1 -> CCR1L = 0xFF;
 235  0082 35ff52c7      	mov	21191,#255
 236                     ; 177 	TIM1 -> ARRH = 0xFF;
 238  0086 35ff52c3      	mov	21187,#255
 239                     ; 178 	TIM1 -> ARRL = 0xFF;
 241  008a 35ff52c4      	mov	21188,#255
 242                     ; 181 	TIM1 -> IER |= TIM_IER_CC2IE;
 244  008e 721452b5      	bset	21173,#2
 245                     ; 195 	TIM1 -> CCMR2 = ((uint8_t)0b00110000);
 247  0092 353052ba      	mov	21178,#48
 248                     ; 198 	TIM1 -> CCER1 |= TIM_CCER1_CC2P;
 250  0096 721a52bd      	bset	21181,#5
 251                     ; 201 	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
 253  009a 721852bd      	bset	21181,#4
 254                     ; 204 	TIM1-> BKR |= TIM1_BKR_MOE;
 256  009e 721e52ce      	bset	21198,#7
 257                     ; 207 	TIM1 -> SR1 = 0;
 259  00a2 725f52b6      	clr	21174
 260                     ; 208 	TIM1 -> CR1 |= TIM_CR1_CEN;
 262  00a6 721052b0      	bset	21168,#0
 263                     ; 215 	I2C1->CR1 = I2C_CR1_RESET_VALUE;
 265  00aa 725f5210      	clr	21008
 266                     ; 216 	I2C1->CR2 = I2C_CR2_RESET_VALUE;
 268  00ae 725f5211      	clr	21009
 269                     ; 217 	I2C1->FREQR = I2C_FREQR_RESET_VALUE;
 271  00b2 725f5212      	clr	21010
 272                     ; 218 	I2C1->OARL = I2C_OARL_RESET_VALUE;
 274  00b6 725f5213      	clr	21011
 275                     ; 219 	I2C1->OARH = I2C_OARH_RESET_VALUE;
 277  00ba 725f5214      	clr	21012
 278                     ; 220 	I2C1->OAR2 = I2C_OAR2_RESET_VALUE;
 280  00be 725f5215      	clr	21013
 281                     ; 221 	I2C1->ITR = I2C_ITR_RESET_VALUE;
 283  00c2 725f521a      	clr	21018
 284                     ; 222 	I2C1->CCRL = I2C_CCRL_RESET_VALUE;
 286  00c6 725f521b      	clr	21019
 287                     ; 223 	I2C1->CCRH = I2C_CCRH_RESET_VALUE;
 289  00ca 725f521c      	clr	21020
 290                     ; 224 	I2C1->TRISER = I2C_TRISER_RESET_VALUE;
 292  00ce 3502521d      	mov	21021,#2
 293                     ; 228 	I2C1 -> FREQR |= ((uint8_t)0b00010000);
 295  00d2 72185212      	bset	21010,#4
 296                     ; 231 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 298  00d6 72115210      	bres	21008,#0
 299                     ; 234 	I2C1 -> CR2 |= I2C_CR2_ACK;
 301  00da 72145211      	bset	21009,#2
 302                     ; 238 	I2C1 -> OARL = ((uint8_t)0b00000010);
 304  00de 35025213      	mov	21011,#2
 305                     ; 241 	I2C1 -> OARH &= ~I2C_OARH_ADDMODE;
 307  00e2 721f5214      	bres	21012,#7
 308                     ; 243 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 310  00e6 721c5214      	bset	21012,#6
 311                     ; 246 	I2C1 -> CR1 |= I2C_CR1_PE;
 313  00ea 72105210      	bset	21008,#0
 314                     ; 255 	enableInterrupts();
 317  00ee 9a            rim
 319                     ; 259 	setLEA(HIGH);
 322  00ef ae0001        	ldw	x,#1
 323  00f2 cd0000        	call	_setLEA
 325  00f5               L701:
 326                     ; 265 		switch(status)
 328  00f5 1e01          	ldw	x,(OFST-9,sp)
 330                     ; 406 				break;
 331  00f7 5d            	tnzw	x
 332  00f8 270d          	jreq	L5
 333  00fa 5a            	decw	x
 334  00fb 276a          	jreq	L7
 335  00fd 5a            	decw	x
 336  00fe 2603          	jrne	L21
 337  0100 cc018e        	jp	L71
 338  0103               L21:
 339  0103 ac110211      	jpf	L511
 340  0107               L5:
 341                     ; 267 			case(STATUS_IDLE):
 341                     ; 268 			sr1_value = I2C1 -> SR1;
 343  0107 c65217        	ld	a,21015
 344  010a 6b06          	ld	(OFST-4,sp),a
 346                     ; 270 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 348  010c 7b06          	ld	a,(OFST-4,sp)
 349  010e a540          	bcp	a,#64
 350  0110 2707          	jreq	L711
 351                     ; 274 					status = STATUS_RX;
 353  0112 ae0001        	ldw	x,#1
 354  0115 1f01          	ldw	(OFST-9,sp),x
 357  0117 200b          	jra	L121
 358  0119               L711:
 359                     ; 276 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 361  0119 7b06          	ld	a,(OFST-4,sp)
 362  011b a580          	bcp	a,#128
 363  011d 2705          	jreq	L121
 364                     ; 278 					status = STATUS_TX;
 366  011f ae0002        	ldw	x,#2
 367  0122 1f01          	ldw	(OFST-9,sp),x
 369  0124               L121:
 370                     ; 281 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 372  0124 7b06          	ld	a,(OFST-4,sp)
 373  0126 a502          	bcp	a,#2
 374  0128 270a          	jreq	L521
 375                     ; 284 					tmp = I2C1 -> SR1;
 377  012a c65217        	ld	a,21015
 378  012d 5f            	clrw	x
 379  012e 97            	ld	xl,a
 380                     ; 285 					tmp = I2C1 -> SR3;
 382  012f c65219        	ld	a,21017
 383  0132 5f            	clrw	x
 384  0133 97            	ld	xl,a
 385  0134               L521:
 386                     ; 288 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 388  0134 7b06          	ld	a,(OFST-4,sp)
 389  0136 a510          	bcp	a,#16
 390  0138 2709          	jreq	L721
 391                     ; 291 					tmp = I2C1 -> SR1;
 393  013a c65217        	ld	a,21015
 394  013d 5f            	clrw	x
 395  013e 97            	ld	xl,a
 396                     ; 292 					I2C1 -> CR2 |= I2C_CR2_ACK;
 398  013f 72145211      	bset	21009,#2
 399  0143               L721:
 400                     ; 295 				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
 402  0143 c65218        	ld	a,21016
 403  0146 a504          	bcp	a,#4
 404  0148 2704          	jreq	L131
 405                     ; 298 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 407  014a 72155218      	bres	21016,#2
 408  014e               L131:
 409                     ; 301 				if( dataAvailable == 1)
 411  014e be00          	ldw	x,_dataAvailable
 412  0150 a30001        	cpw	x,#1
 413  0153 260a          	jrne	L331
 414                     ; 304 					setDE(HIGH);
 416  0155 ae0001        	ldw	x,#1
 417  0158 cd0000        	call	_setDE
 420  015b ac110211      	jpf	L511
 421  015f               L331:
 422                     ; 308 					setDE(LOW);
 424  015f 5f            	clrw	x
 425  0160 cd0000        	call	_setDE
 427  0163 ac110211      	jpf	L511
 428  0167               L7:
 429                     ; 313 			case(STATUS_RX):
 429                     ; 314 				requested_register = I2C1 -> DR;
 431  0167 c65216        	ld	a,21014
 432  016a 6b06          	ld	(OFST-4,sp),a
 434                     ; 316 				switch(requested_register)
 436  016c 7b06          	ld	a,(OFST-4,sp)
 438                     ; 328 						break;
 439  016e 4a            	dec	a
 440  016f 270a          	jreq	L11
 441  0171 4a            	dec	a
 442  0172 270e          	jreq	L31
 443  0174               L51:
 444                     ; 326 					default:
 444                     ; 327 						send_value = VALUE_NOREGISTER;
 446  0174 ae0006        	ldw	x,#6
 447  0177 1f09          	ldw	(OFST-1,sp),x
 449                     ; 328 						break;
 451  0179 200c          	jra	L141
 452  017b               L11:
 453                     ; 318 					case(ADD_DATA0):
 453                     ; 319 						send_value = VALUE_DATA0_BYTE0;						
 455  017b ae0001        	ldw	x,#1
 456  017e 1f09          	ldw	(OFST-1,sp),x
 458                     ; 320 						break;
 460  0180 2005          	jra	L141
 461  0182               L31:
 462                     ; 322 					case(ADD_TEST1):
 462                     ; 323 						send_value = VALUE_TEST1;
 464  0182 ae0005        	ldw	x,#5
 465  0185 1f09          	ldw	(OFST-1,sp),x
 467                     ; 324 						break;
 469  0187               L141:
 470                     ; 331 				status = STATUS_IDLE;
 472  0187 5f            	clrw	x
 473  0188 1f01          	ldw	(OFST-9,sp),x
 475                     ; 332 				break;
 477  018a ac110211      	jpf	L511
 478  018e               L71:
 479                     ; 334 			case(STATUS_TX):
 479                     ; 335 				switch(send_value)
 481  018e 1e09          	ldw	x,(OFST-1,sp)
 483                     ; 401 						break;
 484  0190 5d            	tnzw	x
 485  0191 277b          	jreq	L541
 486  0193 5a            	decw	x
 487  0194 271c          	jreq	L32
 488  0196 5a            	decw	x
 489  0197 273b          	jreq	L52
 490  0199 5a            	decw	x
 491  019a 2749          	jreq	L72
 492  019c 1d0002        	subw	x,#2
 493  019f 2753          	jreq	L13
 494  01a1 5a            	decw	x
 495  01a2 275e          	jreq	L33
 496  01a4               L53:
 497                     ; 396 					default:
 497                     ; 397 						//ERROR!
 497                     ; 398 						tmp = I2C1 -> SR1;
 499  01a4 c65217        	ld	a,21015
 500  01a7 5f            	clrw	x
 501  01a8 97            	ld	xl,a
 502                     ; 399 						I2C1 -> DR = ((uint8_t)0x00);
 504  01a9 725f5216      	clr	21014
 505                     ; 400 						send_value = VALUE_NULL;
 507  01ad 5f            	clrw	x
 508  01ae 1f09          	ldw	(OFST-1,sp),x
 510                     ; 401 						break;
 512  01b0 205c          	jra	L541
 513  01b2               L32:
 514                     ; 340 					case(VALUE_DATA0_BYTE0):
 514                     ; 341 						tmp = I2C1 -> SR1;
 516  01b2 c65217        	ld	a,21015
 517  01b5 5f            	clrw	x
 518  01b6 97            	ld	xl,a
 519                     ; 344 						disableInterrupts();
 522  01b7 9b            sim
 524                     ; 347 						dataToSend[0] = byteData[0];
 527  01b8 b602          	ld	a,_byteData
 528  01ba 6b03          	ld	(OFST-7,sp),a
 530                     ; 348 						dataToSend[1] = byteData[1];
 532  01bc b603          	ld	a,_byteData+1
 533  01be 6b04          	ld	(OFST-6,sp),a
 535                     ; 349 						dataToSend[2] = byteData[2];
 537  01c0 b604          	ld	a,_byteData+2
 538  01c2 6b05          	ld	(OFST-5,sp),a
 540                     ; 352 						enableInterrupts();
 543  01c4 9a            rim
 545                     ; 355 						dataAvailable = 0;
 548  01c5 5f            	clrw	x
 549  01c6 bf00          	ldw	_dataAvailable,x
 550                     ; 358 						I2C1 -> DR = dataToSend[0];
 552  01c8 7b03          	ld	a,(OFST-7,sp)
 553  01ca c75216        	ld	21014,a
 554                     ; 361 						send_value = VALUE_DATA0_BYTE1;
 556  01cd ae0002        	ldw	x,#2
 557  01d0 1f09          	ldw	(OFST-1,sp),x
 559                     ; 362 						break;
 561  01d2 203a          	jra	L541
 562  01d4               L52:
 563                     ; 364 					case(VALUE_DATA0_BYTE1):
 563                     ; 365 						tmp = I2C1 -> SR1;
 565  01d4 c65217        	ld	a,21015
 566  01d7 5f            	clrw	x
 567  01d8 97            	ld	xl,a
 568                     ; 368 						I2C1 -> DR = dataToSend[1];
 570  01d9 7b04          	ld	a,(OFST-6,sp)
 571  01db c75216        	ld	21014,a
 572                     ; 371 						send_value = VALUE_DATA0_BYTE2;
 574  01de ae0003        	ldw	x,#3
 575  01e1 1f09          	ldw	(OFST-1,sp),x
 577                     ; 372 						break;
 579  01e3 2029          	jra	L541
 580  01e5               L72:
 581                     ; 374 					case(VALUE_DATA0_BYTE2):
 581                     ; 375 						tmp = I2C1 -> SR1;
 583  01e5 c65217        	ld	a,21015
 584  01e8 5f            	clrw	x
 585  01e9 97            	ld	xl,a
 586                     ; 378 						I2C1 -> DR = dataToSend[2];
 588  01ea 7b05          	ld	a,(OFST-5,sp)
 589  01ec c75216        	ld	21014,a
 590                     ; 381 						send_value = VALUE_NULL;
 592  01ef 5f            	clrw	x
 593  01f0 1f09          	ldw	(OFST-1,sp),x
 595                     ; 382 						break;
 597  01f2 201a          	jra	L541
 598  01f4               L13:
 599                     ; 384 					case(VALUE_TEST1):
 599                     ; 385 						tmp = I2C1 -> SR1;
 601  01f4 c65217        	ld	a,21015
 602  01f7 5f            	clrw	x
 603  01f8 97            	ld	xl,a
 604                     ; 386 						I2C1 -> DR = ((uint8_t)0x54);
 606  01f9 35545216      	mov	21014,#84
 607                     ; 387 						send_value = VALUE_NULL;
 609  01fd 5f            	clrw	x
 610  01fe 1f09          	ldw	(OFST-1,sp),x
 612                     ; 388 						break;
 614  0200 200c          	jra	L541
 615  0202               L33:
 616                     ; 390 					case(VALUE_NOREGISTER):
 616                     ; 391 						tmp = I2C1 -> SR1;
 618  0202 c65217        	ld	a,21015
 619  0205 5f            	clrw	x
 620  0206 97            	ld	xl,a
 621                     ; 392 						I2C1 -> DR = ((uint8_t)0x00);
 623  0207 725f5216      	clr	21014
 624                     ; 393 						send_value = VALUE_NULL;
 626  020b 5f            	clrw	x
 627  020c 1f09          	ldw	(OFST-1,sp),x
 629                     ; 394 						break;
 631  020e               L541:
 632                     ; 405 				status = STATUS_IDLE;
 634  020e 5f            	clrw	x
 635  020f 1f01          	ldw	(OFST-9,sp),x
 637                     ; 406 				break;
 639  0211               L511:
 640                     ; 411 		setDEB1(HIGH);
 642  0211 ae0001        	ldw	x,#1
 643  0214 cd0000        	call	_setDEB1
 645                     ; 412 		setDEB1(LOW);
 647  0217 5f            	clrw	x
 648  0218 cd0000        	call	_setDEB1
 651  021b acf500f5      	jpf	L701
 683                     ; 421 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 683                     ; 422 {
 685                     	switch	.text
 686  021f               f_TIM1_CAP_IRQHandler:
 688  021f 8a            	push	cc
 689  0220 84            	pop	a
 690  0221 a4bf          	and	a,#191
 691  0223 88            	push	a
 692  0224 86            	pop	cc
 693  0225 3b0002        	push	c_x+2
 694  0228 be00          	ldw	x,c_x
 695  022a 89            	pushw	x
 696  022b 3b0002        	push	c_y+2
 697  022e be00          	ldw	x,c_y
 698  0230 89            	pushw	x
 701                     ; 426 	byteData[0] = readFastCounter();
 703  0231 cd0000        	call	_readFastCounter
 705  0234 b702          	ld	_byteData,a
 706                     ; 427 	byteData[1] = readSlowCounter_byte0();
 708  0236 cd0000        	call	_readSlowCounter_byte0
 710  0239 b703          	ld	_byteData+1,a
 711                     ; 428 	byteData[2] = readSlowCounter_byte1();
 713  023b cd0000        	call	_readSlowCounter_byte1
 715  023e b704          	ld	_byteData+2,a
 716                     ; 431 	dataAvailable = 1;
 718  0240 ae0001        	ldw	x,#1
 719  0243 bf00          	ldw	_dataAvailable,x
 720                     ; 434 	setMR(HIGH);
 722  0245 ae0001        	ldw	x,#1
 723  0248 cd0000        	call	_setMR
 725                     ; 435 	setCCLR(HIGH);
 727  024b ae0001        	ldw	x,#1
 728  024e cd0000        	call	_setCCLR
 730                     ; 436 	setMR(LOW);
 732  0251 5f            	clrw	x
 733  0252 cd0000        	call	_setMR
 735                     ; 437 	setCCLR(LOW);
 737  0255 5f            	clrw	x
 738  0256 cd0000        	call	_setCCLR
 740                     ; 440 	setADDR1(HIGH);
 742  0259 ae0001        	ldw	x,#1
 743  025c cd0000        	call	_setADDR1
 745                     ; 441 	setADDR1(LOW);
 747  025f 5f            	clrw	x
 748  0260 cd0000        	call	_setADDR1
 750                     ; 444 	TIM1 -> SR1 = 0;
 752  0263 725f52b6      	clr	21174
 753                     ; 445 }
 756  0267 85            	popw	x
 757  0268 bf00          	ldw	c_y,x
 758  026a 320002        	pop	c_y+2
 759  026d 85            	popw	x
 760  026e bf00          	ldw	c_x,x
 761  0270 320002        	pop	c_x+2
 762  0273 80            	iret
 795                     	xdef	f_TIM1_CAP_IRQHandler
 796                     	xdef	_main
 797                     	xdef	_byteData
 798                     	xdef	_dataAvailable
 799                     	xref	_setTH
 800                     	xref	_setADDR1
 801                     	xref	_setDEB1
 802                     	xref	_setDE
 803                     	xref	_setLEA
 804                     	xref	_readSlowCounter_byte1
 805                     	xref	_readSlowCounter_byte0
 806                     	xref	_setCCLR
 807                     	xref	_readFastCounter
 808                     	xref	_setMR
 809                     	xref.b	c_x
 810                     	xref.b	c_y
 829                     	xref	c_xymvx
 830                     	end
