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
 131                     ; 38 void main(void)
 131                     ; 39 {
 133                     	switch	.text
 134  0000               _main:
 136  0000 520b          	subw	sp,#11
 137       0000000b      OFST:	set	11
 140                     ; 40 	int status = STATUS_IDLE;
 142  0002 5f            	clrw	x
 143  0003 1f02          	ldw	(OFST-9,sp),x
 145                     ; 41 	uint8_t requested_register = 0;
 147                     ; 43 	int send_value = VALUE_NULL;
 149  0005 5f            	clrw	x
 150  0006 1f0a          	ldw	(OFST-1,sp),x
 152                     ; 46 	uint8_t dataToSend[3] = {0, 0, 0};
 154  0008 96            	ldw	x,sp
 155  0009 1c0004        	addw	x,#OFST-7
 156  000c 90ae0000      	ldw	y,#L3_dataToSend
 157  0010 a603          	ld	a,#3
 158  0012 cd0000        	call	c_xymvx
 160                     ; 56 	CLK -> ICKCR != CLK_ICKCR_HSION;
 162  0015 c650c2        	ld	a,20674
 163  0018 a101          	cp	a,#1
 164  001a 2705          	jreq	L6
 165  001c ae0001        	ldw	x,#1
 166  001f 2001          	jra	L01
 167  0021               L6:
 168  0021 5f            	clrw	x
 169  0022               L01:
 170                     ; 67 	CLK -> CKDIVR &= 0b000;
 172  0022 725f50c0      	clr	20672
 173                     ; 74 	CLK -> PCKENR2 |= CLK_PCKENR2_TIM1;
 175  0026 721250c4      	bset	20676,#1
 176                     ; 77 	CLK -> PCKENR1 |= CLK_PCKENR1_I2C1;
 178  002a 721650c3      	bset	20675,#3
 179                     ; 80 	CLK -> PCKENR1 |= CLK_PCKENR1_DAC;
 181  002e 721e50c3      	bset	20675,#7
 182                     ; 96 	GPIOA -> DDR = 0b01110000;
 184  0032 35705002      	mov	20482,#112
 185                     ; 97 	GPIOA -> CR1 = 0b01110000;
 187  0036 35705003      	mov	20483,#112
 188                     ; 98 	GPIOA -> CR2 = 0b01110000;	
 190  003a 35705004      	mov	20484,#112
 191                     ; 107 	GPIOB -> DDR = 0b00001111;
 193  003e 350f5007      	mov	20487,#15
 194                     ; 108 	GPIOB -> CR1 = 0b00001111;
 196  0042 350f5008      	mov	20488,#15
 197                     ; 109 	GPIOB -> CR2 = 0b00001111;	
 199  0046 350f5009      	mov	20489,#15
 200                     ; 117 	GPIOC -> DDR = 0b01101000;
 202  004a 3568500c      	mov	20492,#104
 203                     ; 118 	GPIOC -> CR1 = 0b01101000;
 205  004e 3568500d      	mov	20493,#104
 206                     ; 119 	GPIOC -> CR2 = 0b00001000;
 208  0052 3508500e      	mov	20494,#8
 209                     ; 130 	GPIOD -> DDR = 0b10010000;
 211  0056 35905011      	mov	20497,#144
 212                     ; 131 	GPIOD -> CR1 = 0b10010000;
 214  005a 35905012      	mov	20498,#144
 215                     ; 132 	GPIOD -> CR2 = 0b00000000;	
 217  005e 725f5013      	clr	20499
 218                     ; 144 	GPIOE -> DDR = 0b11000000;
 220  0062 35c05016      	mov	20502,#192
 221                     ; 145 	GPIOE -> CR1 = 0b11000000;
 223  0066 35c05017      	mov	20503,#192
 224                     ; 146 	GPIOE -> CR2 = 0b00000000;	
 226  006a 725f5018      	clr	20504
 227                     ; 152 	GPIOF -> DDR = 0b00000001;
 229  006e 3501501b      	mov	20507,#1
 230                     ; 153 	GPIOF -> CR1 = 0b00000001;
 232  0072 3501501c      	mov	20508,#1
 233                     ; 154 	GPIOF -> CR2 = 0b00000000;	
 235  0076 725f501d      	clr	20509
 236                     ; 161 	DAC -> CH1CR1 |= DAC_CR1_EN;
 238  007a 72105380      	bset	21376,#0
 239                     ; 164 	DAC -> CH1DHR8 = ((uint8_t)DAC_VALUE);
 241  007e 35015390      	mov	21392,#1
 242                     ; 167 	setTH(LOW);
 244  0082 5f            	clrw	x
 245  0083 cd0000        	call	_setTH
 247                     ; 173 	TIM1 -> CCR1H = 0xFF;
 249  0086 35ff52c6      	mov	21190,#255
 250                     ; 174 	TIM1 -> CCR1L = 0xFF;
 252  008a 35ff52c7      	mov	21191,#255
 253                     ; 177 	TIM1 -> ARRH = 0xFF;
 255  008e 35ff52c3      	mov	21187,#255
 256                     ; 178 	TIM1 -> ARRL = 0xFF;
 258  0092 35ff52c4      	mov	21188,#255
 259                     ; 181 	TIM1 -> IER |= TIM_IER_CC2IE;
 261  0096 721452b5      	bset	21173,#2
 262                     ; 195 	TIM1 -> CCMR2 = ((uint8_t)0b00110000);
 264  009a 353052ba      	mov	21178,#48
 265                     ; 198 	TIM1 -> CCER1 |= TIM_CCER1_CC2P;
 267  009e 721a52bd      	bset	21181,#5
 268                     ; 201 	TIM1 -> CCER1 |= TIM_CCER1_CC2E;
 270  00a2 721852bd      	bset	21181,#4
 271                     ; 204 	TIM1-> BKR |= TIM1_BKR_MOE;
 273  00a6 721e52ce      	bset	21198,#7
 274                     ; 207 	TIM1 -> SR1 = 0;
 276  00aa 725f52b6      	clr	21174
 277                     ; 208 	TIM1 -> CR1 |= TIM_CR1_CEN;
 279  00ae 721052b0      	bset	21168,#0
 280                     ; 215 	I2C1->CR1 = I2C_CR1_RESET_VALUE;
 282  00b2 725f5210      	clr	21008
 283                     ; 216 	I2C1->CR2 = I2C_CR2_RESET_VALUE;
 285  00b6 725f5211      	clr	21009
 286                     ; 217 	I2C1->FREQR = I2C_FREQR_RESET_VALUE;
 288  00ba 725f5212      	clr	21010
 289                     ; 218 	I2C1->OARL = I2C_OARL_RESET_VALUE;
 291  00be 725f5213      	clr	21011
 292                     ; 219 	I2C1->OARH = I2C_OARH_RESET_VALUE;
 294  00c2 725f5214      	clr	21012
 295                     ; 220 	I2C1->OAR2 = I2C_OAR2_RESET_VALUE;
 297  00c6 725f5215      	clr	21013
 298                     ; 221 	I2C1->ITR = I2C_ITR_RESET_VALUE;
 300  00ca 725f521a      	clr	21018
 301                     ; 222 	I2C1->CCRL = I2C_CCRL_RESET_VALUE;
 303  00ce 725f521b      	clr	21019
 304                     ; 223 	I2C1->CCRH = I2C_CCRH_RESET_VALUE;
 306  00d2 725f521c      	clr	21020
 307                     ; 224 	I2C1->TRISER = I2C_TRISER_RESET_VALUE;
 309  00d6 3502521d      	mov	21021,#2
 310                     ; 228 	I2C1 -> FREQR |= ((uint8_t)0b00010000);
 312  00da 72185212      	bset	21010,#4
 313                     ; 231 	I2C1 -> CR1 &= ~I2C_CR1_PE;
 315  00de 72115210      	bres	21008,#0
 316                     ; 234 	I2C1 -> CR2 |= I2C_CR2_ACK;
 318  00e2 72145211      	bset	21009,#2
 319                     ; 238 	I2C1 -> OARL = ((uint8_t)0b00000010);
 321  00e6 35025213      	mov	21011,#2
 322                     ; 241 	I2C1 -> OARH &= ~I2C_OARH_ADDMODE;
 324  00ea 721f5214      	bres	21012,#7
 325                     ; 243 	I2C1 -> OARH |= I2C_OARH_ADDCONF;
 327  00ee 721c5214      	bset	21012,#6
 328                     ; 246 	I2C1 -> CR1 |= I2C_CR1_PE;
 330  00f2 72105210      	bset	21008,#0
 331                     ; 252 	I2C1 -> SR2 &= ~(I2C_SR2_AF);
 333  00f6 72155218      	bres	21016,#2
 334                     ; 258 	enableInterrupts();
 337  00fa 9a            rim
 339                     ; 262 	setLEA(HIGH);
 342  00fb ae0001        	ldw	x,#1
 343  00fe cd0000        	call	_setLEA
 345  0101               L311:
 346                     ; 268 		switch(status)
 348  0101 1e02          	ldw	x,(OFST-9,sp)
 350                     ; 423 				break;
 351  0103 5d            	tnzw	x
 352  0104 270b          	jreq	L5
 353  0106 5a            	decw	x
 354  0107 2776          	jreq	L7
 355  0109 5a            	decw	x
 356  010a 2603          	jrne	L21
 357  010c cc01b0        	jp	L71
 358  010f               L21:
 359  010f 20f0          	jra	L311
 360  0111               L5:
 361                     ; 270 			case(STATUS_IDLE):
 361                     ; 271 				sr1_value = I2C1 -> SR1;
 363  0111 c65217        	ld	a,21015
 364  0114 6b07          	ld	(OFST-4,sp),a
 366                     ; 272 				sr2_value = I2C1 -> SR2;
 368  0116 c65218        	ld	a,21016
 369  0119 6b01          	ld	(OFST-10,sp),a
 371                     ; 273 				I2C1 -> CR2 |= I2C_CR2_ACK;
 373  011b 72145211      	bset	21009,#2
 374                     ; 276 				setADDR0(HIGH);
 376  011f ae0001        	ldw	x,#1
 377  0122 cd0000        	call	_setADDR0
 379                     ; 277 				setADDR0(LOW);
 381  0125 5f            	clrw	x
 382  0126 cd0000        	call	_setADDR0
 384                     ; 279 				if( (sr1_value & I2C_SR1_RXNE) != 0 ) /* RX start */
 386  0129 7b07          	ld	a,(OFST-4,sp)
 387  012b a540          	bcp	a,#64
 388  012d 2707          	jreq	L321
 389                     ; 282 					status = STATUS_RX;
 391  012f ae0001        	ldw	x,#1
 392  0132 1f02          	ldw	(OFST-9,sp),x
 395  0134 200b          	jra	L521
 396  0136               L321:
 397                     ; 284 				else if( (sr1_value & I2C_SR1_TXE) != 0 ) /* TX start */
 399  0136 7b07          	ld	a,(OFST-4,sp)
 400  0138 a580          	bcp	a,#128
 401  013a 2705          	jreq	L521
 402                     ; 286 					status = STATUS_TX;
 404  013c ae0002        	ldw	x,#2
 405  013f 1f02          	ldw	(OFST-9,sp),x
 407  0141               L521:
 408                     ; 289 				if( (sr1_value & I2C_SR1_ADDR) != 0 ) /* Address recognised */
 410  0141 7b07          	ld	a,(OFST-4,sp)
 411  0143 a502          	bcp	a,#2
 412  0145 270a          	jreq	L131
 413                     ; 292 					tmp = I2C1 -> SR1;
 415  0147 c65217        	ld	a,21015
 416  014a 5f            	clrw	x
 417  014b 97            	ld	xl,a
 418                     ; 293 					tmp = I2C1 -> SR3;
 420  014c c65219        	ld	a,21017
 421  014f 5f            	clrw	x
 422  0150 97            	ld	xl,a
 423  0151               L131:
 424                     ; 296 				if( (sr1_value & I2C_SR1_STOPF) != 0 ) /* Stop RX */
 426  0151 7b07          	ld	a,(OFST-4,sp)
 427  0153 a510          	bcp	a,#16
 428  0155 2709          	jreq	L331
 429                     ; 300 					tmp = I2C1 -> SR1;
 431  0157 c65217        	ld	a,21015
 432  015a 5f            	clrw	x
 433  015b 97            	ld	xl,a
 434                     ; 301 					I2C1 -> CR2 |= I2C_CR2_ACK;
 436  015c 72145211      	bset	21009,#2
 437  0160               L331:
 438                     ; 304 				if( (sr2_value & I2C_SR2_AF ) != 0 ) /* Stop TX */
 440  0160 7b01          	ld	a,(OFST-10,sp)
 441  0162 a504          	bcp	a,#4
 442  0164 2704          	jreq	L531
 443                     ; 307 					I2C1 -> SR2 &= ~(I2C_SR2_AF);
 445  0166 72155218      	bres	21016,#2
 446  016a               L531:
 447                     ; 310 				if( dataAvailable == 1)
 449  016a be00          	ldw	x,_dataAvailable
 450  016c a30001        	cpw	x,#1
 451  016f 2608          	jrne	L731
 452                     ; 313 					setDE(HIGH);
 454  0171 ae0001        	ldw	x,#1
 455  0174 cd0000        	call	_setDE
 458  0177 2088          	jra	L311
 459  0179               L731:
 460                     ; 317 					setDE(LOW);
 462  0179 5f            	clrw	x
 463  017a cd0000        	call	_setDE
 465  017d 2082          	jra	L311
 466  017f               L7:
 467                     ; 322 			case(STATUS_RX):
 467                     ; 323 				requested_register = I2C1 -> DR;
 469  017f c65216        	ld	a,21014
 470  0182 6b07          	ld	(OFST-4,sp),a
 472                     ; 325 				setDEB1(HIGH);
 474  0184 ae0001        	ldw	x,#1
 475  0187 cd0000        	call	_setDEB1
 477                     ; 326 				setDEB1(LOW);
 479  018a 5f            	clrw	x
 480  018b cd0000        	call	_setDEB1
 482                     ; 329 				switch(requested_register)
 484  018e 7b07          	ld	a,(OFST-4,sp)
 486                     ; 341 						break;
 487  0190 4a            	dec	a
 488  0191 270a          	jreq	L11
 489  0193 4a            	dec	a
 490  0194 270e          	jreq	L31
 491  0196               L51:
 492                     ; 339 					default:
 492                     ; 340 						send_value = VALUE_NOREGISTER;
 494  0196 ae0006        	ldw	x,#6
 495  0199 1f0a          	ldw	(OFST-1,sp),x
 497                     ; 341 						break;
 499  019b 200c          	jra	L541
 500  019d               L11:
 501                     ; 331 					case(ADD_DATA0):
 501                     ; 332 						send_value = VALUE_DATA0_BYTE0;						
 503  019d ae0001        	ldw	x,#1
 504  01a0 1f0a          	ldw	(OFST-1,sp),x
 506                     ; 333 						break;
 508  01a2 2005          	jra	L541
 509  01a4               L31:
 510                     ; 335 					case(ADD_TEST1):
 510                     ; 336 						send_value = VALUE_TEST1;
 512  01a4 ae0005        	ldw	x,#5
 513  01a7 1f0a          	ldw	(OFST-1,sp),x
 515                     ; 337 						break;
 517  01a9               L541:
 518                     ; 344 				status = STATUS_IDLE;
 520  01a9 5f            	clrw	x
 521  01aa 1f02          	ldw	(OFST-9,sp),x
 523                     ; 345 				break;
 525  01ac ac010101      	jpf	L311
 526  01b0               L71:
 527                     ; 347 			case(STATUS_TX):
 527                     ; 348 				//DEBUG
 527                     ; 349 				setADDR1(HIGH);
 529  01b0 ae0001        	ldw	x,#1
 530  01b3 cd0000        	call	_setADDR1
 532                     ; 350 				setADDR1(LOW);
 534  01b6 5f            	clrw	x
 535  01b7 cd0000        	call	_setADDR1
 537                     ; 352 				switch(send_value)
 539  01ba 1e0a          	ldw	x,(OFST-1,sp)
 541                     ; 418 						break;
 542  01bc 5d            	tnzw	x
 543  01bd 277b          	jreq	L151
 544  01bf 5a            	decw	x
 545  01c0 271c          	jreq	L32
 546  01c2 5a            	decw	x
 547  01c3 273b          	jreq	L52
 548  01c5 5a            	decw	x
 549  01c6 2749          	jreq	L72
 550  01c8 1d0002        	subw	x,#2
 551  01cb 2753          	jreq	L13
 552  01cd 5a            	decw	x
 553  01ce 275e          	jreq	L33
 554  01d0               L53:
 555                     ; 413 					default:
 555                     ; 414 						//ERROR!
 555                     ; 415 						tmp = I2C1 -> SR1;
 557  01d0 c65217        	ld	a,21015
 558  01d3 5f            	clrw	x
 559  01d4 97            	ld	xl,a
 560                     ; 416 						I2C1 -> DR = ((uint8_t)0x00);
 562  01d5 725f5216      	clr	21014
 563                     ; 417 						send_value = VALUE_NULL;
 565  01d9 5f            	clrw	x
 566  01da 1f0a          	ldw	(OFST-1,sp),x
 568                     ; 418 						break;
 570  01dc 205c          	jra	L151
 571  01de               L32:
 572                     ; 357 					case(VALUE_DATA0_BYTE0):
 572                     ; 358 						tmp = I2C1 -> SR1;
 574  01de c65217        	ld	a,21015
 575  01e1 5f            	clrw	x
 576  01e2 97            	ld	xl,a
 577                     ; 361 						disableInterrupts();
 580  01e3 9b            sim
 582                     ; 364 						dataToSend[0] = byteData[0];
 585  01e4 b602          	ld	a,_byteData
 586  01e6 6b04          	ld	(OFST-7,sp),a
 588                     ; 365 						dataToSend[1] = byteData[1];
 590  01e8 b603          	ld	a,_byteData+1
 591  01ea 6b05          	ld	(OFST-6,sp),a
 593                     ; 366 						dataToSend[2] = byteData[2];
 595  01ec b604          	ld	a,_byteData+2
 596  01ee 6b06          	ld	(OFST-5,sp),a
 598                     ; 369 						enableInterrupts();
 601  01f0 9a            rim
 603                     ; 372 						dataAvailable = 0;
 606  01f1 5f            	clrw	x
 607  01f2 bf00          	ldw	_dataAvailable,x
 608                     ; 375 						I2C1 -> DR = dataToSend[0];
 610  01f4 7b04          	ld	a,(OFST-7,sp)
 611  01f6 c75216        	ld	21014,a
 612                     ; 378 						send_value = VALUE_DATA0_BYTE1;
 614  01f9 ae0002        	ldw	x,#2
 615  01fc 1f0a          	ldw	(OFST-1,sp),x
 617                     ; 379 						break;
 619  01fe 203a          	jra	L151
 620  0200               L52:
 621                     ; 381 					case(VALUE_DATA0_BYTE1):
 621                     ; 382 						tmp = I2C1 -> SR1;
 623  0200 c65217        	ld	a,21015
 624  0203 5f            	clrw	x
 625  0204 97            	ld	xl,a
 626                     ; 385 						I2C1 -> DR = dataToSend[1];
 628  0205 7b05          	ld	a,(OFST-6,sp)
 629  0207 c75216        	ld	21014,a
 630                     ; 388 						send_value = VALUE_DATA0_BYTE2;
 632  020a ae0003        	ldw	x,#3
 633  020d 1f0a          	ldw	(OFST-1,sp),x
 635                     ; 389 						break;
 637  020f 2029          	jra	L151
 638  0211               L72:
 639                     ; 391 					case(VALUE_DATA0_BYTE2):
 639                     ; 392 						tmp = I2C1 -> SR1;
 641  0211 c65217        	ld	a,21015
 642  0214 5f            	clrw	x
 643  0215 97            	ld	xl,a
 644                     ; 395 						I2C1 -> DR = dataToSend[2];
 646  0216 7b06          	ld	a,(OFST-5,sp)
 647  0218 c75216        	ld	21014,a
 648                     ; 398 						send_value = VALUE_NULL;
 650  021b 5f            	clrw	x
 651  021c 1f0a          	ldw	(OFST-1,sp),x
 653                     ; 399 						break;
 655  021e 201a          	jra	L151
 656  0220               L13:
 657                     ; 401 					case(VALUE_TEST1):
 657                     ; 402 						tmp = I2C1 -> SR1;
 659  0220 c65217        	ld	a,21015
 660  0223 5f            	clrw	x
 661  0224 97            	ld	xl,a
 662                     ; 403 						I2C1 -> DR = ((uint8_t)0x54);
 664  0225 35545216      	mov	21014,#84
 665                     ; 404 						send_value = VALUE_NULL;
 667  0229 5f            	clrw	x
 668  022a 1f0a          	ldw	(OFST-1,sp),x
 670                     ; 405 						break;
 672  022c 200c          	jra	L151
 673  022e               L33:
 674                     ; 407 					case(VALUE_NOREGISTER):
 674                     ; 408 						tmp = I2C1 -> SR1;
 676  022e c65217        	ld	a,21015
 677  0231 5f            	clrw	x
 678  0232 97            	ld	xl,a
 679                     ; 409 						I2C1 -> DR = ((uint8_t)0x00);
 681  0233 725f5216      	clr	21014
 682                     ; 410 						send_value = VALUE_NULL;
 684  0237 5f            	clrw	x
 685  0238 1f0a          	ldw	(OFST-1,sp),x
 687                     ; 411 						break;
 689  023a               L151:
 690                     ; 422 				status = STATUS_IDLE;
 692  023a 5f            	clrw	x
 693  023b 1f02          	ldw	(OFST-9,sp),x
 695                     ; 423 				break;
 697  023d ac010101      	jpf	L311
 698  0241               L121:
 700  0241 ac010101      	jpf	L311
 742                     ; 436 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 742                     ; 437 {
 744                     	switch	.text
 745  0245               f_TIM1_CAP_IRQHandler:
 747  0245 8a            	push	cc
 748  0246 84            	pop	a
 749  0247 a4bf          	and	a,#191
 750  0249 88            	push	a
 751  024a 86            	pop	cc
 752       00000002      OFST:	set	2
 753  024b 3b0002        	push	c_x+2
 754  024e be00          	ldw	x,c_x
 755  0250 89            	pushw	x
 756  0251 3b0002        	push	c_y+2
 757  0254 be00          	ldw	x,c_y
 758  0256 89            	pushw	x
 759  0257 89            	pushw	x
 762                     ; 441 	byteData[0] = readFastCounter();
 764  0258 cd0000        	call	_readFastCounter
 766  025b b702          	ld	_byteData,a
 767                     ; 442 	byteData[1] = readSlowCounter_byte0();
 769  025d cd0000        	call	_readSlowCounter_byte0
 771  0260 b703          	ld	_byteData+1,a
 772                     ; 443 	byteData[2] = readSlowCounter_byte1();
 774  0262 cd0000        	call	_readSlowCounter_byte1
 776  0265 b704          	ld	_byteData+2,a
 777                     ; 446 	dataAvailable = 1;
 779  0267 ae0001        	ldw	x,#1
 780  026a bf00          	ldw	_dataAvailable,x
 781                     ; 449 	setMR(HIGH);
 783  026c ae0001        	ldw	x,#1
 784  026f cd0000        	call	_setMR
 786                     ; 450 	setCCLR(HIGH);
 788  0272 ae0001        	ldw	x,#1
 789  0275 cd0000        	call	_setCCLR
 791                     ; 453 	for(i=0;i<100;i++);
 793  0278 5f            	clrw	x
 794  0279 1f01          	ldw	(OFST-1,sp),x
 796  027b               L171:
 800  027b 1e01          	ldw	x,(OFST-1,sp)
 801  027d 1c0001        	addw	x,#1
 802  0280 1f01          	ldw	(OFST-1,sp),x
 806  0282 9c            	rvf
 807  0283 1e01          	ldw	x,(OFST-1,sp)
 808  0285 a30064        	cpw	x,#100
 809  0288 2ff1          	jrslt	L171
 810                     ; 454 	setMR(LOW);
 812  028a 5f            	clrw	x
 813  028b cd0000        	call	_setMR
 815                     ; 455 	setCCLR(LOW);
 817  028e 5f            	clrw	x
 818  028f cd0000        	call	_setCCLR
 820                     ; 458 	TIM1 -> SR1 = 0;
 822  0292 725f52b6      	clr	21174
 823                     ; 459 }
 826  0296 5b02          	addw	sp,#2
 827  0298 85            	popw	x
 828  0299 bf00          	ldw	c_y,x
 829  029b 320002        	pop	c_y+2
 830  029e 85            	popw	x
 831  029f bf00          	ldw	c_x,x
 832  02a1 320002        	pop	c_x+2
 833  02a4 80            	iret
 866                     	xdef	f_TIM1_CAP_IRQHandler
 867                     	xdef	_main
 868                     	xdef	_byteData
 869                     	xdef	_dataAvailable
 870                     	xref	_setTH
 871                     	xref	_setADDR0
 872                     	xref	_setADDR1
 873                     	xref	_setDEB1
 874                     	xref	_setDE
 875                     	xref	_setLEA
 876                     	xref	_readSlowCounter_byte1
 877                     	xref	_readSlowCounter_byte0
 878                     	xref	_setCCLR
 879                     	xref	_readFastCounter
 880                     	xref	_setMR
 881                     	xref.b	c_x
 882                     	xref.b	c_y
 901                     	xref	c_xymvx
 902                     	end
