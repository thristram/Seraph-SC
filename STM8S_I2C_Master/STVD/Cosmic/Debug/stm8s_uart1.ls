   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 53 void UART1_DeInit(void)
  32                     ; 54 {
  34                     .text:	section	.text,new
  35  0000               _UART1_DeInit:
  39                     ; 57   (void)UART1->SR;
  41  0000 c65230        	ld	a,21040
  42  0003 97            	ld	xl,a
  43                     ; 58   (void)UART1->DR;
  45  0004 c65231        	ld	a,21041
  46  0007 97            	ld	xl,a
  47                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  49  0008 725f5233      	clr	21043
  50                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  52  000c 725f5232      	clr	21042
  53                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  55  0010 725f5234      	clr	21044
  56                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  58  0014 725f5235      	clr	21045
  59                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  61  0018 725f5236      	clr	21046
  62                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  64  001c 725f5237      	clr	21047
  65                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  67  0020 725f5238      	clr	21048
  68                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  70  0024 725f5239      	clr	21049
  71                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  73  0028 725f523a      	clr	21050
  74                     ; 71 }
  77  002c 81            	ret
 375                     .const:	section	.text
 376  0000               L21:
 377  0000 00098969      	dc.l	625001
 378  0004               L25:
 379  0004 00000064      	dc.l	100
 380                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 380                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 380                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 380                     ; 93 {
 381                     .text:	section	.text,new
 382  0000               _UART1_Init:
 384  0000 520c          	subw	sp,#12
 385       0000000c      OFST:	set	12
 388                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 390  0002 96            	ldw	x,sp
 391  0003 1c0009        	addw	x,#OFST-3
 392  0006 cd0000        	call	c_ltor
 396  0009 96            	ldw	x,sp
 397  000a 1c0005        	addw	x,#OFST-7
 398  000d cd0000        	call	c_ltor
 400                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 402  0010 96            	ldw	x,sp
 403  0011 1c000f        	addw	x,#OFST+3
 404  0014 cd0000        	call	c_ltor
 406  0017 ae0000        	ldw	x,#L21
 407  001a cd0000        	call	c_lcmp
 409  001d 2403          	jruge	L01
 410  001f 4f            	clr	a
 411  0020 2010          	jra	L41
 412  0022               L01:
 413  0022 ae0061        	ldw	x,#97
 414  0025 89            	pushw	x
 415  0026 ae0000        	ldw	x,#0
 416  0029 89            	pushw	x
 417  002a ae0008        	ldw	x,#L561
 418  002d cd0000        	call	_assert_failed
 420  0030 5b04          	addw	sp,#4
 421  0032               L41:
 422                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 424  0032 0d13          	tnz	(OFST+7,sp)
 425  0034 2706          	jreq	L02
 426  0036 7b13          	ld	a,(OFST+7,sp)
 427  0038 a110          	cp	a,#16
 428  003a 2603          	jrne	L61
 429  003c               L02:
 430  003c 4f            	clr	a
 431  003d 2010          	jra	L22
 432  003f               L61:
 433  003f ae0062        	ldw	x,#98
 434  0042 89            	pushw	x
 435  0043 ae0000        	ldw	x,#0
 436  0046 89            	pushw	x
 437  0047 ae0008        	ldw	x,#L561
 438  004a cd0000        	call	_assert_failed
 440  004d 5b04          	addw	sp,#4
 441  004f               L22:
 442                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 444  004f 0d14          	tnz	(OFST+8,sp)
 445  0051 2712          	jreq	L62
 446  0053 7b14          	ld	a,(OFST+8,sp)
 447  0055 a110          	cp	a,#16
 448  0057 270c          	jreq	L62
 449  0059 7b14          	ld	a,(OFST+8,sp)
 450  005b a120          	cp	a,#32
 451  005d 2706          	jreq	L62
 452  005f 7b14          	ld	a,(OFST+8,sp)
 453  0061 a130          	cp	a,#48
 454  0063 2603          	jrne	L42
 455  0065               L62:
 456  0065 4f            	clr	a
 457  0066 2010          	jra	L03
 458  0068               L42:
 459  0068 ae0063        	ldw	x,#99
 460  006b 89            	pushw	x
 461  006c ae0000        	ldw	x,#0
 462  006f 89            	pushw	x
 463  0070 ae0008        	ldw	x,#L561
 464  0073 cd0000        	call	_assert_failed
 466  0076 5b04          	addw	sp,#4
 467  0078               L03:
 468                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 470  0078 0d15          	tnz	(OFST+9,sp)
 471  007a 270c          	jreq	L43
 472  007c 7b15          	ld	a,(OFST+9,sp)
 473  007e a104          	cp	a,#4
 474  0080 2706          	jreq	L43
 475  0082 7b15          	ld	a,(OFST+9,sp)
 476  0084 a106          	cp	a,#6
 477  0086 2603          	jrne	L23
 478  0088               L43:
 479  0088 4f            	clr	a
 480  0089 2010          	jra	L63
 481  008b               L23:
 482  008b ae0064        	ldw	x,#100
 483  008e 89            	pushw	x
 484  008f ae0000        	ldw	x,#0
 485  0092 89            	pushw	x
 486  0093 ae0008        	ldw	x,#L561
 487  0096 cd0000        	call	_assert_failed
 489  0099 5b04          	addw	sp,#4
 490  009b               L63:
 491                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 493  009b 7b17          	ld	a,(OFST+11,sp)
 494  009d a108          	cp	a,#8
 495  009f 2730          	jreq	L24
 496  00a1 7b17          	ld	a,(OFST+11,sp)
 497  00a3 a140          	cp	a,#64
 498  00a5 272a          	jreq	L24
 499  00a7 7b17          	ld	a,(OFST+11,sp)
 500  00a9 a104          	cp	a,#4
 501  00ab 2724          	jreq	L24
 502  00ad 7b17          	ld	a,(OFST+11,sp)
 503  00af a180          	cp	a,#128
 504  00b1 271e          	jreq	L24
 505  00b3 7b17          	ld	a,(OFST+11,sp)
 506  00b5 a10c          	cp	a,#12
 507  00b7 2718          	jreq	L24
 508  00b9 7b17          	ld	a,(OFST+11,sp)
 509  00bb a10c          	cp	a,#12
 510  00bd 2712          	jreq	L24
 511  00bf 7b17          	ld	a,(OFST+11,sp)
 512  00c1 a144          	cp	a,#68
 513  00c3 270c          	jreq	L24
 514  00c5 7b17          	ld	a,(OFST+11,sp)
 515  00c7 a1c0          	cp	a,#192
 516  00c9 2706          	jreq	L24
 517  00cb 7b17          	ld	a,(OFST+11,sp)
 518  00cd a188          	cp	a,#136
 519  00cf 2603          	jrne	L04
 520  00d1               L24:
 521  00d1 4f            	clr	a
 522  00d2 2010          	jra	L44
 523  00d4               L04:
 524  00d4 ae0065        	ldw	x,#101
 525  00d7 89            	pushw	x
 526  00d8 ae0000        	ldw	x,#0
 527  00db 89            	pushw	x
 528  00dc ae0008        	ldw	x,#L561
 529  00df cd0000        	call	_assert_failed
 531  00e2 5b04          	addw	sp,#4
 532  00e4               L44:
 533                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 535  00e4 7b16          	ld	a,(OFST+10,sp)
 536  00e6 a488          	and	a,#136
 537  00e8 a188          	cp	a,#136
 538  00ea 271b          	jreq	L64
 539  00ec 7b16          	ld	a,(OFST+10,sp)
 540  00ee a444          	and	a,#68
 541  00f0 a144          	cp	a,#68
 542  00f2 2713          	jreq	L64
 543  00f4 7b16          	ld	a,(OFST+10,sp)
 544  00f6 a422          	and	a,#34
 545  00f8 a122          	cp	a,#34
 546  00fa 270b          	jreq	L64
 547  00fc 7b16          	ld	a,(OFST+10,sp)
 548  00fe a411          	and	a,#17
 549  0100 a111          	cp	a,#17
 550  0102 2703          	jreq	L64
 551  0104 4f            	clr	a
 552  0105 2010          	jra	L05
 553  0107               L64:
 554  0107 ae0066        	ldw	x,#102
 555  010a 89            	pushw	x
 556  010b ae0000        	ldw	x,#0
 557  010e 89            	pushw	x
 558  010f ae0008        	ldw	x,#L561
 559  0112 cd0000        	call	_assert_failed
 561  0115 5b04          	addw	sp,#4
 562  0117               L05:
 563                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 565  0117 72195234      	bres	21044,#4
 566                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 568  011b c65234        	ld	a,21044
 569  011e 1a13          	or	a,(OFST+7,sp)
 570  0120 c75234        	ld	21044,a
 571                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 573  0123 c65236        	ld	a,21046
 574  0126 a4cf          	and	a,#207
 575  0128 c75236        	ld	21046,a
 576                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 578  012b c65236        	ld	a,21046
 579  012e 1a14          	or	a,(OFST+8,sp)
 580  0130 c75236        	ld	21046,a
 581                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 583  0133 c65234        	ld	a,21044
 584  0136 a4f9          	and	a,#249
 585  0138 c75234        	ld	21044,a
 586                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 588  013b c65234        	ld	a,21044
 589  013e 1a15          	or	a,(OFST+9,sp)
 590  0140 c75234        	ld	21044,a
 591                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 593  0143 725f5232      	clr	21042
 594                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 596  0147 c65233        	ld	a,21043
 597  014a a40f          	and	a,#15
 598  014c c75233        	ld	21043,a
 599                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 601  014f c65233        	ld	a,21043
 602  0152 a4f0          	and	a,#240
 603  0154 c75233        	ld	21043,a
 604                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 606  0157 96            	ldw	x,sp
 607  0158 1c000f        	addw	x,#OFST+3
 608  015b cd0000        	call	c_ltor
 610  015e a604          	ld	a,#4
 611  0160 cd0000        	call	c_llsh
 613  0163 96            	ldw	x,sp
 614  0164 1c0001        	addw	x,#OFST-11
 615  0167 cd0000        	call	c_rtol
 617  016a cd0000        	call	_CLK_GetClockFreq
 619  016d 96            	ldw	x,sp
 620  016e 1c0001        	addw	x,#OFST-11
 621  0171 cd0000        	call	c_ludv
 623  0174 96            	ldw	x,sp
 624  0175 1c0009        	addw	x,#OFST-3
 625  0178 cd0000        	call	c_rtol
 627                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 629  017b 96            	ldw	x,sp
 630  017c 1c000f        	addw	x,#OFST+3
 631  017f cd0000        	call	c_ltor
 633  0182 a604          	ld	a,#4
 634  0184 cd0000        	call	c_llsh
 636  0187 96            	ldw	x,sp
 637  0188 1c0001        	addw	x,#OFST-11
 638  018b cd0000        	call	c_rtol
 640  018e cd0000        	call	_CLK_GetClockFreq
 642  0191 a664          	ld	a,#100
 643  0193 cd0000        	call	c_smul
 645  0196 96            	ldw	x,sp
 646  0197 1c0001        	addw	x,#OFST-11
 647  019a cd0000        	call	c_ludv
 649  019d 96            	ldw	x,sp
 650  019e 1c0005        	addw	x,#OFST-7
 651  01a1 cd0000        	call	c_rtol
 653                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 655  01a4 96            	ldw	x,sp
 656  01a5 1c0009        	addw	x,#OFST-3
 657  01a8 cd0000        	call	c_ltor
 659  01ab a664          	ld	a,#100
 660  01ad cd0000        	call	c_smul
 662  01b0 96            	ldw	x,sp
 663  01b1 1c0001        	addw	x,#OFST-11
 664  01b4 cd0000        	call	c_rtol
 666  01b7 96            	ldw	x,sp
 667  01b8 1c0005        	addw	x,#OFST-7
 668  01bb cd0000        	call	c_ltor
 670  01be 96            	ldw	x,sp
 671  01bf 1c0001        	addw	x,#OFST-11
 672  01c2 cd0000        	call	c_lsub
 674  01c5 a604          	ld	a,#4
 675  01c7 cd0000        	call	c_llsh
 677  01ca ae0004        	ldw	x,#L25
 678  01cd cd0000        	call	c_ludv
 680  01d0 b603          	ld	a,c_lreg+3
 681  01d2 a40f          	and	a,#15
 682  01d4 ca5233        	or	a,21043
 683  01d7 c75233        	ld	21043,a
 684                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 686  01da 96            	ldw	x,sp
 687  01db 1c0009        	addw	x,#OFST-3
 688  01de cd0000        	call	c_ltor
 690  01e1 a604          	ld	a,#4
 691  01e3 cd0000        	call	c_lursh
 693  01e6 b603          	ld	a,c_lreg+3
 694  01e8 a4f0          	and	a,#240
 695  01ea b703          	ld	c_lreg+3,a
 696  01ec 3f02          	clr	c_lreg+2
 697  01ee 3f01          	clr	c_lreg+1
 698  01f0 3f00          	clr	c_lreg
 699  01f2 b603          	ld	a,c_lreg+3
 700  01f4 ca5233        	or	a,21043
 701  01f7 c75233        	ld	21043,a
 702                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 704  01fa c65232        	ld	a,21042
 705  01fd 1a0c          	or	a,(OFST+0,sp)
 706  01ff c75232        	ld	21042,a
 707                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 709  0202 c65235        	ld	a,21045
 710  0205 a4f3          	and	a,#243
 711  0207 c75235        	ld	21045,a
 712                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 714  020a c65236        	ld	a,21046
 715  020d a4f8          	and	a,#248
 716  020f c75236        	ld	21046,a
 717                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 717                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 719  0212 7b16          	ld	a,(OFST+10,sp)
 720  0214 a407          	and	a,#7
 721  0216 ca5236        	or	a,21046
 722  0219 c75236        	ld	21046,a
 723                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 725  021c 7b17          	ld	a,(OFST+11,sp)
 726  021e a504          	bcp	a,#4
 727  0220 2706          	jreq	L761
 728                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 730  0222 72165235      	bset	21045,#3
 732  0226 2004          	jra	L171
 733  0228               L761:
 734                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 736  0228 72175235      	bres	21045,#3
 737  022c               L171:
 738                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 740  022c 7b17          	ld	a,(OFST+11,sp)
 741  022e a508          	bcp	a,#8
 742  0230 2706          	jreq	L371
 743                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 745  0232 72145235      	bset	21045,#2
 747  0236 2004          	jra	L571
 748  0238               L371:
 749                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 751  0238 72155235      	bres	21045,#2
 752  023c               L571:
 753                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 755  023c 7b16          	ld	a,(OFST+10,sp)
 756  023e a580          	bcp	a,#128
 757  0240 2706          	jreq	L771
 758                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 760  0242 72175236      	bres	21046,#3
 762  0246 200a          	jra	L102
 763  0248               L771:
 764                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 766  0248 7b16          	ld	a,(OFST+10,sp)
 767  024a a408          	and	a,#8
 768  024c ca5236        	or	a,21046
 769  024f c75236        	ld	21046,a
 770  0252               L102:
 771                     ; 176 }
 774  0252 5b0c          	addw	sp,#12
 775  0254 81            	ret
 830                     ; 184 void UART1_Cmd(FunctionalState NewState)
 830                     ; 185 {
 831                     .text:	section	.text,new
 832  0000               _UART1_Cmd:
 836                     ; 186   if (NewState != DISABLE)
 838  0000 4d            	tnz	a
 839  0001 2706          	jreq	L132
 840                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 842  0003 721b5234      	bres	21044,#5
 844  0007 2004          	jra	L332
 845  0009               L132:
 846                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 848  0009 721a5234      	bset	21044,#5
 849  000d               L332:
 850                     ; 196 }
 853  000d 81            	ret
 975                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 975                     ; 212 {
 976                     .text:	section	.text,new
 977  0000               _UART1_ITConfig:
 979  0000 89            	pushw	x
 980  0001 89            	pushw	x
 981       00000002      OFST:	set	2
 984                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 986  0002 7b01          	ld	a,(OFST-1,sp)
 987  0004 97            	ld	xl,a
 990  0005 7b02          	ld	a,(OFST+0,sp)
 991  0007 97            	ld	xl,a
 992                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 994  0008 1e03          	ldw	x,(OFST+1,sp)
 995  000a a30100        	cpw	x,#256
 996  000d 2723          	jreq	L26
 997  000f 1e03          	ldw	x,(OFST+1,sp)
 998  0011 a30277        	cpw	x,#631
 999  0014 271c          	jreq	L26
1000  0016 1e03          	ldw	x,(OFST+1,sp)
1001  0018 a30266        	cpw	x,#614
1002  001b 2715          	jreq	L26
1003  001d 1e03          	ldw	x,(OFST+1,sp)
1004  001f a30205        	cpw	x,#517
1005  0022 270e          	jreq	L26
1006  0024 1e03          	ldw	x,(OFST+1,sp)
1007  0026 a30244        	cpw	x,#580
1008  0029 2707          	jreq	L26
1009  002b 1e03          	ldw	x,(OFST+1,sp)
1010  002d a30346        	cpw	x,#838
1011  0030 2603          	jrne	L06
1012  0032               L26:
1013  0032 4f            	clr	a
1014  0033 2010          	jra	L46
1015  0035               L06:
1016  0035 ae00d8        	ldw	x,#216
1017  0038 89            	pushw	x
1018  0039 ae0000        	ldw	x,#0
1019  003c 89            	pushw	x
1020  003d ae0008        	ldw	x,#L561
1021  0040 cd0000        	call	_assert_failed
1023  0043 5b04          	addw	sp,#4
1024  0045               L46:
1025                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1027  0045 0d07          	tnz	(OFST+5,sp)
1028  0047 2706          	jreq	L07
1029  0049 7b07          	ld	a,(OFST+5,sp)
1030  004b a101          	cp	a,#1
1031  004d 2603          	jrne	L66
1032  004f               L07:
1033  004f 4f            	clr	a
1034  0050 2010          	jra	L27
1035  0052               L66:
1036  0052 ae00d9        	ldw	x,#217
1037  0055 89            	pushw	x
1038  0056 ae0000        	ldw	x,#0
1039  0059 89            	pushw	x
1040  005a ae0008        	ldw	x,#L561
1041  005d cd0000        	call	_assert_failed
1043  0060 5b04          	addw	sp,#4
1044  0062               L27:
1045                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1047  0062 7b03          	ld	a,(OFST+1,sp)
1048  0064 6b01          	ld	(OFST-1,sp),a
1049                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1051  0066 7b04          	ld	a,(OFST+2,sp)
1052  0068 a40f          	and	a,#15
1053  006a 5f            	clrw	x
1054  006b 97            	ld	xl,a
1055  006c a601          	ld	a,#1
1056  006e 5d            	tnzw	x
1057  006f 2704          	jreq	L47
1058  0071               L67:
1059  0071 48            	sll	a
1060  0072 5a            	decw	x
1061  0073 26fc          	jrne	L67
1062  0075               L47:
1063  0075 6b02          	ld	(OFST+0,sp),a
1064                     ; 224   if (NewState != DISABLE)
1066  0077 0d07          	tnz	(OFST+5,sp)
1067  0079 272a          	jreq	L703
1068                     ; 227     if (uartreg == 0x01)
1070  007b 7b01          	ld	a,(OFST-1,sp)
1071  007d a101          	cp	a,#1
1072  007f 260a          	jrne	L113
1073                     ; 229       UART1->CR1 |= itpos;
1075  0081 c65234        	ld	a,21044
1076  0084 1a02          	or	a,(OFST+0,sp)
1077  0086 c75234        	ld	21044,a
1079  0089 2045          	jra	L123
1080  008b               L113:
1081                     ; 231     else if (uartreg == 0x02)
1083  008b 7b01          	ld	a,(OFST-1,sp)
1084  008d a102          	cp	a,#2
1085  008f 260a          	jrne	L513
1086                     ; 233       UART1->CR2 |= itpos;
1088  0091 c65235        	ld	a,21045
1089  0094 1a02          	or	a,(OFST+0,sp)
1090  0096 c75235        	ld	21045,a
1092  0099 2035          	jra	L123
1093  009b               L513:
1094                     ; 237       UART1->CR4 |= itpos;
1096  009b c65237        	ld	a,21047
1097  009e 1a02          	or	a,(OFST+0,sp)
1098  00a0 c75237        	ld	21047,a
1099  00a3 202b          	jra	L123
1100  00a5               L703:
1101                     ; 243     if (uartreg == 0x01)
1103  00a5 7b01          	ld	a,(OFST-1,sp)
1104  00a7 a101          	cp	a,#1
1105  00a9 260b          	jrne	L323
1106                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1108  00ab 7b02          	ld	a,(OFST+0,sp)
1109  00ad 43            	cpl	a
1110  00ae c45234        	and	a,21044
1111  00b1 c75234        	ld	21044,a
1113  00b4 201a          	jra	L123
1114  00b6               L323:
1115                     ; 247     else if (uartreg == 0x02)
1117  00b6 7b01          	ld	a,(OFST-1,sp)
1118  00b8 a102          	cp	a,#2
1119  00ba 260b          	jrne	L723
1120                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1122  00bc 7b02          	ld	a,(OFST+0,sp)
1123  00be 43            	cpl	a
1124  00bf c45235        	and	a,21045
1125  00c2 c75235        	ld	21045,a
1127  00c5 2009          	jra	L123
1128  00c7               L723:
1129                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1131  00c7 7b02          	ld	a,(OFST+0,sp)
1132  00c9 43            	cpl	a
1133  00ca c45237        	and	a,21047
1134  00cd c75237        	ld	21047,a
1135  00d0               L123:
1136                     ; 257 }
1139  00d0 5b04          	addw	sp,#4
1140  00d2 81            	ret
1177                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1177                     ; 266 {
1178                     .text:	section	.text,new
1179  0000               _UART1_HalfDuplexCmd:
1181  0000 88            	push	a
1182       00000000      OFST:	set	0
1185                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1187  0001 4d            	tnz	a
1188  0002 2704          	jreq	L401
1189  0004 a101          	cp	a,#1
1190  0006 2603          	jrne	L201
1191  0008               L401:
1192  0008 4f            	clr	a
1193  0009 2010          	jra	L601
1194  000b               L201:
1195  000b ae010b        	ldw	x,#267
1196  000e 89            	pushw	x
1197  000f ae0000        	ldw	x,#0
1198  0012 89            	pushw	x
1199  0013 ae0008        	ldw	x,#L561
1200  0016 cd0000        	call	_assert_failed
1202  0019 5b04          	addw	sp,#4
1203  001b               L601:
1204                     ; 269   if (NewState != DISABLE)
1206  001b 0d01          	tnz	(OFST+1,sp)
1207  001d 2706          	jreq	L153
1208                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1210  001f 72165238      	bset	21048,#3
1212  0023 2004          	jra	L353
1213  0025               L153:
1214                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1216  0025 72175238      	bres	21048,#3
1217  0029               L353:
1218                     ; 277 }
1221  0029 84            	pop	a
1222  002a 81            	ret
1280                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1280                     ; 286 {
1281                     .text:	section	.text,new
1282  0000               _UART1_IrDAConfig:
1284  0000 88            	push	a
1285       00000000      OFST:	set	0
1288                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1290  0001 a101          	cp	a,#1
1291  0003 2703          	jreq	L411
1292  0005 4d            	tnz	a
1293  0006 2603          	jrne	L211
1294  0008               L411:
1295  0008 4f            	clr	a
1296  0009 2010          	jra	L611
1297  000b               L211:
1298  000b ae011f        	ldw	x,#287
1299  000e 89            	pushw	x
1300  000f ae0000        	ldw	x,#0
1301  0012 89            	pushw	x
1302  0013 ae0008        	ldw	x,#L561
1303  0016 cd0000        	call	_assert_failed
1305  0019 5b04          	addw	sp,#4
1306  001b               L611:
1307                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1309  001b 0d01          	tnz	(OFST+1,sp)
1310  001d 2706          	jreq	L304
1311                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1313  001f 72145238      	bset	21048,#2
1315  0023 2004          	jra	L504
1316  0025               L304:
1317                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1319  0025 72155238      	bres	21048,#2
1320  0029               L504:
1321                     ; 297 }
1324  0029 84            	pop	a
1325  002a 81            	ret
1361                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1361                     ; 306 {
1362                     .text:	section	.text,new
1363  0000               _UART1_IrDACmd:
1365  0000 88            	push	a
1366       00000000      OFST:	set	0
1369                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1371  0001 4d            	tnz	a
1372  0002 2704          	jreq	L421
1373  0004 a101          	cp	a,#1
1374  0006 2603          	jrne	L221
1375  0008               L421:
1376  0008 4f            	clr	a
1377  0009 2010          	jra	L621
1378  000b               L221:
1379  000b ae0134        	ldw	x,#308
1380  000e 89            	pushw	x
1381  000f ae0000        	ldw	x,#0
1382  0012 89            	pushw	x
1383  0013 ae0008        	ldw	x,#L561
1384  0016 cd0000        	call	_assert_failed
1386  0019 5b04          	addw	sp,#4
1387  001b               L621:
1388                     ; 310   if (NewState != DISABLE)
1390  001b 0d01          	tnz	(OFST+1,sp)
1391  001d 2706          	jreq	L524
1392                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1394  001f 72125238      	bset	21048,#1
1396  0023 2004          	jra	L724
1397  0025               L524:
1398                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1400  0025 72135238      	bres	21048,#1
1401  0029               L724:
1402                     ; 320 }
1405  0029 84            	pop	a
1406  002a 81            	ret
1466                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1466                     ; 330 {
1467                     .text:	section	.text,new
1468  0000               _UART1_LINBreakDetectionConfig:
1470  0000 88            	push	a
1471       00000000      OFST:	set	0
1474                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1476  0001 4d            	tnz	a
1477  0002 2704          	jreq	L431
1478  0004 a101          	cp	a,#1
1479  0006 2603          	jrne	L231
1480  0008               L431:
1481  0008 4f            	clr	a
1482  0009 2010          	jra	L631
1483  000b               L231:
1484  000b ae014b        	ldw	x,#331
1485  000e 89            	pushw	x
1486  000f ae0000        	ldw	x,#0
1487  0012 89            	pushw	x
1488  0013 ae0008        	ldw	x,#L561
1489  0016 cd0000        	call	_assert_failed
1491  0019 5b04          	addw	sp,#4
1492  001b               L631:
1493                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1495  001b 0d01          	tnz	(OFST+1,sp)
1496  001d 2706          	jreq	L754
1497                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1499  001f 721a5237      	bset	21047,#5
1501  0023 2004          	jra	L164
1502  0025               L754:
1503                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1505  0025 721b5237      	bres	21047,#5
1506  0029               L164:
1507                     ; 341 }
1510  0029 84            	pop	a
1511  002a 81            	ret
1547                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1547                     ; 350 {
1548                     .text:	section	.text,new
1549  0000               _UART1_LINCmd:
1551  0000 88            	push	a
1552       00000000      OFST:	set	0
1555                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1557  0001 4d            	tnz	a
1558  0002 2704          	jreq	L441
1559  0004 a101          	cp	a,#1
1560  0006 2603          	jrne	L241
1561  0008               L441:
1562  0008 4f            	clr	a
1563  0009 2010          	jra	L641
1564  000b               L241:
1565  000b ae015f        	ldw	x,#351
1566  000e 89            	pushw	x
1567  000f ae0000        	ldw	x,#0
1568  0012 89            	pushw	x
1569  0013 ae0008        	ldw	x,#L561
1570  0016 cd0000        	call	_assert_failed
1572  0019 5b04          	addw	sp,#4
1573  001b               L641:
1574                     ; 353   if (NewState != DISABLE)
1576  001b 0d01          	tnz	(OFST+1,sp)
1577  001d 2706          	jreq	L105
1578                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1580  001f 721c5236      	bset	21046,#6
1582  0023 2004          	jra	L305
1583  0025               L105:
1584                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1586  0025 721d5236      	bres	21046,#6
1587  0029               L305:
1588                     ; 363 }
1591  0029 84            	pop	a
1592  002a 81            	ret
1628                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1628                     ; 372 {
1629                     .text:	section	.text,new
1630  0000               _UART1_SmartCardCmd:
1632  0000 88            	push	a
1633       00000000      OFST:	set	0
1636                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1638  0001 4d            	tnz	a
1639  0002 2704          	jreq	L451
1640  0004 a101          	cp	a,#1
1641  0006 2603          	jrne	L251
1642  0008               L451:
1643  0008 4f            	clr	a
1644  0009 2010          	jra	L651
1645  000b               L251:
1646  000b ae0175        	ldw	x,#373
1647  000e 89            	pushw	x
1648  000f ae0000        	ldw	x,#0
1649  0012 89            	pushw	x
1650  0013 ae0008        	ldw	x,#L561
1651  0016 cd0000        	call	_assert_failed
1653  0019 5b04          	addw	sp,#4
1654  001b               L651:
1655                     ; 375   if (NewState != DISABLE)
1657  001b 0d01          	tnz	(OFST+1,sp)
1658  001d 2706          	jreq	L325
1659                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1661  001f 721a5238      	bset	21048,#5
1663  0023 2004          	jra	L525
1664  0025               L325:
1665                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1667  0025 721b5238      	bres	21048,#5
1668  0029               L525:
1669                     ; 385 }
1672  0029 84            	pop	a
1673  002a 81            	ret
1710                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1710                     ; 395 {
1711                     .text:	section	.text,new
1712  0000               _UART1_SmartCardNACKCmd:
1714  0000 88            	push	a
1715       00000000      OFST:	set	0
1718                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1720  0001 4d            	tnz	a
1721  0002 2704          	jreq	L461
1722  0004 a101          	cp	a,#1
1723  0006 2603          	jrne	L261
1724  0008               L461:
1725  0008 4f            	clr	a
1726  0009 2010          	jra	L661
1727  000b               L261:
1728  000b ae018c        	ldw	x,#396
1729  000e 89            	pushw	x
1730  000f ae0000        	ldw	x,#0
1731  0012 89            	pushw	x
1732  0013 ae0008        	ldw	x,#L561
1733  0016 cd0000        	call	_assert_failed
1735  0019 5b04          	addw	sp,#4
1736  001b               L661:
1737                     ; 398   if (NewState != DISABLE)
1739  001b 0d01          	tnz	(OFST+1,sp)
1740  001d 2706          	jreq	L545
1741                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1743  001f 72185238      	bset	21048,#4
1745  0023 2004          	jra	L745
1746  0025               L545:
1747                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1749  0025 72195238      	bres	21048,#4
1750  0029               L745:
1751                     ; 408 }
1754  0029 84            	pop	a
1755  002a 81            	ret
1813                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1813                     ; 417 {
1814                     .text:	section	.text,new
1815  0000               _UART1_WakeUpConfig:
1817  0000 88            	push	a
1818       00000000      OFST:	set	0
1821                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1823  0001 4d            	tnz	a
1824  0002 2704          	jreq	L471
1825  0004 a108          	cp	a,#8
1826  0006 2603          	jrne	L271
1827  0008               L471:
1828  0008 4f            	clr	a
1829  0009 2010          	jra	L671
1830  000b               L271:
1831  000b ae01a2        	ldw	x,#418
1832  000e 89            	pushw	x
1833  000f ae0000        	ldw	x,#0
1834  0012 89            	pushw	x
1835  0013 ae0008        	ldw	x,#L561
1836  0016 cd0000        	call	_assert_failed
1838  0019 5b04          	addw	sp,#4
1839  001b               L671:
1840                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1842  001b 72175234      	bres	21044,#3
1843                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1845  001f c65234        	ld	a,21044
1846  0022 1a01          	or	a,(OFST+1,sp)
1847  0024 c75234        	ld	21044,a
1848                     ; 422 }
1851  0027 84            	pop	a
1852  0028 81            	ret
1889                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1889                     ; 431 {
1890                     .text:	section	.text,new
1891  0000               _UART1_ReceiverWakeUpCmd:
1893  0000 88            	push	a
1894       00000000      OFST:	set	0
1897                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1899  0001 4d            	tnz	a
1900  0002 2704          	jreq	L402
1901  0004 a101          	cp	a,#1
1902  0006 2603          	jrne	L202
1903  0008               L402:
1904  0008 4f            	clr	a
1905  0009 2010          	jra	L602
1906  000b               L202:
1907  000b ae01b0        	ldw	x,#432
1908  000e 89            	pushw	x
1909  000f ae0000        	ldw	x,#0
1910  0012 89            	pushw	x
1911  0013 ae0008        	ldw	x,#L561
1912  0016 cd0000        	call	_assert_failed
1914  0019 5b04          	addw	sp,#4
1915  001b               L602:
1916                     ; 434   if (NewState != DISABLE)
1918  001b 0d01          	tnz	(OFST+1,sp)
1919  001d 2706          	jreq	L516
1920                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1922  001f 72125235      	bset	21045,#1
1924  0023 2004          	jra	L716
1925  0025               L516:
1926                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1928  0025 72135235      	bres	21045,#1
1929  0029               L716:
1930                     ; 444 }
1933  0029 84            	pop	a
1934  002a 81            	ret
1957                     ; 451 uint8_t UART1_ReceiveData8(void)
1957                     ; 452 {
1958                     .text:	section	.text,new
1959  0000               _UART1_ReceiveData8:
1963                     ; 453   return ((uint8_t)UART1->DR);
1965  0000 c65231        	ld	a,21041
1968  0003 81            	ret
2000                     ; 461 uint16_t UART1_ReceiveData9(void)
2000                     ; 462 {
2001                     .text:	section	.text,new
2002  0000               _UART1_ReceiveData9:
2004  0000 89            	pushw	x
2005       00000002      OFST:	set	2
2008                     ; 463   uint16_t temp = 0;
2010  0001 5f            	clrw	x
2011  0002 1f01          	ldw	(OFST-1,sp),x
2012                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2014  0004 c65234        	ld	a,21044
2015  0007 5f            	clrw	x
2016  0008 a480          	and	a,#128
2017  000a 5f            	clrw	x
2018  000b 02            	rlwa	x,a
2019  000c 58            	sllw	x
2020  000d 1f01          	ldw	(OFST-1,sp),x
2021                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2023  000f c65231        	ld	a,21041
2024  0012 5f            	clrw	x
2025  0013 97            	ld	xl,a
2026  0014 01            	rrwa	x,a
2027  0015 1a02          	or	a,(OFST+0,sp)
2028  0017 01            	rrwa	x,a
2029  0018 1a01          	or	a,(OFST-1,sp)
2030  001a 01            	rrwa	x,a
2031  001b 01            	rrwa	x,a
2032  001c a4ff          	and	a,#255
2033  001e 01            	rrwa	x,a
2034  001f a401          	and	a,#1
2035  0021 01            	rrwa	x,a
2038  0022 5b02          	addw	sp,#2
2039  0024 81            	ret
2071                     ; 474 void UART1_SendData8(uint8_t Data)
2071                     ; 475 {
2072                     .text:	section	.text,new
2073  0000               _UART1_SendData8:
2077                     ; 477   UART1->DR = Data;
2079  0000 c75231        	ld	21041,a
2080                     ; 478 }
2083  0003 81            	ret
2115                     ; 486 void UART1_SendData9(uint16_t Data)
2115                     ; 487 {
2116                     .text:	section	.text,new
2117  0000               _UART1_SendData9:
2119  0000 89            	pushw	x
2120       00000000      OFST:	set	0
2123                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2125  0001 721d5234      	bres	21044,#6
2126                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2128  0005 54            	srlw	x
2129  0006 54            	srlw	x
2130  0007 9f            	ld	a,xl
2131  0008 a440          	and	a,#64
2132  000a ca5234        	or	a,21044
2133  000d c75234        	ld	21044,a
2134                     ; 493   UART1->DR   = (uint8_t)(Data);
2136  0010 7b02          	ld	a,(OFST+2,sp)
2137  0012 c75231        	ld	21041,a
2138                     ; 494 }
2141  0015 85            	popw	x
2142  0016 81            	ret
2165                     ; 501 void UART1_SendBreak(void)
2165                     ; 502 {
2166                     .text:	section	.text,new
2167  0000               _UART1_SendBreak:
2171                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2173  0000 72105235      	bset	21045,#0
2174                     ; 504 }
2177  0004 81            	ret
2210                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2210                     ; 512 {
2211                     .text:	section	.text,new
2212  0000               _UART1_SetAddress:
2214  0000 88            	push	a
2215       00000000      OFST:	set	0
2218                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2220  0001 a110          	cp	a,#16
2221  0003 2403          	jruge	L422
2222  0005 4f            	clr	a
2223  0006 2010          	jra	L622
2224  0008               L422:
2225  0008 ae0202        	ldw	x,#514
2226  000b 89            	pushw	x
2227  000c ae0000        	ldw	x,#0
2228  000f 89            	pushw	x
2229  0010 ae0008        	ldw	x,#L561
2230  0013 cd0000        	call	_assert_failed
2232  0016 5b04          	addw	sp,#4
2233  0018               L622:
2234                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2236  0018 c65237        	ld	a,21047
2237  001b a4f0          	and	a,#240
2238  001d c75237        	ld	21047,a
2239                     ; 519   UART1->CR4 |= UART1_Address;
2241  0020 c65237        	ld	a,21047
2242  0023 1a01          	or	a,(OFST+1,sp)
2243  0025 c75237        	ld	21047,a
2244                     ; 520 }
2247  0028 84            	pop	a
2248  0029 81            	ret
2280                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2280                     ; 529 {
2281                     .text:	section	.text,new
2282  0000               _UART1_SetGuardTime:
2286                     ; 531   UART1->GTR = UART1_GuardTime;
2288  0000 c75239        	ld	21049,a
2289                     ; 532 }
2292  0003 81            	ret
2324                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2324                     ; 557 {
2325                     .text:	section	.text,new
2326  0000               _UART1_SetPrescaler:
2330                     ; 559   UART1->PSCR = UART1_Prescaler;
2332  0000 c7523a        	ld	21050,a
2333                     ; 560 }
2336  0003 81            	ret
2480                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2480                     ; 569 {
2481                     .text:	section	.text,new
2482  0000               _UART1_GetFlagStatus:
2484  0000 89            	pushw	x
2485  0001 88            	push	a
2486       00000001      OFST:	set	1
2489                     ; 570   FlagStatus status = RESET;
2491  0002 0f01          	clr	(OFST+0,sp)
2492                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2494  0004 a30080        	cpw	x,#128
2495  0007 272d          	jreq	L042
2496  0009 a30040        	cpw	x,#64
2497  000c 2728          	jreq	L042
2498  000e a30020        	cpw	x,#32
2499  0011 2723          	jreq	L042
2500  0013 a30010        	cpw	x,#16
2501  0016 271e          	jreq	L042
2502  0018 a30008        	cpw	x,#8
2503  001b 2719          	jreq	L042
2504  001d a30004        	cpw	x,#4
2505  0020 2714          	jreq	L042
2506  0022 a30002        	cpw	x,#2
2507  0025 270f          	jreq	L042
2508  0027 a30001        	cpw	x,#1
2509  002a 270a          	jreq	L042
2510  002c a30101        	cpw	x,#257
2511  002f 2705          	jreq	L042
2512  0031 a30210        	cpw	x,#528
2513  0034 2603          	jrne	L632
2514  0036               L042:
2515  0036 4f            	clr	a
2516  0037 2010          	jra	L242
2517  0039               L632:
2518  0039 ae023d        	ldw	x,#573
2519  003c 89            	pushw	x
2520  003d ae0000        	ldw	x,#0
2521  0040 89            	pushw	x
2522  0041 ae0008        	ldw	x,#L561
2523  0044 cd0000        	call	_assert_failed
2525  0047 5b04          	addw	sp,#4
2526  0049               L242:
2527                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2529  0049 1e02          	ldw	x,(OFST+1,sp)
2530  004b a30210        	cpw	x,#528
2531  004e 2611          	jrne	L3301
2532                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2534  0050 c65237        	ld	a,21047
2535  0053 1503          	bcp	a,(OFST+2,sp)
2536  0055 2706          	jreq	L5301
2537                     ; 582       status = SET;
2539  0057 a601          	ld	a,#1
2540  0059 6b01          	ld	(OFST+0,sp),a
2542  005b 202b          	jra	L1401
2543  005d               L5301:
2544                     ; 587       status = RESET;
2546  005d 0f01          	clr	(OFST+0,sp)
2547  005f 2027          	jra	L1401
2548  0061               L3301:
2549                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2551  0061 1e02          	ldw	x,(OFST+1,sp)
2552  0063 a30101        	cpw	x,#257
2553  0066 2611          	jrne	L3401
2554                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2556  0068 c65235        	ld	a,21045
2557  006b 1503          	bcp	a,(OFST+2,sp)
2558  006d 2706          	jreq	L5401
2559                     ; 595       status = SET;
2561  006f a601          	ld	a,#1
2562  0071 6b01          	ld	(OFST+0,sp),a
2564  0073 2013          	jra	L1401
2565  0075               L5401:
2566                     ; 600       status = RESET;
2568  0075 0f01          	clr	(OFST+0,sp)
2569  0077 200f          	jra	L1401
2570  0079               L3401:
2571                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2573  0079 c65230        	ld	a,21040
2574  007c 1503          	bcp	a,(OFST+2,sp)
2575  007e 2706          	jreq	L3501
2576                     ; 608       status = SET;
2578  0080 a601          	ld	a,#1
2579  0082 6b01          	ld	(OFST+0,sp),a
2581  0084 2002          	jra	L1401
2582  0086               L3501:
2583                     ; 613       status = RESET;
2585  0086 0f01          	clr	(OFST+0,sp)
2586  0088               L1401:
2587                     ; 617   return status;
2589  0088 7b01          	ld	a,(OFST+0,sp)
2592  008a 5b03          	addw	sp,#3
2593  008c 81            	ret
2629                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2629                     ; 647 {
2630                     .text:	section	.text,new
2631  0000               _UART1_ClearFlag:
2633  0000 89            	pushw	x
2634       00000000      OFST:	set	0
2637                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2639  0001 a30020        	cpw	x,#32
2640  0004 2705          	jreq	L052
2641  0006 a30210        	cpw	x,#528
2642  0009 2603          	jrne	L642
2643  000b               L052:
2644  000b 4f            	clr	a
2645  000c 2010          	jra	L252
2646  000e               L642:
2647  000e ae0288        	ldw	x,#648
2648  0011 89            	pushw	x
2649  0012 ae0000        	ldw	x,#0
2650  0015 89            	pushw	x
2651  0016 ae0008        	ldw	x,#L561
2652  0019 cd0000        	call	_assert_failed
2654  001c 5b04          	addw	sp,#4
2655  001e               L252:
2656                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2658  001e 1e01          	ldw	x,(OFST+1,sp)
2659  0020 a30020        	cpw	x,#32
2660  0023 2606          	jrne	L5701
2661                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2663  0025 35df5230      	mov	21040,#223
2665  0029 2004          	jra	L7701
2666  002b               L5701:
2667                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2669  002b 72195237      	bres	21047,#4
2670  002f               L7701:
2671                     ; 660 }
2674  002f 85            	popw	x
2675  0030 81            	ret
2750                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2750                     ; 676 {
2751                     .text:	section	.text,new
2752  0000               _UART1_GetITStatus:
2754  0000 89            	pushw	x
2755  0001 89            	pushw	x
2756       00000002      OFST:	set	2
2759                     ; 677   ITStatus pendingbitstatus = RESET;
2761  0002 7b02          	ld	a,(OFST+0,sp)
2762  0004 97            	ld	xl,a
2763                     ; 678   uint8_t itpos = 0;
2765  0005 7b01          	ld	a,(OFST-1,sp)
2766  0007 97            	ld	xl,a
2767                     ; 679   uint8_t itmask1 = 0;
2769  0008 7b02          	ld	a,(OFST+0,sp)
2770  000a 97            	ld	xl,a
2771                     ; 680   uint8_t itmask2 = 0;
2773  000b 7b02          	ld	a,(OFST+0,sp)
2774  000d 97            	ld	xl,a
2775                     ; 681   uint8_t enablestatus = 0;
2777  000e 7b02          	ld	a,(OFST+0,sp)
2778  0010 97            	ld	xl,a
2779                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2781  0011 1e03          	ldw	x,(OFST+1,sp)
2782  0013 a30277        	cpw	x,#631
2783  0016 272a          	jreq	L062
2784  0018 1e03          	ldw	x,(OFST+1,sp)
2785  001a a30266        	cpw	x,#614
2786  001d 2723          	jreq	L062
2787  001f 1e03          	ldw	x,(OFST+1,sp)
2788  0021 a30255        	cpw	x,#597
2789  0024 271c          	jreq	L062
2790  0026 1e03          	ldw	x,(OFST+1,sp)
2791  0028 a30244        	cpw	x,#580
2792  002b 2715          	jreq	L062
2793  002d 1e03          	ldw	x,(OFST+1,sp)
2794  002f a30235        	cpw	x,#565
2795  0032 270e          	jreq	L062
2796  0034 1e03          	ldw	x,(OFST+1,sp)
2797  0036 a30346        	cpw	x,#838
2798  0039 2707          	jreq	L062
2799  003b 1e03          	ldw	x,(OFST+1,sp)
2800  003d a30100        	cpw	x,#256
2801  0040 2603          	jrne	L652
2802  0042               L062:
2803  0042 4f            	clr	a
2804  0043 2010          	jra	L262
2805  0045               L652:
2806  0045 ae02ac        	ldw	x,#684
2807  0048 89            	pushw	x
2808  0049 ae0000        	ldw	x,#0
2809  004c 89            	pushw	x
2810  004d ae0008        	ldw	x,#L561
2811  0050 cd0000        	call	_assert_failed
2813  0053 5b04          	addw	sp,#4
2814  0055               L262:
2815                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2817  0055 7b04          	ld	a,(OFST+2,sp)
2818  0057 a40f          	and	a,#15
2819  0059 5f            	clrw	x
2820  005a 97            	ld	xl,a
2821  005b a601          	ld	a,#1
2822  005d 5d            	tnzw	x
2823  005e 2704          	jreq	L462
2824  0060               L662:
2825  0060 48            	sll	a
2826  0061 5a            	decw	x
2827  0062 26fc          	jrne	L662
2828  0064               L462:
2829  0064 6b01          	ld	(OFST-1,sp),a
2830                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2832  0066 7b04          	ld	a,(OFST+2,sp)
2833  0068 4e            	swap	a
2834  0069 a40f          	and	a,#15
2835  006b 6b02          	ld	(OFST+0,sp),a
2836                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2838  006d 7b02          	ld	a,(OFST+0,sp)
2839  006f 5f            	clrw	x
2840  0070 97            	ld	xl,a
2841  0071 a601          	ld	a,#1
2842  0073 5d            	tnzw	x
2843  0074 2704          	jreq	L072
2844  0076               L272:
2845  0076 48            	sll	a
2846  0077 5a            	decw	x
2847  0078 26fc          	jrne	L272
2848  007a               L072:
2849  007a 6b02          	ld	(OFST+0,sp),a
2850                     ; 695   if (UART1_IT == UART1_IT_PE)
2852  007c 1e03          	ldw	x,(OFST+1,sp)
2853  007e a30100        	cpw	x,#256
2854  0081 261c          	jrne	L3311
2855                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2857  0083 c65234        	ld	a,21044
2858  0086 1402          	and	a,(OFST+0,sp)
2859  0088 6b02          	ld	(OFST+0,sp),a
2860                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2862  008a c65230        	ld	a,21040
2863  008d 1501          	bcp	a,(OFST-1,sp)
2864  008f 270a          	jreq	L5311
2866  0091 0d02          	tnz	(OFST+0,sp)
2867  0093 2706          	jreq	L5311
2868                     ; 704       pendingbitstatus = SET;
2870  0095 a601          	ld	a,#1
2871  0097 6b02          	ld	(OFST+0,sp),a
2873  0099 2041          	jra	L1411
2874  009b               L5311:
2875                     ; 709       pendingbitstatus = RESET;
2877  009b 0f02          	clr	(OFST+0,sp)
2878  009d 203d          	jra	L1411
2879  009f               L3311:
2880                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2882  009f 1e03          	ldw	x,(OFST+1,sp)
2883  00a1 a30346        	cpw	x,#838
2884  00a4 261c          	jrne	L3411
2885                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2887  00a6 c65237        	ld	a,21047
2888  00a9 1402          	and	a,(OFST+0,sp)
2889  00ab 6b02          	ld	(OFST+0,sp),a
2890                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2892  00ad c65237        	ld	a,21047
2893  00b0 1501          	bcp	a,(OFST-1,sp)
2894  00b2 270a          	jreq	L5411
2896  00b4 0d02          	tnz	(OFST+0,sp)
2897  00b6 2706          	jreq	L5411
2898                     ; 721       pendingbitstatus = SET;
2900  00b8 a601          	ld	a,#1
2901  00ba 6b02          	ld	(OFST+0,sp),a
2903  00bc 201e          	jra	L1411
2904  00be               L5411:
2905                     ; 726       pendingbitstatus = RESET;
2907  00be 0f02          	clr	(OFST+0,sp)
2908  00c0 201a          	jra	L1411
2909  00c2               L3411:
2910                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2912  00c2 c65235        	ld	a,21045
2913  00c5 1402          	and	a,(OFST+0,sp)
2914  00c7 6b02          	ld	(OFST+0,sp),a
2915                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2917  00c9 c65230        	ld	a,21040
2918  00cc 1501          	bcp	a,(OFST-1,sp)
2919  00ce 270a          	jreq	L3511
2921  00d0 0d02          	tnz	(OFST+0,sp)
2922  00d2 2706          	jreq	L3511
2923                     ; 737       pendingbitstatus = SET;
2925  00d4 a601          	ld	a,#1
2926  00d6 6b02          	ld	(OFST+0,sp),a
2928  00d8 2002          	jra	L1411
2929  00da               L3511:
2930                     ; 742       pendingbitstatus = RESET;
2932  00da 0f02          	clr	(OFST+0,sp)
2933  00dc               L1411:
2934                     ; 747   return  pendingbitstatus;
2936  00dc 7b02          	ld	a,(OFST+0,sp)
2939  00de 5b04          	addw	sp,#4
2940  00e0 81            	ret
2977                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2977                     ; 776 {
2978                     .text:	section	.text,new
2979  0000               _UART1_ClearITPendingBit:
2981  0000 89            	pushw	x
2982       00000000      OFST:	set	0
2985                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2987  0001 a30255        	cpw	x,#597
2988  0004 2705          	jreq	L003
2989  0006 a30346        	cpw	x,#838
2990  0009 2603          	jrne	L672
2991  000b               L003:
2992  000b 4f            	clr	a
2993  000c 2010          	jra	L203
2994  000e               L672:
2995  000e ae0309        	ldw	x,#777
2996  0011 89            	pushw	x
2997  0012 ae0000        	ldw	x,#0
2998  0015 89            	pushw	x
2999  0016 ae0008        	ldw	x,#L561
3000  0019 cd0000        	call	_assert_failed
3002  001c 5b04          	addw	sp,#4
3003  001e               L203:
3004                     ; 780   if (UART1_IT == UART1_IT_RXNE)
3006  001e 1e01          	ldw	x,(OFST+1,sp)
3007  0020 a30255        	cpw	x,#597
3008  0023 2606          	jrne	L5711
3009                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3011  0025 35df5230      	mov	21040,#223
3013  0029 2004          	jra	L7711
3014  002b               L5711:
3015                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3017  002b 72195237      	bres	21047,#4
3018  002f               L7711:
3019                     ; 789 }
3022  002f 85            	popw	x
3023  0030 81            	ret
3036                     	xdef	_UART1_ClearITPendingBit
3037                     	xdef	_UART1_GetITStatus
3038                     	xdef	_UART1_ClearFlag
3039                     	xdef	_UART1_GetFlagStatus
3040                     	xdef	_UART1_SetPrescaler
3041                     	xdef	_UART1_SetGuardTime
3042                     	xdef	_UART1_SetAddress
3043                     	xdef	_UART1_SendBreak
3044                     	xdef	_UART1_SendData9
3045                     	xdef	_UART1_SendData8
3046                     	xdef	_UART1_ReceiveData9
3047                     	xdef	_UART1_ReceiveData8
3048                     	xdef	_UART1_ReceiverWakeUpCmd
3049                     	xdef	_UART1_WakeUpConfig
3050                     	xdef	_UART1_SmartCardNACKCmd
3051                     	xdef	_UART1_SmartCardCmd
3052                     	xdef	_UART1_LINCmd
3053                     	xdef	_UART1_LINBreakDetectionConfig
3054                     	xdef	_UART1_IrDACmd
3055                     	xdef	_UART1_IrDAConfig
3056                     	xdef	_UART1_HalfDuplexCmd
3057                     	xdef	_UART1_ITConfig
3058                     	xdef	_UART1_Cmd
3059                     	xdef	_UART1_Init
3060                     	xdef	_UART1_DeInit
3061                     	xref	_assert_failed
3062                     	xref	_CLK_GetClockFreq
3063                     	switch	.const
3064  0008               L561:
3065  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3066  001a 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3067  002c 72697665725c  	dc.b	"river\src\stm8s_ua"
3068  003e 7274312e6300  	dc.b	"rt1.c",0
3069                     	xref.b	c_lreg
3089                     	xref	c_lursh
3090                     	xref	c_lsub
3091                     	xref	c_smul
3092                     	xref	c_ludv
3093                     	xref	c_rtol
3094                     	xref	c_llsh
3095                     	xref	c_lcmp
3096                     	xref	c_ltor
3097                     	end
