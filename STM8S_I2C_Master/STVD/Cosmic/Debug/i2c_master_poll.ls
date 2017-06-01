   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  50                     .const:	section	.text
  51  0000               L6:
  52  0000 000f4240      	dc.l	1000000
  53                     ; 30 uint8_t I2C_Config(void) {
  54                     	scross	off
  55                     .text:	section	.text,new
  56  0000               _I2C_Config:
  58  0000 89            	pushw	x
  59       00000002      OFST:	set	2
  62                     ; 31 	uint16_t time_out = 0;
  64  0001 5f            	clrw	x
  65  0002 1f01          	ldw	(OFST-1,sp),x
  66                     ; 32 	enableInterrupts();
  69  0004 9a            rim
  71                     ; 36 	I2C_DeInit();
  74  0005 cd0000        	call	_I2C_DeInit
  76                     ; 38 	I2C_Init(100000,0x50,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,CLK_GetClockFreq()/1000000);
  78  0008 cd0000        	call	_CLK_GetClockFreq
  80  000b ae0000        	ldw	x,#L6
  81  000e cd0000        	call	c_ludv
  83  0011 b603          	ld	a,c_lreg+3
  84  0013 88            	push	a
  85  0014 4b00          	push	#0
  86  0016 4b01          	push	#1
  87  0018 4b00          	push	#0
  88  001a ae0050        	ldw	x,#80
  89  001d 89            	pushw	x
  90  001e ae86a0        	ldw	x,#34464
  91  0021 89            	pushw	x
  92  0022 ae0001        	ldw	x,#1
  93  0025 89            	pushw	x
  94  0026 cd0000        	call	_I2C_Init
  96  0029 5b0a          	addw	sp,#10
  97                     ; 40 	I2C_Cmd(ENABLE);
  99  002b a601          	ld	a,#1
 100  002d cd0000        	call	_I2C_Cmd
 103  0030 2033          	jra	L13
 104  0032               L72:
 105                     ; 43 		set_tout_ms(10);
 107  0032 ae000a        	ldw	x,#10
 108  0035 bf00          	ldw	_TIM4_tout,x
 109                     ; 44     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 112  0037 72125211      	bset	21009,#1
 114  003b               L73:
 115                     ; 45     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 117  003b c65211        	ld	a,21009
 118  003e a502          	bcp	a,#2
 119  0040 2704          	jreq	L34
 121  0042 be00          	ldw	x,_TIM4_tout
 122  0044 26f5          	jrne	L73
 123  0046               L34:
 124                     ; 46 		time_out += 10;
 126  0046 1e01          	ldw	x,(OFST-1,sp)
 127  0048 1c000a        	addw	x,#10
 128  004b 1f01          	ldw	(OFST-1,sp),x
 129                     ; 47 		if(!tout()){
 131  004d be00          	ldw	x,_TIM4_tout
 132  004f 2609          	jrne	L54
 133                     ; 48 			I2C_SoftwareResetCmd(ENABLE);
 135  0051 a601          	ld	a,#1
 136  0053 cd0000        	call	_I2C_SoftwareResetCmd
 138                     ; 49 			I2C_SoftwareResetCmd(DISABLE);
 140  0056 4f            	clr	a
 141  0057 cd0000        	call	_I2C_SoftwareResetCmd
 143  005a               L54:
 144                     ; 51 		if(time_out > 500){
 146  005a 1e01          	ldw	x,(OFST-1,sp)
 147  005c a301f5        	cpw	x,#501
 148  005f 2504          	jrult	L13
 149                     ; 52 			return IIC_ERROR_BUSY;
 151  0061 a602          	ld	a,#2
 153  0063 2008          	jra	L01
 154  0065               L13:
 155                     ; 41   while((I2C->SR3 & I2C_SR3_BUSY))       									// Wait while the bus is busy
 157  0065 c65219        	ld	a,21017
 158  0068 a502          	bcp	a,#2
 159  006a 26c6          	jrne	L72
 160                     ; 55 	return IIC_SUCCESS;
 162  006c 4f            	clr	a
 164  006d               L01:
 166  006d 85            	popw	x
 167  006e 81            	ret
 230                     ; 65 uint8_t I2C_WriteBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite, uint8_t TimeOutOfMs)
 230                     ; 66 {
 231                     .text:	section	.text,new
 232  0000               _I2C_WriteBytes:
 234  0000 89            	pushw	x
 235       00000000      OFST:	set	0
 238                     ; 67 	set_tout_ms(TimeOutOfMs);
 240  0001 7b08          	ld	a,(OFST+8,sp)
 241  0003 5f            	clrw	x
 242  0004 97            	ld	xl,a
 243  0005 bf00          	ldw	_TIM4_tout,x
 246  0007 200f          	jra	L501
 247  0009               L301:
 248                     ; 70     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 250  0009 72125211      	bset	21009,#1
 252  000d               L311:
 253                     ; 71     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 255  000d c65211        	ld	a,21009
 256  0010 a502          	bcp	a,#2
 257  0012 2704          	jreq	L501
 259  0014 be00          	ldw	x,_TIM4_tout
 260  0016 26f5          	jrne	L311
 261  0018               L501:
 262                     ; 68   while((I2C->SR3 & I2C_SR3_BUSY) && tout())       									// Wait while the bus is busy
 264  0018 c65219        	ld	a,21017
 265  001b a502          	bcp	a,#2
 266  001d 2704          	jreq	L121
 268  001f be00          	ldw	x,_TIM4_tout
 269  0021 26e6          	jrne	L301
 270  0023               L121:
 271                     ; 73 	if(!tout()){return IIC_ERROR_BUSY;}
 273  0023 be00          	ldw	x,_TIM4_tout
 274  0025 2604          	jrne	L321
 277  0027 a602          	ld	a,#2
 279  0029 201d          	jra	L41
 280  002b               L321:
 281                     ; 74   I2C->CR2 |= I2C_CR2_START;                        									// START=1, generate start
 283  002b 72105211      	bset	21009,#0
 285  002f               L721:
 286                     ; 75   while(((I2C->SR1 & I2C_SR1_SB)==0) && tout()); 									// Wait for start bit detection (SB)
 288  002f c65217        	ld	a,21015
 289  0032 a501          	bcp	a,#1
 290  0034 2604          	jrne	L331
 292  0036 be00          	ldw	x,_TIM4_tout
 293  0038 26f5          	jrne	L721
 294  003a               L331:
 295                     ; 77   if(tout())
 298  003a be00          	ldw	x,_TIM4_tout
 299  003c 2708          	jreq	L531
 300                     ; 87       I2C->DR = (u8)(SlaveAddr << 1);   									// Send 7-bit device address & Write (R/W = 0)
 302  003e 7b02          	ld	a,(OFST+2,sp)
 303  0040 48            	sll	a
 304  0041 c75216        	ld	21014,a
 306  0044 2004          	jra	L341
 307  0046               L531:
 308                     ; 90 		return IIC_ERROR_TIME_OUT;
 310  0046 a601          	ld	a,#1
 312  0048               L41:
 314  0048 85            	popw	x
 315  0049 81            	ret
 316  004a               L341:
 317                     ; 92   while(!(I2C->SR1 & I2C_SR1_ADDR) && tout());     									// Wait for address ack (ADDR)
 319  004a c65217        	ld	a,21015
 320  004d a502          	bcp	a,#2
 321  004f 2604          	jrne	L741
 323  0051 be00          	ldw	x,_TIM4_tout
 324  0053 26f5          	jrne	L341
 325  0055               L741:
 326                     ; 93 	if(!tout()){
 328  0055 be00          	ldw	x,_TIM4_tout
 329  0057 2608          	jrne	L151
 330                     ; 94 		I2C->CR2 |= I2C_CR2_STOP;
 332  0059 72125211      	bset	21009,#1
 333                     ; 95 		return IIC_ERROR_NOT_ACK;
 335  005d a603          	ld	a,#3
 337  005f 20e7          	jra	L41
 338  0061               L151:
 339                     ; 98   I2C->SR3;
 342  0061 c65219        	ld	a,21017
 343  0064 97            	ld	xl,a
 345  0065               L551:
 346                     ; 99   while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  									// Wait for TxE
 348  0065 c65217        	ld	a,21015
 349  0068 a580          	bcp	a,#128
 350  006a 2604          	jrne	L161
 352  006c be00          	ldw	x,_TIM4_tout
 353  006e 26f5          	jrne	L551
 354  0070               L161:
 355                     ; 100   if(NumByteToWrite)
 357  0070 0d07          	tnz	(OFST+7,sp)
 358  0072 2733          	jreq	L361
 360  0074 201d          	jra	L761
 361  0076               L561:
 362                     ; 104 			I2C->DR = *pWriteDataBuffer++; 
 364  0076 1e05          	ldw	x,(OFST+5,sp)
 365  0078 1c0001        	addw	x,#1
 366  007b 1f05          	ldw	(OFST+5,sp),x
 367  007d 1d0001        	subw	x,#1
 368  0080 f6            	ld	a,(x)
 369  0081 c75216        	ld	21014,a
 371  0084               L771:
 372                     ; 105 			while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  								// test EV8 - wait for TxE
 374  0084 c65217        	ld	a,21015
 375  0087 a580          	bcp	a,#128
 376  0089 2604          	jrne	L302
 378  008b be00          	ldw	x,_TIM4_tout
 379  008d 26f5          	jrne	L771
 380  008f               L302:
 381                     ; 106 			if(!tout()){
 383  008f be00          	ldw	x,_TIM4_tout
 384  0091 2707          	jreq	L112
 385                     ; 107 				break;
 387  0093               L761:
 388                     ; 102 		while(NumByteToWrite--)
 390  0093 7b07          	ld	a,(OFST+7,sp)
 391  0095 0a07          	dec	(OFST+7,sp)
 392  0097 4d            	tnz	a
 393  0098 26dc          	jrne	L561
 394  009a               L112:
 395                     ; 110 		while(((I2C->SR1 & (I2C_SR1_TXE|I2C_SR1_BTF)) != (I2C_SR1_TXE|I2C_SR1_BTF)) && tout()); 					// Wait for TxE & BTF
 397  009a c65217        	ld	a,21015
 398  009d a484          	and	a,#132
 399  009f a184          	cp	a,#132
 400  00a1 2704          	jreq	L361
 402  00a3 be00          	ldw	x,_TIM4_tout
 403  00a5 26f3          	jrne	L112
 404  00a7               L361:
 405                     ; 114   I2C->CR2 |= I2C_CR2_STOP;                        									// generate stop here (STOP=1)
 407  00a7 72125211      	bset	21009,#1
 409  00ab               L122:
 410                     ; 115   while((I2C->CR2 & I2C_CR2_STOP) && tout());      									// wait until stop is performed  
 412  00ab c65211        	ld	a,21009
 413  00ae a502          	bcp	a,#2
 414  00b0 2704          	jreq	L522
 416  00b2 be00          	ldw	x,_TIM4_tout
 417  00b4 26f5          	jrne	L122
 418  00b6               L522:
 419                     ; 116 	if(!tout()){
 421  00b6 be00          	ldw	x,_TIM4_tout
 422  00b8 2604          	jrne	L722
 423                     ; 117 		return IIC_ERROR_TIME_OUT;
 425  00ba a601          	ld	a,#1
 427  00bc 2001          	jra	L61
 428  00be               L722:
 429                     ; 119 		return IIC_SUCCESS;
 431  00be 4f            	clr	a
 433  00bf               L61:
 435  00bf 85            	popw	x
 436  00c0 81            	ret
 507                     ; 123 uint8_t I2C_ReadBytes(uint16_t SlaveAddr, uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 507                     ; 124 {
 508                     .text:	section	.text,new
 509  0000               _I2C_ReadBytes:
 511  0000 89            	pushw	x
 512       00000000      OFST:	set	0
 515                     ; 125 	set_tout_ms(TimeOutOfMs);
 517  0001 7b08          	ld	a,(OFST+8,sp)
 518  0003 5f            	clrw	x
 519  0004 97            	ld	xl,a
 520  0005 bf00          	ldw	_TIM4_tout,x
 523  0007 200f          	jra	L762
 524  0009               L562:
 525                     ; 129 		I2C->CR2 |= I2C_CR2_STOP;                   				// STOP=1, generate stop
 527  0009 72125211      	bset	21009,#1
 529  000d               L572:
 530                     ; 130     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// wait until stop is performed
 532  000d c65211        	ld	a,21009
 533  0010 a502          	bcp	a,#2
 534  0012 2704          	jreq	L762
 536  0014 be00          	ldw	x,_TIM4_tout
 537  0016 26f5          	jrne	L572
 538  0018               L762:
 539                     ; 127 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 541  0018 c65219        	ld	a,21017
 542  001b a502          	bcp	a,#2
 543  001d 2704          	jreq	L303
 545  001f be00          	ldw	x,_TIM4_tout
 546  0021 26e6          	jrne	L562
 547  0023               L303:
 548                     ; 132 	if(!tout()){return IIC_ERROR_BUSY;}
 550  0023 be00          	ldw	x,_TIM4_tout
 551  0025 2604          	jrne	L503
 554  0027 a602          	ld	a,#2
 556  0029 2030          	jra	L22
 557  002b               L503:
 558                     ; 133 	I2C->CR2 &= ~I2C_CR2_STOP;
 560  002b 72135211      	bres	21009,#1
 561                     ; 134   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 563  002f 72145211      	bset	21009,#2
 564                     ; 136   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 566  0033 72105211      	bset	21009,#0
 568  0037               L113:
 569                     ; 137   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// wait for start bit detection (SB)
 571  0037 c65217        	ld	a,21015
 572  003a a501          	bcp	a,#1
 573  003c 2604          	jrne	L513
 575  003e be00          	ldw	x,_TIM4_tout
 576  0040 26f5          	jrne	L113
 577  0042               L513:
 578                     ; 148     I2C->DR = (u8)(SlaveAddr << 1) | 1;       			// Send 7-bit device address & Write (R/W = 1)
 580  0042 7b02          	ld	a,(OFST+2,sp)
 581  0044 48            	sll	a
 582  0045 aa01          	or	a,#1
 583  0047 c75216        	ld	21014,a
 585  004a               L323:
 586                     ; 150   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());				// Wait for address ack (ADDR)
 588  004a c65217        	ld	a,21015
 589  004d a502          	bcp	a,#2
 590  004f 2604          	jrne	L723
 592  0051 be00          	ldw	x,_TIM4_tout
 593  0053 26f5          	jrne	L323
 594  0055               L723:
 595                     ; 151 	if(!tout()){
 597  0055 be00          	ldw	x,_TIM4_tout
 598  0057 2604          	jrne	L133
 599                     ; 152 		return IIC_ERROR_NOT_ACK;
 601  0059 a603          	ld	a,#3
 603  005b               L22:
 605  005b 85            	popw	x
 606  005c 81            	ret
 607  005d               L133:
 608                     ; 155   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 610  005d 7b07          	ld	a,(OFST+7,sp)
 611  005f a103          	cp	a,#3
 612  0061 2577          	jrult	L333
 613                     ; 157     I2C->SR3;                                     			// ADDR clearing sequence    
 615  0063 c65219        	ld	a,21017
 616  0066 97            	ld	xl,a
 618  0067 201b          	jra	L733
 619  0069               L543:
 620                     ; 160       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 622  0069 c65217        	ld	a,21015
 623  006c a504          	bcp	a,#4
 624  006e 2604          	jrne	L153
 626  0070 be00          	ldw	x,_TIM4_tout
 627  0072 26f5          	jrne	L543
 628  0074               L153:
 629                     ; 161 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
 631  0074 1e05          	ldw	x,(OFST+5,sp)
 632  0076 1c0001        	addw	x,#1
 633  0079 1f05          	ldw	(OFST+5,sp),x
 634  007b 1d0001        	subw	x,#1
 635  007e c65216        	ld	a,21014
 636  0081 f7            	ld	(x),a
 637                     ; 162       --NumByteToRead;																		// Decrease Numbyte to reade by 1
 639  0082 0a07          	dec	(OFST+7,sp)
 640  0084               L733:
 641                     ; 158     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
 643  0084 7b07          	ld	a,(OFST+7,sp)
 644  0086 a104          	cp	a,#4
 645  0088 2504          	jrult	L753
 647  008a be00          	ldw	x,_TIM4_tout
 648  008c 26db          	jrne	L543
 649  008e               L753:
 650                     ; 165     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 652  008e c65217        	ld	a,21015
 653  0091 a504          	bcp	a,#4
 654  0093 2604          	jrne	L363
 656  0095 be00          	ldw	x,_TIM4_tout
 657  0097 26f5          	jrne	L753
 658  0099               L363:
 659                     ; 166     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 661  0099 72155211      	bres	21009,#2
 662                     ; 167     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 665  009d 9b            sim
 667                     ; 168     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
 670  009e 1e05          	ldw	x,(OFST+5,sp)
 671  00a0 1c0001        	addw	x,#1
 672  00a3 1f05          	ldw	(OFST+5,sp),x
 673  00a5 1d0001        	subw	x,#1
 674  00a8 c65216        	ld	a,21014
 675  00ab f7            	ld	(x),a
 676                     ; 169     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 678  00ac 72125211      	bset	21009,#1
 679                     ; 170     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
 681  00b0 1e05          	ldw	x,(OFST+5,sp)
 682  00b2 1c0001        	addw	x,#1
 683  00b5 1f05          	ldw	(OFST+5,sp),x
 684  00b7 1d0001        	subw	x,#1
 685  00ba c65216        	ld	a,21014
 686  00bd f7            	ld	(x),a
 687                     ; 171     enableInterrupts();																	// Errata workaround (Enable interrupt)
 690  00be 9a            rim
 694  00bf               L763:
 695                     ; 172     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 697  00bf c65217        	ld	a,21015
 698  00c2 a540          	bcp	a,#64
 699  00c4 2604          	jrne	L373
 701  00c6 be00          	ldw	x,_TIM4_tout
 702  00c8 26f5          	jrne	L763
 703  00ca               L373:
 704                     ; 173     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 706  00ca 1e05          	ldw	x,(OFST+5,sp)
 707  00cc 1c0001        	addw	x,#1
 708  00cf 1f05          	ldw	(OFST+5,sp),x
 709  00d1 1d0001        	subw	x,#1
 710  00d4 c65216        	ld	a,21014
 711  00d7 f7            	ld	(x),a
 713  00d8 205a          	jra	L524
 714  00da               L333:
 715                     ; 177     if(NumByteToRead == 2)                						// *** just two bytes are received? ***
 717  00da 7b07          	ld	a,(OFST+7,sp)
 718  00dc a102          	cp	a,#2
 719  00de 2635          	jrne	L773
 720                     ; 179       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 722  00e0 72165211      	bset	21009,#3
 723                     ; 180       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 726  00e4 9b            sim
 728                     ; 181       I2C->SR3;                                       	// Clear ADDR Flag
 731  00e5 c65219        	ld	a,21017
 732  00e8 97            	ld	xl,a
 733                     ; 182       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 735  00e9 72155211      	bres	21009,#2
 736                     ; 183       enableInterrupts();																// Errata workaround (Enable interrupt)
 739  00ed 9a            rim
 743  00ee               L304:
 744                     ; 184       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 746  00ee c65217        	ld	a,21015
 747  00f1 a504          	bcp	a,#4
 748  00f3 2604          	jrne	L704
 750  00f5 be00          	ldw	x,_TIM4_tout
 751  00f7 26f5          	jrne	L304
 752  00f9               L704:
 753                     ; 185       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 756  00f9 9b            sim
 758                     ; 186       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 761  00fa 72125211      	bset	21009,#1
 762                     ; 187       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 764  00fe 1e05          	ldw	x,(OFST+5,sp)
 765  0100 1c0001        	addw	x,#1
 766  0103 1f05          	ldw	(OFST+5,sp),x
 767  0105 1d0001        	subw	x,#1
 768  0108 c65216        	ld	a,21014
 769  010b f7            	ld	(x),a
 770                     ; 188       enableInterrupts();																// Errata workaround (Enable interrupt)
 773  010c 9a            rim
 775                     ; 189 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
 778  010d 1e05          	ldw	x,(OFST+5,sp)
 779  010f c65216        	ld	a,21014
 780  0112 f7            	ld	(x),a
 782  0113 201f          	jra	L524
 783  0115               L773:
 784                     ; 193       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 786  0115 72155211      	bres	21009,#2
 787                     ; 194       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 791  0119 9b            sim
 793                     ; 195       I2C->SR3;                                       	// Clear ADDR Flag   
 796  011a c65219        	ld	a,21017
 797  011d 97            	ld	xl,a
 798                     ; 196       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 800  011e 72125211      	bset	21009,#1
 801                     ; 197       enableInterrupts();																// Errata workaround (Enable interrupt)
 804  0122 9a            rim
 808  0123               L514:
 809                     ; 198       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 811  0123 c65217        	ld	a,21015
 812  0126 a540          	bcp	a,#64
 813  0128 2604          	jrne	L124
 815  012a be00          	ldw	x,_TIM4_tout
 816  012c 26f5          	jrne	L514
 817  012e               L124:
 818                     ; 199       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
 820  012e 1e05          	ldw	x,(OFST+5,sp)
 821  0130 c65216        	ld	a,21014
 822  0133 f7            	ld	(x),a
 823  0134               L524:
 824                     ; 203   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 826  0134 c65211        	ld	a,21009
 827  0137 a502          	bcp	a,#2
 828  0139 2704          	jreq	L134
 830  013b be00          	ldw	x,_TIM4_tout
 831  013d 26f5          	jrne	L524
 832  013f               L134:
 833                     ; 204   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 835  013f 72175211      	bres	21009,#3
 836                     ; 205 	if(!tout()){
 838  0143 be00          	ldw	x,_TIM4_tout
 839  0145 2604          	jrne	L334
 840                     ; 206 		return IIC_ERROR_TIME_OUT;
 842  0147 a601          	ld	a,#1
 844  0149 2001          	jra	L42
 845  014b               L334:
 846                     ; 208 		return IIC_SUCCESS;
 848  014b 4f            	clr	a
 850  014c               L42:
 852  014c 85            	popw	x
 853  014d 81            	ret
 943                     ; 212 uint8_t I2C_WriteReadBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite,uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 943                     ; 213 {
 944                     .text:	section	.text,new
 945  0000               _I2C_WriteReadBytes:
 947  0000 89            	pushw	x
 948       00000000      OFST:	set	0
 951                     ; 214 	set_tout_ms(TimeOutOfMs);
 953  0001 7b0b          	ld	a,(OFST+11,sp)
 954  0003 5f            	clrw	x
 955  0004 97            	ld	xl,a
 956  0005 bf00          	ldw	_TIM4_tout,x
 959  0007 200f          	jra	L305
 960  0009               L105:
 961                     ; 218 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 963  0009 72125211      	bset	21009,#1
 965  000d               L115:
 966                     ; 219     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 968  000d c65211        	ld	a,21009
 969  0010 a502          	bcp	a,#2
 970  0012 2704          	jreq	L305
 972  0014 be00          	ldw	x,_TIM4_tout
 973  0016 26f5          	jrne	L115
 974  0018               L305:
 975                     ; 216 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 977  0018 c65219        	ld	a,21017
 978  001b a502          	bcp	a,#2
 979  001d 2704          	jreq	L715
 981  001f be00          	ldw	x,_TIM4_tout
 982  0021 26e6          	jrne	L105
 983  0023               L715:
 984                     ; 221 	if(!tout()){return IIC_ERROR_BUSY;}
 986  0023 be00          	ldw	x,_TIM4_tout
 987  0025 2604          	jrne	L125
 990  0027 a602          	ld	a,#2
 992  0029 2032          	jra	L03
 993  002b               L125:
 994                     ; 222 	I2C->CR2 &= ~I2C_CR2_STOP;
 996  002b 72135211      	bres	21009,#1
 997                     ; 223   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 999  002f 72145211      	bset	21009,#2
1000                     ; 225   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
1002  0033 72105211      	bset	21009,#0
1004  0037               L525:
1005                     ; 226   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
1007  0037 c65217        	ld	a,21015
1008  003a a501          	bcp	a,#1
1009  003c 2604          	jrne	L135
1011  003e be00          	ldw	x,_TIM4_tout
1012  0040 26f5          	jrne	L525
1013  0042               L135:
1014                     ; 228   if(tout())
1016  0042 be00          	ldw	x,_TIM4_tout
1017  0044 2706          	jreq	L735
1018                     ; 238       I2C->DR = (u8)(SlaveAddr << 1);   						// Send 7-bit device address & Write (R/W = 0)
1020  0046 7b02          	ld	a,(OFST+2,sp)
1021  0048 48            	sll	a
1022  0049 c75216        	ld	21014,a
1023  004c               L735:
1024                     ; 241   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
1026  004c c65217        	ld	a,21015
1027  004f a502          	bcp	a,#2
1028  0051 2604          	jrne	L345
1030  0053 be00          	ldw	x,_TIM4_tout
1031  0055 26f5          	jrne	L735
1032  0057               L345:
1033                     ; 242 	if(!tout()){
1035  0057 be00          	ldw	x,_TIM4_tout
1036  0059 2604          	jrne	L545
1037                     ; 243 		return IIC_ERROR_NOT_ACK;
1039  005b a603          	ld	a,#3
1041  005d               L03:
1043  005d 85            	popw	x
1044  005e 81            	ret
1045  005f               L545:
1046                     ; 246   I2C->SR3;
1049  005f c65219        	ld	a,21017
1050  0062 97            	ld	xl,a
1051                     ; 248 	if(NumByteToWrite > 0){
1053  0063 0d07          	tnz	(OFST+7,sp)
1054  0065 2733          	jreq	L745
1056  0067 201d          	jra	L355
1057  0069               L165:
1058                     ; 250 			while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
1060  0069 c65217        	ld	a,21015
1061  006c a580          	bcp	a,#128
1062  006e 2604          	jrne	L565
1064  0070 be00          	ldw	x,_TIM4_tout
1065  0072 26f5          	jrne	L165
1066  0074               L565:
1067                     ; 251 			if(tout())
1069  0074 be00          	ldw	x,_TIM4_tout
1070  0076 270e          	jreq	L355
1071                     ; 253 				I2C->DR = *pWriteDataBuffer++;                         			// Send register address
1073  0078 1e05          	ldw	x,(OFST+5,sp)
1074  007a 1c0001        	addw	x,#1
1075  007d 1f05          	ldw	(OFST+5,sp),x
1076  007f 1d0001        	subw	x,#1
1077  0082 f6            	ld	a,(x)
1078  0083 c75216        	ld	21014,a
1079  0086               L355:
1080                     ; 249 		while(NumByteToWrite--){
1082  0086 7b07          	ld	a,(OFST+7,sp)
1083  0088 0a07          	dec	(OFST+7,sp)
1084  008a 4d            	tnz	a
1085  008b 26dc          	jrne	L165
1087  008d               L375:
1088                     ; 256 		while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
1090  008d c65217        	ld	a,21015
1091  0090 a484          	and	a,#132
1092  0092 a184          	cp	a,#132
1093  0094 2704          	jreq	L745
1095  0096 be00          	ldw	x,_TIM4_tout
1096  0098 26f3          	jrne	L375
1097  009a               L745:
1098                     ; 267 	I2C->CR2 &= ~I2C_CR2_STOP;
1100  009a 72135211      	bres	21009,#1
1101                     ; 268   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
1103  009e 72105211      	bset	21009,#0
1105  00a2               L306:
1106                     ; 269   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
1108  00a2 c65217        	ld	a,21015
1109  00a5 a501          	bcp	a,#1
1110  00a7 2604          	jrne	L706
1112  00a9 be00          	ldw	x,_TIM4_tout
1113  00ab 26f5          	jrne	L306
1114  00ad               L706:
1115                     ; 271   if(tout())
1117  00ad be00          	ldw	x,_TIM4_tout
1118  00af 2708          	jreq	L516
1119                     ; 283       I2C->DR = (u8)(SlaveAddr << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
1121  00b1 7b02          	ld	a,(OFST+2,sp)
1122  00b3 48            	sll	a
1123  00b4 aa01          	or	a,#1
1124  00b6 c75216        	ld	21014,a
1125  00b9               L516:
1126                     ; 286   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
1128  00b9 c65217        	ld	a,21015
1129  00bc a502          	bcp	a,#2
1130  00be 2604          	jrne	L126
1132  00c0 be00          	ldw	x,_TIM4_tout
1133  00c2 26f5          	jrne	L516
1134  00c4               L126:
1135                     ; 287 	if(!tout()){
1137  00c4 be00          	ldw	x,_TIM4_tout
1138  00c6 2604          	jrne	L326
1139                     ; 288 		return IIC_ERROR_NOT_ACK;
1141  00c8 a603          	ld	a,#3
1143  00ca 2091          	jra	L03
1144  00cc               L326:
1145                     ; 291   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
1147  00cc 7b0a          	ld	a,(OFST+10,sp)
1148  00ce a103          	cp	a,#3
1149  00d0 2577          	jrult	L526
1150                     ; 293     I2C->SR3;                                     			// ADDR clearing sequence    
1152  00d2 c65219        	ld	a,21017
1153  00d5 97            	ld	xl,a
1155  00d6 201b          	jra	L136
1156  00d8               L736:
1157                     ; 296       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
1159  00d8 c65217        	ld	a,21015
1160  00db a504          	bcp	a,#4
1161  00dd 2604          	jrne	L346
1163  00df be00          	ldw	x,_TIM4_tout
1164  00e1 26f5          	jrne	L736
1165  00e3               L346:
1166                     ; 297 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
1168  00e3 1e08          	ldw	x,(OFST+8,sp)
1169  00e5 1c0001        	addw	x,#1
1170  00e8 1f08          	ldw	(OFST+8,sp),x
1171  00ea 1d0001        	subw	x,#1
1172  00ed c65216        	ld	a,21014
1173  00f0 f7            	ld	(x),a
1174                     ; 298       --NumByteToRead;																		// Decrease Numbyte to reade by 1
1176  00f1 0a0a          	dec	(OFST+10,sp)
1177  00f3               L136:
1178                     ; 294     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
1180  00f3 7b0a          	ld	a,(OFST+10,sp)
1181  00f5 a104          	cp	a,#4
1182  00f7 2504          	jrult	L156
1184  00f9 be00          	ldw	x,_TIM4_tout
1185  00fb 26db          	jrne	L736
1186  00fd               L156:
1187                     ; 301     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
1189  00fd c65217        	ld	a,21015
1190  0100 a504          	bcp	a,#4
1191  0102 2604          	jrne	L556
1193  0104 be00          	ldw	x,_TIM4_tout
1194  0106 26f5          	jrne	L156
1195  0108               L556:
1196                     ; 302     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
1198  0108 72155211      	bres	21009,#2
1199                     ; 303     disableInterrupts();                          			// Errata workaround (Disable interrupt)
1202  010c 9b            sim
1204                     ; 304     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
1207  010d 1e08          	ldw	x,(OFST+8,sp)
1208  010f 1c0001        	addw	x,#1
1209  0112 1f08          	ldw	(OFST+8,sp),x
1210  0114 1d0001        	subw	x,#1
1211  0117 c65216        	ld	a,21014
1212  011a f7            	ld	(x),a
1213                     ; 305     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
1215  011b 72125211      	bset	21009,#1
1216                     ; 306     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
1218  011f 1e08          	ldw	x,(OFST+8,sp)
1219  0121 1c0001        	addw	x,#1
1220  0124 1f08          	ldw	(OFST+8,sp),x
1221  0126 1d0001        	subw	x,#1
1222  0129 c65216        	ld	a,21014
1223  012c f7            	ld	(x),a
1224                     ; 307     enableInterrupts();																	// Errata workaround (Enable interrupt)
1227  012d 9a            rim
1231  012e               L166:
1232                     ; 308     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
1234  012e c65217        	ld	a,21015
1235  0131 a540          	bcp	a,#64
1236  0133 2604          	jrne	L566
1238  0135 be00          	ldw	x,_TIM4_tout
1239  0137 26f5          	jrne	L166
1240  0139               L566:
1241                     ; 309     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
1243  0139 1e08          	ldw	x,(OFST+8,sp)
1244  013b 1c0001        	addw	x,#1
1245  013e 1f08          	ldw	(OFST+8,sp),x
1246  0140 1d0001        	subw	x,#1
1247  0143 c65216        	ld	a,21014
1248  0146 f7            	ld	(x),a
1250  0147 205a          	jra	L717
1251  0149               L526:
1252                     ; 313    if(NumByteToRead == 2)                						// *** just two bytes are received? ***
1254  0149 7b0a          	ld	a,(OFST+10,sp)
1255  014b a102          	cp	a,#2
1256  014d 2635          	jrne	L176
1257                     ; 315       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
1259  014f 72165211      	bset	21009,#3
1260                     ; 316       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1263  0153 9b            sim
1265                     ; 317       I2C->SR3;                                       	// Clear ADDR Flag
1268  0154 c65219        	ld	a,21017
1269  0157 97            	ld	xl,a
1270                     ; 318       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
1272  0158 72155211      	bres	21009,#2
1273                     ; 319       enableInterrupts();																// Errata workaround (Enable interrupt)
1276  015c 9a            rim
1280  015d               L576:
1281                     ; 320       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
1283  015d c65217        	ld	a,21015
1284  0160 a504          	bcp	a,#4
1285  0162 2604          	jrne	L107
1287  0164 be00          	ldw	x,_TIM4_tout
1288  0166 26f5          	jrne	L576
1289  0168               L107:
1290                     ; 321       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1293  0168 9b            sim
1295                     ; 322       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
1298  0169 72125211      	bset	21009,#1
1299                     ; 323       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
1301  016d 1e08          	ldw	x,(OFST+8,sp)
1302  016f 1c0001        	addw	x,#1
1303  0172 1f08          	ldw	(OFST+8,sp),x
1304  0174 1d0001        	subw	x,#1
1305  0177 c65216        	ld	a,21014
1306  017a f7            	ld	(x),a
1307                     ; 324       enableInterrupts();																// Errata workaround (Enable interrupt)
1310  017b 9a            rim
1312                     ; 325 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
1315  017c 1e08          	ldw	x,(OFST+8,sp)
1316  017e c65216        	ld	a,21014
1317  0181 f7            	ld	(x),a
1319  0182 201f          	jra	L717
1320  0184               L176:
1321                     ; 329       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
1323  0184 72155211      	bres	21009,#2
1324                     ; 330       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1328  0188 9b            sim
1330                     ; 331       I2C->SR3;                                       	// Clear ADDR Flag   
1333  0189 c65219        	ld	a,21017
1334  018c 97            	ld	xl,a
1335                     ; 332       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
1337  018d 72125211      	bset	21009,#1
1338                     ; 333       enableInterrupts();																// Errata workaround (Enable interrupt)
1341  0191 9a            rim
1345  0192               L707:
1346                     ; 334       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
1348  0192 c65217        	ld	a,21015
1349  0195 a540          	bcp	a,#64
1350  0197 2604          	jrne	L317
1352  0199 be00          	ldw	x,_TIM4_tout
1353  019b 26f5          	jrne	L707
1354  019d               L317:
1355                     ; 335       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
1357  019d 1e08          	ldw	x,(OFST+8,sp)
1358  019f c65216        	ld	a,21014
1359  01a2 f7            	ld	(x),a
1360  01a3               L717:
1361                     ; 339   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
1363  01a3 c65211        	ld	a,21009
1364  01a6 a502          	bcp	a,#2
1365  01a8 2704          	jreq	L327
1367  01aa be00          	ldw	x,_TIM4_tout
1368  01ac 26f5          	jrne	L717
1369  01ae               L327:
1370                     ; 340   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
1372  01ae 72175211      	bres	21009,#3
1373                     ; 341 	return IIC_SUCCESS;
1375  01b2 4f            	clr	a
1378  01b3 85            	popw	x
1379  01b4 81            	ret
1403                     ; 351 void ErrProc(void)
1403                     ; 352 {
1404                     .text:	section	.text,new
1405  0000               _ErrProc:
1409                     ; 354     I2C->SR2= 0;
1411  0000 725f5218      	clr	21016
1412                     ; 356 	  I2C->CR2 |= 2;  
1414  0004 72125211      	bset	21009,#1
1415                     ; 358     TIM4_tout= 0;
1417  0008 5f            	clrw	x
1418  0009 bf00          	ldw	_TIM4_tout,x
1419                     ; 361 }
1422  000b 81            	ret
1447                     ; 374 @far @interrupt void I2C_error_Interrupt_Handler (void) {
1449                     .text:	section	.text,new
1450  0000               f_I2C_error_Interrupt_Handler:
1453  0000 3b0002        	push	c_x+2
1454  0003 be00          	ldw	x,c_x
1455  0005 89            	pushw	x
1456  0006 3b0002        	push	c_y+2
1457  0009 be00          	ldw	x,c_y
1458  000b 89            	pushw	x
1461                     ; 378 ErrProc();
1463  000c cd0000        	call	_ErrProc
1465                     ; 379 }
1468  000f 85            	popw	x
1469  0010 bf00          	ldw	c_y,x
1470  0012 320002        	pop	c_y+2
1471  0015 85            	popw	x
1472  0016 bf00          	ldw	c_x,x
1473  0018 320002        	pop	c_x+2
1474  001b 80            	iret
1497                     	xdef	f_I2C_error_Interrupt_Handler
1498                     	switch	.ubsct
1499  0000               _TIM4_tout:
1500  0000 0000          	ds.b	2
1501                     	xdef	_TIM4_tout
1502                     	xdef	_ErrProc
1503                     	xdef	_I2C_WriteReadBytes
1504                     	xdef	_I2C_ReadBytes
1505                     	xdef	_I2C_WriteBytes
1506                     	xdef	_I2C_Config
1507                     	xref	_I2C_SoftwareResetCmd
1508                     	xref	_I2C_Cmd
1509                     	xref	_I2C_Init
1510                     	xref	_I2C_DeInit
1511                     	xref	_CLK_GetClockFreq
1512                     	xref.b	c_lreg
1513                     	xref.b	c_x
1514                     	xref.b	c_y
1534                     	xref	c_ludv
1535                     	end
