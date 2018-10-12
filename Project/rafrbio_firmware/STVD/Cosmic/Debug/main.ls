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
 121                     ; 38 void main(void)
 121                     ; 39 {
 123                     	switch	.text
 124  0000               _main:
 126  0000 520a          	subw	sp,#10
 127       0000000a      OFST:	set	10
 130                     ; 40 	int status = STATUS_IDLE;
 132  0002 5f            	clrw	x
 133  0003 1f01          	ldw	(OFST-9,sp),x
 135                     ; 41 	uint8_t requested_register = 0;
 137                     ; 43 	int send_value = VALUE_NULL;
 139  0005 5f            	clrw	x
 140  0006 1f09          	ldw	(OFST-1,sp),x
 142                     ; 46 	uint8_t dataToSend[3] = {0, 0, 0};
 144  0008 96            	ldw	x,sp
 145  0009 1c0003        	addw	x,#OFST-7
 146  000c 90ae0000      	ldw	y,#L3_dataToSend
 147  0010 a603          	ld	a,#3
 148  0012 cd0000        	call	c_xymvx
 150                     ; 56 	CLK -> ICKCR != CLK_ICKCR_HSION;
 152  0015 c650c2        	ld	a,20674
 153  0018 a101          	cp	a,#1
 154  001a 2705          	jreq	L6
 155  001c ae0001        	ldw	x,#1
 156  001f 2001          	jra	L01
 157  0021               L6:
 158  0021 5f            	clrw	x
 159  0022               L01:
 160                     ; 67 	CLK -> CKDIVR &= 0b000;
 162  0022 725f50c0      	clr	20672
 163                     ; 74 	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
 165  0026 721250c4      	bset	20676,#1
 166                     ; 77 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 168  002a 721650c3      	bset	20675,#3
 169                     ; 80 	CLK -> PCKENR1 |= CLK_PCKENR1_DAC;
 171  002e 721e50c3      	bset	20675,#7
 172                     ; 96 	GPIOA -> DDR = 0b01110000;
 174  0032 35705002      	mov	20482,#112
 175                     ; 97 	GPIOA -> CR1 = 0b01110000;
 177  0036 35705003      	mov	20483,#112
 178                     ; 98 	GPIOA -> CR2 = 0b01110000;	
 180  003a 35705004      	mov	20484,#112
 181                     ; 107 	GPIOB -> DDR = 0b00001111;
 183  003e 350f5007      	mov	20487,#15
 184                     ; 108 	GPIOB -> CR1 = 0b00001111;
 186  0042 350f5008      	mov	20488,#15
 187                     ; 109 	GPIOB -> CR2 = 0b00001111;	
 189  0046 350f5009      	mov	20489,#15
 190                     ; 117 	GPIOC -> DDR = 0b01101000;
 192  004a 3568500c      	mov	20492,#104
 193                     ; 118 	GPIOC -> CR1 = 0b01101000;
 195  004e 3568500d      	mov	20493,#104
 196                     ; 119 	GPIOC -> CR2 = 0b00001000;
 198  0052 3508500e      	mov	20494,#8
 199                     ; 130 	GPIOD -> DDR = 0b10010000;
 201  0056 35905011      	mov	20497,#144
 202                     ; 131 	GPIOD -> CR1 = 0b10010000;
 204  005a 35905012      	mov	20498,#144
 205                     ; 132 	GPIOD -> CR2 = 0b00000000;	
 207  005e 725f5013      	clr	20499
 208                     ; 144 	GPIOE -> DDR = 0b11000000;
 210  0062 35c05016      	mov	20502,#192
 211                     ; 145 	GPIOE -> CR1 = 0b11000000;
 213  0066 35c05017      	mov	20503,#192
 214                     ; 146 	GPIOE -> CR2 = 0b00000000;	
 216  006a 725f5018      	clr	20504
 217                     ; 153 	DAC -> CH1CR1 |= DAC_CR1_EN;
 219  006e 72105380      	bset	21376,#0
 220                     ; 156 	DAC -> CH1DHR8 = ((uint8_t)DAC_VALUE);
 222  0072 35805390      	mov	21392,#128
 223                     ; 163 	TIM1 -> CCR1H = 0xFF;
 225  0076 35ff52c6      	mov	21190,#255
 226                     ; 164 	TIM1 -> CCR1L = 0xFF;
 228  007a 35ff52c7      	mov	21191,#255
 229                     ; 167 	TIM1 -> ARRH = 0xFF;
 231  007e 35ff52c3      	mov	21187,#255
 232                     ; 168 	TIM1 -> ARRL = 0xFF;
 234  0082 35ff52c4      	mov	21188,#255
 235                     ; 171 	TIM1 -> IER |= TIM_IER_CC2IE;
 237  0086 721452b5      	bset	21173,#2
 238                     ; 185 	TIM1 -> CCMR2 = ((uint8_t)0b00110000);
 240  008a 353052ba      	mov	21178,#48
 241                     ; 188 	TIM1 -> CCER1 |= TIM_CCER1_CC2P;
 243  008e 721a52bd      	bset	21181,#5
 244                     ; 191 	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
 246  0092 721852bd      	bset	21181,#4
 247                     ; 194 	TIM1-> BKR |= TIM1_BKR_MOE;
 249  0096 721e52ce      	bset	21198,#7
 250                     ; 197 	TIM1 -> SR1 = 0;
 252  009a 725f52b6      	clr	21174
 253                     ; 198 	TIM1 -> CR1 |= TIM_CR1_CEN;
 255  009e 721052b0      	bset	21168,#0
 256                     ; 205 	I2C1->CR1 = I2C_CR1_RESET_VALUE;
 258  00a2 725f5210      	clr	21008
 259                     ; 206 	I2C1->CR2 = I2C_CR2_RESET_VALUE;
 261  00a6 725f5211      	clr	21009
 262                     ; 207 	I2C1->FREQR = I2C_FREQR_RESET_VALUE;
 264  00aa 725f5212      	clr	21010
 265                     ; 208 	I2C1->OARL = I2C_OARL_RESET_VALUE;
 267  00ae 725f5213      	clr	21011
 268                     ; 209 	I2C1->OARH = I2C_OARH_RESET_VALUE;
 270  00b2 725f5214      	clr	21012
 271                     ; 210 	I2C1->OAR2 = I2C_OAR2_RESET_VALUE;
 273  00b6 725f5215      	clr	21013
 274                     ; 211 	I2C1->ITR = I2C_ITR_RESET_VALUE;
 276  00ba 725f521a      	clr	21018
 277                     ; 212 	I2C1->CCRL = I2C_CCRL_RESET_VALUE;
 279  00be 725f521b      	clr	21019
 280                     ; 213 	I2C1->CCRH = I2C_CCRH_RESET_VALUE;
 282  00c2 725f521c      	clr	21020
 283                     ; 214 	I2C1->TRISER = I2C_TRISER_RESET_VALUE;
 285  00c6 3502521d      	mov	21021,#2
 286                     ; 218 	I2C1 -> FREQR |= ((uint8_t)0b00010000);
 288  00ca 72185212      	bset	21010,#4
 289                     ; 221 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 291  00ce 72115210      	bres	21008,#0
 292                     ; 224 	I2C1 -> CR2 |= I2C_CR2_ACK;
 294  00d2 72145211      	bset	21009,#2
 295                     ; 228 	I2C1 -> OARL = ((uint8_t)0b00000010);
 297  00d6 35025213      	mov	21011,#2
 298                     ; 231 	I2C1 -> OARH &= ~I2C_OARH_ADDMODE;
 300  00da 721f5214      	bres	21012,#7
 301                     ; 233 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 303  00de 721c5214      	bset	21012,#6
 304                     ; 236 	I2C1 -> CR1 |= I2C_CR1_PE;
 306  00e2 72105210      	bset	21008,#0
 307                     ; 245 	enableInterrupts();
 310  00e6 9a            rim
 312                     ; 249 	setLEA(HIGH);
 315  00e7 ae0001        	ldw	x,#1
 316  00ea cd0000        	call	_setLEA
 318  00ed               L701:
 319                     ; 255 		switch(status)
 321  00ed 1e01          	ldw	x,(OFST-9,sp)
 323                     ; 409 				break;
 324  00ef 5d            	tnzw	x
 325  00f0 2710          	jreq	L5
 326  00f2 5a            	decw	x
 327  00f3 2603cc017d    	jreq	L7
 328  00f8 5a            	decw	x
 329  00f9 2603          	jrne	L21
 330  00fb cc01a4        	jp	L71
 331  00fe               L21:
 332  00fe ac270227      	jpf	L511
 333  0102               L5:
 334                     ; 257 			case(STATUS_IDLE):
 334                     ; 258 			sr1_value = I2C1 -> SR1;
 336  0102 c65217        	ld	a,21015
 337  0105 6b06          	ld	(OFST-4,sp),a
 339                     ; 261 				if(I2C1->SR2 & I2C_SR2_BERR != 0)
 341  0107 c65218        	ld	a,21016
 342  010a a501          	bcp	a,#1
 343  010c 270a          	jreq	L711
 344                     ; 264 					setDEB2(HIGH);
 346  010e ae0001        	ldw	x,#1
 347  0111 cd0000        	call	_setDEB2
 349                     ; 265 					setDEB2(LOW);
 351  0114 5f            	clrw	x
 352  0115 cd0000        	call	_setDEB2
 354  0118               L711:
 355                     ; 269 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 357  0118 7b06          	ld	a,(OFST-4,sp)
 358  011a a540          	bcp	a,#64
 359  011c 2707          	jreq	L121
 360                     ; 273 					status = STATUS_RX;
 362  011e ae0001        	ldw	x,#1
 363  0121 1f01          	ldw	(OFST-9,sp),x
 366  0123 2015          	jra	L321
 367  0125               L121:
 368                     ; 275 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 370  0125 7b06          	ld	a,(OFST-4,sp)
 371  0127 a580          	bcp	a,#128
 372  0129 270f          	jreq	L321
 373                     ; 278 					setADDR1(HIGH);
 375  012b ae0001        	ldw	x,#1
 376  012e cd0000        	call	_setADDR1
 378                     ; 279 					setADDR1(LOW);
 380  0131 5f            	clrw	x
 381  0132 cd0000        	call	_setADDR1
 383                     ; 281 					status = STATUS_TX;
 385  0135 ae0002        	ldw	x,#2
 386  0138 1f01          	ldw	(OFST-9,sp),x
 388  013a               L321:
 389                     ; 284 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 391  013a 7b06          	ld	a,(OFST-4,sp)
 392  013c a502          	bcp	a,#2
 393  013e 270a          	jreq	L721
 394                     ; 287 					tmp = I2C1 -> SR1;
 396  0140 c65217        	ld	a,21015
 397  0143 5f            	clrw	x
 398  0144 97            	ld	xl,a
 399                     ; 288 					tmp = I2C1 -> SR3;
 401  0145 c65219        	ld	a,21017
 402  0148 5f            	clrw	x
 403  0149 97            	ld	xl,a
 404  014a               L721:
 405                     ; 291 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 407  014a 7b06          	ld	a,(OFST-4,sp)
 408  014c a510          	bcp	a,#16
 409  014e 2709          	jreq	L131
 410                     ; 294 					tmp = I2C1 -> SR1;
 412  0150 c65217        	ld	a,21015
 413  0153 5f            	clrw	x
 414  0154 97            	ld	xl,a
 415                     ; 295 					I2C1 -> CR2 |= I2C_CR2_ACK;
 417  0155 72145211      	bset	21009,#2
 418  0159               L131:
 419                     ; 298 				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
 421  0159 c65218        	ld	a,21016
 422  015c a504          	bcp	a,#4
 423  015e 2704          	jreq	L331
 424                     ; 301 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 426  0160 72155218      	bres	21016,#2
 427  0164               L331:
 428                     ; 304 				if( dataAvailable == 1)
 430  0164 be00          	ldw	x,_dataAvailable
 431  0166 a30001        	cpw	x,#1
 432  0169 260a          	jrne	L531
 433                     ; 307 					setDE(HIGH);
 435  016b ae0001        	ldw	x,#1
 436  016e cd0000        	call	_setDE
 439  0171 ac270227      	jpf	L511
 440  0175               L531:
 441                     ; 311 					setDE(LOW);
 443  0175 5f            	clrw	x
 444  0176 cd0000        	call	_setDE
 446  0179 ac270227      	jpf	L511
 447  017d               L7:
 448                     ; 316 			case(STATUS_RX):
 448                     ; 317 				requested_register = I2C1 -> DR;
 450  017d c65216        	ld	a,21014
 451  0180 6b06          	ld	(OFST-4,sp),a
 453                     ; 319 				switch(requested_register)
 455  0182 7b06          	ld	a,(OFST-4,sp)
 457                     ; 331 						break;
 458  0184 4a            	dec	a
 459  0185 270a          	jreq	L11
 460  0187 4a            	dec	a
 461  0188 270e          	jreq	L31
 462  018a               L51:
 463                     ; 329 					default:
 463                     ; 330 						send_value = VALUE_NOREGISTER;
 465  018a ae0006        	ldw	x,#6
 466  018d 1f09          	ldw	(OFST-1,sp),x
 468                     ; 331 						break;
 470  018f 200c          	jra	L341
 471  0191               L11:
 472                     ; 321 					case(ADD_DATA0):
 472                     ; 322 						send_value = VALUE_DATA0_BYTE0;						
 474  0191 ae0001        	ldw	x,#1
 475  0194 1f09          	ldw	(OFST-1,sp),x
 477                     ; 323 						break;
 479  0196 2005          	jra	L341
 480  0198               L31:
 481                     ; 325 					case(ADD_TEST1):
 481                     ; 326 						send_value = VALUE_TEST1;
 483  0198 ae0005        	ldw	x,#5
 484  019b 1f09          	ldw	(OFST-1,sp),x
 486                     ; 327 						break;
 488  019d               L341:
 489                     ; 334 				status = STATUS_IDLE;
 491  019d 5f            	clrw	x
 492  019e 1f01          	ldw	(OFST-9,sp),x
 494                     ; 335 				break;
 496  01a0 ac270227      	jpf	L511
 497  01a4               L71:
 498                     ; 337 			case(STATUS_TX):
 498                     ; 338 				switch(send_value)
 500  01a4 1e09          	ldw	x,(OFST-1,sp)
 502                     ; 404 						break;
 503  01a6 5d            	tnzw	x
 504  01a7 277b          	jreq	L741
 505  01a9 5a            	decw	x
 506  01aa 271c          	jreq	L32
 507  01ac 5a            	decw	x
 508  01ad 273b          	jreq	L52
 509  01af 5a            	decw	x
 510  01b0 2749          	jreq	L72
 511  01b2 1d0002        	subw	x,#2
 512  01b5 2753          	jreq	L13
 513  01b7 5a            	decw	x
 514  01b8 275e          	jreq	L33
 515  01ba               L53:
 516                     ; 399 					default:
 516                     ; 400 						//ERROR!
 516                     ; 401 						tmp = I2C1 -> SR1;
 518  01ba c65217        	ld	a,21015
 519  01bd 5f            	clrw	x
 520  01be 97            	ld	xl,a
 521                     ; 402 						I2C1 -> DR = ((uint8_t)0x00);
 523  01bf 725f5216      	clr	21014
 524                     ; 403 						send_value = VALUE_NULL;
 526  01c3 5f            	clrw	x
 527  01c4 1f09          	ldw	(OFST-1,sp),x
 529                     ; 404 						break;
 531  01c6 205c          	jra	L741
 532  01c8               L32:
 533                     ; 343 					case(VALUE_DATA0_BYTE0):
 533                     ; 344 						tmp = I2C1 -> SR1;
 535  01c8 c65217        	ld	a,21015
 536  01cb 5f            	clrw	x
 537  01cc 97            	ld	xl,a
 538                     ; 347 						disableInterrupts();
 541  01cd 9b            sim
 543                     ; 350 						dataToSend[0] = byteData[0];
 546  01ce b602          	ld	a,_byteData
 547  01d0 6b03          	ld	(OFST-7,sp),a
 549                     ; 351 						dataToSend[1] = byteData[1];
 551  01d2 b603          	ld	a,_byteData+1
 552  01d4 6b04          	ld	(OFST-6,sp),a
 554                     ; 352 						dataToSend[2] = byteData[2];
 556  01d6 b604          	ld	a,_byteData+2
 557  01d8 6b05          	ld	(OFST-5,sp),a
 559                     ; 355 						enableInterrupts();
 562  01da 9a            rim
 564                     ; 358 						dataAvailable = 0;
 567  01db 5f            	clrw	x
 568  01dc bf00          	ldw	_dataAvailable,x
 569                     ; 361 						I2C1 -> DR = dataToSend[0];
 571  01de 7b03          	ld	a,(OFST-7,sp)
 572  01e0 c75216        	ld	21014,a
 573                     ; 364 						send_value = VALUE_DATA0_BYTE1;
 575  01e3 ae0002        	ldw	x,#2
 576  01e6 1f09          	ldw	(OFST-1,sp),x
 578                     ; 365 						break;
 580  01e8 203a          	jra	L741
 581  01ea               L52:
 582                     ; 367 					case(VALUE_DATA0_BYTE1):
 582                     ; 368 						tmp = I2C1 -> SR1;
 584  01ea c65217        	ld	a,21015
 585  01ed 5f            	clrw	x
 586  01ee 97            	ld	xl,a
 587                     ; 371 						I2C1 -> DR = dataToSend[1];
 589  01ef 7b04          	ld	a,(OFST-6,sp)
 590  01f1 c75216        	ld	21014,a
 591                     ; 374 						send_value = VALUE_DATA0_BYTE2;
 593  01f4 ae0003        	ldw	x,#3
 594  01f7 1f09          	ldw	(OFST-1,sp),x
 596                     ; 375 						break;
 598  01f9 2029          	jra	L741
 599  01fb               L72:
 600                     ; 377 					case(VALUE_DATA0_BYTE2):
 600                     ; 378 						tmp = I2C1 -> SR1;
 602  01fb c65217        	ld	a,21015
 603  01fe 5f            	clrw	x
 604  01ff 97            	ld	xl,a
 605                     ; 381 						I2C1 -> DR = dataToSend[2];
 607  0200 7b05          	ld	a,(OFST-5,sp)
 608  0202 c75216        	ld	21014,a
 609                     ; 384 						send_value = VALUE_NULL;
 611  0205 5f            	clrw	x
 612  0206 1f09          	ldw	(OFST-1,sp),x
 614                     ; 385 						break;
 616  0208 201a          	jra	L741
 617  020a               L13:
 618                     ; 387 					case(VALUE_TEST1):
 618                     ; 388 						tmp = I2C1 -> SR1;
 620  020a c65217        	ld	a,21015
 621  020d 5f            	clrw	x
 622  020e 97            	ld	xl,a
 623                     ; 389 						I2C1 -> DR = ((uint8_t)0x54);
 625  020f 35545216      	mov	21014,#84
 626                     ; 390 						send_value = VALUE_NULL;
 628  0213 5f            	clrw	x
 629  0214 1f09          	ldw	(OFST-1,sp),x
 631                     ; 391 						break;
 633  0216 200c          	jra	L741
 634  0218               L33:
 635                     ; 393 					case(VALUE_NOREGISTER):
 635                     ; 394 						tmp = I2C1 -> SR1;
 637  0218 c65217        	ld	a,21015
 638  021b 5f            	clrw	x
 639  021c 97            	ld	xl,a
 640                     ; 395 						I2C1 -> DR = ((uint8_t)0x00);
 642  021d 725f5216      	clr	21014
 643                     ; 396 						send_value = VALUE_NULL;
 645  0221 5f            	clrw	x
 646  0222 1f09          	ldw	(OFST-1,sp),x
 648                     ; 397 						break;
 650  0224               L741:
 651                     ; 408 				status = STATUS_IDLE;
 653  0224 5f            	clrw	x
 654  0225 1f01          	ldw	(OFST-9,sp),x
 656                     ; 409 				break;
 658  0227               L511:
 659                     ; 414 		setDEB1(HIGH);
 661  0227 ae0001        	ldw	x,#1
 662  022a cd0000        	call	_setDEB1
 664                     ; 415 		setDEB1(LOW);
 666  022d 5f            	clrw	x
 667  022e cd0000        	call	_setDEB1
 670  0231 aced00ed      	jpf	L701
 701                     ; 424 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 701                     ; 425 {
 703                     	switch	.text
 704  0235               f_TIM1_CAP_IRQHandler:
 706  0235 8a            	push	cc
 707  0236 84            	pop	a
 708  0237 a4bf          	and	a,#191
 709  0239 88            	push	a
 710  023a 86            	pop	cc
 711  023b 3b0002        	push	c_x+2
 712  023e be00          	ldw	x,c_x
 713  0240 89            	pushw	x
 714  0241 3b0002        	push	c_y+2
 715  0244 be00          	ldw	x,c_y
 716  0246 89            	pushw	x
 719                     ; 429 	byteData[0] = readFastCounter();
 721  0247 cd0000        	call	_readFastCounter
 723  024a b702          	ld	_byteData,a
 724                     ; 430 	byteData[1] = readSlowCounter_byte0();
 726  024c cd0000        	call	_readSlowCounter_byte0
 728  024f b703          	ld	_byteData+1,a
 729                     ; 431 	byteData[2] = readSlowCounter_byte1();
 731  0251 cd0000        	call	_readSlowCounter_byte1
 733  0254 b704          	ld	_byteData+2,a
 734                     ; 434 	dataAvailable = 1;
 736  0256 ae0001        	ldw	x,#1
 737  0259 bf00          	ldw	_dataAvailable,x
 738                     ; 437 	setMR(HIGH);
 740  025b ae0001        	ldw	x,#1
 741  025e cd0000        	call	_setMR
 743                     ; 438 	setCCLR(HIGH);
 745  0261 ae0001        	ldw	x,#1
 746  0264 cd0000        	call	_setCCLR
 748                     ; 439 	setMR(LOW);
 750  0267 5f            	clrw	x
 751  0268 cd0000        	call	_setMR
 753                     ; 440 	setCCLR(LOW);
 755  026b 5f            	clrw	x
 756  026c cd0000        	call	_setCCLR
 758                     ; 443 	TIM1 -> SR1 = 0;
 760  026f 725f52b6      	clr	21174
 761                     ; 444 }
 764  0273 85            	popw	x
 765  0274 bf00          	ldw	c_y,x
 766  0276 320002        	pop	c_y+2
 767  0279 85            	popw	x
 768  027a bf00          	ldw	c_x,x
 769  027c 320002        	pop	c_x+2
 770  027f 80            	iret
 803                     	xdef	f_TIM1_CAP_IRQHandler
 804                     	xdef	_main
 805                     	xdef	_byteData
 806                     	xdef	_dataAvailable
 807                     	xref	_setADDR1
 808                     	xref	_setDEB2
 809                     	xref	_setDEB1
 810                     	xref	_setDE
 811                     	xref	_setLEA
 812                     	xref	_readSlowCounter_byte1
 813                     	xref	_readSlowCounter_byte0
 814                     	xref	_setCCLR
 815                     	xref	_readFastCounter
 816                     	xref	_setMR
 817                     	xref.b	c_x
 818                     	xref.b	c_y
 837                     	xref	c_xymvx
 838                     	end
