   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  48                     .const:	section	.text
  49  0000               L6:
  50  0000 000f4240      	dc.l	1000000
  51                     ; 31 uint8_t I2C_Config(void) {
  52                     	scross	off
  53                     .text:	section	.text,new
  54  0000               _I2C_Config:
  56  0000 89            	pushw	x
  57       00000002      OFST:	set	2
  60                     ; 32 	uint16_t time_out = 0;
  62  0001 5f            	clrw	x
  63  0002 1f01          	ldw	(OFST-1,sp),x
  64                     ; 33 	enableInterrupts();
  67  0004 9a            rim
  69                     ; 36 	I2C_SoftwareResetCmd(ENABLE); 
  72  0005 a601          	ld	a,#1
  73  0007 cd0000        	call	_I2C_SoftwareResetCmd
  75                     ; 37 	I2C_DeInit();
  77  000a cd0000        	call	_I2C_DeInit
  79                     ; 39 	I2C_Init(100000,0x50,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,CLK_GetClockFreq()/1000000);
  81  000d cd0000        	call	_CLK_GetClockFreq
  83  0010 ae0000        	ldw	x,#L6
  84  0013 cd0000        	call	c_ludv
  86  0016 b603          	ld	a,c_lreg+3
  87  0018 88            	push	a
  88  0019 4b00          	push	#0
  89  001b 4b01          	push	#1
  90  001d 4b00          	push	#0
  91  001f ae0050        	ldw	x,#80
  92  0022 89            	pushw	x
  93  0023 ae86a0        	ldw	x,#34464
  94  0026 89            	pushw	x
  95  0027 ae0001        	ldw	x,#1
  96  002a 89            	pushw	x
  97  002b cd0000        	call	_I2C_Init
  99  002e 5b0a          	addw	sp,#10
 100                     ; 41 	I2C_Cmd(ENABLE);
 102  0030 a601          	ld	a,#1
 103  0032 cd0000        	call	_I2C_Cmd
 106  0035 2036          	jra	L72
 107  0037               L52:
 108                     ; 44 		set_tout_ms(10);
 110  0037 ae000a        	ldw	x,#10
 111  003a cf0000        	ldw	_TIM4_tout,x
 112                     ; 45     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 115  003d 72125211      	bset	21009,#1
 117  0041               L53:
 118                     ; 46     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 120  0041 c65211        	ld	a,21009
 121  0044 a502          	bcp	a,#2
 122  0046 2705          	jreq	L14
 124  0048 ce0000        	ldw	x,_TIM4_tout
 125  004b 26f4          	jrne	L53
 126  004d               L14:
 127                     ; 47 		time_out += 10;
 129  004d 1e01          	ldw	x,(OFST-1,sp)
 130  004f 1c000a        	addw	x,#10
 131  0052 1f01          	ldw	(OFST-1,sp),x
 132                     ; 48 		if(!tout()){
 134  0054 ce0000        	ldw	x,_TIM4_tout
 135  0057 2609          	jrne	L34
 136                     ; 49 			I2C_SoftwareResetCmd(ENABLE);
 138  0059 a601          	ld	a,#1
 139  005b cd0000        	call	_I2C_SoftwareResetCmd
 141                     ; 50 			I2C_SoftwareResetCmd(DISABLE);
 143  005e 4f            	clr	a
 144  005f cd0000        	call	_I2C_SoftwareResetCmd
 146  0062               L34:
 147                     ; 52 		if(time_out > 500){
 149  0062 1e01          	ldw	x,(OFST-1,sp)
 150  0064 a301f5        	cpw	x,#501
 151  0067 2504          	jrult	L72
 152                     ; 53 			return IIC_ERROR_BUSY;
 154  0069 a602          	ld	a,#2
 156  006b 2008          	jra	L01
 157  006d               L72:
 158                     ; 42   while((I2C->SR3 & I2C_SR3_BUSY))       									// Wait while the bus is busy
 160  006d c65219        	ld	a,21017
 161  0070 a502          	bcp	a,#2
 162  0072 26c3          	jrne	L52
 163                     ; 56 	return IIC_SUCCESS;
 165  0074 4f            	clr	a
 167  0075               L01:
 169  0075 85            	popw	x
 170  0076 81            	ret
 227                     ; 66 uint8_t I2C_WriteBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite, uint8_t TimeOutOfMs)
 227                     ; 67 {
 228                     .text:	section	.text,new
 229  0000               _I2C_WriteBytes:
 231  0000 89            	pushw	x
 232       00000000      OFST:	set	0
 235                     ; 68 	set_tout_ms(TimeOutOfMs);
 237  0001 7b08          	ld	a,(OFST+8,sp)
 238  0003 5f            	clrw	x
 239  0004 97            	ld	xl,a
 240  0005 cf0000        	ldw	_TIM4_tout,x
 243  0008 2010          	jra	L57
 244  000a               L37:
 245                     ; 71     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 247  000a 72125211      	bset	21009,#1
 249  000e               L301:
 250                     ; 72     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 252  000e c65211        	ld	a,21009
 253  0011 a502          	bcp	a,#2
 254  0013 2705          	jreq	L57
 256  0015 ce0000        	ldw	x,_TIM4_tout
 257  0018 26f4          	jrne	L301
 258  001a               L57:
 259                     ; 69   while((I2C->SR3 & I2C_SR3_BUSY) && tout())       									// Wait while the bus is busy
 261  001a c65219        	ld	a,21017
 262  001d a502          	bcp	a,#2
 263  001f 2705          	jreq	L111
 265  0021 ce0000        	ldw	x,_TIM4_tout
 266  0024 26e4          	jrne	L37
 267  0026               L111:
 268                     ; 74 	if(!tout()){return IIC_ERROR_BUSY;}
 270  0026 ce0000        	ldw	x,_TIM4_tout
 271  0029 2604          	jrne	L311
 274  002b a602          	ld	a,#2
 276  002d 201f          	jra	L41
 277  002f               L311:
 278                     ; 75   I2C->CR2 |= I2C_CR2_START;                        									// START=1, generate start
 280  002f 72105211      	bset	21009,#0
 282  0033               L711:
 283                     ; 76   while(((I2C->SR1 & I2C_SR1_SB)==0) && tout()); 									// Wait for start bit detection (SB)
 285  0033 c65217        	ld	a,21015
 286  0036 a501          	bcp	a,#1
 287  0038 2605          	jrne	L321
 289  003a ce0000        	ldw	x,_TIM4_tout
 290  003d 26f4          	jrne	L711
 291  003f               L321:
 292                     ; 78   if(tout())
 295  003f ce0000        	ldw	x,_TIM4_tout
 296  0042 2708          	jreq	L521
 297                     ; 88       I2C->DR = (u8)(SlaveAddr << 1);   									// Send 7-bit device address & Write (R/W = 0)
 299  0044 7b02          	ld	a,(OFST+2,sp)
 300  0046 48            	sll	a
 301  0047 c75216        	ld	21014,a
 303  004a 2004          	jra	L331
 304  004c               L521:
 305                     ; 91 		return IIC_ERROR_TIME_OUT;
 307  004c a601          	ld	a,#1
 309  004e               L41:
 311  004e 85            	popw	x
 312  004f 81            	ret
 313  0050               L331:
 314                     ; 93   while(!(I2C->SR1 & I2C_SR1_ADDR) && tout());     									// Wait for address ack (ADDR)
 316  0050 c65217        	ld	a,21015
 317  0053 a502          	bcp	a,#2
 318  0055 2605          	jrne	L731
 320  0057 ce0000        	ldw	x,_TIM4_tout
 321  005a 26f4          	jrne	L331
 322  005c               L731:
 323                     ; 94 	if(!tout()){
 325  005c ce0000        	ldw	x,_TIM4_tout
 326  005f 2608          	jrne	L141
 327                     ; 95 		I2C->CR2 |= I2C_CR2_STOP;
 329  0061 72125211      	bset	21009,#1
 330                     ; 96 		return IIC_ERROR_NOT_ACK;
 332  0065 a603          	ld	a,#3
 334  0067 20e5          	jra	L41
 335  0069               L141:
 336                     ; 99   I2C->SR3;
 339  0069 c65219        	ld	a,21017
 340  006c 97            	ld	xl,a
 342  006d               L541:
 343                     ; 100   while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  									// Wait for TxE
 345  006d c65217        	ld	a,21015
 346  0070 a580          	bcp	a,#128
 347  0072 2605          	jrne	L151
 349  0074 ce0000        	ldw	x,_TIM4_tout
 350  0077 26f4          	jrne	L541
 351  0079               L151:
 352                     ; 101   if(NumByteToWrite)
 354  0079 0d07          	tnz	(OFST+7,sp)
 355  007b 2736          	jreq	L351
 357  007d 201f          	jra	L751
 358  007f               L551:
 359                     ; 105 			I2C->DR = *pWriteDataBuffer++; 
 361  007f 1e05          	ldw	x,(OFST+5,sp)
 362  0081 1c0001        	addw	x,#1
 363  0084 1f05          	ldw	(OFST+5,sp),x
 364  0086 1d0001        	subw	x,#1
 365  0089 f6            	ld	a,(x)
 366  008a c75216        	ld	21014,a
 368  008d               L761:
 369                     ; 106 			while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  								// test EV8 - wait for TxE
 371  008d c65217        	ld	a,21015
 372  0090 a580          	bcp	a,#128
 373  0092 2605          	jrne	L371
 375  0094 ce0000        	ldw	x,_TIM4_tout
 376  0097 26f4          	jrne	L761
 377  0099               L371:
 378                     ; 107 			if(!tout()){
 380  0099 ce0000        	ldw	x,_TIM4_tout
 381  009c 2707          	jreq	L102
 382                     ; 108 				break;
 384  009e               L751:
 385                     ; 103 		while(NumByteToWrite--)
 387  009e 7b07          	ld	a,(OFST+7,sp)
 388  00a0 0a07          	dec	(OFST+7,sp)
 389  00a2 4d            	tnz	a
 390  00a3 26da          	jrne	L551
 391  00a5               L102:
 392                     ; 111 		while(((I2C->SR1 & (I2C_SR1_TXE|I2C_SR1_BTF)) != (I2C_SR1_TXE|I2C_SR1_BTF)) && tout()); 					// Wait for TxE & BTF
 394  00a5 c65217        	ld	a,21015
 395  00a8 a484          	and	a,#132
 396  00aa a184          	cp	a,#132
 397  00ac 2705          	jreq	L351
 399  00ae ce0000        	ldw	x,_TIM4_tout
 400  00b1 26f2          	jrne	L102
 401  00b3               L351:
 402                     ; 115   I2C->CR2 |= I2C_CR2_STOP;                        									// generate stop here (STOP=1)
 404  00b3 72125211      	bset	21009,#1
 406  00b7               L112:
 407                     ; 116   while((I2C->CR2 & I2C_CR2_STOP) && tout());      									// wait until stop is performed  
 409  00b7 c65211        	ld	a,21009
 410  00ba a502          	bcp	a,#2
 411  00bc 2705          	jreq	L512
 413  00be ce0000        	ldw	x,_TIM4_tout
 414  00c1 26f4          	jrne	L112
 415  00c3               L512:
 416                     ; 117 	if(!tout()){
 418  00c3 ce0000        	ldw	x,_TIM4_tout
 419  00c6 2604          	jrne	L712
 420                     ; 118 		return IIC_ERROR_TIME_OUT;
 422  00c8 a601          	ld	a,#1
 424  00ca 2001          	jra	L61
 425  00cc               L712:
 426                     ; 120 		return IIC_SUCCESS;
 428  00cc 4f            	clr	a
 430  00cd               L61:
 432  00cd 85            	popw	x
 433  00ce 81            	ret
 498                     ; 124 uint8_t I2C_ReadBytes(uint16_t SlaveAddr, uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 498                     ; 125 {
 499                     .text:	section	.text,new
 500  0000               _I2C_ReadBytes:
 502  0000 89            	pushw	x
 503       00000000      OFST:	set	0
 506                     ; 126 	set_tout_ms(TimeOutOfMs);
 508  0001 7b08          	ld	a,(OFST+8,sp)
 509  0003 5f            	clrw	x
 510  0004 97            	ld	xl,a
 511  0005 cf0000        	ldw	_TIM4_tout,x
 514  0008 2010          	jra	L152
 515  000a               L742:
 516                     ; 130 		I2C->CR2 |= I2C_CR2_STOP;                   				// STOP=1, generate stop
 518  000a 72125211      	bset	21009,#1
 520  000e               L752:
 521                     ; 131     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// wait until stop is performed
 523  000e c65211        	ld	a,21009
 524  0011 a502          	bcp	a,#2
 525  0013 2705          	jreq	L152
 527  0015 ce0000        	ldw	x,_TIM4_tout
 528  0018 26f4          	jrne	L752
 529  001a               L152:
 530                     ; 128 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 532  001a c65219        	ld	a,21017
 533  001d a502          	bcp	a,#2
 534  001f 2705          	jreq	L562
 536  0021 ce0000        	ldw	x,_TIM4_tout
 537  0024 26e4          	jrne	L742
 538  0026               L562:
 539                     ; 133 	if(!tout()){return IIC_ERROR_BUSY;}
 541  0026 ce0000        	ldw	x,_TIM4_tout
 542  0029 2604          	jrne	L762
 545  002b a602          	ld	a,#2
 547  002d 2033          	jra	L22
 548  002f               L762:
 549                     ; 134 	I2C->CR2 &= ~I2C_CR2_STOP;
 551  002f 72135211      	bres	21009,#1
 552                     ; 135   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 554  0033 72145211      	bset	21009,#2
 555                     ; 137   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 557  0037 72105211      	bset	21009,#0
 559  003b               L372:
 560                     ; 138   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// wait for start bit detection (SB)
 562  003b c65217        	ld	a,21015
 563  003e a501          	bcp	a,#1
 564  0040 2605          	jrne	L772
 566  0042 ce0000        	ldw	x,_TIM4_tout
 567  0045 26f4          	jrne	L372
 568  0047               L772:
 569                     ; 149     I2C->DR = (u8)(SlaveAddr << 1) | 1;       			// Send 7-bit device address & Write (R/W = 1)
 571  0047 7b02          	ld	a,(OFST+2,sp)
 572  0049 48            	sll	a
 573  004a aa01          	or	a,#1
 574  004c c75216        	ld	21014,a
 576  004f               L503:
 577                     ; 151   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());				// Wait for address ack (ADDR)
 579  004f c65217        	ld	a,21015
 580  0052 a502          	bcp	a,#2
 581  0054 2605          	jrne	L113
 583  0056 ce0000        	ldw	x,_TIM4_tout
 584  0059 26f4          	jrne	L503
 585  005b               L113:
 586                     ; 152 	if(!tout()){
 588  005b ce0000        	ldw	x,_TIM4_tout
 589  005e 2604          	jrne	L313
 590                     ; 153 		return IIC_ERROR_NOT_ACK;
 592  0060 a603          	ld	a,#3
 594  0062               L22:
 596  0062 85            	popw	x
 597  0063 81            	ret
 598  0064               L313:
 599                     ; 156   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 601  0064 7b07          	ld	a,(OFST+7,sp)
 602  0066 a103          	cp	a,#3
 603  0068 257b          	jrult	L513
 604                     ; 158     I2C->SR3;                                     			// ADDR clearing sequence    
 606  006a c65219        	ld	a,21017
 607  006d 97            	ld	xl,a
 609  006e 201c          	jra	L123
 610  0070               L723:
 611                     ; 161       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 613  0070 c65217        	ld	a,21015
 614  0073 a504          	bcp	a,#4
 615  0075 2605          	jrne	L333
 617  0077 ce0000        	ldw	x,_TIM4_tout
 618  007a 26f4          	jrne	L723
 619  007c               L333:
 620                     ; 162 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
 622  007c 1e05          	ldw	x,(OFST+5,sp)
 623  007e 1c0001        	addw	x,#1
 624  0081 1f05          	ldw	(OFST+5,sp),x
 625  0083 1d0001        	subw	x,#1
 626  0086 c65216        	ld	a,21014
 627  0089 f7            	ld	(x),a
 628                     ; 163       --NumByteToRead;																		// Decrease Numbyte to reade by 1
 630  008a 0a07          	dec	(OFST+7,sp)
 631  008c               L123:
 632                     ; 159     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
 634  008c 7b07          	ld	a,(OFST+7,sp)
 635  008e a104          	cp	a,#4
 636  0090 2505          	jrult	L143
 638  0092 ce0000        	ldw	x,_TIM4_tout
 639  0095 26d9          	jrne	L723
 640  0097               L143:
 641                     ; 166     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 643  0097 c65217        	ld	a,21015
 644  009a a504          	bcp	a,#4
 645  009c 2605          	jrne	L543
 647  009e ce0000        	ldw	x,_TIM4_tout
 648  00a1 26f4          	jrne	L143
 649  00a3               L543:
 650                     ; 167     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 652  00a3 72155211      	bres	21009,#2
 653                     ; 168     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 656  00a7 9b            sim
 658                     ; 169     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
 661  00a8 1e05          	ldw	x,(OFST+5,sp)
 662  00aa 1c0001        	addw	x,#1
 663  00ad 1f05          	ldw	(OFST+5,sp),x
 664  00af 1d0001        	subw	x,#1
 665  00b2 c65216        	ld	a,21014
 666  00b5 f7            	ld	(x),a
 667                     ; 170     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 669  00b6 72125211      	bset	21009,#1
 670                     ; 171     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
 672  00ba 1e05          	ldw	x,(OFST+5,sp)
 673  00bc 1c0001        	addw	x,#1
 674  00bf 1f05          	ldw	(OFST+5,sp),x
 675  00c1 1d0001        	subw	x,#1
 676  00c4 c65216        	ld	a,21014
 677  00c7 f7            	ld	(x),a
 678                     ; 172     enableInterrupts();																	// Errata workaround (Enable interrupt)
 681  00c8 9a            rim
 685  00c9               L153:
 686                     ; 173     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 688  00c9 c65217        	ld	a,21015
 689  00cc a540          	bcp	a,#64
 690  00ce 2605          	jrne	L553
 692  00d0 ce0000        	ldw	x,_TIM4_tout
 693  00d3 26f4          	jrne	L153
 694  00d5               L553:
 695                     ; 174     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 697  00d5 1e05          	ldw	x,(OFST+5,sp)
 698  00d7 1c0001        	addw	x,#1
 699  00da 1f05          	ldw	(OFST+5,sp),x
 700  00dc 1d0001        	subw	x,#1
 701  00df c65216        	ld	a,21014
 702  00e2 f7            	ld	(x),a
 704  00e3 205c          	jra	L704
 705  00e5               L513:
 706                     ; 178     if(NumByteToRead == 2)                						// *** just two bytes are received? ***
 708  00e5 7b07          	ld	a,(OFST+7,sp)
 709  00e7 a102          	cp	a,#2
 710  00e9 2636          	jrne	L163
 711                     ; 180       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 713  00eb 72165211      	bset	21009,#3
 714                     ; 181       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 717  00ef 9b            sim
 719                     ; 182       I2C->SR3;                                       	// Clear ADDR Flag
 722  00f0 c65219        	ld	a,21017
 723  00f3 97            	ld	xl,a
 724                     ; 183       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 726  00f4 72155211      	bres	21009,#2
 727                     ; 184       enableInterrupts();																// Errata workaround (Enable interrupt)
 730  00f8 9a            rim
 734  00f9               L563:
 735                     ; 185       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 737  00f9 c65217        	ld	a,21015
 738  00fc a504          	bcp	a,#4
 739  00fe 2605          	jrne	L173
 741  0100 ce0000        	ldw	x,_TIM4_tout
 742  0103 26f4          	jrne	L563
 743  0105               L173:
 744                     ; 186       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 747  0105 9b            sim
 749                     ; 187       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 752  0106 72125211      	bset	21009,#1
 753                     ; 188       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 755  010a 1e05          	ldw	x,(OFST+5,sp)
 756  010c 1c0001        	addw	x,#1
 757  010f 1f05          	ldw	(OFST+5,sp),x
 758  0111 1d0001        	subw	x,#1
 759  0114 c65216        	ld	a,21014
 760  0117 f7            	ld	(x),a
 761                     ; 189       enableInterrupts();																// Errata workaround (Enable interrupt)
 764  0118 9a            rim
 766                     ; 190 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
 769  0119 1e05          	ldw	x,(OFST+5,sp)
 770  011b c65216        	ld	a,21014
 771  011e f7            	ld	(x),a
 773  011f 2020          	jra	L704
 774  0121               L163:
 775                     ; 194       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 777  0121 72155211      	bres	21009,#2
 778                     ; 195       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 782  0125 9b            sim
 784                     ; 196       I2C->SR3;                                       	// Clear ADDR Flag   
 787  0126 c65219        	ld	a,21017
 788  0129 97            	ld	xl,a
 789                     ; 197       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 791  012a 72125211      	bset	21009,#1
 792                     ; 198       enableInterrupts();																// Errata workaround (Enable interrupt)
 795  012e 9a            rim
 799  012f               L773:
 800                     ; 199       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 802  012f c65217        	ld	a,21015
 803  0132 a540          	bcp	a,#64
 804  0134 2605          	jrne	L304
 806  0136 ce0000        	ldw	x,_TIM4_tout
 807  0139 26f4          	jrne	L773
 808  013b               L304:
 809                     ; 200       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
 811  013b 1e05          	ldw	x,(OFST+5,sp)
 812  013d c65216        	ld	a,21014
 813  0140 f7            	ld	(x),a
 814  0141               L704:
 815                     ; 204   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 817  0141 c65211        	ld	a,21009
 818  0144 a502          	bcp	a,#2
 819  0146 2705          	jreq	L314
 821  0148 ce0000        	ldw	x,_TIM4_tout
 822  014b 26f4          	jrne	L704
 823  014d               L314:
 824                     ; 205   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 826  014d 72175211      	bres	21009,#3
 827                     ; 206 	if(!tout()){
 829  0151 ce0000        	ldw	x,_TIM4_tout
 830  0154 2604          	jrne	L514
 831                     ; 207 		return IIC_ERROR_TIME_OUT;
 833  0156 a601          	ld	a,#1
 835  0158 2001          	jra	L42
 836  015a               L514:
 837                     ; 209 		return IIC_SUCCESS;
 839  015a 4f            	clr	a
 841  015b               L42:
 843  015b 85            	popw	x
 844  015c 81            	ret
 927                     ; 213 uint8_t I2C_WriteReadBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite,uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 927                     ; 214 {
 928                     .text:	section	.text,new
 929  0000               _I2C_WriteReadBytes:
 931  0000 89            	pushw	x
 932       00000000      OFST:	set	0
 935                     ; 215 	set_tout_ms(TimeOutOfMs);
 937  0001 7b0b          	ld	a,(OFST+11,sp)
 938  0003 5f            	clrw	x
 939  0004 97            	ld	xl,a
 940  0005 cf0000        	ldw	_TIM4_tout,x
 943  0008 2010          	jra	L554
 944  000a               L354:
 945                     ; 219 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 947  000a 72125211      	bset	21009,#1
 949  000e               L364:
 950                     ; 220     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 952  000e c65211        	ld	a,21009
 953  0011 a502          	bcp	a,#2
 954  0013 2705          	jreq	L554
 956  0015 ce0000        	ldw	x,_TIM4_tout
 957  0018 26f4          	jrne	L364
 958  001a               L554:
 959                     ; 217 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 961  001a c65219        	ld	a,21017
 962  001d a502          	bcp	a,#2
 963  001f 2705          	jreq	L174
 965  0021 ce0000        	ldw	x,_TIM4_tout
 966  0024 26e4          	jrne	L354
 967  0026               L174:
 968                     ; 222 	if(!tout()){return IIC_ERROR_BUSY;}
 970  0026 ce0000        	ldw	x,_TIM4_tout
 971  0029 2604          	jrne	L374
 974  002b a602          	ld	a,#2
 976  002d 2036          	jra	L03
 977  002f               L374:
 978                     ; 223 	I2C->CR2 &= ~I2C_CR2_STOP;
 980  002f 72135211      	bres	21009,#1
 981                     ; 224   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 983  0033 72145211      	bset	21009,#2
 984                     ; 226   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 986  0037 72105211      	bset	21009,#0
 988  003b               L774:
 989                     ; 227   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 991  003b c65217        	ld	a,21015
 992  003e a501          	bcp	a,#1
 993  0040 2605          	jrne	L305
 995  0042 ce0000        	ldw	x,_TIM4_tout
 996  0045 26f4          	jrne	L774
 997  0047               L305:
 998                     ; 229   if(tout())
1000  0047 ce0000        	ldw	x,_TIM4_tout
1001  004a 2706          	jreq	L115
1002                     ; 239       I2C->DR = (u8)(SlaveAddr << 1);   						// Send 7-bit device address & Write (R/W = 0)
1004  004c 7b02          	ld	a,(OFST+2,sp)
1005  004e 48            	sll	a
1006  004f c75216        	ld	21014,a
1007  0052               L115:
1008                     ; 242   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
1010  0052 c65217        	ld	a,21015
1011  0055 a502          	bcp	a,#2
1012  0057 2605          	jrne	L515
1014  0059 ce0000        	ldw	x,_TIM4_tout
1015  005c 26f4          	jrne	L115
1016  005e               L515:
1017                     ; 243 	if(!tout()){
1019  005e ce0000        	ldw	x,_TIM4_tout
1020  0061 2604          	jrne	L715
1021                     ; 244 		return IIC_ERROR_NOT_ACK;
1023  0063 a603          	ld	a,#3
1025  0065               L03:
1027  0065 85            	popw	x
1028  0066 81            	ret
1029  0067               L715:
1030                     ; 247   I2C->SR3;
1033  0067 c65219        	ld	a,21017
1034  006a 97            	ld	xl,a
1035                     ; 249 	if(NumByteToWrite > 0){
1037  006b 0d07          	tnz	(OFST+7,sp)
1038  006d 2736          	jreq	L125
1040  006f 201f          	jra	L525
1041  0071               L335:
1042                     ; 251 			while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
1044  0071 c65217        	ld	a,21015
1045  0074 a580          	bcp	a,#128
1046  0076 2605          	jrne	L735
1048  0078 ce0000        	ldw	x,_TIM4_tout
1049  007b 26f4          	jrne	L335
1050  007d               L735:
1051                     ; 252 			if(tout())
1053  007d ce0000        	ldw	x,_TIM4_tout
1054  0080 270e          	jreq	L525
1055                     ; 254 				I2C->DR = *pWriteDataBuffer++;                         			// Send register address
1057  0082 1e05          	ldw	x,(OFST+5,sp)
1058  0084 1c0001        	addw	x,#1
1059  0087 1f05          	ldw	(OFST+5,sp),x
1060  0089 1d0001        	subw	x,#1
1061  008c f6            	ld	a,(x)
1062  008d c75216        	ld	21014,a
1063  0090               L525:
1064                     ; 250 		while(NumByteToWrite--){
1066  0090 7b07          	ld	a,(OFST+7,sp)
1067  0092 0a07          	dec	(OFST+7,sp)
1068  0094 4d            	tnz	a
1069  0095 26da          	jrne	L335
1071  0097               L545:
1072                     ; 257 		while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
1074  0097 c65217        	ld	a,21015
1075  009a a484          	and	a,#132
1076  009c a184          	cp	a,#132
1077  009e 2705          	jreq	L125
1079  00a0 ce0000        	ldw	x,_TIM4_tout
1080  00a3 26f2          	jrne	L545
1081  00a5               L125:
1082                     ; 261 	delay(10);
1084  00a5 ae000a        	ldw	x,#10
1085  00a8 cd0000        	call	_delay
1087                     ; 271 	I2C->CR2 &= ~I2C_CR2_STOP;
1089  00ab 72135211      	bres	21009,#1
1090                     ; 272   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
1092  00af 72105211      	bset	21009,#0
1094  00b3               L555:
1095                     ; 273   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
1097  00b3 c65217        	ld	a,21015
1098  00b6 a501          	bcp	a,#1
1099  00b8 2605          	jrne	L165
1101  00ba ce0000        	ldw	x,_TIM4_tout
1102  00bd 26f4          	jrne	L555
1103  00bf               L165:
1104                     ; 275   if(tout())
1106  00bf ce0000        	ldw	x,_TIM4_tout
1107  00c2 2708          	jreq	L765
1108                     ; 287       I2C->DR = (u8)(SlaveAddr << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
1110  00c4 7b02          	ld	a,(OFST+2,sp)
1111  00c6 48            	sll	a
1112  00c7 aa01          	or	a,#1
1113  00c9 c75216        	ld	21014,a
1114  00cc               L765:
1115                     ; 290   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
1117  00cc c65217        	ld	a,21015
1118  00cf a502          	bcp	a,#2
1119  00d1 2605          	jrne	L375
1121  00d3 ce0000        	ldw	x,_TIM4_tout
1122  00d6 26f4          	jrne	L765
1123  00d8               L375:
1124                     ; 291 	if(!tout()){
1126  00d8 ce0000        	ldw	x,_TIM4_tout
1127  00db 2604          	jrne	L575
1128                     ; 292 		return IIC_ERROR_NOT_ACK;
1130  00dd a603          	ld	a,#3
1132  00df 2084          	jra	L03
1133  00e1               L575:
1134                     ; 295   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
1136  00e1 7b0a          	ld	a,(OFST+10,sp)
1137  00e3 a103          	cp	a,#3
1138  00e5 257b          	jrult	L775
1139                     ; 297     I2C->SR3;                                     			// ADDR clearing sequence    
1141  00e7 c65219        	ld	a,21017
1142  00ea 97            	ld	xl,a
1144  00eb 201c          	jra	L306
1145  00ed               L116:
1146                     ; 300       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
1148  00ed c65217        	ld	a,21015
1149  00f0 a504          	bcp	a,#4
1150  00f2 2605          	jrne	L516
1152  00f4 ce0000        	ldw	x,_TIM4_tout
1153  00f7 26f4          	jrne	L116
1154  00f9               L516:
1155                     ; 301 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
1157  00f9 1e08          	ldw	x,(OFST+8,sp)
1158  00fb 1c0001        	addw	x,#1
1159  00fe 1f08          	ldw	(OFST+8,sp),x
1160  0100 1d0001        	subw	x,#1
1161  0103 c65216        	ld	a,21014
1162  0106 f7            	ld	(x),a
1163                     ; 302       --NumByteToRead;																		// Decrease Numbyte to reade by 1
1165  0107 0a0a          	dec	(OFST+10,sp)
1166  0109               L306:
1167                     ; 298     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
1169  0109 7b0a          	ld	a,(OFST+10,sp)
1170  010b a104          	cp	a,#4
1171  010d 2505          	jrult	L326
1173  010f ce0000        	ldw	x,_TIM4_tout
1174  0112 26d9          	jrne	L116
1175  0114               L326:
1176                     ; 305     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
1178  0114 c65217        	ld	a,21015
1179  0117 a504          	bcp	a,#4
1180  0119 2605          	jrne	L726
1182  011b ce0000        	ldw	x,_TIM4_tout
1183  011e 26f4          	jrne	L326
1184  0120               L726:
1185                     ; 306     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
1187  0120 72155211      	bres	21009,#2
1188                     ; 307     disableInterrupts();                          			// Errata workaround (Disable interrupt)
1191  0124 9b            sim
1193                     ; 308     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
1196  0125 1e08          	ldw	x,(OFST+8,sp)
1197  0127 1c0001        	addw	x,#1
1198  012a 1f08          	ldw	(OFST+8,sp),x
1199  012c 1d0001        	subw	x,#1
1200  012f c65216        	ld	a,21014
1201  0132 f7            	ld	(x),a
1202                     ; 309     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
1204  0133 72125211      	bset	21009,#1
1205                     ; 310     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
1207  0137 1e08          	ldw	x,(OFST+8,sp)
1208  0139 1c0001        	addw	x,#1
1209  013c 1f08          	ldw	(OFST+8,sp),x
1210  013e 1d0001        	subw	x,#1
1211  0141 c65216        	ld	a,21014
1212  0144 f7            	ld	(x),a
1213                     ; 311     enableInterrupts();																	// Errata workaround (Enable interrupt)
1216  0145 9a            rim
1220  0146               L336:
1221                     ; 312     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
1223  0146 c65217        	ld	a,21015
1224  0149 a540          	bcp	a,#64
1225  014b 2605          	jrne	L736
1227  014d ce0000        	ldw	x,_TIM4_tout
1228  0150 26f4          	jrne	L336
1229  0152               L736:
1230                     ; 313     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
1232  0152 1e08          	ldw	x,(OFST+8,sp)
1233  0154 1c0001        	addw	x,#1
1234  0157 1f08          	ldw	(OFST+8,sp),x
1235  0159 1d0001        	subw	x,#1
1236  015c c65216        	ld	a,21014
1237  015f f7            	ld	(x),a
1239  0160 205c          	jra	L176
1240  0162               L775:
1241                     ; 317    if(NumByteToRead == 2)                						// *** just two bytes are received? ***
1243  0162 7b0a          	ld	a,(OFST+10,sp)
1244  0164 a102          	cp	a,#2
1245  0166 2636          	jrne	L346
1246                     ; 319       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
1248  0168 72165211      	bset	21009,#3
1249                     ; 320       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1252  016c 9b            sim
1254                     ; 321       I2C->SR3;                                       	// Clear ADDR Flag
1257  016d c65219        	ld	a,21017
1258  0170 97            	ld	xl,a
1259                     ; 322       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
1261  0171 72155211      	bres	21009,#2
1262                     ; 323       enableInterrupts();																// Errata workaround (Enable interrupt)
1265  0175 9a            rim
1269  0176               L746:
1270                     ; 324       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
1272  0176 c65217        	ld	a,21015
1273  0179 a504          	bcp	a,#4
1274  017b 2605          	jrne	L356
1276  017d ce0000        	ldw	x,_TIM4_tout
1277  0180 26f4          	jrne	L746
1278  0182               L356:
1279                     ; 325       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1282  0182 9b            sim
1284                     ; 326       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
1287  0183 72125211      	bset	21009,#1
1288                     ; 327       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
1290  0187 1e08          	ldw	x,(OFST+8,sp)
1291  0189 1c0001        	addw	x,#1
1292  018c 1f08          	ldw	(OFST+8,sp),x
1293  018e 1d0001        	subw	x,#1
1294  0191 c65216        	ld	a,21014
1295  0194 f7            	ld	(x),a
1296                     ; 328       enableInterrupts();																// Errata workaround (Enable interrupt)
1299  0195 9a            rim
1301                     ; 329 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
1304  0196 1e08          	ldw	x,(OFST+8,sp)
1305  0198 c65216        	ld	a,21014
1306  019b f7            	ld	(x),a
1308  019c 2020          	jra	L176
1309  019e               L346:
1310                     ; 333       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
1312  019e 72155211      	bres	21009,#2
1313                     ; 334       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1317  01a2 9b            sim
1319                     ; 335       I2C->SR3;                                       	// Clear ADDR Flag   
1322  01a3 c65219        	ld	a,21017
1323  01a6 97            	ld	xl,a
1324                     ; 336       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
1326  01a7 72125211      	bset	21009,#1
1327                     ; 337       enableInterrupts();																// Errata workaround (Enable interrupt)
1330  01ab 9a            rim
1334  01ac               L166:
1335                     ; 338       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
1337  01ac c65217        	ld	a,21015
1338  01af a540          	bcp	a,#64
1339  01b1 2605          	jrne	L566
1341  01b3 ce0000        	ldw	x,_TIM4_tout
1342  01b6 26f4          	jrne	L166
1343  01b8               L566:
1344                     ; 339       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
1346  01b8 1e08          	ldw	x,(OFST+8,sp)
1347  01ba c65216        	ld	a,21014
1348  01bd f7            	ld	(x),a
1349  01be               L176:
1350                     ; 343   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
1352  01be c65211        	ld	a,21009
1353  01c1 a502          	bcp	a,#2
1354  01c3 2705          	jreq	L576
1356  01c5 ce0000        	ldw	x,_TIM4_tout
1357  01c8 26f4          	jrne	L176
1358  01ca               L576:
1359                     ; 344   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
1361  01ca 72175211      	bres	21009,#3
1362                     ; 345 	return IIC_SUCCESS;
1364  01ce 4f            	clr	a
1367  01cf 85            	popw	x
1368  01d0 81            	ret
1392                     ; 355 void ErrProc(void)
1392                     ; 356 {
1393                     .text:	section	.text,new
1394  0000               _ErrProc:
1398                     ; 358     I2C->SR2= 0;
1400  0000 725f5218      	clr	21016
1401                     ; 360 	  I2C->CR2 |= 2;  
1403  0004 72125211      	bset	21009,#1
1404                     ; 362     TIM4_tout= 0;
1406  0008 5f            	clrw	x
1407  0009 cf0000        	ldw	_TIM4_tout,x
1408                     ; 365 }
1411  000c 81            	ret
1436                     ; 378 @far @interrupt void I2C_error_Interrupt_Handler (void) {
1438                     .text:	section	.text,new
1439  0000               f_I2C_error_Interrupt_Handler:
1442  0000 3b0002        	push	c_x+2
1443  0003 be00          	ldw	x,c_x
1444  0005 89            	pushw	x
1445  0006 3b0002        	push	c_y+2
1446  0009 be00          	ldw	x,c_y
1447  000b 89            	pushw	x
1450                     ; 382 ErrProc();
1452  000c cd0000        	call	_ErrProc
1454                     ; 383 }
1457  000f 85            	popw	x
1458  0010 bf00          	ldw	c_y,x
1459  0012 320002        	pop	c_y+2
1460  0015 85            	popw	x
1461  0016 bf00          	ldw	c_x,x
1462  0018 320002        	pop	c_x+2
1463  001b 80            	iret
1486                     	xdef	f_I2C_error_Interrupt_Handler
1487                     	switch	.bss
1488  0000               _TIM4_tout:
1489  0000 0000          	ds.b	2
1490                     	xdef	_TIM4_tout
1491                     	xdef	_ErrProc
1492                     	xdef	_I2C_WriteReadBytes
1493                     	xdef	_I2C_ReadBytes
1494                     	xdef	_I2C_WriteBytes
1495                     	xdef	_I2C_Config
1496                     	xref	_delay
1497                     	xref	_I2C_SoftwareResetCmd
1498                     	xref	_I2C_Cmd
1499                     	xref	_I2C_Init
1500                     	xref	_I2C_DeInit
1501                     	xref	_CLK_GetClockFreq
1502                     	xref.b	c_lreg
1503                     	xref.b	c_x
1504                     	xref.b	c_y
1524                     	xref	c_ludv
1525                     	end
