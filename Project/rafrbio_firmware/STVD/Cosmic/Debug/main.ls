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
 118                     ; 31 void main(void)
 118                     ; 32 {
 120                     	switch	.text
 121  0000               _main:
 123  0000 520a          	subw	sp,#10
 124       0000000a      OFST:	set	10
 127                     ; 33 	int status = STATUS_IDLE;
 129  0002 5f            	clrw	x
 130  0003 1f01          	ldw	(OFST-9,sp),x
 132                     ; 34 	uint8_t requested_register = 0;
 134                     ; 36 	int send_value = VALUE_NULL;
 136  0005 5f            	clrw	x
 137  0006 1f09          	ldw	(OFST-1,sp),x
 139                     ; 39 	uint8_t dataToSend[3] = {0, 0, 0};
 141  0008 96            	ldw	x,sp
 142  0009 1c0003        	addw	x,#OFST-7
 143  000c 90ae0000      	ldw	y,#L3_dataToSend
 144  0010 a603          	ld	a,#3
 145  0012 cd0000        	call	c_xymvx
 147                     ; 45 	CLK -> ECKCR |= CLK_ECKCR_HSEON;
 149  0015 721050c6      	bset	20678,#0
 150                     ; 57 	CLK -> CKDIVR &= 0b000;
 152  0019 725f50c0      	clr	20672
 153                     ; 64 	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
 155  001d 721250c4      	bset	20676,#1
 156                     ; 67 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 158  0021 721650c3      	bset	20675,#3
 159                     ; 83 	GPIOA -> DDR = 0b01110000;
 161  0025 35705002      	mov	20482,#112
 162                     ; 84 	GPIOA -> CR1 = 0b01110000;
 164  0029 35705003      	mov	20483,#112
 165                     ; 85 	GPIOA -> CR2 = 0b01110000;	
 167  002d 35705004      	mov	20484,#112
 168                     ; 94 	GPIOB -> DDR = 0b00001111;
 170  0031 350f5007      	mov	20487,#15
 171                     ; 95 	GPIOB -> CR1 = 0b00001111;
 173  0035 350f5008      	mov	20488,#15
 174                     ; 96 	GPIOB -> CR2 = 0b00001111;	
 176  0039 350f5009      	mov	20489,#15
 177                     ; 104 	GPIOC -> DDR = 0b00001000;
 179  003d 3508500c      	mov	20492,#8
 180                     ; 105 	GPIOC -> CR1 = 0b01101000;
 182  0041 3568500d      	mov	20493,#104
 183                     ; 106 	GPIOC -> CR2 = 0b00001000;
 185  0045 3508500e      	mov	20494,#8
 186                     ; 117 	GPIOD -> DDR = 0b10010000;
 188  0049 35905011      	mov	20497,#144
 189                     ; 118 	GPIOD -> CR1 = 0b10010000;
 191  004d 35905012      	mov	20498,#144
 192                     ; 119 	GPIOD -> CR2 = 0b10010000;	
 194  0051 35905013      	mov	20499,#144
 195                     ; 131 	GPIOE -> DDR = 0b11000000;
 197  0055 35c05016      	mov	20502,#192
 198                     ; 132 	GPIOE -> CR1 = 0b11000000;
 200  0059 35c05017      	mov	20503,#192
 201                     ; 133 	GPIOE -> CR2 = 0b11000000;	
 203  005d 35c05018      	mov	20504,#192
 204                     ; 141 	TIM1 -> CCR1H = 0xFF;
 206  0061 35ff52c6      	mov	21190,#255
 207                     ; 142 	TIM1 -> CCR1L = 0xFF;
 209  0065 35ff52c7      	mov	21191,#255
 210                     ; 145 	TIM1 -> ARRH = 0xFF;
 212  0069 35ff52c3      	mov	21187,#255
 213                     ; 146 	TIM1 -> ARRL = 0xFF;
 215  006d 35ff52c4      	mov	21188,#255
 216                     ; 149 	TIM1 -> IER |= TIM_IER_CC1IE;
 218  0071 721252b5      	bset	21173,#1
 219                     ; 163 	TIM1 -> CCMR1 = ((uint8_t)0b00110000);
 221  0075 353052b9      	mov	21177,#48
 222                     ; 166 	TIM1 -> CCER1 |= TIM_CCER1_CC1P;
 224  0079 721252bd      	bset	21181,#1
 225                     ; 169 	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
 227  007d 721852bd      	bset	21181,#4
 228                     ; 172 	TIM1-> BKR |= TIM1_BKR_MOE;
 230  0081 721e52ce      	bset	21198,#7
 231                     ; 175 	TIM1 -> SR1 = 0;
 233  0085 725f52b6      	clr	21174
 234                     ; 176 	TIM1 -> CR1 |= TIM_CR1_CEN;
 236  0089 721052b0      	bset	21168,#0
 237                     ; 183 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 239  008d 72115210      	bres	21008,#0
 240                     ; 186 	I2C1 -> FREQR |= ((uint8_t)0b010000);
 242  0091 72185212      	bset	21010,#4
 243                     ; 189 	I2C1 -> OARL = ((uint8_t)0x02);
 245  0095 35025213      	mov	21011,#2
 246                     ; 193 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 248  0099 721c5214      	bset	21012,#6
 249                     ; 196 	I2C1 -> CR1 |= I2C_CR1_PE;
 251  009d 72105210      	bset	21008,#0
 252                     ; 199 	I2C1 -> CR2 |= I2C_CR2_ACK;
 254  00a1 72145211      	bset	21009,#2
 255                     ; 206 	enableInterrupts();
 258  00a5 9a            rim
 260  00a6               L701:
 261                     ; 213 		switch(status)
 263  00a6 1e01          	ldw	x,(OFST-9,sp)
 265                     ; 352 				break;
 266  00a8 5d            	tnzw	x
 267  00a9 270d          	jreq	L5
 268  00ab 5a            	decw	x
 269  00ac 276a          	jreq	L7
 270  00ae 5a            	decw	x
 271  00af 2603          	jrne	L6
 272  00b1 cc013f        	jp	L71
 273  00b4               L6:
 274  00b4 acc201c2      	jpf	L511
 275  00b8               L5:
 276                     ; 215 			case(STATUS_IDLE):
 276                     ; 216 			sr1_value = I2C1 -> SR1;
 278  00b8 c65217        	ld	a,21015
 279  00bb 6b06          	ld	(OFST-4,sp),a
 281                     ; 218 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 283  00bd 7b06          	ld	a,(OFST-4,sp)
 284  00bf a540          	bcp	a,#64
 285  00c1 2707          	jreq	L711
 286                     ; 220 					status = STATUS_RX;
 288  00c3 ae0001        	ldw	x,#1
 289  00c6 1f01          	ldw	(OFST-9,sp),x
 292  00c8 200b          	jra	L121
 293  00ca               L711:
 294                     ; 222 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 296  00ca 7b06          	ld	a,(OFST-4,sp)
 297  00cc a580          	bcp	a,#128
 298  00ce 2705          	jreq	L121
 299                     ; 224 					status = STATUS_TX;
 301  00d0 ae0002        	ldw	x,#2
 302  00d3 1f01          	ldw	(OFST-9,sp),x
 304  00d5               L121:
 305                     ; 227 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 307  00d5 7b06          	ld	a,(OFST-4,sp)
 308  00d7 a502          	bcp	a,#2
 309  00d9 270a          	jreq	L521
 310                     ; 230 					tmp = I2C1 -> SR1;
 312  00db c65217        	ld	a,21015
 313  00de 5f            	clrw	x
 314  00df 97            	ld	xl,a
 315                     ; 231 					tmp = I2C1 -> SR3;
 317  00e0 c65219        	ld	a,21017
 318  00e3 5f            	clrw	x
 319  00e4 97            	ld	xl,a
 320  00e5               L521:
 321                     ; 234 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 323  00e5 7b06          	ld	a,(OFST-4,sp)
 324  00e7 a510          	bcp	a,#16
 325  00e9 2709          	jreq	L721
 326                     ; 237 					tmp = I2C1 -> SR1;
 328  00eb c65217        	ld	a,21015
 329  00ee 5f            	clrw	x
 330  00ef 97            	ld	xl,a
 331                     ; 238 					I2C1 -> CR2 |= I2C_CR2_ACK;
 333  00f0 72145211      	bset	21009,#2
 334  00f4               L721:
 335                     ; 241 				if( ((I2C1 -> SR2) & I2C_SR2_AF ) != 0 ) /* Stop TX */
 337  00f4 c65218        	ld	a,21016
 338  00f7 a504          	bcp	a,#4
 339  00f9 2704          	jreq	L131
 340                     ; 244 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 342  00fb 72155218      	bres	21016,#2
 343  00ff               L131:
 344                     ; 247 				if( dataAvailable == 1)
 346  00ff be00          	ldw	x,_dataAvailable
 347  0101 a30001        	cpw	x,#1
 348  0104 260a          	jrne	L331
 349                     ; 250 					setDE(HIGH);
 351  0106 ae0001        	ldw	x,#1
 352  0109 cd0000        	call	_setDE
 355  010c acc201c2      	jpf	L511
 356  0110               L331:
 357                     ; 254 					setDE(LOW);
 359  0110 5f            	clrw	x
 360  0111 cd0000        	call	_setDE
 362  0114 acc201c2      	jpf	L511
 363  0118               L7:
 364                     ; 259 			case(STATUS_RX):
 364                     ; 260 				requested_register = I2C1 -> DR;
 366  0118 c65216        	ld	a,21014
 367  011b 6b06          	ld	(OFST-4,sp),a
 369                     ; 262 				switch(requested_register)
 371  011d 7b06          	ld	a,(OFST-4,sp)
 373                     ; 274 						break;
 374  011f 4a            	dec	a
 375  0120 270a          	jreq	L11
 376  0122 4a            	dec	a
 377  0123 270e          	jreq	L31
 378  0125               L51:
 379                     ; 272 					default:
 379                     ; 273 						send_value = VALUE_NOREGISTER;
 381  0125 ae0006        	ldw	x,#6
 382  0128 1f09          	ldw	(OFST-1,sp),x
 384                     ; 274 						break;
 386  012a 200c          	jra	L141
 387  012c               L11:
 388                     ; 264 					case(ADD_DATA0):
 388                     ; 265 						send_value = VALUE_DATA0_BYTE0;						
 390  012c ae0001        	ldw	x,#1
 391  012f 1f09          	ldw	(OFST-1,sp),x
 393                     ; 266 						break;
 395  0131 2005          	jra	L141
 396  0133               L31:
 397                     ; 268 					case(ADD_TEST1):
 397                     ; 269 						send_value = VALUE_TEST1;
 399  0133 ae0005        	ldw	x,#5
 400  0136 1f09          	ldw	(OFST-1,sp),x
 402                     ; 270 						break;
 404  0138               L141:
 405                     ; 277 				status = STATUS_IDLE;
 407  0138 5f            	clrw	x
 408  0139 1f01          	ldw	(OFST-9,sp),x
 410                     ; 278 				break;
 412  013b acc201c2      	jpf	L511
 413  013f               L71:
 414                     ; 280 			case(STATUS_TX):
 414                     ; 281 				switch(send_value)
 416  013f 1e09          	ldw	x,(OFST-1,sp)
 418                     ; 347 						break;
 419  0141 5d            	tnzw	x
 420  0142 277b          	jreq	L541
 421  0144 5a            	decw	x
 422  0145 271c          	jreq	L32
 423  0147 5a            	decw	x
 424  0148 273b          	jreq	L52
 425  014a 5a            	decw	x
 426  014b 2749          	jreq	L72
 427  014d 1d0002        	subw	x,#2
 428  0150 2753          	jreq	L13
 429  0152 5a            	decw	x
 430  0153 275e          	jreq	L33
 431  0155               L53:
 432                     ; 342 					default:
 432                     ; 343 						//ERROR!
 432                     ; 344 						tmp = I2C1 -> SR1;
 434  0155 c65217        	ld	a,21015
 435  0158 5f            	clrw	x
 436  0159 97            	ld	xl,a
 437                     ; 345 						I2C1 -> DR = ((uint8_t)0x00);
 439  015a 725f5216      	clr	21014
 440                     ; 346 						send_value = VALUE_NULL;
 442  015e 5f            	clrw	x
 443  015f 1f09          	ldw	(OFST-1,sp),x
 445                     ; 347 						break;
 447  0161 205c          	jra	L541
 448  0163               L32:
 449                     ; 286 					case(VALUE_DATA0_BYTE0):
 449                     ; 287 						tmp = I2C1 -> SR1;
 451  0163 c65217        	ld	a,21015
 452  0166 5f            	clrw	x
 453  0167 97            	ld	xl,a
 454                     ; 290 						disableInterrupts();
 457  0168 9b            sim
 459                     ; 293 						dataToSend[0] = byteData[0];
 462  0169 b602          	ld	a,_byteData
 463  016b 6b03          	ld	(OFST-7,sp),a
 465                     ; 294 						dataToSend[1] = byteData[1];
 467  016d b603          	ld	a,_byteData+1
 468  016f 6b04          	ld	(OFST-6,sp),a
 470                     ; 295 						dataToSend[2] = byteData[2];
 472  0171 b604          	ld	a,_byteData+2
 473  0173 6b05          	ld	(OFST-5,sp),a
 475                     ; 298 						enableInterrupts();
 478  0175 9a            rim
 480                     ; 301 						dataAvailable = 0;
 483  0176 5f            	clrw	x
 484  0177 bf00          	ldw	_dataAvailable,x
 485                     ; 304 						I2C1 -> DR = dataToSend[0];
 487  0179 7b03          	ld	a,(OFST-7,sp)
 488  017b c75216        	ld	21014,a
 489                     ; 307 						send_value = VALUE_DATA0_BYTE1;
 491  017e ae0002        	ldw	x,#2
 492  0181 1f09          	ldw	(OFST-1,sp),x
 494                     ; 308 						break;
 496  0183 203a          	jra	L541
 497  0185               L52:
 498                     ; 310 					case(VALUE_DATA0_BYTE1):
 498                     ; 311 						tmp = I2C1 -> SR1;
 500  0185 c65217        	ld	a,21015
 501  0188 5f            	clrw	x
 502  0189 97            	ld	xl,a
 503                     ; 314 						I2C1 -> DR = dataToSend[1];
 505  018a 7b04          	ld	a,(OFST-6,sp)
 506  018c c75216        	ld	21014,a
 507                     ; 317 						send_value = VALUE_DATA0_BYTE2;
 509  018f ae0003        	ldw	x,#3
 510  0192 1f09          	ldw	(OFST-1,sp),x
 512                     ; 318 						break;
 514  0194 2029          	jra	L541
 515  0196               L72:
 516                     ; 320 					case(VALUE_DATA0_BYTE2):
 516                     ; 321 						tmp = I2C1 -> SR1;
 518  0196 c65217        	ld	a,21015
 519  0199 5f            	clrw	x
 520  019a 97            	ld	xl,a
 521                     ; 324 						I2C1 -> DR = dataToSend[2];
 523  019b 7b05          	ld	a,(OFST-5,sp)
 524  019d c75216        	ld	21014,a
 525                     ; 327 						send_value = VALUE_NULL;
 527  01a0 5f            	clrw	x
 528  01a1 1f09          	ldw	(OFST-1,sp),x
 530                     ; 328 						break;
 532  01a3 201a          	jra	L541
 533  01a5               L13:
 534                     ; 330 					case(VALUE_TEST1):
 534                     ; 331 						tmp = I2C1 -> SR1;
 536  01a5 c65217        	ld	a,21015
 537  01a8 5f            	clrw	x
 538  01a9 97            	ld	xl,a
 539                     ; 332 						I2C1 -> DR = ((uint8_t)0x54);
 541  01aa 35545216      	mov	21014,#84
 542                     ; 333 						send_value = VALUE_NULL;
 544  01ae 5f            	clrw	x
 545  01af 1f09          	ldw	(OFST-1,sp),x
 547                     ; 334 						break;
 549  01b1 200c          	jra	L541
 550  01b3               L33:
 551                     ; 336 					case(VALUE_NOREGISTER):
 551                     ; 337 						tmp = I2C1 -> SR1;
 553  01b3 c65217        	ld	a,21015
 554  01b6 5f            	clrw	x
 555  01b7 97            	ld	xl,a
 556                     ; 338 						I2C1 -> DR = ((uint8_t)0x00);
 558  01b8 725f5216      	clr	21014
 559                     ; 339 						send_value = VALUE_NULL;
 561  01bc 5f            	clrw	x
 562  01bd 1f09          	ldw	(OFST-1,sp),x
 564                     ; 340 						break;
 566  01bf               L541:
 567                     ; 351 				status = STATUS_IDLE;
 569  01bf 5f            	clrw	x
 570  01c0 1f01          	ldw	(OFST-9,sp),x
 572                     ; 352 				break;
 574  01c2               L511:
 575                     ; 357 		setDEB2(HIGH);
 577  01c2 ae0001        	ldw	x,#1
 578  01c5 cd0000        	call	_setDEB2
 580                     ; 358 		setDEB2(LOW);
 582  01c8 5f            	clrw	x
 583  01c9 cd0000        	call	_setDEB2
 586  01cc aca600a6      	jpf	L701
 618                     ; 367 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 618                     ; 368 {
 620                     	switch	.text
 621  01d0               f_TIM1_CAP_IRQHandler:
 623  01d0 8a            	push	cc
 624  01d1 84            	pop	a
 625  01d2 a4bf          	and	a,#191
 626  01d4 88            	push	a
 627  01d5 86            	pop	cc
 628  01d6 3b0002        	push	c_x+2
 629  01d9 be00          	ldw	x,c_x
 630  01db 89            	pushw	x
 631  01dc 3b0002        	push	c_y+2
 632  01df be00          	ldw	x,c_y
 633  01e1 89            	pushw	x
 636                     ; 372 	byteData[0] = readFastCounter();
 638  01e2 cd0000        	call	_readFastCounter
 640  01e5 b702          	ld	_byteData,a
 641                     ; 373 	byteData[1] = readSlowCounter_byte0();
 643  01e7 cd0000        	call	_readSlowCounter_byte0
 645  01ea b703          	ld	_byteData+1,a
 646                     ; 374 	byteData[2] = readSlowCounter_byte1();
 648  01ec cd0000        	call	_readSlowCounter_byte1
 650  01ef b704          	ld	_byteData+2,a
 651                     ; 377 	dataAvailable = 1;
 653  01f1 ae0001        	ldw	x,#1
 654  01f4 bf00          	ldw	_dataAvailable,x
 655                     ; 380 	setMR(HIGH);
 657  01f6 ae0001        	ldw	x,#1
 658  01f9 cd0000        	call	_setMR
 660                     ; 381 	setCCLR(HIGH);
 662  01fc ae0001        	ldw	x,#1
 663  01ff cd0000        	call	_setCCLR
 665                     ; 382 	setMR(LOW);
 667  0202 5f            	clrw	x
 668  0203 cd0000        	call	_setMR
 670                     ; 383 	setCCLR(LOW);
 672  0206 5f            	clrw	x
 673  0207 cd0000        	call	_setCCLR
 675                     ; 386 	setDEB1(HIGH);
 677  020a ae0001        	ldw	x,#1
 678  020d cd0000        	call	_setDEB1
 680                     ; 387 	setDEB1(LOW);
 682  0210 5f            	clrw	x
 683  0211 cd0000        	call	_setDEB1
 685                     ; 390 	TIM2 -> SR1 = 0;
 687  0214 725f5256      	clr	21078
 688                     ; 392 }
 691  0218 85            	popw	x
 692  0219 bf00          	ldw	c_y,x
 693  021b 320002        	pop	c_y+2
 694  021e 85            	popw	x
 695  021f bf00          	ldw	c_x,x
 696  0221 320002        	pop	c_x+2
 697  0224 80            	iret
 730                     	xdef	f_TIM1_CAP_IRQHandler
 731                     	xdef	_main
 732                     	xdef	_byteData
 733                     	xdef	_dataAvailable
 734                     	xref	_setDEB2
 735                     	xref	_setDEB1
 736                     	xref	_setDE
 737                     	xref	_readSlowCounter_byte1
 738                     	xref	_readSlowCounter_byte0
 739                     	xref	_setCCLR
 740                     	xref	_readFastCounter
 741                     	xref	_setMR
 742                     	xref.b	c_x
 743                     	xref.b	c_y
 762                     	xref	c_xymvx
 763                     	end
