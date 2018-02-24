   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 54 void UART3_DeInit(void)
  32                     ; 55 {
  34                     .text:	section	.text,new
  35  0000               _UART3_DeInit:
  39                     ; 58   (void) UART3->SR;
  41  0000 c65240        	ld	a,21056
  42  0003 97            	ld	xl,a
  43                     ; 59   (void) UART3->DR;
  45  0004 c65241        	ld	a,21057
  46  0007 97            	ld	xl,a
  47                     ; 61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  49  0008 725f5243      	clr	21059
  50                     ; 62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  52  000c 725f5242      	clr	21058
  53                     ; 64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  55  0010 725f5244      	clr	21060
  56                     ; 65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  58  0014 725f5245      	clr	21061
  59                     ; 66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  61  0018 725f5246      	clr	21062
  62                     ; 67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  64  001c 725f5247      	clr	21063
  65                     ; 68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  67  0020 725f5249      	clr	21065
  68                     ; 69 }
  71  0024 81            	ret
 289                     .const:	section	.text
 290  0000               L43:
 291  0000 00098969      	dc.l	625001
 292  0004               L64:
 293  0004 00000064      	dc.l	100
 294                     ; 83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 294                     ; 84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 294                     ; 85                 UART3_Mode_TypeDef Mode)
 294                     ; 86 {
 295                     .text:	section	.text,new
 296  0000               _UART3_Init:
 298  0000 520e          	subw	sp,#14
 299       0000000e      OFST:	set	14
 302                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 304  0002 7b05          	ld	a,(OFST-9,sp)
 305  0004 97            	ld	xl,a
 308  0005 7b06          	ld	a,(OFST-8,sp)
 309  0007 97            	ld	xl,a
 310                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 312  0008 96            	ldw	x,sp
 313  0009 1c000b        	addw	x,#OFST-3
 314  000c cd0000        	call	c_ltor
 318  000f 96            	ldw	x,sp
 319  0010 1c0007        	addw	x,#OFST-7
 320  0013 cd0000        	call	c_ltor
 322                     ; 91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 324  0016 0d15          	tnz	(OFST+7,sp)
 325  0018 2706          	jreq	L21
 326  001a 7b15          	ld	a,(OFST+7,sp)
 327  001c a110          	cp	a,#16
 328  001e 2603          	jrne	L01
 329  0020               L21:
 330  0020 4f            	clr	a
 331  0021 2010          	jra	L41
 332  0023               L01:
 333  0023 ae005b        	ldw	x,#91
 334  0026 89            	pushw	x
 335  0027 ae0000        	ldw	x,#0
 336  002a 89            	pushw	x
 337  002b ae0008        	ldw	x,#L531
 338  002e cd0000        	call	_assert_failed
 340  0031 5b04          	addw	sp,#4
 341  0033               L41:
 342                     ; 92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
 344  0033 0d16          	tnz	(OFST+8,sp)
 345  0035 2706          	jreq	L02
 346  0037 7b16          	ld	a,(OFST+8,sp)
 347  0039 a120          	cp	a,#32
 348  003b 2603          	jrne	L61
 349  003d               L02:
 350  003d 4f            	clr	a
 351  003e 2010          	jra	L22
 352  0040               L61:
 353  0040 ae005c        	ldw	x,#92
 354  0043 89            	pushw	x
 355  0044 ae0000        	ldw	x,#0
 356  0047 89            	pushw	x
 357  0048 ae0008        	ldw	x,#L531
 358  004b cd0000        	call	_assert_failed
 360  004e 5b04          	addw	sp,#4
 361  0050               L22:
 362                     ; 93   assert_param(IS_UART3_PARITY_OK(Parity));
 364  0050 0d17          	tnz	(OFST+9,sp)
 365  0052 270c          	jreq	L62
 366  0054 7b17          	ld	a,(OFST+9,sp)
 367  0056 a104          	cp	a,#4
 368  0058 2706          	jreq	L62
 369  005a 7b17          	ld	a,(OFST+9,sp)
 370  005c a106          	cp	a,#6
 371  005e 2603          	jrne	L42
 372  0060               L62:
 373  0060 4f            	clr	a
 374  0061 2010          	jra	L03
 375  0063               L42:
 376  0063 ae005d        	ldw	x,#93
 377  0066 89            	pushw	x
 378  0067 ae0000        	ldw	x,#0
 379  006a 89            	pushw	x
 380  006b ae0008        	ldw	x,#L531
 381  006e cd0000        	call	_assert_failed
 383  0071 5b04          	addw	sp,#4
 384  0073               L03:
 385                     ; 94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 387  0073 96            	ldw	x,sp
 388  0074 1c0011        	addw	x,#OFST+3
 389  0077 cd0000        	call	c_ltor
 391  007a ae0000        	ldw	x,#L43
 392  007d cd0000        	call	c_lcmp
 394  0080 2403          	jruge	L23
 395  0082 4f            	clr	a
 396  0083 2010          	jra	L63
 397  0085               L23:
 398  0085 ae005e        	ldw	x,#94
 399  0088 89            	pushw	x
 400  0089 ae0000        	ldw	x,#0
 401  008c 89            	pushw	x
 402  008d ae0008        	ldw	x,#L531
 403  0090 cd0000        	call	_assert_failed
 405  0093 5b04          	addw	sp,#4
 406  0095               L63:
 407                     ; 95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 409  0095 7b18          	ld	a,(OFST+10,sp)
 410  0097 a108          	cp	a,#8
 411  0099 2730          	jreq	L24
 412  009b 7b18          	ld	a,(OFST+10,sp)
 413  009d a140          	cp	a,#64
 414  009f 272a          	jreq	L24
 415  00a1 7b18          	ld	a,(OFST+10,sp)
 416  00a3 a104          	cp	a,#4
 417  00a5 2724          	jreq	L24
 418  00a7 7b18          	ld	a,(OFST+10,sp)
 419  00a9 a180          	cp	a,#128
 420  00ab 271e          	jreq	L24
 421  00ad 7b18          	ld	a,(OFST+10,sp)
 422  00af a10c          	cp	a,#12
 423  00b1 2718          	jreq	L24
 424  00b3 7b18          	ld	a,(OFST+10,sp)
 425  00b5 a10c          	cp	a,#12
 426  00b7 2712          	jreq	L24
 427  00b9 7b18          	ld	a,(OFST+10,sp)
 428  00bb a144          	cp	a,#68
 429  00bd 270c          	jreq	L24
 430  00bf 7b18          	ld	a,(OFST+10,sp)
 431  00c1 a1c0          	cp	a,#192
 432  00c3 2706          	jreq	L24
 433  00c5 7b18          	ld	a,(OFST+10,sp)
 434  00c7 a188          	cp	a,#136
 435  00c9 2603          	jrne	L04
 436  00cb               L24:
 437  00cb 4f            	clr	a
 438  00cc 2010          	jra	L44
 439  00ce               L04:
 440  00ce ae005f        	ldw	x,#95
 441  00d1 89            	pushw	x
 442  00d2 ae0000        	ldw	x,#0
 443  00d5 89            	pushw	x
 444  00d6 ae0008        	ldw	x,#L531
 445  00d9 cd0000        	call	_assert_failed
 447  00dc 5b04          	addw	sp,#4
 448  00de               L44:
 449                     ; 98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 451  00de 72195244      	bres	21060,#4
 452                     ; 100   UART3->CR1 |= (uint8_t)WordLength; 
 454  00e2 c65244        	ld	a,21060
 455  00e5 1a15          	or	a,(OFST+7,sp)
 456  00e7 c75244        	ld	21060,a
 457                     ; 103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 459  00ea c65246        	ld	a,21062
 460  00ed a4cf          	and	a,#207
 461  00ef c75246        	ld	21062,a
 462                     ; 105   UART3->CR3 |= (uint8_t)StopBits;  
 464  00f2 c65246        	ld	a,21062
 465  00f5 1a16          	or	a,(OFST+8,sp)
 466  00f7 c75246        	ld	21062,a
 467                     ; 108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 469  00fa c65244        	ld	a,21060
 470  00fd a4f9          	and	a,#249
 471  00ff c75244        	ld	21060,a
 472                     ; 110   UART3->CR1 |= (uint8_t)Parity;     
 474  0102 c65244        	ld	a,21060
 475  0105 1a17          	or	a,(OFST+9,sp)
 476  0107 c75244        	ld	21060,a
 477                     ; 113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 479  010a 725f5242      	clr	21058
 480                     ; 115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 482  010e c65243        	ld	a,21059
 483  0111 a40f          	and	a,#15
 484  0113 c75243        	ld	21059,a
 485                     ; 117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 487  0116 c65243        	ld	a,21059
 488  0119 a4f0          	and	a,#240
 489  011b c75243        	ld	21059,a
 490                     ; 120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 492  011e 96            	ldw	x,sp
 493  011f 1c0011        	addw	x,#OFST+3
 494  0122 cd0000        	call	c_ltor
 496  0125 a604          	ld	a,#4
 497  0127 cd0000        	call	c_llsh
 499  012a 96            	ldw	x,sp
 500  012b 1c0001        	addw	x,#OFST-13
 501  012e cd0000        	call	c_rtol
 503  0131 cd0000        	call	_CLK_GetClockFreq
 505  0134 96            	ldw	x,sp
 506  0135 1c0001        	addw	x,#OFST-13
 507  0138 cd0000        	call	c_ludv
 509  013b 96            	ldw	x,sp
 510  013c 1c000b        	addw	x,#OFST-3
 511  013f cd0000        	call	c_rtol
 513                     ; 121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 515  0142 96            	ldw	x,sp
 516  0143 1c0011        	addw	x,#OFST+3
 517  0146 cd0000        	call	c_ltor
 519  0149 a604          	ld	a,#4
 520  014b cd0000        	call	c_llsh
 522  014e 96            	ldw	x,sp
 523  014f 1c0001        	addw	x,#OFST-13
 524  0152 cd0000        	call	c_rtol
 526  0155 cd0000        	call	_CLK_GetClockFreq
 528  0158 a664          	ld	a,#100
 529  015a cd0000        	call	c_smul
 531  015d 96            	ldw	x,sp
 532  015e 1c0001        	addw	x,#OFST-13
 533  0161 cd0000        	call	c_ludv
 535  0164 96            	ldw	x,sp
 536  0165 1c0007        	addw	x,#OFST-7
 537  0168 cd0000        	call	c_rtol
 539                     ; 124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 539                     ; 125                                 << 4) / 100) & (uint8_t)0x0F); 
 541  016b 96            	ldw	x,sp
 542  016c 1c000b        	addw	x,#OFST-3
 543  016f cd0000        	call	c_ltor
 545  0172 a664          	ld	a,#100
 546  0174 cd0000        	call	c_smul
 548  0177 96            	ldw	x,sp
 549  0178 1c0001        	addw	x,#OFST-13
 550  017b cd0000        	call	c_rtol
 552  017e 96            	ldw	x,sp
 553  017f 1c0007        	addw	x,#OFST-7
 554  0182 cd0000        	call	c_ltor
 556  0185 96            	ldw	x,sp
 557  0186 1c0001        	addw	x,#OFST-13
 558  0189 cd0000        	call	c_lsub
 560  018c a604          	ld	a,#4
 561  018e cd0000        	call	c_llsh
 563  0191 ae0004        	ldw	x,#L64
 564  0194 cd0000        	call	c_ludv
 566  0197 b603          	ld	a,c_lreg+3
 567  0199 a40f          	and	a,#15
 568  019b 6b05          	ld	(OFST-9,sp),a
 569                     ; 126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 571  019d 96            	ldw	x,sp
 572  019e 1c000b        	addw	x,#OFST-3
 573  01a1 cd0000        	call	c_ltor
 575  01a4 a604          	ld	a,#4
 576  01a6 cd0000        	call	c_lursh
 578  01a9 b603          	ld	a,c_lreg+3
 579  01ab a4f0          	and	a,#240
 580  01ad b703          	ld	c_lreg+3,a
 581  01af 3f02          	clr	c_lreg+2
 582  01b1 3f01          	clr	c_lreg+1
 583  01b3 3f00          	clr	c_lreg
 584  01b5 b603          	ld	a,c_lreg+3
 585  01b7 6b06          	ld	(OFST-8,sp),a
 586                     ; 128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 588  01b9 7b05          	ld	a,(OFST-9,sp)
 589  01bb 1a06          	or	a,(OFST-8,sp)
 590  01bd c75243        	ld	21059,a
 591                     ; 130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 593  01c0 7b0e          	ld	a,(OFST+0,sp)
 594  01c2 c75242        	ld	21058,a
 595                     ; 132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 597  01c5 7b18          	ld	a,(OFST+10,sp)
 598  01c7 a504          	bcp	a,#4
 599  01c9 2706          	jreq	L731
 600                     ; 135     UART3->CR2 |= UART3_CR2_TEN;  
 602  01cb 72165245      	bset	21061,#3
 604  01cf 2004          	jra	L141
 605  01d1               L731:
 606                     ; 140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 608  01d1 72175245      	bres	21061,#3
 609  01d5               L141:
 610                     ; 142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 612  01d5 7b18          	ld	a,(OFST+10,sp)
 613  01d7 a508          	bcp	a,#8
 614  01d9 2706          	jreq	L341
 615                     ; 145     UART3->CR2 |= UART3_CR2_REN;  
 617  01db 72145245      	bset	21061,#2
 619  01df 2004          	jra	L541
 620  01e1               L341:
 621                     ; 150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 623  01e1 72155245      	bres	21061,#2
 624  01e5               L541:
 625                     ; 152 }
 628  01e5 5b0e          	addw	sp,#14
 629  01e7 81            	ret
 684                     ; 160 void UART3_Cmd(FunctionalState NewState)
 684                     ; 161 {
 685                     .text:	section	.text,new
 686  0000               _UART3_Cmd:
 690                     ; 162   if (NewState != DISABLE)
 692  0000 4d            	tnz	a
 693  0001 2706          	jreq	L571
 694                     ; 165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 696  0003 721b5244      	bres	21060,#5
 698  0007 2004          	jra	L771
 699  0009               L571:
 700                     ; 170     UART3->CR1 |= UART3_CR1_UARTD;  
 702  0009 721a5244      	bset	21060,#5
 703  000d               L771:
 704                     ; 172 }
 707  000d 81            	ret
 836                     ; 189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 836                     ; 190 {
 837                     .text:	section	.text,new
 838  0000               _UART3_ITConfig:
 840  0000 89            	pushw	x
 841  0001 89            	pushw	x
 842       00000002      OFST:	set	2
 845                     ; 191   uint8_t uartreg = 0, itpos = 0x00;
 847  0002 7b01          	ld	a,(OFST-1,sp)
 848  0004 97            	ld	xl,a
 851  0005 7b02          	ld	a,(OFST+0,sp)
 852  0007 97            	ld	xl,a
 853                     ; 194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 855  0008 1e03          	ldw	x,(OFST+1,sp)
 856  000a a30100        	cpw	x,#256
 857  000d 272a          	jreq	L65
 858  000f 1e03          	ldw	x,(OFST+1,sp)
 859  0011 a30277        	cpw	x,#631
 860  0014 2723          	jreq	L65
 861  0016 1e03          	ldw	x,(OFST+1,sp)
 862  0018 a30266        	cpw	x,#614
 863  001b 271c          	jreq	L65
 864  001d 1e03          	ldw	x,(OFST+1,sp)
 865  001f a30205        	cpw	x,#517
 866  0022 2715          	jreq	L65
 867  0024 1e03          	ldw	x,(OFST+1,sp)
 868  0026 a30244        	cpw	x,#580
 869  0029 270e          	jreq	L65
 870  002b 1e03          	ldw	x,(OFST+1,sp)
 871  002d a30412        	cpw	x,#1042
 872  0030 2707          	jreq	L65
 873  0032 1e03          	ldw	x,(OFST+1,sp)
 874  0034 a30346        	cpw	x,#838
 875  0037 2603          	jrne	L45
 876  0039               L65:
 877  0039 4f            	clr	a
 878  003a 2010          	jra	L06
 879  003c               L45:
 880  003c ae00c2        	ldw	x,#194
 881  003f 89            	pushw	x
 882  0040 ae0000        	ldw	x,#0
 883  0043 89            	pushw	x
 884  0044 ae0008        	ldw	x,#L531
 885  0047 cd0000        	call	_assert_failed
 887  004a 5b04          	addw	sp,#4
 888  004c               L06:
 889                     ; 195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 891  004c 0d07          	tnz	(OFST+5,sp)
 892  004e 2706          	jreq	L46
 893  0050 7b07          	ld	a,(OFST+5,sp)
 894  0052 a101          	cp	a,#1
 895  0054 2603          	jrne	L26
 896  0056               L46:
 897  0056 4f            	clr	a
 898  0057 2010          	jra	L66
 899  0059               L26:
 900  0059 ae00c3        	ldw	x,#195
 901  005c 89            	pushw	x
 902  005d ae0000        	ldw	x,#0
 903  0060 89            	pushw	x
 904  0061 ae0008        	ldw	x,#L531
 905  0064 cd0000        	call	_assert_failed
 907  0067 5b04          	addw	sp,#4
 908  0069               L66:
 909                     ; 198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 911  0069 7b03          	ld	a,(OFST+1,sp)
 912  006b 6b01          	ld	(OFST-1,sp),a
 913                     ; 201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 915  006d 7b04          	ld	a,(OFST+2,sp)
 916  006f a40f          	and	a,#15
 917  0071 5f            	clrw	x
 918  0072 97            	ld	xl,a
 919  0073 a601          	ld	a,#1
 920  0075 5d            	tnzw	x
 921  0076 2704          	jreq	L07
 922  0078               L27:
 923  0078 48            	sll	a
 924  0079 5a            	decw	x
 925  007a 26fc          	jrne	L27
 926  007c               L07:
 927  007c 6b02          	ld	(OFST+0,sp),a
 928                     ; 203   if (NewState != DISABLE)
 930  007e 0d07          	tnz	(OFST+5,sp)
 931  0080 273a          	jreq	L552
 932                     ; 206     if (uartreg == 0x01)
 934  0082 7b01          	ld	a,(OFST-1,sp)
 935  0084 a101          	cp	a,#1
 936  0086 260a          	jrne	L752
 937                     ; 208       UART3->CR1 |= itpos;
 939  0088 c65244        	ld	a,21060
 940  008b 1a02          	or	a,(OFST+0,sp)
 941  008d c75244        	ld	21060,a
 943  0090 2066          	jra	L372
 944  0092               L752:
 945                     ; 210     else if (uartreg == 0x02)
 947  0092 7b01          	ld	a,(OFST-1,sp)
 948  0094 a102          	cp	a,#2
 949  0096 260a          	jrne	L362
 950                     ; 212       UART3->CR2 |= itpos;
 952  0098 c65245        	ld	a,21061
 953  009b 1a02          	or	a,(OFST+0,sp)
 954  009d c75245        	ld	21061,a
 956  00a0 2056          	jra	L372
 957  00a2               L362:
 958                     ; 214     else if (uartreg == 0x03)
 960  00a2 7b01          	ld	a,(OFST-1,sp)
 961  00a4 a103          	cp	a,#3
 962  00a6 260a          	jrne	L762
 963                     ; 216       UART3->CR4 |= itpos;
 965  00a8 c65247        	ld	a,21063
 966  00ab 1a02          	or	a,(OFST+0,sp)
 967  00ad c75247        	ld	21063,a
 969  00b0 2046          	jra	L372
 970  00b2               L762:
 971                     ; 220       UART3->CR6 |= itpos;
 973  00b2 c65249        	ld	a,21065
 974  00b5 1a02          	or	a,(OFST+0,sp)
 975  00b7 c75249        	ld	21065,a
 976  00ba 203c          	jra	L372
 977  00bc               L552:
 978                     ; 226     if (uartreg == 0x01)
 980  00bc 7b01          	ld	a,(OFST-1,sp)
 981  00be a101          	cp	a,#1
 982  00c0 260b          	jrne	L572
 983                     ; 228       UART3->CR1 &= (uint8_t)(~itpos);
 985  00c2 7b02          	ld	a,(OFST+0,sp)
 986  00c4 43            	cpl	a
 987  00c5 c45244        	and	a,21060
 988  00c8 c75244        	ld	21060,a
 990  00cb 202b          	jra	L372
 991  00cd               L572:
 992                     ; 230     else if (uartreg == 0x02)
 994  00cd 7b01          	ld	a,(OFST-1,sp)
 995  00cf a102          	cp	a,#2
 996  00d1 260b          	jrne	L103
 997                     ; 232       UART3->CR2 &= (uint8_t)(~itpos);
 999  00d3 7b02          	ld	a,(OFST+0,sp)
1000  00d5 43            	cpl	a
1001  00d6 c45245        	and	a,21061
1002  00d9 c75245        	ld	21061,a
1004  00dc 201a          	jra	L372
1005  00de               L103:
1006                     ; 234     else if (uartreg == 0x03)
1008  00de 7b01          	ld	a,(OFST-1,sp)
1009  00e0 a103          	cp	a,#3
1010  00e2 260b          	jrne	L503
1011                     ; 236       UART3->CR4 &= (uint8_t)(~itpos);
1013  00e4 7b02          	ld	a,(OFST+0,sp)
1014  00e6 43            	cpl	a
1015  00e7 c45247        	and	a,21063
1016  00ea c75247        	ld	21063,a
1018  00ed 2009          	jra	L372
1019  00ef               L503:
1020                     ; 240       UART3->CR6 &= (uint8_t)(~itpos);
1022  00ef 7b02          	ld	a,(OFST+0,sp)
1023  00f1 43            	cpl	a
1024  00f2 c45249        	and	a,21065
1025  00f5 c75249        	ld	21065,a
1026  00f8               L372:
1027                     ; 243 }
1030  00f8 5b04          	addw	sp,#4
1031  00fa 81            	ret
1091                     ; 252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1091                     ; 253 {
1092                     .text:	section	.text,new
1093  0000               _UART3_LINBreakDetectionConfig:
1095  0000 88            	push	a
1096       00000000      OFST:	set	0
1099                     ; 255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1101  0001 4d            	tnz	a
1102  0002 2704          	jreq	L001
1103  0004 a101          	cp	a,#1
1104  0006 2603          	jrne	L67
1105  0008               L001:
1106  0008 4f            	clr	a
1107  0009 2010          	jra	L201
1108  000b               L67:
1109  000b ae00ff        	ldw	x,#255
1110  000e 89            	pushw	x
1111  000f ae0000        	ldw	x,#0
1112  0012 89            	pushw	x
1113  0013 ae0008        	ldw	x,#L531
1114  0016 cd0000        	call	_assert_failed
1116  0019 5b04          	addw	sp,#4
1117  001b               L201:
1118                     ; 257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1120  001b 0d01          	tnz	(OFST+1,sp)
1121  001d 2706          	jreq	L733
1122                     ; 259     UART3->CR4 |= UART3_CR4_LBDL;
1124  001f 721a5247      	bset	21063,#5
1126  0023 2004          	jra	L143
1127  0025               L733:
1128                     ; 263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1130  0025 721b5247      	bres	21063,#5
1131  0029               L143:
1132                     ; 265 }
1135  0029 84            	pop	a
1136  002a 81            	ret
1258                     ; 277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1258                     ; 278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1258                     ; 279                      UART3_LinDivUp_TypeDef UART3_DivUp)
1258                     ; 280 {
1259                     .text:	section	.text,new
1260  0000               _UART3_LINConfig:
1262  0000 89            	pushw	x
1263       00000000      OFST:	set	0
1266                     ; 282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1268  0001 9e            	ld	a,xh
1269  0002 4d            	tnz	a
1270  0003 2705          	jreq	L011
1271  0005 9e            	ld	a,xh
1272  0006 a101          	cp	a,#1
1273  0008 2603          	jrne	L601
1274  000a               L011:
1275  000a 4f            	clr	a
1276  000b 2010          	jra	L211
1277  000d               L601:
1278  000d ae011a        	ldw	x,#282
1279  0010 89            	pushw	x
1280  0011 ae0000        	ldw	x,#0
1281  0014 89            	pushw	x
1282  0015 ae0008        	ldw	x,#L531
1283  0018 cd0000        	call	_assert_failed
1285  001b 5b04          	addw	sp,#4
1286  001d               L211:
1287                     ; 283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1289  001d 7b02          	ld	a,(OFST+2,sp)
1290  001f a101          	cp	a,#1
1291  0021 2704          	jreq	L611
1292  0023 0d02          	tnz	(OFST+2,sp)
1293  0025 2603          	jrne	L411
1294  0027               L611:
1295  0027 4f            	clr	a
1296  0028 2010          	jra	L021
1297  002a               L411:
1298  002a ae011b        	ldw	x,#283
1299  002d 89            	pushw	x
1300  002e ae0000        	ldw	x,#0
1301  0031 89            	pushw	x
1302  0032 ae0008        	ldw	x,#L531
1303  0035 cd0000        	call	_assert_failed
1305  0038 5b04          	addw	sp,#4
1306  003a               L021:
1307                     ; 284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1309  003a 0d05          	tnz	(OFST+5,sp)
1310  003c 2706          	jreq	L421
1311  003e 7b05          	ld	a,(OFST+5,sp)
1312  0040 a101          	cp	a,#1
1313  0042 2603          	jrne	L221
1314  0044               L421:
1315  0044 4f            	clr	a
1316  0045 2010          	jra	L621
1317  0047               L221:
1318  0047 ae011c        	ldw	x,#284
1319  004a 89            	pushw	x
1320  004b ae0000        	ldw	x,#0
1321  004e 89            	pushw	x
1322  004f ae0008        	ldw	x,#L531
1323  0052 cd0000        	call	_assert_failed
1325  0055 5b04          	addw	sp,#4
1326  0057               L621:
1327                     ; 286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
1329  0057 0d01          	tnz	(OFST+1,sp)
1330  0059 2706          	jreq	L124
1331                     ; 288     UART3->CR6 |=  UART3_CR6_LSLV;
1333  005b 721a5249      	bset	21065,#5
1335  005f 2004          	jra	L324
1336  0061               L124:
1337                     ; 292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1339  0061 721b5249      	bres	21065,#5
1340  0065               L324:
1341                     ; 295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1343  0065 0d02          	tnz	(OFST+2,sp)
1344  0067 2706          	jreq	L524
1345                     ; 297     UART3->CR6 |=  UART3_CR6_LASE ;
1347  0069 72185249      	bset	21065,#4
1349  006d 2004          	jra	L724
1350  006f               L524:
1351                     ; 301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1353  006f 72195249      	bres	21065,#4
1354  0073               L724:
1355                     ; 304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1357  0073 0d05          	tnz	(OFST+5,sp)
1358  0075 2706          	jreq	L134
1359                     ; 306     UART3->CR6 |=  UART3_CR6_LDUM;
1361  0077 721e5249      	bset	21065,#7
1363  007b 2004          	jra	L334
1364  007d               L134:
1365                     ; 310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1367  007d 721f5249      	bres	21065,#7
1368  0081               L334:
1369                     ; 312 }
1372  0081 85            	popw	x
1373  0082 81            	ret
1409                     ; 320 void UART3_LINCmd(FunctionalState NewState)
1409                     ; 321 {
1410                     .text:	section	.text,new
1411  0000               _UART3_LINCmd:
1413  0000 88            	push	a
1414       00000000      OFST:	set	0
1417                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1419  0001 4d            	tnz	a
1420  0002 2704          	jreq	L431
1421  0004 a101          	cp	a,#1
1422  0006 2603          	jrne	L231
1423  0008               L431:
1424  0008 4f            	clr	a
1425  0009 2010          	jra	L631
1426  000b               L231:
1427  000b ae0143        	ldw	x,#323
1428  000e 89            	pushw	x
1429  000f ae0000        	ldw	x,#0
1430  0012 89            	pushw	x
1431  0013 ae0008        	ldw	x,#L531
1432  0016 cd0000        	call	_assert_failed
1434  0019 5b04          	addw	sp,#4
1435  001b               L631:
1436                     ; 325   if (NewState != DISABLE)
1438  001b 0d01          	tnz	(OFST+1,sp)
1439  001d 2706          	jreq	L354
1440                     ; 328     UART3->CR3 |= UART3_CR3_LINEN;
1442  001f 721c5246      	bset	21062,#6
1444  0023 2004          	jra	L554
1445  0025               L354:
1446                     ; 333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1448  0025 721d5246      	bres	21062,#6
1449  0029               L554:
1450                     ; 335 }
1453  0029 84            	pop	a
1454  002a 81            	ret
1512                     ; 343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1512                     ; 344 {
1513                     .text:	section	.text,new
1514  0000               _UART3_WakeUpConfig:
1516  0000 88            	push	a
1517       00000000      OFST:	set	0
1520                     ; 346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1522  0001 4d            	tnz	a
1523  0002 2704          	jreq	L441
1524  0004 a108          	cp	a,#8
1525  0006 2603          	jrne	L241
1526  0008               L441:
1527  0008 4f            	clr	a
1528  0009 2010          	jra	L641
1529  000b               L241:
1530  000b ae015a        	ldw	x,#346
1531  000e 89            	pushw	x
1532  000f ae0000        	ldw	x,#0
1533  0012 89            	pushw	x
1534  0013 ae0008        	ldw	x,#L531
1535  0016 cd0000        	call	_assert_failed
1537  0019 5b04          	addw	sp,#4
1538  001b               L641:
1539                     ; 348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1541  001b 72175244      	bres	21060,#3
1542                     ; 349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
1544  001f c65244        	ld	a,21060
1545  0022 1a01          	or	a,(OFST+1,sp)
1546  0024 c75244        	ld	21060,a
1547                     ; 350 }
1550  0027 84            	pop	a
1551  0028 81            	ret
1588                     ; 358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1588                     ; 359 {
1589                     .text:	section	.text,new
1590  0000               _UART3_ReceiverWakeUpCmd:
1592  0000 88            	push	a
1593       00000000      OFST:	set	0
1596                     ; 361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1598  0001 4d            	tnz	a
1599  0002 2704          	jreq	L451
1600  0004 a101          	cp	a,#1
1601  0006 2603          	jrne	L251
1602  0008               L451:
1603  0008 4f            	clr	a
1604  0009 2010          	jra	L651
1605  000b               L251:
1606  000b ae0169        	ldw	x,#361
1607  000e 89            	pushw	x
1608  000f ae0000        	ldw	x,#0
1609  0012 89            	pushw	x
1610  0013 ae0008        	ldw	x,#L531
1611  0016 cd0000        	call	_assert_failed
1613  0019 5b04          	addw	sp,#4
1614  001b               L651:
1615                     ; 363   if (NewState != DISABLE)
1617  001b 0d01          	tnz	(OFST+1,sp)
1618  001d 2706          	jreq	L325
1619                     ; 366     UART3->CR2 |= UART3_CR2_RWU;
1621  001f 72125245      	bset	21061,#1
1623  0023 2004          	jra	L525
1624  0025               L325:
1625                     ; 371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1627  0025 72135245      	bres	21061,#1
1628  0029               L525:
1629                     ; 373 }
1632  0029 84            	pop	a
1633  002a 81            	ret
1656                     ; 380 uint8_t UART3_ReceiveData8(void)
1656                     ; 381 {
1657                     .text:	section	.text,new
1658  0000               _UART3_ReceiveData8:
1662                     ; 382   return ((uint8_t)UART3->DR);
1664  0000 c65241        	ld	a,21057
1667  0003 81            	ret
1699                     ; 390 uint16_t UART3_ReceiveData9(void)
1699                     ; 391 {
1700                     .text:	section	.text,new
1701  0000               _UART3_ReceiveData9:
1703  0000 89            	pushw	x
1704       00000002      OFST:	set	2
1707                     ; 392   uint16_t temp = 0;
1709  0001 5f            	clrw	x
1710  0002 1f01          	ldw	(OFST-1,sp),x
1711                     ; 394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1713  0004 c65244        	ld	a,21060
1714  0007 5f            	clrw	x
1715  0008 a480          	and	a,#128
1716  000a 5f            	clrw	x
1717  000b 02            	rlwa	x,a
1718  000c 58            	sllw	x
1719  000d 1f01          	ldw	(OFST-1,sp),x
1720                     ; 395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1722  000f c65241        	ld	a,21057
1723  0012 5f            	clrw	x
1724  0013 97            	ld	xl,a
1725  0014 01            	rrwa	x,a
1726  0015 1a02          	or	a,(OFST+0,sp)
1727  0017 01            	rrwa	x,a
1728  0018 1a01          	or	a,(OFST-1,sp)
1729  001a 01            	rrwa	x,a
1730  001b 01            	rrwa	x,a
1731  001c a4ff          	and	a,#255
1732  001e 01            	rrwa	x,a
1733  001f a401          	and	a,#1
1734  0021 01            	rrwa	x,a
1737  0022 5b02          	addw	sp,#2
1738  0024 81            	ret
1770                     ; 403 void UART3_SendData8(uint8_t Data)
1770                     ; 404 {
1771                     .text:	section	.text,new
1772  0000               _UART3_SendData8:
1776                     ; 406   UART3->DR = Data;
1778  0000 c75241        	ld	21057,a
1779                     ; 407 }
1782  0003 81            	ret
1814                     ; 414 void UART3_SendData9(uint16_t Data)
1814                     ; 415 {
1815                     .text:	section	.text,new
1816  0000               _UART3_SendData9:
1818  0000 89            	pushw	x
1819       00000000      OFST:	set	0
1822                     ; 417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1824  0001 721d5244      	bres	21060,#6
1825                     ; 420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1827  0005 54            	srlw	x
1828  0006 54            	srlw	x
1829  0007 9f            	ld	a,xl
1830  0008 a440          	and	a,#64
1831  000a ca5244        	or	a,21060
1832  000d c75244        	ld	21060,a
1833                     ; 423   UART3->DR   = (uint8_t)(Data);                    
1835  0010 7b02          	ld	a,(OFST+2,sp)
1836  0012 c75241        	ld	21057,a
1837                     ; 424 }
1840  0015 85            	popw	x
1841  0016 81            	ret
1864                     ; 431 void UART3_SendBreak(void)
1864                     ; 432 {
1865                     .text:	section	.text,new
1866  0000               _UART3_SendBreak:
1870                     ; 433   UART3->CR2 |= UART3_CR2_SBK;
1872  0000 72105245      	bset	21061,#0
1873                     ; 434 }
1876  0004 81            	ret
1909                     ; 441 void UART3_SetAddress(uint8_t UART3_Address)
1909                     ; 442 {
1910                     .text:	section	.text,new
1911  0000               _UART3_SetAddress:
1913  0000 88            	push	a
1914       00000000      OFST:	set	0
1917                     ; 444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1919  0001 a110          	cp	a,#16
1920  0003 2403          	jruge	L471
1921  0005 4f            	clr	a
1922  0006 2010          	jra	L671
1923  0008               L471:
1924  0008 ae01bc        	ldw	x,#444
1925  000b 89            	pushw	x
1926  000c ae0000        	ldw	x,#0
1927  000f 89            	pushw	x
1928  0010 ae0008        	ldw	x,#L531
1929  0013 cd0000        	call	_assert_failed
1931  0016 5b04          	addw	sp,#4
1932  0018               L671:
1933                     ; 447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1935  0018 c65247        	ld	a,21063
1936  001b a4f0          	and	a,#240
1937  001d c75247        	ld	21063,a
1938                     ; 449   UART3->CR4 |= UART3_Address;
1940  0020 c65247        	ld	a,21063
1941  0023 1a01          	or	a,(OFST+1,sp)
1942  0025 c75247        	ld	21063,a
1943                     ; 450 }
1946  0028 84            	pop	a
1947  0029 81            	ret
2105                     ; 458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2105                     ; 459 {
2106                     .text:	section	.text,new
2107  0000               _UART3_GetFlagStatus:
2109  0000 89            	pushw	x
2110  0001 88            	push	a
2111       00000001      OFST:	set	1
2114                     ; 460   FlagStatus status = RESET;
2116  0002 0f01          	clr	(OFST+0,sp)
2117                     ; 463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2119  0004 a30080        	cpw	x,#128
2120  0007 2737          	jreq	L402
2121  0009 a30040        	cpw	x,#64
2122  000c 2732          	jreq	L402
2123  000e a30020        	cpw	x,#32
2124  0011 272d          	jreq	L402
2125  0013 a30010        	cpw	x,#16
2126  0016 2728          	jreq	L402
2127  0018 a30008        	cpw	x,#8
2128  001b 2723          	jreq	L402
2129  001d a30004        	cpw	x,#4
2130  0020 271e          	jreq	L402
2131  0022 a30002        	cpw	x,#2
2132  0025 2719          	jreq	L402
2133  0027 a30001        	cpw	x,#1
2134  002a 2714          	jreq	L402
2135  002c a30101        	cpw	x,#257
2136  002f 270f          	jreq	L402
2137  0031 a30301        	cpw	x,#769
2138  0034 270a          	jreq	L402
2139  0036 a30302        	cpw	x,#770
2140  0039 2705          	jreq	L402
2141  003b a30210        	cpw	x,#528
2142  003e 2603          	jrne	L202
2143  0040               L402:
2144  0040 4f            	clr	a
2145  0041 2010          	jra	L602
2146  0043               L202:
2147  0043 ae01cf        	ldw	x,#463
2148  0046 89            	pushw	x
2149  0047 ae0000        	ldw	x,#0
2150  004a 89            	pushw	x
2151  004b ae0008        	ldw	x,#L531
2152  004e cd0000        	call	_assert_failed
2154  0051 5b04          	addw	sp,#4
2155  0053               L602:
2156                     ; 466   if (UART3_FLAG == UART3_FLAG_LBDF)
2158  0053 1e02          	ldw	x,(OFST+1,sp)
2159  0055 a30210        	cpw	x,#528
2160  0058 2611          	jrne	L517
2161                     ; 468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2163  005a c65247        	ld	a,21063
2164  005d 1503          	bcp	a,(OFST+2,sp)
2165  005f 2706          	jreq	L717
2166                     ; 471       status = SET;
2168  0061 a601          	ld	a,#1
2169  0063 6b01          	ld	(OFST+0,sp),a
2171  0065 2039          	jra	L327
2172  0067               L717:
2173                     ; 476       status = RESET;
2175  0067 0f01          	clr	(OFST+0,sp)
2176  0069 2035          	jra	L327
2177  006b               L517:
2178                     ; 479   else if (UART3_FLAG == UART3_FLAG_SBK)
2180  006b 1e02          	ldw	x,(OFST+1,sp)
2181  006d a30101        	cpw	x,#257
2182  0070 2611          	jrne	L527
2183                     ; 481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2185  0072 c65245        	ld	a,21061
2186  0075 1503          	bcp	a,(OFST+2,sp)
2187  0077 2706          	jreq	L727
2188                     ; 484       status = SET;
2190  0079 a601          	ld	a,#1
2191  007b 6b01          	ld	(OFST+0,sp),a
2193  007d 2021          	jra	L327
2194  007f               L727:
2195                     ; 489       status = RESET;
2197  007f 0f01          	clr	(OFST+0,sp)
2198  0081 201d          	jra	L327
2199  0083               L527:
2200                     ; 492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2202  0083 1e02          	ldw	x,(OFST+1,sp)
2203  0085 a30302        	cpw	x,#770
2204  0088 2707          	jreq	L737
2206  008a 1e02          	ldw	x,(OFST+1,sp)
2207  008c a30301        	cpw	x,#769
2208  008f 2614          	jrne	L537
2209  0091               L737:
2210                     ; 494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2212  0091 c65249        	ld	a,21065
2213  0094 1503          	bcp	a,(OFST+2,sp)
2214  0096 2706          	jreq	L147
2215                     ; 497       status = SET;
2217  0098 a601          	ld	a,#1
2218  009a 6b01          	ld	(OFST+0,sp),a
2220  009c 2002          	jra	L327
2221  009e               L147:
2222                     ; 502       status = RESET;
2224  009e 0f01          	clr	(OFST+0,sp)
2225  00a0               L327:
2226                     ; 520   return  status;
2228  00a0 7b01          	ld	a,(OFST+0,sp)
2231  00a2 5b03          	addw	sp,#3
2232  00a4 81            	ret
2233  00a5               L537:
2234                     ; 507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2236  00a5 c65240        	ld	a,21056
2237  00a8 1503          	bcp	a,(OFST+2,sp)
2238  00aa 2706          	jreq	L747
2239                     ; 510       status = SET;
2241  00ac a601          	ld	a,#1
2242  00ae 6b01          	ld	(OFST+0,sp),a
2244  00b0 20ee          	jra	L327
2245  00b2               L747:
2246                     ; 515       status = RESET;
2248  00b2 0f01          	clr	(OFST+0,sp)
2249  00b4 20ea          	jra	L327
2285                     ; 551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2285                     ; 552 {
2286                     .text:	section	.text,new
2287  0000               _UART3_ClearFlag:
2289  0000 89            	pushw	x
2290       00000000      OFST:	set	0
2293                     ; 554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2295  0001 a30020        	cpw	x,#32
2296  0004 270f          	jreq	L412
2297  0006 a30302        	cpw	x,#770
2298  0009 270a          	jreq	L412
2299  000b a30301        	cpw	x,#769
2300  000e 2705          	jreq	L412
2301  0010 a30210        	cpw	x,#528
2302  0013 2603          	jrne	L212
2303  0015               L412:
2304  0015 4f            	clr	a
2305  0016 2010          	jra	L612
2306  0018               L212:
2307  0018 ae022a        	ldw	x,#554
2308  001b 89            	pushw	x
2309  001c ae0000        	ldw	x,#0
2310  001f 89            	pushw	x
2311  0020 ae0008        	ldw	x,#L531
2312  0023 cd0000        	call	_assert_failed
2314  0026 5b04          	addw	sp,#4
2315  0028               L612:
2316                     ; 557   if (UART3_FLAG == UART3_FLAG_RXNE)
2318  0028 1e01          	ldw	x,(OFST+1,sp)
2319  002a a30020        	cpw	x,#32
2320  002d 2606          	jrne	L177
2321                     ; 559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2323  002f 35df5240      	mov	21056,#223
2325  0033 201e          	jra	L377
2326  0035               L177:
2327                     ; 562   else if (UART3_FLAG == UART3_FLAG_LBDF)
2329  0035 1e01          	ldw	x,(OFST+1,sp)
2330  0037 a30210        	cpw	x,#528
2331  003a 2606          	jrne	L577
2332                     ; 564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2334  003c 72195247      	bres	21063,#4
2336  0040 2011          	jra	L377
2337  0042               L577:
2338                     ; 567   else if (UART3_FLAG == UART3_FLAG_LHDF)
2340  0042 1e01          	ldw	x,(OFST+1,sp)
2341  0044 a30302        	cpw	x,#770
2342  0047 2606          	jrne	L1001
2343                     ; 569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2345  0049 72135249      	bres	21065,#1
2347  004d 2004          	jra	L377
2348  004f               L1001:
2349                     ; 574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2351  004f 72115249      	bres	21065,#0
2352  0053               L377:
2353                     ; 576 }
2356  0053 85            	popw	x
2357  0054 81            	ret
2432                     ; 591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2432                     ; 592 {
2433                     .text:	section	.text,new
2434  0000               _UART3_GetITStatus:
2436  0000 89            	pushw	x
2437  0001 89            	pushw	x
2438       00000002      OFST:	set	2
2441                     ; 593   ITStatus pendingbitstatus = RESET;
2443  0002 7b02          	ld	a,(OFST+0,sp)
2444  0004 97            	ld	xl,a
2445                     ; 594   uint8_t itpos = 0;
2447  0005 7b01          	ld	a,(OFST-1,sp)
2448  0007 97            	ld	xl,a
2449                     ; 595   uint8_t itmask1 = 0;
2451  0008 7b02          	ld	a,(OFST+0,sp)
2452  000a 97            	ld	xl,a
2453                     ; 596   uint8_t itmask2 = 0;
2455  000b 7b02          	ld	a,(OFST+0,sp)
2456  000d 97            	ld	xl,a
2457                     ; 597   uint8_t enablestatus = 0;
2459  000e 7b02          	ld	a,(OFST+0,sp)
2460  0010 97            	ld	xl,a
2461                     ; 600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2463  0011 1e03          	ldw	x,(OFST+1,sp)
2464  0013 a30277        	cpw	x,#631
2465  0016 2731          	jreq	L422
2466  0018 1e03          	ldw	x,(OFST+1,sp)
2467  001a a30266        	cpw	x,#614
2468  001d 272a          	jreq	L422
2469  001f 1e03          	ldw	x,(OFST+1,sp)
2470  0021 a30255        	cpw	x,#597
2471  0024 2723          	jreq	L422
2472  0026 1e03          	ldw	x,(OFST+1,sp)
2473  0028 a30244        	cpw	x,#580
2474  002b 271c          	jreq	L422
2475  002d 1e03          	ldw	x,(OFST+1,sp)
2476  002f a30235        	cpw	x,#565
2477  0032 2715          	jreq	L422
2478  0034 1e03          	ldw	x,(OFST+1,sp)
2479  0036 a30346        	cpw	x,#838
2480  0039 270e          	jreq	L422
2481  003b 1e03          	ldw	x,(OFST+1,sp)
2482  003d a30412        	cpw	x,#1042
2483  0040 2707          	jreq	L422
2484  0042 1e03          	ldw	x,(OFST+1,sp)
2485  0044 a30100        	cpw	x,#256
2486  0047 2603          	jrne	L222
2487  0049               L422:
2488  0049 4f            	clr	a
2489  004a 2010          	jra	L622
2490  004c               L222:
2491  004c ae0258        	ldw	x,#600
2492  004f 89            	pushw	x
2493  0050 ae0000        	ldw	x,#0
2494  0053 89            	pushw	x
2495  0054 ae0008        	ldw	x,#L531
2496  0057 cd0000        	call	_assert_failed
2498  005a 5b04          	addw	sp,#4
2499  005c               L622:
2500                     ; 603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2502  005c 7b04          	ld	a,(OFST+2,sp)
2503  005e a40f          	and	a,#15
2504  0060 5f            	clrw	x
2505  0061 97            	ld	xl,a
2506  0062 a601          	ld	a,#1
2507  0064 5d            	tnzw	x
2508  0065 2704          	jreq	L032
2509  0067               L232:
2510  0067 48            	sll	a
2511  0068 5a            	decw	x
2512  0069 26fc          	jrne	L232
2513  006b               L032:
2514  006b 6b01          	ld	(OFST-1,sp),a
2515                     ; 605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2517  006d 7b04          	ld	a,(OFST+2,sp)
2518  006f 4e            	swap	a
2519  0070 a40f          	and	a,#15
2520  0072 6b02          	ld	(OFST+0,sp),a
2521                     ; 607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2523  0074 7b02          	ld	a,(OFST+0,sp)
2524  0076 5f            	clrw	x
2525  0077 97            	ld	xl,a
2526  0078 a601          	ld	a,#1
2527  007a 5d            	tnzw	x
2528  007b 2704          	jreq	L432
2529  007d               L632:
2530  007d 48            	sll	a
2531  007e 5a            	decw	x
2532  007f 26fc          	jrne	L632
2533  0081               L432:
2534  0081 6b02          	ld	(OFST+0,sp),a
2535                     ; 610   if (UART3_IT == UART3_IT_PE)
2537  0083 1e03          	ldw	x,(OFST+1,sp)
2538  0085 a30100        	cpw	x,#256
2539  0088 261c          	jrne	L7301
2540                     ; 613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2542  008a c65244        	ld	a,21060
2543  008d 1402          	and	a,(OFST+0,sp)
2544  008f 6b02          	ld	(OFST+0,sp),a
2545                     ; 616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2547  0091 c65240        	ld	a,21056
2548  0094 1501          	bcp	a,(OFST-1,sp)
2549  0096 270a          	jreq	L1401
2551  0098 0d02          	tnz	(OFST+0,sp)
2552  009a 2706          	jreq	L1401
2553                     ; 619       pendingbitstatus = SET;
2555  009c a601          	ld	a,#1
2556  009e 6b02          	ld	(OFST+0,sp),a
2558  00a0 2064          	jra	L5401
2559  00a2               L1401:
2560                     ; 624       pendingbitstatus = RESET;
2562  00a2 0f02          	clr	(OFST+0,sp)
2563  00a4 2060          	jra	L5401
2564  00a6               L7301:
2565                     ; 627   else if (UART3_IT == UART3_IT_LBDF)
2567  00a6 1e03          	ldw	x,(OFST+1,sp)
2568  00a8 a30346        	cpw	x,#838
2569  00ab 261c          	jrne	L7401
2570                     ; 630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2572  00ad c65247        	ld	a,21063
2573  00b0 1402          	and	a,(OFST+0,sp)
2574  00b2 6b02          	ld	(OFST+0,sp),a
2575                     ; 632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2577  00b4 c65247        	ld	a,21063
2578  00b7 1501          	bcp	a,(OFST-1,sp)
2579  00b9 270a          	jreq	L1501
2581  00bb 0d02          	tnz	(OFST+0,sp)
2582  00bd 2706          	jreq	L1501
2583                     ; 635       pendingbitstatus = SET;
2585  00bf a601          	ld	a,#1
2586  00c1 6b02          	ld	(OFST+0,sp),a
2588  00c3 2041          	jra	L5401
2589  00c5               L1501:
2590                     ; 640       pendingbitstatus = RESET;
2592  00c5 0f02          	clr	(OFST+0,sp)
2593  00c7 203d          	jra	L5401
2594  00c9               L7401:
2595                     ; 643   else if (UART3_IT == UART3_IT_LHDF)
2597  00c9 1e03          	ldw	x,(OFST+1,sp)
2598  00cb a30412        	cpw	x,#1042
2599  00ce 261c          	jrne	L7501
2600                     ; 646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2602  00d0 c65249        	ld	a,21065
2603  00d3 1402          	and	a,(OFST+0,sp)
2604  00d5 6b02          	ld	(OFST+0,sp),a
2605                     ; 648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2607  00d7 c65249        	ld	a,21065
2608  00da 1501          	bcp	a,(OFST-1,sp)
2609  00dc 270a          	jreq	L1601
2611  00de 0d02          	tnz	(OFST+0,sp)
2612  00e0 2706          	jreq	L1601
2613                     ; 651       pendingbitstatus = SET;
2615  00e2 a601          	ld	a,#1
2616  00e4 6b02          	ld	(OFST+0,sp),a
2618  00e6 201e          	jra	L5401
2619  00e8               L1601:
2620                     ; 656       pendingbitstatus = RESET;
2622  00e8 0f02          	clr	(OFST+0,sp)
2623  00ea 201a          	jra	L5401
2624  00ec               L7501:
2625                     ; 662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2627  00ec c65245        	ld	a,21061
2628  00ef 1402          	and	a,(OFST+0,sp)
2629  00f1 6b02          	ld	(OFST+0,sp),a
2630                     ; 664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2632  00f3 c65240        	ld	a,21056
2633  00f6 1501          	bcp	a,(OFST-1,sp)
2634  00f8 270a          	jreq	L7601
2636  00fa 0d02          	tnz	(OFST+0,sp)
2637  00fc 2706          	jreq	L7601
2638                     ; 667       pendingbitstatus = SET;
2640  00fe a601          	ld	a,#1
2641  0100 6b02          	ld	(OFST+0,sp),a
2643  0102 2002          	jra	L5401
2644  0104               L7601:
2645                     ; 672       pendingbitstatus = RESET;
2647  0104 0f02          	clr	(OFST+0,sp)
2648  0106               L5401:
2649                     ; 676   return  pendingbitstatus;
2651  0106 7b02          	ld	a,(OFST+0,sp)
2654  0108 5b04          	addw	sp,#4
2655  010a 81            	ret
2692                     ; 706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2692                     ; 707 {
2693                     .text:	section	.text,new
2694  0000               _UART3_ClearITPendingBit:
2696  0000 89            	pushw	x
2697       00000000      OFST:	set	0
2700                     ; 709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2702  0001 a30255        	cpw	x,#597
2703  0004 270a          	jreq	L442
2704  0006 a30412        	cpw	x,#1042
2705  0009 2705          	jreq	L442
2706  000b a30346        	cpw	x,#838
2707  000e 2603          	jrne	L242
2708  0010               L442:
2709  0010 4f            	clr	a
2710  0011 2010          	jra	L642
2711  0013               L242:
2712  0013 ae02c5        	ldw	x,#709
2713  0016 89            	pushw	x
2714  0017 ae0000        	ldw	x,#0
2715  001a 89            	pushw	x
2716  001b ae0008        	ldw	x,#L531
2717  001e cd0000        	call	_assert_failed
2719  0021 5b04          	addw	sp,#4
2720  0023               L642:
2721                     ; 712   if (UART3_IT == UART3_IT_RXNE)
2723  0023 1e01          	ldw	x,(OFST+1,sp)
2724  0025 a30255        	cpw	x,#597
2725  0028 2606          	jrne	L1111
2726                     ; 714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2728  002a 35df5240      	mov	21056,#223
2730  002e 2011          	jra	L3111
2731  0030               L1111:
2732                     ; 717   else if (UART3_IT == UART3_IT_LBDF)
2734  0030 1e01          	ldw	x,(OFST+1,sp)
2735  0032 a30346        	cpw	x,#838
2736  0035 2606          	jrne	L5111
2737                     ; 719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2739  0037 72195247      	bres	21063,#4
2741  003b 2004          	jra	L3111
2742  003d               L5111:
2743                     ; 724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2745  003d 72135249      	bres	21065,#1
2746  0041               L3111:
2747                     ; 726 }
2750  0041 85            	popw	x
2751  0042 81            	ret
2764                     	xdef	_UART3_ClearITPendingBit
2765                     	xdef	_UART3_GetITStatus
2766                     	xdef	_UART3_ClearFlag
2767                     	xdef	_UART3_GetFlagStatus
2768                     	xdef	_UART3_SetAddress
2769                     	xdef	_UART3_SendBreak
2770                     	xdef	_UART3_SendData9
2771                     	xdef	_UART3_SendData8
2772                     	xdef	_UART3_ReceiveData9
2773                     	xdef	_UART3_ReceiveData8
2774                     	xdef	_UART3_WakeUpConfig
2775                     	xdef	_UART3_ReceiverWakeUpCmd
2776                     	xdef	_UART3_LINCmd
2777                     	xdef	_UART3_LINConfig
2778                     	xdef	_UART3_LINBreakDetectionConfig
2779                     	xdef	_UART3_ITConfig
2780                     	xdef	_UART3_Cmd
2781                     	xdef	_UART3_Init
2782                     	xdef	_UART3_DeInit
2783                     	xref	_assert_failed
2784                     	xref	_CLK_GetClockFreq
2785                     	switch	.const
2786  0008               L531:
2787  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
2788  001a 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
2789  002c 72697665725c  	dc.b	"river\src\stm8s_ua"
2790  003e 7274332e6300  	dc.b	"rt3.c",0
2791                     	xref.b	c_lreg
2811                     	xref	c_lursh
2812                     	xref	c_lsub
2813                     	xref	c_smul
2814                     	xref	c_ludv
2815                     	xref	c_rtol
2816                     	xref	c_llsh
2817                     	xref	c_lcmp
2818                     	xref	c_ltor
2819                     	end
