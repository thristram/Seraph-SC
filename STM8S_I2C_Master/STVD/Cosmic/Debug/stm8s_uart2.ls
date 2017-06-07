   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 53 void UART2_DeInit(void)
  32                     ; 54 {
  34                     .text:	section	.text,new
  35  0000               _UART2_DeInit:
  39                     ; 57   (void) UART2->SR;
  41  0000 c65240        	ld	a,21056
  42  0003 97            	ld	xl,a
  43                     ; 58   (void)UART2->DR;
  45  0004 c65241        	ld	a,21057
  46  0007 97            	ld	xl,a
  47                     ; 60   UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  49  0008 725f5243      	clr	21059
  50                     ; 61   UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  52  000c 725f5242      	clr	21058
  53                     ; 63   UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  55  0010 725f5244      	clr	21060
  56                     ; 64   UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  58  0014 725f5245      	clr	21061
  59                     ; 65   UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  61  0018 725f5246      	clr	21062
  62                     ; 66   UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  64  001c 725f5247      	clr	21063
  65                     ; 67   UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  67  0020 725f5248      	clr	21064
  68                     ; 68   UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  70  0024 725f5249      	clr	21065
  71                     ; 69 }
  74  0028 81            	ret
 386                     .const:	section	.text
 387  0000               L21:
 388  0000 00098969      	dc.l	625001
 389  0004               L25:
 390  0004 00000064      	dc.l	100
 391                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 391                     ; 86 {
 392                     .text:	section	.text,new
 393  0000               _UART2_Init:
 395  0000 520e          	subw	sp,#14
 396       0000000e      OFST:	set	14
 399                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 401  0002 7b05          	ld	a,(OFST-9,sp)
 402  0004 97            	ld	xl,a
 405  0005 7b06          	ld	a,(OFST-8,sp)
 406  0007 97            	ld	xl,a
 407                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 409  0008 96            	ldw	x,sp
 410  0009 1c000b        	addw	x,#OFST-3
 411  000c cd0000        	call	c_ltor
 415  000f 96            	ldw	x,sp
 416  0010 1c0007        	addw	x,#OFST-7
 417  0013 cd0000        	call	c_ltor
 419                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 421  0016 96            	ldw	x,sp
 422  0017 1c0011        	addw	x,#OFST+3
 423  001a cd0000        	call	c_ltor
 425  001d ae0000        	ldw	x,#L21
 426  0020 cd0000        	call	c_lcmp
 428  0023 2403          	jruge	L01
 429  0025 4f            	clr	a
 430  0026 2010          	jra	L41
 431  0028               L01:
 432  0028 ae005b        	ldw	x,#91
 433  002b 89            	pushw	x
 434  002c ae0000        	ldw	x,#0
 435  002f 89            	pushw	x
 436  0030 ae0008        	ldw	x,#L171
 437  0033 cd0000        	call	_assert_failed
 439  0036 5b04          	addw	sp,#4
 440  0038               L41:
 441                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 443  0038 0d15          	tnz	(OFST+7,sp)
 444  003a 2706          	jreq	L02
 445  003c 7b15          	ld	a,(OFST+7,sp)
 446  003e a110          	cp	a,#16
 447  0040 2603          	jrne	L61
 448  0042               L02:
 449  0042 4f            	clr	a
 450  0043 2010          	jra	L22
 451  0045               L61:
 452  0045 ae005c        	ldw	x,#92
 453  0048 89            	pushw	x
 454  0049 ae0000        	ldw	x,#0
 455  004c 89            	pushw	x
 456  004d ae0008        	ldw	x,#L171
 457  0050 cd0000        	call	_assert_failed
 459  0053 5b04          	addw	sp,#4
 460  0055               L22:
 461                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 463  0055 0d16          	tnz	(OFST+8,sp)
 464  0057 2712          	jreq	L62
 465  0059 7b16          	ld	a,(OFST+8,sp)
 466  005b a110          	cp	a,#16
 467  005d 270c          	jreq	L62
 468  005f 7b16          	ld	a,(OFST+8,sp)
 469  0061 a120          	cp	a,#32
 470  0063 2706          	jreq	L62
 471  0065 7b16          	ld	a,(OFST+8,sp)
 472  0067 a130          	cp	a,#48
 473  0069 2603          	jrne	L42
 474  006b               L62:
 475  006b 4f            	clr	a
 476  006c 2010          	jra	L03
 477  006e               L42:
 478  006e ae005d        	ldw	x,#93
 479  0071 89            	pushw	x
 480  0072 ae0000        	ldw	x,#0
 481  0075 89            	pushw	x
 482  0076 ae0008        	ldw	x,#L171
 483  0079 cd0000        	call	_assert_failed
 485  007c 5b04          	addw	sp,#4
 486  007e               L03:
 487                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 489  007e 0d17          	tnz	(OFST+9,sp)
 490  0080 270c          	jreq	L43
 491  0082 7b17          	ld	a,(OFST+9,sp)
 492  0084 a104          	cp	a,#4
 493  0086 2706          	jreq	L43
 494  0088 7b17          	ld	a,(OFST+9,sp)
 495  008a a106          	cp	a,#6
 496  008c 2603          	jrne	L23
 497  008e               L43:
 498  008e 4f            	clr	a
 499  008f 2010          	jra	L63
 500  0091               L23:
 501  0091 ae005e        	ldw	x,#94
 502  0094 89            	pushw	x
 503  0095 ae0000        	ldw	x,#0
 504  0098 89            	pushw	x
 505  0099 ae0008        	ldw	x,#L171
 506  009c cd0000        	call	_assert_failed
 508  009f 5b04          	addw	sp,#4
 509  00a1               L63:
 510                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 512  00a1 7b19          	ld	a,(OFST+11,sp)
 513  00a3 a108          	cp	a,#8
 514  00a5 2730          	jreq	L24
 515  00a7 7b19          	ld	a,(OFST+11,sp)
 516  00a9 a140          	cp	a,#64
 517  00ab 272a          	jreq	L24
 518  00ad 7b19          	ld	a,(OFST+11,sp)
 519  00af a104          	cp	a,#4
 520  00b1 2724          	jreq	L24
 521  00b3 7b19          	ld	a,(OFST+11,sp)
 522  00b5 a180          	cp	a,#128
 523  00b7 271e          	jreq	L24
 524  00b9 7b19          	ld	a,(OFST+11,sp)
 525  00bb a10c          	cp	a,#12
 526  00bd 2718          	jreq	L24
 527  00bf 7b19          	ld	a,(OFST+11,sp)
 528  00c1 a10c          	cp	a,#12
 529  00c3 2712          	jreq	L24
 530  00c5 7b19          	ld	a,(OFST+11,sp)
 531  00c7 a144          	cp	a,#68
 532  00c9 270c          	jreq	L24
 533  00cb 7b19          	ld	a,(OFST+11,sp)
 534  00cd a1c0          	cp	a,#192
 535  00cf 2706          	jreq	L24
 536  00d1 7b19          	ld	a,(OFST+11,sp)
 537  00d3 a188          	cp	a,#136
 538  00d5 2603          	jrne	L04
 539  00d7               L24:
 540  00d7 4f            	clr	a
 541  00d8 2010          	jra	L44
 542  00da               L04:
 543  00da ae005f        	ldw	x,#95
 544  00dd 89            	pushw	x
 545  00de ae0000        	ldw	x,#0
 546  00e1 89            	pushw	x
 547  00e2 ae0008        	ldw	x,#L171
 548  00e5 cd0000        	call	_assert_failed
 550  00e8 5b04          	addw	sp,#4
 551  00ea               L44:
 552                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 554  00ea 7b18          	ld	a,(OFST+10,sp)
 555  00ec a488          	and	a,#136
 556  00ee a188          	cp	a,#136
 557  00f0 271b          	jreq	L64
 558  00f2 7b18          	ld	a,(OFST+10,sp)
 559  00f4 a444          	and	a,#68
 560  00f6 a144          	cp	a,#68
 561  00f8 2713          	jreq	L64
 562  00fa 7b18          	ld	a,(OFST+10,sp)
 563  00fc a422          	and	a,#34
 564  00fe a122          	cp	a,#34
 565  0100 270b          	jreq	L64
 566  0102 7b18          	ld	a,(OFST+10,sp)
 567  0104 a411          	and	a,#17
 568  0106 a111          	cp	a,#17
 569  0108 2703          	jreq	L64
 570  010a 4f            	clr	a
 571  010b 2010          	jra	L05
 572  010d               L64:
 573  010d ae0060        	ldw	x,#96
 574  0110 89            	pushw	x
 575  0111 ae0000        	ldw	x,#0
 576  0114 89            	pushw	x
 577  0115 ae0008        	ldw	x,#L171
 578  0118 cd0000        	call	_assert_failed
 580  011b 5b04          	addw	sp,#4
 581  011d               L05:
 582                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 584  011d 72195244      	bres	21060,#4
 585                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 587  0121 c65244        	ld	a,21060
 588  0124 1a15          	or	a,(OFST+7,sp)
 589  0126 c75244        	ld	21060,a
 590                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 592  0129 c65246        	ld	a,21062
 593  012c a4cf          	and	a,#207
 594  012e c75246        	ld	21062,a
 595                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 597  0131 c65246        	ld	a,21062
 598  0134 1a16          	or	a,(OFST+8,sp)
 599  0136 c75246        	ld	21062,a
 600                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 602  0139 c65244        	ld	a,21060
 603  013c a4f9          	and	a,#249
 604  013e c75244        	ld	21060,a
 605                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 607  0141 c65244        	ld	a,21060
 608  0144 1a17          	or	a,(OFST+9,sp)
 609  0146 c75244        	ld	21060,a
 610                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 612  0149 725f5242      	clr	21058
 613                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 615  014d c65243        	ld	a,21059
 616  0150 a40f          	and	a,#15
 617  0152 c75243        	ld	21059,a
 618                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 620  0155 c65243        	ld	a,21059
 621  0158 a4f0          	and	a,#240
 622  015a c75243        	ld	21059,a
 623                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 625  015d 96            	ldw	x,sp
 626  015e 1c0011        	addw	x,#OFST+3
 627  0161 cd0000        	call	c_ltor
 629  0164 a604          	ld	a,#4
 630  0166 cd0000        	call	c_llsh
 632  0169 96            	ldw	x,sp
 633  016a 1c0001        	addw	x,#OFST-13
 634  016d cd0000        	call	c_rtol
 636  0170 cd0000        	call	_CLK_GetClockFreq
 638  0173 96            	ldw	x,sp
 639  0174 1c0001        	addw	x,#OFST-13
 640  0177 cd0000        	call	c_ludv
 642  017a 96            	ldw	x,sp
 643  017b 1c000b        	addw	x,#OFST-3
 644  017e cd0000        	call	c_rtol
 646                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 648  0181 96            	ldw	x,sp
 649  0182 1c0011        	addw	x,#OFST+3
 650  0185 cd0000        	call	c_ltor
 652  0188 a604          	ld	a,#4
 653  018a cd0000        	call	c_llsh
 655  018d 96            	ldw	x,sp
 656  018e 1c0001        	addw	x,#OFST-13
 657  0191 cd0000        	call	c_rtol
 659  0194 cd0000        	call	_CLK_GetClockFreq
 661  0197 a664          	ld	a,#100
 662  0199 cd0000        	call	c_smul
 664  019c 96            	ldw	x,sp
 665  019d 1c0001        	addw	x,#OFST-13
 666  01a0 cd0000        	call	c_ludv
 668  01a3 96            	ldw	x,sp
 669  01a4 1c0007        	addw	x,#OFST-7
 670  01a7 cd0000        	call	c_rtol
 672                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 672                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 674  01aa 96            	ldw	x,sp
 675  01ab 1c000b        	addw	x,#OFST-3
 676  01ae cd0000        	call	c_ltor
 678  01b1 a664          	ld	a,#100
 679  01b3 cd0000        	call	c_smul
 681  01b6 96            	ldw	x,sp
 682  01b7 1c0001        	addw	x,#OFST-13
 683  01ba cd0000        	call	c_rtol
 685  01bd 96            	ldw	x,sp
 686  01be 1c0007        	addw	x,#OFST-7
 687  01c1 cd0000        	call	c_ltor
 689  01c4 96            	ldw	x,sp
 690  01c5 1c0001        	addw	x,#OFST-13
 691  01c8 cd0000        	call	c_lsub
 693  01cb a604          	ld	a,#4
 694  01cd cd0000        	call	c_llsh
 696  01d0 ae0004        	ldw	x,#L25
 697  01d3 cd0000        	call	c_ludv
 699  01d6 b603          	ld	a,c_lreg+3
 700  01d8 a40f          	and	a,#15
 701  01da 6b05          	ld	(OFST-9,sp),a
 702                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 704  01dc 96            	ldw	x,sp
 705  01dd 1c000b        	addw	x,#OFST-3
 706  01e0 cd0000        	call	c_ltor
 708  01e3 a604          	ld	a,#4
 709  01e5 cd0000        	call	c_lursh
 711  01e8 b603          	ld	a,c_lreg+3
 712  01ea a4f0          	and	a,#240
 713  01ec b703          	ld	c_lreg+3,a
 714  01ee 3f02          	clr	c_lreg+2
 715  01f0 3f01          	clr	c_lreg+1
 716  01f2 3f00          	clr	c_lreg
 717  01f4 b603          	ld	a,c_lreg+3
 718  01f6 6b06          	ld	(OFST-8,sp),a
 719                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 721  01f8 7b05          	ld	a,(OFST-9,sp)
 722  01fa 1a06          	or	a,(OFST-8,sp)
 723  01fc c75243        	ld	21059,a
 724                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 726  01ff 7b0e          	ld	a,(OFST+0,sp)
 727  0201 c75242        	ld	21058,a
 728                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 730  0204 c65245        	ld	a,21061
 731  0207 a4f3          	and	a,#243
 732  0209 c75245        	ld	21061,a
 733                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 735  020c c65246        	ld	a,21062
 736  020f a4f8          	and	a,#248
 737  0211 c75246        	ld	21062,a
 738                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 738                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 740  0214 7b18          	ld	a,(OFST+10,sp)
 741  0216 a407          	and	a,#7
 742  0218 ca5246        	or	a,21062
 743  021b c75246        	ld	21062,a
 744                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 746  021e 7b19          	ld	a,(OFST+11,sp)
 747  0220 a504          	bcp	a,#4
 748  0222 2706          	jreq	L371
 749                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 751  0224 72165245      	bset	21061,#3
 753  0228 2004          	jra	L571
 754  022a               L371:
 755                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 757  022a 72175245      	bres	21061,#3
 758  022e               L571:
 759                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 761  022e 7b19          	ld	a,(OFST+11,sp)
 762  0230 a508          	bcp	a,#8
 763  0232 2706          	jreq	L771
 764                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 766  0234 72145245      	bset	21061,#2
 768  0238 2004          	jra	L102
 769  023a               L771:
 770                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 772  023a 72155245      	bres	21061,#2
 773  023e               L102:
 774                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 776  023e 7b18          	ld	a,(OFST+10,sp)
 777  0240 a580          	bcp	a,#128
 778  0242 2706          	jreq	L302
 779                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 781  0244 72175246      	bres	21062,#3
 783  0248 200a          	jra	L502
 784  024a               L302:
 785                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 787  024a 7b18          	ld	a,(OFST+10,sp)
 788  024c a408          	and	a,#8
 789  024e ca5246        	or	a,21062
 790  0251 c75246        	ld	21062,a
 791  0254               L502:
 792                     ; 173 }
 795  0254 5b0e          	addw	sp,#14
 796  0256 81            	ret
 851                     ; 181 void UART2_Cmd(FunctionalState NewState)
 851                     ; 182 {
 852                     .text:	section	.text,new
 853  0000               _UART2_Cmd:
 857                     ; 183   if (NewState != DISABLE)
 859  0000 4d            	tnz	a
 860  0001 2706          	jreq	L532
 861                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 863  0003 721b5244      	bres	21060,#5
 865  0007 2004          	jra	L732
 866  0009               L532:
 867                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 869  0009 721a5244      	bset	21060,#5
 870  000d               L732:
 871                     ; 193 }
 874  000d 81            	ret
