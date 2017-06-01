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
 396                     .const:	section	.text
 397  0000               L21:
 398  0000 00098969      	dc.l	625001
 399  0004               L25:
 400  0004 00000064      	dc.l	100
 401                     ; 85 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 401                     ; 86 {
 402                     .text:	section	.text,new
 403  0000               _UART2_Init:
 405  0000 520e          	subw	sp,#14
 406       0000000e      OFST:	set	14
 409                     ; 87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
 411  0002 7b05          	ld	a,(OFST-9,sp)
 412  0004 97            	ld	xl,a
 415  0005 7b06          	ld	a,(OFST-8,sp)
 416  0007 97            	ld	xl,a
 417                     ; 88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 419  0008 96            	ldw	x,sp
 420  0009 1c000b        	addw	x,#OFST-3
 421  000c cd0000        	call	c_ltor
 425  000f 96            	ldw	x,sp
 426  0010 1c0007        	addw	x,#OFST-7
 427  0013 cd0000        	call	c_ltor
 429                     ; 91   assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 431  0016 96            	ldw	x,sp
 432  0017 1c0011        	addw	x,#OFST+3
 433  001a cd0000        	call	c_ltor
 435  001d ae0000        	ldw	x,#L21
 436  0020 cd0000        	call	c_lcmp
 438  0023 2403          	jruge	L01
 439  0025 4f            	clr	a
 440  0026 2010          	jra	L41
 441  0028               L01:
 442  0028 ae005b        	ldw	x,#91
 443  002b 89            	pushw	x
 444  002c ae0000        	ldw	x,#0
 445  002f 89            	pushw	x
 446  0030 ae0008        	ldw	x,#L302
 447  0033 cd0000        	call	_assert_failed
 449  0036 5b04          	addw	sp,#4
 450  0038               L41:
 451                     ; 92   assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 453  0038 0d15          	tnz	(OFST+7,sp)
 454  003a 2706          	jreq	L02
 455  003c 7b15          	ld	a,(OFST+7,sp)
 456  003e a110          	cp	a,#16
 457  0040 2603          	jrne	L61
 458  0042               L02:
 459  0042 4f            	clr	a
 460  0043 2010          	jra	L22
 461  0045               L61:
 462  0045 ae005c        	ldw	x,#92
 463  0048 89            	pushw	x
 464  0049 ae0000        	ldw	x,#0
 465  004c 89            	pushw	x
 466  004d ae0008        	ldw	x,#L302
 467  0050 cd0000        	call	_assert_failed
 469  0053 5b04          	addw	sp,#4
 470  0055               L22:
 471                     ; 93   assert_param(IS_UART2_STOPBITS_OK(StopBits));
 473  0055 0d16          	tnz	(OFST+8,sp)
 474  0057 2712          	jreq	L62
 475  0059 7b16          	ld	a,(OFST+8,sp)
 476  005b a110          	cp	a,#16
 477  005d 270c          	jreq	L62
 478  005f 7b16          	ld	a,(OFST+8,sp)
 479  0061 a120          	cp	a,#32
 480  0063 2706          	jreq	L62
 481  0065 7b16          	ld	a,(OFST+8,sp)
 482  0067 a130          	cp	a,#48
 483  0069 2603          	jrne	L42
 484  006b               L62:
 485  006b 4f            	clr	a
 486  006c 2010          	jra	L03
 487  006e               L42:
 488  006e ae005d        	ldw	x,#93
 489  0071 89            	pushw	x
 490  0072 ae0000        	ldw	x,#0
 491  0075 89            	pushw	x
 492  0076 ae0008        	ldw	x,#L302
 493  0079 cd0000        	call	_assert_failed
 495  007c 5b04          	addw	sp,#4
 496  007e               L03:
 497                     ; 94   assert_param(IS_UART2_PARITY_OK(Parity));
 499  007e 0d17          	tnz	(OFST+9,sp)
 500  0080 270c          	jreq	L43
 501  0082 7b17          	ld	a,(OFST+9,sp)
 502  0084 a104          	cp	a,#4
 503  0086 2706          	jreq	L43
 504  0088 7b17          	ld	a,(OFST+9,sp)
 505  008a a106          	cp	a,#6
 506  008c 2603          	jrne	L23
 507  008e               L43:
 508  008e 4f            	clr	a
 509  008f 2010          	jra	L63
 510  0091               L23:
 511  0091 ae005e        	ldw	x,#94
 512  0094 89            	pushw	x
 513  0095 ae0000        	ldw	x,#0
 514  0098 89            	pushw	x
 515  0099 ae0008        	ldw	x,#L302
 516  009c cd0000        	call	_assert_failed
 518  009f 5b04          	addw	sp,#4
 519  00a1               L63:
 520                     ; 95   assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 522  00a1 7b19          	ld	a,(OFST+11,sp)
 523  00a3 a108          	cp	a,#8
 524  00a5 2730          	jreq	L24
 525  00a7 7b19          	ld	a,(OFST+11,sp)
 526  00a9 a140          	cp	a,#64
 527  00ab 272a          	jreq	L24
 528  00ad 7b19          	ld	a,(OFST+11,sp)
 529  00af a104          	cp	a,#4
 530  00b1 2724          	jreq	L24
 531  00b3 7b19          	ld	a,(OFST+11,sp)
 532  00b5 a180          	cp	a,#128
 533  00b7 271e          	jreq	L24
 534  00b9 7b19          	ld	a,(OFST+11,sp)
 535  00bb a10c          	cp	a,#12
 536  00bd 2718          	jreq	L24
 537  00bf 7b19          	ld	a,(OFST+11,sp)
 538  00c1 a10c          	cp	a,#12
 539  00c3 2712          	jreq	L24
 540  00c5 7b19          	ld	a,(OFST+11,sp)
 541  00c7 a144          	cp	a,#68
 542  00c9 270c          	jreq	L24
 543  00cb 7b19          	ld	a,(OFST+11,sp)
 544  00cd a1c0          	cp	a,#192
 545  00cf 2706          	jreq	L24
 546  00d1 7b19          	ld	a,(OFST+11,sp)
 547  00d3 a188          	cp	a,#136
 548  00d5 2603          	jrne	L04
 549  00d7               L24:
 550  00d7 4f            	clr	a
 551  00d8 2010          	jra	L44
 552  00da               L04:
 553  00da ae005f        	ldw	x,#95
 554  00dd 89            	pushw	x
 555  00de ae0000        	ldw	x,#0
 556  00e1 89            	pushw	x
 557  00e2 ae0008        	ldw	x,#L302
 558  00e5 cd0000        	call	_assert_failed
 560  00e8 5b04          	addw	sp,#4
 561  00ea               L44:
 562                     ; 96   assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 564  00ea 7b18          	ld	a,(OFST+10,sp)
 565  00ec a488          	and	a,#136
 566  00ee a188          	cp	a,#136
 567  00f0 271b          	jreq	L64
 568  00f2 7b18          	ld	a,(OFST+10,sp)
 569  00f4 a444          	and	a,#68
 570  00f6 a144          	cp	a,#68
 571  00f8 2713          	jreq	L64
 572  00fa 7b18          	ld	a,(OFST+10,sp)
 573  00fc a422          	and	a,#34
 574  00fe a122          	cp	a,#34
 575  0100 270b          	jreq	L64
 576  0102 7b18          	ld	a,(OFST+10,sp)
 577  0104 a411          	and	a,#17
 578  0106 a111          	cp	a,#17
 579  0108 2703          	jreq	L64
 580  010a 4f            	clr	a
 581  010b 2010          	jra	L05
 582  010d               L64:
 583  010d ae0060        	ldw	x,#96
 584  0110 89            	pushw	x
 585  0111 ae0000        	ldw	x,#0
 586  0114 89            	pushw	x
 587  0115 ae0008        	ldw	x,#L302
 588  0118 cd0000        	call	_assert_failed
 590  011b 5b04          	addw	sp,#4
 591  011d               L05:
 592                     ; 99   UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 594  011d 72195244      	bres	21060,#4
 595                     ; 101   UART2->CR1 |= (uint8_t)WordLength; 
 597  0121 c65244        	ld	a,21060
 598  0124 1a15          	or	a,(OFST+7,sp)
 599  0126 c75244        	ld	21060,a
 600                     ; 104   UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 602  0129 c65246        	ld	a,21062
 603  012c a4cf          	and	a,#207
 604  012e c75246        	ld	21062,a
 605                     ; 106   UART2->CR3 |= (uint8_t)StopBits; 
 607  0131 c65246        	ld	a,21062
 608  0134 1a16          	or	a,(OFST+8,sp)
 609  0136 c75246        	ld	21062,a
 610                     ; 109   UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 612  0139 c65244        	ld	a,21060
 613  013c a4f9          	and	a,#249
 614  013e c75244        	ld	21060,a
 615                     ; 111   UART2->CR1 |= (uint8_t)Parity;
 617  0141 c65244        	ld	a,21060
 618  0144 1a17          	or	a,(OFST+9,sp)
 619  0146 c75244        	ld	21060,a
 620                     ; 114   UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 622  0149 725f5242      	clr	21058
 623                     ; 116   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 625  014d c65243        	ld	a,21059
 626  0150 a40f          	and	a,#15
 627  0152 c75243        	ld	21059,a
 628                     ; 118   UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 630  0155 c65243        	ld	a,21059
 631  0158 a4f0          	and	a,#240
 632  015a c75243        	ld	21059,a
 633                     ; 121   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 635  015d 96            	ldw	x,sp
 636  015e 1c0011        	addw	x,#OFST+3
 637  0161 cd0000        	call	c_ltor
 639  0164 a604          	ld	a,#4
 640  0166 cd0000        	call	c_llsh
 642  0169 96            	ldw	x,sp
 643  016a 1c0001        	addw	x,#OFST-13
 644  016d cd0000        	call	c_rtol
 646  0170 cd0000        	call	_CLK_GetClockFreq
 648  0173 96            	ldw	x,sp
 649  0174 1c0001        	addw	x,#OFST-13
 650  0177 cd0000        	call	c_ludv
 652  017a 96            	ldw	x,sp
 653  017b 1c000b        	addw	x,#OFST-3
 654  017e cd0000        	call	c_rtol
 656                     ; 122   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 658  0181 96            	ldw	x,sp
 659  0182 1c0011        	addw	x,#OFST+3
 660  0185 cd0000        	call	c_ltor
 662  0188 a604          	ld	a,#4
 663  018a cd0000        	call	c_llsh
 665  018d 96            	ldw	x,sp
 666  018e 1c0001        	addw	x,#OFST-13
 667  0191 cd0000        	call	c_rtol
 669  0194 cd0000        	call	_CLK_GetClockFreq
 671  0197 a664          	ld	a,#100
 672  0199 cd0000        	call	c_smul
 674  019c 96            	ldw	x,sp
 675  019d 1c0001        	addw	x,#OFST-13
 676  01a0 cd0000        	call	c_ludv
 678  01a3 96            	ldw	x,sp
 679  01a4 1c0007        	addw	x,#OFST-7
 680  01a7 cd0000        	call	c_rtol
 682                     ; 126   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 682                     ; 127                                 << 4) / 100) & (uint8_t)0x0F); 
 684  01aa 96            	ldw	x,sp
 685  01ab 1c000b        	addw	x,#OFST-3
 686  01ae cd0000        	call	c_ltor
 688  01b1 a664          	ld	a,#100
 689  01b3 cd0000        	call	c_smul
 691  01b6 96            	ldw	x,sp
 692  01b7 1c0001        	addw	x,#OFST-13
 693  01ba cd0000        	call	c_rtol
 695  01bd 96            	ldw	x,sp
 696  01be 1c0007        	addw	x,#OFST-7
 697  01c1 cd0000        	call	c_ltor
 699  01c4 96            	ldw	x,sp
 700  01c5 1c0001        	addw	x,#OFST-13
 701  01c8 cd0000        	call	c_lsub
 703  01cb a604          	ld	a,#4
 704  01cd cd0000        	call	c_llsh
 706  01d0 ae0004        	ldw	x,#L25
 707  01d3 cd0000        	call	c_ludv
 709  01d6 b603          	ld	a,c_lreg+3
 710  01d8 a40f          	and	a,#15
 711  01da 6b05          	ld	(OFST-9,sp),a
 712                     ; 128   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 714  01dc 96            	ldw	x,sp
 715  01dd 1c000b        	addw	x,#OFST-3
 716  01e0 cd0000        	call	c_ltor
 718  01e3 a604          	ld	a,#4
 719  01e5 cd0000        	call	c_lursh
 721  01e8 b603          	ld	a,c_lreg+3
 722  01ea a4f0          	and	a,#240
 723  01ec b703          	ld	c_lreg+3,a
 724  01ee 3f02          	clr	c_lreg+2
 725  01f0 3f01          	clr	c_lreg+1
 726  01f2 3f00          	clr	c_lreg
 727  01f4 b603          	ld	a,c_lreg+3
 728  01f6 6b06          	ld	(OFST-8,sp),a
 729                     ; 130   UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 731  01f8 7b05          	ld	a,(OFST-9,sp)
 732  01fa 1a06          	or	a,(OFST-8,sp)
 733  01fc c75243        	ld	21059,a
 734                     ; 132   UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 736  01ff 7b0e          	ld	a,(OFST+0,sp)
 737  0201 c75242        	ld	21058,a
 738                     ; 135   UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 740  0204 c65245        	ld	a,21061
 741  0207 a4f3          	and	a,#243
 742  0209 c75245        	ld	21061,a
 743                     ; 137   UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 745  020c c65246        	ld	a,21062
 746  020f a4f8          	and	a,#248
 747  0211 c75246        	ld	21062,a
 748                     ; 139   UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 748                     ; 140     UART2_CR3_CPHA | UART2_CR3_LBCL));
 750  0214 7b18          	ld	a,(OFST+10,sp)
 751  0216 a407          	and	a,#7
 752  0218 ca5246        	or	a,21062
 753  021b c75246        	ld	21062,a
 754                     ; 142   if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 756  021e 7b19          	ld	a,(OFST+11,sp)
 757  0220 a504          	bcp	a,#4
 758  0222 2706          	jreq	L502
 759                     ; 145     UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 761  0224 72165245      	bset	21061,#3
 763  0228 2004          	jra	L702
 764  022a               L502:
 765                     ; 150     UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 767  022a 72175245      	bres	21061,#3
 768  022e               L702:
 769                     ; 152   if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 771  022e 7b19          	ld	a,(OFST+11,sp)
 772  0230 a508          	bcp	a,#8
 773  0232 2706          	jreq	L112
 774                     ; 155     UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 776  0234 72145245      	bset	21061,#2
 778  0238 2004          	jra	L312
 779  023a               L112:
 780                     ; 160     UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 782  023a 72155245      	bres	21061,#2
 783  023e               L312:
 784                     ; 164   if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 786  023e 7b18          	ld	a,(OFST+10,sp)
 787  0240 a580          	bcp	a,#128
 788  0242 2706          	jreq	L512
 789                     ; 167     UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 791  0244 72175246      	bres	21062,#3
 793  0248 200a          	jra	L712
 794  024a               L512:
 795                     ; 171     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 797  024a 7b18          	ld	a,(OFST+10,sp)
 798  024c a408          	and	a,#8
 799  024e ca5246        	or	a,21062
 800  0251 c75246        	ld	21062,a
 801  0254               L712:
 802                     ; 173 }
 805  0254 5b0e          	addw	sp,#14
 806  0256 81            	ret
 861                     ; 181 void UART2_Cmd(FunctionalState NewState)
 861                     ; 182 {
 862                     .text:	section	.text,new
 863  0000               _UART2_Cmd:
 867                     ; 183   if (NewState != DISABLE)
 869  0000 4d            	tnz	a
 870  0001 2706          	jreq	L742
 871                     ; 186     UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 873  0003 721b5244      	bres	21060,#5
 875  0007 2004          	jra	L152
 876  0009               L742:
 877                     ; 191     UART2->CR1 |= UART2_CR1_UARTD; 
 879  0009 721a5244      	bset	21060,#5
 880  000d               L152:
 881                     ; 193 }
 884  000d 81            	ret
