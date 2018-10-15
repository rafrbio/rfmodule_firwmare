   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  53                     ; 7 void setMR(int state)
  53                     ; 8 {	
  55                     	switch	.text
  56  0000               _setMR:
  60                     ; 9 	switch(state)
  63                     ; 19 			break;
  64  0000 5d            	tnzw	x
  65  0001 2705          	jreq	L3
  66  0003 5a            	decw	x
  67  0004 2708          	jreq	L5
  68  0006 200a          	jra	L53
  69  0008               L3:
  70                     ; 11 		case LOW: /* Set pin low */
  70                     ; 12 			/*                  76543210 */
  70                     ; 13 			GPIOD -> ODR &= ~(0b10000000);
  72  0008 721f500f      	bres	20495,#7
  73                     ; 14 			break;
  75  000c 2004          	jra	L53
  76  000e               L5:
  77                     ; 16 		case HIGH: /* Set pin high */
  77                     ; 17 			/*                  76543210 */
  77                     ; 18 			GPIOD -> ODR |=   0b10000000;
  79  000e 721e500f      	bset	20495,#7
  80                     ; 19 			break;
  82  0012               L53:
  83                     ; 22 }
  86  0012 81            	ret
 138                     ; 25 void setMUX(uint8_t position)
 138                     ; 26 {
 139                     	switch	.text
 140  0013               _setMUX:
 142  0013 88            	push	a
 143  0014 89            	pushw	x
 144       00000002      OFST:	set	2
 147                     ; 31 	tmp = (GPIOB -> ODR) & 0b11110001;
 149  0015 c65005        	ld	a,20485
 150  0018 a4f1          	and	a,#241
 151  001a 6b01          	ld	(OFST-1,sp),a
 153                     ; 34 	write_data = (position << 1) & 0b00001110;
 155  001c 7b03          	ld	a,(OFST+1,sp)
 156  001e 48            	sll	a
 157  001f a40e          	and	a,#14
 158  0021 6b02          	ld	(OFST+0,sp),a
 160                     ; 36 	GPIOB -> ODR = tmp | write_data;
 162  0023 7b01          	ld	a,(OFST-1,sp)
 163  0025 1a02          	or	a,(OFST+0,sp)
 164  0027 c75005        	ld	20485,a
 165                     ; 37 }
 168  002a 5b03          	addw	sp,#3
 169  002c 81            	ret
 213                     ; 42 uint8_t readFastCounter(void)
 213                     ; 43 {
 214                     	switch	.text
 215  002d               _readFastCounter:
 217  002d 89            	pushw	x
 218       00000002      OFST:	set	2
 221                     ; 44 	uint8_t read_bit = 0;
 223                     ; 45 	uint8_t value = 0;
 225                     ; 47 	setMUX(0);
 227  002e 4f            	clr	a
 228  002f ade2          	call	_setMUX
 230                     ; 48 	read_bit = (GPIOE -> ODR) & 0x01;
 232  0031 c65014        	ld	a,20500
 233  0034 a401          	and	a,#1
 234  0036 6b02          	ld	(OFST+0,sp),a
 236                     ; 49 	value = read_bit;
 238  0038 7b02          	ld	a,(OFST+0,sp)
 239  003a 6b01          	ld	(OFST-1,sp),a
 241                     ; 51 	setMUX(1);
 243  003c a601          	ld	a,#1
 244  003e add3          	call	_setMUX
 246                     ; 52 	read_bit = (GPIOE -> ODR) & 0x01;
 248  0040 c65014        	ld	a,20500
 249  0043 a401          	and	a,#1
 250  0045 6b02          	ld	(OFST+0,sp),a
 252                     ; 53 	read_bit = (read_bit << 1) & 0b00000010;
 254  0047 7b02          	ld	a,(OFST+0,sp)
 255  0049 48            	sll	a
 256  004a a402          	and	a,#2
 257  004c 6b02          	ld	(OFST+0,sp),a
 259                     ; 54 	value = value | read_bit;
 261  004e 7b01          	ld	a,(OFST-1,sp)
 262  0050 1a02          	or	a,(OFST+0,sp)
 263  0052 6b01          	ld	(OFST-1,sp),a
 265                     ; 56 	setMUX(2);
 267  0054 a602          	ld	a,#2
 268  0056 adbb          	call	_setMUX
 270                     ; 57 	read_bit = (GPIOE -> ODR) & 0x01;
 272  0058 c65014        	ld	a,20500
 273  005b a401          	and	a,#1
 274  005d 6b02          	ld	(OFST+0,sp),a
 276                     ; 58 	read_bit = (read_bit << 2) & 0b00000100;
 278  005f 7b02          	ld	a,(OFST+0,sp)
 279  0061 48            	sll	a
 280  0062 48            	sll	a
 281  0063 a404          	and	a,#4
 282  0065 6b02          	ld	(OFST+0,sp),a
 284                     ; 59 	value = value | read_bit;
 286  0067 7b01          	ld	a,(OFST-1,sp)
 287  0069 1a02          	or	a,(OFST+0,sp)
 288  006b 6b01          	ld	(OFST-1,sp),a
 290                     ; 61 	setMUX(3);
 292  006d a603          	ld	a,#3
 293  006f ada2          	call	_setMUX
 295                     ; 62 	read_bit = (GPIOE -> ODR) & 0x01;
 297  0071 c65014        	ld	a,20500
 298  0074 a401          	and	a,#1
 299  0076 6b02          	ld	(OFST+0,sp),a
 301                     ; 63 	read_bit = (read_bit << 3) & 0b00001000;
 303  0078 7b02          	ld	a,(OFST+0,sp)
 304  007a 48            	sll	a
 305  007b 48            	sll	a
 306  007c 48            	sll	a
 307  007d a408          	and	a,#8
 308  007f 6b02          	ld	(OFST+0,sp),a
 310                     ; 64 	value = value | read_bit;
 312  0081 7b01          	ld	a,(OFST-1,sp)
 313  0083 1a02          	or	a,(OFST+0,sp)
 314  0085 6b01          	ld	(OFST-1,sp),a
 316                     ; 66 	setMUX(4);
 318  0087 a604          	ld	a,#4
 319  0089 ad88          	call	_setMUX
 321                     ; 67 	read_bit = (GPIOE -> ODR) & 0x01;
 323  008b c65014        	ld	a,20500
 324  008e a401          	and	a,#1
 325  0090 6b02          	ld	(OFST+0,sp),a
 327                     ; 68 	read_bit = (read_bit << 4) & 0b00010000;
 329  0092 7b02          	ld	a,(OFST+0,sp)
 330  0094 97            	ld	xl,a
 331  0095 a610          	ld	a,#16
 332  0097 42            	mul	x,a
 333  0098 9f            	ld	a,xl
 334  0099 a410          	and	a,#16
 335  009b 6b02          	ld	(OFST+0,sp),a
 337                     ; 69 	value = value | read_bit;
 339  009d 7b01          	ld	a,(OFST-1,sp)
 340  009f 1a02          	or	a,(OFST+0,sp)
 341  00a1 6b01          	ld	(OFST-1,sp),a
 343                     ; 71 	setMUX(5);
 345  00a3 a605          	ld	a,#5
 346  00a5 cd0013        	call	_setMUX
 348                     ; 72 	read_bit = (GPIOE -> ODR) & 0x01;
 350  00a8 c65014        	ld	a,20500
 351  00ab a401          	and	a,#1
 352  00ad 6b02          	ld	(OFST+0,sp),a
 354                     ; 73 	read_bit = (read_bit << 5) & 0b00100000;
 356  00af 7b02          	ld	a,(OFST+0,sp)
 357  00b1 97            	ld	xl,a
 358  00b2 a620          	ld	a,#32
 359  00b4 42            	mul	x,a
 360  00b5 9f            	ld	a,xl
 361  00b6 a420          	and	a,#32
 362  00b8 6b02          	ld	(OFST+0,sp),a
 364                     ; 74 	value = value | read_bit;
 366  00ba 7b01          	ld	a,(OFST-1,sp)
 367  00bc 1a02          	or	a,(OFST+0,sp)
 368  00be 6b01          	ld	(OFST-1,sp),a
 370                     ; 76 	setMUX(6);
 372  00c0 a606          	ld	a,#6
 373  00c2 cd0013        	call	_setMUX
 375                     ; 77 	read_bit = (GPIOE -> ODR) & 0x01;
 377  00c5 c65014        	ld	a,20500
 378  00c8 a401          	and	a,#1
 379  00ca 6b02          	ld	(OFST+0,sp),a
 381                     ; 78 	read_bit = (read_bit << 6) & 0b01000000;
 383  00cc 7b02          	ld	a,(OFST+0,sp)
 384  00ce 97            	ld	xl,a
 385  00cf a640          	ld	a,#64
 386  00d1 42            	mul	x,a
 387  00d2 9f            	ld	a,xl
 388  00d3 a440          	and	a,#64
 389  00d5 6b02          	ld	(OFST+0,sp),a
 391                     ; 79 	value = value | read_bit;
 393  00d7 7b01          	ld	a,(OFST-1,sp)
 394  00d9 1a02          	or	a,(OFST+0,sp)
 395  00db 6b01          	ld	(OFST-1,sp),a
 397                     ; 81 	setMUX(7);
 399  00dd a607          	ld	a,#7
 400  00df cd0013        	call	_setMUX
 402                     ; 82 	read_bit = (GPIOE -> ODR) & 0x01;
 404  00e2 c65014        	ld	a,20500
 405  00e5 a401          	and	a,#1
 406  00e7 6b02          	ld	(OFST+0,sp),a
 408                     ; 83 	read_bit = (read_bit << 7) & 0b10000000;
 410  00e9 7b02          	ld	a,(OFST+0,sp)
 411  00eb 97            	ld	xl,a
 412  00ec a680          	ld	a,#128
 413  00ee 42            	mul	x,a
 414  00ef 9f            	ld	a,xl
 415  00f0 a480          	and	a,#128
 416  00f2 6b02          	ld	(OFST+0,sp),a
 418                     ; 84 	value = value | read_bit;
 420  00f4 7b01          	ld	a,(OFST-1,sp)
 421  00f6 1a02          	or	a,(OFST+0,sp)
 422  00f8 6b01          	ld	(OFST-1,sp),a
 424                     ; 87 	return value;
 426  00fa 7b01          	ld	a,(OFST-1,sp)
 429  00fc 85            	popw	x
 430  00fd 81            	ret
 464                     ; 98 void setGAU(int state)
 464                     ; 99 {	
 465                     	switch	.text
 466  00fe               _setGAU:
 470                     ; 100 	switch(state)
 473                     ; 110 		break;
 474  00fe 5d            	tnzw	x
 475  00ff 2709          	jreq	L111
 476  0101 5a            	decw	x
 477  0102 260a          	jrne	L331
 478                     ; 102 		case HIGH: /* Set pin low */
 478                     ; 103 		/*                  76543210 */
 478                     ; 104 		GPIOA -> ODR &= ~(0b00010000);
 480  0104 72195000      	bres	20480,#4
 481                     ; 105 		break;
 483  0108 2004          	jra	L331
 484  010a               L111:
 485                     ; 107 		case LOW: /* Set pin high */
 485                     ; 108 		/*                  76543210 */
 485                     ; 109 		GPIOA -> ODR |=   0b00010000;
 487  010a 72185000      	bset	20480,#4
 488                     ; 110 		break;
 490  010e               L331:
 491                     ; 113 }
 494  010e 81            	ret
 528                     ; 118 void setGAL(int state)
 528                     ; 119 {	
 529                     	switch	.text
 530  010f               _setGAL:
 534                     ; 120 	switch(state)
 537                     ; 130 			break;
 538  010f 5d            	tnzw	x
 539  0110 2709          	jreq	L731
 540  0112 5a            	decw	x
 541  0113 260a          	jrne	L161
 542                     ; 122 		case HIGH: /* Set pin low */
 542                     ; 123 			/*                  76543210 */
 542                     ; 124 			GPIOA -> ODR &= ~(0b00100000);
 544  0115 721b5000      	bres	20480,#5
 545                     ; 125 			break;
 547  0119 2004          	jra	L161
 548  011b               L731:
 549                     ; 127 		case LOW: /* Set pin high */
 549                     ; 128 			/*                  76543210 */
 549                     ; 129 			GPIOA -> ODR |=   0b00100000;
 551  011b 721a5000      	bset	20480,#5
 552                     ; 130 			break;
 554  011f               L161:
 555                     ; 133 }
 558  011f 81            	ret
 592                     ; 138 void setCCLR(int state)
 592                     ; 139 {	
 593                     	switch	.text
 594  0120               _setCCLR:
 598                     ; 140 	switch(state)
 601                     ; 150 			break;
 602  0120 5d            	tnzw	x
 603  0121 2709          	jreq	L561
 604  0123 5a            	decw	x
 605  0124 260a          	jrne	L702
 606                     ; 142 		case HIGH: /* Set pin low */
 606                     ; 143 			/*                  76543210 */
 606                     ; 144 			GPIOB -> ODR &= ~(0b00000001);
 608  0126 72115005      	bres	20485,#0
 609                     ; 145 			break;
 611  012a 2004          	jra	L702
 612  012c               L561:
 613                     ; 147 		case LOW: /* Set pin high */
 613                     ; 148 			/*                  76543210 */
 613                     ; 149 			GPIOB -> ODR |=   0b00000001;
 615  012c 72105005      	bset	20485,#0
 616                     ; 150 			break;
 618  0130               L702:
 619                     ; 153 }
 622  0130 81            	ret
 675                     ; 157 uint8_t readSlowCounter_byte0(void)
 675                     ; 158 {
 676                     	switch	.text
 677  0131               _readSlowCounter_byte0:
 679  0131 89            	pushw	x
 680       00000002      OFST:	set	2
 683                     ; 159 	uint8_t nib0 = 0;
 685                     ; 160 	uint8_t nib1 = 0;
 687                     ; 161 	uint8_t value = 0;
 689                     ; 164 	GPIOA -> ODR &=				  ~(0b00100000); //GAL LOW -> PA5 LOW (Read lower bit)
 691  0132 721b5000      	bres	20480,#5
 692                     ; 165 	nib0 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
 694  0136 c65015        	ld	a,20501
 695  0139 a43c          	and	a,#60
 696  013b 6b02          	ld	(OFST+0,sp),a
 698                     ; 166 	nib0 = (nib0 >> 2);
 700  013d 0402          	srl	(OFST+0,sp)
 701  013f 0402          	srl	(OFST+0,sp)
 703                     ; 167 	nib0 = nib0&(0x0F);
 705  0141 7b02          	ld	a,(OFST+0,sp)
 706  0143 a40f          	and	a,#15
 707  0145 6b02          	ld	(OFST+0,sp),a
 709                     ; 168 	nib1 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
 711  0147 c65010        	ld	a,20496
 712  014a a40f          	and	a,#15
 713  014c 6b01          	ld	(OFST-1,sp),a
 715                     ; 169 	nib1 = (nib1 << 4);
 717  014e 7b01          	ld	a,(OFST-1,sp)
 718  0150 4e            	swap	a
 719  0151 a4f0          	and	a,#240
 720  0153 6b01          	ld	(OFST-1,sp),a
 722                     ; 170 	nib1 = nib1&(0xF0);
 724  0155 7b01          	ld	a,(OFST-1,sp)
 725  0157 a4f0          	and	a,#240
 726  0159 6b01          	ld	(OFST-1,sp),a
 728                     ; 171 	GPIOA -> ODR |=				   (0b00010000); //GAL HIGH -> PA5 HIGH
 730  015b 72185000      	bset	20480,#4
 731                     ; 173 	value = nib0 | nib1;
 733  015f 7b02          	ld	a,(OFST+0,sp)
 734  0161 1a01          	or	a,(OFST-1,sp)
 735  0163 6b02          	ld	(OFST+0,sp),a
 737                     ; 175 	return value;
 739  0165 7b02          	ld	a,(OFST+0,sp)
 742  0167 85            	popw	x
 743  0168 81            	ret
 796                     ; 179 uint8_t readSlowCounter_byte1(void)
 796                     ; 180 {
 797                     	switch	.text
 798  0169               _readSlowCounter_byte1:
 800  0169 89            	pushw	x
 801       00000002      OFST:	set	2
 804                     ; 181 	uint8_t nib2 = 0;
 806                     ; 182 	uint8_t nib3 = 0;
 808                     ; 183 	uint8_t value = 0;
 810                     ; 187 	GPIOA -> ODR &=				  ~(0b00010000); //GAU LOW -> PA4 LOW (Read higher bit)
 812  016a 72195000      	bres	20480,#4
 813                     ; 188 	nib2 = (GPIOE -> IDR)&((uint8_t)0b00111100); //PE2 PE3 PE4 PE5  READ 
 815  016e c65015        	ld	a,20501
 816  0171 a43c          	and	a,#60
 817  0173 6b02          	ld	(OFST+0,sp),a
 819                     ; 189 	nib2 = (nib2 >> 2);
 821  0175 0402          	srl	(OFST+0,sp)
 822  0177 0402          	srl	(OFST+0,sp)
 824                     ; 190 	nib2 = nib2&(0x0F);
 826  0179 7b02          	ld	a,(OFST+0,sp)
 827  017b a40f          	and	a,#15
 828  017d 6b02          	ld	(OFST+0,sp),a
 830                     ; 191 	nib3 = (GPIOD -> IDR)&((uint8_t)0b00001111); //PD0 PD1 PD2 PD3  READ 
 832  017f c65010        	ld	a,20496
 833  0182 a40f          	and	a,#15
 834  0184 6b01          	ld	(OFST-1,sp),a
 836                     ; 192 	nib3 = (nib3 << 4);
 838  0186 7b01          	ld	a,(OFST-1,sp)
 839  0188 4e            	swap	a
 840  0189 a4f0          	and	a,#240
 841  018b 6b01          	ld	(OFST-1,sp),a
 843                     ; 193 	nib3 = nib3&(0xF0);
 845  018d 7b01          	ld	a,(OFST-1,sp)
 846  018f a4f0          	and	a,#240
 847  0191 6b01          	ld	(OFST-1,sp),a
 849                     ; 194 	GPIOA -> ODR |=				   (0b00010000); //GAL HIGH -> PA4 HIGH
 851  0193 72185000      	bset	20480,#4
 852                     ; 196 	value = nib2 | nib3;
 854  0197 7b02          	ld	a,(OFST+0,sp)
 855  0199 1a01          	or	a,(OFST-1,sp)
 856  019b 6b02          	ld	(OFST+0,sp),a
 858                     ; 198 	return value;
 860  019d 7b02          	ld	a,(OFST+0,sp)
 863  019f 85            	popw	x
 864  01a0 81            	ret
 898                     ; 208 void setLEA(int state)
 898                     ; 209 {	
 899                     	switch	.text
 900  01a1               _setLEA:
 904                     ; 210 	switch(state)
 907                     ; 220 			break;
 908  01a1 5d            	tnzw	x
 909  01a2 2705          	jreq	L562
 910  01a4 5a            	decw	x
 911  01a5 2708          	jreq	L762
 912  01a7 200a          	jra	L113
 913  01a9               L562:
 914                     ; 212 		case LOW: /* Set pin low */
 914                     ; 213 			/*                  76543210 */
 914                     ; 214 			GPIOA -> ODR &= ~(0b01000000);
 916  01a9 721d5000      	bres	20480,#6
 917                     ; 215 			break;
 919  01ad 2004          	jra	L113
 920  01af               L762:
 921                     ; 217 		case HIGH: /* Set pin high */
 921                     ; 218 			/*                  76543210 */
 921                     ; 219 			GPIOA -> ODR |=   0b01000000;
 923  01af 721c5000      	bset	20480,#6
 924                     ; 220 			break;
 926  01b3               L113:
 927                     ; 223 }
 930  01b3 81            	ret
 953                     ; 230 uint8_t readADR(void)
 953                     ; 231 {	
 954                     	switch	.text
 955  01b4               _readADR:
 959                     ; 233 }
 962  01b4 81            	ret
 996                     ; 238 void setDE(int state)
 996                     ; 239 {	
 997                     	switch	.text
 998  01b5               _setDE:
1002                     ; 240 	switch(state)
1005                     ; 250 			break;
1006  01b5 5d            	tnzw	x
1007  01b6 2705          	jreq	L323
1008  01b8 5a            	decw	x
1009  01b9 2708          	jreq	L523
1010  01bb 200a          	jra	L743
1011  01bd               L323:
1012                     ; 242 		case LOW: /* Set pin low */
1012                     ; 243 			/*                  76543210 */
1012                     ; 244 			GPIOE -> ODR &= ~(0b01000000);
1014  01bd 721d5014      	bres	20500,#6
1015                     ; 245 			break;
1017  01c1 2004          	jra	L743
1018  01c3               L523:
1019                     ; 247 		case HIGH: /* Set pin high */
1019                     ; 248 			/*                  76543210 */
1019                     ; 249 			GPIOE -> ODR |=   0b01000000;
1021  01c3 721c5014      	bset	20500,#6
1022                     ; 250 			break;
1024  01c7               L743:
1025                     ; 253 }
1028  01c7 81            	ret
1062                     ; 263 void setDEB1(int state)
1062                     ; 264 {	
1063                     	switch	.text
1064  01c8               _setDEB1:
1068                     ; 265 	switch(state)
1071                     ; 275 			break;
1072  01c8 5d            	tnzw	x
1073  01c9 2705          	jreq	L153
1074  01cb 5a            	decw	x
1075  01cc 2708          	jreq	L353
1076  01ce 200a          	jra	L573
1077  01d0               L153:
1078                     ; 267 		case LOW: /* Set pin low */
1078                     ; 268 			/*                  76543210 */
1078                     ; 269 			GPIOE -> ODR &= ~(0b10000000);
1080  01d0 721f5014      	bres	20500,#7
1081                     ; 270 			break;
1083  01d4 2004          	jra	L573
1084  01d6               L353:
1085                     ; 272 		case HIGH: /* Set pin high */
1085                     ; 273 			/*                  76543210 */
1085                     ; 274 			GPIOE -> ODR |=   0b10000000;
1087  01d6 721e5014      	bset	20500,#7
1088                     ; 275 			break;
1090  01da               L573:
1091                     ; 278 }
1094  01da 81            	ret
1128                     ; 282 void setDEB2(int state)
1128                     ; 283 {	
1129                     	switch	.text
1130  01db               _setDEB2:
1134                     ; 284 	switch(state)
1137                     ; 294 			break;
1138  01db 5d            	tnzw	x
1139  01dc 2705          	jreq	L773
1140  01de 5a            	decw	x
1141  01df 2708          	jreq	L104
1142  01e1 200a          	jra	L324
1143  01e3               L773:
1144                     ; 286 		case LOW: /* Set pin low */
1144                     ; 287 			/*                  76543210 */
1144                     ; 288 			GPIOC -> ODR &= ~(0b00001000);
1146  01e3 7217500a      	bres	20490,#3
1147                     ; 289 			break;
1149  01e7 2004          	jra	L324
1150  01e9               L104:
1151                     ; 291 		case HIGH: /* Set pin high */
1151                     ; 292 			/*                  76543210 */
1151                     ; 293 			GPIOC -> ODR |=   0b00001000;
1153  01e9 7216500a      	bset	20490,#3
1154                     ; 294 			break;
1156  01ed               L324:
1157                     ; 297 }
1160  01ed 81            	ret
1194                     ; 301 void setADDR1(int state)
1194                     ; 302 {	
1195                     	switch	.text
1196  01ee               _setADDR1:
1200                     ; 303 	switch(state)
1203                     ; 313 			break;
1204  01ee 5d            	tnzw	x
1205  01ef 2705          	jreq	L524
1206  01f1 5a            	decw	x
1207  01f2 2708          	jreq	L724
1208  01f4 200a          	jra	L154
1209  01f6               L524:
1210                     ; 305 		case LOW: /* Set pin low */
1210                     ; 306 			/*                  76543210 */
1210                     ; 307 			GPIOC -> ODR &= ~(0b01000000);
1212  01f6 721d500a      	bres	20490,#6
1213                     ; 308 			break;
1215  01fa 2004          	jra	L154
1216  01fc               L724:
1217                     ; 310 		case HIGH: /* Set pin high */
1217                     ; 311 			/*                  76543210 */
1217                     ; 312 			GPIOC -> ODR |=   0b01000000;
1219  01fc 721c500a      	bset	20490,#6
1220                     ; 313 			break;
1222  0200               L154:
1223                     ; 316 }
1226  0200 81            	ret
1260                     ; 318 void setADDR0(int state)
1260                     ; 319 {	
1261                     	switch	.text
1262  0201               _setADDR0:
1266                     ; 320 	switch(state)
1269                     ; 330 			break;
1270  0201 5d            	tnzw	x
1271  0202 2705          	jreq	L354
1272  0204 5a            	decw	x
1273  0205 2708          	jreq	L554
1274  0207 200a          	jra	L774
1275  0209               L354:
1276                     ; 322 		case LOW: /* Set pin low */
1276                     ; 323 			/*                  76543210 */
1276                     ; 324 			GPIOC -> ODR &= ~(0b00100000);
1278  0209 721b500a      	bres	20490,#5
1279                     ; 325 			break;
1281  020d 2004          	jra	L774
1282  020f               L554:
1283                     ; 327 		case HIGH: /* Set pin high */
1283                     ; 328 			/*                  76543210 */
1283                     ; 329 			GPIOC -> ODR |=   0b00100000;
1285  020f 721a500a      	bset	20490,#5
1286                     ; 330 			break;
1288  0213               L774:
1289                     ; 333 }
1292  0213 81            	ret
1315                     ; 336 void enableInputComp(void)
1315                     ; 337 {
1316                     	switch	.text
1317  0214               _enableInputComp:
1321                     ; 339 	GPIOE -> ODR |=   0b01000000; //PA6 HIGH
1323  0214 721c5014      	bset	20500,#6
1324                     ; 340 }
1327  0218 81            	ret
1350                     ; 342 void disableInputComp(void)
1350                     ; 343 {
1351                     	switch	.text
1352  0219               _disableInputComp:
1356                     ; 345 	GPIOE -> ODR &= ~(0b01000000); //PA6 LOW
1358  0219 721d5014      	bres	20500,#6
1359                     ; 346 }
1362  021d 81            	ret
1396                     ; 350 void setTH(int state)
1396                     ; 351 {	
1397                     	switch	.text
1398  021e               _setTH:
1402                     ; 352 	switch(state)
1405                     ; 362 			break;
1406  021e 5d            	tnzw	x
1407  021f 2709          	jreq	L325
1408  0221 5a            	decw	x
1409  0222 260a          	jrne	L545
1410                     ; 354 		case HIGH: /* Set pin high */
1410                     ; 355 			/*                  76543210 */
1410                     ; 356 			GPIOF -> ODR |=   0b00000001;
1412  0224 72105019      	bset	20505,#0
1413                     ; 357 			break;
1415  0228 2004          	jra	L545
1416  022a               L325:
1417                     ; 359 		case LOW: /* Set pin low */
1417                     ; 360 			/*                  76543210 */
1417                     ; 361 			GPIOF -> ODR &= ~(0b00000001);
1419  022a 72115019      	bres	20505,#0
1420                     ; 362 			break;
1422  022e               L545:
1423                     ; 365 }
1426  022e 81            	ret
1439                     	xdef	_setTH
1440                     	xdef	_setADDR0
1441                     	xdef	_disableInputComp
1442                     	xdef	_enableInputComp
1443                     	xdef	_setADDR1
1444                     	xdef	_setDEB2
1445                     	xdef	_setDEB1
1446                     	xdef	_setDE
1447                     	xdef	_readADR
1448                     	xdef	_setLEA
1449                     	xdef	_readSlowCounter_byte1
1450                     	xdef	_readSlowCounter_byte0
1451                     	xdef	_setCCLR
1452                     	xdef	_setGAL
1453                     	xdef	_setGAU
1454                     	xdef	_readFastCounter
1455                     	xdef	_setMUX
1456                     	xdef	_setMR
1475                     	end