1003                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
1003                     ; 211 {
1004                     .text:	section	.text,new
1005  0000               _UART2_ITConfig:
1007  0000 89            	pushw	x
1008  0001 89            	pushw	x
1009       00000002      OFST:	set	2
1012                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
1014  0002 7b01          	ld	a,(OFST-1,sp)
1015  0004 97            	ld	xl,a
1018  0005 7b02          	ld	a,(OFST+0,sp)
1019  0007 97            	ld	xl,a
1020                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
1022  0008 1e03          	ldw	x,(OFST+1,sp)
1023  000a a30100        	cpw	x,#256
1024  000d 272a          	jreq	L26
1025  000f 1e03          	ldw	x,(OFST+1,sp)
1026  0011 a30277        	cpw	x,#631
1027  0014 2723          	jreq	L26
1028  0016 1e03          	ldw	x,(OFST+1,sp)
1029  0018 a30266        	cpw	x,#614
1030  001b 271c          	jreq	L26
1031  001d 1e03          	ldw	x,(OFST+1,sp)
1032  001f a30205        	cpw	x,#517
1033  0022 2715          	jreq	L26
1034  0024 1e03          	ldw	x,(OFST+1,sp)
1035  0026 a30244        	cpw	x,#580
1036  0029 270e          	jreq	L26
1037  002b 1e03          	ldw	x,(OFST+1,sp)
1038  002d a30412        	cpw	x,#1042
1039  0030 2707          	jreq	L26
1040  0032 1e03          	ldw	x,(OFST+1,sp)
1041  0034 a30346        	cpw	x,#838
1042  0037 2603          	jrne	L06
1043  0039               L26:
1044  0039 4f            	clr	a
1045  003a 2010          	jra	L46
1046  003c               L06:
1047  003c ae00d7        	ldw	x,#215
1048  003f 89            	pushw	x
1049  0040 ae0000        	ldw	x,#0
1050  0043 89            	pushw	x
1051  0044 ae0008        	ldw	x,#L171
1052  0047 cd0000        	call	_assert_failed
1054  004a 5b04          	addw	sp,#4
1055  004c               L46:
1056                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1058  004c 0d07          	tnz	(OFST+5,sp)
1059  004e 2706          	jreq	L07
1060  0050 7b07          	ld	a,(OFST+5,sp)
1061  0052 a101          	cp	a,#1
1062  0054 2603          	jrne	L66
1063  0056               L07:
1064  0056 4f            	clr	a
1065  0057 2010          	jra	L27
1066  0059               L66:
1067  0059 ae00d8        	ldw	x,#216
1068  005c 89            	pushw	x
1069  005d ae0000        	ldw	x,#0
1070  0060 89            	pushw	x
1071  0061 ae0008        	ldw	x,#L171
1072  0064 cd0000        	call	_assert_failed
1074  0067 5b04          	addw	sp,#4
1075  0069               L27:
1076                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
1078  0069 7b03          	ld	a,(OFST+1,sp)
1079  006b 6b01          	ld	(OFST-1,sp),a
1080                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
1082  006d 7b04          	ld	a,(OFST+2,sp)
1083  006f a40f          	and	a,#15
1084  0071 5f            	clrw	x
1085  0072 97            	ld	xl,a
1086  0073 a601          	ld	a,#1
1087  0075 5d            	tnzw	x
1088  0076 2704          	jreq	L47
1089  0078               L67:
1090  0078 48            	sll	a
1091  0079 5a            	decw	x
1092  007a 26fc          	jrne	L67
1093  007c               L47:
1094  007c 6b02          	ld	(OFST+0,sp),a
1095                     ; 224   if (NewState != DISABLE)
1097  007e 0d07          	tnz	(OFST+5,sp)
1098  0080 273a          	jreq	L513
1099                     ; 227     if (uartreg == 0x01)
1101  0082 7b01          	ld	a,(OFST-1,sp)
1102  0084 a101          	cp	a,#1
1103  0086 260a          	jrne	L713
1104                     ; 229       UART2->CR1 |= itpos;
1106  0088 c65244        	ld	a,21060
1107  008b 1a02          	or	a,(OFST+0,sp)
1108  008d c75244        	ld	21060,a
1110  0090 2066          	jra	L333
1111  0092               L713:
1112                     ; 231     else if (uartreg == 0x02)
1114  0092 7b01          	ld	a,(OFST-1,sp)
1115  0094 a102          	cp	a,#2
1116  0096 260a          	jrne	L323
1117                     ; 233       UART2->CR2 |= itpos;
1119  0098 c65245        	ld	a,21061
1120  009b 1a02          	or	a,(OFST+0,sp)
1121  009d c75245        	ld	21061,a
1123  00a0 2056          	jra	L333
1124  00a2               L323:
1125                     ; 235     else if (uartreg == 0x03)
1127  00a2 7b01          	ld	a,(OFST-1,sp)
1128  00a4 a103          	cp	a,#3
1129  00a6 260a          	jrne	L723
1130                     ; 237       UART2->CR4 |= itpos;
1132  00a8 c65247        	ld	a,21063
1133  00ab 1a02          	or	a,(OFST+0,sp)
1134  00ad c75247        	ld	21063,a
1136  00b0 2046          	jra	L333
1137  00b2               L723:
1138                     ; 241       UART2->CR6 |= itpos;
1140  00b2 c65249        	ld	a,21065
1141  00b5 1a02          	or	a,(OFST+0,sp)
1142  00b7 c75249        	ld	21065,a
1143  00ba 203c          	jra	L333
1144  00bc               L513:
1145                     ; 247     if (uartreg == 0x01)
1147  00bc 7b01          	ld	a,(OFST-1,sp)
1148  00be a101          	cp	a,#1
1149  00c0 260b          	jrne	L533
1150                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
1152  00c2 7b02          	ld	a,(OFST+0,sp)
1153  00c4 43            	cpl	a
1154  00c5 c45244        	and	a,21060
1155  00c8 c75244        	ld	21060,a
1157  00cb 202b          	jra	L333
1158  00cd               L533:
1159                     ; 251     else if (uartreg == 0x02)
1161  00cd 7b01          	ld	a,(OFST-1,sp)
1162  00cf a102          	cp	a,#2
1163  00d1 260b          	jrne	L143
1164                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
1166  00d3 7b02          	ld	a,(OFST+0,sp)
1167  00d5 43            	cpl	a
1168  00d6 c45245        	and	a,21061
1169  00d9 c75245        	ld	21061,a
1171  00dc 201a          	jra	L333
1172  00de               L143:
1173                     ; 255     else if (uartreg == 0x03)
1175  00de 7b01          	ld	a,(OFST-1,sp)
1176  00e0 a103          	cp	a,#3
1177  00e2 260b          	jrne	L543
1178                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
1180  00e4 7b02          	ld	a,(OFST+0,sp)
1181  00e6 43            	cpl	a
1182  00e7 c45247        	and	a,21063
1183  00ea c75247        	ld	21063,a
1185  00ed 2009          	jra	L333
1186  00ef               L543:
1187                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
1189  00ef 7b02          	ld	a,(OFST+0,sp)
1190  00f1 43            	cpl	a
1191  00f2 c45249        	and	a,21065
1192  00f5 c75249        	ld	21065,a
1193  00f8               L333:
1194                     ; 264 }
1197  00f8 5b04          	addw	sp,#4
1198  00fa 81            	ret
1256                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1256                     ; 273 {
1257                     .text:	section	.text,new
1258  0000               _UART2_IrDAConfig:
1260  0000 88            	push	a
1261       00000000      OFST:	set	0
1264                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1266  0001 a101          	cp	a,#1
1267  0003 2703          	jreq	L401
1268  0005 4d            	tnz	a
1269  0006 2603          	jrne	L201
1270  0008               L401:
1271  0008 4f            	clr	a
1272  0009 2010          	jra	L601
1273  000b               L201:
1274  000b ae0112        	ldw	x,#274
1275  000e 89            	pushw	x
1276  000f ae0000        	ldw	x,#0
1277  0012 89            	pushw	x
1278  0013 ae0008        	ldw	x,#L171
1279  0016 cd0000        	call	_assert_failed
1281  0019 5b04          	addw	sp,#4
1282  001b               L601:
1283                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1285  001b 0d01          	tnz	(OFST+1,sp)
1286  001d 2706          	jreq	L773
1287                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1289  001f 72145248      	bset	21064,#2
1291  0023 2004          	jra	L104
1292  0025               L773:
1293                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1295  0025 72155248      	bres	21064,#2
1296  0029               L104:
1297                     ; 284 }
1300  0029 84            	pop	a
1301  002a 81            	ret
1337                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1337                     ; 293 {
1338                     .text:	section	.text,new
1339  0000               _UART2_IrDACmd:
1341  0000 88            	push	a
1342       00000000      OFST:	set	0
1345                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1347  0001 4d            	tnz	a
1348  0002 2704          	jreq	L411
1349  0004 a101          	cp	a,#1
1350  0006 2603          	jrne	L211
1351  0008               L411:
1352  0008 4f            	clr	a
1353  0009 2010          	jra	L611
1354  000b               L211:
1355  000b ae0127        	ldw	x,#295
1356  000e 89            	pushw	x
1357  000f ae0000        	ldw	x,#0
1358  0012 89            	pushw	x
1359  0013 ae0008        	ldw	x,#L171
1360  0016 cd0000        	call	_assert_failed
1362  0019 5b04          	addw	sp,#4
1363  001b               L611:
1364                     ; 297   if (NewState != DISABLE)
1366  001b 0d01          	tnz	(OFST+1,sp)
1367  001d 2706          	jreq	L124
1368                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1370  001f 72125248      	bset	21064,#1
1372  0023 2004          	jra	L324
1373  0025               L124:
1374                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1376  0025 72135248      	bres	21064,#1
1377  0029               L324:
1378                     ; 307 }
1381  0029 84            	pop	a
1382  002a 81            	ret
1442                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1442                     ; 317 {
1443                     .text:	section	.text,new
1444  0000               _UART2_LINBreakDetectionConfig:
1446  0000 88            	push	a
1447       00000000      OFST:	set	0
1450                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1452  0001 4d            	tnz	a
1453  0002 2704          	jreq	L421
1454  0004 a101          	cp	a,#1
1455  0006 2603          	jrne	L221
1456  0008               L421:
1457  0008 4f            	clr	a
1458  0009 2010          	jra	L621
1459  000b               L221:
1460  000b ae013f        	ldw	x,#319
1461  000e 89            	pushw	x
1462  000f ae0000        	ldw	x,#0
1463  0012 89            	pushw	x
1464  0013 ae0008        	ldw	x,#L171
1465  0016 cd0000        	call	_assert_failed
1467  0019 5b04          	addw	sp,#4
1468  001b               L621:
1469                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1471  001b 0d01          	tnz	(OFST+1,sp)
1472  001d 2706          	jreq	L354
1473                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1475  001f 721a5247      	bset	21063,#5
1477  0023 2004          	jra	L554
1478  0025               L354:
1479                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1481  0025 721b5247      	bres	21063,#5
1482  0029               L554:
1483                     ; 329 }
1486  0029 84            	pop	a
1487  002a 81            	ret
1609                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1609                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1609                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1609                     ; 344 {
1610                     .text:	section	.text,new
1611  0000               _UART2_LINConfig:
1613  0000 89            	pushw	x
1614       00000000      OFST:	set	0
1617                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1619  0001 9e            	ld	a,xh
1620  0002 4d            	tnz	a
1621  0003 2705          	jreq	L431
1622  0005 9e            	ld	a,xh
1623  0006 a101          	cp	a,#1
1624  0008 2603          	jrne	L231
1625  000a               L431:
1626  000a 4f            	clr	a
1627  000b 2010          	jra	L631
1628  000d               L231:
1629  000d ae015a        	ldw	x,#346
1630  0010 89            	pushw	x
1631  0011 ae0000        	ldw	x,#0
1632  0014 89            	pushw	x
1633  0015 ae0008        	ldw	x,#L171
1634  0018 cd0000        	call	_assert_failed
1636  001b 5b04          	addw	sp,#4
1637  001d               L631:
1638                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1640  001d 7b02          	ld	a,(OFST+2,sp)
1641  001f a101          	cp	a,#1
1642  0021 2704          	jreq	L241
1643  0023 0d02          	tnz	(OFST+2,sp)
1644  0025 2603          	jrne	L041
1645  0027               L241:
1646  0027 4f            	clr	a
1647  0028 2010          	jra	L441
1648  002a               L041:
1649  002a ae015b        	ldw	x,#347
1650  002d 89            	pushw	x
1651  002e ae0000        	ldw	x,#0
1652  0031 89            	pushw	x
1653  0032 ae0008        	ldw	x,#L171
1654  0035 cd0000        	call	_assert_failed
1656  0038 5b04          	addw	sp,#4
1657  003a               L441:
1658                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1660  003a 0d05          	tnz	(OFST+5,sp)
1661  003c 2706          	jreq	L051
1662  003e 7b05          	ld	a,(OFST+5,sp)
1663  0040 a101          	cp	a,#1
1664  0042 2603          	jrne	L641
1665  0044               L051:
1666  0044 4f            	clr	a
1667  0045 2010          	jra	L251
1668  0047               L641:
1669  0047 ae015c        	ldw	x,#348
1670  004a 89            	pushw	x
1671  004b ae0000        	ldw	x,#0
1672  004e 89            	pushw	x
1673  004f ae0008        	ldw	x,#L171
1674  0052 cd0000        	call	_assert_failed
1676  0055 5b04          	addw	sp,#4
1677  0057               L251:
1678                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1680  0057 0d01          	tnz	(OFST+1,sp)
1681  0059 2706          	jreq	L535
1682                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1684  005b 721a5249      	bset	21065,#5
1686  005f 2004          	jra	L735
1687  0061               L535:
1688                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1690  0061 721b5249      	bres	21065,#5
1691  0065               L735:
1692                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1694  0065 0d02          	tnz	(OFST+2,sp)
1695  0067 2706          	jreq	L145
1696                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1698  0069 72185249      	bset	21065,#4
1700  006d 2004          	jra	L345
1701  006f               L145:
1702                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1704  006f 72195249      	bres	21065,#4
1705  0073               L345:
1706                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1708  0073 0d05          	tnz	(OFST+5,sp)
1709  0075 2706          	jreq	L545
1710                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1712  0077 721e5249      	bset	21065,#7
1714  007b 2004          	jra	L745
1715  007d               L545:
1716                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1718  007d 721f5249      	bres	21065,#7
1719  0081               L745:
1720                     ; 376 }
1723  0081 85            	popw	x
1724  0082 81            	ret
1760                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1760                     ; 385 {
1761                     .text:	section	.text,new
1762  0000               _UART2_LINCmd:
1764  0000 88            	push	a
1765       00000000      OFST:	set	0
1768                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1770  0001 4d            	tnz	a
1771  0002 2704          	jreq	L061
1772  0004 a101          	cp	a,#1
1773  0006 2603          	jrne	L651
1774  0008               L061:
1775  0008 4f            	clr	a
1776  0009 2010          	jra	L261
1777  000b               L651:
1778  000b ae0182        	ldw	x,#386
1779  000e 89            	pushw	x
1780  000f ae0000        	ldw	x,#0
1781  0012 89            	pushw	x
1782  0013 ae0008        	ldw	x,#L171
1783  0016 cd0000        	call	_assert_failed
1785  0019 5b04          	addw	sp,#4
1786  001b               L261:
1787                     ; 388   if (NewState != DISABLE)
1789  001b 0d01          	tnz	(OFST+1,sp)
1790  001d 2706          	jreq	L765
1791                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1793  001f 721c5246      	bset	21062,#6
1795  0023 2004          	jra	L175
1796  0025               L765:
1797                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1799  0025 721d5246      	bres	21062,#6
1800  0029               L175:
1801                     ; 398 }
1804  0029 84            	pop	a
1805  002a 81            	ret
1841                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1841                     ; 407 {
1842                     .text:	section	.text,new
1843  0000               _UART2_SmartCardCmd:
1845  0000 88            	push	a
1846       00000000      OFST:	set	0
1849                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1851  0001 4d            	tnz	a
1852  0002 2704          	jreq	L071
1853  0004 a101          	cp	a,#1
1854  0006 2603          	jrne	L661
1855  0008               L071:
1856  0008 4f            	clr	a
1857  0009 2010          	jra	L271
1858  000b               L661:
1859  000b ae0199        	ldw	x,#409
1860  000e 89            	pushw	x
1861  000f ae0000        	ldw	x,#0
1862  0012 89            	pushw	x
1863  0013 ae0008        	ldw	x,#L171
1864  0016 cd0000        	call	_assert_failed
1866  0019 5b04          	addw	sp,#4
1867  001b               L271:
1868                     ; 411   if (NewState != DISABLE)
1870  001b 0d01          	tnz	(OFST+1,sp)
1871  001d 2706          	jreq	L116
1872                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1874  001f 721a5248      	bset	21064,#5
1876  0023 2004          	jra	L316
1877  0025               L116:
1878                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1880  0025 721b5248      	bres	21064,#5
1881  0029               L316:
1882                     ; 421 }
1885  0029 84            	pop	a
1886  002a 81            	ret
1923                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1923                     ; 430 {
1924                     .text:	section	.text,new
1925  0000               _UART2_SmartCardNACKCmd:
1927  0000 88            	push	a
1928       00000000      OFST:	set	0
1931                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1933  0001 4d            	tnz	a
1934  0002 2704          	jreq	L002
1935  0004 a101          	cp	a,#1
1936  0006 2603          	jrne	L671
1937  0008               L002:
1938  0008 4f            	clr	a
1939  0009 2010          	jra	L202
1940  000b               L671:
1941  000b ae01b0        	ldw	x,#432
1942  000e 89            	pushw	x
1943  000f ae0000        	ldw	x,#0
1944  0012 89            	pushw	x
1945  0013 ae0008        	ldw	x,#L171
1946  0016 cd0000        	call	_assert_failed
1948  0019 5b04          	addw	sp,#4
1949  001b               L202:
1950                     ; 434   if (NewState != DISABLE)
1952  001b 0d01          	tnz	(OFST+1,sp)
1953  001d 2706          	jreq	L336
1954                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1956  001f 72185248      	bset	21064,#4
1958  0023 2004          	jra	L536
1959  0025               L336:
1960                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1962  0025 72195248      	bres	21064,#4
1963  0029               L536:
1964                     ; 444 }
1967  0029 84            	pop	a
1968  002a 81            	ret
2026                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
2026                     ; 453 {
2027                     .text:	section	.text,new
2028  0000               _UART2_WakeUpConfig:
2030  0000 88            	push	a
2031       00000000      OFST:	set	0
2034                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
2036  0001 4d            	tnz	a
2037  0002 2704          	jreq	L012
2038  0004 a108          	cp	a,#8
2039  0006 2603          	jrne	L602
2040  0008               L012:
2041  0008 4f            	clr	a
2042  0009 2010          	jra	L212
2043  000b               L602:
2044  000b ae01c6        	ldw	x,#454
2045  000e 89            	pushw	x
2046  000f ae0000        	ldw	x,#0
2047  0012 89            	pushw	x
2048  0013 ae0008        	ldw	x,#L171
2049  0016 cd0000        	call	_assert_failed
2051  0019 5b04          	addw	sp,#4
2052  001b               L212:
2053                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
2055  001b 72175244      	bres	21060,#3
2056                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
2058  001f c65244        	ld	a,21060
2059  0022 1a01          	or	a,(OFST+1,sp)
2060  0024 c75244        	ld	21060,a
2061                     ; 458 }
2064  0027 84            	pop	a
2065  0028 81            	ret
2102                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
2102                     ; 467 {
2103                     .text:	section	.text,new
2104  0000               _UART2_ReceiverWakeUpCmd:
2106  0000 88            	push	a
2107       00000000      OFST:	set	0
2110                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2112  0001 4d            	tnz	a
2113  0002 2704          	jreq	L022
2114  0004 a101          	cp	a,#1
2115  0006 2603          	jrne	L612
2116  0008               L022:
2117  0008 4f            	clr	a
2118  0009 2010          	jra	L222
2119  000b               L612:
2120  000b ae01d4        	ldw	x,#468
2121  000e 89            	pushw	x
2122  000f ae0000        	ldw	x,#0
2123  0012 89            	pushw	x
2124  0013 ae0008        	ldw	x,#L171
2125  0016 cd0000        	call	_assert_failed
2127  0019 5b04          	addw	sp,#4
2128  001b               L222:
2129                     ; 470   if (NewState != DISABLE)
2131  001b 0d01          	tnz	(OFST+1,sp)
2132  001d 2706          	jreq	L307
2133                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
2135  001f 72125245      	bset	21061,#1
2137  0023 2004          	jra	L507
2138  0025               L307:
2139                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
2141  0025 72135245      	bres	21061,#1
2142  0029               L507:
2143                     ; 480 }
2146  0029 84            	pop	a
2147  002a 81            	ret
2170                     ; 487 uint8_t UART2_ReceiveData8(void)
2170                     ; 488 {
2171                     .text:	section	.text,new
2172  0000               _UART2_ReceiveData8:
2176                     ; 489   return ((uint8_t)UART2->DR);
2178  0000 c65241        	ld	a,21057
2181  0003 81            	ret
2213                     ; 497 uint16_t UART2_ReceiveData9(void)
2213                     ; 498 {
2214                     .text:	section	.text,new
2215  0000               _UART2_ReceiveData9:
2217  0000 89            	pushw	x
2218       00000002      OFST:	set	2
2221                     ; 499   uint16_t temp = 0;
2223  0001 5f            	clrw	x
2224  0002 1f01          	ldw	(OFST-1,sp),x
2225                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
2227  0004 c65244        	ld	a,21060
2228  0007 5f            	clrw	x
2229  0008 a480          	and	a,#128
2230  000a 5f            	clrw	x
2231  000b 02            	rlwa	x,a
2232  000c 58            	sllw	x
2233  000d 1f01          	ldw	(OFST-1,sp),x
2234                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
2236  000f c65241        	ld	a,21057
2237  0012 5f            	clrw	x
2238  0013 97            	ld	xl,a
2239  0014 01            	rrwa	x,a
2240  0015 1a02          	or	a,(OFST+0,sp)
2241  0017 01            	rrwa	x,a
2242  0018 1a01          	or	a,(OFST-1,sp)
2243  001a 01            	rrwa	x,a
2244  001b 01            	rrwa	x,a
2245  001c a4ff          	and	a,#255
2246  001e 01            	rrwa	x,a
2247  001f a401          	and	a,#1
2248  0021 01            	rrwa	x,a
2251  0022 5b02          	addw	sp,#2
2252  0024 81            	ret
2284                     ; 511 void UART2_SendData8(uint8_t Data)
2284                     ; 512 {
2285                     .text:	section	.text,new
2286  0000               _UART2_SendData8:
2290                     ; 514   UART2->DR = Data;
2292  0000 c75241        	ld	21057,a
2293                     ; 515 }
2296  0003 81            	ret
2328                     ; 522 void UART2_SendData9(uint16_t Data)
2328                     ; 523 {
2329                     .text:	section	.text,new
2330  0000               _UART2_SendData9:
2332  0000 89            	pushw	x
2333       00000000      OFST:	set	0
2336                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
2338  0001 721d5244      	bres	21060,#6
2339                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
2341  0005 54            	srlw	x
2342  0006 54            	srlw	x
2343  0007 9f            	ld	a,xl
2344  0008 a440          	and	a,#64
2345  000a ca5244        	or	a,21060
2346  000d c75244        	ld	21060,a
2347                     ; 531   UART2->DR   = (uint8_t)(Data);                    
2349  0010 7b02          	ld	a,(OFST+2,sp)
2350  0012 c75241        	ld	21057,a
2351                     ; 532 }
2354  0015 85            	popw	x
2355  0016 81            	ret
2378                     ; 539 void UART2_SendBreak(void)
2378                     ; 540 {
2379                     .text:	section	.text,new
2380  0000               _UART2_SendBreak:
2384                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
2386  0000 72105245      	bset	21061,#0
2387                     ; 542 }
2390  0004 81            	ret
2423                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2423                     ; 550 {
2424                     .text:	section	.text,new
2425  0000               _UART2_SetAddress:
2427  0000 88            	push	a
2428       00000000      OFST:	set	0
2431                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2433  0001 a110          	cp	a,#16
2434  0003 2403          	jruge	L042
2435  0005 4f            	clr	a
2436  0006 2010          	jra	L242
2437  0008               L042:
2438  0008 ae0228        	ldw	x,#552
2439  000b 89            	pushw	x
2440  000c ae0000        	ldw	x,#0
2441  000f 89            	pushw	x
2442  0010 ae0008        	ldw	x,#L171
2443  0013 cd0000        	call	_assert_failed
2445  0016 5b04          	addw	sp,#4
2446  0018               L242:
2447                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2449  0018 c65247        	ld	a,21063
2450  001b a4f0          	and	a,#240
2451  001d c75247        	ld	21063,a
2452                     ; 557   UART2->CR4 |= UART2_Address;
2454  0020 c65247        	ld	a,21063
2455  0023 1a01          	or	a,(OFST+1,sp)
2456  0025 c75247        	ld	21063,a
2457                     ; 558 }
2460  0028 84            	pop	a
2461  0029 81            	ret
2493                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2493                     ; 567 {
2494                     .text:	section	.text,new
2495  0000               _UART2_SetGuardTime:
2499                     ; 569   UART2->GTR = UART2_GuardTime;
2501  0000 c7524a        	ld	21066,a
2502                     ; 570 }
2505  0003 81            	ret
2537                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2537                     ; 595 {
2538                     .text:	section	.text,new
2539  0000               _UART2_SetPrescaler:
2543                     ; 597   UART2->PSCR = UART2_Prescaler;
2545  0000 c7524b        	ld	21067,a
2546                     ; 598 }
2549  0003 81            	ret
2707                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2707                     ; 607 {
2708                     .text:	section	.text,new
2709  0000               _UART2_GetFlagStatus:
2711  0000 89            	pushw	x
2712  0001 88            	push	a
2713       00000001      OFST:	set	1
2716                     ; 608   FlagStatus status = RESET;
2718  0002 0f01          	clr	(OFST+0,sp)
2719                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2721  0004 a30080        	cpw	x,#128
2722  0007 2737          	jreq	L452
2723  0009 a30040        	cpw	x,#64
2724  000c 2732          	jreq	L452
2725  000e a30020        	cpw	x,#32
2726  0011 272d          	jreq	L452
2727  0013 a30010        	cpw	x,#16
2728  0016 2728          	jreq	L452
2729  0018 a30008        	cpw	x,#8
2730  001b 2723          	jreq	L452
2731  001d a30004        	cpw	x,#4
2732  0020 271e          	jreq	L452
2733  0022 a30002        	cpw	x,#2
2734  0025 2719          	jreq	L452
2735  0027 a30001        	cpw	x,#1
2736  002a 2714          	jreq	L452
2737  002c a30101        	cpw	x,#257
2738  002f 270f          	jreq	L452
2739  0031 a30301        	cpw	x,#769
2740  0034 270a          	jreq	L452
2741  0036 a30302        	cpw	x,#770
2742  0039 2705          	jreq	L452
2743  003b a30210        	cpw	x,#528
2744  003e 2603          	jrne	L252
2745  0040               L452:
2746  0040 4f            	clr	a
2747  0041 2010          	jra	L652
2748  0043               L252:
2749  0043 ae0263        	ldw	x,#611
2750  0046 89            	pushw	x
2751  0047 ae0000        	ldw	x,#0
2752  004a 89            	pushw	x
2753  004b ae0008        	ldw	x,#L171
2754  004e cd0000        	call	_assert_failed
2756  0051 5b04          	addw	sp,#4
2757  0053               L652:
2758                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2760  0053 1e02          	ldw	x,(OFST+1,sp)
2761  0055 a30210        	cpw	x,#528
2762  0058 2611          	jrne	L5211
2763                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2765  005a c65247        	ld	a,21063
2766  005d 1503          	bcp	a,(OFST+2,sp)
2767  005f 2706          	jreq	L7211
2768                     ; 619       status = SET;
2770  0061 a601          	ld	a,#1
2771  0063 6b01          	ld	(OFST+0,sp),a
2773  0065 2039          	jra	L3311
2774  0067               L7211:
2775                     ; 624       status = RESET;
2777  0067 0f01          	clr	(OFST+0,sp)
2778  0069 2035          	jra	L3311
2779  006b               L5211:
2780                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2782  006b 1e02          	ldw	x,(OFST+1,sp)
2783  006d a30101        	cpw	x,#257
2784  0070 2611          	jrne	L5311
2785                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2787  0072 c65245        	ld	a,21061
2788  0075 1503          	bcp	a,(OFST+2,sp)
2789  0077 2706          	jreq	L7311
2790                     ; 632       status = SET;
2792  0079 a601          	ld	a,#1
2793  007b 6b01          	ld	(OFST+0,sp),a
2795  007d 2021          	jra	L3311
2796  007f               L7311:
2797                     ; 637       status = RESET;
2799  007f 0f01          	clr	(OFST+0,sp)
2800  0081 201d          	jra	L3311
2801  0083               L5311:
2802                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2804  0083 1e02          	ldw	x,(OFST+1,sp)
2805  0085 a30302        	cpw	x,#770
2806  0088 2707          	jreq	L7411
2808  008a 1e02          	ldw	x,(OFST+1,sp)
2809  008c a30301        	cpw	x,#769
2810  008f 2614          	jrne	L5411
2811  0091               L7411:
2812                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2814  0091 c65249        	ld	a,21065
2815  0094 1503          	bcp	a,(OFST+2,sp)
2816  0096 2706          	jreq	L1511
2817                     ; 645       status = SET;
2819  0098 a601          	ld	a,#1
2820  009a 6b01          	ld	(OFST+0,sp),a
2822  009c 2002          	jra	L3311
2823  009e               L1511:
2824                     ; 650       status = RESET;
2826  009e 0f01          	clr	(OFST+0,sp)
2827  00a0               L3311:
2828                     ; 668   return  status;
2830  00a0 7b01          	ld	a,(OFST+0,sp)
2833  00a2 5b03          	addw	sp,#3
2834  00a4 81            	ret
2835  00a5               L5411:
2836                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2838  00a5 c65240        	ld	a,21056
2839  00a8 1503          	bcp	a,(OFST+2,sp)
2840  00aa 2706          	jreq	L7511
2841                     ; 658       status = SET;
2843  00ac a601          	ld	a,#1
2844  00ae 6b01          	ld	(OFST+0,sp),a
2846  00b0 20ee          	jra	L3311
2847  00b2               L7511:
2848                     ; 663       status = RESET;
2850  00b2 0f01          	clr	(OFST+0,sp)
2851  00b4 20ea          	jra	L3311
2887                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2887                     ; 700 {
2888                     .text:	section	.text,new
2889  0000               _UART2_ClearFlag:
2891  0000 89            	pushw	x
2892       00000000      OFST:	set	0
2895                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2897  0001 a30020        	cpw	x,#32
2898  0004 270f          	jreq	L462
2899  0006 a30302        	cpw	x,#770
2900  0009 270a          	jreq	L462
2901  000b a30301        	cpw	x,#769
2902  000e 2705          	jreq	L462
2903  0010 a30210        	cpw	x,#528
2904  0013 2603          	jrne	L262
2905  0015               L462:
2906  0015 4f            	clr	a
2907  0016 2010          	jra	L662
2908  0018               L262:
2909  0018 ae02bd        	ldw	x,#701
2910  001b 89            	pushw	x
2911  001c ae0000        	ldw	x,#0
2912  001f 89            	pushw	x
2913  0020 ae0008        	ldw	x,#L171
2914  0023 cd0000        	call	_assert_failed
2916  0026 5b04          	addw	sp,#4
2917  0028               L662:
2918                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2920  0028 1e01          	ldw	x,(OFST+1,sp)
2921  002a a30020        	cpw	x,#32
2922  002d 2606          	jrne	L1021
2923                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2925  002f 35df5240      	mov	21056,#223
2927  0033 201e          	jra	L3021
2928  0035               L1021:
2929                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2931  0035 1e01          	ldw	x,(OFST+1,sp)
2932  0037 a30210        	cpw	x,#528
2933  003a 2606          	jrne	L5021
2934                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2936  003c 72195247      	bres	21063,#4
2938  0040 2011          	jra	L3021
2939  0042               L5021:
2940                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2942  0042 1e01          	ldw	x,(OFST+1,sp)
2943  0044 a30302        	cpw	x,#770
2944  0047 2606          	jrne	L1121
2945                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2947  0049 72135249      	bres	21065,#1
2949  004d 2004          	jra	L3021
2950  004f               L1121:
2951                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2953  004f 72115249      	bres	21065,#0
2954  0053               L3021:
2955                     ; 723 }
2958  0053 85            	popw	x
2959  0054 81            	ret
3034                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
3034                     ; 739 {
3035                     .text:	section	.text,new
3036  0000               _UART2_GetITStatus:
3038  0000 89            	pushw	x
3039  0001 89            	pushw	x
3040       00000002      OFST:	set	2
3043                     ; 740   ITStatus pendingbitstatus = RESET;
3045  0002 7b02          	ld	a,(OFST+0,sp)
3046  0004 97            	ld	xl,a
3047                     ; 741   uint8_t itpos = 0;
3049  0005 7b01          	ld	a,(OFST-1,sp)
3050  0007 97            	ld	xl,a
3051                     ; 742   uint8_t itmask1 = 0;
3053  0008 7b02          	ld	a,(OFST+0,sp)
3054  000a 97            	ld	xl,a
3055                     ; 743   uint8_t itmask2 = 0;
3057  000b 7b02          	ld	a,(OFST+0,sp)
3058  000d 97            	ld	xl,a
3059                     ; 744   uint8_t enablestatus = 0;
3061  000e 7b02          	ld	a,(OFST+0,sp)
3062  0010 97            	ld	xl,a
3063                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
3065  0011 1e03          	ldw	x,(OFST+1,sp)
3066  0013 a30277        	cpw	x,#631
3067  0016 2731          	jreq	L472
3068  0018 1e03          	ldw	x,(OFST+1,sp)
3069  001a a30266        	cpw	x,#614
3070  001d 272a          	jreq	L472
3071  001f 1e03          	ldw	x,(OFST+1,sp)
3072  0021 a30255        	cpw	x,#597
3073  0024 2723          	jreq	L472
3074  0026 1e03          	ldw	x,(OFST+1,sp)
3075  0028 a30244        	cpw	x,#580
3076  002b 271c          	jreq	L472
3077  002d 1e03          	ldw	x,(OFST+1,sp)
3078  002f a30235        	cpw	x,#565
3079  0032 2715          	jreq	L472
3080  0034 1e03          	ldw	x,(OFST+1,sp)
3081  0036 a30346        	cpw	x,#838
3082  0039 270e          	jreq	L472
3083  003b 1e03          	ldw	x,(OFST+1,sp)
3084  003d a30412        	cpw	x,#1042
3085  0040 2707          	jreq	L472
3086  0042 1e03          	ldw	x,(OFST+1,sp)
3087  0044 a30100        	cpw	x,#256
3088  0047 2603          	jrne	L272
3089  0049               L472:
3090  0049 4f            	clr	a
3091  004a 2010          	jra	L672
3092  004c               L272:
3093  004c ae02eb        	ldw	x,#747
3094  004f 89            	pushw	x
3095  0050 ae0000        	ldw	x,#0
3096  0053 89            	pushw	x
3097  0054 ae0008        	ldw	x,#L171
3098  0057 cd0000        	call	_assert_failed
3100  005a 5b04          	addw	sp,#4
3101  005c               L672:
3102                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
3104  005c 7b04          	ld	a,(OFST+2,sp)
3105  005e a40f          	and	a,#15
3106  0060 5f            	clrw	x
3107  0061 97            	ld	xl,a
3108  0062 a601          	ld	a,#1
3109  0064 5d            	tnzw	x
3110  0065 2704          	jreq	L003
3111  0067               L203:
3112  0067 48            	sll	a
3113  0068 5a            	decw	x
3114  0069 26fc          	jrne	L203
3115  006b               L003:
3116  006b 6b01          	ld	(OFST-1,sp),a
3117                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
3119  006d 7b04          	ld	a,(OFST+2,sp)
3120  006f 4e            	swap	a
3121  0070 a40f          	and	a,#15
3122  0072 6b02          	ld	(OFST+0,sp),a
3123                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
3125  0074 7b02          	ld	a,(OFST+0,sp)
3126  0076 5f            	clrw	x
3127  0077 97            	ld	xl,a
3128  0078 a601          	ld	a,#1
3129  007a 5d            	tnzw	x
3130  007b 2704          	jreq	L403
3131  007d               L603:
3132  007d 48            	sll	a
3133  007e 5a            	decw	x
3134  007f 26fc          	jrne	L603
3135  0081               L403:
3136  0081 6b02          	ld	(OFST+0,sp),a
3137                     ; 757   if (UART2_IT == UART2_IT_PE)
3139  0083 1e03          	ldw	x,(OFST+1,sp)
3140  0085 a30100        	cpw	x,#256
3141  0088 261c          	jrne	L7421
3142                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
3144  008a c65244        	ld	a,21060
3145  008d 1402          	and	a,(OFST+0,sp)
3146  008f 6b02          	ld	(OFST+0,sp),a
3147                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3149  0091 c65240        	ld	a,21056
3150  0094 1501          	bcp	a,(OFST-1,sp)
3151  0096 270a          	jreq	L1521
3153  0098 0d02          	tnz	(OFST+0,sp)
3154  009a 2706          	jreq	L1521
3155                     ; 766       pendingbitstatus = SET;
3157  009c a601          	ld	a,#1
3158  009e 6b02          	ld	(OFST+0,sp),a
3160  00a0 2064          	jra	L5521
3161  00a2               L1521:
3162                     ; 771       pendingbitstatus = RESET;
3164  00a2 0f02          	clr	(OFST+0,sp)
3165  00a4 2060          	jra	L5521
3166  00a6               L7421:
3167                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
3169  00a6 1e03          	ldw	x,(OFST+1,sp)
3170  00a8 a30346        	cpw	x,#838
3171  00ab 261c          	jrne	L7521
3172                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
3174  00ad c65247        	ld	a,21063
3175  00b0 1402          	and	a,(OFST+0,sp)
3176  00b2 6b02          	ld	(OFST+0,sp),a
3177                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
3179  00b4 c65247        	ld	a,21063
3180  00b7 1501          	bcp	a,(OFST-1,sp)
3181  00b9 270a          	jreq	L1621
3183  00bb 0d02          	tnz	(OFST+0,sp)
3184  00bd 2706          	jreq	L1621
3185                     ; 782       pendingbitstatus = SET;
3187  00bf a601          	ld	a,#1
3188  00c1 6b02          	ld	(OFST+0,sp),a
3190  00c3 2041          	jra	L5521
3191  00c5               L1621:
3192                     ; 787       pendingbitstatus = RESET;
3194  00c5 0f02          	clr	(OFST+0,sp)
3195  00c7 203d          	jra	L5521
3196  00c9               L7521:
3197                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
3199  00c9 1e03          	ldw	x,(OFST+1,sp)
3200  00cb a30412        	cpw	x,#1042
3201  00ce 261c          	jrne	L7621
3202                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
3204  00d0 c65249        	ld	a,21065
3205  00d3 1402          	and	a,(OFST+0,sp)
3206  00d5 6b02          	ld	(OFST+0,sp),a
3207                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
3209  00d7 c65249        	ld	a,21065
3210  00da 1501          	bcp	a,(OFST-1,sp)
3211  00dc 270a          	jreq	L1721
3213  00de 0d02          	tnz	(OFST+0,sp)
3214  00e0 2706          	jreq	L1721
3215                     ; 798       pendingbitstatus = SET;
3217  00e2 a601          	ld	a,#1
3218  00e4 6b02          	ld	(OFST+0,sp),a
3220  00e6 201e          	jra	L5521
3221  00e8               L1721:
3222                     ; 803       pendingbitstatus = RESET;
3224  00e8 0f02          	clr	(OFST+0,sp)
3225  00ea 201a          	jra	L5521
3226  00ec               L7621:
3227                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
3229  00ec c65245        	ld	a,21061
3230  00ef 1402          	and	a,(OFST+0,sp)
3231  00f1 6b02          	ld	(OFST+0,sp),a
3232                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3234  00f3 c65240        	ld	a,21056
3235  00f6 1501          	bcp	a,(OFST-1,sp)
3236  00f8 270a          	jreq	L7721
3238  00fa 0d02          	tnz	(OFST+0,sp)
3239  00fc 2706          	jreq	L7721
3240                     ; 814       pendingbitstatus = SET;
3242  00fe a601          	ld	a,#1
3243  0100 6b02          	ld	(OFST+0,sp),a
3245  0102 2002          	jra	L5521
3246  0104               L7721:
3247                     ; 819       pendingbitstatus = RESET;
3249  0104 0f02          	clr	(OFST+0,sp)
3250  0106               L5521:
3251                     ; 823   return  pendingbitstatus;
3253  0106 7b02          	ld	a,(OFST+0,sp)
3256  0108 5b04          	addw	sp,#4
3257  010a 81            	ret
3294                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
3294                     ; 853 {
3295                     .text:	section	.text,new
3296  0000               _UART2_ClearITPendingBit:
3298  0000 89            	pushw	x
3299       00000000      OFST:	set	0
3302                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
3304  0001 a30255        	cpw	x,#597
3305  0004 270a          	jreq	L413
3306  0006 a30412        	cpw	x,#1042
3307  0009 2705          	jreq	L413
3308  000b a30346        	cpw	x,#838
3309  000e 2603          	jrne	L213
3310  0010               L413:
3311  0010 4f            	clr	a
3312  0011 2010          	jra	L613
3313  0013               L213:
3314  0013 ae0356        	ldw	x,#854
3315  0016 89            	pushw	x
3316  0017 ae0000        	ldw	x,#0
3317  001a 89            	pushw	x
3318  001b ae0008        	ldw	x,#L171
3319  001e cd0000        	call	_assert_failed
3321  0021 5b04          	addw	sp,#4
3322  0023               L613:
3323                     ; 857   if (UART2_IT == UART2_IT_RXNE)
3325  0023 1e01          	ldw	x,(OFST+1,sp)
3326  0025 a30255        	cpw	x,#597
3327  0028 2606          	jrne	L1231
3328                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
3330  002a 35df5240      	mov	21056,#223
3332  002e 2011          	jra	L3231
3333  0030               L1231:
3334                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
3336  0030 1e01          	ldw	x,(OFST+1,sp)
3337  0032 a30346        	cpw	x,#838
3338  0035 2606          	jrne	L5231
3339                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
3341  0037 72195247      	bres	21063,#4
3343  003b 2004          	jra	L3231
3344  003d               L5231:
3345                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
3347  003d 72135249      	bres	21065,#1
3348  0041               L3231:
3349                     ; 871 }
3352  0041 85            	popw	x
3353  0042 81            	ret
3366                     	xdef	_UART2_ClearITPendingBit
3367                     	xdef	_UART2_GetITStatus
3368                     	xdef	_UART2_ClearFlag
3369                     	xdef	_UART2_GetFlagStatus
3370                     	xdef	_UART2_SetPrescaler
3371                     	xdef	_UART2_SetGuardTime
3372                     	xdef	_UART2_SetAddress
3373                     	xdef	_UART2_SendBreak
3374                     	xdef	_UART2_SendData9
3375                     	xdef	_UART2_SendData8
3376                     	xdef	_UART2_ReceiveData9
3377                     	xdef	_UART2_ReceiveData8
3378                     	xdef	_UART2_ReceiverWakeUpCmd
3379                     	xdef	_UART2_WakeUpConfig
3380                     	xdef	_UART2_SmartCardNACKCmd
3381                     	xdef	_UART2_SmartCardCmd
3382                     	xdef	_UART2_LINCmd
3383                     	xdef	_UART2_LINConfig
3384                     	xdef	_UART2_LINBreakDetectionConfig
3385                     	xdef	_UART2_IrDACmd
3386                     	xdef	_UART2_IrDAConfig
3387                     	xdef	_UART2_ITConfig
3388                     	xdef	_UART2_Cmd
3389                     	xdef	_UART2_Init
3390                     	xdef	_UART2_DeInit
3391                     	xref	_assert_failed
3392                     	xref	_CLK_GetClockFreq
3393                     	switch	.const
3394  0008               L171:
3395  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3396  001a 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3397  002c 72697665725c  	dc.b	"river\src\stm8s_ua"
3398  003e 7274322e6300  	dc.b	"rt2.c",0
3399                     	xref.b	c_lreg
3419                     	xref	c_lursh
3420                     	xref	c_lsub
3421                     	xref	c_smul
3422                     	xref	c_ludv
3423                     	xref	c_rtol
3424                     	xref	c_llsh
3425                     	xref	c_lcmp
3426                     	xref	c_ltor
3427                     	end
