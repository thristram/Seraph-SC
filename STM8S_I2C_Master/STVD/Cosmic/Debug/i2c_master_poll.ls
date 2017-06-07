   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  48                     .const:	section	.text
  49  0000               L6:
  50  0000 000f4240      	dc.l	1000000
  51                     ; 30 uint8_t I2C_Config(void) {
  52                     	scross	off
  53                     .text:	section	.text,new
  54  0000               _I2C_Config:
  56  0000 89            	pushw	x
  57       00000002      OFST:	set	2
  60                     ; 31 	uint16_t time_out = 0;
  62  0001 5f            	clrw	x
  63  0002 1f01          	ldw	(OFST-1,sp),x
  64                     ; 32 	enableInterrupts();
  67  0004 9a            rim
  69                     ; 36 	I2C_DeInit();
  72  0005 cd0000        	call	_I2C_DeInit
  74                     ; 38 	I2C_Init(100000,0x50,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,CLK_GetClockFreq()/1000000);
  76  0008 cd0000        	call	_CLK_GetClockFreq
  78  000b ae0000        	ldw	x,#L6
  79  000e cd0000        	call	c_ludv
  81  0011 b603          	ld	a,c_lreg+3
  82  0013 88            	push	a
  83  0014 4b00          	push	#0
  84  0016 4b01          	push	#1
  85  0018 4b00          	push	#0
  86  001a ae0050        	ldw	x,#80
  87  001d 89            	pushw	x
  88  001e ae86a0        	ldw	x,#34464
  89  0021 89            	pushw	x
  90  0022 ae0001        	ldw	x,#1
  91  0025 89            	pushw	x
  92  0026 cd0000        	call	_I2C_Init
  94  0029 5b0a          	addw	sp,#10
  95                     ; 40 	I2C_Cmd(ENABLE);
  97  002b a601          	ld	a,#1
  98  002d cd0000        	call	_I2C_Cmd
 101  0030 2036          	jra	L72
 102  0032               L52:
 103                     ; 43 		set_tout_ms(10);
 105  0032 ae000a        	ldw	x,#10
 106  0035 cf0000        	ldw	_TIM4_tout,x
 107                     ; 44     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 110  0038 72125211      	bset	21009,#1
 112  003c               L53:
 113                     ; 45     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 115  003c c65211        	ld	a,21009
 116  003f a502          	bcp	a,#2
 117  0041 2705          	jreq	L14
 119  0043 ce0000        	ldw	x,_TIM4_tout
 120  0046 26f4          	jrne	L53
 121  0048               L14:
 122                     ; 46 		time_out += 10;
 124  0048 1e01          	ldw	x,(OFST-1,sp)
 125  004a 1c000a        	addw	x,#10
 126  004d 1f01          	ldw	(OFST-1,sp),x
 127                     ; 47 		if(!tout()){
 129  004f ce0000        	ldw	x,_TIM4_tout
 130  0052 2609          	jrne	L34
 131                     ; 48 			I2C_SoftwareResetCmd(ENABLE);
 133  0054 a601          	ld	a,#1
 134  0056 cd0000        	call	_I2C_SoftwareResetCmd
 136                     ; 49 			I2C_SoftwareResetCmd(DISABLE);
 138  0059 4f            	clr	a
 139  005a cd0000        	call	_I2C_SoftwareResetCmd
 141  005d               L34:
 142                     ; 51 		if(time_out > 500){
 144  005d 1e01          	ldw	x,(OFST-1,sp)
 145  005f a301f5        	cpw	x,#501
 146  0062 2504          	jrult	L72
 147                     ; 52 			return IIC_ERROR_BUSY;
 149  0064 a602          	ld	a,#2
 151  0066 2008          	jra	L01
 152  0068               L72:
 153                     ; 41   while((I2C->SR3 & I2C_SR3_BUSY))       									// Wait while the bus is busy
 155  0068 c65219        	ld	a,21017
 156  006b a502          	bcp	a,#2
 157  006d 26c3          	jrne	L52
 158                     ; 55 	return IIC_SUCCESS;
 160  006f 4f            	clr	a
 162  0070               L01:
 164  0070 85            	popw	x
 165  0071 81            	ret
 222                     ; 65 uint8_t I2C_WriteBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite, uint8_t TimeOutOfMs)
 222                     ; 66 {
 223                     .text:	section	.text,new
 224  0000               _I2C_WriteBytes:
 226  0000 89            	pushw	x
 227       00000000      OFST:	set	0
 230                     ; 67 	set_tout_ms(TimeOutOfMs);
 232  0001 7b08          	ld	a,(OFST+8,sp)
 233  0003 5f            	clrw	x
 234  0004 97            	ld	xl,a
 235  0005 cf0000        	ldw	_TIM4_tout,x
 238  0008 2010          	jra	L57
 239  000a               L37:
 240                     ; 70     I2C->CR2 |= I2C_CR2_STOP;                        								// STOP=1, generate stop
 242  000a 72125211      	bset	21009,#1
 244  000e               L301:
 245                     ; 71     while((I2C->CR2 & I2C_CR2_STOP) && tout());      								// wait until stop is performed
 247  000e c65211        	ld	a,21009
 248  0011 a502          	bcp	a,#2
 249  0013 2705          	jreq	L57
 251  0015 ce0000        	ldw	x,_TIM4_tout
 252  0018 26f4          	jrne	L301
 253  001a               L57:
 254                     ; 68   while((I2C->SR3 & I2C_SR3_BUSY) && tout())       									// Wait while the bus is busy
 256  001a c65219        	ld	a,21017
 257  001d a502          	bcp	a,#2
 258  001f 2705          	jreq	L111
 260  0021 ce0000        	ldw	x,_TIM4_tout
 261  0024 26e4          	jrne	L37
 262  0026               L111:
 263                     ; 73 	if(!tout()){return IIC_ERROR_BUSY;}
 265  0026 ce0000        	ldw	x,_TIM4_tout
 266  0029 2604          	jrne	L311
 269  002b a602          	ld	a,#2
 271  002d 201f          	jra	L41
 272  002f               L311:
 273                     ; 74   I2C->CR2 |= I2C_CR2_START;                        									// START=1, generate start
 275  002f 72105211      	bset	21009,#0
 277  0033               L711:
 278                     ; 75   while(((I2C->SR1 & I2C_SR1_SB)==0) && tout()); 									// Wait for start bit detection (SB)
 280  0033 c65217        	ld	a,21015
 281  0036 a501          	bcp	a,#1
 282  0038 2605          	jrne	L321
 284  003a ce0000        	ldw	x,_TIM4_tout
 285  003d 26f4          	jrne	L711
 286  003f               L321:
 287                     ; 77   if(tout())
 290  003f ce0000        	ldw	x,_TIM4_tout
 291  0042 2708          	jreq	L521
 292                     ; 87       I2C->DR = (u8)(SlaveAddr << 1);   									// Send 7-bit device address & Write (R/W = 0)
 294  0044 7b02          	ld	a,(OFST+2,sp)
 295  0046 48            	sll	a
 296  0047 c75216        	ld	21014,a
 298  004a 2004          	jra	L331
 299  004c               L521:
 300                     ; 90 		return IIC_ERROR_TIME_OUT;
 302  004c a601          	ld	a,#1
 304  004e               L41:
 306  004e 85            	popw	x
 307  004f 81            	ret
 308  0050               L331:
 309                     ; 92   while(!(I2C->SR1 & I2C_SR1_ADDR) && tout());     									// Wait for address ack (ADDR)
 311  0050 c65217        	ld	a,21015
 312  0053 a502          	bcp	a,#2
 313  0055 2605          	jrne	L731
 315  0057 ce0000        	ldw	x,_TIM4_tout
 316  005a 26f4          	jrne	L331
 317  005c               L731:
 318                     ; 93 	if(!tout()){
 320  005c ce0000        	ldw	x,_TIM4_tout
 321  005f 2608          	jrne	L141
 322                     ; 94 		I2C->CR2 |= I2C_CR2_STOP;
 324  0061 72125211      	bset	21009,#1
 325                     ; 95 		return IIC_ERROR_NOT_ACK;
 327  0065 a603          	ld	a,#3
 329  0067 20e5          	jra	L41
 330  0069               L141:
 331                     ; 98   I2C->SR3;
 334  0069 c65219        	ld	a,21017
 335  006c 97            	ld	xl,a
 337  006d               L541:
 338                     ; 99   while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  									// Wait for TxE
 340  006d c65217        	ld	a,21015
 341  0070 a580          	bcp	a,#128
 342  0072 2605          	jrne	L151
 344  0074 ce0000        	ldw	x,_TIM4_tout
 345  0077 26f4          	jrne	L541
 346  0079               L151:
 347                     ; 100   if(NumByteToWrite)
 349  0079 0d07          	tnz	(OFST+7,sp)
 350  007b 2736          	jreq	L351
 352  007d 201f          	jra	L751
 353  007f               L551:
 354                     ; 104 			I2C->DR = *pWriteDataBuffer++; 
 356  007f 1e05          	ldw	x,(OFST+5,sp)
 357  0081 1c0001        	addw	x,#1
 358  0084 1f05          	ldw	(OFST+5,sp),x
 359  0086 1d0001        	subw	x,#1
 360  0089 f6            	ld	a,(x)
 361  008a c75216        	ld	21014,a
 363  008d               L761:
 364                     ; 105 			while(!(I2C->SR1 & I2C_SR1_TXE) && tout());  								// test EV8 - wait for TxE
 366  008d c65217        	ld	a,21015
 367  0090 a580          	bcp	a,#128
 368  0092 2605          	jrne	L371
 370  0094 ce0000        	ldw	x,_TIM4_tout
 371  0097 26f4          	jrne	L761
 372  0099               L371:
 373                     ; 106 			if(!tout()){
 375  0099 ce0000        	ldw	x,_TIM4_tout
 376  009c 2707          	jreq	L102
 377                     ; 107 				break;
 379  009e               L751:
 380                     ; 102 		while(NumByteToWrite--)
 382  009e 7b07          	ld	a,(OFST+7,sp)
 383  00a0 0a07          	dec	(OFST+7,sp)
 384  00a2 4d            	tnz	a
 385  00a3 26da          	jrne	L551
 386  00a5               L102:
 387                     ; 110 		while(((I2C->SR1 & (I2C_SR1_TXE|I2C_SR1_BTF)) != (I2C_SR1_TXE|I2C_SR1_BTF)) && tout()); 					// Wait for TxE & BTF
 389  00a5 c65217        	ld	a,21015
 390  00a8 a484          	and	a,#132
 391  00aa a184          	cp	a,#132
 392  00ac 2705          	jreq	L351
 394  00ae ce0000        	ldw	x,_TIM4_tout
 395  00b1 26f2          	jrne	L102
 396  00b3               L351:
 397                     ; 114   I2C->CR2 |= I2C_CR2_STOP;                        									// generate stop here (STOP=1)
 399  00b3 72125211      	bset	21009,#1
 401  00b7               L112:
 402                     ; 115   while((I2C->CR2 & I2C_CR2_STOP) && tout());      									// wait until stop is performed  
 404  00b7 c65211        	ld	a,21009
 405  00ba a502          	bcp	a,#2
 406  00bc 2705          	jreq	L512
 408  00be ce0000        	ldw	x,_TIM4_tout
 409  00c1 26f4          	jrne	L112
 410  00c3               L512:
 411                     ; 116 	if(!tout()){
 413  00c3 ce0000        	ldw	x,_TIM4_tout
 414  00c6 2604          	jrne	L712
 415                     ; 117 		return IIC_ERROR_TIME_OUT;
 417  00c8 a601          	ld	a,#1
 419  00ca 2001          	jra	L61
 420  00cc               L712:
 421                     ; 119 		return IIC_SUCCESS;
 423  00cc 4f            	clr	a
 425  00cd               L61:
 427  00cd 85            	popw	x
 428  00ce 81            	ret
 493                     ; 123 uint8_t I2C_ReadBytes(uint16_t SlaveAddr, uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 493                     ; 124 {
 494                     .text:	section	.text,new
 495  0000               _I2C_ReadBytes:
 497  0000 89            	pushw	x
 498       00000000      OFST:	set	0
 501                     ; 125 	set_tout_ms(TimeOutOfMs);
 503  0001 7b08          	ld	a,(OFST+8,sp)
 504  0003 5f            	clrw	x
 505  0004 97            	ld	xl,a
 506  0005 cf0000        	ldw	_TIM4_tout,x
 509  0008 2010          	jra	L152
 510  000a               L742:
 511                     ; 129 		I2C->CR2 |= I2C_CR2_STOP;                   				// STOP=1, generate stop
 513  000a 72125211      	bset	21009,#1
 515  000e               L752:
 516                     ; 130     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// wait until stop is performed
 518  000e c65211        	ld	a,21009
 519  0011 a502          	bcp	a,#2
 520  0013 2705          	jreq	L152
 522  0015 ce0000        	ldw	x,_TIM4_tout
 523  0018 26f4          	jrne	L752
 524  001a               L152:
 525                     ; 127 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 527  001a c65219        	ld	a,21017
 528  001d a502          	bcp	a,#2
 529  001f 2705          	jreq	L562
 531  0021 ce0000        	ldw	x,_TIM4_tout
 532  0024 26e4          	jrne	L742
 533  0026               L562:
 534                     ; 132 	if(!tout()){return IIC_ERROR_BUSY;}
 536  0026 ce0000        	ldw	x,_TIM4_tout
 537  0029 2604          	jrne	L762
 540  002b a602          	ld	a,#2
 542  002d 2033          	jra	L22
 543  002f               L762:
 544                     ; 133 	I2C->CR2 &= ~I2C_CR2_STOP;
 546  002f 72135211      	bres	21009,#1
 547                     ; 134   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 549  0033 72145211      	bset	21009,#2
 550                     ; 136   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 552  0037 72105211      	bset	21009,#0
 554  003b               L372:
 555                     ; 137   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// wait for start bit detection (SB)
 557  003b c65217        	ld	a,21015
 558  003e a501          	bcp	a,#1
 559  0040 2605          	jrne	L772
 561  0042 ce0000        	ldw	x,_TIM4_tout
 562  0045 26f4          	jrne	L372
 563  0047               L772:
 564                     ; 148     I2C->DR = (u8)(SlaveAddr << 1) | 1;       			// Send 7-bit device address & Write (R/W = 1)
 566  0047 7b02          	ld	a,(OFST+2,sp)
 567  0049 48            	sll	a
 568  004a aa01          	or	a,#1
 569  004c c75216        	ld	21014,a
 571  004f               L503:
 572                     ; 150   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());				// Wait for address ack (ADDR)
 574  004f c65217        	ld	a,21015
 575  0052 a502          	bcp	a,#2
 576  0054 2605          	jrne	L113
 578  0056 ce0000        	ldw	x,_TIM4_tout
 579  0059 26f4          	jrne	L503
 580  005b               L113:
 581                     ; 151 	if(!tout()){
 583  005b ce0000        	ldw	x,_TIM4_tout
 584  005e 2604          	jrne	L313
 585                     ; 152 		return IIC_ERROR_NOT_ACK;
 587  0060 a603          	ld	a,#3
 589  0062               L22:
 591  0062 85            	popw	x
 592  0063 81            	ret
 593  0064               L313:
 594                     ; 155   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
 596  0064 7b07          	ld	a,(OFST+7,sp)
 597  0066 a103          	cp	a,#3
 598  0068 257b          	jrult	L513
 599                     ; 157     I2C->SR3;                                     			// ADDR clearing sequence    
 601  006a c65219        	ld	a,21017
 602  006d 97            	ld	xl,a
 604  006e 201c          	jra	L123
 605  0070               L723:
 606                     ; 160       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
 608  0070 c65217        	ld	a,21015
 609  0073 a504          	bcp	a,#4
 610  0075 2605          	jrne	L333
 612  0077 ce0000        	ldw	x,_TIM4_tout
 613  007a 26f4          	jrne	L723
 614  007c               L333:
 615                     ; 161 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
 617  007c 1e05          	ldw	x,(OFST+5,sp)
 618  007e 1c0001        	addw	x,#1
 619  0081 1f05          	ldw	(OFST+5,sp),x
 620  0083 1d0001        	subw	x,#1
 621  0086 c65216        	ld	a,21014
 622  0089 f7            	ld	(x),a
 623                     ; 162       --NumByteToRead;																		// Decrease Numbyte to reade by 1
 625  008a 0a07          	dec	(OFST+7,sp)
 626  008c               L123:
 627                     ; 158     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
 629  008c 7b07          	ld	a,(OFST+7,sp)
 630  008e a104          	cp	a,#4
 631  0090 2505          	jrult	L143
 633  0092 ce0000        	ldw	x,_TIM4_tout
 634  0095 26d9          	jrne	L723
 635  0097               L143:
 636                     ; 165     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
 638  0097 c65217        	ld	a,21015
 639  009a a504          	bcp	a,#4
 640  009c 2605          	jrne	L543
 642  009e ce0000        	ldw	x,_TIM4_tout
 643  00a1 26f4          	jrne	L143
 644  00a3               L543:
 645                     ; 166     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
 647  00a3 72155211      	bres	21009,#2
 648                     ; 167     disableInterrupts();                          			// Errata workaround (Disable interrupt)
 651  00a7 9b            sim
 653                     ; 168     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
 656  00a8 1e05          	ldw	x,(OFST+5,sp)
 657  00aa 1c0001        	addw	x,#1
 658  00ad 1f05          	ldw	(OFST+5,sp),x
 659  00af 1d0001        	subw	x,#1
 660  00b2 c65216        	ld	a,21014
 661  00b5 f7            	ld	(x),a
 662                     ; 169     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
 664  00b6 72125211      	bset	21009,#1
 665                     ; 170     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
 667  00ba 1e05          	ldw	x,(OFST+5,sp)
 668  00bc 1c0001        	addw	x,#1
 669  00bf 1f05          	ldw	(OFST+5,sp),x
 670  00c1 1d0001        	subw	x,#1
 671  00c4 c65216        	ld	a,21014
 672  00c7 f7            	ld	(x),a
 673                     ; 171     enableInterrupts();																	// Errata workaround (Enable interrupt)
 676  00c8 9a            rim
 680  00c9               L153:
 681                     ; 172     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
 683  00c9 c65217        	ld	a,21015
 684  00cc a540          	bcp	a,#64
 685  00ce 2605          	jrne	L553
 687  00d0 ce0000        	ldw	x,_TIM4_tout
 688  00d3 26f4          	jrne	L153
 689  00d5               L553:
 690                     ; 173     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
 692  00d5 1e05          	ldw	x,(OFST+5,sp)
 693  00d7 1c0001        	addw	x,#1
 694  00da 1f05          	ldw	(OFST+5,sp),x
 695  00dc 1d0001        	subw	x,#1
 696  00df c65216        	ld	a,21014
 697  00e2 f7            	ld	(x),a
 699  00e3 205c          	jra	L704
 700  00e5               L513:
 701                     ; 177     if(NumByteToRead == 2)                						// *** just two bytes are received? ***
 703  00e5 7b07          	ld	a,(OFST+7,sp)
 704  00e7 a102          	cp	a,#2
 705  00e9 2636          	jrne	L163
 706                     ; 179       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
 708  00eb 72165211      	bset	21009,#3
 709                     ; 180       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 712  00ef 9b            sim
 714                     ; 181       I2C->SR3;                                       	// Clear ADDR Flag
 717  00f0 c65219        	ld	a,21017
 718  00f3 97            	ld	xl,a
 719                     ; 182       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
 721  00f4 72155211      	bres	21009,#2
 722                     ; 183       enableInterrupts();																// Errata workaround (Enable interrupt)
 725  00f8 9a            rim
 729  00f9               L563:
 730                     ; 184       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
 732  00f9 c65217        	ld	a,21015
 733  00fc a504          	bcp	a,#4
 734  00fe 2605          	jrne	L173
 736  0100 ce0000        	ldw	x,_TIM4_tout
 737  0103 26f4          	jrne	L563
 738  0105               L173:
 739                     ; 185       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 742  0105 9b            sim
 744                     ; 186       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
 747  0106 72125211      	bset	21009,#1
 748                     ; 187       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
 750  010a 1e05          	ldw	x,(OFST+5,sp)
 751  010c 1c0001        	addw	x,#1
 752  010f 1f05          	ldw	(OFST+5,sp),x
 753  0111 1d0001        	subw	x,#1
 754  0114 c65216        	ld	a,21014
 755  0117 f7            	ld	(x),a
 756                     ; 188       enableInterrupts();																// Errata workaround (Enable interrupt)
 759  0118 9a            rim
 761                     ; 189 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
 764  0119 1e05          	ldw	x,(OFST+5,sp)
 765  011b c65216        	ld	a,21014
 766  011e f7            	ld	(x),a
 768  011f 2020          	jra	L704
 769  0121               L163:
 770                     ; 193       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
 772  0121 72155211      	bres	21009,#2
 773                     ; 194       disableInterrupts();                          		// Errata workaround (Disable interrupt)
 777  0125 9b            sim
 779                     ; 195       I2C->SR3;                                       	// Clear ADDR Flag   
 782  0126 c65219        	ld	a,21017
 783  0129 97            	ld	xl,a
 784                     ; 196       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
 786  012a 72125211      	bset	21009,#1
 787                     ; 197       enableInterrupts();																// Errata workaround (Enable interrupt)
 790  012e 9a            rim
 794  012f               L773:
 795                     ; 198       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
 797  012f c65217        	ld	a,21015
 798  0132 a540          	bcp	a,#64
 799  0134 2605          	jrne	L304
 801  0136 ce0000        	ldw	x,_TIM4_tout
 802  0139 26f4          	jrne	L773
 803  013b               L304:
 804                     ; 199       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
 806  013b 1e05          	ldw	x,(OFST+5,sp)
 807  013d c65216        	ld	a,21014
 808  0140 f7            	ld	(x),a
 809  0141               L704:
 810                     ; 203   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
 812  0141 c65211        	ld	a,21009
 813  0144 a502          	bcp	a,#2
 814  0146 2705          	jreq	L314
 816  0148 ce0000        	ldw	x,_TIM4_tout
 817  014b 26f4          	jrne	L704
 818  014d               L314:
 819                     ; 204   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
 821  014d 72175211      	bres	21009,#3
 822                     ; 205 	if(!tout()){
 824  0151 ce0000        	ldw	x,_TIM4_tout
 825  0154 2604          	jrne	L514
 826                     ; 206 		return IIC_ERROR_TIME_OUT;
 828  0156 a601          	ld	a,#1
 830  0158 2001          	jra	L42
 831  015a               L514:
 832                     ; 208 		return IIC_SUCCESS;
 834  015a 4f            	clr	a
 836  015b               L42:
 838  015b 85            	popw	x
 839  015c 81            	ret
 921                     ; 212 uint8_t I2C_WriteReadBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite,uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 921                     ; 213 {
 922                     .text:	section	.text,new
 923  0000               _I2C_WriteReadBytes:
 925  0000 89            	pushw	x
 926       00000000      OFST:	set	0
 929                     ; 214 	set_tout_ms(TimeOutOfMs);
 931  0001 7b0b          	ld	a,(OFST+11,sp)
 932  0003 5f            	clrw	x
 933  0004 97            	ld	xl,a
 934  0005 cf0000        	ldw	_TIM4_tout,x
 937  0008 2010          	jra	L554
 938  000a               L354:
 939                     ; 218 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 941  000a 72125211      	bset	21009,#1
 943  000e               L364:
 944                     ; 219     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 946  000e c65211        	ld	a,21009
 947  0011 a502          	bcp	a,#2
 948  0013 2705          	jreq	L554
 950  0015 ce0000        	ldw	x,_TIM4_tout
 951  0018 26f4          	jrne	L364
 952  001a               L554:
 953                     ; 216 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 955  001a c65219        	ld	a,21017
 956  001d a502          	bcp	a,#2
 957  001f 2705          	jreq	L174
 959  0021 ce0000        	ldw	x,_TIM4_tout
 960  0024 26e4          	jrne	L354
 961  0026               L174:
 962                     ; 221 	if(!tout()){return IIC_ERROR_BUSY;}
 964  0026 ce0000        	ldw	x,_TIM4_tout
 965  0029 2604          	jrne	L374
 968  002b a602          	ld	a,#2
 970  002d 2036          	jra	L03
 971  002f               L374:
 972                     ; 222 	I2C->CR2 &= ~I2C_CR2_STOP;
 974  002f 72135211      	bres	21009,#1
 975                     ; 223   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 977  0033 72145211      	bset	21009,#2
 978                     ; 225   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 980  0037 72105211      	bset	21009,#0
 982  003b               L774:
 983                     ; 226   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 985  003b c65217        	ld	a,21015
 986  003e a501          	bcp	a,#1
 987  0040 2605          	jrne	L305
 989  0042 ce0000        	ldw	x,_TIM4_tout
 990  0045 26f4          	jrne	L774
 991  0047               L305:
 992                     ; 228   if(tout())
 994  0047 ce0000        	ldw	x,_TIM4_tout
 995  004a 2706          	jreq	L115
 996                     ; 238       I2C->DR = (u8)(SlaveAddr << 1);   						// Send 7-bit device address & Write (R/W = 0)
 998  004c 7b02          	ld	a,(OFST+2,sp)
 999  004e 48            	sll	a
1000  004f c75216        	ld	21014,a
1001  0052               L115:
1002                     ; 241   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
1004  0052 c65217        	ld	a,21015
1005  0055 a502          	bcp	a,#2
1006  0057 2605          	jrne	L515
1008  0059 ce0000        	ldw	x,_TIM4_tout
1009  005c 26f4          	jrne	L115
1010  005e               L515:
1011                     ; 242 	if(!tout()){
1013  005e ce0000        	ldw	x,_TIM4_tout
1014  0061 2604          	jrne	L715
1015                     ; 243 		return IIC_ERROR_NOT_ACK;
1017  0063 a603          	ld	a,#3
1019  0065               L03:
1021  0065 85            	popw	x
1022  0066 81            	ret
1023  0067               L715:
1024                     ; 246   I2C->SR3;
1027  0067 c65219        	ld	a,21017
1028  006a 97            	ld	xl,a
1029                     ; 248 	if(NumByteToWrite > 0){
1031  006b 0d07          	tnz	(OFST+7,sp)
1032  006d 2736          	jreq	L125
1034  006f 201f          	jra	L525
1035  0071               L335:
1036                     ; 250 			while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
1038  0071 c65217        	ld	a,21015
1039  0074 a580          	bcp	a,#128
1040  0076 2605          	jrne	L735
1042  0078 ce0000        	ldw	x,_TIM4_tout
1043  007b 26f4          	jrne	L335
1044  007d               L735:
1045                     ; 251 			if(tout())
1047  007d ce0000        	ldw	x,_TIM4_tout
1048  0080 270e          	jreq	L525
1049                     ; 253 				I2C->DR = *pWriteDataBuffer++;                         			// Send register address
1051  0082 1e05          	ldw	x,(OFST+5,sp)
1052  0084 1c0001        	addw	x,#1
1053  0087 1f05          	ldw	(OFST+5,sp),x
1054  0089 1d0001        	subw	x,#1
1055  008c f6            	ld	a,(x)
1056  008d c75216        	ld	21014,a
1057  0090               L525:
1058                     ; 249 		while(NumByteToWrite--){
1060  0090 7b07          	ld	a,(OFST+7,sp)
1061  0092 0a07          	dec	(OFST+7,sp)
1062  0094 4d            	tnz	a
1063  0095 26da          	jrne	L335
1065  0097               L545:
1066                     ; 256 		while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
1068  0097 c65217        	ld	a,21015
1069  009a a484          	and	a,#132
1070  009c a184          	cp	a,#132
1071  009e 2705          	jreq	L125
1073  00a0 ce0000        	ldw	x,_TIM4_tout
1074  00a3 26f2          	jrne	L545
1075  00a5               L125:
1076                     ; 267 	I2C->CR2 &= ~I2C_CR2_STOP;
1078  00a5 72135211      	bres	21009,#1
1079                     ; 268   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
1081  00a9 72105211      	bset	21009,#0
1083  00ad               L555:
1084                     ; 269   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
1086  00ad c65217        	ld	a,21015
1087  00b0 a501          	bcp	a,#1
1088  00b2 2605          	jrne	L165
1090  00b4 ce0000        	ldw	x,_TIM4_tout
1091  00b7 26f4          	jrne	L555
1092  00b9               L165:
1093                     ; 271   if(tout())
1095  00b9 ce0000        	ldw	x,_TIM4_tout
1096  00bc 2708          	jreq	L765
1097                     ; 283       I2C->DR = (u8)(SlaveAddr << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
1099  00be 7b02          	ld	a,(OFST+2,sp)
1100  00c0 48            	sll	a
1101  00c1 aa01          	or	a,#1
1102  00c3 c75216        	ld	21014,a
1103  00c6               L765:
1104                     ; 286   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
1106  00c6 c65217        	ld	a,21015
1107  00c9 a502          	bcp	a,#2
1108  00cb 2605          	jrne	L375
1110  00cd ce0000        	ldw	x,_TIM4_tout
1111  00d0 26f4          	jrne	L765
1112  00d2               L375:
1113                     ; 287 	if(!tout()){
1115  00d2 ce0000        	ldw	x,_TIM4_tout
1116  00d5 2604          	jrne	L575
1117                     ; 288 		return IIC_ERROR_NOT_ACK;
1119  00d7 a603          	ld	a,#3
1121  00d9 208a          	jra	L03
1122  00db               L575:
1123                     ; 291   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
1125  00db 7b0a          	ld	a,(OFST+10,sp)
1126  00dd a103          	cp	a,#3
1127  00df 257b          	jrult	L775
1128                     ; 293     I2C->SR3;                                     			// ADDR clearing sequence    
1130  00e1 c65219        	ld	a,21017
1131  00e4 97            	ld	xl,a
1133  00e5 201c          	jra	L306
1134  00e7               L116:
1135                     ; 296       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
1137  00e7 c65217        	ld	a,21015
1138  00ea a504          	bcp	a,#4
1139  00ec 2605          	jrne	L516
1141  00ee ce0000        	ldw	x,_TIM4_tout
1142  00f1 26f4          	jrne	L116
1143  00f3               L516:
1144                     ; 297 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
1146  00f3 1e08          	ldw	x,(OFST+8,sp)
1147  00f5 1c0001        	addw	x,#1
1148  00f8 1f08          	ldw	(OFST+8,sp),x
1149  00fa 1d0001        	subw	x,#1
1150  00fd c65216        	ld	a,21014
1151  0100 f7            	ld	(x),a
1152                     ; 298       --NumByteToRead;																		// Decrease Numbyte to reade by 1
1154  0101 0a0a          	dec	(OFST+10,sp)
1155  0103               L306:
1156                     ; 294     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
1158  0103 7b0a          	ld	a,(OFST+10,sp)
1159  0105 a104          	cp	a,#4
1160  0107 2505          	jrult	L326
1162  0109 ce0000        	ldw	x,_TIM4_tout
1163  010c 26d9          	jrne	L116
1164  010e               L326:
1165                     ; 301     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
1167  010e c65217        	ld	a,21015
1168  0111 a504          	bcp	a,#4
1169  0113 2605          	jrne	L726
1171  0115 ce0000        	ldw	x,_TIM4_tout
1172  0118 26f4          	jrne	L326
1173  011a               L726:
1174                     ; 302     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
1176  011a 72155211      	bres	21009,#2
1177                     ; 303     disableInterrupts();                          			// Errata workaround (Disable interrupt)
1180  011e 9b            sim
1182                     ; 304     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
1185  011f 1e08          	ldw	x,(OFST+8,sp)
1186  0121 1c0001        	addw	x,#1
1187  0124 1f08          	ldw	(OFST+8,sp),x
1188  0126 1d0001        	subw	x,#1
1189  0129 c65216        	ld	a,21014
1190  012c f7            	ld	(x),a
1191                     ; 305     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
1193  012d 72125211      	bset	21009,#1
1194                     ; 306     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
1196  0131 1e08          	ldw	x,(OFST+8,sp)
1197  0133 1c0001        	addw	x,#1
1198  0136 1f08          	ldw	(OFST+8,sp),x
1199  0138 1d0001        	subw	x,#1
1200  013b c65216        	ld	a,21014
1201  013e f7            	ld	(x),a
1202                     ; 307     enableInterrupts();																	// Errata workaround (Enable interrupt)
1205  013f 9a            rim
1209  0140               L336:
1210                     ; 308     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
1212  0140 c65217        	ld	a,21015
1213  0143 a540          	bcp	a,#64
1214  0145 2605          	jrne	L736
1216  0147 ce0000        	ldw	x,_TIM4_tout
1217  014a 26f4          	jrne	L336
1218  014c               L736:
1219                     ; 309     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
1221  014c 1e08          	ldw	x,(OFST+8,sp)
1222  014e 1c0001        	addw	x,#1
1223  0151 1f08          	ldw	(OFST+8,sp),x
1224  0153 1d0001        	subw	x,#1
1225  0156 c65216        	ld	a,21014
1226  0159 f7            	ld	(x),a
1228  015a 205c          	jra	L176
1229  015c               L775:
1230                     ; 313    if(NumByteToRead == 2)                						// *** just two bytes are received? ***
1232  015c 7b0a          	ld	a,(OFST+10,sp)
1233  015e a102          	cp	a,#2
1234  0160 2636          	jrne	L346
1235                     ; 315       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
1237  0162 72165211      	bset	21009,#3
1238                     ; 316       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1241  0166 9b            sim
1243                     ; 317       I2C->SR3;                                       	// Clear ADDR Flag
1246  0167 c65219        	ld	a,21017
1247  016a 97            	ld	xl,a
1248                     ; 318       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
1250  016b 72155211      	bres	21009,#2
1251                     ; 319       enableInterrupts();																// Errata workaround (Enable interrupt)
1254  016f 9a            rim
1258  0170               L746:
1259                     ; 320       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
1261  0170 c65217        	ld	a,21015
1262  0173 a504          	bcp	a,#4
1263  0175 2605          	jrne	L356
1265  0177 ce0000        	ldw	x,_TIM4_tout
1266  017a 26f4          	jrne	L746
1267  017c               L356:
1268                     ; 321       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1271  017c 9b            sim
1273                     ; 322       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
1276  017d 72125211      	bset	21009,#1
1277                     ; 323       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
1279  0181 1e08          	ldw	x,(OFST+8,sp)
1280  0183 1c0001        	addw	x,#1
1281  0186 1f08          	ldw	(OFST+8,sp),x
1282  0188 1d0001        	subw	x,#1
1283  018b c65216        	ld	a,21014
1284  018e f7            	ld	(x),a
1285                     ; 324       enableInterrupts();																// Errata workaround (Enable interrupt)
1288  018f 9a            rim
1290                     ; 325 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
1293  0190 1e08          	ldw	x,(OFST+8,sp)
1294  0192 c65216        	ld	a,21014
1295  0195 f7            	ld	(x),a
1297  0196 2020          	jra	L176
1298  0198               L346:
1299                     ; 329       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
1301  0198 72155211      	bres	21009,#2
1302                     ; 330       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1306  019c 9b            sim
1308                     ; 331       I2C->SR3;                                       	// Clear ADDR Flag   
1311  019d c65219        	ld	a,21017
1312  01a0 97            	ld	xl,a
1313                     ; 332       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
1315  01a1 72125211      	bset	21009,#1
1316                     ; 333       enableInterrupts();																// Errata workaround (Enable interrupt)
1319  01a5 9a            rim
1323  01a6               L166:
1324                     ; 334       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
1326  01a6 c65217        	ld	a,21015
1327  01a9 a540          	bcp	a,#64
1328  01ab 2605          	jrne	L566
1330  01ad ce0000        	ldw	x,_TIM4_tout
1331  01b0 26f4          	jrne	L166
1332  01b2               L566:
1333                     ; 335       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
1335  01b2 1e08          	ldw	x,(OFST+8,sp)
1336  01b4 c65216        	ld	a,21014
1337  01b7 f7            	ld	(x),a
1338  01b8               L176:
1339                     ; 339   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
1341  01b8 c65211        	ld	a,21009
1342  01bb a502          	bcp	a,#2
1343  01bd 2705          	jreq	L576
1345  01bf ce0000        	ldw	x,_TIM4_tout
1346  01c2 26f4          	jrne	L176
1347  01c4               L576:
1348                     ; 340   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
1350  01c4 72175211      	bres	21009,#3
1351                     ; 341 	return IIC_SUCCESS;
1353  01c8 4f            	clr	a
1356  01c9 85            	popw	x
1357  01ca 81            	ret
1381                     ; 351 void ErrProc(void)
1381                     ; 352 {
1382                     .text:	section	.text,new
1383  0000               _ErrProc:
1387                     ; 354     I2C->SR2= 0;
1389  0000 725f5218      	clr	21016
1390                     ; 356 	  I2C->CR2 |= 2;  
1392  0004 72125211      	bset	21009,#1
1393                     ; 358     TIM4_tout= 0;
1395  0008 5f            	clrw	x
1396  0009 cf0000        	ldw	_TIM4_tout,x
1397                     ; 361 }
1400  000c 81            	ret
1425                     ; 374 @far @interrupt void I2C_error_Interrupt_Handler (void) {
1427                     .text:	section	.text,new
1428  0000               f_I2C_error_Interrupt_Handler:
1431  0000 3b0002        	push	c_x+2
1432  0003 be00          	ldw	x,c_x
1433  0005 89            	pushw	x
1434  0006 3b0002        	push	c_y+2
1435  0009 be00          	ldw	x,c_y
1436  000b 89            	pushw	x
1439                     ; 378 ErrProc();
1441  000c cd0000        	call	_ErrProc
1443                     ; 379 }
1446  000f 85            	popw	x
1447  0010 bf00          	ldw	c_y,x
1448  0012 320002        	pop	c_y+2
1449  0015 85            	popw	x
1450  0016 bf00          	ldw	c_x,x
1451  0018 320002        	pop	c_x+2
1452  001b 80            	iret
1475                     	xdef	f_I2C_error_Interrupt_Handler
1476                     	switch	.bss
1477  0000               _TIM4_tout:
1478  0000 0000          	ds.b	2
1479                     	xdef	_TIM4_tout
1480                     	xdef	_ErrProc
1481                     	xdef	_I2C_WriteReadBytes
1482                     	xdef	_I2C_ReadBytes
1483                     	xdef	_I2C_WriteBytes
1484                     	xdef	_I2C_Config
1485                     	xref	_I2C_SoftwareResetCmd
1486                     	xref	_I2C_Cmd
1487                     	xref	_I2C_Init
1488                     	xref	_I2C_DeInit
1489                     	xref	_CLK_GetClockFreq
1490                     	xref.b	c_lreg
1491                     	xref.b	c_x
1492                     	xref.b	c_y
1512                     	xref	c_ludv
1513                     	end
