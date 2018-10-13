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
 119                     ; 38 void main(void)
 119                     ; 39 {
 121                     	switch	.text
 122  0000               _main:
 124  0000 520a          	subw	sp,#10
 125       0000000a      OFST:	set	10
 128                     ; 40 	int status = STATUS_IDLE;
 130  0002 5f            	clrw	x
 131  0003 1f01          	ldw	(OFST-9,sp),x
 133                     ; 41 	uint8_t requested_register = 0;
 135                     ; 43 	int send_value = VALUE_NULL;
 137  0005 5f            	clrw	x
 138  0006 1f09          	ldw	(OFST-1,sp),x
 140                     ; 46 	uint8_t dataToSend[3] = {0, 0, 0};
 142  0008 96            	ldw	x,sp
 143  0009 1c0003        	addw	x,#OFST-7
 144  000c 90ae0000      	ldw	y,#L3_dataToSend
 145  0010 a603          	ld	a,#3
 146  0012 cd0000        	call	c_xymvx
 148                     ; 56 	CLK -> ICKCR != CLK_ICKCR_HSION;
 150  0015 c650c2        	ld	a,20674
 151  0018 a101          	cp	a,#1
 152  001a 2705          	jreq	L6
 153  001c ae0001        	ldw	x,#1
 154  001f 2001          	jra	L01
 155  0021               L6:
 156  0021 5f            	clrw	x
 157  0022               L01:
 158                     ; 67 	CLK -> CKDIVR &= 0b000;
 160  0022 725f50c0      	clr	20672
 161                     ; 74 	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
 163  0026 721250c4      	bset	20676,#1
 164                     ; 77 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 166  002a 721650c3      	bset	20675,#3
 167                     ; 80 	CLK -> PCKENR1 |= CLK_PCKENR1_DAC;
 169  002e 721e50c3      	bset	20675,#7
 170                     ; 96 	GPIOA -> DDR = 0b01110000;
 172  0032 35705002      	mov	20482,#112
 173                     ; 97 	GPIOA -> CR1 = 0b01110000;
 175  0036 35705003      	mov	20483,#112
 176                     ; 98 	GPIOA -> CR2 = 0b01110000;	
 178  003a 35705004      	mov	20484,#112
 179                     ; 107 	GPIOB -> DDR = 0b00001111;
 181  003e 350f5007      	mov	20487,#15
 182                     ; 108 	GPIOB -> CR1 = 0b00001111;
 184  0042 350f5008      	mov	20488,#15
 185                     ; 109 	GPIOB -> CR2 = 0b00001111;	
 187  0046 350f5009      	mov	20489,#15
 188                     ; 117 	GPIOC -> DDR = 0b01101000;
 190  004a 3568500c      	mov	20492,#104
 191                     ; 118 	GPIOC -> CR1 = 0b01101000;
 193  004e 3568500d      	mov	20493,#104
 194                     ; 119 	GPIOC -> CR2 = 0b00001000;
 196  0052 3508500e      	mov	20494,#8
 197                     ; 130 	GPIOD -> DDR = 0b10010000;
 199  0056 35905011      	mov	20497,#144
 200                     ; 131 	GPIOD -> CR1 = 0b10010000;
 202  005a 35905012      	mov	20498,#144
 203                     ; 132 	GPIOD -> CR2 = 0b00000000;	
 205  005e 725f5013      	clr	20499
 206                     ; 144 	GPIOE -> DDR = 0b11000000;
 208  0062 35c05016      	mov	20502,#192
 209                     ; 145 	GPIOE -> CR1 = 0b11000000;
 211  0066 35c05017      	mov	20503,#192
 212                     ; 146 	GPIOE -> CR2 = 0b00000000;	
 214  006a 725f5018      	clr	20504
 215                     ; 153 	DAC -> CH1CR1 |= DAC_CR1_EN;
 217  006e 72105380      	bset	21376,#0
 218                     ; 156 	DAC -> CH1DHR8 = ((uint8_t)DAC_VALUE);
 220  0072 725f5390      	clr	21392
 221                     ; 163 	TIM1 -> CCR1H = 0xFF;
 223  0076 35ff52c6      	mov	21190,#255
 224                     ; 164 	TIM1 -> CCR1L = 0xFF;
 226  007a 35ff52c7      	mov	21191,#255
 227                     ; 167 	TIM1 -> ARRH = 0xFF;
 229  007e 35ff52c3      	mov	21187,#255
 230                     ; 168 	TIM1 -> ARRL = 0xFF;
 232  0082 35ff52c4      	mov	21188,#255
 233                     ; 171 	TIM1 -> IER |= TIM_IER_CC2IE;
 235  0086 721452b5      	bset	21173,#2
 236                     ; 185 	TIM1 -> CCMR2 = ((uint8_t)0b00110000);
 238  008a 353052ba      	mov	21178,#48
 239                     ; 188 	TIM1 -> CCER1 |= TIM_CCER1_CC2P;
 241  008e 721a52bd      	bset	21181,#5
 242                     ; 191 	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
 244  0092 721852bd      	bset	21181,#4
 245                     ; 194 	TIM1-> BKR |= TIM1_BKR_MOE;
 247  0096 721e52ce      	bset	21198,#7
 248                     ; 197 	TIM1 -> SR1 = 0;
 250  009a 725f52b6      	clr	21174
 251                     ; 198 	TIM1 -> CR1 |= TIM_CR1_CEN;
 253  009e 721052b0      	bset	21168,#0
 254                     ; 205 	I2C1->CR1 = I2C_CR1_RESET_VALUE;
 256  00a2 725f5210      	clr	21008
 257                     ; 206 	I2C1->CR2 = I2C_CR2_RESET_VALUE;
 259  00a6 725f5211      	clr	21009
 260                     ; 207 	I2C1->FREQR = I2C_FREQR_RESET_VALUE;
 262  00aa 725f5212      	clr	21010
 263                     ; 208 	I2C1->OARL = I2C_OARL_RESET_VALUE;
 265  00ae 725f5213      	clr	21011
 266                     ; 209 	I2C1->OARH = I2C_OARH_RESET_VALUE;
 268  00b2 725f5214      	clr	21012
 269                     ; 210 	I2C1->OAR2 = I2C_OAR2_RESET_VALUE;
 271  00b6 725f5215      	clr	21013
 272                     ; 211 	I2C1->ITR = I2C_ITR_RESET_VALUE;
 274  00ba 725f521a      	clr	21018
 275                     ; 212 	I2C1->CCRL = I2C_CCRL_RESET_VALUE;
 277  00be 725f521b      	clr	21019
 278                     ; 213 	I2C1->CCRH = I2C_CCRH_RESET_VALUE;
 280  00c2 725f521c      	clr	21020
 281                     ; 214 	I2C1->TRISER = I2C_TRISER_RESET_VALUE;
 283  00c6 3502521d      	mov	21021,#2
 284                     ; 218 	I2C1 -> FREQR |= ((uint8_t)0b00010000);
 286  00ca 72185212      	bset	21010,#4
 287                     ; 221 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 289  00ce 72115210      	bres	21008,#0
 290                     ; 224 	I2C1 -> CR2 |= I2C_CR2_ACK;
 292  00d2 72145211      	bset	21009,#2
 293                     ; 228 	I2C1 -> OARL = ((uint8_t)0b00000010);
 295  00d6 35025213      	mov	21011,#2
 296                     ; 231 	I2C1 -> OARH &= ~I2C_OARH_ADDMODE;
 298  00da 721f5214      	bres	21012,#7
 299                     ; 233 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 301  00de 721c5214      	bset	21012,#6
 302                     ; 236 	I2C1 -> CR1 |= I2C_CR1_PE;
 304  00e2 72105210      	bset	21008,#0
 305                     ; 245 	enableInterrupts();
 308  00e6 9a            rim
 310                     ; 249 	setLEA(HIGH);
 313  00e7 ae0001        	ldw	x,#1
 314  00ea cd0000        	call	_setLEA
 316  00ed               L701:
 317                     ; 255 		switch(status)
 319  00ed 1e01          	ldw	x,(OFST-9,sp)
 321                     ; 396 				break;
 322  00ef 5d            	tnzw	x
 323  00f0 270d          	jreq	L5
 324  00f2 5a            	decw	x
 325  00f3 276a          	jreq	L7
 326  00f5 5a            	decw	x
 327  00f6 2603          	jrne	L21
 328  00f8 cc0186        	jp	L71
 329  00fb               L21:
 330  00fb ac090209      	jpf	L511
 331  00ff               L5:
 332                     ; 257 			case(STATUS_IDLE):
 332                     ; 258 			sr1_value = I2C1 -> SR1;
 334  00ff c65217        	ld	a,21015
 335  0102 6b06          	ld	(OFST-4,sp),a
 337                     ; 260 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 339  0104 7b06          	ld	a,(OFST-4,sp)
 340  0106 a540          	bcp	a,#64
 341  0108 2707          	jreq	L711
 342                     ; 264 					status = STATUS_RX;
 344  010a ae0001        	ldw	x,#1
 345  010d 1f01          	ldw	(OFST-9,sp),x
 348  010f 200b          	jra	L121
 349  0111               L711:
 350                     ; 266 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 352  0111 7b06          	ld	a,(OFST-4,sp)
 353  0113 a580          	bcp	a,#128
 354  0115 2705          	jreq	L121
 355                     ; 268 					status = STATUS_TX;
 357  0117 ae0002        	ldw	x,#2
 358  011a 1f01          	ldw	(OFST-9,sp),x
 360  011c               L121:
 361                     ; 271 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 363  011c 7b06          	ld	a,(OFST-4,sp)
 364  011e a502          	bcp	a,#2
 365  0120 270a          	jreq	L521
 366                     ; 274 					tmp = I2C1 -> SR1;
 368  0122 c65217        	ld	a,21015
 369  0125 5f            	clrw	x
 370  0126 97            	ld	xl,a
 371                     ; 275 					tmp = I2C1 -> SR3;
 373  0127 c65219        	ld	a,21017
 374  012a 5f            	clrw	x
 375  012b 97            	ld	xl,a
 376  012c               L521:
 377                     ; 278 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 379  012c 7b06          	ld	a,(OFST-4,sp)
 380  012e a510          	bcp	a,#16
 381  0130 2709          	jreq	L721
 382                     ; 281 					tmp = I2C1 -> SR1;
 384  0132 c65217        	ld	a,21015
 385  0135 5f            	clrw	x
 386  0136 97            	ld	xl,a
 387                     ; 282 					I2C1 -> CR2 |= I2C_CR2_ACK;
 389  0137 72145211      	bset	21009,#2
 390  013b               L721:
 391                     ; 285 				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
 393  013b c65218        	ld	a,21016
 394  013e a504          	bcp	a,#4
 395  0140 2704          	jreq	L131
 396                     ; 288 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 398  0142 72155218      	bres	21016,#2
 399  0146               L131:
 400                     ; 291 				if( dataAvailable == 1)
 402  0146 be00          	ldw	x,_dataAvailable
 403  0148 a30001        	cpw	x,#1
 404  014b 260a          	jrne	L331
 405                     ; 294 					setDE(HIGH);
 407  014d ae0001        	ldw	x,#1
 408  0150 cd0000        	call	_setDE
 411  0153 ac090209      	jpf	L511
 412  0157               L331:
 413                     ; 298 					setDE(LOW);
 415  0157 5f            	clrw	x
 416  0158 cd0000        	call	_setDE
 418  015b ac090209      	jpf	L511
 419  015f               L7:
 420                     ; 303 			case(STATUS_RX):
 420                     ; 304 				requested_register = I2C1 -> DR;
 422  015f c65216        	ld	a,21014
 423  0162 6b06          	ld	(OFST-4,sp),a
 425                     ; 306 				switch(requested_register)
 427  0164 7b06          	ld	a,(OFST-4,sp)
 429                     ; 318 						break;
 430  0166 4a            	dec	a
 431  0167 270a          	jreq	L11
 432  0169 4a            	dec	a
 433  016a 270e          	jreq	L31
 434  016c               L51:
 435                     ; 316 					default:
 435                     ; 317 						send_value = VALUE_NOREGISTER;
 437  016c ae0006        	ldw	x,#6
 438  016f 1f09          	ldw	(OFST-1,sp),x
 440                     ; 318 						break;
 442  0171 200c          	jra	L141
 443  0173               L11:
 444                     ; 308 					case(ADD_DATA0):
 444                     ; 309 						send_value = VALUE_DATA0_BYTE0;						
 446  0173 ae0001        	ldw	x,#1
 447  0176 1f09          	ldw	(OFST-1,sp),x
 449                     ; 310 						break;
 451  0178 2005          	jra	L141
 452  017a               L31:
 453                     ; 312 					case(ADD_TEST1):
 453                     ; 313 						send_value = VALUE_TEST1;
 455  017a ae0005        	ldw	x,#5
 456  017d 1f09          	ldw	(OFST-1,sp),x
 458                     ; 314 						break;
 460  017f               L141:
 461                     ; 321 				status = STATUS_IDLE;
 463  017f 5f            	clrw	x
 464  0180 1f01          	ldw	(OFST-9,sp),x
 466                     ; 322 				break;
 468  0182 ac090209      	jpf	L511
 469  0186               L71:
 470                     ; 324 			case(STATUS_TX):
 470                     ; 325 				switch(send_value)
 472  0186 1e09          	ldw	x,(OFST-1,sp)
 474                     ; 391 						break;
 475  0188 5d            	tnzw	x
 476  0189 277b          	jreq	L541
 477  018b 5a            	decw	x
 478  018c 271c          	jreq	L32
 479  018e 5a            	decw	x
 480  018f 273b          	jreq	L52
 481  0191 5a            	decw	x
 482  0192 2749          	jreq	L72
 483  0194 1d0002        	subw	x,#2
 484  0197 2753          	jreq	L13
 485  0199 5a            	decw	x
 486  019a 275e          	jreq	L33
 487  019c               L53:
 488                     ; 386 					default:
 488                     ; 387 						//ERROR!
 488                     ; 388 						tmp = I2C1 -> SR1;
 490  019c c65217        	ld	a,21015
 491  019f 5f            	clrw	x
 492  01a0 97            	ld	xl,a
 493                     ; 389 						I2C1 -> DR = ((uint8_t)0x00);
 495  01a1 725f5216      	clr	21014
 496                     ; 390 						send_value = VALUE_NULL;
 498  01a5 5f            	clrw	x
 499  01a6 1f09          	ldw	(OFST-1,sp),x
 501                     ; 391 						break;
 503  01a8 205c          	jra	L541
 504  01aa               L32:
 505                     ; 330 					case(VALUE_DATA0_BYTE0):
 505                     ; 331 						tmp = I2C1 -> SR1;
 507  01aa c65217        	ld	a,21015
 508  01ad 5f            	clrw	x
 509  01ae 97            	ld	xl,a
 510                     ; 334 						disableInterrupts();
 513  01af 9b            sim
 515                     ; 337 						dataToSend[0] = byteData[0];
 518  01b0 b602          	ld	a,_byteData
 519  01b2 6b03          	ld	(OFST-7,sp),a
 521                     ; 338 						dataToSend[1] = byteData[1];
 523  01b4 b603          	ld	a,_byteData+1
 524  01b6 6b04          	ld	(OFST-6,sp),a
 526                     ; 339 						dataToSend[2] = byteData[2];
 528  01b8 b604          	ld	a,_byteData+2
 529  01ba 6b05          	ld	(OFST-5,sp),a
 531                     ; 342 						enableInterrupts();
 534  01bc 9a            rim
 536                     ; 345 						dataAvailable = 0;
 539  01bd 5f            	clrw	x
 540  01be bf00          	ldw	_dataAvailable,x
 541                     ; 348 						I2C1 -> DR = dataToSend[0];
 543  01c0 7b03          	ld	a,(OFST-7,sp)
 544  01c2 c75216        	ld	21014,a
 545                     ; 351 						send_value = VALUE_DATA0_BYTE1;
 547  01c5 ae0002        	ldw	x,#2
 548  01c8 1f09          	ldw	(OFST-1,sp),x
 550                     ; 352 						break;
 552  01ca 203a          	jra	L541
 553  01cc               L52:
 554                     ; 354 					case(VALUE_DATA0_BYTE1):
 554                     ; 355 						tmp = I2C1 -> SR1;
 556  01cc c65217        	ld	a,21015
 557  01cf 5f            	clrw	x
 558  01d0 97            	ld	xl,a
 559                     ; 358 						I2C1 -> DR = dataToSend[1];
 561  01d1 7b04          	ld	a,(OFST-6,sp)
 562  01d3 c75216        	ld	21014,a
 563                     ; 361 						send_value = VALUE_DATA0_BYTE2;
 565  01d6 ae0003        	ldw	x,#3
 566  01d9 1f09          	ldw	(OFST-1,sp),x
 568                     ; 362 						break;
 570  01db 2029          	jra	L541
 571  01dd               L72:
 572                     ; 364 					case(VALUE_DATA0_BYTE2):
 572                     ; 365 						tmp = I2C1 -> SR1;
 574  01dd c65217        	ld	a,21015
 575  01e0 5f            	clrw	x
 576  01e1 97            	ld	xl,a
 577                     ; 368 						I2C1 -> DR = dataToSend[2];
 579  01e2 7b05          	ld	a,(OFST-5,sp)
 580  01e4 c75216        	ld	21014,a
 581                     ; 371 						send_value = VALUE_NULL;
 583  01e7 5f            	clrw	x
 584  01e8 1f09          	ldw	(OFST-1,sp),x
 586                     ; 372 						break;
 588  01ea 201a          	jra	L541
 589  01ec               L13:
 590                     ; 374 					case(VALUE_TEST1):
 590                     ; 375 						tmp = I2C1 -> SR1;
 592  01ec c65217        	ld	a,21015
 593  01ef 5f            	clrw	x
 594  01f0 97            	ld	xl,a
 595                     ; 376 						I2C1 -> DR = ((uint8_t)0x54);
 597  01f1 35545216      	mov	21014,#84
 598                     ; 377 						send_value = VALUE_NULL;
 600  01f5 5f            	clrw	x
 601  01f6 1f09          	ldw	(OFST-1,sp),x
 603                     ; 378 						break;
 605  01f8 200c          	jra	L541
 606  01fa               L33:
 607                     ; 380 					case(VALUE_NOREGISTER):
 607                     ; 381 						tmp = I2C1 -> SR1;
 609  01fa c65217        	ld	a,21015
 610  01fd 5f            	clrw	x
 611  01fe 97            	ld	xl,a
 612                     ; 382 						I2C1 -> DR = ((uint8_t)0x00);
 614  01ff 725f5216      	clr	21014
 615                     ; 383 						send_value = VALUE_NULL;
 617  0203 5f            	clrw	x
 618  0204 1f09          	ldw	(OFST-1,sp),x
 620                     ; 384 						break;
 622  0206               L541:
 623                     ; 395 				status = STATUS_IDLE;
 625  0206 5f            	clrw	x
 626  0207 1f01          	ldw	(OFST-9,sp),x
 628                     ; 396 				break;
 630  0209               L511:
 631                     ; 401 		setDEB1(HIGH);
 633  0209 ae0001        	ldw	x,#1
 634  020c cd0000        	call	_setDEB1
 636                     ; 402 		setDEB1(LOW);
 638  020f 5f            	clrw	x
 639  0210 cd0000        	call	_setDEB1
 642  0213 aced00ed      	jpf	L701
 674                     ; 411 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 674                     ; 412 {
 676                     	switch	.text
 677  0217               f_TIM1_CAP_IRQHandler:
 679  0217 8a            	push	cc
 680  0218 84            	pop	a
 681  0219 a4bf          	and	a,#191
 682  021b 88            	push	a
 683  021c 86            	pop	cc
 684  021d 3b0002        	push	c_x+2
 685  0220 be00          	ldw	x,c_x
 686  0222 89            	pushw	x
 687  0223 3b0002        	push	c_y+2
 688  0226 be00          	ldw	x,c_y
 689  0228 89            	pushw	x
 692                     ; 416 	byteData[0] = readFastCounter();
 694  0229 cd0000        	call	_readFastCounter
 696  022c b702          	ld	_byteData,a
 697                     ; 417 	byteData[1] = readSlowCounter_byte0();
 699  022e cd0000        	call	_readSlowCounter_byte0
 701  0231 b703          	ld	_byteData+1,a
 702                     ; 418 	byteData[2] = readSlowCounter_byte1();
 704  0233 cd0000        	call	_readSlowCounter_byte1
 706  0236 b704          	ld	_byteData+2,a
 707                     ; 421 	dataAvailable = 1;
 709  0238 ae0001        	ldw	x,#1
 710  023b bf00          	ldw	_dataAvailable,x
 711                     ; 424 	setMR(HIGH);
 713  023d ae0001        	ldw	x,#1
 714  0240 cd0000        	call	_setMR
 716                     ; 425 	setCCLR(HIGH);
 718  0243 ae0001        	ldw	x,#1
 719  0246 cd0000        	call	_setCCLR
 721                     ; 426 	setMR(LOW);
 723  0249 5f            	clrw	x
 724  024a cd0000        	call	_setMR
 726                     ; 427 	setCCLR(LOW);
 728  024d 5f            	clrw	x
 729  024e cd0000        	call	_setCCLR
 731                     ; 430 	setADDR1(HIGH);
 733  0251 ae0001        	ldw	x,#1
 734  0254 cd0000        	call	_setADDR1
 736                     ; 431 	setADDR1(LOW);
 738  0257 5f            	clrw	x
 739  0258 cd0000        	call	_setADDR1
 741                     ; 434 	TIM1 -> SR1 = 0;
 743  025b 725f52b6      	clr	21174
 744                     ; 435 }
 747  025f 85            	popw	x
 748  0260 bf00          	ldw	c_y,x
 749  0262 320002        	pop	c_y+2
 750  0265 85            	popw	x
 751  0266 bf00          	ldw	c_x,x
 752  0268 320002        	pop	c_x+2
 753  026b 80            	iret
 786                     	xdef	f_TIM1_CAP_IRQHandler
 787                     	xdef	_main
 788                     	xdef	_byteData
 789                     	xdef	_dataAvailable
 790                     	xref	_setADDR1
 791                     	xref	_setDEB1
 792                     	xref	_setDE
 793                     	xref	_setLEA
 794                     	xref	_readSlowCounter_byte1
 795                     	xref	_readSlowCounter_byte0
 796                     	xref	_setCCLR
 797                     	xref	_readFastCounter
 798                     	xref	_setMR
 799                     	xref.b	c_x
 800                     	xref.b	c_y
 819                     	xref	c_xymvx
 820                     	end