1017                     ; 210 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
1017                     ; 211 {
1018                     .text:	section	.text,new
1019  0000               _UART2_ITConfig:
1021  0000 89            	pushw	x
1022  0001 89            	pushw	x
1023       00000002      OFST:	set	2
1026                     ; 212   uint8_t uartreg = 0, itpos = 0x00;
1028  0002 7b01          	ld	a,(OFST-1,sp)
1029  0004 97            	ld	xl,a
1032  0005 7b02          	ld	a,(OFST+0,sp)
1033  0007 97            	ld	xl,a
1034                     ; 215   assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
1036  0008 1e03          	ldw	x,(OFST+1,sp)
1037  000a a30100        	cpw	x,#256
1038  000d 272a          	jreq	L26
1039  000f 1e03          	ldw	x,(OFST+1,sp)
1040  0011 a30277        	cpw	x,#631
1041  0014 2723          	jreq	L26
1042  0016 1e03          	ldw	x,(OFST+1,sp)
1043  0018 a30266        	cpw	x,#614
1044  001b 271c          	jreq	L26
1045  001d 1e03          	ldw	x,(OFST+1,sp)
1046  001f a30205        	cpw	x,#517
1047  0022 2715          	jreq	L26
1048  0024 1e03          	ldw	x,(OFST+1,sp)
1049  0026 a30244        	cpw	x,#580
1050  0029 270e          	jreq	L26
1051  002b 1e03          	ldw	x,(OFST+1,sp)
1052  002d a30412        	cpw	x,#1042
1053  0030 2707          	jreq	L26
1054  0032 1e03          	ldw	x,(OFST+1,sp)
1055  0034 a30346        	cpw	x,#838
1056  0037 2603          	jrne	L06
1057  0039               L26:
1058  0039 4f            	clr	a
1059  003a 2010          	jra	L46
1060  003c               L06:
1061  003c ae00d7        	ldw	x,#215
1062  003f 89            	pushw	x
1063  0040 ae0000        	ldw	x,#0
1064  0043 89            	pushw	x
1065  0044 ae0008        	ldw	x,#L302
1066  0047 cd0000        	call	_assert_failed
1068  004a 5b04          	addw	sp,#4
1069  004c               L46:
1070                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1072  004c 0d07          	tnz	(OFST+5,sp)
1073  004e 2706          	jreq	L07
1074  0050 7b07          	ld	a,(OFST+5,sp)
1075  0052 a101          	cp	a,#1
1076  0054 2603          	jrne	L66
1077  0056               L07:
1078  0056 4f            	clr	a
1079  0057 2010          	jra	L27
1080  0059               L66:
1081  0059 ae00d8        	ldw	x,#216
1082  005c 89            	pushw	x
1083  005d ae0000        	ldw	x,#0
1084  0060 89            	pushw	x
1085  0061 ae0008        	ldw	x,#L302
1086  0064 cd0000        	call	_assert_failed
1088  0067 5b04          	addw	sp,#4
1089  0069               L27:
1090                     ; 219   uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
1092  0069 7b03          	ld	a,(OFST+1,sp)
1093  006b 6b01          	ld	(OFST-1,sp),a
1094                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
1096  006d 7b04          	ld	a,(OFST+2,sp)
1097  006f a40f          	and	a,#15
1098  0071 5f            	clrw	x
1099  0072 97            	ld	xl,a
1100  0073 a601          	ld	a,#1
1101  0075 5d            	tnzw	x
1102  0076 2704          	jreq	L47
1103  0078               L67:
1104  0078 48            	sll	a
1105  0079 5a            	decw	x
1106  007a 26fc          	jrne	L67
1107  007c               L47:
1108  007c 6b02          	ld	(OFST+0,sp),a
1109                     ; 224   if (NewState != DISABLE)
1111  007e 0d07          	tnz	(OFST+5,sp)
1112  0080 273a          	jreq	L333
1113                     ; 227     if (uartreg == 0x01)
1115  0082 7b01          	ld	a,(OFST-1,sp)
1116  0084 a101          	cp	a,#1
1117  0086 260a          	jrne	L533
1118                     ; 229       UART2->CR1 |= itpos;
1120  0088 c65244        	ld	a,21060
1121  008b 1a02          	or	a,(OFST+0,sp)
1122  008d c75244        	ld	21060,a
1124  0090 2066          	jra	L153
1125  0092               L533:
1126                     ; 231     else if (uartreg == 0x02)
1128  0092 7b01          	ld	a,(OFST-1,sp)
1129  0094 a102          	cp	a,#2
1130  0096 260a          	jrne	L143
1131                     ; 233       UART2->CR2 |= itpos;
1133  0098 c65245        	ld	a,21061
1134  009b 1a02          	or	a,(OFST+0,sp)
1135  009d c75245        	ld	21061,a
1137  00a0 2056          	jra	L153
1138  00a2               L143:
1139                     ; 235     else if (uartreg == 0x03)
1141  00a2 7b01          	ld	a,(OFST-1,sp)
1142  00a4 a103          	cp	a,#3
1143  00a6 260a          	jrne	L543
1144                     ; 237       UART2->CR4 |= itpos;
1146  00a8 c65247        	ld	a,21063
1147  00ab 1a02          	or	a,(OFST+0,sp)
1148  00ad c75247        	ld	21063,a
1150  00b0 2046          	jra	L153
1151  00b2               L543:
1152                     ; 241       UART2->CR6 |= itpos;
1154  00b2 c65249        	ld	a,21065
1155  00b5 1a02          	or	a,(OFST+0,sp)
1156  00b7 c75249        	ld	21065,a
1157  00ba 203c          	jra	L153
1158  00bc               L333:
1159                     ; 247     if (uartreg == 0x01)
1161  00bc 7b01          	ld	a,(OFST-1,sp)
1162  00be a101          	cp	a,#1
1163  00c0 260b          	jrne	L353
1164                     ; 249       UART2->CR1 &= (uint8_t)(~itpos);
1166  00c2 7b02          	ld	a,(OFST+0,sp)
1167  00c4 43            	cpl	a
1168  00c5 c45244        	and	a,21060
1169  00c8 c75244        	ld	21060,a
1171  00cb 202b          	jra	L153
1172  00cd               L353:
1173                     ; 251     else if (uartreg == 0x02)
1175  00cd 7b01          	ld	a,(OFST-1,sp)
1176  00cf a102          	cp	a,#2
1177  00d1 260b          	jrne	L753
1178                     ; 253       UART2->CR2 &= (uint8_t)(~itpos);
1180  00d3 7b02          	ld	a,(OFST+0,sp)
1181  00d5 43            	cpl	a
1182  00d6 c45245        	and	a,21061
1183  00d9 c75245        	ld	21061,a
1185  00dc 201a          	jra	L153
1186  00de               L753:
1187                     ; 255     else if (uartreg == 0x03)
1189  00de 7b01          	ld	a,(OFST-1,sp)
1190  00e0 a103          	cp	a,#3
1191  00e2 260b          	jrne	L363
1192                     ; 257       UART2->CR4 &= (uint8_t)(~itpos);
1194  00e4 7b02          	ld	a,(OFST+0,sp)
1195  00e6 43            	cpl	a
1196  00e7 c45247        	and	a,21063
1197  00ea c75247        	ld	21063,a
1199  00ed 2009          	jra	L153
1200  00ef               L363:
1201                     ; 261       UART2->CR6 &= (uint8_t)(~itpos);
1203  00ef 7b02          	ld	a,(OFST+0,sp)
1204  00f1 43            	cpl	a
1205  00f2 c45249        	and	a,21065
1206  00f5 c75249        	ld	21065,a
1207  00f8               L153:
1208                     ; 264 }
1211  00f8 5b04          	addw	sp,#4
1212  00fa 81            	ret
1270                     ; 272 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1270                     ; 273 {
1271                     .text:	section	.text,new
1272  0000               _UART2_IrDAConfig:
1274  0000 88            	push	a
1275       00000000      OFST:	set	0
1278                     ; 274   assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1280  0001 a101          	cp	a,#1
1281  0003 2703          	jreq	L401
1282  0005 4d            	tnz	a
1283  0006 2603          	jrne	L201
1284  0008               L401:
1285  0008 4f            	clr	a
1286  0009 2010          	jra	L601
1287  000b               L201:
1288  000b ae0112        	ldw	x,#274
1289  000e 89            	pushw	x
1290  000f ae0000        	ldw	x,#0
1291  0012 89            	pushw	x
1292  0013 ae0008        	ldw	x,#L302
1293  0016 cd0000        	call	_assert_failed
1295  0019 5b04          	addw	sp,#4
1296  001b               L601:
1297                     ; 276   if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1299  001b 0d01          	tnz	(OFST+1,sp)
1300  001d 2706          	jreq	L514
1301                     ; 278     UART2->CR5 |= UART2_CR5_IRLP;
1303  001f 72145248      	bset	21064,#2
1305  0023 2004          	jra	L714
1306  0025               L514:
1307                     ; 282     UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1309  0025 72155248      	bres	21064,#2
1310  0029               L714:
1311                     ; 284 }
1314  0029 84            	pop	a
1315  002a 81            	ret
1351                     ; 292 void UART2_IrDACmd(FunctionalState NewState)
1351                     ; 293 {
1352                     .text:	section	.text,new
1353  0000               _UART2_IrDACmd:
1355  0000 88            	push	a
1356       00000000      OFST:	set	0
1359                     ; 295   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1361  0001 4d            	tnz	a
1362  0002 2704          	jreq	L411
1363  0004 a101          	cp	a,#1
1364  0006 2603          	jrne	L211
1365  0008               L411:
1366  0008 4f            	clr	a
1367  0009 2010          	jra	L611
1368  000b               L211:
1369  000b ae0127        	ldw	x,#295
1370  000e 89            	pushw	x
1371  000f ae0000        	ldw	x,#0
1372  0012 89            	pushw	x
1373  0013 ae0008        	ldw	x,#L302
1374  0016 cd0000        	call	_assert_failed
1376  0019 5b04          	addw	sp,#4
1377  001b               L611:
1378                     ; 297   if (NewState != DISABLE)
1380  001b 0d01          	tnz	(OFST+1,sp)
1381  001d 2706          	jreq	L734
1382                     ; 300     UART2->CR5 |= UART2_CR5_IREN;
1384  001f 72125248      	bset	21064,#1
1386  0023 2004          	jra	L144
1387  0025               L734:
1388                     ; 305     UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1390  0025 72135248      	bres	21064,#1
1391  0029               L144:
1392                     ; 307 }
1395  0029 84            	pop	a
1396  002a 81            	ret
1456                     ; 316 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1456                     ; 317 {
1457                     .text:	section	.text,new
1458  0000               _UART2_LINBreakDetectionConfig:
1460  0000 88            	push	a
1461       00000000      OFST:	set	0
1464                     ; 319   assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1466  0001 4d            	tnz	a
1467  0002 2704          	jreq	L421
1468  0004 a101          	cp	a,#1
1469  0006 2603          	jrne	L221
1470  0008               L421:
1471  0008 4f            	clr	a
1472  0009 2010          	jra	L621
1473  000b               L221:
1474  000b ae013f        	ldw	x,#319
1475  000e 89            	pushw	x
1476  000f ae0000        	ldw	x,#0
1477  0012 89            	pushw	x
1478  0013 ae0008        	ldw	x,#L302
1479  0016 cd0000        	call	_assert_failed
1481  0019 5b04          	addw	sp,#4
1482  001b               L621:
1483                     ; 321   if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1485  001b 0d01          	tnz	(OFST+1,sp)
1486  001d 2706          	jreq	L174
1487                     ; 323     UART2->CR4 |= UART2_CR4_LBDL;
1489  001f 721a5247      	bset	21063,#5
1491  0023 2004          	jra	L374
1492  0025               L174:
1493                     ; 327     UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1495  0025 721b5247      	bres	21063,#5
1496  0029               L374:
1497                     ; 329 }
1500  0029 84            	pop	a
1501  002a 81            	ret
1623                     ; 341 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1623                     ; 342                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1623                     ; 343                      UART2_LinDivUp_TypeDef UART2_DivUp)
1623                     ; 344 {
1624                     .text:	section	.text,new
1625  0000               _UART2_LINConfig:
1627  0000 89            	pushw	x
1628       00000000      OFST:	set	0
1631                     ; 346   assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1633  0001 9e            	ld	a,xh
1634  0002 4d            	tnz	a
1635  0003 2705          	jreq	L431
1636  0005 9e            	ld	a,xh
1637  0006 a101          	cp	a,#1
1638  0008 2603          	jrne	L231
1639  000a               L431:
1640  000a 4f            	clr	a
1641  000b 2010          	jra	L631
1642  000d               L231:
1643  000d ae015a        	ldw	x,#346
1644  0010 89            	pushw	x
1645  0011 ae0000        	ldw	x,#0
1646  0014 89            	pushw	x
1647  0015 ae0008        	ldw	x,#L302
1648  0018 cd0000        	call	_assert_failed
1650  001b 5b04          	addw	sp,#4
1651  001d               L631:
1652                     ; 347   assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1654  001d 7b02          	ld	a,(OFST+2,sp)
1655  001f a101          	cp	a,#1
1656  0021 2704          	jreq	L241
1657  0023 0d02          	tnz	(OFST+2,sp)
1658  0025 2603          	jrne	L041
1659  0027               L241:
1660  0027 4f            	clr	a
1661  0028 2010          	jra	L441
1662  002a               L041:
1663  002a ae015b        	ldw	x,#347
1664  002d 89            	pushw	x
1665  002e ae0000        	ldw	x,#0
1666  0031 89            	pushw	x
1667  0032 ae0008        	ldw	x,#L302
1668  0035 cd0000        	call	_assert_failed
1670  0038 5b04          	addw	sp,#4
1671  003a               L441:
1672                     ; 348   assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1674  003a 0d05          	tnz	(OFST+5,sp)
1675  003c 2706          	jreq	L051
1676  003e 7b05          	ld	a,(OFST+5,sp)
1677  0040 a101          	cp	a,#1
1678  0042 2603          	jrne	L641
1679  0044               L051:
1680  0044 4f            	clr	a
1681  0045 2010          	jra	L251
1682  0047               L641:
1683  0047 ae015c        	ldw	x,#348
1684  004a 89            	pushw	x
1685  004b ae0000        	ldw	x,#0
1686  004e 89            	pushw	x
1687  004f ae0008        	ldw	x,#L302
1688  0052 cd0000        	call	_assert_failed
1690  0055 5b04          	addw	sp,#4
1691  0057               L251:
1692                     ; 350   if (UART2_Mode != UART2_LIN_MODE_MASTER)
1694  0057 0d01          	tnz	(OFST+1,sp)
1695  0059 2706          	jreq	L355
1696                     ; 352     UART2->CR6 |=  UART2_CR6_LSLV;
1698  005b 721a5249      	bset	21065,#5
1700  005f 2004          	jra	L555
1701  0061               L355:
1702                     ; 356     UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1704  0061 721b5249      	bres	21065,#5
1705  0065               L555:
1706                     ; 359   if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1708  0065 0d02          	tnz	(OFST+2,sp)
1709  0067 2706          	jreq	L755
1710                     ; 361     UART2->CR6 |=  UART2_CR6_LASE ;
1712  0069 72185249      	bset	21065,#4
1714  006d 2004          	jra	L165
1715  006f               L755:
1716                     ; 365     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1718  006f 72195249      	bres	21065,#4
1719  0073               L165:
1720                     ; 368   if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1722  0073 0d05          	tnz	(OFST+5,sp)
1723  0075 2706          	jreq	L365
1724                     ; 370     UART2->CR6 |=  UART2_CR6_LDUM;
1726  0077 721e5249      	bset	21065,#7
1728  007b 2004          	jra	L565
1729  007d               L365:
1730                     ; 374     UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1732  007d 721f5249      	bres	21065,#7
1733  0081               L565:
1734                     ; 376 }
1737  0081 85            	popw	x
1738  0082 81            	ret
1774                     ; 384 void UART2_LINCmd(FunctionalState NewState)
1774                     ; 385 {
1775                     .text:	section	.text,new
1776  0000               _UART2_LINCmd:
1778  0000 88            	push	a
1779       00000000      OFST:	set	0
1782                     ; 386   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1784  0001 4d            	tnz	a
1785  0002 2704          	jreq	L061
1786  0004 a101          	cp	a,#1
1787  0006 2603          	jrne	L651
1788  0008               L061:
1789  0008 4f            	clr	a
1790  0009 2010          	jra	L261
1791  000b               L651:
1792  000b ae0182        	ldw	x,#386
1793  000e 89            	pushw	x
1794  000f ae0000        	ldw	x,#0
1795  0012 89            	pushw	x
1796  0013 ae0008        	ldw	x,#L302
1797  0016 cd0000        	call	_assert_failed
1799  0019 5b04          	addw	sp,#4
1800  001b               L261:
1801                     ; 388   if (NewState != DISABLE)
1803  001b 0d01          	tnz	(OFST+1,sp)
1804  001d 2706          	jreq	L506
1805                     ; 391     UART2->CR3 |= UART2_CR3_LINEN;
1807  001f 721c5246      	bset	21062,#6
1809  0023 2004          	jra	L706
1810  0025               L506:
1811                     ; 396     UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1813  0025 721d5246      	bres	21062,#6
1814  0029               L706:
1815                     ; 398 }
1818  0029 84            	pop	a
1819  002a 81            	ret
1855                     ; 406 void UART2_SmartCardCmd(FunctionalState NewState)
1855                     ; 407 {
1856                     .text:	section	.text,new
1857  0000               _UART2_SmartCardCmd:
1859  0000 88            	push	a
1860       00000000      OFST:	set	0
1863                     ; 409   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1865  0001 4d            	tnz	a
1866  0002 2704          	jreq	L071
1867  0004 a101          	cp	a,#1
1868  0006 2603          	jrne	L661
1869  0008               L071:
1870  0008 4f            	clr	a
1871  0009 2010          	jra	L271
1872  000b               L661:
1873  000b ae0199        	ldw	x,#409
1874  000e 89            	pushw	x
1875  000f ae0000        	ldw	x,#0
1876  0012 89            	pushw	x
1877  0013 ae0008        	ldw	x,#L302
1878  0016 cd0000        	call	_assert_failed
1880  0019 5b04          	addw	sp,#4
1881  001b               L271:
1882                     ; 411   if (NewState != DISABLE)
1884  001b 0d01          	tnz	(OFST+1,sp)
1885  001d 2706          	jreq	L726
1886                     ; 414     UART2->CR5 |= UART2_CR5_SCEN;
1888  001f 721a5248      	bset	21064,#5
1890  0023 2004          	jra	L136
1891  0025               L726:
1892                     ; 419     UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1894  0025 721b5248      	bres	21064,#5
1895  0029               L136:
1896                     ; 421 }
1899  0029 84            	pop	a
1900  002a 81            	ret
1937                     ; 429 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1937                     ; 430 {
1938                     .text:	section	.text,new
1939  0000               _UART2_SmartCardNACKCmd:
1941  0000 88            	push	a
1942       00000000      OFST:	set	0
1945                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1947  0001 4d            	tnz	a
1948  0002 2704          	jreq	L002
1949  0004 a101          	cp	a,#1
1950  0006 2603          	jrne	L671
1951  0008               L002:
1952  0008 4f            	clr	a
1953  0009 2010          	jra	L202
1954  000b               L671:
1955  000b ae01b0        	ldw	x,#432
1956  000e 89            	pushw	x
1957  000f ae0000        	ldw	x,#0
1958  0012 89            	pushw	x
1959  0013 ae0008        	ldw	x,#L302
1960  0016 cd0000        	call	_assert_failed
1962  0019 5b04          	addw	sp,#4
1963  001b               L202:
1964                     ; 434   if (NewState != DISABLE)
1966  001b 0d01          	tnz	(OFST+1,sp)
1967  001d 2706          	jreq	L156
1968                     ; 437     UART2->CR5 |= UART2_CR5_NACK;
1970  001f 72185248      	bset	21064,#4
1972  0023 2004          	jra	L356
1973  0025               L156:
1974                     ; 442     UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1976  0025 72195248      	bres	21064,#4
1977  0029               L356:
1978                     ; 444 }
1981  0029 84            	pop	a
1982  002a 81            	ret
2040                     ; 452 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
2040                     ; 453 {
2041                     .text:	section	.text,new
2042  0000               _UART2_WakeUpConfig:
2044  0000 88            	push	a
2045       00000000      OFST:	set	0
2048                     ; 454   assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
2050  0001 4d            	tnz	a
2051  0002 2704          	jreq	L012
2052  0004 a108          	cp	a,#8
2053  0006 2603          	jrne	L602
2054  0008               L012:
2055  0008 4f            	clr	a
2056  0009 2010          	jra	L212
2057  000b               L602:
2058  000b ae01c6        	ldw	x,#454
2059  000e 89            	pushw	x
2060  000f ae0000        	ldw	x,#0
2061  0012 89            	pushw	x
2062  0013 ae0008        	ldw	x,#L302
2063  0016 cd0000        	call	_assert_failed
2065  0019 5b04          	addw	sp,#4
2066  001b               L212:
2067                     ; 456   UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
2069  001b 72175244      	bres	21060,#3
2070                     ; 457   UART2->CR1 |= (uint8_t)UART2_WakeUp;
2072  001f c65244        	ld	a,21060
2073  0022 1a01          	or	a,(OFST+1,sp)
2074  0024 c75244        	ld	21060,a
2075                     ; 458 }
2078  0027 84            	pop	a
2079  0028 81            	ret
2116                     ; 466 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
2116                     ; 467 {
2117                     .text:	section	.text,new
2118  0000               _UART2_ReceiverWakeUpCmd:
2120  0000 88            	push	a
2121       00000000      OFST:	set	0
2124                     ; 468   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2126  0001 4d            	tnz	a
2127  0002 2704          	jreq	L022
2128  0004 a101          	cp	a,#1
2129  0006 2603          	jrne	L612
2130  0008               L022:
2131  0008 4f            	clr	a
2132  0009 2010          	jra	L222
2133  000b               L612:
2134  000b ae01d4        	ldw	x,#468
2135  000e 89            	pushw	x
2136  000f ae0000        	ldw	x,#0
2137  0012 89            	pushw	x
2138  0013 ae0008        	ldw	x,#L302
2139  0016 cd0000        	call	_assert_failed
2141  0019 5b04          	addw	sp,#4
2142  001b               L222:
2143                     ; 470   if (NewState != DISABLE)
2145  001b 0d01          	tnz	(OFST+1,sp)
2146  001d 2706          	jreq	L127
2147                     ; 473     UART2->CR2 |= UART2_CR2_RWU;
2149  001f 72125245      	bset	21061,#1
2151  0023 2004          	jra	L327
2152  0025               L127:
2153                     ; 478     UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
2155  0025 72135245      	bres	21061,#1
2156  0029               L327:
2157                     ; 480 }
2160  0029 84            	pop	a
2161  002a 81            	ret
2184                     ; 487 uint8_t UART2_ReceiveData8(void)
2184                     ; 488 {
2185                     .text:	section	.text,new
2186  0000               _UART2_ReceiveData8:
2190                     ; 489   return ((uint8_t)UART2->DR);
2192  0000 c65241        	ld	a,21057
2195  0003 81            	ret
2229                     ; 497 uint16_t UART2_ReceiveData9(void)
2229                     ; 498 {
2230                     .text:	section	.text,new
2231  0000               _UART2_ReceiveData9:
2233  0000 89            	pushw	x
2234       00000002      OFST:	set	2
2237                     ; 499   uint16_t temp = 0;
2239  0001 5f            	clrw	x
2240  0002 1f01          	ldw	(OFST-1,sp),x
2241                     ; 501   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
2243  0004 c65244        	ld	a,21060
2244  0007 5f            	clrw	x
2245  0008 a480          	and	a,#128
2246  000a 5f            	clrw	x
2247  000b 02            	rlwa	x,a
2248  000c 58            	sllw	x
2249  000d 1f01          	ldw	(OFST-1,sp),x
2250                     ; 503   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
2252  000f c65241        	ld	a,21057
2253  0012 5f            	clrw	x
2254  0013 97            	ld	xl,a
2255  0014 01            	rrwa	x,a
2256  0015 1a02          	or	a,(OFST+0,sp)
2257  0017 01            	rrwa	x,a
2258  0018 1a01          	or	a,(OFST-1,sp)
2259  001a 01            	rrwa	x,a
2260  001b 01            	rrwa	x,a
2261  001c a4ff          	and	a,#255
2262  001e 01            	rrwa	x,a
2263  001f a401          	and	a,#1
2264  0021 01            	rrwa	x,a
2267  0022 5b02          	addw	sp,#2
2268  0024 81            	ret
2302                     ; 511 void UART2_SendData8(uint8_t Data)
2302                     ; 512 {
2303                     .text:	section	.text,new
2304  0000               _UART2_SendData8:
2308                     ; 514   UART2->DR = Data;
2310  0000 c75241        	ld	21057,a
2311                     ; 515 }
2314  0003 81            	ret
2348                     ; 522 void UART2_SendData9(uint16_t Data)
2348                     ; 523 {
2349                     .text:	section	.text,new
2350  0000               _UART2_SendData9:
2352  0000 89            	pushw	x
2353       00000000      OFST:	set	0
2356                     ; 525   UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
2358  0001 721d5244      	bres	21060,#6
2359                     ; 528   UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
2361  0005 54            	srlw	x
2362  0006 54            	srlw	x
2363  0007 9f            	ld	a,xl
2364  0008 a440          	and	a,#64
2365  000a ca5244        	or	a,21060
2366  000d c75244        	ld	21060,a
2367                     ; 531   UART2->DR   = (uint8_t)(Data);                    
2369  0010 7b02          	ld	a,(OFST+2,sp)
2370  0012 c75241        	ld	21057,a
2371                     ; 532 }
2374  0015 85            	popw	x
2375  0016 81            	ret
2398                     ; 539 void UART2_SendBreak(void)
2398                     ; 540 {
2399                     .text:	section	.text,new
2400  0000               _UART2_SendBreak:
2404                     ; 541   UART2->CR2 |= UART2_CR2_SBK;
2406  0000 72105245      	bset	21061,#0
2407                     ; 542 }
2410  0004 81            	ret
2445                     ; 549 void UART2_SetAddress(uint8_t UART2_Address)
2445                     ; 550 {
2446                     .text:	section	.text,new
2447  0000               _UART2_SetAddress:
2449  0000 88            	push	a
2450       00000000      OFST:	set	0
2453                     ; 552   assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2455  0001 a110          	cp	a,#16
2456  0003 2403          	jruge	L042
2457  0005 4f            	clr	a
2458  0006 2010          	jra	L242
2459  0008               L042:
2460  0008 ae0228        	ldw	x,#552
2461  000b 89            	pushw	x
2462  000c ae0000        	ldw	x,#0
2463  000f 89            	pushw	x
2464  0010 ae0008        	ldw	x,#L302
2465  0013 cd0000        	call	_assert_failed
2467  0016 5b04          	addw	sp,#4
2468  0018               L242:
2469                     ; 555   UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2471  0018 c65247        	ld	a,21063
2472  001b a4f0          	and	a,#240
2473  001d c75247        	ld	21063,a
2474                     ; 557   UART2->CR4 |= UART2_Address;
2476  0020 c65247        	ld	a,21063
2477  0023 1a01          	or	a,(OFST+1,sp)
2478  0025 c75247        	ld	21063,a
2479                     ; 558 }
2482  0028 84            	pop	a
2483  0029 81            	ret
2517                     ; 566 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2517                     ; 567 {
2518                     .text:	section	.text,new
2519  0000               _UART2_SetGuardTime:
2523                     ; 569   UART2->GTR = UART2_GuardTime;
2525  0000 c7524a        	ld	21066,a
2526                     ; 570 }
2529  0003 81            	ret
2563                     ; 594 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2563                     ; 595 {
2564                     .text:	section	.text,new
2565  0000               _UART2_SetPrescaler:
2569                     ; 597   UART2->PSCR = UART2_Prescaler;
2571  0000 c7524b        	ld	21067,a
2572                     ; 598 }
2575  0003 81            	ret
2733                     ; 606 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2733                     ; 607 {
2734                     .text:	section	.text,new
2735  0000               _UART2_GetFlagStatus:
2737  0000 89            	pushw	x
2738  0001 88            	push	a
2739       00000001      OFST:	set	1
2742                     ; 608   FlagStatus status = RESET;
2744  0002 0f01          	clr	(OFST+0,sp)
2745                     ; 611   assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2747  0004 a30080        	cpw	x,#128
2748  0007 2737          	jreq	L452
2749  0009 a30040        	cpw	x,#64
2750  000c 2732          	jreq	L452
2751  000e a30020        	cpw	x,#32
2752  0011 272d          	jreq	L452
2753  0013 a30010        	cpw	x,#16
2754  0016 2728          	jreq	L452
2755  0018 a30008        	cpw	x,#8
2756  001b 2723          	jreq	L452
2757  001d a30004        	cpw	x,#4
2758  0020 271e          	jreq	L452
2759  0022 a30002        	cpw	x,#2
2760  0025 2719          	jreq	L452
2761  0027 a30001        	cpw	x,#1
2762  002a 2714          	jreq	L452
2763  002c a30101        	cpw	x,#257
2764  002f 270f          	jreq	L452
2765  0031 a30301        	cpw	x,#769
2766  0034 270a          	jreq	L452
2767  0036 a30302        	cpw	x,#770
2768  0039 2705          	jreq	L452
2769  003b a30210        	cpw	x,#528
2770  003e 2603          	jrne	L252
2771  0040               L452:
2772  0040 4f            	clr	a
2773  0041 2010          	jra	L652
2774  0043               L252:
2775  0043 ae0263        	ldw	x,#611
2776  0046 89            	pushw	x
2777  0047 ae0000        	ldw	x,#0
2778  004a 89            	pushw	x
2779  004b ae0008        	ldw	x,#L302
2780  004e cd0000        	call	_assert_failed
2782  0051 5b04          	addw	sp,#4
2783  0053               L652:
2784                     ; 614   if (UART2_FLAG == UART2_FLAG_LBDF)
2786  0053 1e02          	ldw	x,(OFST+1,sp)
2787  0055 a30210        	cpw	x,#528
2788  0058 2611          	jrne	L7511
2789                     ; 616     if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2791  005a c65247        	ld	a,21063
2792  005d 1503          	bcp	a,(OFST+2,sp)
2793  005f 2706          	jreq	L1611
2794                     ; 619       status = SET;
2796  0061 a601          	ld	a,#1
2797  0063 6b01          	ld	(OFST+0,sp),a
2799  0065 2039          	jra	L5611
2800  0067               L1611:
2801                     ; 624       status = RESET;
2803  0067 0f01          	clr	(OFST+0,sp)
2804  0069 2035          	jra	L5611
2805  006b               L7511:
2806                     ; 627   else if (UART2_FLAG == UART2_FLAG_SBK)
2808  006b 1e02          	ldw	x,(OFST+1,sp)
2809  006d a30101        	cpw	x,#257
2810  0070 2611          	jrne	L7611
2811                     ; 629     if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2813  0072 c65245        	ld	a,21061
2814  0075 1503          	bcp	a,(OFST+2,sp)
2815  0077 2706          	jreq	L1711
2816                     ; 632       status = SET;
2818  0079 a601          	ld	a,#1
2819  007b 6b01          	ld	(OFST+0,sp),a
2821  007d 2021          	jra	L5611
2822  007f               L1711:
2823                     ; 637       status = RESET;
2825  007f 0f01          	clr	(OFST+0,sp)
2826  0081 201d          	jra	L5611
2827  0083               L7611:
2828                     ; 640   else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2830  0083 1e02          	ldw	x,(OFST+1,sp)
2831  0085 a30302        	cpw	x,#770
2832  0088 2707          	jreq	L1021
2834  008a 1e02          	ldw	x,(OFST+1,sp)
2835  008c a30301        	cpw	x,#769
2836  008f 2614          	jrne	L7711
2837  0091               L1021:
2838                     ; 642     if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2840  0091 c65249        	ld	a,21065
2841  0094 1503          	bcp	a,(OFST+2,sp)
2842  0096 2706          	jreq	L3021
2843                     ; 645       status = SET;
2845  0098 a601          	ld	a,#1
2846  009a 6b01          	ld	(OFST+0,sp),a
2848  009c 2002          	jra	L5611
2849  009e               L3021:
2850                     ; 650       status = RESET;
2852  009e 0f01          	clr	(OFST+0,sp)
2853  00a0               L5611:
2854                     ; 668   return  status;
2856  00a0 7b01          	ld	a,(OFST+0,sp)
2859  00a2 5b03          	addw	sp,#3
2860  00a4 81            	ret
2861  00a5               L7711:
2862                     ; 655     if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2864  00a5 c65240        	ld	a,21056
2865  00a8 1503          	bcp	a,(OFST+2,sp)
2866  00aa 2706          	jreq	L1121
2867                     ; 658       status = SET;
2869  00ac a601          	ld	a,#1
2870  00ae 6b01          	ld	(OFST+0,sp),a
2872  00b0 20ee          	jra	L5611
2873  00b2               L1121:
2874                     ; 663       status = RESET;
2876  00b2 0f01          	clr	(OFST+0,sp)
2877  00b4 20ea          	jra	L5611
2913                     ; 699 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2913                     ; 700 {
2914                     .text:	section	.text,new
2915  0000               _UART2_ClearFlag:
2917  0000 89            	pushw	x
2918       00000000      OFST:	set	0
2921                     ; 701   assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2923  0001 a30020        	cpw	x,#32
2924  0004 270f          	jreq	L462
2925  0006 a30302        	cpw	x,#770
2926  0009 270a          	jreq	L462
2927  000b a30301        	cpw	x,#769
2928  000e 2705          	jreq	L462
2929  0010 a30210        	cpw	x,#528
2930  0013 2603          	jrne	L262
2931  0015               L462:
2932  0015 4f            	clr	a
2933  0016 2010          	jra	L662
2934  0018               L262:
2935  0018 ae02bd        	ldw	x,#701
2936  001b 89            	pushw	x
2937  001c ae0000        	ldw	x,#0
2938  001f 89            	pushw	x
2939  0020 ae0008        	ldw	x,#L302
2940  0023 cd0000        	call	_assert_failed
2942  0026 5b04          	addw	sp,#4
2943  0028               L662:
2944                     ; 704   if (UART2_FLAG == UART2_FLAG_RXNE)
2946  0028 1e01          	ldw	x,(OFST+1,sp)
2947  002a a30020        	cpw	x,#32
2948  002d 2606          	jrne	L3321
2949                     ; 706     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2951  002f 35df5240      	mov	21056,#223
2953  0033 201e          	jra	L5321
2954  0035               L3321:
2955                     ; 709   else if (UART2_FLAG == UART2_FLAG_LBDF)
2957  0035 1e01          	ldw	x,(OFST+1,sp)
2958  0037 a30210        	cpw	x,#528
2959  003a 2606          	jrne	L7321
2960                     ; 711     UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2962  003c 72195247      	bres	21063,#4
2964  0040 2011          	jra	L5321
2965  0042               L7321:
2966                     ; 714   else if (UART2_FLAG == UART2_FLAG_LHDF)
2968  0042 1e01          	ldw	x,(OFST+1,sp)
2969  0044 a30302        	cpw	x,#770
2970  0047 2606          	jrne	L3421
2971                     ; 716     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2973  0049 72135249      	bres	21065,#1
2975  004d 2004          	jra	L5321
2976  004f               L3421:
2977                     ; 721     UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2979  004f 72115249      	bres	21065,#0
2980  0053               L5321:
2981                     ; 723 }
2984  0053 85            	popw	x
2985  0054 81            	ret
3068                     ; 738 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
3068                     ; 739 {
3069                     .text:	section	.text,new
3070  0000               _UART2_GetITStatus:
3072  0000 89            	pushw	x
3073  0001 89            	pushw	x
3074       00000002      OFST:	set	2
3077                     ; 740   ITStatus pendingbitstatus = RESET;
3079  0002 7b02          	ld	a,(OFST+0,sp)
3080  0004 97            	ld	xl,a
3081                     ; 741   uint8_t itpos = 0;
3083  0005 7b01          	ld	a,(OFST-1,sp)
3084  0007 97            	ld	xl,a
3085                     ; 742   uint8_t itmask1 = 0;
3087  0008 7b02          	ld	a,(OFST+0,sp)
3088  000a 97            	ld	xl,a
3089                     ; 743   uint8_t itmask2 = 0;
3091  000b 7b02          	ld	a,(OFST+0,sp)
3092  000d 97            	ld	xl,a
3093                     ; 744   uint8_t enablestatus = 0;
3095  000e 7b02          	ld	a,(OFST+0,sp)
3096  0010 97            	ld	xl,a
3097                     ; 747   assert_param(IS_UART2_GET_IT_OK(UART2_IT));
3099  0011 1e03          	ldw	x,(OFST+1,sp)
3100  0013 a30277        	cpw	x,#631
3101  0016 2731          	jreq	L472
3102  0018 1e03          	ldw	x,(OFST+1,sp)
3103  001a a30266        	cpw	x,#614
3104  001d 272a          	jreq	L472
3105  001f 1e03          	ldw	x,(OFST+1,sp)
3106  0021 a30255        	cpw	x,#597
3107  0024 2723          	jreq	L472
3108  0026 1e03          	ldw	x,(OFST+1,sp)
3109  0028 a30244        	cpw	x,#580
3110  002b 271c          	jreq	L472
3111  002d 1e03          	ldw	x,(OFST+1,sp)
3112  002f a30235        	cpw	x,#565
3113  0032 2715          	jreq	L472
3114  0034 1e03          	ldw	x,(OFST+1,sp)
3115  0036 a30346        	cpw	x,#838
3116  0039 270e          	jreq	L472
3117  003b 1e03          	ldw	x,(OFST+1,sp)
3118  003d a30412        	cpw	x,#1042
3119  0040 2707          	jreq	L472
3120  0042 1e03          	ldw	x,(OFST+1,sp)
3121  0044 a30100        	cpw	x,#256
3122  0047 2603          	jrne	L272
3123  0049               L472:
3124  0049 4f            	clr	a
3125  004a 2010          	jra	L672
3126  004c               L272:
3127  004c ae02eb        	ldw	x,#747
3128  004f 89            	pushw	x
3129  0050 ae0000        	ldw	x,#0
3130  0053 89            	pushw	x
3131  0054 ae0008        	ldw	x,#L302
3132  0057 cd0000        	call	_assert_failed
3134  005a 5b04          	addw	sp,#4
3135  005c               L672:
3136                     ; 750   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
3138  005c 7b04          	ld	a,(OFST+2,sp)
3139  005e a40f          	and	a,#15
3140  0060 5f            	clrw	x
3141  0061 97            	ld	xl,a
3142  0062 a601          	ld	a,#1
3143  0064 5d            	tnzw	x
3144  0065 2704          	jreq	L003
3145  0067               L203:
3146  0067 48            	sll	a
3147  0068 5a            	decw	x
3148  0069 26fc          	jrne	L203
3149  006b               L003:
3150  006b 6b01          	ld	(OFST-1,sp),a
3151                     ; 752   itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
3153  006d 7b04          	ld	a,(OFST+2,sp)
3154  006f 4e            	swap	a
3155  0070 a40f          	and	a,#15
3156  0072 6b02          	ld	(OFST+0,sp),a
3157                     ; 754   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
3159  0074 7b02          	ld	a,(OFST+0,sp)
3160  0076 5f            	clrw	x
3161  0077 97            	ld	xl,a
3162  0078 a601          	ld	a,#1
3163  007a 5d            	tnzw	x
3164  007b 2704          	jreq	L403
3165  007d               L603:
3166  007d 48            	sll	a
3167  007e 5a            	decw	x
3168  007f 26fc          	jrne	L603
3169  0081               L403:
3170  0081 6b02          	ld	(OFST+0,sp),a
3171                     ; 757   if (UART2_IT == UART2_IT_PE)
3173  0083 1e03          	ldw	x,(OFST+1,sp)
3174  0085 a30100        	cpw	x,#256
3175  0088 261c          	jrne	L1131
3176                     ; 760     enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
3178  008a c65244        	ld	a,21060
3179  008d 1402          	and	a,(OFST+0,sp)
3180  008f 6b02          	ld	(OFST+0,sp),a
3181                     ; 763     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3183  0091 c65240        	ld	a,21056
3184  0094 1501          	bcp	a,(OFST-1,sp)
3185  0096 270a          	jreq	L3131
3187  0098 0d02          	tnz	(OFST+0,sp)
3188  009a 2706          	jreq	L3131
3189                     ; 766       pendingbitstatus = SET;
3191  009c a601          	ld	a,#1
3192  009e 6b02          	ld	(OFST+0,sp),a
3194  00a0 2064          	jra	L7131
3195  00a2               L3131:
3196                     ; 771       pendingbitstatus = RESET;
3198  00a2 0f02          	clr	(OFST+0,sp)
3199  00a4 2060          	jra	L7131
3200  00a6               L1131:
3201                     ; 774   else if (UART2_IT == UART2_IT_LBDF)
3203  00a6 1e03          	ldw	x,(OFST+1,sp)
3204  00a8 a30346        	cpw	x,#838
3205  00ab 261c          	jrne	L1231
3206                     ; 777     enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
3208  00ad c65247        	ld	a,21063
3209  00b0 1402          	and	a,(OFST+0,sp)
3210  00b2 6b02          	ld	(OFST+0,sp),a
3211                     ; 779     if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
3213  00b4 c65247        	ld	a,21063
3214  00b7 1501          	bcp	a,(OFST-1,sp)
3215  00b9 270a          	jreq	L3231
3217  00bb 0d02          	tnz	(OFST+0,sp)
3218  00bd 2706          	jreq	L3231
3219                     ; 782       pendingbitstatus = SET;
3221  00bf a601          	ld	a,#1
3222  00c1 6b02          	ld	(OFST+0,sp),a
3224  00c3 2041          	jra	L7131
3225  00c5               L3231:
3226                     ; 787       pendingbitstatus = RESET;
3228  00c5 0f02          	clr	(OFST+0,sp)
3229  00c7 203d          	jra	L7131
3230  00c9               L1231:
3231                     ; 790   else if (UART2_IT == UART2_IT_LHDF)
3233  00c9 1e03          	ldw	x,(OFST+1,sp)
3234  00cb a30412        	cpw	x,#1042
3235  00ce 261c          	jrne	L1331
3236                     ; 793     enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
3238  00d0 c65249        	ld	a,21065
3239  00d3 1402          	and	a,(OFST+0,sp)
3240  00d5 6b02          	ld	(OFST+0,sp),a
3241                     ; 795     if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
3243  00d7 c65249        	ld	a,21065
3244  00da 1501          	bcp	a,(OFST-1,sp)
3245  00dc 270a          	jreq	L3331
3247  00de 0d02          	tnz	(OFST+0,sp)
3248  00e0 2706          	jreq	L3331
3249                     ; 798       pendingbitstatus = SET;
3251  00e2 a601          	ld	a,#1
3252  00e4 6b02          	ld	(OFST+0,sp),a
3254  00e6 201e          	jra	L7131
3255  00e8               L3331:
3256                     ; 803       pendingbitstatus = RESET;
3258  00e8 0f02          	clr	(OFST+0,sp)
3259  00ea 201a          	jra	L7131
3260  00ec               L1331:
3261                     ; 809     enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
3263  00ec c65245        	ld	a,21061
3264  00ef 1402          	and	a,(OFST+0,sp)
3265  00f1 6b02          	ld	(OFST+0,sp),a
3266                     ; 811     if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3268  00f3 c65240        	ld	a,21056
3269  00f6 1501          	bcp	a,(OFST-1,sp)
3270  00f8 270a          	jreq	L1431
3272  00fa 0d02          	tnz	(OFST+0,sp)
3273  00fc 2706          	jreq	L1431
3274                     ; 814       pendingbitstatus = SET;
3276  00fe a601          	ld	a,#1
3277  0100 6b02          	ld	(OFST+0,sp),a
3279  0102 2002          	jra	L7131
3280  0104               L1431:
3281                     ; 819       pendingbitstatus = RESET;
3283  0104 0f02          	clr	(OFST+0,sp)
3284  0106               L7131:
3285                     ; 823   return  pendingbitstatus;
3287  0106 7b02          	ld	a,(OFST+0,sp)
3290  0108 5b04          	addw	sp,#4
3291  010a 81            	ret
3328                     ; 852 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
3328                     ; 853 {
3329                     .text:	section	.text,new
3330  0000               _UART2_ClearITPendingBit:
3332  0000 89            	pushw	x
3333       00000000      OFST:	set	0
3336                     ; 854   assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
3338  0001 a30255        	cpw	x,#597
3339  0004 270a          	jreq	L413
3340  0006 a30412        	cpw	x,#1042
3341  0009 2705          	jreq	L413
3342  000b a30346        	cpw	x,#838
3343  000e 2603          	jrne	L213
3344  0010               L413:
3345  0010 4f            	clr	a
3346  0011 2010          	jra	L613
3347  0013               L213:
3348  0013 ae0356        	ldw	x,#854
3349  0016 89            	pushw	x
3350  0017 ae0000        	ldw	x,#0
3351  001a 89            	pushw	x
3352  001b ae0008        	ldw	x,#L302
3353  001e cd0000        	call	_assert_failed
3355  0021 5b04          	addw	sp,#4
3356  0023               L613:
3357                     ; 857   if (UART2_IT == UART2_IT_RXNE)
3359  0023 1e01          	ldw	x,(OFST+1,sp)
3360  0025 a30255        	cpw	x,#597
3361  0028 2606          	jrne	L3631
3362                     ; 859     UART2->SR = (uint8_t)~(UART2_SR_RXNE);
3364  002a 35df5240      	mov	21056,#223
3366  002e 2011          	jra	L5631
3367  0030               L3631:
3368                     ; 862   else if (UART2_IT == UART2_IT_LBDF)
3370  0030 1e01          	ldw	x,(OFST+1,sp)
3371  0032 a30346        	cpw	x,#838
3372  0035 2606          	jrne	L7631
3373                     ; 864     UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
3375  0037 72195247      	bres	21063,#4
3377  003b 2004          	jra	L5631
3378  003d               L7631:
3379                     ; 869     UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
3381  003d 72135249      	bres	21065,#1
3382  0041               L5631:
3383                     ; 871 }
3386  0041 85            	popw	x
3387  0042 81            	ret
3400                     	xdef	_UART2_ClearITPendingBit
3401                     	xdef	_UART2_GetITStatus
3402                     	xdef	_UART2_ClearFlag
3403                     	xdef	_UART2_GetFlagStatus
3404                     	xdef	_UART2_SetPrescaler
3405                     	xdef	_UART2_SetGuardTime
3406                     	xdef	_UART2_SetAddress
3407                     	xdef	_UART2_SendBreak
3408                     	xdef	_UART2_SendData9
3409                     	xdef	_UART2_SendData8
3410                     	xdef	_UART2_ReceiveData9
3411                     	xdef	_UART2_ReceiveData8
3412                     	xdef	_UART2_ReceiverWakeUpCmd
3413                     	xdef	_UART2_WakeUpConfig
3414                     	xdef	_UART2_SmartCardNACKCmd
3415                     	xdef	_UART2_SmartCardCmd
3416                     	xdef	_UART2_LINCmd
3417                     	xdef	_UART2_LINConfig
3418                     	xdef	_UART2_LINBreakDetectionConfig
3419                     	xdef	_UART2_IrDACmd
3420                     	xdef	_UART2_IrDAConfig
3421                     	xdef	_UART2_ITConfig
3422                     	xdef	_UART2_Cmd
3423                     	xdef	_UART2_Init
3424                     	xdef	_UART2_DeInit
3425                     	xref	_assert_failed
3426                     	xref	_CLK_GetClockFreq
3427                     	switch	.const
3428  0008               L302:
3429  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3430  001a 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3431  002c 72697665725c  	dc.b	"river\src\stm8s_ua"
3432  003e 7274322e6300  	dc.b	"rt2.c",0
3433                     	xref.b	c_lreg
3453                     	xref	c_lursh
3454                     	xref	c_lsub
3455                     	xref	c_smul
3456                     	xref	c_ludv
3457                     	xref	c_rtol
3458                     	xref	c_llsh
3459                     	xref	c_lcmp
3460                     	xref	c_ltor
3461                     	end
