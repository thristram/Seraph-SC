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
  69                     ; 36 	I2C_DeInit();
  72  0005 cd0000        	call	_I2C_DeInit
  74                     ; 38 	I2C_Init(20000,0x50,I2C_DUTYCYCLE_2,I2C_ACK_CURR,I2C_ADDMODE_7BIT,CLK_GetClockFreq()/1000000);
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
  88  001e ae4e20        	ldw	x,#20000
  89  0021 89            	pushw	x
  90  0022 ae0000        	ldw	x,#0
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
 922                     ; 212 uint8_t I2C_WriteReadBytes(uint16_t SlaveAddr, uint8_t *pWriteDataBuffer, uint8_t NumByteToWrite,uint8_t *pReadDataBuffer, uint8_t NumByteToRead, uint8_t TimeOutOfMs)
 922                     ; 213 {
 923                     .text:	section	.text,new
 924  0000               _I2C_WriteReadBytes:
 926  0000 89            	pushw	x
 927       00000000      OFST:	set	0
 930                     ; 214 	set_tout_ms(TimeOutOfMs);
 932  0001 7b0b          	ld	a,(OFST+11,sp)
 933  0003 5f            	clrw	x
 934  0004 97            	ld	xl,a
 935  0005 cf0000        	ldw	_TIM4_tout,x
 938  0008 2010          	jra	L554
 939  000a               L354:
 940                     ; 218 		I2C->CR2 |= I2C_CR2_STOP;                   				// Generate stop here (STOP=1)
 942  000a 72125211      	bset	21009,#1
 944  000e               L364:
 945                     ; 219     while(I2C->CR2 & I2C_CR2_STOP  &&  tout()); 				// Wait until stop is performed
 947  000e c65211        	ld	a,21009
 948  0011 a502          	bcp	a,#2
 949  0013 2705          	jreq	L554
 951  0015 ce0000        	ldw	x,_TIM4_tout
 952  0018 26f4          	jrne	L364
 953  001a               L554:
 954                     ; 216 	while(I2C->SR3 & I2C_SR3_BUSY  &&  tout())	  				// Wait while the bus is busy
 956  001a c65219        	ld	a,21017
 957  001d a502          	bcp	a,#2
 958  001f 2705          	jreq	L174
 960  0021 ce0000        	ldw	x,_TIM4_tout
 961  0024 26e4          	jrne	L354
 962  0026               L174:
 963                     ; 221 	if(!tout()){return IIC_ERROR_BUSY;}
 965  0026 ce0000        	ldw	x,_TIM4_tout
 966  0029 2604          	jrne	L374
 969  002b a602          	ld	a,#2
 971  002d 2036          	jra	L03
 972  002f               L374:
 973                     ; 222 	I2C->CR2 &= ~I2C_CR2_STOP;
 975  002f 72135211      	bres	21009,#1
 976                     ; 223   I2C->CR2 |= I2C_CR2_ACK;                      				// ACK=1, Ack enable
 978  0033 72145211      	bset	21009,#2
 979                     ; 225   I2C->CR2 |= I2C_CR2_START;                    				// START=1, generate start
 981  0037 72105211      	bset	21009,#0
 983  003b               L774:
 984                     ; 226   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout());				// Wait for start bit detection (SB)
 986  003b c65217        	ld	a,21015
 987  003e a501          	bcp	a,#1
 988  0040 2605          	jrne	L305
 990  0042 ce0000        	ldw	x,_TIM4_tout
 991  0045 26f4          	jrne	L774
 992  0047               L305:
 993                     ; 228   if(tout())
 995  0047 ce0000        	ldw	x,_TIM4_tout
 996  004a 2706          	jreq	L115
 997                     ; 238       I2C->DR = (u8)(SlaveAddr << 1);   						// Send 7-bit device address & Write (R/W = 0)
 999  004c 7b02          	ld	a,(OFST+2,sp)
