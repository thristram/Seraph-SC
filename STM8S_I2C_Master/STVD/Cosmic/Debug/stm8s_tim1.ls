   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 58 void TIM1_DeInit(void)
  32                     ; 59 {
  34                     .text:	section	.text,new
  35  0000               _TIM1_DeInit:
  39                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  41  0000 725f5250      	clr	21072
  42                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  44  0004 725f5251      	clr	21073
  45                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  47  0008 725f5252      	clr	21074
  48                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  50  000c 725f5253      	clr	21075
  51                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  53  0010 725f5254      	clr	21076
  54                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  56  0014 725f5256      	clr	21078
  57                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  59  0018 725f525c      	clr	21084
  60                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  62  001c 725f525d      	clr	21085
  63                     ; 70   TIM1->CCMR1 = 0x01;
  65  0020 35015258      	mov	21080,#1
  66                     ; 71   TIM1->CCMR2 = 0x01;
  68  0024 35015259      	mov	21081,#1
  69                     ; 72   TIM1->CCMR3 = 0x01;
  71  0028 3501525a      	mov	21082,#1
  72                     ; 73   TIM1->CCMR4 = 0x01;
  74  002c 3501525b      	mov	21083,#1
  75                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  77  0030 725f525c      	clr	21084
  78                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  80  0034 725f525d      	clr	21085
  81                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  83  0038 725f5258      	clr	21080
  84                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  86  003c 725f5259      	clr	21081
  87                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  89  0040 725f525a      	clr	21082
  90                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  92  0044 725f525b      	clr	21083
  93                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  95  0048 725f525e      	clr	21086
  96                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  98  004c 725f525f      	clr	21087
  99                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 101  0050 725f5260      	clr	21088
 102                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 104  0054 725f5261      	clr	21089
 105                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 107  0058 35ff5262      	mov	21090,#255
 108                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 110  005c 35ff5263      	mov	21091,#255
 111                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 113  0060 725f5265      	clr	21093
 114                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 116  0064 725f5266      	clr	21094
 117                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 119  0068 725f5267      	clr	21095
 120                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 122  006c 725f5268      	clr	21096
 123                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 125  0070 725f5269      	clr	21097
 126                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 128  0074 725f526a      	clr	21098
 129                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 131  0078 725f526b      	clr	21099
 132                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 134  007c 725f526c      	clr	21100
 135                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 137  0080 725f526f      	clr	21103
 138                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 140  0084 35015257      	mov	21079,#1
 141                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 143  0088 725f526e      	clr	21102
 144                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 146  008c 725f526d      	clr	21101
 147                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 149  0090 725f5264      	clr	21092
 150                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 152  0094 725f5255      	clr	21077
 153                     ; 101 }
 156  0098 81            	ret
 266                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 266                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 266                     ; 113                        uint16_t TIM1_Period,
 266                     ; 114                        uint8_t TIM1_RepetitionCounter)
 266                     ; 115 {
 267                     .text:	section	.text,new
 268  0000               _TIM1_TimeBaseInit:
 270  0000 89            	pushw	x
 271       00000000      OFST:	set	0
 274                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 276  0001 0d05          	tnz	(OFST+5,sp)
 277  0003 2718          	jreq	L21
 278  0005 7b05          	ld	a,(OFST+5,sp)
 279  0007 a110          	cp	a,#16
 280  0009 2712          	jreq	L21
 281  000b 7b05          	ld	a,(OFST+5,sp)
 282  000d a120          	cp	a,#32
 283  000f 270c          	jreq	L21
 284  0011 7b05          	ld	a,(OFST+5,sp)
 285  0013 a140          	cp	a,#64
 286  0015 2706          	jreq	L21
 287  0017 7b05          	ld	a,(OFST+5,sp)
 288  0019 a160          	cp	a,#96
 289  001b 2603          	jrne	L01
 290  001d               L21:
 291  001d 4f            	clr	a
 292  001e 2010          	jra	L41
 293  0020               L01:
 294  0020 ae0075        	ldw	x,#117
 295  0023 89            	pushw	x
 296  0024 ae0000        	ldw	x,#0
 297  0027 89            	pushw	x
 298  0028 ae0000        	ldw	x,#L101
 299  002b cd0000        	call	_assert_failed
 301  002e 5b04          	addw	sp,#4
 302  0030               L41:
 303                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 305  0030 7b06          	ld	a,(OFST+6,sp)
 306  0032 c75262        	ld	21090,a
 307                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 309  0035 7b07          	ld	a,(OFST+7,sp)
 310  0037 c75263        	ld	21091,a
 311                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 313  003a 7b01          	ld	a,(OFST+1,sp)
 314  003c c75260        	ld	21088,a
 315                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 317  003f 7b02          	ld	a,(OFST+2,sp)
 318  0041 c75261        	ld	21089,a
 319                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 319                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 321  0044 c65250        	ld	a,21072
 322  0047 a48f          	and	a,#143
 323  0049 1a05          	or	a,(OFST+5,sp)
 324  004b c75250        	ld	21072,a
 325                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 327  004e 7b08          	ld	a,(OFST+8,sp)
 328  0050 c75264        	ld	21092,a
 329                     ; 133 }
 332  0053 85            	popw	x
 333  0054 81            	ret
 619                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 619                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 619                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 619                     ; 157                   uint16_t TIM1_Pulse,
 619                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 619                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 619                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 619                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 619                     ; 162 {
 620                     .text:	section	.text,new
 621  0000               _TIM1_OC1Init:
 623  0000 89            	pushw	x
 624  0001 5203          	subw	sp,#3
 625       00000003      OFST:	set	3
 628                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 630  0003 9e            	ld	a,xh
 631  0004 4d            	tnz	a
 632  0005 2719          	jreq	L22
 633  0007 9e            	ld	a,xh
 634  0008 a110          	cp	a,#16
 635  000a 2714          	jreq	L22
 636  000c 9e            	ld	a,xh
 637  000d a120          	cp	a,#32
 638  000f 270f          	jreq	L22
 639  0011 9e            	ld	a,xh
 640  0012 a130          	cp	a,#48
 641  0014 270a          	jreq	L22
 642  0016 9e            	ld	a,xh
 643  0017 a160          	cp	a,#96
 644  0019 2705          	jreq	L22
 645  001b 9e            	ld	a,xh
 646  001c a170          	cp	a,#112
 647  001e 2603          	jrne	L02
 648  0020               L22:
 649  0020 4f            	clr	a
 650  0021 2010          	jra	L42
 651  0023               L02:
 652  0023 ae00a4        	ldw	x,#164
 653  0026 89            	pushw	x
 654  0027 ae0000        	ldw	x,#0
 655  002a 89            	pushw	x
 656  002b ae0000        	ldw	x,#L101
 657  002e cd0000        	call	_assert_failed
 659  0031 5b04          	addw	sp,#4
 660  0033               L42:
 661                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 663  0033 0d05          	tnz	(OFST+2,sp)
 664  0035 2706          	jreq	L03
 665  0037 7b05          	ld	a,(OFST+2,sp)
 666  0039 a111          	cp	a,#17
 667  003b 2603          	jrne	L62
 668  003d               L03:
 669  003d 4f            	clr	a
 670  003e 2010          	jra	L23
 671  0040               L62:
 672  0040 ae00a5        	ldw	x,#165
 673  0043 89            	pushw	x
 674  0044 ae0000        	ldw	x,#0
 675  0047 89            	pushw	x
 676  0048 ae0000        	ldw	x,#L101
 677  004b cd0000        	call	_assert_failed
 679  004e 5b04          	addw	sp,#4
 680  0050               L23:
 681                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 683  0050 0d08          	tnz	(OFST+5,sp)
 684  0052 2706          	jreq	L63
 685  0054 7b08          	ld	a,(OFST+5,sp)
 686  0056 a144          	cp	a,#68
 687  0058 2603          	jrne	L43
 688  005a               L63:
 689  005a 4f            	clr	a
 690  005b 2010          	jra	L04
 691  005d               L43:
 692  005d ae00a6        	ldw	x,#166
 693  0060 89            	pushw	x
 694  0061 ae0000        	ldw	x,#0
 695  0064 89            	pushw	x
 696  0065 ae0000        	ldw	x,#L101
 697  0068 cd0000        	call	_assert_failed
 699  006b 5b04          	addw	sp,#4
 700  006d               L04:
 701                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 703  006d 0d0b          	tnz	(OFST+8,sp)
 704  006f 2706          	jreq	L44
 705  0071 7b0b          	ld	a,(OFST+8,sp)
 706  0073 a122          	cp	a,#34
 707  0075 2603          	jrne	L24
 708  0077               L44:
 709  0077 4f            	clr	a
 710  0078 2010          	jra	L64
 711  007a               L24:
 712  007a ae00a7        	ldw	x,#167
 713  007d 89            	pushw	x
 714  007e ae0000        	ldw	x,#0
 715  0081 89            	pushw	x
 716  0082 ae0000        	ldw	x,#L101
 717  0085 cd0000        	call	_assert_failed
 719  0088 5b04          	addw	sp,#4
 720  008a               L64:
 721                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 723  008a 0d0c          	tnz	(OFST+9,sp)
 724  008c 2706          	jreq	L25
 725  008e 7b0c          	ld	a,(OFST+9,sp)
 726  0090 a188          	cp	a,#136
 727  0092 2603          	jrne	L05
 728  0094               L25:
 729  0094 4f            	clr	a
 730  0095 2010          	jra	L45
 731  0097               L05:
 732  0097 ae00a8        	ldw	x,#168
 733  009a 89            	pushw	x
 734  009b ae0000        	ldw	x,#0
 735  009e 89            	pushw	x
 736  009f ae0000        	ldw	x,#L101
 737  00a2 cd0000        	call	_assert_failed
 739  00a5 5b04          	addw	sp,#4
 740  00a7               L45:
 741                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 743  00a7 7b0d          	ld	a,(OFST+10,sp)
 744  00a9 a155          	cp	a,#85
 745  00ab 2704          	jreq	L06
 746  00ad 0d0d          	tnz	(OFST+10,sp)
 747  00af 2603          	jrne	L65
 748  00b1               L06:
 749  00b1 4f            	clr	a
 750  00b2 2010          	jra	L26
 751  00b4               L65:
 752  00b4 ae00a9        	ldw	x,#169
 753  00b7 89            	pushw	x
 754  00b8 ae0000        	ldw	x,#0
 755  00bb 89            	pushw	x
 756  00bc ae0000        	ldw	x,#L101
 757  00bf cd0000        	call	_assert_failed
 759  00c2 5b04          	addw	sp,#4
 760  00c4               L26:
 761                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 763  00c4 7b0e          	ld	a,(OFST+11,sp)
 764  00c6 a12a          	cp	a,#42
 765  00c8 2704          	jreq	L66
 766  00ca 0d0e          	tnz	(OFST+11,sp)
 767  00cc 2603          	jrne	L46
 768  00ce               L66:
 769  00ce 4f            	clr	a
 770  00cf 2010          	jra	L07
 771  00d1               L46:
 772  00d1 ae00aa        	ldw	x,#170
 773  00d4 89            	pushw	x
 774  00d5 ae0000        	ldw	x,#0
 775  00d8 89            	pushw	x
 776  00d9 ae0000        	ldw	x,#L101
 777  00dc cd0000        	call	_assert_failed
 779  00df 5b04          	addw	sp,#4
 780  00e1               L07:
 781                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 781                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 783  00e1 c6525c        	ld	a,21084
 784  00e4 a4f0          	and	a,#240
 785  00e6 c7525c        	ld	21084,a
 786                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 786                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 786                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 786                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 788  00e9 7b0c          	ld	a,(OFST+9,sp)
 789  00eb a408          	and	a,#8
 790  00ed 6b03          	ld	(OFST+0,sp),a
 791  00ef 7b0b          	ld	a,(OFST+8,sp)
 792  00f1 a402          	and	a,#2
 793  00f3 1a03          	or	a,(OFST+0,sp)
 794  00f5 6b02          	ld	(OFST-1,sp),a
 795  00f7 7b08          	ld	a,(OFST+5,sp)
 796  00f9 a404          	and	a,#4
 797  00fb 6b01          	ld	(OFST-2,sp),a
 798  00fd 7b05          	ld	a,(OFST+2,sp)
 799  00ff a401          	and	a,#1
 800  0101 1a01          	or	a,(OFST-2,sp)
 801  0103 1a02          	or	a,(OFST-1,sp)
 802  0105 ca525c        	or	a,21084
 803  0108 c7525c        	ld	21084,a
 804                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 804                     ; 185                           (uint8_t)TIM1_OCMode);
 806  010b c65258        	ld	a,21080
 807  010e a48f          	and	a,#143
 808  0110 1a04          	or	a,(OFST+1,sp)
 809  0112 c75258        	ld	21080,a
 810                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 812  0115 c6526f        	ld	a,21103
 813  0118 a4fc          	and	a,#252
 814  011a c7526f        	ld	21103,a
 815                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 815                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 817  011d 7b0e          	ld	a,(OFST+11,sp)
 818  011f a402          	and	a,#2
 819  0121 6b03          	ld	(OFST+0,sp),a
 820  0123 7b0d          	ld	a,(OFST+10,sp)
 821  0125 a401          	and	a,#1
 822  0127 1a03          	or	a,(OFST+0,sp)
 823  0129 ca526f        	or	a,21103
 824  012c c7526f        	ld	21103,a
 825                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 827  012f 7b09          	ld	a,(OFST+6,sp)
 828  0131 c75265        	ld	21093,a
 829                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 831  0134 7b0a          	ld	a,(OFST+7,sp)
 832  0136 c75266        	ld	21094,a
 833                     ; 196 }
 836  0139 5b05          	addw	sp,#5
 837  013b 81            	ret
 942                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 942                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 942                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 942                     ; 220                   uint16_t TIM1_Pulse,
 942                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 942                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 942                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 942                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 942                     ; 225 {
 943                     .text:	section	.text,new
 944  0000               _TIM1_OC2Init:
 946  0000 89            	pushw	x
 947  0001 5203          	subw	sp,#3
 948       00000003      OFST:	set	3
 951                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 953  0003 9e            	ld	a,xh
 954  0004 4d            	tnz	a
 955  0005 2719          	jreq	L67
 956  0007 9e            	ld	a,xh
 957  0008 a110          	cp	a,#16
 958  000a 2714          	jreq	L67
 959  000c 9e            	ld	a,xh
 960  000d a120          	cp	a,#32
 961  000f 270f          	jreq	L67
 962  0011 9e            	ld	a,xh
 963  0012 a130          	cp	a,#48
 964  0014 270a          	jreq	L67
 965  0016 9e            	ld	a,xh
 966  0017 a160          	cp	a,#96
 967  0019 2705          	jreq	L67
 968  001b 9e            	ld	a,xh
 969  001c a170          	cp	a,#112
 970  001e 2603          	jrne	L47
 971  0020               L67:
 972  0020 4f            	clr	a
 973  0021 2010          	jra	L001
 974  0023               L47:
 975  0023 ae00e3        	ldw	x,#227
 976  0026 89            	pushw	x
 977  0027 ae0000        	ldw	x,#0
 978  002a 89            	pushw	x
 979  002b ae0000        	ldw	x,#L101
 980  002e cd0000        	call	_assert_failed
 982  0031 5b04          	addw	sp,#4
 983  0033               L001:
 984                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 986  0033 0d05          	tnz	(OFST+2,sp)
 987  0035 2706          	jreq	L401
 988  0037 7b05          	ld	a,(OFST+2,sp)
 989  0039 a111          	cp	a,#17
 990  003b 2603          	jrne	L201
 991  003d               L401:
 992  003d 4f            	clr	a
 993  003e 2010          	jra	L601
 994  0040               L201:
 995  0040 ae00e4        	ldw	x,#228
 996  0043 89            	pushw	x
 997  0044 ae0000        	ldw	x,#0
 998  0047 89            	pushw	x
 999  0048 ae0000        	ldw	x,#L101
1000  004b cd0000        	call	_assert_failed
1002  004e 5b04          	addw	sp,#4
1003  0050               L601:
1004                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1006  0050 0d08          	tnz	(OFST+5,sp)
1007  0052 2706          	jreq	L211
1008  0054 7b08          	ld	a,(OFST+5,sp)
1009  0056 a144          	cp	a,#68
1010  0058 2603          	jrne	L011
1011  005a               L211:
1012  005a 4f            	clr	a
1013  005b 2010          	jra	L411
1014  005d               L011:
1015  005d ae00e5        	ldw	x,#229
1016  0060 89            	pushw	x
1017  0061 ae0000        	ldw	x,#0
1018  0064 89            	pushw	x
1019  0065 ae0000        	ldw	x,#L101
1020  0068 cd0000        	call	_assert_failed
1022  006b 5b04          	addw	sp,#4
1023  006d               L411:
1024                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1026  006d 0d0b          	tnz	(OFST+8,sp)
1027  006f 2706          	jreq	L021
1028  0071 7b0b          	ld	a,(OFST+8,sp)
1029  0073 a122          	cp	a,#34
1030  0075 2603          	jrne	L611
1031  0077               L021:
1032  0077 4f            	clr	a
1033  0078 2010          	jra	L221
1034  007a               L611:
1035  007a ae00e6        	ldw	x,#230
1036  007d 89            	pushw	x
1037  007e ae0000        	ldw	x,#0
1038  0081 89            	pushw	x
1039  0082 ae0000        	ldw	x,#L101
1040  0085 cd0000        	call	_assert_failed
1042  0088 5b04          	addw	sp,#4
1043  008a               L221:
1044                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1046  008a 0d0c          	tnz	(OFST+9,sp)
1047  008c 2706          	jreq	L621
1048  008e 7b0c          	ld	a,(OFST+9,sp)
1049  0090 a188          	cp	a,#136
1050  0092 2603          	jrne	L421
1051  0094               L621:
1052  0094 4f            	clr	a
1053  0095 2010          	jra	L031
1054  0097               L421:
1055  0097 ae00e7        	ldw	x,#231
1056  009a 89            	pushw	x
1057  009b ae0000        	ldw	x,#0
1058  009e 89            	pushw	x
1059  009f ae0000        	ldw	x,#L101
1060  00a2 cd0000        	call	_assert_failed
1062  00a5 5b04          	addw	sp,#4
1063  00a7               L031:
1064                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1066  00a7 7b0d          	ld	a,(OFST+10,sp)
1067  00a9 a155          	cp	a,#85
1068  00ab 2704          	jreq	L431
1069  00ad 0d0d          	tnz	(OFST+10,sp)
1070  00af 2603          	jrne	L231
1071  00b1               L431:
1072  00b1 4f            	clr	a
1073  00b2 2010          	jra	L631
1074  00b4               L231:
1075  00b4 ae00e8        	ldw	x,#232
1076  00b7 89            	pushw	x
1077  00b8 ae0000        	ldw	x,#0
1078  00bb 89            	pushw	x
1079  00bc ae0000        	ldw	x,#L101
1080  00bf cd0000        	call	_assert_failed
1082  00c2 5b04          	addw	sp,#4
1083  00c4               L631:
1084                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1086  00c4 7b0e          	ld	a,(OFST+11,sp)
1087  00c6 a12a          	cp	a,#42
1088  00c8 2704          	jreq	L241
1089  00ca 0d0e          	tnz	(OFST+11,sp)
1090  00cc 2603          	jrne	L041
1091  00ce               L241:
1092  00ce 4f            	clr	a
1093  00cf 2010          	jra	L441
1094  00d1               L041:
1095  00d1 ae00e9        	ldw	x,#233
1096  00d4 89            	pushw	x
1097  00d5 ae0000        	ldw	x,#0
1098  00d8 89            	pushw	x
1099  00d9 ae0000        	ldw	x,#L101
1100  00dc cd0000        	call	_assert_failed
1102  00df 5b04          	addw	sp,#4
1103  00e1               L441:
1104                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1104                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1106  00e1 c6525c        	ld	a,21084
1107  00e4 a40f          	and	a,#15
1108  00e6 c7525c        	ld	21084,a
1109                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1109                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1109                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1109                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1111  00e9 7b0c          	ld	a,(OFST+9,sp)
1112  00eb a480          	and	a,#128
1113  00ed 6b03          	ld	(OFST+0,sp),a
1114  00ef 7b0b          	ld	a,(OFST+8,sp)
1115  00f1 a420          	and	a,#32
1116  00f3 1a03          	or	a,(OFST+0,sp)
1117  00f5 6b02          	ld	(OFST-1,sp),a
1118  00f7 7b08          	ld	a,(OFST+5,sp)
1119  00f9 a440          	and	a,#64
1120  00fb 6b01          	ld	(OFST-2,sp),a
1121  00fd 7b05          	ld	a,(OFST+2,sp)
1122  00ff a410          	and	a,#16
1123  0101 1a01          	or	a,(OFST-2,sp)
1124  0103 1a02          	or	a,(OFST-1,sp)
1125  0105 ca525c        	or	a,21084
1126  0108 c7525c        	ld	21084,a
1127                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1127                     ; 249                           (uint8_t)TIM1_OCMode);
1129  010b c65259        	ld	a,21081
1130  010e a48f          	and	a,#143
1131  0110 1a04          	or	a,(OFST+1,sp)
1132  0112 c75259        	ld	21081,a
1133                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1135  0115 c6526f        	ld	a,21103
1136  0118 a4f3          	and	a,#243
1137  011a c7526f        	ld	21103,a
1138                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1138                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1140  011d 7b0e          	ld	a,(OFST+11,sp)
1141  011f a408          	and	a,#8
1142  0121 6b03          	ld	(OFST+0,sp),a
1143  0123 7b0d          	ld	a,(OFST+10,sp)
1144  0125 a404          	and	a,#4
1145  0127 1a03          	or	a,(OFST+0,sp)
1146  0129 ca526f        	or	a,21103
1147  012c c7526f        	ld	21103,a
1148                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1150  012f 7b09          	ld	a,(OFST+6,sp)
1151  0131 c75267        	ld	21095,a
1152                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1154  0134 7b0a          	ld	a,(OFST+7,sp)
1155  0136 c75268        	ld	21096,a
1156                     ; 260 }
1159  0139 5b05          	addw	sp,#5
1160  013b 81            	ret
1265                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1265                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1265                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1265                     ; 284                   uint16_t TIM1_Pulse,
1265                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1265                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1265                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1265                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1265                     ; 289 {
1266                     .text:	section	.text,new
1267  0000               _TIM1_OC3Init:
1269  0000 89            	pushw	x
1270  0001 5203          	subw	sp,#3
1271       00000003      OFST:	set	3
1274                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1276  0003 9e            	ld	a,xh
1277  0004 4d            	tnz	a
1278  0005 2719          	jreq	L251
1279  0007 9e            	ld	a,xh
1280  0008 a110          	cp	a,#16
1281  000a 2714          	jreq	L251
1282  000c 9e            	ld	a,xh
1283  000d a120          	cp	a,#32
1284  000f 270f          	jreq	L251
1285  0011 9e            	ld	a,xh
1286  0012 a130          	cp	a,#48
1287  0014 270a          	jreq	L251
1288  0016 9e            	ld	a,xh
1289  0017 a160          	cp	a,#96
1290  0019 2705          	jreq	L251
1291  001b 9e            	ld	a,xh
1292  001c a170          	cp	a,#112
1293  001e 2603          	jrne	L051
1294  0020               L251:
1295  0020 4f            	clr	a
1296  0021 2010          	jra	L451
1297  0023               L051:
1298  0023 ae0123        	ldw	x,#291
1299  0026 89            	pushw	x
1300  0027 ae0000        	ldw	x,#0
1301  002a 89            	pushw	x
1302  002b ae0000        	ldw	x,#L101
1303  002e cd0000        	call	_assert_failed
1305  0031 5b04          	addw	sp,#4
1306  0033               L451:
1307                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1309  0033 0d05          	tnz	(OFST+2,sp)
1310  0035 2706          	jreq	L061
1311  0037 7b05          	ld	a,(OFST+2,sp)
1312  0039 a111          	cp	a,#17
1313  003b 2603          	jrne	L651
1314  003d               L061:
1315  003d 4f            	clr	a
1316  003e 2010          	jra	L261
1317  0040               L651:
1318  0040 ae0124        	ldw	x,#292
1319  0043 89            	pushw	x
1320  0044 ae0000        	ldw	x,#0
1321  0047 89            	pushw	x
1322  0048 ae0000        	ldw	x,#L101
1323  004b cd0000        	call	_assert_failed
1325  004e 5b04          	addw	sp,#4
1326  0050               L261:
1327                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1329  0050 0d08          	tnz	(OFST+5,sp)
1330  0052 2706          	jreq	L661
1331  0054 7b08          	ld	a,(OFST+5,sp)
1332  0056 a144          	cp	a,#68
1333  0058 2603          	jrne	L461
1334  005a               L661:
1335  005a 4f            	clr	a
1336  005b 2010          	jra	L071
1337  005d               L461:
1338  005d ae0125        	ldw	x,#293
1339  0060 89            	pushw	x
1340  0061 ae0000        	ldw	x,#0
1341  0064 89            	pushw	x
1342  0065 ae0000        	ldw	x,#L101
1343  0068 cd0000        	call	_assert_failed
1345  006b 5b04          	addw	sp,#4
1346  006d               L071:
1347                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1349  006d 0d0b          	tnz	(OFST+8,sp)
1350  006f 2706          	jreq	L471
1351  0071 7b0b          	ld	a,(OFST+8,sp)
1352  0073 a122          	cp	a,#34
1353  0075 2603          	jrne	L271
1354  0077               L471:
1355  0077 4f            	clr	a
1356  0078 2010          	jra	L671
1357  007a               L271:
1358  007a ae0126        	ldw	x,#294
1359  007d 89            	pushw	x
1360  007e ae0000        	ldw	x,#0
1361  0081 89            	pushw	x
1362  0082 ae0000        	ldw	x,#L101
1363  0085 cd0000        	call	_assert_failed
1365  0088 5b04          	addw	sp,#4
1366  008a               L671:
1367                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1369  008a 0d0c          	tnz	(OFST+9,sp)
1370  008c 2706          	jreq	L202
1371  008e 7b0c          	ld	a,(OFST+9,sp)
1372  0090 a188          	cp	a,#136
1373  0092 2603          	jrne	L002
1374  0094               L202:
1375  0094 4f            	clr	a
1376  0095 2010          	jra	L402
1377  0097               L002:
1378  0097 ae0127        	ldw	x,#295
1379  009a 89            	pushw	x
1380  009b ae0000        	ldw	x,#0
1381  009e 89            	pushw	x
1382  009f ae0000        	ldw	x,#L101
1383  00a2 cd0000        	call	_assert_failed
1385  00a5 5b04          	addw	sp,#4
1386  00a7               L402:
1387                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1389  00a7 7b0d          	ld	a,(OFST+10,sp)
1390  00a9 a155          	cp	a,#85
1391  00ab 2704          	jreq	L012
1392  00ad 0d0d          	tnz	(OFST+10,sp)
1393  00af 2603          	jrne	L602
1394  00b1               L012:
1395  00b1 4f            	clr	a
1396  00b2 2010          	jra	L212
1397  00b4               L602:
1398  00b4 ae0128        	ldw	x,#296
1399  00b7 89            	pushw	x
1400  00b8 ae0000        	ldw	x,#0
1401  00bb 89            	pushw	x
1402  00bc ae0000        	ldw	x,#L101
1403  00bf cd0000        	call	_assert_failed
1405  00c2 5b04          	addw	sp,#4
1406  00c4               L212:
1407                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1409  00c4 7b0e          	ld	a,(OFST+11,sp)
1410  00c6 a12a          	cp	a,#42
1411  00c8 2704          	jreq	L612
1412  00ca 0d0e          	tnz	(OFST+11,sp)
1413  00cc 2603          	jrne	L412
1414  00ce               L612:
1415  00ce 4f            	clr	a
1416  00cf 2010          	jra	L022
1417  00d1               L412:
1418  00d1 ae0129        	ldw	x,#297
1419  00d4 89            	pushw	x
1420  00d5 ae0000        	ldw	x,#0
1421  00d8 89            	pushw	x
1422  00d9 ae0000        	ldw	x,#L101
1423  00dc cd0000        	call	_assert_failed
1425  00df 5b04          	addw	sp,#4
1426  00e1               L022:
1427                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1427                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1429  00e1 c6525d        	ld	a,21085
1430  00e4 a4f0          	and	a,#240
1431  00e6 c7525d        	ld	21085,a
1432                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1432                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1432                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1432                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1434  00e9 7b0c          	ld	a,(OFST+9,sp)
1435  00eb a408          	and	a,#8
1436  00ed 6b03          	ld	(OFST+0,sp),a
1437  00ef 7b0b          	ld	a,(OFST+8,sp)
1438  00f1 a402          	and	a,#2
1439  00f3 1a03          	or	a,(OFST+0,sp)
1440  00f5 6b02          	ld	(OFST-1,sp),a
1441  00f7 7b08          	ld	a,(OFST+5,sp)
1442  00f9 a404          	and	a,#4
1443  00fb 6b01          	ld	(OFST-2,sp),a
1444  00fd 7b05          	ld	a,(OFST+2,sp)
1445  00ff a401          	and	a,#1
1446  0101 1a01          	or	a,(OFST-2,sp)
1447  0103 1a02          	or	a,(OFST-1,sp)
1448  0105 ca525d        	or	a,21085
1449  0108 c7525d        	ld	21085,a
1450                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1450                     ; 312                           (uint8_t)TIM1_OCMode);
1452  010b c6525a        	ld	a,21082
1453  010e a48f          	and	a,#143
1454  0110 1a04          	or	a,(OFST+1,sp)
1455  0112 c7525a        	ld	21082,a
1456                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1458  0115 c6526f        	ld	a,21103
1459  0118 a4cf          	and	a,#207
1460  011a c7526f        	ld	21103,a
1461                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1461                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1463  011d 7b0e          	ld	a,(OFST+11,sp)
1464  011f a420          	and	a,#32
1465  0121 6b03          	ld	(OFST+0,sp),a
1466  0123 7b0d          	ld	a,(OFST+10,sp)
1467  0125 a410          	and	a,#16
1468  0127 1a03          	or	a,(OFST+0,sp)
1469  0129 ca526f        	or	a,21103
1470  012c c7526f        	ld	21103,a
1471                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1473  012f 7b09          	ld	a,(OFST+6,sp)
1474  0131 c75269        	ld	21097,a
1475                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1477  0134 7b0a          	ld	a,(OFST+7,sp)
1478  0136 c7526a        	ld	21098,a
1479                     ; 323 }
1482  0139 5b05          	addw	sp,#5
1483  013b 81            	ret
1558                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1558                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1558                     ; 340                   uint16_t TIM1_Pulse,
1558                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1558                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1558                     ; 343 {
1559                     .text:	section	.text,new
1560  0000               _TIM1_OC4Init:
1562  0000 89            	pushw	x
1563  0001 88            	push	a
1564       00000001      OFST:	set	1
1567                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1569  0002 9e            	ld	a,xh
1570  0003 4d            	tnz	a
1571  0004 2719          	jreq	L622
1572  0006 9e            	ld	a,xh
1573  0007 a110          	cp	a,#16
1574  0009 2714          	jreq	L622
1575  000b 9e            	ld	a,xh
1576  000c a120          	cp	a,#32
1577  000e 270f          	jreq	L622
1578  0010 9e            	ld	a,xh
1579  0011 a130          	cp	a,#48
1580  0013 270a          	jreq	L622
1581  0015 9e            	ld	a,xh
1582  0016 a160          	cp	a,#96
1583  0018 2705          	jreq	L622
1584  001a 9e            	ld	a,xh
1585  001b a170          	cp	a,#112
1586  001d 2603          	jrne	L422
1587  001f               L622:
1588  001f 4f            	clr	a
1589  0020 2010          	jra	L032
1590  0022               L422:
1591  0022 ae0159        	ldw	x,#345
1592  0025 89            	pushw	x
1593  0026 ae0000        	ldw	x,#0
1594  0029 89            	pushw	x
1595  002a ae0000        	ldw	x,#L101
1596  002d cd0000        	call	_assert_failed
1598  0030 5b04          	addw	sp,#4
1599  0032               L032:
1600                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1602  0032 0d03          	tnz	(OFST+2,sp)
1603  0034 2706          	jreq	L432
1604  0036 7b03          	ld	a,(OFST+2,sp)
1605  0038 a111          	cp	a,#17
1606  003a 2603          	jrne	L232
1607  003c               L432:
1608  003c 4f            	clr	a
1609  003d 2010          	jra	L632
1610  003f               L232:
1611  003f ae015a        	ldw	x,#346
1612  0042 89            	pushw	x
1613  0043 ae0000        	ldw	x,#0
1614  0046 89            	pushw	x
1615  0047 ae0000        	ldw	x,#L101
1616  004a cd0000        	call	_assert_failed
1618  004d 5b04          	addw	sp,#4
1619  004f               L632:
1620                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1622  004f 0d08          	tnz	(OFST+7,sp)
1623  0051 2706          	jreq	L242
1624  0053 7b08          	ld	a,(OFST+7,sp)
1625  0055 a122          	cp	a,#34
1626  0057 2603          	jrne	L042
1627  0059               L242:
1628  0059 4f            	clr	a
1629  005a 2010          	jra	L442
1630  005c               L042:
1631  005c ae015b        	ldw	x,#347
1632  005f 89            	pushw	x
1633  0060 ae0000        	ldw	x,#0
1634  0063 89            	pushw	x
1635  0064 ae0000        	ldw	x,#L101
1636  0067 cd0000        	call	_assert_failed
1638  006a 5b04          	addw	sp,#4
1639  006c               L442:
1640                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1642  006c 7b09          	ld	a,(OFST+8,sp)
1643  006e a155          	cp	a,#85
1644  0070 2704          	jreq	L052
1645  0072 0d09          	tnz	(OFST+8,sp)
1646  0074 2603          	jrne	L642
1647  0076               L052:
1648  0076 4f            	clr	a
1649  0077 2010          	jra	L252
1650  0079               L642:
1651  0079 ae015c        	ldw	x,#348
1652  007c 89            	pushw	x
1653  007d ae0000        	ldw	x,#0
1654  0080 89            	pushw	x
1655  0081 ae0000        	ldw	x,#L101
1656  0084 cd0000        	call	_assert_failed
1658  0087 5b04          	addw	sp,#4
1659  0089               L252:
1660                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1662  0089 c6525d        	ld	a,21085
1663  008c a4cf          	and	a,#207
1664  008e c7525d        	ld	21085,a
1665                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1665                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1667  0091 7b08          	ld	a,(OFST+7,sp)
1668  0093 a420          	and	a,#32
1669  0095 6b01          	ld	(OFST+0,sp),a
1670  0097 7b03          	ld	a,(OFST+2,sp)
1671  0099 a410          	and	a,#16
1672  009b 1a01          	or	a,(OFST+0,sp)
1673  009d ca525d        	or	a,21085
1674  00a0 c7525d        	ld	21085,a
1675                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1675                     ; 358                           TIM1_OCMode);
1677  00a3 c6525b        	ld	a,21083
1678  00a6 a48f          	and	a,#143
1679  00a8 1a02          	or	a,(OFST+1,sp)
1680  00aa c7525b        	ld	21083,a
1681                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1683  00ad 0d09          	tnz	(OFST+8,sp)
1684  00af 270a          	jreq	L734
1685                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1687  00b1 c6526f        	ld	a,21103
1688  00b4 aadf          	or	a,#223
1689  00b6 c7526f        	ld	21103,a
1691  00b9 2004          	jra	L144
1692  00bb               L734:
1693                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1695  00bb 721d526f      	bres	21103,#6
1696  00bf               L144:
1697                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1699  00bf 7b06          	ld	a,(OFST+5,sp)
1700  00c1 c7526b        	ld	21099,a
1701                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1703  00c4 7b07          	ld	a,(OFST+6,sp)
1704  00c6 c7526c        	ld	21100,a
1705                     ; 373 }
1708  00c9 5b03          	addw	sp,#3
1709  00cb 81            	ret
1915                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1915                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1915                     ; 390                      uint8_t TIM1_DeadTime,
1915                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1915                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1915                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1915                     ; 394 {
1916                     .text:	section	.text,new
1917  0000               _TIM1_BDTRConfig:
1919  0000 89            	pushw	x
1920  0001 88            	push	a
1921       00000001      OFST:	set	1
1924                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1926  0002 9e            	ld	a,xh
1927  0003 a104          	cp	a,#4
1928  0005 2704          	jreq	L062
1929  0007 9e            	ld	a,xh
1930  0008 4d            	tnz	a
1931  0009 2603          	jrne	L652
1932  000b               L062:
1933  000b 4f            	clr	a
1934  000c 2010          	jra	L262
1935  000e               L652:
1936  000e ae018c        	ldw	x,#396
1937  0011 89            	pushw	x
1938  0012 ae0000        	ldw	x,#0
1939  0015 89            	pushw	x
1940  0016 ae0000        	ldw	x,#L101
1941  0019 cd0000        	call	_assert_failed
1943  001c 5b04          	addw	sp,#4
1944  001e               L262:
1945                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1947  001e 0d03          	tnz	(OFST+2,sp)
1948  0020 2712          	jreq	L662
1949  0022 7b03          	ld	a,(OFST+2,sp)
1950  0024 a101          	cp	a,#1
1951  0026 270c          	jreq	L662
1952  0028 7b03          	ld	a,(OFST+2,sp)
1953  002a a102          	cp	a,#2
1954  002c 2706          	jreq	L662
1955  002e 7b03          	ld	a,(OFST+2,sp)
1956  0030 a103          	cp	a,#3
1957  0032 2603          	jrne	L462
1958  0034               L662:
1959  0034 4f            	clr	a
1960  0035 2010          	jra	L072
1961  0037               L462:
1962  0037 ae018d        	ldw	x,#397
1963  003a 89            	pushw	x
1964  003b ae0000        	ldw	x,#0
1965  003e 89            	pushw	x
1966  003f ae0000        	ldw	x,#L101
1967  0042 cd0000        	call	_assert_failed
1969  0045 5b04          	addw	sp,#4
1970  0047               L072:
1971                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1973  0047 7b07          	ld	a,(OFST+6,sp)
1974  0049 a110          	cp	a,#16
1975  004b 2704          	jreq	L472
1976  004d 0d07          	tnz	(OFST+6,sp)
1977  004f 2603          	jrne	L272
1978  0051               L472:
1979  0051 4f            	clr	a
1980  0052 2010          	jra	L672
1981  0054               L272:
1982  0054 ae018e        	ldw	x,#398
1983  0057 89            	pushw	x
1984  0058 ae0000        	ldw	x,#0
1985  005b 89            	pushw	x
1986  005c ae0000        	ldw	x,#L101
1987  005f cd0000        	call	_assert_failed
1989  0062 5b04          	addw	sp,#4
1990  0064               L672:
1991                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1993  0064 0d08          	tnz	(OFST+7,sp)
1994  0066 2706          	jreq	L203
1995  0068 7b08          	ld	a,(OFST+7,sp)
1996  006a a120          	cp	a,#32
1997  006c 2603          	jrne	L003
1998  006e               L203:
1999  006e 4f            	clr	a
2000  006f 2010          	jra	L403
2001  0071               L003:
2002  0071 ae018f        	ldw	x,#399
2003  0074 89            	pushw	x
2004  0075 ae0000        	ldw	x,#0
2005  0078 89            	pushw	x
2006  0079 ae0000        	ldw	x,#L101
2007  007c cd0000        	call	_assert_failed
2009  007f 5b04          	addw	sp,#4
2010  0081               L403:
2011                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2013  0081 7b09          	ld	a,(OFST+8,sp)
2014  0083 a140          	cp	a,#64
2015  0085 2704          	jreq	L013
2016  0087 0d09          	tnz	(OFST+8,sp)
2017  0089 2603          	jrne	L603
2018  008b               L013:
2019  008b 4f            	clr	a
2020  008c 2010          	jra	L213
2021  008e               L603:
2022  008e ae0190        	ldw	x,#400
2023  0091 89            	pushw	x
2024  0092 ae0000        	ldw	x,#0
2025  0095 89            	pushw	x
2026  0096 ae0000        	ldw	x,#L101
2027  0099 cd0000        	call	_assert_failed
2029  009c 5b04          	addw	sp,#4
2030  009e               L213:
2031                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2033  009e 7b06          	ld	a,(OFST+5,sp)
2034  00a0 c7526e        	ld	21102,a
2035                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2035                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2035                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2037  00a3 7b07          	ld	a,(OFST+6,sp)
2038  00a5 1a08          	or	a,(OFST+7,sp)
2039  00a7 1a09          	or	a,(OFST+8,sp)
2040  00a9 6b01          	ld	(OFST+0,sp),a
2041  00ab 7b02          	ld	a,(OFST+1,sp)
2042  00ad 1a03          	or	a,(OFST+2,sp)
2043  00af 1a01          	or	a,(OFST+0,sp)
2044  00b1 c7526d        	ld	21101,a
2045                     ; 409 }
2048  00b4 5b03          	addw	sp,#3
2049  00b6 81            	ret
2252                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2252                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2252                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2252                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2252                     ; 427                  uint8_t TIM1_ICFilter)
2252                     ; 428 {
2253                     .text:	section	.text,new
2254  0000               _TIM1_ICInit:
2256  0000 89            	pushw	x
2257       00000000      OFST:	set	0
2260                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2262  0001 9e            	ld	a,xh
2263  0002 4d            	tnz	a
2264  0003 270f          	jreq	L023
2265  0005 9e            	ld	a,xh
2266  0006 a101          	cp	a,#1
2267  0008 270a          	jreq	L023
2268  000a 9e            	ld	a,xh
2269  000b a102          	cp	a,#2
2270  000d 2705          	jreq	L023
2271  000f 9e            	ld	a,xh
2272  0010 a103          	cp	a,#3
2273  0012 2603          	jrne	L613
2274  0014               L023:
2275  0014 4f            	clr	a
2276  0015 2010          	jra	L223
2277  0017               L613:
2278  0017 ae01ae        	ldw	x,#430
2279  001a 89            	pushw	x
2280  001b ae0000        	ldw	x,#0
2281  001e 89            	pushw	x
2282  001f ae0000        	ldw	x,#L101
2283  0022 cd0000        	call	_assert_failed
2285  0025 5b04          	addw	sp,#4
2286  0027               L223:
2287                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2289  0027 0d02          	tnz	(OFST+2,sp)
2290  0029 2706          	jreq	L623
2291  002b 7b02          	ld	a,(OFST+2,sp)
2292  002d a101          	cp	a,#1
2293  002f 2603          	jrne	L423
2294  0031               L623:
2295  0031 4f            	clr	a
2296  0032 2010          	jra	L033
2297  0034               L423:
2298  0034 ae01af        	ldw	x,#431
2299  0037 89            	pushw	x
2300  0038 ae0000        	ldw	x,#0
2301  003b 89            	pushw	x
2302  003c ae0000        	ldw	x,#L101
2303  003f cd0000        	call	_assert_failed
2305  0042 5b04          	addw	sp,#4
2306  0044               L033:
2307                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2309  0044 7b05          	ld	a,(OFST+5,sp)
2310  0046 a101          	cp	a,#1
2311  0048 270c          	jreq	L433
2312  004a 7b05          	ld	a,(OFST+5,sp)
2313  004c a102          	cp	a,#2
2314  004e 2706          	jreq	L433
2315  0050 7b05          	ld	a,(OFST+5,sp)
2316  0052 a103          	cp	a,#3
2317  0054 2603          	jrne	L233
2318  0056               L433:
2319  0056 4f            	clr	a
2320  0057 2010          	jra	L633
2321  0059               L233:
2322  0059 ae01b0        	ldw	x,#432
2323  005c 89            	pushw	x
2324  005d ae0000        	ldw	x,#0
2325  0060 89            	pushw	x
2326  0061 ae0000        	ldw	x,#L101
2327  0064 cd0000        	call	_assert_failed
2329  0067 5b04          	addw	sp,#4
2330  0069               L633:
2331                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2333  0069 0d06          	tnz	(OFST+6,sp)
2334  006b 2712          	jreq	L243
2335  006d 7b06          	ld	a,(OFST+6,sp)
2336  006f a104          	cp	a,#4
2337  0071 270c          	jreq	L243
2338  0073 7b06          	ld	a,(OFST+6,sp)
2339  0075 a108          	cp	a,#8
2340  0077 2706          	jreq	L243
2341  0079 7b06          	ld	a,(OFST+6,sp)
2342  007b a10c          	cp	a,#12
2343  007d 2603          	jrne	L043
2344  007f               L243:
2345  007f 4f            	clr	a
2346  0080 2010          	jra	L443
2347  0082               L043:
2348  0082 ae01b1        	ldw	x,#433
2349  0085 89            	pushw	x
2350  0086 ae0000        	ldw	x,#0
2351  0089 89            	pushw	x
2352  008a ae0000        	ldw	x,#L101
2353  008d cd0000        	call	_assert_failed
2355  0090 5b04          	addw	sp,#4
2356  0092               L443:
2357                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2359  0092 7b07          	ld	a,(OFST+7,sp)
2360  0094 a110          	cp	a,#16
2361  0096 2403          	jruge	L643
2362  0098 4f            	clr	a
2363  0099 2010          	jra	L053
2364  009b               L643:
2365  009b ae01b2        	ldw	x,#434
2366  009e 89            	pushw	x
2367  009f ae0000        	ldw	x,#0
2368  00a2 89            	pushw	x
2369  00a3 ae0000        	ldw	x,#L101
2370  00a6 cd0000        	call	_assert_failed
2372  00a9 5b04          	addw	sp,#4
2373  00ab               L053:
2374                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2376  00ab 0d01          	tnz	(OFST+1,sp)
2377  00ad 2614          	jrne	L176
2378                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2378                     ; 440                (uint8_t)TIM1_ICSelection,
2378                     ; 441                (uint8_t)TIM1_ICFilter);
2380  00af 7b07          	ld	a,(OFST+7,sp)
2381  00b1 88            	push	a
2382  00b2 7b06          	ld	a,(OFST+6,sp)
2383  00b4 97            	ld	xl,a
2384  00b5 7b03          	ld	a,(OFST+3,sp)
2385  00b7 95            	ld	xh,a
2386  00b8 cd0000        	call	L3_TI1_Config
2388  00bb 84            	pop	a
2389                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2391  00bc 7b06          	ld	a,(OFST+6,sp)
2392  00be cd0000        	call	_TIM1_SetIC1Prescaler
2395  00c1 2046          	jra	L376
2396  00c3               L176:
2397                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2399  00c3 7b01          	ld	a,(OFST+1,sp)
2400  00c5 a101          	cp	a,#1
2401  00c7 2614          	jrne	L576
2402                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2402                     ; 449                (uint8_t)TIM1_ICSelection,
2402                     ; 450                (uint8_t)TIM1_ICFilter);
2404  00c9 7b07          	ld	a,(OFST+7,sp)
2405  00cb 88            	push	a
2406  00cc 7b06          	ld	a,(OFST+6,sp)
2407  00ce 97            	ld	xl,a
2408  00cf 7b03          	ld	a,(OFST+3,sp)
2409  00d1 95            	ld	xh,a
2410  00d2 cd0000        	call	L5_TI2_Config
2412  00d5 84            	pop	a
2413                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2415  00d6 7b06          	ld	a,(OFST+6,sp)
2416  00d8 cd0000        	call	_TIM1_SetIC2Prescaler
2419  00db 202c          	jra	L376
2420  00dd               L576:
2421                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2423  00dd 7b01          	ld	a,(OFST+1,sp)
2424  00df a102          	cp	a,#2
2425  00e1 2614          	jrne	L107
2426                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2426                     ; 458                (uint8_t)TIM1_ICSelection,
2426                     ; 459                (uint8_t)TIM1_ICFilter);
2428  00e3 7b07          	ld	a,(OFST+7,sp)
2429  00e5 88            	push	a
2430  00e6 7b06          	ld	a,(OFST+6,sp)
2431  00e8 97            	ld	xl,a
2432  00e9 7b03          	ld	a,(OFST+3,sp)
2433  00eb 95            	ld	xh,a
2434  00ec cd0000        	call	L7_TI3_Config
2436  00ef 84            	pop	a
2437                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2439  00f0 7b06          	ld	a,(OFST+6,sp)
2440  00f2 cd0000        	call	_TIM1_SetIC3Prescaler
2443  00f5 2012          	jra	L376
2444  00f7               L107:
2445                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2445                     ; 467                (uint8_t)TIM1_ICSelection,
2445                     ; 468                (uint8_t)TIM1_ICFilter);
2447  00f7 7b07          	ld	a,(OFST+7,sp)
2448  00f9 88            	push	a
2449  00fa 7b06          	ld	a,(OFST+6,sp)
2450  00fc 97            	ld	xl,a
2451  00fd 7b03          	ld	a,(OFST+3,sp)
2452  00ff 95            	ld	xh,a
2453  0100 cd0000        	call	L11_TI4_Config
2455  0103 84            	pop	a
2456                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2458  0104 7b06          	ld	a,(OFST+6,sp)
2459  0106 cd0000        	call	_TIM1_SetIC4Prescaler
2461  0109               L376:
2462                     ; 472 }
2465  0109 85            	popw	x
2466  010a 81            	ret
2563                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2563                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2563                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2563                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2563                     ; 492                      uint8_t TIM1_ICFilter)
2563                     ; 493 {
2564                     .text:	section	.text,new
2565  0000               _TIM1_PWMIConfig:
2567  0000 89            	pushw	x
2568  0001 89            	pushw	x
2569       00000002      OFST:	set	2
2572                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2574  0002 7b01          	ld	a,(OFST-1,sp)
2575  0004 97            	ld	xl,a
2576                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2578  0005 7b02          	ld	a,(OFST+0,sp)
2579  0007 97            	ld	xl,a
2580                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2582  0008 0d03          	tnz	(OFST+1,sp)
2583  000a 2706          	jreq	L653
2584  000c 7b03          	ld	a,(OFST+1,sp)
2585  000e a101          	cp	a,#1
2586  0010 2603          	jrne	L453
2587  0012               L653:
2588  0012 4f            	clr	a
2589  0013 2010          	jra	L063
2590  0015               L453:
2591  0015 ae01f2        	ldw	x,#498
2592  0018 89            	pushw	x
2593  0019 ae0000        	ldw	x,#0
2594  001c 89            	pushw	x
2595  001d ae0000        	ldw	x,#L101
2596  0020 cd0000        	call	_assert_failed
2598  0023 5b04          	addw	sp,#4
2599  0025               L063:
2600                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2602  0025 0d04          	tnz	(OFST+2,sp)
2603  0027 2706          	jreq	L463
2604  0029 7b04          	ld	a,(OFST+2,sp)
2605  002b a101          	cp	a,#1
2606  002d 2603          	jrne	L263
2607  002f               L463:
2608  002f 4f            	clr	a
2609  0030 2010          	jra	L663
2610  0032               L263:
2611  0032 ae01f3        	ldw	x,#499
2612  0035 89            	pushw	x
2613  0036 ae0000        	ldw	x,#0
2614  0039 89            	pushw	x
2615  003a ae0000        	ldw	x,#L101
2616  003d cd0000        	call	_assert_failed
2618  0040 5b04          	addw	sp,#4
2619  0042               L663:
2620                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2622  0042 7b07          	ld	a,(OFST+5,sp)
2623  0044 a101          	cp	a,#1
2624  0046 270c          	jreq	L273
2625  0048 7b07          	ld	a,(OFST+5,sp)
2626  004a a102          	cp	a,#2
2627  004c 2706          	jreq	L273
2628  004e 7b07          	ld	a,(OFST+5,sp)
2629  0050 a103          	cp	a,#3
2630  0052 2603          	jrne	L073
2631  0054               L273:
2632  0054 4f            	clr	a
2633  0055 2010          	jra	L473
2634  0057               L073:
2635  0057 ae01f4        	ldw	x,#500
2636  005a 89            	pushw	x
2637  005b ae0000        	ldw	x,#0
2638  005e 89            	pushw	x
2639  005f ae0000        	ldw	x,#L101
2640  0062 cd0000        	call	_assert_failed
2642  0065 5b04          	addw	sp,#4
2643  0067               L473:
2644                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2646  0067 0d08          	tnz	(OFST+6,sp)
2647  0069 2712          	jreq	L004
2648  006b 7b08          	ld	a,(OFST+6,sp)
2649  006d a104          	cp	a,#4
2650  006f 270c          	jreq	L004
2651  0071 7b08          	ld	a,(OFST+6,sp)
2652  0073 a108          	cp	a,#8
2653  0075 2706          	jreq	L004
2654  0077 7b08          	ld	a,(OFST+6,sp)
2655  0079 a10c          	cp	a,#12
2656  007b 2603          	jrne	L673
2657  007d               L004:
2658  007d 4f            	clr	a
2659  007e 2010          	jra	L204
2660  0080               L673:
2661  0080 ae01f5        	ldw	x,#501
2662  0083 89            	pushw	x
2663  0084 ae0000        	ldw	x,#0
2664  0087 89            	pushw	x
2665  0088 ae0000        	ldw	x,#L101
2666  008b cd0000        	call	_assert_failed
2668  008e 5b04          	addw	sp,#4
2669  0090               L204:
2670                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2672  0090 7b04          	ld	a,(OFST+2,sp)
2673  0092 a101          	cp	a,#1
2674  0094 2706          	jreq	L357
2675                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2677  0096 a601          	ld	a,#1
2678  0098 6b01          	ld	(OFST-1,sp),a
2680  009a 2002          	jra	L557
2681  009c               L357:
2682                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2684  009c 0f01          	clr	(OFST-1,sp)
2685  009e               L557:
2686                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2688  009e 7b07          	ld	a,(OFST+5,sp)
2689  00a0 a101          	cp	a,#1
2690  00a2 2606          	jrne	L757
2691                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2693  00a4 a602          	ld	a,#2
2694  00a6 6b02          	ld	(OFST+0,sp),a
2696  00a8 2004          	jra	L167
2697  00aa               L757:
2698                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2700  00aa a601          	ld	a,#1
2701  00ac 6b02          	ld	(OFST+0,sp),a
2702  00ae               L167:
2703                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2705  00ae 0d03          	tnz	(OFST+1,sp)
2706  00b0 2626          	jrne	L367
2707                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2707                     ; 527                (uint8_t)TIM1_ICFilter);
2709  00b2 7b09          	ld	a,(OFST+7,sp)
2710  00b4 88            	push	a
2711  00b5 7b08          	ld	a,(OFST+6,sp)
2712  00b7 97            	ld	xl,a
2713  00b8 7b05          	ld	a,(OFST+3,sp)
2714  00ba 95            	ld	xh,a
2715  00bb cd0000        	call	L3_TI1_Config
2717  00be 84            	pop	a
2718                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2720  00bf 7b08          	ld	a,(OFST+6,sp)
2721  00c1 cd0000        	call	_TIM1_SetIC1Prescaler
2723                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2725  00c4 7b09          	ld	a,(OFST+7,sp)
2726  00c6 88            	push	a
2727  00c7 7b03          	ld	a,(OFST+1,sp)
2728  00c9 97            	ld	xl,a
2729  00ca 7b02          	ld	a,(OFST+0,sp)
2730  00cc 95            	ld	xh,a
2731  00cd cd0000        	call	L5_TI2_Config
2733  00d0 84            	pop	a
2734                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2736  00d1 7b08          	ld	a,(OFST+6,sp)
2737  00d3 cd0000        	call	_TIM1_SetIC2Prescaler
2740  00d6 2024          	jra	L567
2741  00d8               L367:
2742                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2742                     ; 542                (uint8_t)TIM1_ICFilter);
2744  00d8 7b09          	ld	a,(OFST+7,sp)
2745  00da 88            	push	a
2746  00db 7b08          	ld	a,(OFST+6,sp)
2747  00dd 97            	ld	xl,a
2748  00de 7b05          	ld	a,(OFST+3,sp)
2749  00e0 95            	ld	xh,a
2750  00e1 cd0000        	call	L5_TI2_Config
2752  00e4 84            	pop	a
2753                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2755  00e5 7b08          	ld	a,(OFST+6,sp)
2756  00e7 cd0000        	call	_TIM1_SetIC2Prescaler
2758                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2760  00ea 7b09          	ld	a,(OFST+7,sp)
2761  00ec 88            	push	a
2762  00ed 7b03          	ld	a,(OFST+1,sp)
2763  00ef 97            	ld	xl,a
2764  00f0 7b02          	ld	a,(OFST+0,sp)
2765  00f2 95            	ld	xh,a
2766  00f3 cd0000        	call	L3_TI1_Config
2768  00f6 84            	pop	a
2769                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2771  00f7 7b08          	ld	a,(OFST+6,sp)
2772  00f9 cd0000        	call	_TIM1_SetIC1Prescaler
2774  00fc               L567:
2775                     ; 553 }
2778  00fc 5b04          	addw	sp,#4
2779  00fe 81            	ret
2835                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2835                     ; 562 {
2836                     .text:	section	.text,new
2837  0000               _TIM1_Cmd:
2839  0000 88            	push	a
2840       00000000      OFST:	set	0
2843                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2845  0001 4d            	tnz	a
2846  0002 2704          	jreq	L014
2847  0004 a101          	cp	a,#1
2848  0006 2603          	jrne	L604
2849  0008               L014:
2850  0008 4f            	clr	a
2851  0009 2010          	jra	L214
2852  000b               L604:
2853  000b ae0234        	ldw	x,#564
2854  000e 89            	pushw	x
2855  000f ae0000        	ldw	x,#0
2856  0012 89            	pushw	x
2857  0013 ae0000        	ldw	x,#L101
2858  0016 cd0000        	call	_assert_failed
2860  0019 5b04          	addw	sp,#4
2861  001b               L214:
2862                     ; 567   if (NewState != DISABLE)
2864  001b 0d01          	tnz	(OFST+1,sp)
2865  001d 2706          	jreq	L5101
2866                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2868  001f 72105250      	bset	21072,#0
2870  0023 2004          	jra	L7101
2871  0025               L5101:
2872                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2874  0025 72115250      	bres	21072,#0
2875  0029               L7101:
2876                     ; 575 }
2879  0029 84            	pop	a
2880  002a 81            	ret
2917                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2917                     ; 584 {
2918                     .text:	section	.text,new
2919  0000               _TIM1_CtrlPWMOutputs:
2921  0000 88            	push	a
2922       00000000      OFST:	set	0
2925                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2927  0001 4d            	tnz	a
2928  0002 2704          	jreq	L024
2929  0004 a101          	cp	a,#1
2930  0006 2603          	jrne	L614
2931  0008               L024:
2932  0008 4f            	clr	a
2933  0009 2010          	jra	L224
2934  000b               L614:
2935  000b ae024a        	ldw	x,#586
2936  000e 89            	pushw	x
2937  000f ae0000        	ldw	x,#0
2938  0012 89            	pushw	x
2939  0013 ae0000        	ldw	x,#L101
2940  0016 cd0000        	call	_assert_failed
2942  0019 5b04          	addw	sp,#4
2943  001b               L224:
2944                     ; 590   if (NewState != DISABLE)
2946  001b 0d01          	tnz	(OFST+1,sp)
2947  001d 2706          	jreq	L7301
2948                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2950  001f 721e526d      	bset	21101,#7
2952  0023 2004          	jra	L1401
2953  0025               L7301:
2954                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2956  0025 721f526d      	bres	21101,#7
2957  0029               L1401:
2958                     ; 598 }
2961  0029 84            	pop	a
2962  002a 81            	ret
3070                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3070                     ; 618 {
3071                     .text:	section	.text,new
3072  0000               _TIM1_ITConfig:
3074  0000 89            	pushw	x
3075       00000000      OFST:	set	0
3078                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3080  0001 9e            	ld	a,xh
3081  0002 4d            	tnz	a
3082  0003 2703          	jreq	L624
3083  0005 4f            	clr	a
3084  0006 2010          	jra	L034
3085  0008               L624:
3086  0008 ae026c        	ldw	x,#620
3087  000b 89            	pushw	x
3088  000c ae0000        	ldw	x,#0
3089  000f 89            	pushw	x
3090  0010 ae0000        	ldw	x,#L101
3091  0013 cd0000        	call	_assert_failed
3093  0016 5b04          	addw	sp,#4
3094  0018               L034:
3095                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3097  0018 0d02          	tnz	(OFST+2,sp)
3098  001a 2706          	jreq	L434
3099  001c 7b02          	ld	a,(OFST+2,sp)
3100  001e a101          	cp	a,#1
3101  0020 2603          	jrne	L234
3102  0022               L434:
3103  0022 4f            	clr	a
3104  0023 2010          	jra	L634
3105  0025               L234:
3106  0025 ae026d        	ldw	x,#621
3107  0028 89            	pushw	x
3108  0029 ae0000        	ldw	x,#0
3109  002c 89            	pushw	x
3110  002d ae0000        	ldw	x,#L101
3111  0030 cd0000        	call	_assert_failed
3113  0033 5b04          	addw	sp,#4
3114  0035               L634:
3115                     ; 623   if (NewState != DISABLE)
3117  0035 0d02          	tnz	(OFST+2,sp)
3118  0037 270a          	jreq	L1111
3119                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3121  0039 c65254        	ld	a,21076
3122  003c 1a01          	or	a,(OFST+1,sp)
3123  003e c75254        	ld	21076,a
3125  0041 2009          	jra	L3111
3126  0043               L1111:
3127                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3129  0043 7b01          	ld	a,(OFST+1,sp)
3130  0045 43            	cpl	a
3131  0046 c45254        	and	a,21076
3132  0049 c75254        	ld	21076,a
3133  004c               L3111:
3134                     ; 633 }
3137  004c 85            	popw	x
3138  004d 81            	ret
3162                     ; 640 void TIM1_InternalClockConfig(void)
3162                     ; 641 {
3163                     .text:	section	.text,new
3164  0000               _TIM1_InternalClockConfig:
3168                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3170  0000 c65252        	ld	a,21074
3171  0003 a4f8          	and	a,#248
3172  0005 c75252        	ld	21074,a
3173                     ; 644 }
3176  0008 81            	ret
3294                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3294                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3294                     ; 664                               uint8_t ExtTRGFilter)
3294                     ; 665 {
3295                     .text:	section	.text,new
3296  0000               _TIM1_ETRClockMode1Config:
3298  0000 89            	pushw	x
3299       00000000      OFST:	set	0
3302                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3304  0001 9e            	ld	a,xh
3305  0002 4d            	tnz	a
3306  0003 270f          	jreq	L644
3307  0005 9e            	ld	a,xh
3308  0006 a110          	cp	a,#16
3309  0008 270a          	jreq	L644
3310  000a 9e            	ld	a,xh
3311  000b a120          	cp	a,#32
3312  000d 2705          	jreq	L644
3313  000f 9e            	ld	a,xh
3314  0010 a130          	cp	a,#48
3315  0012 2603          	jrne	L444
3316  0014               L644:
3317  0014 4f            	clr	a
3318  0015 2010          	jra	L054
3319  0017               L444:
3320  0017 ae029b        	ldw	x,#667
3321  001a 89            	pushw	x
3322  001b ae0000        	ldw	x,#0
3323  001e 89            	pushw	x
3324  001f ae0000        	ldw	x,#L101
3325  0022 cd0000        	call	_assert_failed
3327  0025 5b04          	addw	sp,#4
3328  0027               L054:
3329                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3331  0027 7b02          	ld	a,(OFST+2,sp)
3332  0029 a180          	cp	a,#128
3333  002b 2704          	jreq	L454
3334  002d 0d02          	tnz	(OFST+2,sp)
3335  002f 2603          	jrne	L254
3336  0031               L454:
3337  0031 4f            	clr	a
3338  0032 2010          	jra	L654
3339  0034               L254:
3340  0034 ae029c        	ldw	x,#668
3341  0037 89            	pushw	x
3342  0038 ae0000        	ldw	x,#0
3343  003b 89            	pushw	x
3344  003c ae0000        	ldw	x,#L101
3345  003f cd0000        	call	_assert_failed
3347  0042 5b04          	addw	sp,#4
3348  0044               L654:
3349                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3351  0044 7b05          	ld	a,(OFST+5,sp)
3352  0046 88            	push	a
3353  0047 7b03          	ld	a,(OFST+3,sp)
3354  0049 97            	ld	xl,a
3355  004a 7b02          	ld	a,(OFST+2,sp)
3356  004c 95            	ld	xh,a
3357  004d cd0000        	call	_TIM1_ETRConfig
3359  0050 84            	pop	a
3360                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3360                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3362  0051 c65252        	ld	a,21074
3363  0054 a488          	and	a,#136
3364  0056 aa77          	or	a,#119
3365  0058 c75252        	ld	21074,a
3366                     ; 676 }
3369  005b 85            	popw	x
3370  005c 81            	ret
3429                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3429                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3429                     ; 696                               uint8_t ExtTRGFilter)
3429                     ; 697 {
3430                     .text:	section	.text,new
3431  0000               _TIM1_ETRClockMode2Config:
3433  0000 89            	pushw	x
3434       00000000      OFST:	set	0
3437                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3439  0001 9e            	ld	a,xh
3440  0002 4d            	tnz	a
3441  0003 270f          	jreq	L464
3442  0005 9e            	ld	a,xh
3443  0006 a110          	cp	a,#16
3444  0008 270a          	jreq	L464
3445  000a 9e            	ld	a,xh
3446  000b a120          	cp	a,#32
3447  000d 2705          	jreq	L464
3448  000f 9e            	ld	a,xh
3449  0010 a130          	cp	a,#48
3450  0012 2603          	jrne	L264
3451  0014               L464:
3452  0014 4f            	clr	a
3453  0015 2010          	jra	L664
3454  0017               L264:
3455  0017 ae02bb        	ldw	x,#699
3456  001a 89            	pushw	x
3457  001b ae0000        	ldw	x,#0
3458  001e 89            	pushw	x
3459  001f ae0000        	ldw	x,#L101
3460  0022 cd0000        	call	_assert_failed
3462  0025 5b04          	addw	sp,#4
3463  0027               L664:
3464                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3466  0027 7b02          	ld	a,(OFST+2,sp)
3467  0029 a180          	cp	a,#128
3468  002b 2704          	jreq	L274
3469  002d 0d02          	tnz	(OFST+2,sp)
3470  002f 2603          	jrne	L074
3471  0031               L274:
3472  0031 4f            	clr	a
3473  0032 2010          	jra	L474
3474  0034               L074:
3475  0034 ae02bc        	ldw	x,#700
3476  0037 89            	pushw	x
3477  0038 ae0000        	ldw	x,#0
3478  003b 89            	pushw	x
3479  003c ae0000        	ldw	x,#L101
3480  003f cd0000        	call	_assert_failed
3482  0042 5b04          	addw	sp,#4
3483  0044               L474:
3484                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3486  0044 7b05          	ld	a,(OFST+5,sp)
3487  0046 88            	push	a
3488  0047 7b03          	ld	a,(OFST+3,sp)
3489  0049 97            	ld	xl,a
3490  004a 7b02          	ld	a,(OFST+2,sp)
3491  004c 95            	ld	xh,a
3492  004d cd0000        	call	_TIM1_ETRConfig
3494  0050 84            	pop	a
3495                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3497  0051 721c5253      	bset	21075,#6
3498                     ; 707 }
3501  0055 85            	popw	x
3502  0056 81            	ret
3559                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3559                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3559                     ; 727                     uint8_t ExtTRGFilter)
3559                     ; 728 {
3560                     .text:	section	.text,new
3561  0000               _TIM1_ETRConfig:
3563  0000 89            	pushw	x
3564       00000000      OFST:	set	0
3567                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3569  0001 7b05          	ld	a,(OFST+5,sp)
3570  0003 a110          	cp	a,#16
3571  0005 2403          	jruge	L005
3572  0007 4f            	clr	a
3573  0008 2010          	jra	L205
3574  000a               L005:
3575  000a ae02da        	ldw	x,#730
3576  000d 89            	pushw	x
3577  000e ae0000        	ldw	x,#0
3578  0011 89            	pushw	x
3579  0012 ae0000        	ldw	x,#L101
3580  0015 cd0000        	call	_assert_failed
3582  0018 5b04          	addw	sp,#4
3583  001a               L205:
3584                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3584                     ; 733                          (uint8_t)ExtTRGFilter );
3586  001a 7b01          	ld	a,(OFST+1,sp)
3587  001c 1a02          	or	a,(OFST+2,sp)
3588  001e 1a05          	or	a,(OFST+5,sp)
3589  0020 ca5253        	or	a,21075
3590  0023 c75253        	ld	21075,a
3591                     ; 734 }
3594  0026 85            	popw	x
3595  0027 81            	ret
3685                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3685                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3685                     ; 753                                  uint8_t ICFilter)
3685                     ; 754 {
3686                     .text:	section	.text,new
3687  0000               _TIM1_TIxExternalClockConfig:
3689  0000 89            	pushw	x
3690       00000000      OFST:	set	0
3693                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3695  0001 9e            	ld	a,xh
3696  0002 a140          	cp	a,#64
3697  0004 270a          	jreq	L015
3698  0006 9e            	ld	a,xh
3699  0007 a160          	cp	a,#96
3700  0009 2705          	jreq	L015
3701  000b 9e            	ld	a,xh
3702  000c a150          	cp	a,#80
3703  000e 2603          	jrne	L605
3704  0010               L015:
3705  0010 4f            	clr	a
3706  0011 2010          	jra	L215
3707  0013               L605:
3708  0013 ae02f4        	ldw	x,#756
3709  0016 89            	pushw	x
3710  0017 ae0000        	ldw	x,#0
3711  001a 89            	pushw	x
3712  001b ae0000        	ldw	x,#L101
3713  001e cd0000        	call	_assert_failed
3715  0021 5b04          	addw	sp,#4
3716  0023               L215:
3717                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3719  0023 0d02          	tnz	(OFST+2,sp)
3720  0025 2706          	jreq	L615
3721  0027 7b02          	ld	a,(OFST+2,sp)
3722  0029 a101          	cp	a,#1
3723  002b 2603          	jrne	L415
3724  002d               L615:
3725  002d 4f            	clr	a
3726  002e 2010          	jra	L025
3727  0030               L415:
3728  0030 ae02f5        	ldw	x,#757
3729  0033 89            	pushw	x
3730  0034 ae0000        	ldw	x,#0
3731  0037 89            	pushw	x
3732  0038 ae0000        	ldw	x,#L101
3733  003b cd0000        	call	_assert_failed
3735  003e 5b04          	addw	sp,#4
3736  0040               L025:
3737                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3739  0040 7b05          	ld	a,(OFST+5,sp)
3740  0042 a110          	cp	a,#16
3741  0044 2403          	jruge	L225
3742  0046 4f            	clr	a
3743  0047 2010          	jra	L425
3744  0049               L225:
3745  0049 ae02f6        	ldw	x,#758
3746  004c 89            	pushw	x
3747  004d ae0000        	ldw	x,#0
3748  0050 89            	pushw	x
3749  0051 ae0000        	ldw	x,#L101
3750  0054 cd0000        	call	_assert_failed
3752  0057 5b04          	addw	sp,#4
3753  0059               L425:
3754                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3756  0059 7b01          	ld	a,(OFST+1,sp)
3757  005b a160          	cp	a,#96
3758  005d 260f          	jrne	L3131
3759                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3761  005f 7b05          	ld	a,(OFST+5,sp)
3762  0061 88            	push	a
3763  0062 ae0001        	ldw	x,#1
3764  0065 7b03          	ld	a,(OFST+3,sp)
3765  0067 95            	ld	xh,a
3766  0068 cd0000        	call	L5_TI2_Config
3768  006b 84            	pop	a
3770  006c 200d          	jra	L5131
3771  006e               L3131:
3772                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3774  006e 7b05          	ld	a,(OFST+5,sp)
3775  0070 88            	push	a
3776  0071 ae0001        	ldw	x,#1
3777  0074 7b03          	ld	a,(OFST+3,sp)
3778  0076 95            	ld	xh,a
3779  0077 cd0000        	call	L3_TI1_Config
3781  007a 84            	pop	a
3782  007b               L5131:
3783                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3785  007b 7b01          	ld	a,(OFST+1,sp)
3786  007d cd0000        	call	_TIM1_SelectInputTrigger
3788                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3790  0080 c65252        	ld	a,21074
3791  0083 aa07          	or	a,#7
3792  0085 c75252        	ld	21074,a
3793                     ; 775 }
3796  0088 85            	popw	x
3797  0089 81            	ret
3883                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3883                     ; 788 {
3884                     .text:	section	.text,new
3885  0000               _TIM1_SelectInputTrigger:
3887  0000 88            	push	a
3888       00000000      OFST:	set	0
3891                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3893  0001 a140          	cp	a,#64
3894  0003 2713          	jreq	L235
3895  0005 a150          	cp	a,#80
3896  0007 270f          	jreq	L235
3897  0009 a160          	cp	a,#96
3898  000b 270b          	jreq	L235
3899  000d a170          	cp	a,#112
3900  000f 2707          	jreq	L235
3901  0011 a130          	cp	a,#48
3902  0013 2703          	jreq	L235
3903  0015 4d            	tnz	a
3904  0016 2603          	jrne	L035
3905  0018               L235:
3906  0018 4f            	clr	a
3907  0019 2010          	jra	L435
3908  001b               L035:
3909  001b ae0316        	ldw	x,#790
3910  001e 89            	pushw	x
3911  001f ae0000        	ldw	x,#0
3912  0022 89            	pushw	x
3913  0023 ae0000        	ldw	x,#L101
3914  0026 cd0000        	call	_assert_failed
3916  0029 5b04          	addw	sp,#4
3917  002b               L435:
3918                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3920  002b c65252        	ld	a,21074
3921  002e a48f          	and	a,#143
3922  0030 1a01          	or	a,(OFST+1,sp)
3923  0032 c75252        	ld	21074,a
3924                     ; 794 }
3927  0035 84            	pop	a
3928  0036 81            	ret
3965                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3965                     ; 804 {
3966                     .text:	section	.text,new
3967  0000               _TIM1_UpdateDisableConfig:
3969  0000 88            	push	a
3970       00000000      OFST:	set	0
3973                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3975  0001 4d            	tnz	a
3976  0002 2704          	jreq	L245
3977  0004 a101          	cp	a,#1
3978  0006 2603          	jrne	L045
3979  0008               L245:
3980  0008 4f            	clr	a
3981  0009 2010          	jra	L445
3982  000b               L045:
3983  000b ae0326        	ldw	x,#806
3984  000e 89            	pushw	x
3985  000f ae0000        	ldw	x,#0
3986  0012 89            	pushw	x
3987  0013 ae0000        	ldw	x,#L101
3988  0016 cd0000        	call	_assert_failed
3990  0019 5b04          	addw	sp,#4
3991  001b               L445:
3992                     ; 809   if (NewState != DISABLE)
3994  001b 0d01          	tnz	(OFST+1,sp)
3995  001d 2706          	jreq	L3731
3996                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
3998  001f 72125250      	bset	21072,#1
4000  0023 2004          	jra	L5731
4001  0025               L3731:
4002                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4004  0025 72135250      	bres	21072,#1
4005  0029               L5731:
4006                     ; 817 }
4009  0029 84            	pop	a
4010  002a 81            	ret
4069                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4069                     ; 828 {
4070                     .text:	section	.text,new
4071  0000               _TIM1_UpdateRequestConfig:
4073  0000 88            	push	a
4074       00000000      OFST:	set	0
4077                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4079  0001 4d            	tnz	a
4080  0002 2704          	jreq	L255
4081  0004 a101          	cp	a,#1
4082  0006 2603          	jrne	L055
4083  0008               L255:
4084  0008 4f            	clr	a
4085  0009 2010          	jra	L455
4086  000b               L055:
4087  000b ae033e        	ldw	x,#830
4088  000e 89            	pushw	x
4089  000f ae0000        	ldw	x,#0
4090  0012 89            	pushw	x
4091  0013 ae0000        	ldw	x,#L101
4092  0016 cd0000        	call	_assert_failed
4094  0019 5b04          	addw	sp,#4
4095  001b               L455:
4096                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4098  001b 0d01          	tnz	(OFST+1,sp)
4099  001d 2706          	jreq	L5241
4100                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4102  001f 72145250      	bset	21072,#2
4104  0023 2004          	jra	L7241
4105  0025               L5241:
4106                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4108  0025 72155250      	bres	21072,#2
4109  0029               L7241:
4110                     ; 841 }
4113  0029 84            	pop	a
4114  002a 81            	ret
4151                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4151                     ; 850 {
4152                     .text:	section	.text,new
4153  0000               _TIM1_SelectHallSensor:
4155  0000 88            	push	a
4156       00000000      OFST:	set	0
4159                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4161  0001 4d            	tnz	a
4162  0002 2704          	jreq	L265
4163  0004 a101          	cp	a,#1
4164  0006 2603          	jrne	L065
4165  0008               L265:
4166  0008 4f            	clr	a
4167  0009 2010          	jra	L465
4168  000b               L065:
4169  000b ae0354        	ldw	x,#852
4170  000e 89            	pushw	x
4171  000f ae0000        	ldw	x,#0
4172  0012 89            	pushw	x
4173  0013 ae0000        	ldw	x,#L101
4174  0016 cd0000        	call	_assert_failed
4176  0019 5b04          	addw	sp,#4
4177  001b               L465:
4178                     ; 855   if (NewState != DISABLE)
4180  001b 0d01          	tnz	(OFST+1,sp)
4181  001d 2706          	jreq	L7441
4182                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4184  001f 721e5251      	bset	21073,#7
4186  0023 2004          	jra	L1541
4187  0025               L7441:
4188                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4190  0025 721f5251      	bres	21073,#7
4191  0029               L1541:
4192                     ; 863 }
4195  0029 84            	pop	a
4196  002a 81            	ret
4254                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4254                     ; 874 {
4255                     .text:	section	.text,new
4256  0000               _TIM1_SelectOnePulseMode:
4258  0000 88            	push	a
4259       00000000      OFST:	set	0
4262                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4264  0001 a101          	cp	a,#1
4265  0003 2703          	jreq	L275
4266  0005 4d            	tnz	a
4267  0006 2603          	jrne	L075
4268  0008               L275:
4269  0008 4f            	clr	a
4270  0009 2010          	jra	L475
4271  000b               L075:
4272  000b ae036c        	ldw	x,#876
4273  000e 89            	pushw	x
4274  000f ae0000        	ldw	x,#0
4275  0012 89            	pushw	x
4276  0013 ae0000        	ldw	x,#L101
4277  0016 cd0000        	call	_assert_failed
4279  0019 5b04          	addw	sp,#4
4280  001b               L475:
4281                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4283  001b 0d01          	tnz	(OFST+1,sp)
4284  001d 2706          	jreq	L1051
4285                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4287  001f 72165250      	bset	21072,#3
4289  0023 2004          	jra	L3051
4290  0025               L1051:
4291                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4293  0025 72175250      	bres	21072,#3
4294  0029               L3051:
4295                     ; 888 }
4298  0029 84            	pop	a
4299  002a 81            	ret
4398                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4398                     ; 904 {
4399                     .text:	section	.text,new
4400  0000               _TIM1_SelectOutputTrigger:
4402  0000 88            	push	a
4403       00000000      OFST:	set	0
4406                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4408  0001 4d            	tnz	a
4409  0002 2718          	jreq	L206
4410  0004 a110          	cp	a,#16
4411  0006 2714          	jreq	L206
4412  0008 a120          	cp	a,#32
4413  000a 2710          	jreq	L206
4414  000c a130          	cp	a,#48
4415  000e 270c          	jreq	L206
4416  0010 a140          	cp	a,#64
4417  0012 2708          	jreq	L206
4418  0014 a150          	cp	a,#80
4419  0016 2704          	jreq	L206
4420  0018 a160          	cp	a,#96
4421  001a 2603          	jrne	L006
4422  001c               L206:
4423  001c 4f            	clr	a
4424  001d 2010          	jra	L406
4425  001f               L006:
4426  001f ae038a        	ldw	x,#906
4427  0022 89            	pushw	x
4428  0023 ae0000        	ldw	x,#0
4429  0026 89            	pushw	x
4430  0027 ae0000        	ldw	x,#L101
4431  002a cd0000        	call	_assert_failed
4433  002d 5b04          	addw	sp,#4
4434  002f               L406:
4435                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4435                     ; 910                         (uint8_t) TIM1_TRGOSource);
4437  002f c65251        	ld	a,21073
4438  0032 a48f          	and	a,#143
4439  0034 1a01          	or	a,(OFST+1,sp)
4440  0036 c75251        	ld	21073,a
4441                     ; 911 }
4444  0039 84            	pop	a
4445  003a 81            	ret
4520                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4520                     ; 924 {
4521                     .text:	section	.text,new
4522  0000               _TIM1_SelectSlaveMode:
4524  0000 88            	push	a
4525       00000000      OFST:	set	0
4528                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4530  0001 a104          	cp	a,#4
4531  0003 270c          	jreq	L216
4532  0005 a105          	cp	a,#5
4533  0007 2708          	jreq	L216
4534  0009 a106          	cp	a,#6
4535  000b 2704          	jreq	L216
4536  000d a107          	cp	a,#7
4537  000f 2603          	jrne	L016
4538  0011               L216:
4539  0011 4f            	clr	a
4540  0012 2010          	jra	L416
4541  0014               L016:
4542  0014 ae039e        	ldw	x,#926
4543  0017 89            	pushw	x
4544  0018 ae0000        	ldw	x,#0
4545  001b 89            	pushw	x
4546  001c ae0000        	ldw	x,#L101
4547  001f cd0000        	call	_assert_failed
4549  0022 5b04          	addw	sp,#4
4550  0024               L416:
4551                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4551                     ; 930                          (uint8_t)TIM1_SlaveMode);
4553  0024 c65252        	ld	a,21074
4554  0027 a4f8          	and	a,#248
4555  0029 1a01          	or	a,(OFST+1,sp)
4556  002b c75252        	ld	21074,a
4557                     ; 931 }
4560  002e 84            	pop	a
4561  002f 81            	ret
4598                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4598                     ; 940 {
4599                     .text:	section	.text,new
4600  0000               _TIM1_SelectMasterSlaveMode:
4602  0000 88            	push	a
4603       00000000      OFST:	set	0
4606                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4608  0001 4d            	tnz	a
4609  0002 2704          	jreq	L226
4610  0004 a101          	cp	a,#1
4611  0006 2603          	jrne	L026
4612  0008               L226:
4613  0008 4f            	clr	a
4614  0009 2010          	jra	L426
4615  000b               L026:
4616  000b ae03ae        	ldw	x,#942
4617  000e 89            	pushw	x
4618  000f ae0000        	ldw	x,#0
4619  0012 89            	pushw	x
4620  0013 ae0000        	ldw	x,#L101
4621  0016 cd0000        	call	_assert_failed
4623  0019 5b04          	addw	sp,#4
4624  001b               L426:
4625                     ; 945   if (NewState != DISABLE)
4627  001b 0d01          	tnz	(OFST+1,sp)
4628  001d 2706          	jreq	L5161
4629                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4631  001f 721e5252      	bset	21074,#7
4633  0023 2004          	jra	L7161
4634  0025               L5161:
4635                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4637  0025 721f5252      	bres	21074,#7
4638  0029               L7161:
4639                     ; 953 }
4642  0029 84            	pop	a
4643  002a 81            	ret
4730                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4730                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4730                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4730                     ; 978 {
4731                     .text:	section	.text,new
4732  0000               _TIM1_EncoderInterfaceConfig:
4734  0000 89            	pushw	x
4735       00000000      OFST:	set	0
4738                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4740  0001 9e            	ld	a,xh
4741  0002 a101          	cp	a,#1
4742  0004 270a          	jreq	L236
4743  0006 9e            	ld	a,xh
4744  0007 a102          	cp	a,#2
4745  0009 2705          	jreq	L236
4746  000b 9e            	ld	a,xh
4747  000c a103          	cp	a,#3
4748  000e 2603          	jrne	L036
4749  0010               L236:
4750  0010 4f            	clr	a
4751  0011 2010          	jra	L436
4752  0013               L036:
4753  0013 ae03d4        	ldw	x,#980
4754  0016 89            	pushw	x
4755  0017 ae0000        	ldw	x,#0
4756  001a 89            	pushw	x
4757  001b ae0000        	ldw	x,#L101
4758  001e cd0000        	call	_assert_failed
4760  0021 5b04          	addw	sp,#4
4761  0023               L436:
4762                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4764  0023 0d02          	tnz	(OFST+2,sp)
4765  0025 2706          	jreq	L046
4766  0027 7b02          	ld	a,(OFST+2,sp)
4767  0029 a101          	cp	a,#1
4768  002b 2603          	jrne	L636
4769  002d               L046:
4770  002d 4f            	clr	a
4771  002e 2010          	jra	L246
4772  0030               L636:
4773  0030 ae03d5        	ldw	x,#981
4774  0033 89            	pushw	x
4775  0034 ae0000        	ldw	x,#0
4776  0037 89            	pushw	x
4777  0038 ae0000        	ldw	x,#L101
4778  003b cd0000        	call	_assert_failed
4780  003e 5b04          	addw	sp,#4
4781  0040               L246:
4782                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4784  0040 0d05          	tnz	(OFST+5,sp)
4785  0042 2706          	jreq	L646
4786  0044 7b05          	ld	a,(OFST+5,sp)
4787  0046 a101          	cp	a,#1
4788  0048 2603          	jrne	L446
4789  004a               L646:
4790  004a 4f            	clr	a
4791  004b 2010          	jra	L056
4792  004d               L446:
4793  004d ae03d6        	ldw	x,#982
4794  0050 89            	pushw	x
4795  0051 ae0000        	ldw	x,#0
4796  0054 89            	pushw	x
4797  0055 ae0000        	ldw	x,#L101
4798  0058 cd0000        	call	_assert_failed
4800  005b 5b04          	addw	sp,#4
4801  005d               L056:
4802                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4804  005d 0d02          	tnz	(OFST+2,sp)
4805  005f 2706          	jreq	L1661
4806                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4808  0061 7212525c      	bset	21084,#1
4810  0065 2004          	jra	L3661
4811  0067               L1661:
4812                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4814  0067 7213525c      	bres	21084,#1
4815  006b               L3661:
4816                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4818  006b 0d05          	tnz	(OFST+5,sp)
4819  006d 2706          	jreq	L5661
4820                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4822  006f 721a525c      	bset	21084,#5
4824  0073 2004          	jra	L7661
4825  0075               L5661:
4826                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4828  0075 721b525c      	bres	21084,#5
4829  0079               L7661:
4830                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4830                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4832  0079 c65252        	ld	a,21074
4833  007c a4f0          	and	a,#240
4834  007e 1a01          	or	a,(OFST+1,sp)
4835  0080 c75252        	ld	21074,a
4836                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4836                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4838  0083 c65258        	ld	a,21080
4839  0086 a4fc          	and	a,#252
4840  0088 aa01          	or	a,#1
4841  008a c75258        	ld	21080,a
4842                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4842                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4844  008d c65259        	ld	a,21081
4845  0090 a4fc          	and	a,#252
4846  0092 aa01          	or	a,#1
4847  0094 c75259        	ld	21081,a
4848                     ; 1011 }
4851  0097 85            	popw	x
4852  0098 81            	ret
4920                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4920                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4920                     ; 1025 {
4921                     .text:	section	.text,new
4922  0000               _TIM1_PrescalerConfig:
4924  0000 89            	pushw	x
4925       00000000      OFST:	set	0
4928                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4930  0001 0d05          	tnz	(OFST+5,sp)
4931  0003 2706          	jreq	L656
4932  0005 7b05          	ld	a,(OFST+5,sp)
4933  0007 a101          	cp	a,#1
4934  0009 2603          	jrne	L456
4935  000b               L656:
4936  000b 4f            	clr	a
4937  000c 2010          	jra	L066
4938  000e               L456:
4939  000e ae0403        	ldw	x,#1027
4940  0011 89            	pushw	x
4941  0012 ae0000        	ldw	x,#0
4942  0015 89            	pushw	x
4943  0016 ae0000        	ldw	x,#L101
4944  0019 cd0000        	call	_assert_failed
4946  001c 5b04          	addw	sp,#4
4947  001e               L066:
4948                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4950  001e 7b01          	ld	a,(OFST+1,sp)
4951  0020 c75260        	ld	21088,a
4952                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4954  0023 7b02          	ld	a,(OFST+2,sp)
4955  0025 c75261        	ld	21089,a
4956                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4958  0028 7b05          	ld	a,(OFST+5,sp)
4959  002a c75257        	ld	21079,a
4960                     ; 1035 }
4963  002d 85            	popw	x
4964  002e 81            	ret
5001                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
5001                     ; 1049 {
5002                     .text:	section	.text,new
5003  0000               _TIM1_CounterModeConfig:
5005  0000 88            	push	a
5006       00000000      OFST:	set	0
5009                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5011  0001 4d            	tnz	a
5012  0002 2710          	jreq	L666
5013  0004 a110          	cp	a,#16
5014  0006 270c          	jreq	L666
5015  0008 a120          	cp	a,#32
5016  000a 2708          	jreq	L666
5017  000c a140          	cp	a,#64
5018  000e 2704          	jreq	L666
5019  0010 a160          	cp	a,#96
5020  0012 2603          	jrne	L466
5021  0014               L666:
5022  0014 4f            	clr	a
5023  0015 2010          	jra	L076
5024  0017               L466:
5025  0017 ae041b        	ldw	x,#1051
5026  001a 89            	pushw	x
5027  001b ae0000        	ldw	x,#0
5028  001e 89            	pushw	x
5029  001f ae0000        	ldw	x,#L101
5030  0022 cd0000        	call	_assert_failed
5032  0025 5b04          	addw	sp,#4
5033  0027               L076:
5034                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5034                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5036  0027 c65250        	ld	a,21072
5037  002a a48f          	and	a,#143
5038  002c 1a01          	or	a,(OFST+1,sp)
5039  002e c75250        	ld	21072,a
5040                     ; 1057 }
5043  0031 84            	pop	a
5044  0032 81            	ret
5103                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5103                     ; 1068 {
5104                     .text:	section	.text,new
5105  0000               _TIM1_ForcedOC1Config:
5107  0000 88            	push	a
5108       00000000      OFST:	set	0
5111                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5113  0001 a150          	cp	a,#80
5114  0003 2704          	jreq	L676
5115  0005 a140          	cp	a,#64
5116  0007 2603          	jrne	L476
5117  0009               L676:
5118  0009 4f            	clr	a
5119  000a 2010          	jra	L007
5120  000c               L476:
5121  000c ae042e        	ldw	x,#1070
5122  000f 89            	pushw	x
5123  0010 ae0000        	ldw	x,#0
5124  0013 89            	pushw	x
5125  0014 ae0000        	ldw	x,#L101
5126  0017 cd0000        	call	_assert_failed
5128  001a 5b04          	addw	sp,#4
5129  001c               L007:
5130                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5130                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5132  001c c65258        	ld	a,21080
5133  001f a48f          	and	a,#143
5134  0021 1a01          	or	a,(OFST+1,sp)
5135  0023 c75258        	ld	21080,a
5136                     ; 1075 }
5139  0026 84            	pop	a
5140  0027 81            	ret
5177                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5177                     ; 1086 {
5178                     .text:	section	.text,new
5179  0000               _TIM1_ForcedOC2Config:
5181  0000 88            	push	a
5182       00000000      OFST:	set	0
5185                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5187  0001 a150          	cp	a,#80
5188  0003 2704          	jreq	L607
5189  0005 a140          	cp	a,#64
5190  0007 2603          	jrne	L407
5191  0009               L607:
5192  0009 4f            	clr	a
5193  000a 2010          	jra	L017
5194  000c               L407:
5195  000c ae0440        	ldw	x,#1088
5196  000f 89            	pushw	x
5197  0010 ae0000        	ldw	x,#0
5198  0013 89            	pushw	x
5199  0014 ae0000        	ldw	x,#L101
5200  0017 cd0000        	call	_assert_failed
5202  001a 5b04          	addw	sp,#4
5203  001c               L017:
5204                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5204                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5206  001c c65259        	ld	a,21081
5207  001f a48f          	and	a,#143
5208  0021 1a01          	or	a,(OFST+1,sp)
5209  0023 c75259        	ld	21081,a
5210                     ; 1093 }
5213  0026 84            	pop	a
5214  0027 81            	ret
5251                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5251                     ; 1105 {
5252                     .text:	section	.text,new
5253  0000               _TIM1_ForcedOC3Config:
5255  0000 88            	push	a
5256       00000000      OFST:	set	0
5259                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5261  0001 a150          	cp	a,#80
5262  0003 2704          	jreq	L617
5263  0005 a140          	cp	a,#64
5264  0007 2603          	jrne	L417
5265  0009               L617:
5266  0009 4f            	clr	a
5267  000a 2010          	jra	L027
5268  000c               L417:
5269  000c ae0453        	ldw	x,#1107
5270  000f 89            	pushw	x
5271  0010 ae0000        	ldw	x,#0
5272  0013 89            	pushw	x
5273  0014 ae0000        	ldw	x,#L101
5274  0017 cd0000        	call	_assert_failed
5276  001a 5b04          	addw	sp,#4
5277  001c               L027:
5278                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5278                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5280  001c c6525a        	ld	a,21082
5281  001f a48f          	and	a,#143
5282  0021 1a01          	or	a,(OFST+1,sp)
5283  0023 c7525a        	ld	21082,a
5284                     ; 1112 }
5287  0026 84            	pop	a
5288  0027 81            	ret
5325                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5325                     ; 1124 {
5326                     .text:	section	.text,new
5327  0000               _TIM1_ForcedOC4Config:
5329  0000 88            	push	a
5330       00000000      OFST:	set	0
5333                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5335  0001 a150          	cp	a,#80
5336  0003 2704          	jreq	L627
5337  0005 a140          	cp	a,#64
5338  0007 2603          	jrne	L427
5339  0009               L627:
5340  0009 4f            	clr	a
5341  000a 2010          	jra	L037
5342  000c               L427:
5343  000c ae0466        	ldw	x,#1126
5344  000f 89            	pushw	x
5345  0010 ae0000        	ldw	x,#0
5346  0013 89            	pushw	x
5347  0014 ae0000        	ldw	x,#L101
5348  0017 cd0000        	call	_assert_failed
5350  001a 5b04          	addw	sp,#4
5351  001c               L037:
5352                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5352                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5354  001c c6525b        	ld	a,21083
5355  001f a48f          	and	a,#143
5356  0021 1a01          	or	a,(OFST+1,sp)
5357  0023 c7525b        	ld	21083,a
5358                     ; 1131 }
5361  0026 84            	pop	a
5362  0027 81            	ret
5399                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5399                     ; 1140 {
5400                     .text:	section	.text,new
5401  0000               _TIM1_ARRPreloadConfig:
5403  0000 88            	push	a
5404       00000000      OFST:	set	0
5407                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5409  0001 4d            	tnz	a
5410  0002 2704          	jreq	L637
5411  0004 a101          	cp	a,#1
5412  0006 2603          	jrne	L437
5413  0008               L637:
5414  0008 4f            	clr	a
5415  0009 2010          	jra	L047
5416  000b               L437:
5417  000b ae0476        	ldw	x,#1142
5418  000e 89            	pushw	x
5419  000f ae0000        	ldw	x,#0
5420  0012 89            	pushw	x
5421  0013 ae0000        	ldw	x,#L101
5422  0016 cd0000        	call	_assert_failed
5424  0019 5b04          	addw	sp,#4
5425  001b               L047:
5426                     ; 1145   if (NewState != DISABLE)
5428  001b 0d01          	tnz	(OFST+1,sp)
5429  001d 2706          	jreq	L7502
5430                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5432  001f 721e5250      	bset	21072,#7
5434  0023 2004          	jra	L1602
5435  0025               L7502:
5436                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5438  0025 721f5250      	bres	21072,#7
5439  0029               L1602:
5440                     ; 1153 }
5443  0029 84            	pop	a
5444  002a 81            	ret
5480                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5480                     ; 1162 {
5481                     .text:	section	.text,new
5482  0000               _TIM1_SelectCOM:
5484  0000 88            	push	a
5485       00000000      OFST:	set	0
5488                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5490  0001 4d            	tnz	a
5491  0002 2704          	jreq	L647
5492  0004 a101          	cp	a,#1
5493  0006 2603          	jrne	L447
5494  0008               L647:
5495  0008 4f            	clr	a
5496  0009 2010          	jra	L057
5497  000b               L447:
5498  000b ae048c        	ldw	x,#1164
5499  000e 89            	pushw	x
5500  000f ae0000        	ldw	x,#0
5501  0012 89            	pushw	x
5502  0013 ae0000        	ldw	x,#L101
5503  0016 cd0000        	call	_assert_failed
5505  0019 5b04          	addw	sp,#4
5506  001b               L057:
5507                     ; 1167   if (NewState != DISABLE)
5509  001b 0d01          	tnz	(OFST+1,sp)
5510  001d 2706          	jreq	L1012
5511                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5513  001f 72145251      	bset	21073,#2
5515  0023 2004          	jra	L3012
5516  0025               L1012:
5517                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5519  0025 72155251      	bres	21073,#2
5520  0029               L3012:
5521                     ; 1175 }
5524  0029 84            	pop	a
5525  002a 81            	ret
5562                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5562                     ; 1184 {
5563                     .text:	section	.text,new
5564  0000               _TIM1_CCPreloadControl:
5566  0000 88            	push	a
5567       00000000      OFST:	set	0
5570                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5572  0001 4d            	tnz	a
5573  0002 2704          	jreq	L657
5574  0004 a101          	cp	a,#1
5575  0006 2603          	jrne	L457
5576  0008               L657:
5577  0008 4f            	clr	a
5578  0009 2010          	jra	L067
5579  000b               L457:
5580  000b ae04a2        	ldw	x,#1186
5581  000e 89            	pushw	x
5582  000f ae0000        	ldw	x,#0
5583  0012 89            	pushw	x
5584  0013 ae0000        	ldw	x,#L101
5585  0016 cd0000        	call	_assert_failed
5587  0019 5b04          	addw	sp,#4
5588  001b               L067:
5589                     ; 1189   if (NewState != DISABLE)
5591  001b 0d01          	tnz	(OFST+1,sp)
5592  001d 2706          	jreq	L3212
5593                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5595  001f 72105251      	bset	21073,#0
5597  0023 2004          	jra	L5212
5598  0025               L3212:
5599                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5601  0025 72115251      	bres	21073,#0
5602  0029               L5212:
5603                     ; 1197 }
5606  0029 84            	pop	a
5607  002a 81            	ret
5644                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5644                     ; 1206 {
5645                     .text:	section	.text,new
5646  0000               _TIM1_OC1PreloadConfig:
5648  0000 88            	push	a
5649       00000000      OFST:	set	0
5652                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5654  0001 4d            	tnz	a
5655  0002 2704          	jreq	L667
5656  0004 a101          	cp	a,#1
5657  0006 2603          	jrne	L467
5658  0008               L667:
5659  0008 4f            	clr	a
5660  0009 2010          	jra	L077
5661  000b               L467:
5662  000b ae04b8        	ldw	x,#1208
5663  000e 89            	pushw	x
5664  000f ae0000        	ldw	x,#0
5665  0012 89            	pushw	x
5666  0013 ae0000        	ldw	x,#L101
5667  0016 cd0000        	call	_assert_failed
5669  0019 5b04          	addw	sp,#4
5670  001b               L077:
5671                     ; 1211   if (NewState != DISABLE)
5673  001b 0d01          	tnz	(OFST+1,sp)
5674  001d 2706          	jreq	L5412
5675                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5677  001f 72165258      	bset	21080,#3
5679  0023 2004          	jra	L7412
5680  0025               L5412:
5681                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5683  0025 72175258      	bres	21080,#3
5684  0029               L7412:
5685                     ; 1219 }
5688  0029 84            	pop	a
5689  002a 81            	ret
5726                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5726                     ; 1228 {
5727                     .text:	section	.text,new
5728  0000               _TIM1_OC2PreloadConfig:
5730  0000 88            	push	a
5731       00000000      OFST:	set	0
5734                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5736  0001 4d            	tnz	a
5737  0002 2704          	jreq	L677
5738  0004 a101          	cp	a,#1
5739  0006 2603          	jrne	L477
5740  0008               L677:
5741  0008 4f            	clr	a
5742  0009 2010          	jra	L0001
5743  000b               L477:
5744  000b ae04ce        	ldw	x,#1230
5745  000e 89            	pushw	x
5746  000f ae0000        	ldw	x,#0
5747  0012 89            	pushw	x
5748  0013 ae0000        	ldw	x,#L101
5749  0016 cd0000        	call	_assert_failed
5751  0019 5b04          	addw	sp,#4
5752  001b               L0001:
5753                     ; 1233   if (NewState != DISABLE)
5755  001b 0d01          	tnz	(OFST+1,sp)
5756  001d 2706          	jreq	L7612
5757                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5759  001f 72165259      	bset	21081,#3
5761  0023 2004          	jra	L1712
5762  0025               L7612:
5763                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5765  0025 72175259      	bres	21081,#3
5766  0029               L1712:
5767                     ; 1241 }
5770  0029 84            	pop	a
5771  002a 81            	ret
5808                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5808                     ; 1250 {
5809                     .text:	section	.text,new
5810  0000               _TIM1_OC3PreloadConfig:
5812  0000 88            	push	a
5813       00000000      OFST:	set	0
5816                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5818  0001 4d            	tnz	a
5819  0002 2704          	jreq	L6001
5820  0004 a101          	cp	a,#1
5821  0006 2603          	jrne	L4001
5822  0008               L6001:
5823  0008 4f            	clr	a
5824  0009 2010          	jra	L0101
5825  000b               L4001:
5826  000b ae04e4        	ldw	x,#1252
5827  000e 89            	pushw	x
5828  000f ae0000        	ldw	x,#0
5829  0012 89            	pushw	x
5830  0013 ae0000        	ldw	x,#L101
5831  0016 cd0000        	call	_assert_failed
5833  0019 5b04          	addw	sp,#4
5834  001b               L0101:
5835                     ; 1255   if (NewState != DISABLE)
5837  001b 0d01          	tnz	(OFST+1,sp)
5838  001d 2706          	jreq	L1122
5839                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5841  001f 7216525a      	bset	21082,#3
5843  0023 2004          	jra	L3122
5844  0025               L1122:
5845                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5847  0025 7217525a      	bres	21082,#3
5848  0029               L3122:
5849                     ; 1263 }
5852  0029 84            	pop	a
5853  002a 81            	ret
5890                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5890                     ; 1272 {
5891                     .text:	section	.text,new
5892  0000               _TIM1_OC4PreloadConfig:
5894  0000 88            	push	a
5895       00000000      OFST:	set	0
5898                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5900  0001 4d            	tnz	a
5901  0002 2704          	jreq	L6101
5902  0004 a101          	cp	a,#1
5903  0006 2603          	jrne	L4101
5904  0008               L6101:
5905  0008 4f            	clr	a
5906  0009 2010          	jra	L0201
5907  000b               L4101:
5908  000b ae04fa        	ldw	x,#1274
5909  000e 89            	pushw	x
5910  000f ae0000        	ldw	x,#0
5911  0012 89            	pushw	x
5912  0013 ae0000        	ldw	x,#L101
5913  0016 cd0000        	call	_assert_failed
5915  0019 5b04          	addw	sp,#4
5916  001b               L0201:
5917                     ; 1277   if (NewState != DISABLE)
5919  001b 0d01          	tnz	(OFST+1,sp)
5920  001d 2706          	jreq	L3322
5921                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5923  001f 7216525b      	bset	21083,#3
5925  0023 2004          	jra	L5322
5926  0025               L3322:
5927                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5929  0025 7217525b      	bres	21083,#3
5930  0029               L5322:
5931                     ; 1285 }
5934  0029 84            	pop	a
5935  002a 81            	ret
5971                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5971                     ; 1294 {
5972                     .text:	section	.text,new
5973  0000               _TIM1_OC1FastConfig:
5975  0000 88            	push	a
5976       00000000      OFST:	set	0
5979                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5981  0001 4d            	tnz	a
5982  0002 2704          	jreq	L6201
5983  0004 a101          	cp	a,#1
5984  0006 2603          	jrne	L4201
5985  0008               L6201:
5986  0008 4f            	clr	a
5987  0009 2010          	jra	L0301
5988  000b               L4201:
5989  000b ae0510        	ldw	x,#1296
5990  000e 89            	pushw	x
5991  000f ae0000        	ldw	x,#0
5992  0012 89            	pushw	x
5993  0013 ae0000        	ldw	x,#L101
5994  0016 cd0000        	call	_assert_failed
5996  0019 5b04          	addw	sp,#4
5997  001b               L0301:
5998                     ; 1299   if (NewState != DISABLE)
6000  001b 0d01          	tnz	(OFST+1,sp)
6001  001d 2706          	jreq	L5522
6002                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
6004  001f 72145258      	bset	21080,#2
6006  0023 2004          	jra	L7522
6007  0025               L5522:
6008                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6010  0025 72155258      	bres	21080,#2
6011  0029               L7522:
6012                     ; 1307 }
6015  0029 84            	pop	a
6016  002a 81            	ret
6052                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6052                     ; 1316 {
6053                     .text:	section	.text,new
6054  0000               _TIM1_OC2FastConfig:
6056  0000 88            	push	a
6057       00000000      OFST:	set	0
6060                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6062  0001 4d            	tnz	a
6063  0002 2704          	jreq	L6301
6064  0004 a101          	cp	a,#1
6065  0006 2603          	jrne	L4301
6066  0008               L6301:
6067  0008 4f            	clr	a
6068  0009 2010          	jra	L0401
6069  000b               L4301:
6070  000b ae0526        	ldw	x,#1318
6071  000e 89            	pushw	x
6072  000f ae0000        	ldw	x,#0
6073  0012 89            	pushw	x
6074  0013 ae0000        	ldw	x,#L101
6075  0016 cd0000        	call	_assert_failed
6077  0019 5b04          	addw	sp,#4
6078  001b               L0401:
6079                     ; 1321   if (NewState != DISABLE)
6081  001b 0d01          	tnz	(OFST+1,sp)
6082  001d 2706          	jreq	L7722
6083                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6085  001f 72145259      	bset	21081,#2
6087  0023 2004          	jra	L1032
6088  0025               L7722:
6089                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6091  0025 72155259      	bres	21081,#2
6092  0029               L1032:
6093                     ; 1329 }
6096  0029 84            	pop	a
6097  002a 81            	ret
6133                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6133                     ; 1338 {
6134                     .text:	section	.text,new
6135  0000               _TIM1_OC3FastConfig:
6137  0000 88            	push	a
6138       00000000      OFST:	set	0
6141                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6143  0001 4d            	tnz	a
6144  0002 2704          	jreq	L6401
6145  0004 a101          	cp	a,#1
6146  0006 2603          	jrne	L4401
6147  0008               L6401:
6148  0008 4f            	clr	a
6149  0009 2010          	jra	L0501
6150  000b               L4401:
6151  000b ae053c        	ldw	x,#1340
6152  000e 89            	pushw	x
6153  000f ae0000        	ldw	x,#0
6154  0012 89            	pushw	x
6155  0013 ae0000        	ldw	x,#L101
6156  0016 cd0000        	call	_assert_failed
6158  0019 5b04          	addw	sp,#4
6159  001b               L0501:
6160                     ; 1343   if (NewState != DISABLE)
6162  001b 0d01          	tnz	(OFST+1,sp)
6163  001d 2706          	jreq	L1232
6164                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6166  001f 7214525a      	bset	21082,#2
6168  0023 2004          	jra	L3232
6169  0025               L1232:
6170                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6172  0025 7215525a      	bres	21082,#2
6173  0029               L3232:
6174                     ; 1351 }
6177  0029 84            	pop	a
6178  002a 81            	ret
6214                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6214                     ; 1360 {
6215                     .text:	section	.text,new
6216  0000               _TIM1_OC4FastConfig:
6218  0000 88            	push	a
6219       00000000      OFST:	set	0
6222                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6224  0001 4d            	tnz	a
6225  0002 2704          	jreq	L6501
6226  0004 a101          	cp	a,#1
6227  0006 2603          	jrne	L4501
6228  0008               L6501:
6229  0008 4f            	clr	a
6230  0009 2010          	jra	L0601
6231  000b               L4501:
6232  000b ae0552        	ldw	x,#1362
6233  000e 89            	pushw	x
6234  000f ae0000        	ldw	x,#0
6235  0012 89            	pushw	x
6236  0013 ae0000        	ldw	x,#L101
6237  0016 cd0000        	call	_assert_failed
6239  0019 5b04          	addw	sp,#4
6240  001b               L0601:
6241                     ; 1365   if (NewState != DISABLE)
6243  001b 0d01          	tnz	(OFST+1,sp)
6244  001d 2706          	jreq	L3432
6245                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6247  001f 7214525b      	bset	21083,#2
6249  0023 2004          	jra	L5432
6250  0025               L3432:
6251                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6253  0025 7215525b      	bres	21083,#2
6254  0029               L5432:
6255                     ; 1373 }
6258  0029 84            	pop	a
6259  002a 81            	ret
6365                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6365                     ; 1390 {
6366                     .text:	section	.text,new
6367  0000               _TIM1_GenerateEvent:
6369  0000 88            	push	a
6370       00000000      OFST:	set	0
6373                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6375  0001 4d            	tnz	a
6376  0002 2703          	jreq	L4601
6377  0004 4f            	clr	a
6378  0005 2010          	jra	L6601
6379  0007               L4601:
6380  0007 ae0570        	ldw	x,#1392
6381  000a 89            	pushw	x
6382  000b ae0000        	ldw	x,#0
6383  000e 89            	pushw	x
6384  000f ae0000        	ldw	x,#L101
6385  0012 cd0000        	call	_assert_failed
6387  0015 5b04          	addw	sp,#4
6388  0017               L6601:
6389                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6391  0017 7b01          	ld	a,(OFST+1,sp)
6392  0019 c75257        	ld	21079,a
6393                     ; 1396 }
6396  001c 84            	pop	a
6397  001d 81            	ret
6434                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6434                     ; 1407 {
6435                     .text:	section	.text,new
6436  0000               _TIM1_OC1PolarityConfig:
6438  0000 88            	push	a
6439       00000000      OFST:	set	0
6442                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6444  0001 4d            	tnz	a
6445  0002 2704          	jreq	L4701
6446  0004 a122          	cp	a,#34
6447  0006 2603          	jrne	L2701
6448  0008               L4701:
6449  0008 4f            	clr	a
6450  0009 2010          	jra	L6701
6451  000b               L2701:
6452  000b ae0581        	ldw	x,#1409
6453  000e 89            	pushw	x
6454  000f ae0000        	ldw	x,#0
6455  0012 89            	pushw	x
6456  0013 ae0000        	ldw	x,#L101
6457  0016 cd0000        	call	_assert_failed
6459  0019 5b04          	addw	sp,#4
6460  001b               L6701:
6461                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6463  001b 0d01          	tnz	(OFST+1,sp)
6464  001d 2706          	jreq	L7242
6465                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6467  001f 7212525c      	bset	21084,#1
6469  0023 2004          	jra	L1342
6470  0025               L7242:
6471                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6473  0025 7213525c      	bres	21084,#1
6474  0029               L1342:
6475                     ; 1420 }
6478  0029 84            	pop	a
6479  002a 81            	ret
6516                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6516                     ; 1431 {
6517                     .text:	section	.text,new
6518  0000               _TIM1_OC1NPolarityConfig:
6520  0000 88            	push	a
6521       00000000      OFST:	set	0
6524                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6526  0001 4d            	tnz	a
6527  0002 2704          	jreq	L4011
6528  0004 a188          	cp	a,#136
6529  0006 2603          	jrne	L2011
6530  0008               L4011:
6531  0008 4f            	clr	a
6532  0009 2010          	jra	L6011
6533  000b               L2011:
6534  000b ae0599        	ldw	x,#1433
6535  000e 89            	pushw	x
6536  000f ae0000        	ldw	x,#0
6537  0012 89            	pushw	x
6538  0013 ae0000        	ldw	x,#L101
6539  0016 cd0000        	call	_assert_failed
6541  0019 5b04          	addw	sp,#4
6542  001b               L6011:
6543                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6545  001b 0d01          	tnz	(OFST+1,sp)
6546  001d 2706          	jreq	L1542
6547                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6549  001f 7216525c      	bset	21084,#3
6551  0023 2004          	jra	L3542
6552  0025               L1542:
6553                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6555  0025 7217525c      	bres	21084,#3
6556  0029               L3542:
6557                     ; 1444 }
6560  0029 84            	pop	a
6561  002a 81            	ret
6598                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6598                     ; 1455 {
6599                     .text:	section	.text,new
6600  0000               _TIM1_OC2PolarityConfig:
6602  0000 88            	push	a
6603       00000000      OFST:	set	0
6606                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6608  0001 4d            	tnz	a
6609  0002 2704          	jreq	L4111
6610  0004 a122          	cp	a,#34
6611  0006 2603          	jrne	L2111
6612  0008               L4111:
6613  0008 4f            	clr	a
6614  0009 2010          	jra	L6111
6615  000b               L2111:
6616  000b ae05b1        	ldw	x,#1457
6617  000e 89            	pushw	x
6618  000f ae0000        	ldw	x,#0
6619  0012 89            	pushw	x
6620  0013 ae0000        	ldw	x,#L101
6621  0016 cd0000        	call	_assert_failed
6623  0019 5b04          	addw	sp,#4
6624  001b               L6111:
6625                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6627  001b 0d01          	tnz	(OFST+1,sp)
6628  001d 2706          	jreq	L3742
6629                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6631  001f 721a525c      	bset	21084,#5
6633  0023 2004          	jra	L5742
6634  0025               L3742:
6635                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6637  0025 721b525c      	bres	21084,#5
6638  0029               L5742:
6639                     ; 1468 }
6642  0029 84            	pop	a
6643  002a 81            	ret
6680                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6680                     ; 1479 {
6681                     .text:	section	.text,new
6682  0000               _TIM1_OC2NPolarityConfig:
6684  0000 88            	push	a
6685       00000000      OFST:	set	0
6688                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6690  0001 4d            	tnz	a
6691  0002 2704          	jreq	L4211
6692  0004 a188          	cp	a,#136
6693  0006 2603          	jrne	L2211
6694  0008               L4211:
6695  0008 4f            	clr	a
6696  0009 2010          	jra	L6211
6697  000b               L2211:
6698  000b ae05c9        	ldw	x,#1481
6699  000e 89            	pushw	x
6700  000f ae0000        	ldw	x,#0
6701  0012 89            	pushw	x
6702  0013 ae0000        	ldw	x,#L101
6703  0016 cd0000        	call	_assert_failed
6705  0019 5b04          	addw	sp,#4
6706  001b               L6211:
6707                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6709  001b 0d01          	tnz	(OFST+1,sp)
6710  001d 2706          	jreq	L5152
6711                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6713  001f 721e525c      	bset	21084,#7
6715  0023 2004          	jra	L7152
6716  0025               L5152:
6717                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6719  0025 721f525c      	bres	21084,#7
6720  0029               L7152:
6721                     ; 1492 }
6724  0029 84            	pop	a
6725  002a 81            	ret
6762                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6762                     ; 1503 {
6763                     .text:	section	.text,new
6764  0000               _TIM1_OC3PolarityConfig:
6766  0000 88            	push	a
6767       00000000      OFST:	set	0
6770                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6772  0001 4d            	tnz	a
6773  0002 2704          	jreq	L4311
6774  0004 a122          	cp	a,#34
6775  0006 2603          	jrne	L2311
6776  0008               L4311:
6777  0008 4f            	clr	a
6778  0009 2010          	jra	L6311
6779  000b               L2311:
6780  000b ae05e1        	ldw	x,#1505
6781  000e 89            	pushw	x
6782  000f ae0000        	ldw	x,#0
6783  0012 89            	pushw	x
6784  0013 ae0000        	ldw	x,#L101
6785  0016 cd0000        	call	_assert_failed
6787  0019 5b04          	addw	sp,#4
6788  001b               L6311:
6789                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6791  001b 0d01          	tnz	(OFST+1,sp)
6792  001d 2706          	jreq	L7352
6793                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6795  001f 7212525d      	bset	21085,#1
6797  0023 2004          	jra	L1452
6798  0025               L7352:
6799                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6801  0025 7213525d      	bres	21085,#1
6802  0029               L1452:
6803                     ; 1516 }
6806  0029 84            	pop	a
6807  002a 81            	ret
6844                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6844                     ; 1528 {
6845                     .text:	section	.text,new
6846  0000               _TIM1_OC3NPolarityConfig:
6848  0000 88            	push	a
6849       00000000      OFST:	set	0
6852                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6854  0001 4d            	tnz	a
6855  0002 2704          	jreq	L4411
6856  0004 a188          	cp	a,#136
6857  0006 2603          	jrne	L2411
6858  0008               L4411:
6859  0008 4f            	clr	a
6860  0009 2010          	jra	L6411
6861  000b               L2411:
6862  000b ae05fa        	ldw	x,#1530
6863  000e 89            	pushw	x
6864  000f ae0000        	ldw	x,#0
6865  0012 89            	pushw	x
6866  0013 ae0000        	ldw	x,#L101
6867  0016 cd0000        	call	_assert_failed
6869  0019 5b04          	addw	sp,#4
6870  001b               L6411:
6871                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6873  001b 0d01          	tnz	(OFST+1,sp)
6874  001d 2706          	jreq	L1652
6875                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6877  001f 7216525d      	bset	21085,#3
6879  0023 2004          	jra	L3652
6880  0025               L1652:
6881                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6883  0025 7217525d      	bres	21085,#3
6884  0029               L3652:
6885                     ; 1541 }
6888  0029 84            	pop	a
6889  002a 81            	ret
6926                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6926                     ; 1552 {
6927                     .text:	section	.text,new
6928  0000               _TIM1_OC4PolarityConfig:
6930  0000 88            	push	a
6931       00000000      OFST:	set	0
6934                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6936  0001 4d            	tnz	a
6937  0002 2704          	jreq	L4511
6938  0004 a122          	cp	a,#34
6939  0006 2603          	jrne	L2511
6940  0008               L4511:
6941  0008 4f            	clr	a
6942  0009 2010          	jra	L6511
6943  000b               L2511:
6944  000b ae0612        	ldw	x,#1554
6945  000e 89            	pushw	x
6946  000f ae0000        	ldw	x,#0
6947  0012 89            	pushw	x
6948  0013 ae0000        	ldw	x,#L101
6949  0016 cd0000        	call	_assert_failed
6951  0019 5b04          	addw	sp,#4
6952  001b               L6511:
6953                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6955  001b 0d01          	tnz	(OFST+1,sp)
6956  001d 2706          	jreq	L3062
6957                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6959  001f 721a525d      	bset	21085,#5
6961  0023 2004          	jra	L5062
6962  0025               L3062:
6963                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6965  0025 721b525d      	bres	21085,#5
6966  0029               L5062:
6967                     ; 1565 }
6970  0029 84            	pop	a
6971  002a 81            	ret
7017                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7017                     ; 1580 {
7018                     .text:	section	.text,new
7019  0000               _TIM1_CCxCmd:
7021  0000 89            	pushw	x
7022       00000000      OFST:	set	0
7025                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7027  0001 9e            	ld	a,xh
7028  0002 4d            	tnz	a
7029  0003 270f          	jreq	L4611
7030  0005 9e            	ld	a,xh
7031  0006 a101          	cp	a,#1
7032  0008 270a          	jreq	L4611
7033  000a 9e            	ld	a,xh
7034  000b a102          	cp	a,#2
7035  000d 2705          	jreq	L4611
7036  000f 9e            	ld	a,xh
7037  0010 a103          	cp	a,#3
7038  0012 2603          	jrne	L2611
7039  0014               L4611:
7040  0014 4f            	clr	a
7041  0015 2010          	jra	L6611
7042  0017               L2611:
7043  0017 ae062e        	ldw	x,#1582
7044  001a 89            	pushw	x
7045  001b ae0000        	ldw	x,#0
7046  001e 89            	pushw	x
7047  001f ae0000        	ldw	x,#L101
7048  0022 cd0000        	call	_assert_failed
7050  0025 5b04          	addw	sp,#4
7051  0027               L6611:
7052                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7054  0027 0d02          	tnz	(OFST+2,sp)
7055  0029 2706          	jreq	L2711
7056  002b 7b02          	ld	a,(OFST+2,sp)
7057  002d a101          	cp	a,#1
7058  002f 2603          	jrne	L0711
7059  0031               L2711:
7060  0031 4f            	clr	a
7061  0032 2010          	jra	L4711
7062  0034               L0711:
7063  0034 ae062f        	ldw	x,#1583
7064  0037 89            	pushw	x
7065  0038 ae0000        	ldw	x,#0
7066  003b 89            	pushw	x
7067  003c ae0000        	ldw	x,#L101
7068  003f cd0000        	call	_assert_failed
7070  0042 5b04          	addw	sp,#4
7071  0044               L4711:
7072                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7074  0044 0d01          	tnz	(OFST+1,sp)
7075  0046 2610          	jrne	L1362
7076                     ; 1588     if (NewState != DISABLE)
7078  0048 0d02          	tnz	(OFST+2,sp)
7079  004a 2706          	jreq	L3362
7080                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7082  004c 7210525c      	bset	21084,#0
7084  0050 2040          	jra	L7362
7085  0052               L3362:
7086                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7088  0052 7211525c      	bres	21084,#0
7089  0056 203a          	jra	L7362
7090  0058               L1362:
7091                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7093  0058 7b01          	ld	a,(OFST+1,sp)
7094  005a a101          	cp	a,#1
7095  005c 2610          	jrne	L1462
7096                     ; 1601     if (NewState != DISABLE)
7098  005e 0d02          	tnz	(OFST+2,sp)
7099  0060 2706          	jreq	L3462
7100                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7102  0062 7218525c      	bset	21084,#4
7104  0066 202a          	jra	L7362
7105  0068               L3462:
7106                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7108  0068 7219525c      	bres	21084,#4
7109  006c 2024          	jra	L7362
7110  006e               L1462:
7111                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7113  006e 7b01          	ld	a,(OFST+1,sp)
7114  0070 a102          	cp	a,#2
7115  0072 2610          	jrne	L1562
7116                     ; 1613     if (NewState != DISABLE)
7118  0074 0d02          	tnz	(OFST+2,sp)
7119  0076 2706          	jreq	L3562
7120                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7122  0078 7210525d      	bset	21085,#0
7124  007c 2014          	jra	L7362
7125  007e               L3562:
7126                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7128  007e 7211525d      	bres	21085,#0
7129  0082 200e          	jra	L7362
7130  0084               L1562:
7131                     ; 1625     if (NewState != DISABLE)
7133  0084 0d02          	tnz	(OFST+2,sp)
7134  0086 2706          	jreq	L1662
7135                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7137  0088 7218525d      	bset	21085,#4
7139  008c 2004          	jra	L7362
7140  008e               L1662:
7141                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7143  008e 7219525d      	bres	21085,#4
7144  0092               L7362:
7145                     ; 1634 }
7148  0092 85            	popw	x
7149  0093 81            	ret
7195                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7195                     ; 1648 {
7196                     .text:	section	.text,new
7197  0000               _TIM1_CCxNCmd:
7199  0000 89            	pushw	x
7200       00000000      OFST:	set	0
7203                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7205  0001 9e            	ld	a,xh
7206  0002 4d            	tnz	a
7207  0003 270a          	jreq	L2021
7208  0005 9e            	ld	a,xh
7209  0006 a101          	cp	a,#1
7210  0008 2705          	jreq	L2021
7211  000a 9e            	ld	a,xh
7212  000b a102          	cp	a,#2
7213  000d 2603          	jrne	L0021
7214  000f               L2021:
7215  000f 4f            	clr	a
7216  0010 2010          	jra	L4021
7217  0012               L0021:
7218  0012 ae0672        	ldw	x,#1650
7219  0015 89            	pushw	x
7220  0016 ae0000        	ldw	x,#0
7221  0019 89            	pushw	x
7222  001a ae0000        	ldw	x,#L101
7223  001d cd0000        	call	_assert_failed
7225  0020 5b04          	addw	sp,#4
7226  0022               L4021:
7227                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7229  0022 0d02          	tnz	(OFST+2,sp)
7230  0024 2706          	jreq	L0121
7231  0026 7b02          	ld	a,(OFST+2,sp)
7232  0028 a101          	cp	a,#1
7233  002a 2603          	jrne	L6021
7234  002c               L0121:
7235  002c 4f            	clr	a
7236  002d 2010          	jra	L2121
7237  002f               L6021:
7238  002f ae0673        	ldw	x,#1651
7239  0032 89            	pushw	x
7240  0033 ae0000        	ldw	x,#0
7241  0036 89            	pushw	x
7242  0037 ae0000        	ldw	x,#L101
7243  003a cd0000        	call	_assert_failed
7245  003d 5b04          	addw	sp,#4
7246  003f               L2121:
7247                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7249  003f 0d01          	tnz	(OFST+1,sp)
7250  0041 2610          	jrne	L7072
7251                     ; 1656     if (NewState != DISABLE)
7253  0043 0d02          	tnz	(OFST+2,sp)
7254  0045 2706          	jreq	L1172
7255                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7257  0047 7214525c      	bset	21084,#2
7259  004b 202a          	jra	L5172
7260  004d               L1172:
7261                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7263  004d 7215525c      	bres	21084,#2
7264  0051 2024          	jra	L5172
7265  0053               L7072:
7266                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7268  0053 7b01          	ld	a,(OFST+1,sp)
7269  0055 a101          	cp	a,#1
7270  0057 2610          	jrne	L7172
7271                     ; 1668     if (NewState != DISABLE)
7273  0059 0d02          	tnz	(OFST+2,sp)
7274  005b 2706          	jreq	L1272
7275                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7277  005d 721c525c      	bset	21084,#6
7279  0061 2014          	jra	L5172
7280  0063               L1272:
7281                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7283  0063 721d525c      	bres	21084,#6
7284  0067 200e          	jra	L5172
7285  0069               L7172:
7286                     ; 1680     if (NewState != DISABLE)
7288  0069 0d02          	tnz	(OFST+2,sp)
7289  006b 2706          	jreq	L7272
7290                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7292  006d 7214525d      	bset	21085,#2
7294  0071 2004          	jra	L5172
7295  0073               L7272:
7296                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7298  0073 7215525d      	bres	21085,#2
7299  0077               L5172:
7300                     ; 1689 }
7303  0077 85            	popw	x
7304  0078 81            	ret
7350                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7350                     ; 1713 {
7351                     .text:	section	.text,new
7352  0000               _TIM1_SelectOCxM:
7354  0000 89            	pushw	x
7355       00000000      OFST:	set	0
7358                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7360  0001 9e            	ld	a,xh
7361  0002 4d            	tnz	a
7362  0003 270f          	jreq	L0221
7363  0005 9e            	ld	a,xh
7364  0006 a101          	cp	a,#1
7365  0008 270a          	jreq	L0221
7366  000a 9e            	ld	a,xh
7367  000b a102          	cp	a,#2
7368  000d 2705          	jreq	L0221
7369  000f 9e            	ld	a,xh
7370  0010 a103          	cp	a,#3
7371  0012 2603          	jrne	L6121
7372  0014               L0221:
7373  0014 4f            	clr	a
7374  0015 2010          	jra	L2221
7375  0017               L6121:
7376  0017 ae06b3        	ldw	x,#1715
7377  001a 89            	pushw	x
7378  001b ae0000        	ldw	x,#0
7379  001e 89            	pushw	x
7380  001f ae0000        	ldw	x,#L101
7381  0022 cd0000        	call	_assert_failed
7383  0025 5b04          	addw	sp,#4
7384  0027               L2221:
7385                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7387  0027 0d02          	tnz	(OFST+2,sp)
7388  0029 272a          	jreq	L6221
7389  002b 7b02          	ld	a,(OFST+2,sp)
7390  002d a110          	cp	a,#16
7391  002f 2724          	jreq	L6221
7392  0031 7b02          	ld	a,(OFST+2,sp)
7393  0033 a120          	cp	a,#32
7394  0035 271e          	jreq	L6221
7395  0037 7b02          	ld	a,(OFST+2,sp)
7396  0039 a130          	cp	a,#48
7397  003b 2718          	jreq	L6221
7398  003d 7b02          	ld	a,(OFST+2,sp)
7399  003f a160          	cp	a,#96
7400  0041 2712          	jreq	L6221
7401  0043 7b02          	ld	a,(OFST+2,sp)
7402  0045 a170          	cp	a,#112
7403  0047 270c          	jreq	L6221
7404  0049 7b02          	ld	a,(OFST+2,sp)
7405  004b a150          	cp	a,#80
7406  004d 2706          	jreq	L6221
7407  004f 7b02          	ld	a,(OFST+2,sp)
7408  0051 a140          	cp	a,#64
7409  0053 2603          	jrne	L4221
7410  0055               L6221:
7411  0055 4f            	clr	a
7412  0056 2010          	jra	L0321
7413  0058               L4221:
7414  0058 ae06b4        	ldw	x,#1716
7415  005b 89            	pushw	x
7416  005c ae0000        	ldw	x,#0
7417  005f 89            	pushw	x
7418  0060 ae0000        	ldw	x,#L101
7419  0063 cd0000        	call	_assert_failed
7421  0066 5b04          	addw	sp,#4
7422  0068               L0321:
7423                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7425  0068 0d01          	tnz	(OFST+1,sp)
7426  006a 2610          	jrne	L5572
7427                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7429  006c 7211525c      	bres	21084,#0
7430                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7430                     ; 1725                             | (uint8_t)TIM1_OCMode);
7432  0070 c65258        	ld	a,21080
7433  0073 a48f          	and	a,#143
7434  0075 1a02          	or	a,(OFST+2,sp)
7435  0077 c75258        	ld	21080,a
7437  007a 203a          	jra	L7572
7438  007c               L5572:
7439                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7441  007c 7b01          	ld	a,(OFST+1,sp)
7442  007e a101          	cp	a,#1
7443  0080 2610          	jrne	L1672
7444                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7446  0082 7219525c      	bres	21084,#4
7447                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7447                     ; 1734                             | (uint8_t)TIM1_OCMode);
7449  0086 c65259        	ld	a,21081
7450  0089 a48f          	and	a,#143
7451  008b 1a02          	or	a,(OFST+2,sp)
7452  008d c75259        	ld	21081,a
7454  0090 2024          	jra	L7572
7455  0092               L1672:
7456                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7458  0092 7b01          	ld	a,(OFST+1,sp)
7459  0094 a102          	cp	a,#2
7460  0096 2610          	jrne	L5672
7461                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7463  0098 7211525d      	bres	21085,#0
7464                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7464                     ; 1743                             | (uint8_t)TIM1_OCMode);
7466  009c c6525a        	ld	a,21082
7467  009f a48f          	and	a,#143
7468  00a1 1a02          	or	a,(OFST+2,sp)
7469  00a3 c7525a        	ld	21082,a
7471  00a6 200e          	jra	L7572
7472  00a8               L5672:
7473                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7475  00a8 7219525d      	bres	21085,#4
7476                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7476                     ; 1752                             | (uint8_t)TIM1_OCMode);
7478  00ac c6525b        	ld	a,21083
7479  00af a48f          	and	a,#143
7480  00b1 1a02          	or	a,(OFST+2,sp)
7481  00b3 c7525b        	ld	21083,a
7482  00b6               L7572:
7483                     ; 1754 }
7486  00b6 85            	popw	x
7487  00b7 81            	ret
7521                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7521                     ; 1763 {
7522                     .text:	section	.text,new
7523  0000               _TIM1_SetCounter:
7527                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7529  0000 9e            	ld	a,xh
7530  0001 c7525e        	ld	21086,a
7531                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7533  0004 9f            	ld	a,xl
7534  0005 c7525f        	ld	21087,a
7535                     ; 1767 }
7538  0008 81            	ret
7572                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7572                     ; 1776 {
7573                     .text:	section	.text,new
7574  0000               _TIM1_SetAutoreload:
7578                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7580  0000 9e            	ld	a,xh
7581  0001 c75262        	ld	21090,a
7582                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7584  0004 9f            	ld	a,xl
7585  0005 c75263        	ld	21091,a
7586                     ; 1780  }
7589  0008 81            	ret
7623                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7623                     ; 1789 {
7624                     .text:	section	.text,new
7625  0000               _TIM1_SetCompare1:
7629                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7631  0000 9e            	ld	a,xh
7632  0001 c75265        	ld	21093,a
7633                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7635  0004 9f            	ld	a,xl
7636  0005 c75266        	ld	21094,a
7637                     ; 1793 }
7640  0008 81            	ret
7674                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7674                     ; 1802 {
7675                     .text:	section	.text,new
7676  0000               _TIM1_SetCompare2:
7680                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7682  0000 9e            	ld	a,xh
7683  0001 c75267        	ld	21095,a
7684                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7686  0004 9f            	ld	a,xl
7687  0005 c75268        	ld	21096,a
7688                     ; 1806 }
7691  0008 81            	ret
7725                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7725                     ; 1815 {
7726                     .text:	section	.text,new
7727  0000               _TIM1_SetCompare3:
7731                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7733  0000 9e            	ld	a,xh
7734  0001 c75269        	ld	21097,a
7735                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7737  0004 9f            	ld	a,xl
7738  0005 c7526a        	ld	21098,a
7739                     ; 1819 }
7742  0008 81            	ret
7776                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7776                     ; 1828 {
7777                     .text:	section	.text,new
7778  0000               _TIM1_SetCompare4:
7782                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7784  0000 9e            	ld	a,xh
7785  0001 c7526b        	ld	21099,a
7786                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7788  0004 9f            	ld	a,xl
7789  0005 c7526c        	ld	21100,a
7790                     ; 1832 }
7793  0008 81            	ret
7830                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7830                     ; 1845 {
7831                     .text:	section	.text,new
7832  0000               _TIM1_SetIC1Prescaler:
7834  0000 88            	push	a
7835       00000000      OFST:	set	0
7838                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7840  0001 4d            	tnz	a
7841  0002 270c          	jreq	L2521
7842  0004 a104          	cp	a,#4
7843  0006 2708          	jreq	L2521
7844  0008 a108          	cp	a,#8
7845  000a 2704          	jreq	L2521
7846  000c a10c          	cp	a,#12
7847  000e 2603          	jrne	L0521
7848  0010               L2521:
7849  0010 4f            	clr	a
7850  0011 2010          	jra	L4521
7851  0013               L0521:
7852  0013 ae0737        	ldw	x,#1847
7853  0016 89            	pushw	x
7854  0017 ae0000        	ldw	x,#0
7855  001a 89            	pushw	x
7856  001b ae0000        	ldw	x,#L101
7857  001e cd0000        	call	_assert_failed
7859  0021 5b04          	addw	sp,#4
7860  0023               L4521:
7861                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7861                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7863  0023 c65258        	ld	a,21080
7864  0026 a4f3          	and	a,#243
7865  0028 1a01          	or	a,(OFST+1,sp)
7866  002a c75258        	ld	21080,a
7867                     ; 1852 }
7870  002d 84            	pop	a
7871  002e 81            	ret
7908                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7908                     ; 1865 {
7909                     .text:	section	.text,new
7910  0000               _TIM1_SetIC2Prescaler:
7912  0000 88            	push	a
7913       00000000      OFST:	set	0
7916                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7918  0001 4d            	tnz	a
7919  0002 270c          	jreq	L2621
7920  0004 a104          	cp	a,#4
7921  0006 2708          	jreq	L2621
7922  0008 a108          	cp	a,#8
7923  000a 2704          	jreq	L2621
7924  000c a10c          	cp	a,#12
7925  000e 2603          	jrne	L0621
7926  0010               L2621:
7927  0010 4f            	clr	a
7928  0011 2010          	jra	L4621
7929  0013               L0621:
7930  0013 ae074c        	ldw	x,#1868
7931  0016 89            	pushw	x
7932  0017 ae0000        	ldw	x,#0
7933  001a 89            	pushw	x
7934  001b ae0000        	ldw	x,#L101
7935  001e cd0000        	call	_assert_failed
7937  0021 5b04          	addw	sp,#4
7938  0023               L4621:
7939                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7939                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7941  0023 c65259        	ld	a,21081
7942  0026 a4f3          	and	a,#243
7943  0028 1a01          	or	a,(OFST+1,sp)
7944  002a c75259        	ld	21081,a
7945                     ; 1873 }
7948  002d 84            	pop	a
7949  002e 81            	ret
7986                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7986                     ; 1886 {
7987                     .text:	section	.text,new
7988  0000               _TIM1_SetIC3Prescaler:
7990  0000 88            	push	a
7991       00000000      OFST:	set	0
7994                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7996  0001 4d            	tnz	a
7997  0002 270c          	jreq	L2721
7998  0004 a104          	cp	a,#4
7999  0006 2708          	jreq	L2721
8000  0008 a108          	cp	a,#8
8001  000a 2704          	jreq	L2721
8002  000c a10c          	cp	a,#12
8003  000e 2603          	jrne	L0721
8004  0010               L2721:
8005  0010 4f            	clr	a
8006  0011 2010          	jra	L4721
8007  0013               L0721:
8008  0013 ae0761        	ldw	x,#1889
8009  0016 89            	pushw	x
8010  0017 ae0000        	ldw	x,#0
8011  001a 89            	pushw	x
8012  001b ae0000        	ldw	x,#L101
8013  001e cd0000        	call	_assert_failed
8015  0021 5b04          	addw	sp,#4
8016  0023               L4721:
8017                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
8017                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
8019  0023 c6525a        	ld	a,21082
8020  0026 a4f3          	and	a,#243
8021  0028 1a01          	or	a,(OFST+1,sp)
8022  002a c7525a        	ld	21082,a
8023                     ; 1894 }
8026  002d 84            	pop	a
8027  002e 81            	ret
8064                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8064                     ; 1907 {
8065                     .text:	section	.text,new
8066  0000               _TIM1_SetIC4Prescaler:
8068  0000 88            	push	a
8069       00000000      OFST:	set	0
8072                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8074  0001 4d            	tnz	a
8075  0002 270c          	jreq	L2031
8076  0004 a104          	cp	a,#4
8077  0006 2708          	jreq	L2031
8078  0008 a108          	cp	a,#8
8079  000a 2704          	jreq	L2031
8080  000c a10c          	cp	a,#12
8081  000e 2603          	jrne	L0031
8082  0010               L2031:
8083  0010 4f            	clr	a
8084  0011 2010          	jra	L4031
8085  0013               L0031:
8086  0013 ae0776        	ldw	x,#1910
8087  0016 89            	pushw	x
8088  0017 ae0000        	ldw	x,#0
8089  001a 89            	pushw	x
8090  001b ae0000        	ldw	x,#L101
8091  001e cd0000        	call	_assert_failed
8093  0021 5b04          	addw	sp,#4
8094  0023               L4031:
8095                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8095                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8097  0023 c6525b        	ld	a,21083
8098  0026 a4f3          	and	a,#243
8099  0028 1a01          	or	a,(OFST+1,sp)
8100  002a c7525b        	ld	21083,a
8101                     ; 1915 }
8104  002d 84            	pop	a
8105  002e 81            	ret
8157                     ; 1922 uint16_t TIM1_GetCapture1(void)
8157                     ; 1923 {
8158                     .text:	section	.text,new
8159  0000               _TIM1_GetCapture1:
8161  0000 5204          	subw	sp,#4
8162       00000004      OFST:	set	4
8165                     ; 1926   uint16_t tmpccr1 = 0;
8167  0002 1e03          	ldw	x,(OFST-1,sp)
8168                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8170  0004 7b01          	ld	a,(OFST-3,sp)
8171  0006 97            	ld	xl,a
8174  0007 7b02          	ld	a,(OFST-2,sp)
8175  0009 97            	ld	xl,a
8176                     ; 1929   tmpccr1h = TIM1->CCR1H;
8178  000a c65265        	ld	a,21093
8179  000d 6b02          	ld	(OFST-2,sp),a
8180                     ; 1930   tmpccr1l = TIM1->CCR1L;
8182  000f c65266        	ld	a,21094
8183  0012 6b01          	ld	(OFST-3,sp),a
8184                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8186  0014 7b01          	ld	a,(OFST-3,sp)
8187  0016 5f            	clrw	x
8188  0017 97            	ld	xl,a
8189  0018 1f03          	ldw	(OFST-1,sp),x
8190                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8192  001a 7b02          	ld	a,(OFST-2,sp)
8193  001c 5f            	clrw	x
8194  001d 97            	ld	xl,a
8195  001e 4f            	clr	a
8196  001f 02            	rlwa	x,a
8197  0020 01            	rrwa	x,a
8198  0021 1a04          	or	a,(OFST+0,sp)
8199  0023 01            	rrwa	x,a
8200  0024 1a03          	or	a,(OFST-1,sp)
8201  0026 01            	rrwa	x,a
8202  0027 1f03          	ldw	(OFST-1,sp),x
8203                     ; 1935   return (uint16_t)tmpccr1;
8205  0029 1e03          	ldw	x,(OFST-1,sp)
8208  002b 5b04          	addw	sp,#4
8209  002d 81            	ret
8261                     ; 1943 uint16_t TIM1_GetCapture2(void)
8261                     ; 1944 {
8262                     .text:	section	.text,new
8263  0000               _TIM1_GetCapture2:
8265  0000 5204          	subw	sp,#4
8266       00000004      OFST:	set	4
8269                     ; 1947   uint16_t tmpccr2 = 0;
8271  0002 1e03          	ldw	x,(OFST-1,sp)
8272                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8274  0004 7b01          	ld	a,(OFST-3,sp)
8275  0006 97            	ld	xl,a
8278  0007 7b02          	ld	a,(OFST-2,sp)
8279  0009 97            	ld	xl,a
8280                     ; 1950   tmpccr2h = TIM1->CCR2H;
8282  000a c65267        	ld	a,21095
8283  000d 6b02          	ld	(OFST-2,sp),a
8284                     ; 1951   tmpccr2l = TIM1->CCR2L;
8286  000f c65268        	ld	a,21096
8287  0012 6b01          	ld	(OFST-3,sp),a
8288                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8290  0014 7b01          	ld	a,(OFST-3,sp)
8291  0016 5f            	clrw	x
8292  0017 97            	ld	xl,a
8293  0018 1f03          	ldw	(OFST-1,sp),x
8294                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8296  001a 7b02          	ld	a,(OFST-2,sp)
8297  001c 5f            	clrw	x
8298  001d 97            	ld	xl,a
8299  001e 4f            	clr	a
8300  001f 02            	rlwa	x,a
8301  0020 01            	rrwa	x,a
8302  0021 1a04          	or	a,(OFST+0,sp)
8303  0023 01            	rrwa	x,a
8304  0024 1a03          	or	a,(OFST-1,sp)
8305  0026 01            	rrwa	x,a
8306  0027 1f03          	ldw	(OFST-1,sp),x
8307                     ; 1956   return (uint16_t)tmpccr2;
8309  0029 1e03          	ldw	x,(OFST-1,sp)
8312  002b 5b04          	addw	sp,#4
8313  002d 81            	ret
8365                     ; 1964 uint16_t TIM1_GetCapture3(void)
8365                     ; 1965 {
8366                     .text:	section	.text,new
8367  0000               _TIM1_GetCapture3:
8369  0000 5204          	subw	sp,#4
8370       00000004      OFST:	set	4
8373                     ; 1967   uint16_t tmpccr3 = 0;
8375  0002 1e03          	ldw	x,(OFST-1,sp)
8376                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8378  0004 7b01          	ld	a,(OFST-3,sp)
8379  0006 97            	ld	xl,a
8382  0007 7b02          	ld	a,(OFST-2,sp)
8383  0009 97            	ld	xl,a
8384                     ; 1970   tmpccr3h = TIM1->CCR3H;
8386  000a c65269        	ld	a,21097
8387  000d 6b02          	ld	(OFST-2,sp),a
8388                     ; 1971   tmpccr3l = TIM1->CCR3L;
8390  000f c6526a        	ld	a,21098
8391  0012 6b01          	ld	(OFST-3,sp),a
8392                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8394  0014 7b01          	ld	a,(OFST-3,sp)
8395  0016 5f            	clrw	x
8396  0017 97            	ld	xl,a
8397  0018 1f03          	ldw	(OFST-1,sp),x
8398                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8400  001a 7b02          	ld	a,(OFST-2,sp)
8401  001c 5f            	clrw	x
8402  001d 97            	ld	xl,a
8403  001e 4f            	clr	a
8404  001f 02            	rlwa	x,a
8405  0020 01            	rrwa	x,a
8406  0021 1a04          	or	a,(OFST+0,sp)
8407  0023 01            	rrwa	x,a
8408  0024 1a03          	or	a,(OFST-1,sp)
8409  0026 01            	rrwa	x,a
8410  0027 1f03          	ldw	(OFST-1,sp),x
8411                     ; 1976   return (uint16_t)tmpccr3;
8413  0029 1e03          	ldw	x,(OFST-1,sp)
8416  002b 5b04          	addw	sp,#4
8417  002d 81            	ret
8469                     ; 1984 uint16_t TIM1_GetCapture4(void)
8469                     ; 1985 {
8470                     .text:	section	.text,new
8471  0000               _TIM1_GetCapture4:
8473  0000 5204          	subw	sp,#4
8474       00000004      OFST:	set	4
8477                     ; 1987   uint16_t tmpccr4 = 0;
8479  0002 1e03          	ldw	x,(OFST-1,sp)
8480                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8482  0004 7b01          	ld	a,(OFST-3,sp)
8483  0006 97            	ld	xl,a
8486  0007 7b02          	ld	a,(OFST-2,sp)
8487  0009 97            	ld	xl,a
8488                     ; 1990   tmpccr4h = TIM1->CCR4H;
8490  000a c6526b        	ld	a,21099
8491  000d 6b02          	ld	(OFST-2,sp),a
8492                     ; 1991   tmpccr4l = TIM1->CCR4L;
8494  000f c6526c        	ld	a,21100
8495  0012 6b01          	ld	(OFST-3,sp),a
8496                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8498  0014 7b01          	ld	a,(OFST-3,sp)
8499  0016 5f            	clrw	x
8500  0017 97            	ld	xl,a
8501  0018 1f03          	ldw	(OFST-1,sp),x
8502                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8504  001a 7b02          	ld	a,(OFST-2,sp)
8505  001c 5f            	clrw	x
8506  001d 97            	ld	xl,a
8507  001e 4f            	clr	a
8508  001f 02            	rlwa	x,a
8509  0020 01            	rrwa	x,a
8510  0021 1a04          	or	a,(OFST+0,sp)
8511  0023 01            	rrwa	x,a
8512  0024 1a03          	or	a,(OFST-1,sp)
8513  0026 01            	rrwa	x,a
8514  0027 1f03          	ldw	(OFST-1,sp),x
8515                     ; 1996   return (uint16_t)tmpccr4;
8517  0029 1e03          	ldw	x,(OFST-1,sp)
8520  002b 5b04          	addw	sp,#4
8521  002d 81            	ret
8555                     ; 2004 uint16_t TIM1_GetCounter(void)
8555                     ; 2005 {
8556                     .text:	section	.text,new
8557  0000               _TIM1_GetCounter:
8559  0000 89            	pushw	x
8560       00000002      OFST:	set	2
8563                     ; 2006   uint16_t tmpcntr = 0;
8565  0001 5f            	clrw	x
8566  0002 1f01          	ldw	(OFST-1,sp),x
8567                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8569  0004 c6525e        	ld	a,21086
8570  0007 5f            	clrw	x
8571  0008 97            	ld	xl,a
8572  0009 4f            	clr	a
8573  000a 02            	rlwa	x,a
8574  000b 1f01          	ldw	(OFST-1,sp),x
8575                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8577  000d c6525f        	ld	a,21087
8578  0010 5f            	clrw	x
8579  0011 97            	ld	xl,a
8580  0012 01            	rrwa	x,a
8581  0013 1a02          	or	a,(OFST+0,sp)
8582  0015 01            	rrwa	x,a
8583  0016 1a01          	or	a,(OFST-1,sp)
8584  0018 01            	rrwa	x,a
8587  0019 5b02          	addw	sp,#2
8588  001b 81            	ret
8622                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8622                     ; 2020 {
8623                     .text:	section	.text,new
8624  0000               _TIM1_GetPrescaler:
8626  0000 89            	pushw	x
8627       00000002      OFST:	set	2
8630                     ; 2021   uint16_t temp = 0;
8632  0001 5f            	clrw	x
8633  0002 1f01          	ldw	(OFST-1,sp),x
8634                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8636  0004 c65260        	ld	a,21088
8637  0007 5f            	clrw	x
8638  0008 97            	ld	xl,a
8639  0009 4f            	clr	a
8640  000a 02            	rlwa	x,a
8641  000b 1f01          	ldw	(OFST-1,sp),x
8642                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8644  000d c65261        	ld	a,21089
8645  0010 5f            	clrw	x
8646  0011 97            	ld	xl,a
8647  0012 01            	rrwa	x,a
8648  0013 1a02          	or	a,(OFST+0,sp)
8649  0015 01            	rrwa	x,a
8650  0016 1a01          	or	a,(OFST-1,sp)
8651  0018 01            	rrwa	x,a
8654  0019 5b02          	addw	sp,#2
8655  001b 81            	ret
8830                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8830                     ; 2048 {
8831                     .text:	section	.text,new
8832  0000               _TIM1_GetFlagStatus:
8834  0000 89            	pushw	x
8835  0001 89            	pushw	x
8836       00000002      OFST:	set	2
8839                     ; 2049   FlagStatus bitstatus = RESET;
8841  0002 7b02          	ld	a,(OFST+0,sp)
8842  0004 97            	ld	xl,a
8843                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8845  0005 7b01          	ld	a,(OFST-1,sp)
8846  0007 97            	ld	xl,a
8849  0008 7b02          	ld	a,(OFST+0,sp)
8850  000a 97            	ld	xl,a
8851                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8853  000b 1e03          	ldw	x,(OFST+1,sp)
8854  000d a30001        	cpw	x,#1
8855  0010 274d          	jreq	L6231
8856  0012 1e03          	ldw	x,(OFST+1,sp)
8857  0014 a30002        	cpw	x,#2
8858  0017 2746          	jreq	L6231
8859  0019 1e03          	ldw	x,(OFST+1,sp)
8860  001b a30004        	cpw	x,#4
8861  001e 273f          	jreq	L6231
8862  0020 1e03          	ldw	x,(OFST+1,sp)
8863  0022 a30008        	cpw	x,#8
8864  0025 2738          	jreq	L6231
8865  0027 1e03          	ldw	x,(OFST+1,sp)
8866  0029 a30010        	cpw	x,#16
8867  002c 2731          	jreq	L6231
8868  002e 1e03          	ldw	x,(OFST+1,sp)
8869  0030 a30020        	cpw	x,#32
8870  0033 272a          	jreq	L6231
8871  0035 1e03          	ldw	x,(OFST+1,sp)
8872  0037 a30040        	cpw	x,#64
8873  003a 2723          	jreq	L6231
8874  003c 1e03          	ldw	x,(OFST+1,sp)
8875  003e a30080        	cpw	x,#128
8876  0041 271c          	jreq	L6231
8877  0043 1e03          	ldw	x,(OFST+1,sp)
8878  0045 a30200        	cpw	x,#512
8879  0048 2715          	jreq	L6231
8880  004a 1e03          	ldw	x,(OFST+1,sp)
8881  004c a30400        	cpw	x,#1024
8882  004f 270e          	jreq	L6231
8883  0051 1e03          	ldw	x,(OFST+1,sp)
8884  0053 a30800        	cpw	x,#2048
8885  0056 2707          	jreq	L6231
8886  0058 1e03          	ldw	x,(OFST+1,sp)
8887  005a a31000        	cpw	x,#4096
8888  005d 2603          	jrne	L4231
8889  005f               L6231:
8890  005f 4f            	clr	a
8891  0060 2010          	jra	L0331
8892  0062               L4231:
8893  0062 ae0805        	ldw	x,#2053
8894  0065 89            	pushw	x
8895  0066 ae0000        	ldw	x,#0
8896  0069 89            	pushw	x
8897  006a ae0000        	ldw	x,#L101
8898  006d cd0000        	call	_assert_failed
8900  0070 5b04          	addw	sp,#4
8901  0072               L0331:
8902                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8904  0072 c65255        	ld	a,21077
8905  0075 1404          	and	a,(OFST+2,sp)
8906  0077 6b01          	ld	(OFST-1,sp),a
8907                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8909  0079 7b03          	ld	a,(OFST+1,sp)
8910  007b 6b02          	ld	(OFST+0,sp),a
8911                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8913  007d c65256        	ld	a,21078
8914  0080 1402          	and	a,(OFST+0,sp)
8915  0082 1a01          	or	a,(OFST-1,sp)
8916  0084 2706          	jreq	L7643
8917                     ; 2060     bitstatus = SET;
8919  0086 a601          	ld	a,#1
8920  0088 6b02          	ld	(OFST+0,sp),a
8922  008a 2002          	jra	L1743
8923  008c               L7643:
8924                     ; 2064     bitstatus = RESET;
8926  008c 0f02          	clr	(OFST+0,sp)
8927  008e               L1743:
8928                     ; 2066   return (FlagStatus)(bitstatus);
8930  008e 7b02          	ld	a,(OFST+0,sp)
8933  0090 5b04          	addw	sp,#4
8934  0092 81            	ret
8970                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8970                     ; 2088 {
8971                     .text:	section	.text,new
8972  0000               _TIM1_ClearFlag:
8974  0000 89            	pushw	x
8975       00000000      OFST:	set	0
8978                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8980  0001 01            	rrwa	x,a
8981  0002 9f            	ld	a,xl
8982  0003 a4e1          	and	a,#225
8983  0005 97            	ld	xl,a
8984  0006 4f            	clr	a
8985  0007 02            	rlwa	x,a
8986  0008 5d            	tnzw	x
8987  0009 2607          	jrne	L4331
8988  000b 1e01          	ldw	x,(OFST+1,sp)
8989  000d 2703          	jreq	L4331
8990  000f 4f            	clr	a
8991  0010 2010          	jra	L6331
8992  0012               L4331:
8993  0012 ae082a        	ldw	x,#2090
8994  0015 89            	pushw	x
8995  0016 ae0000        	ldw	x,#0
8996  0019 89            	pushw	x
8997  001a ae0000        	ldw	x,#L101
8998  001d cd0000        	call	_assert_failed
9000  0020 5b04          	addw	sp,#4
9001  0022               L6331:
9002                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
9004  0022 7b02          	ld	a,(OFST+2,sp)
9005  0024 43            	cpl	a
9006  0025 c75255        	ld	21077,a
9007                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
9007                     ; 2095                         (uint8_t)0x1E);
9009  0028 7b01          	ld	a,(OFST+1,sp)
9010  002a 43            	cpl	a
9011  002b a41e          	and	a,#30
9012  002d c75256        	ld	21078,a
9013                     ; 2096 }
9016  0030 85            	popw	x
9017  0031 81            	ret
9082                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9082                     ; 2113 {
9083                     .text:	section	.text,new
9084  0000               _TIM1_GetITStatus:
9086  0000 88            	push	a
9087  0001 89            	pushw	x
9088       00000002      OFST:	set	2
9091                     ; 2114   ITStatus bitstatus = RESET;
9093  0002 7b02          	ld	a,(OFST+0,sp)
9094  0004 97            	ld	xl,a
9095                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9097  0005 7b01          	ld	a,(OFST-1,sp)
9098  0007 97            	ld	xl,a
9101  0008 7b02          	ld	a,(OFST+0,sp)
9102  000a 97            	ld	xl,a
9103                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9105  000b 7b03          	ld	a,(OFST+1,sp)
9106  000d a101          	cp	a,#1
9107  000f 272a          	jreq	L4431
9108  0011 7b03          	ld	a,(OFST+1,sp)
9109  0013 a102          	cp	a,#2
9110  0015 2724          	jreq	L4431
9111  0017 7b03          	ld	a,(OFST+1,sp)
9112  0019 a104          	cp	a,#4
9113  001b 271e          	jreq	L4431
9114  001d 7b03          	ld	a,(OFST+1,sp)
9115  001f a108          	cp	a,#8
9116  0021 2718          	jreq	L4431
9117  0023 7b03          	ld	a,(OFST+1,sp)
9118  0025 a110          	cp	a,#16
9119  0027 2712          	jreq	L4431
9120  0029 7b03          	ld	a,(OFST+1,sp)
9121  002b a120          	cp	a,#32
9122  002d 270c          	jreq	L4431
9123  002f 7b03          	ld	a,(OFST+1,sp)
9124  0031 a140          	cp	a,#64
9125  0033 2706          	jreq	L4431
9126  0035 7b03          	ld	a,(OFST+1,sp)
9127  0037 a180          	cp	a,#128
9128  0039 2603          	jrne	L2431
9129  003b               L4431:
9130  003b 4f            	clr	a
9131  003c 2010          	jra	L6431
9132  003e               L2431:
9133  003e ae0846        	ldw	x,#2118
9134  0041 89            	pushw	x
9135  0042 ae0000        	ldw	x,#0
9136  0045 89            	pushw	x
9137  0046 ae0000        	ldw	x,#L101
9138  0049 cd0000        	call	_assert_failed
9140  004c 5b04          	addw	sp,#4
9141  004e               L6431:
9142                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9144  004e c65255        	ld	a,21077
9145  0051 1403          	and	a,(OFST+1,sp)
9146  0053 6b01          	ld	(OFST-1,sp),a
9147                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9149  0055 c65254        	ld	a,21076
9150  0058 1403          	and	a,(OFST+1,sp)
9151  005a 6b02          	ld	(OFST+0,sp),a
9152                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9154  005c 0d01          	tnz	(OFST-1,sp)
9155  005e 270a          	jreq	L3453
9157  0060 0d02          	tnz	(OFST+0,sp)
9158  0062 2706          	jreq	L3453
9159                     ; 2126     bitstatus = SET;
9161  0064 a601          	ld	a,#1
9162  0066 6b02          	ld	(OFST+0,sp),a
9164  0068 2002          	jra	L5453
9165  006a               L3453:
9166                     ; 2130     bitstatus = RESET;
9168  006a 0f02          	clr	(OFST+0,sp)
9169  006c               L5453:
9170                     ; 2132   return (ITStatus)(bitstatus);
9172  006c 7b02          	ld	a,(OFST+0,sp)
9175  006e 5b03          	addw	sp,#3
9176  0070 81            	ret
9213                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9213                     ; 2150 {
9214                     .text:	section	.text,new
9215  0000               _TIM1_ClearITPendingBit:
9217  0000 88            	push	a
9218       00000000      OFST:	set	0
9221                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9223  0001 4d            	tnz	a
9224  0002 2703          	jreq	L2531
9225  0004 4f            	clr	a
9226  0005 2010          	jra	L4531
9227  0007               L2531:
9228  0007 ae0868        	ldw	x,#2152
9229  000a 89            	pushw	x
9230  000b ae0000        	ldw	x,#0
9231  000e 89            	pushw	x
9232  000f ae0000        	ldw	x,#L101
9233  0012 cd0000        	call	_assert_failed
9235  0015 5b04          	addw	sp,#4
9236  0017               L4531:
9237                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9239  0017 7b01          	ld	a,(OFST+1,sp)
9240  0019 43            	cpl	a
9241  001a c75255        	ld	21077,a
9242                     ; 2156 }
9245  001d 84            	pop	a
9246  001e 81            	ret
9298                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9298                     ; 2175                        uint8_t TIM1_ICSelection,
9298                     ; 2176                        uint8_t TIM1_ICFilter)
9298                     ; 2177 {
9299                     .text:	section	.text,new
9300  0000               L3_TI1_Config:
9302  0000 89            	pushw	x
9303  0001 88            	push	a
9304       00000001      OFST:	set	1
9307                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9309  0002 7211525c      	bres	21084,#0
9310                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9310                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9312  0006 7b06          	ld	a,(OFST+5,sp)
9313  0008 97            	ld	xl,a
9314  0009 a610          	ld	a,#16
9315  000b 42            	mul	x,a
9316  000c 9f            	ld	a,xl
9317  000d 1a03          	or	a,(OFST+2,sp)
9318  000f 6b01          	ld	(OFST+0,sp),a
9319  0011 c65258        	ld	a,21080
9320  0014 a40c          	and	a,#12
9321  0016 1a01          	or	a,(OFST+0,sp)
9322  0018 c75258        	ld	21080,a
9323                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9325  001b 0d02          	tnz	(OFST+1,sp)
9326  001d 2706          	jreq	L3163
9327                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9329  001f 7212525c      	bset	21084,#1
9331  0023 2004          	jra	L5163
9332  0025               L3163:
9333                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9335  0025 7213525c      	bres	21084,#1
9336  0029               L5163:
9337                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9339  0029 7210525c      	bset	21084,#0
9340                     ; 2197 }
9343  002d 5b03          	addw	sp,#3
9344  002f 81            	ret
9396                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9396                     ; 2216                        uint8_t TIM1_ICSelection,
9396                     ; 2217                        uint8_t TIM1_ICFilter)
9396                     ; 2218 {
9397                     .text:	section	.text,new
9398  0000               L5_TI2_Config:
9400  0000 89            	pushw	x
9401  0001 88            	push	a
9402       00000001      OFST:	set	1
9405                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9407  0002 7219525c      	bres	21084,#4
9408                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9408                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9410  0006 7b06          	ld	a,(OFST+5,sp)
9411  0008 97            	ld	xl,a
9412  0009 a610          	ld	a,#16
9413  000b 42            	mul	x,a
9414  000c 9f            	ld	a,xl
9415  000d 1a03          	or	a,(OFST+2,sp)
9416  000f 6b01          	ld	(OFST+0,sp),a
9417  0011 c65259        	ld	a,21081
9418  0014 a40c          	and	a,#12
9419  0016 1a01          	or	a,(OFST+0,sp)
9420  0018 c75259        	ld	21081,a
9421                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9423  001b 0d02          	tnz	(OFST+1,sp)
9424  001d 2706          	jreq	L5463
9425                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9427  001f 721a525c      	bset	21084,#5
9429  0023 2004          	jra	L7463
9430  0025               L5463:
9431                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9433  0025 721b525c      	bres	21084,#5
9434  0029               L7463:
9435                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9437  0029 7218525c      	bset	21084,#4
9438                     ; 2236 }
9441  002d 5b03          	addw	sp,#3
9442  002f 81            	ret
9494                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9494                     ; 2255                        uint8_t TIM1_ICSelection,
9494                     ; 2256                        uint8_t TIM1_ICFilter)
9494                     ; 2257 {
9495                     .text:	section	.text,new
9496  0000               L7_TI3_Config:
9498  0000 89            	pushw	x
9499  0001 88            	push	a
9500       00000001      OFST:	set	1
9503                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9505  0002 7211525d      	bres	21085,#0
9506                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9506                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9508  0006 7b06          	ld	a,(OFST+5,sp)
9509  0008 97            	ld	xl,a
9510  0009 a610          	ld	a,#16
9511  000b 42            	mul	x,a
9512  000c 9f            	ld	a,xl
9513  000d 1a03          	or	a,(OFST+2,sp)
9514  000f 6b01          	ld	(OFST+0,sp),a
9515  0011 c6525a        	ld	a,21082
9516  0014 a40c          	and	a,#12
9517  0016 1a01          	or	a,(OFST+0,sp)
9518  0018 c7525a        	ld	21082,a
9519                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9521  001b 0d02          	tnz	(OFST+1,sp)
9522  001d 2706          	jreq	L7763
9523                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9525  001f 7212525d      	bset	21085,#1
9527  0023 2004          	jra	L1073
9528  0025               L7763:
9529                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9531  0025 7213525d      	bres	21085,#1
9532  0029               L1073:
9533                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9535  0029 7210525d      	bset	21085,#0
9536                     ; 2276 }
9539  002d 5b03          	addw	sp,#3
9540  002f 81            	ret
9592                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9592                     ; 2295                        uint8_t TIM1_ICSelection,
9592                     ; 2296                        uint8_t TIM1_ICFilter)
9592                     ; 2297 {
9593                     .text:	section	.text,new
9594  0000               L11_TI4_Config:
9596  0000 89            	pushw	x
9597  0001 88            	push	a
9598       00000001      OFST:	set	1
9601                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9603  0002 7219525d      	bres	21085,#4
9604                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9604                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9606  0006 7b06          	ld	a,(OFST+5,sp)
9607  0008 97            	ld	xl,a
9608  0009 a610          	ld	a,#16
9609  000b 42            	mul	x,a
9610  000c 9f            	ld	a,xl
9611  000d 1a03          	or	a,(OFST+2,sp)
9612  000f 6b01          	ld	(OFST+0,sp),a
9613  0011 c6525b        	ld	a,21083
9614  0014 a40c          	and	a,#12
9615  0016 1a01          	or	a,(OFST+0,sp)
9616  0018 c7525b        	ld	21083,a
9617                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9619  001b 0d02          	tnz	(OFST+1,sp)
9620  001d 2706          	jreq	L1373
9621                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9623  001f 721a525d      	bset	21085,#5
9625  0023 2004          	jra	L3373
9626  0025               L1373:
9627                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9629  0025 721b525d      	bres	21085,#5
9630  0029               L3373:
9631                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9633  0029 7218525d      	bset	21085,#4
9634                     ; 2317 }
9637  002d 5b03          	addw	sp,#3
9638  002f 81            	ret
9651                     	xdef	_TIM1_ClearITPendingBit
9652                     	xdef	_TIM1_GetITStatus
9653                     	xdef	_TIM1_ClearFlag
9654                     	xdef	_TIM1_GetFlagStatus
9655                     	xdef	_TIM1_GetPrescaler
9656                     	xdef	_TIM1_GetCounter
9657                     	xdef	_TIM1_GetCapture4
9658                     	xdef	_TIM1_GetCapture3
9659                     	xdef	_TIM1_GetCapture2
9660                     	xdef	_TIM1_GetCapture1
9661                     	xdef	_TIM1_SetIC4Prescaler
9662                     	xdef	_TIM1_SetIC3Prescaler
9663                     	xdef	_TIM1_SetIC2Prescaler
9664                     	xdef	_TIM1_SetIC1Prescaler
9665                     	xdef	_TIM1_SetCompare4
9666                     	xdef	_TIM1_SetCompare3
9667                     	xdef	_TIM1_SetCompare2
9668                     	xdef	_TIM1_SetCompare1
9669                     	xdef	_TIM1_SetAutoreload
9670                     	xdef	_TIM1_SetCounter
9671                     	xdef	_TIM1_SelectOCxM
9672                     	xdef	_TIM1_CCxNCmd
9673                     	xdef	_TIM1_CCxCmd
9674                     	xdef	_TIM1_OC4PolarityConfig
9675                     	xdef	_TIM1_OC3NPolarityConfig
9676                     	xdef	_TIM1_OC3PolarityConfig
9677                     	xdef	_TIM1_OC2NPolarityConfig
9678                     	xdef	_TIM1_OC2PolarityConfig
9679                     	xdef	_TIM1_OC1NPolarityConfig
9680                     	xdef	_TIM1_OC1PolarityConfig
9681                     	xdef	_TIM1_GenerateEvent
9682                     	xdef	_TIM1_OC4FastConfig
9683                     	xdef	_TIM1_OC3FastConfig
9684                     	xdef	_TIM1_OC2FastConfig
9685                     	xdef	_TIM1_OC1FastConfig
9686                     	xdef	_TIM1_OC4PreloadConfig
9687                     	xdef	_TIM1_OC3PreloadConfig
9688                     	xdef	_TIM1_OC2PreloadConfig
9689                     	xdef	_TIM1_OC1PreloadConfig
9690                     	xdef	_TIM1_CCPreloadControl
9691                     	xdef	_TIM1_SelectCOM
9692                     	xdef	_TIM1_ARRPreloadConfig
9693                     	xdef	_TIM1_ForcedOC4Config
9694                     	xdef	_TIM1_ForcedOC3Config
9695                     	xdef	_TIM1_ForcedOC2Config
9696                     	xdef	_TIM1_ForcedOC1Config
9697                     	xdef	_TIM1_CounterModeConfig
9698                     	xdef	_TIM1_PrescalerConfig
9699                     	xdef	_TIM1_EncoderInterfaceConfig
9700                     	xdef	_TIM1_SelectMasterSlaveMode
9701                     	xdef	_TIM1_SelectSlaveMode
9702                     	xdef	_TIM1_SelectOutputTrigger
9703                     	xdef	_TIM1_SelectOnePulseMode
9704                     	xdef	_TIM1_SelectHallSensor
9705                     	xdef	_TIM1_UpdateRequestConfig
9706                     	xdef	_TIM1_UpdateDisableConfig
9707                     	xdef	_TIM1_SelectInputTrigger
9708                     	xdef	_TIM1_TIxExternalClockConfig
9709                     	xdef	_TIM1_ETRConfig
9710                     	xdef	_TIM1_ETRClockMode2Config
9711                     	xdef	_TIM1_ETRClockMode1Config
9712                     	xdef	_TIM1_InternalClockConfig
9713                     	xdef	_TIM1_ITConfig
9714                     	xdef	_TIM1_CtrlPWMOutputs
9715                     	xdef	_TIM1_Cmd
9716                     	xdef	_TIM1_PWMIConfig
9717                     	xdef	_TIM1_ICInit
9718                     	xdef	_TIM1_BDTRConfig
9719                     	xdef	_TIM1_OC4Init
9720                     	xdef	_TIM1_OC3Init
9721                     	xdef	_TIM1_OC2Init
9722                     	xdef	_TIM1_OC1Init
9723                     	xdef	_TIM1_TimeBaseInit
9724                     	xdef	_TIM1_DeInit
9725                     	xref	_assert_failed
9726                     .const:	section	.text
9727  0000               L101:
9728  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
9729  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
9730  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
9731  0036 6d312e6300    	dc.b	"m1.c",0
9751                     	end