1000  004e 48            	sll	a
1001  004f c75216        	ld	21014,a
1002  0052               L115:
1003                     ; 241   while(!(I2C->SR1 & I2C_SR1_ADDR) &&  tout()); 				// test EV6 - wait for address ack (ADDR)
1005  0052 c65217        	ld	a,21015
1006  0055 a502          	bcp	a,#2
1007  0057 2605          	jrne	L515
1009  0059 ce0000        	ldw	x,_TIM4_tout
1010  005c 26f4          	jrne	L115
1011  005e               L515:
1012                     ; 242 	if(!tout()){
1014  005e ce0000        	ldw	x,_TIM4_tout
1015  0061 2604          	jrne	L715
1016                     ; 243 		return IIC_ERROR_NOT_ACK;
1018  0063 a603          	ld	a,#3
1020  0065               L03:
1022  0065 85            	popw	x
1023  0066 81            	ret
1024  0067               L715:
1025                     ; 246   I2C->SR3;
1028  0067 c65219        	ld	a,21017
1029  006a 97            	ld	xl,a
1030                     ; 248 	if(NumByteToWrite > 0){
1032  006b 0d07          	tnz	(OFST+7,sp)
1033  006d 2736          	jreq	L125
1035  006f 201f          	jra	L525
1036  0071               L335:
1037                     ; 250 			while(!(I2C->SR1 & I2C_SR1_TXE) &&  tout());  				// Wait for TxE
1039  0071 c65217        	ld	a,21015
1040  0074 a580          	bcp	a,#128
1041  0076 2605          	jrne	L735
1043  0078 ce0000        	ldw	x,_TIM4_tout
1044  007b 26f4          	jrne	L335
1045  007d               L735:
1046                     ; 251 			if(tout())
1048  007d ce0000        	ldw	x,_TIM4_tout
1049  0080 270e          	jreq	L525
1050                     ; 253 				I2C->DR = *pWriteDataBuffer++;                         			// Send register address
1052  0082 1e05          	ldw	x,(OFST+5,sp)
1053  0084 1c0001        	addw	x,#1
1054  0087 1f05          	ldw	(OFST+5,sp),x
1055  0089 1d0001        	subw	x,#1
1056  008c f6            	ld	a,(x)
1057  008d c75216        	ld	21014,a
1058  0090               L525:
1059                     ; 249 		while(NumByteToWrite--){
1061  0090 7b07          	ld	a,(OFST+7,sp)
1062  0092 0a07          	dec	(OFST+7,sp)
1063  0094 4d            	tnz	a
1064  0095 26da          	jrne	L335
1066  0097               L545:
1067                     ; 256 		while((I2C->SR1 & (I2C_SR1_TXE | I2C_SR1_BTF)) != (I2C_SR1_TXE | I2C_SR1_BTF)  &&  tout()); 
1069  0097 c65217        	ld	a,21015
1070  009a a484          	and	a,#132
1071  009c a184          	cp	a,#132
1072  009e 2705          	jreq	L125
1074  00a0 ce0000        	ldw	x,_TIM4_tout
1075  00a3 26f2          	jrne	L545
1076  00a5               L125:
1077                     ; 260 	delay(10);
1079  00a5 ae000a        	ldw	x,#10
1080  00a8 cd0000        	call	_delay
1082                     ; 270 	I2C->CR2 &= ~I2C_CR2_STOP;
1084  00ab 72135211      	bres	21009,#1
1085                     ; 271   I2C->CR2 |= I2C_CR2_START;                     				// START=1, generate re-start
1087  00af 72105211      	bset	21009,#0
1089  00b3               L555:
1090                     ; 272   while((I2C->SR1 & I2C_SR1_SB)==0  &&  tout()); 				// Wait for start bit detection (SB)
1092  00b3 c65217        	ld	a,21015
1093  00b6 a501          	bcp	a,#1
1094  00b8 2605          	jrne	L165
1096  00ba ce0000        	ldw	x,_TIM4_tout
1097  00bd 26f4          	jrne	L555
1098  00bf               L165:
1099                     ; 274   if(tout())
1101  00bf ce0000        	ldw	x,_TIM4_tout
1102  00c2 2708          	jreq	L765
1103                     ; 286       I2C->DR = (u8)(SlaveAddr << 1) | 1;         	// Send 7-bit device address & Write (R/W = 1)
1105  00c4 7b02          	ld	a,(OFST+2,sp)
1106  00c6 48            	sll	a
1107  00c7 aa01          	or	a,#1
1108  00c9 c75216        	ld	21014,a
1109  00cc               L765:
1110                     ; 289   while(!(I2C->SR1 & I2C_SR1_ADDR)  &&  tout());  			// Wait for address ack (ADDR)
1112  00cc c65217        	ld	a,21015
1113  00cf a502          	bcp	a,#2
1114  00d1 2605          	jrne	L375
1116  00d3 ce0000        	ldw	x,_TIM4_tout
1117  00d6 26f4          	jrne	L765
1118  00d8               L375:
1119                     ; 290 	if(!tout()){
1121  00d8 ce0000        	ldw	x,_TIM4_tout
1122  00db 2604          	jrne	L575
1123                     ; 291 		return IIC_ERROR_NOT_ACK;
1125  00dd a603          	ld	a,#3
1127  00df 2084          	jra	L03
1128  00e1               L575:
1129                     ; 294   if (NumByteToRead > 2)                 						// *** more than 2 bytes are received? ***
1131  00e1 7b0a          	ld	a,(OFST+10,sp)
1132  00e3 a103          	cp	a,#3
1133  00e5 257b          	jrult	L775
1134                     ; 296     I2C->SR3;                                     			// ADDR clearing sequence    
1136  00e7 c65219        	ld	a,21017
1137  00ea 97            	ld	xl,a
1139  00eb 201c          	jra	L306
1140  00ed               L116:
1141                     ; 299       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 				// Wait for BTF
1143  00ed c65217        	ld	a,21015
1144  00f0 a504          	bcp	a,#4
1145  00f2 2605          	jrne	L516
1147  00f4 ce0000        	ldw	x,_TIM4_tout
1148  00f7 26f4          	jrne	L116
1149  00f9               L516:
1150                     ; 300 			*pReadDataBuffer++ = I2C->DR;                   				// Reading next data byte
1152  00f9 1e08          	ldw	x,(OFST+8,sp)
1153  00fb 1c0001        	addw	x,#1
1154  00fe 1f08          	ldw	(OFST+8,sp),x
1155  0100 1d0001        	subw	x,#1
1156  0103 c65216        	ld	a,21014
1157  0106 f7            	ld	(x),a
1158                     ; 301       --NumByteToRead;																		// Decrease Numbyte to reade by 1
1160  0107 0a0a          	dec	(OFST+10,sp)
1161  0109               L306:
1162                     ; 297     while(NumByteToRead > 3  &&  tout())       			// not last three bytes?
1164  0109 7b0a          	ld	a,(OFST+10,sp)
1165  010b a104          	cp	a,#4
1166  010d 2505          	jrult	L326
1168  010f ce0000        	ldw	x,_TIM4_tout
1169  0112 26d9          	jrne	L116
1170  0114               L326:
1171                     ; 304     while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 			// Wait for BTF
1173  0114 c65217        	ld	a,21015
1174  0117 a504          	bcp	a,#4
1175  0119 2605          	jrne	L726
1177  011b ce0000        	ldw	x,_TIM4_tout
1178  011e 26f4          	jrne	L326
1179  0120               L726:
1180                     ; 305     I2C->CR2 &=~I2C_CR2_ACK;                      			// Clear ACK
1182  0120 72155211      	bres	21009,#2
1183                     ; 306     disableInterrupts();                          			// Errata workaround (Disable interrupt)
1186  0124 9b            sim
1188                     ; 307     *pReadDataBuffer++ = I2C->DR;                     		// Read 1st byte
1191  0125 1e08          	ldw	x,(OFST+8,sp)
1192  0127 1c0001        	addw	x,#1
1193  012a 1f08          	ldw	(OFST+8,sp),x
1194  012c 1d0001        	subw	x,#1
1195  012f c65216        	ld	a,21014
1196  0132 f7            	ld	(x),a
1197                     ; 308     I2C->CR2 |= I2C_CR2_STOP;                       		// Generate stop here (STOP=1)
1199  0133 72125211      	bset	21009,#1
1200                     ; 309     *pReadDataBuffer++ = I2C->DR;                     		// Read 2nd byte
1202  0137 1e08          	ldw	x,(OFST+8,sp)
1203  0139 1c0001        	addw	x,#1
1204  013c 1f08          	ldw	(OFST+8,sp),x
1205  013e 1d0001        	subw	x,#1
1206  0141 c65216        	ld	a,21014
1207  0144 f7            	ld	(x),a
1208                     ; 310     enableInterrupts();																	// Errata workaround (Enable interrupt)
1211  0145 9a            rim
1215  0146               L336:
1216                     ; 311     while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout());			// Wait for RXNE
1218  0146 c65217        	ld	a,21015
1219  0149 a540          	bcp	a,#64
1220  014b 2605          	jrne	L736
1222  014d ce0000        	ldw	x,_TIM4_tout
1223  0150 26f4          	jrne	L336
1224  0152               L736:
1225                     ; 312     *pReadDataBuffer++ = I2C->DR;                   			// Read 3rd Data byte
1227  0152 1e08          	ldw	x,(OFST+8,sp)
1228  0154 1c0001        	addw	x,#1
1229  0157 1f08          	ldw	(OFST+8,sp),x
1230  0159 1d0001        	subw	x,#1
1231  015c c65216        	ld	a,21014
1232  015f f7            	ld	(x),a
1234  0160 205c          	jra	L176
1235  0162               L775:
1236                     ; 316    if(NumByteToRead == 2)                						// *** just two bytes are received? ***
1238  0162 7b0a          	ld	a,(OFST+10,sp)
1239  0164 a102          	cp	a,#2
1240  0166 2636          	jrne	L346
1241                     ; 318       I2C->CR2 |= I2C_CR2_POS;                      		// Set POS bit (NACK at next received byte)
1243  0168 72165211      	bset	21009,#3
1244                     ; 319       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1247  016c 9b            sim
1249                     ; 320       I2C->SR3;                                       	// Clear ADDR Flag
1252  016d c65219        	ld	a,21017
1253  0170 97            	ld	xl,a
1254                     ; 321       I2C->CR2 &=~I2C_CR2_ACK;                        	// Clear ACK 
1256  0171 72155211      	bres	21009,#2
1257                     ; 322       enableInterrupts();																// Errata workaround (Enable interrupt)
1260  0175 9a            rim
1264  0176               L746:
1265                     ; 323       while(!(I2C->SR1 & I2C_SR1_BTF)  &&  tout()); 		// Wait for BTF
1267  0176 c65217        	ld	a,21015
1268  0179 a504          	bcp	a,#4
1269  017b 2605          	jrne	L356
1271  017d ce0000        	ldw	x,_TIM4_tout
1272  0180 26f4          	jrne	L746
1273  0182               L356:
1274                     ; 324       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1277  0182 9b            sim
1279                     ; 325       I2C->CR2 |= I2C_CR2_STOP;                       	// Generate stop here (STOP=1)
1282  0183 72125211      	bset	21009,#1
1283                     ; 326       *pReadDataBuffer++ = I2C->DR;                     	// Read 1st Data byte
1285  0187 1e08          	ldw	x,(OFST+8,sp)
1286  0189 1c0001        	addw	x,#1
1287  018c 1f08          	ldw	(OFST+8,sp),x
1288  018e 1d0001        	subw	x,#1
1289  0191 c65216        	ld	a,21014
1290  0194 f7            	ld	(x),a
1291                     ; 327       enableInterrupts();																// Errata workaround (Enable interrupt)
1294  0195 9a            rim
1296                     ; 328 			*pReadDataBuffer = I2C->DR;													// Read 2nd Data byte
1299  0196 1e08          	ldw	x,(OFST+8,sp)
1300  0198 c65216        	ld	a,21014
1301  019b f7            	ld	(x),a
1303  019c 2020          	jra	L176
1304  019e               L346:
1305                     ; 332       I2C->CR2 &=~I2C_CR2_ACK;;                     		// Clear ACK 
1307  019e 72155211      	bres	21009,#2
1308                     ; 333       disableInterrupts();                          		// Errata workaround (Disable interrupt)
1312  01a2 9b            sim
1314                     ; 334       I2C->SR3;                                       	// Clear ADDR Flag   
1317  01a3 c65219        	ld	a,21017
1318  01a6 97            	ld	xl,a
1319                     ; 335       I2C->CR2 |= I2C_CR2_STOP;                       	// generate stop here (STOP=1)
1321  01a7 72125211      	bset	21009,#1
1322                     ; 336       enableInterrupts();																// Errata workaround (Enable interrupt)
1325  01ab 9a            rim
1329  01ac               L166:
1330                     ; 337       while(!(I2C->SR1 & I2C_SR1_RXNE)  &&  tout()); 		// test EV7, wait for RxNE
1332  01ac c65217        	ld	a,21015
1333  01af a540          	bcp	a,#64
1334  01b1 2605          	jrne	L566
1336  01b3 ce0000        	ldw	x,_TIM4_tout
1337  01b6 26f4          	jrne	L166
1338  01b8               L566:
1339                     ; 338       *pReadDataBuffer = I2C->DR;                     		// Read Data byte
1341  01b8 1e08          	ldw	x,(OFST+8,sp)
1342  01ba c65216        	ld	a,21014
1343  01bd f7            	ld	(x),a
1344  01be               L176:
1345                     ; 342   while((I2C->CR2 & I2C_CR2_STOP)  &&  tout());     		// Wait until stop is performed (STOPF = 1)
1347  01be c65211        	ld	a,21009
1348  01c1 a502          	bcp	a,#2
1349  01c3 2705          	jreq	L576
1351  01c5 ce0000        	ldw	x,_TIM4_tout
1352  01c8 26f4          	jrne	L176
1353  01ca               L576:
1354                     ; 343   I2C->CR2 &=~I2C_CR2_POS;                          		// return POS to default state (POS=0)
1356  01ca 72175211      	bres	21009,#3
1357                     ; 344 	return IIC_SUCCESS;
1359  01ce 4f            	clr	a
1362  01cf 85            	popw	x
1363  01d0 81            	ret
1387                     ; 354 void ErrProc(void)
1387                     ; 355 {
1388                     .text:	section	.text,new
1389  0000               _ErrProc:
1393                     ; 357     I2C->SR2= 0;
1395  0000 725f5218      	clr	21016
1396                     ; 359 	  I2C->CR2 |= 2;  
1398  0004 72125211      	bset	21009,#1
1399                     ; 361     TIM4_tout= 0;
1401  0008 5f            	clrw	x
1402  0009 cf0000        	ldw	_TIM4_tout,x
1403                     ; 364 }
1406  000c 81            	ret
1431                     ; 377 @far @interrupt void I2C_error_Interrupt_Handler (void) {
1433                     .text:	section	.text,new
1434  0000               f_I2C_error_Interrupt_Handler:
1437  0000 3b0002        	push	c_x+2
1438  0003 be00          	ldw	x,c_x
1439  0005 89            	pushw	x
1440  0006 3b0002        	push	c_y+2
1441  0009 be00          	ldw	x,c_y
1442  000b 89            	pushw	x
1445                     ; 381 ErrProc();
1447  000c cd0000        	call	_ErrProc
1449                     ; 382 }
1452  000f 85            	popw	x
1453  0010 bf00          	ldw	c_y,x
1454  0012 320002        	pop	c_y+2
1455  0015 85            	popw	x
1456  0016 bf00          	ldw	c_x,x
1457  0018 320002        	pop	c_x+2
1458  001b 80            	iret
1481                     	xdef	f_I2C_error_Interrupt_Handler
1482                     	switch	.bss
1483  0000               _TIM4_tout:
1484  0000 0000          	ds.b	2
1485                     	xdef	_TIM4_tout
1486                     	xdef	_ErrProc
1487                     	xdef	_I2C_WriteReadBytes
1488                     	xdef	_I2C_ReadBytes
1489                     	xdef	_I2C_WriteBytes
1490                     	xdef	_I2C_Config
1491                     	xref	_delay
1492                     	xref	_I2C_SoftwareResetCmd
1493                     	xref	_I2C_Cmd
1494                     	xref	_I2C_Init
1495                     	xref	_I2C_DeInit
1496                     	xref	_CLK_GetClockFreq
1497                     	xref.b	c_lreg
1498                     	xref.b	c_x
1499                     	xref.b	c_y
1519                     	xref	c_ludv
1520                     	end
