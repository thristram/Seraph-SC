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
 260                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 260                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 260                     ; 113                        uint16_t TIM1_Period,
 260                     ; 114                        uint8_t TIM1_RepetitionCounter)
 260                     ; 115 {
 261                     .text:	section	.text,new
 262  0000               _TIM1_TimeBaseInit:
 264  0000 89            	pushw	x
 265       00000000      OFST:	set	0
 268                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 270  0001 0d05          	tnz	(OFST+5,sp)
 271  0003 2718          	jreq	L21
 272  0005 7b05          	ld	a,(OFST+5,sp)
 273  0007 a110          	cp	a,#16
 274  0009 2712          	jreq	L21
 275  000b 7b05          	ld	a,(OFST+5,sp)
 276  000d a120          	cp	a,#32
 277  000f 270c          	jreq	L21
 278  0011 7b05          	ld	a,(OFST+5,sp)
 279  0013 a140          	cp	a,#64
 280  0015 2706          	jreq	L21
 281  0017 7b05          	ld	a,(OFST+5,sp)
 282  0019 a160          	cp	a,#96
 283  001b 2603          	jrne	L01
 284  001d               L21:
 285  001d 4f            	clr	a
 286  001e 2010          	jra	L41
 287  0020               L01:
 288  0020 ae0075        	ldw	x,#117
 289  0023 89            	pushw	x
 290  0024 ae0000        	ldw	x,#0
 291  0027 89            	pushw	x
 292  0028 ae0000        	ldw	x,#L37
 293  002b cd0000        	call	_assert_failed
 295  002e 5b04          	addw	sp,#4
 296  0030               L41:
 297                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 299  0030 7b06          	ld	a,(OFST+6,sp)
 300  0032 c75262        	ld	21090,a
 301                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 303  0035 7b07          	ld	a,(OFST+7,sp)
 304  0037 c75263        	ld	21091,a
 305                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 307  003a 7b01          	ld	a,(OFST+1,sp)
 308  003c c75260        	ld	21088,a
 309                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 311  003f 7b02          	ld	a,(OFST+2,sp)
 312  0041 c75261        	ld	21089,a
 313                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 313                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 315  0044 c65250        	ld	a,21072
 316  0047 a48f          	and	a,#143
 317  0049 1a05          	or	a,(OFST+5,sp)
 318  004b c75250        	ld	21072,a
 319                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 321  004e 7b08          	ld	a,(OFST+8,sp)
 322  0050 c75264        	ld	21092,a
 323                     ; 133 }
 326  0053 85            	popw	x
 327  0054 81            	ret
 611                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 611                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 611                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 611                     ; 157                   uint16_t TIM1_Pulse,
 611                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 611                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 611                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 611                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 611                     ; 162 {
 612                     .text:	section	.text,new
 613  0000               _TIM1_OC1Init:
 615  0000 89            	pushw	x
 616  0001 5203          	subw	sp,#3
 617       00000003      OFST:	set	3
 620                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 622  0003 9e            	ld	a,xh
 623  0004 4d            	tnz	a
 624  0005 2719          	jreq	L22
 625  0007 9e            	ld	a,xh
 626  0008 a110          	cp	a,#16
 627  000a 2714          	jreq	L22
 628  000c 9e            	ld	a,xh
 629  000d a120          	cp	a,#32
 630  000f 270f          	jreq	L22
 631  0011 9e            	ld	a,xh
 632  0012 a130          	cp	a,#48
 633  0014 270a          	jreq	L22
 634  0016 9e            	ld	a,xh
 635  0017 a160          	cp	a,#96
 636  0019 2705          	jreq	L22
 637  001b 9e            	ld	a,xh
 638  001c a170          	cp	a,#112
 639  001e 2603          	jrne	L02
 640  0020               L22:
 641  0020 4f            	clr	a
 642  0021 2010          	jra	L42
 643  0023               L02:
 644  0023 ae00a4        	ldw	x,#164
 645  0026 89            	pushw	x
 646  0027 ae0000        	ldw	x,#0
 647  002a 89            	pushw	x
 648  002b ae0000        	ldw	x,#L37
 649  002e cd0000        	call	_assert_failed
 651  0031 5b04          	addw	sp,#4
 652  0033               L42:
 653                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 655  0033 0d05          	tnz	(OFST+2,sp)
 656  0035 2706          	jreq	L03
 657  0037 7b05          	ld	a,(OFST+2,sp)
 658  0039 a111          	cp	a,#17
 659  003b 2603          	jrne	L62
 660  003d               L03:
 661  003d 4f            	clr	a
 662  003e 2010          	jra	L23
 663  0040               L62:
 664  0040 ae00a5        	ldw	x,#165
 665  0043 89            	pushw	x
 666  0044 ae0000        	ldw	x,#0
 667  0047 89            	pushw	x
 668  0048 ae0000        	ldw	x,#L37
 669  004b cd0000        	call	_assert_failed
 671  004e 5b04          	addw	sp,#4
 672  0050               L23:
 673                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 675  0050 0d08          	tnz	(OFST+5,sp)
 676  0052 2706          	jreq	L63
 677  0054 7b08          	ld	a,(OFST+5,sp)
 678  0056 a144          	cp	a,#68
 679  0058 2603          	jrne	L43
 680  005a               L63:
 681  005a 4f            	clr	a
 682  005b 2010          	jra	L04
 683  005d               L43:
 684  005d ae00a6        	ldw	x,#166
 685  0060 89            	pushw	x
 686  0061 ae0000        	ldw	x,#0
 687  0064 89            	pushw	x
 688  0065 ae0000        	ldw	x,#L37
 689  0068 cd0000        	call	_assert_failed
 691  006b 5b04          	addw	sp,#4
 692  006d               L04:
 693                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 695  006d 0d0b          	tnz	(OFST+8,sp)
 696  006f 2706          	jreq	L44
 697  0071 7b0b          	ld	a,(OFST+8,sp)
 698  0073 a122          	cp	a,#34
 699  0075 2603          	jrne	L24
 700  0077               L44:
 701  0077 4f            	clr	a
 702  0078 2010          	jra	L64
 703  007a               L24:
 704  007a ae00a7        	ldw	x,#167
 705  007d 89            	pushw	x
 706  007e ae0000        	ldw	x,#0
 707  0081 89            	pushw	x
 708  0082 ae0000        	ldw	x,#L37
 709  0085 cd0000        	call	_assert_failed
 711  0088 5b04          	addw	sp,#4
 712  008a               L64:
 713                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 715  008a 0d0c          	tnz	(OFST+9,sp)
 716  008c 2706          	jreq	L25
 717  008e 7b0c          	ld	a,(OFST+9,sp)
 718  0090 a188          	cp	a,#136
 719  0092 2603          	jrne	L05
 720  0094               L25:
 721  0094 4f            	clr	a
 722  0095 2010          	jra	L45
 723  0097               L05:
 724  0097 ae00a8        	ldw	x,#168
 725  009a 89            	pushw	x
 726  009b ae0000        	ldw	x,#0
 727  009e 89            	pushw	x
 728  009f ae0000        	ldw	x,#L37
 729  00a2 cd0000        	call	_assert_failed
 731  00a5 5b04          	addw	sp,#4
 732  00a7               L45:
 733                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 735  00a7 7b0d          	ld	a,(OFST+10,sp)
 736  00a9 a155          	cp	a,#85
 737  00ab 2704          	jreq	L06
 738  00ad 0d0d          	tnz	(OFST+10,sp)
 739  00af 2603          	jrne	L65
 740  00b1               L06:
 741  00b1 4f            	clr	a
 742  00b2 2010          	jra	L26
 743  00b4               L65:
 744  00b4 ae00a9        	ldw	x,#169
 745  00b7 89            	pushw	x
 746  00b8 ae0000        	ldw	x,#0
 747  00bb 89            	pushw	x
 748  00bc ae0000        	ldw	x,#L37
 749  00bf cd0000        	call	_assert_failed
 751  00c2 5b04          	addw	sp,#4
 752  00c4               L26:
 753                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 755  00c4 7b0e          	ld	a,(OFST+11,sp)
 756  00c6 a12a          	cp	a,#42
 757  00c8 2704          	jreq	L66
 758  00ca 0d0e          	tnz	(OFST+11,sp)
 759  00cc 2603          	jrne	L46
 760  00ce               L66:
 761  00ce 4f            	clr	a
 762  00cf 2010          	jra	L07
 763  00d1               L46:
 764  00d1 ae00aa        	ldw	x,#170
 765  00d4 89            	pushw	x
 766  00d5 ae0000        	ldw	x,#0
 767  00d8 89            	pushw	x
 768  00d9 ae0000        	ldw	x,#L37
 769  00dc cd0000        	call	_assert_failed
 771  00df 5b04          	addw	sp,#4
 772  00e1               L07:
 773                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 773                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 775  00e1 c6525c        	ld	a,21084
 776  00e4 a4f0          	and	a,#240
 777  00e6 c7525c        	ld	21084,a
 778                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 778                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 778                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 778                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 780  00e9 7b0c          	ld	a,(OFST+9,sp)
 781  00eb a408          	and	a,#8
 782  00ed 6b03          	ld	(OFST+0,sp),a
 783  00ef 7b0b          	ld	a,(OFST+8,sp)
 784  00f1 a402          	and	a,#2
 785  00f3 1a03          	or	a,(OFST+0,sp)
 786  00f5 6b02          	ld	(OFST-1,sp),a
 787  00f7 7b08          	ld	a,(OFST+5,sp)
 788  00f9 a404          	and	a,#4
 789  00fb 6b01          	ld	(OFST-2,sp),a
 790  00fd 7b05          	ld	a,(OFST+2,sp)
 791  00ff a401          	and	a,#1
 792  0101 1a01          	or	a,(OFST-2,sp)
 793  0103 1a02          	or	a,(OFST-1,sp)
 794  0105 ca525c        	or	a,21084
 795  0108 c7525c        	ld	21084,a
 796                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 796                     ; 185                           (uint8_t)TIM1_OCMode);
 798  010b c65258        	ld	a,21080
 799  010e a48f          	and	a,#143
 800  0110 1a04          	or	a,(OFST+1,sp)
 801  0112 c75258        	ld	21080,a
 802                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 804  0115 c6526f        	ld	a,21103
 805  0118 a4fc          	and	a,#252
 806  011a c7526f        	ld	21103,a
 807                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 807                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 809  011d 7b0e          	ld	a,(OFST+11,sp)
 810  011f a402          	and	a,#2
 811  0121 6b03          	ld	(OFST+0,sp),a
 812  0123 7b0d          	ld	a,(OFST+10,sp)
 813  0125 a401          	and	a,#1
 814  0127 1a03          	or	a,(OFST+0,sp)
 815  0129 ca526f        	or	a,21103
 816  012c c7526f        	ld	21103,a
 817                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 819  012f 7b09          	ld	a,(OFST+6,sp)
 820  0131 c75265        	ld	21093,a
 821                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 823  0134 7b0a          	ld	a,(OFST+7,sp)
 824  0136 c75266        	ld	21094,a
 825                     ; 196 }
 828  0139 5b05          	addw	sp,#5
 829  013b 81            	ret
 932                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 932                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 932                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 932                     ; 220                   uint16_t TIM1_Pulse,
 932                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 932                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 932                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 932                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 932                     ; 225 {
 933                     .text:	section	.text,new
 934  0000               _TIM1_OC2Init:
 936  0000 89            	pushw	x
 937  0001 5203          	subw	sp,#3
 938       00000003      OFST:	set	3
 941                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 943  0003 9e            	ld	a,xh
 944  0004 4d            	tnz	a
 945  0005 2719          	jreq	L67
 946  0007 9e            	ld	a,xh
 947  0008 a110          	cp	a,#16
 948  000a 2714          	jreq	L67
 949  000c 9e            	ld	a,xh
 950  000d a120          	cp	a,#32
 951  000f 270f          	jreq	L67
 952  0011 9e            	ld	a,xh
 953  0012 a130          	cp	a,#48
 954  0014 270a          	jreq	L67
 955  0016 9e            	ld	a,xh
 956  0017 a160          	cp	a,#96
 957  0019 2705          	jreq	L67
 958  001b 9e            	ld	a,xh
 959  001c a170          	cp	a,#112
 960  001e 2603          	jrne	L47
 961  0020               L67:
 962  0020 4f            	clr	a
 963  0021 2010          	jra	L001
 964  0023               L47:
 965  0023 ae00e3        	ldw	x,#227
 966  0026 89            	pushw	x
 967  0027 ae0000        	ldw	x,#0
 968  002a 89            	pushw	x
 969  002b ae0000        	ldw	x,#L37
 970  002e cd0000        	call	_assert_failed
 972  0031 5b04          	addw	sp,#4
 973  0033               L001:
 974                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 976  0033 0d05          	tnz	(OFST+2,sp)
 977  0035 2706          	jreq	L401
 978  0037 7b05          	ld	a,(OFST+2,sp)
 979  0039 a111          	cp	a,#17
 980  003b 2603          	jrne	L201
 981  003d               L401:
 982  003d 4f            	clr	a
 983  003e 2010          	jra	L601
 984  0040               L201:
 985  0040 ae00e4        	ldw	x,#228
 986  0043 89            	pushw	x
 987  0044 ae0000        	ldw	x,#0
 988  0047 89            	pushw	x
 989  0048 ae0000        	ldw	x,#L37
 990  004b cd0000        	call	_assert_failed
 992  004e 5b04          	addw	sp,#4
 993  0050               L601:
 994                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 996  0050 0d08          	tnz	(OFST+5,sp)
 997  0052 2706          	jreq	L211
 998  0054 7b08          	ld	a,(OFST+5,sp)
 999  0056 a144          	cp	a,#68
1000  0058 2603          	jrne	L011
1001  005a               L211:
1002  005a 4f            	clr	a
1003  005b 2010          	jra	L411
1004  005d               L011:
1005  005d ae00e5        	ldw	x,#229
1006  0060 89            	pushw	x
1007  0061 ae0000        	ldw	x,#0
1008  0064 89            	pushw	x
1009  0065 ae0000        	ldw	x,#L37
1010  0068 cd0000        	call	_assert_failed
1012  006b 5b04          	addw	sp,#4
1013  006d               L411:
1014                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1016  006d 0d0b          	tnz	(OFST+8,sp)
1017  006f 2706          	jreq	L021
1018  0071 7b0b          	ld	a,(OFST+8,sp)
1019  0073 a122          	cp	a,#34
1020  0075 2603          	jrne	L611
1021  0077               L021:
1022  0077 4f            	clr	a
1023  0078 2010          	jra	L221
1024  007a               L611:
1025  007a ae00e6        	ldw	x,#230
1026  007d 89            	pushw	x
1027  007e ae0000        	ldw	x,#0
1028  0081 89            	pushw	x
1029  0082 ae0000        	ldw	x,#L37
1030  0085 cd0000        	call	_assert_failed
1032  0088 5b04          	addw	sp,#4
1033  008a               L221:
1034                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1036  008a 0d0c          	tnz	(OFST+9,sp)
1037  008c 2706          	jreq	L621
1038  008e 7b0c          	ld	a,(OFST+9,sp)
1039  0090 a188          	cp	a,#136
1040  0092 2603          	jrne	L421
1041  0094               L621:
1042  0094 4f            	clr	a
1043  0095 2010          	jra	L031
1044  0097               L421:
1045  0097 ae00e7        	ldw	x,#231
1046  009a 89            	pushw	x
1047  009b ae0000        	ldw	x,#0
1048  009e 89            	pushw	x
1049  009f ae0000        	ldw	x,#L37
1050  00a2 cd0000        	call	_assert_failed
1052  00a5 5b04          	addw	sp,#4
1053  00a7               L031:
1054                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1056  00a7 7b0d          	ld	a,(OFST+10,sp)
1057  00a9 a155          	cp	a,#85
1058  00ab 2704          	jreq	L431
1059  00ad 0d0d          	tnz	(OFST+10,sp)
1060  00af 2603          	jrne	L231
1061  00b1               L431:
1062  00b1 4f            	clr	a
1063  00b2 2010          	jra	L631
1064  00b4               L231:
1065  00b4 ae00e8        	ldw	x,#232
1066  00b7 89            	pushw	x
1067  00b8 ae0000        	ldw	x,#0
1068  00bb 89            	pushw	x
1069  00bc ae0000        	ldw	x,#L37
1070  00bf cd0000        	call	_assert_failed
1072  00c2 5b04          	addw	sp,#4
1073  00c4               L631:
1074                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1076  00c4 7b0e          	ld	a,(OFST+11,sp)
1077  00c6 a12a          	cp	a,#42
1078  00c8 2704          	jreq	L241
1079  00ca 0d0e          	tnz	(OFST+11,sp)
1080  00cc 2603          	jrne	L041
1081  00ce               L241:
1082  00ce 4f            	clr	a
1083  00cf 2010          	jra	L441
1084  00d1               L041:
1085  00d1 ae00e9        	ldw	x,#233
1086  00d4 89            	pushw	x
1087  00d5 ae0000        	ldw	x,#0
1088  00d8 89            	pushw	x
1089  00d9 ae0000        	ldw	x,#L37
1090  00dc cd0000        	call	_assert_failed
1092  00df 5b04          	addw	sp,#4
1093  00e1               L441:
1094                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1094                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1096  00e1 c6525c        	ld	a,21084
1097  00e4 a40f          	and	a,#15
1098  00e6 c7525c        	ld	21084,a
1099                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1099                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1099                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1099                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1101  00e9 7b0c          	ld	a,(OFST+9,sp)
1102  00eb a480          	and	a,#128
1103  00ed 6b03          	ld	(OFST+0,sp),a
1104  00ef 7b0b          	ld	a,(OFST+8,sp)
1105  00f1 a420          	and	a,#32
1106  00f3 1a03          	or	a,(OFST+0,sp)
1107  00f5 6b02          	ld	(OFST-1,sp),a
1108  00f7 7b08          	ld	a,(OFST+5,sp)
1109  00f9 a440          	and	a,#64
1110  00fb 6b01          	ld	(OFST-2,sp),a
1111  00fd 7b05          	ld	a,(OFST+2,sp)
1112  00ff a410          	and	a,#16
1113  0101 1a01          	or	a,(OFST-2,sp)
1114  0103 1a02          	or	a,(OFST-1,sp)
1115  0105 ca525c        	or	a,21084
1116  0108 c7525c        	ld	21084,a
1117                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1117                     ; 249                           (uint8_t)TIM1_OCMode);
1119  010b c65259        	ld	a,21081
1120  010e a48f          	and	a,#143
1121  0110 1a04          	or	a,(OFST+1,sp)
1122  0112 c75259        	ld	21081,a
1123                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1125  0115 c6526f        	ld	a,21103
1126  0118 a4f3          	and	a,#243
1127  011a c7526f        	ld	21103,a
1128                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1128                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1130  011d 7b0e          	ld	a,(OFST+11,sp)
1131  011f a408          	and	a,#8
1132  0121 6b03          	ld	(OFST+0,sp),a
1133  0123 7b0d          	ld	a,(OFST+10,sp)
1134  0125 a404          	and	a,#4
1135  0127 1a03          	or	a,(OFST+0,sp)
1136  0129 ca526f        	or	a,21103
1137  012c c7526f        	ld	21103,a
1138                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1140  012f 7b09          	ld	a,(OFST+6,sp)
1141  0131 c75267        	ld	21095,a
1142                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1144  0134 7b0a          	ld	a,(OFST+7,sp)
1145  0136 c75268        	ld	21096,a
1146                     ; 260 }
1149  0139 5b05          	addw	sp,#5
1150  013b 81            	ret
1253                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1253                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1253                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1253                     ; 284                   uint16_t TIM1_Pulse,
1253                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1253                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1253                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1253                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1253                     ; 289 {
1254                     .text:	section	.text,new
1255  0000               _TIM1_OC3Init:
1257  0000 89            	pushw	x
1258  0001 5203          	subw	sp,#3
1259       00000003      OFST:	set	3
1262                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1264  0003 9e            	ld	a,xh
1265  0004 4d            	tnz	a
1266  0005 2719          	jreq	L251
1267  0007 9e            	ld	a,xh
1268  0008 a110          	cp	a,#16
1269  000a 2714          	jreq	L251
1270  000c 9e            	ld	a,xh
1271  000d a120          	cp	a,#32
1272  000f 270f          	jreq	L251
1273  0011 9e            	ld	a,xh
1274  0012 a130          	cp	a,#48
1275  0014 270a          	jreq	L251
1276  0016 9e            	ld	a,xh
1277  0017 a160          	cp	a,#96
1278  0019 2705          	jreq	L251
1279  001b 9e            	ld	a,xh
1280  001c a170          	cp	a,#112
1281  001e 2603          	jrne	L051
1282  0020               L251:
1283  0020 4f            	clr	a
1284  0021 2010          	jra	L451
1285  0023               L051:
1286  0023 ae0123        	ldw	x,#291
1287  0026 89            	pushw	x
1288  0027 ae0000        	ldw	x,#0
1289  002a 89            	pushw	x
1290  002b ae0000        	ldw	x,#L37
1291  002e cd0000        	call	_assert_failed
1293  0031 5b04          	addw	sp,#4
1294  0033               L451:
1295                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1297  0033 0d05          	tnz	(OFST+2,sp)
1298  0035 2706          	jreq	L061
1299  0037 7b05          	ld	a,(OFST+2,sp)
1300  0039 a111          	cp	a,#17
1301  003b 2603          	jrne	L651
1302  003d               L061:
1303  003d 4f            	clr	a
1304  003e 2010          	jra	L261
1305  0040               L651:
1306  0040 ae0124        	ldw	x,#292
1307  0043 89            	pushw	x
1308  0044 ae0000        	ldw	x,#0
1309  0047 89            	pushw	x
1310  0048 ae0000        	ldw	x,#L37
1311  004b cd0000        	call	_assert_failed
1313  004e 5b04          	addw	sp,#4
1314  0050               L261:
1315                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1317  0050 0d08          	tnz	(OFST+5,sp)
1318  0052 2706          	jreq	L661
1319  0054 7b08          	ld	a,(OFST+5,sp)
1320  0056 a144          	cp	a,#68
1321  0058 2603          	jrne	L461
1322  005a               L661:
1323  005a 4f            	clr	a
1324  005b 2010          	jra	L071
1325  005d               L461:
1326  005d ae0125        	ldw	x,#293
1327  0060 89            	pushw	x
1328  0061 ae0000        	ldw	x,#0
1329  0064 89            	pushw	x
1330  0065 ae0000        	ldw	x,#L37
1331  0068 cd0000        	call	_assert_failed
1333  006b 5b04          	addw	sp,#4
1334  006d               L071:
1335                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1337  006d 0d0b          	tnz	(OFST+8,sp)
1338  006f 2706          	jreq	L471
1339  0071 7b0b          	ld	a,(OFST+8,sp)
1340  0073 a122          	cp	a,#34
1341  0075 2603          	jrne	L271
1342  0077               L471:
1343  0077 4f            	clr	a
1344  0078 2010          	jra	L671
1345  007a               L271:
1346  007a ae0126        	ldw	x,#294
1347  007d 89            	pushw	x
1348  007e ae0000        	ldw	x,#0
1349  0081 89            	pushw	x
1350  0082 ae0000        	ldw	x,#L37
1351  0085 cd0000        	call	_assert_failed
1353  0088 5b04          	addw	sp,#4
1354  008a               L671:
1355                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1357  008a 0d0c          	tnz	(OFST+9,sp)
1358  008c 2706          	jreq	L202
1359  008e 7b0c          	ld	a,(OFST+9,sp)
1360  0090 a188          	cp	a,#136
1361  0092 2603          	jrne	L002
1362  0094               L202:
1363  0094 4f            	clr	a
1364  0095 2010          	jra	L402
1365  0097               L002:
1366  0097 ae0127        	ldw	x,#295
1367  009a 89            	pushw	x
1368  009b ae0000        	ldw	x,#0
1369  009e 89            	pushw	x
1370  009f ae0000        	ldw	x,#L37
1371  00a2 cd0000        	call	_assert_failed
1373  00a5 5b04          	addw	sp,#4
1374  00a7               L402:
1375                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1377  00a7 7b0d          	ld	a,(OFST+10,sp)
1378  00a9 a155          	cp	a,#85
1379  00ab 2704          	jreq	L012
1380  00ad 0d0d          	tnz	(OFST+10,sp)
1381  00af 2603          	jrne	L602
1382  00b1               L012:
1383  00b1 4f            	clr	a
1384  00b2 2010          	jra	L212
1385  00b4               L602:
1386  00b4 ae0128        	ldw	x,#296
1387  00b7 89            	pushw	x
1388  00b8 ae0000        	ldw	x,#0
1389  00bb 89            	pushw	x
1390  00bc ae0000        	ldw	x,#L37
1391  00bf cd0000        	call	_assert_failed
1393  00c2 5b04          	addw	sp,#4
1394  00c4               L212:
1395                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1397  00c4 7b0e          	ld	a,(OFST+11,sp)
1398  00c6 a12a          	cp	a,#42
1399  00c8 2704          	jreq	L612
1400  00ca 0d0e          	tnz	(OFST+11,sp)
1401  00cc 2603          	jrne	L412
1402  00ce               L612:
1403  00ce 4f            	clr	a
1404  00cf 2010          	jra	L022
1405  00d1               L412:
1406  00d1 ae0129        	ldw	x,#297
1407  00d4 89            	pushw	x
1408  00d5 ae0000        	ldw	x,#0
1409  00d8 89            	pushw	x
1410  00d9 ae0000        	ldw	x,#L37
1411  00dc cd0000        	call	_assert_failed
1413  00df 5b04          	addw	sp,#4
1414  00e1               L022:
1415                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1415                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1417  00e1 c6525d        	ld	a,21085
1418  00e4 a4f0          	and	a,#240
1419  00e6 c7525d        	ld	21085,a
1420                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1420                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1420                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1420                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1422  00e9 7b0c          	ld	a,(OFST+9,sp)
1423  00eb a408          	and	a,#8
1424  00ed 6b03          	ld	(OFST+0,sp),a
1425  00ef 7b0b          	ld	a,(OFST+8,sp)
1426  00f1 a402          	and	a,#2
1427  00f3 1a03          	or	a,(OFST+0,sp)
1428  00f5 6b02          	ld	(OFST-1,sp),a
1429  00f7 7b08          	ld	a,(OFST+5,sp)
1430  00f9 a404          	and	a,#4
1431  00fb 6b01          	ld	(OFST-2,sp),a
1432  00fd 7b05          	ld	a,(OFST+2,sp)
1433  00ff a401          	and	a,#1
1434  0101 1a01          	or	a,(OFST-2,sp)
1435  0103 1a02          	or	a,(OFST-1,sp)
1436  0105 ca525d        	or	a,21085
1437  0108 c7525d        	ld	21085,a
1438                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1438                     ; 312                           (uint8_t)TIM1_OCMode);
1440  010b c6525a        	ld	a,21082
1441  010e a48f          	and	a,#143
1442  0110 1a04          	or	a,(OFST+1,sp)
1443  0112 c7525a        	ld	21082,a
1444                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1446  0115 c6526f        	ld	a,21103
1447  0118 a4cf          	and	a,#207
1448  011a c7526f        	ld	21103,a
1449                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1449                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1451  011d 7b0e          	ld	a,(OFST+11,sp)
1452  011f a420          	and	a,#32
1453  0121 6b03          	ld	(OFST+0,sp),a
1454  0123 7b0d          	ld	a,(OFST+10,sp)
1455  0125 a410          	and	a,#16
1456  0127 1a03          	or	a,(OFST+0,sp)
1457  0129 ca526f        	or	a,21103
1458  012c c7526f        	ld	21103,a
1459                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1461  012f 7b09          	ld	a,(OFST+6,sp)
1462  0131 c75269        	ld	21097,a
1463                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1465  0134 7b0a          	ld	a,(OFST+7,sp)
1466  0136 c7526a        	ld	21098,a
1467                     ; 323 }
1470  0139 5b05          	addw	sp,#5
1471  013b 81            	ret
1544                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1544                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1544                     ; 340                   uint16_t TIM1_Pulse,
1544                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1544                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1544                     ; 343 {
1545                     .text:	section	.text,new
1546  0000               _TIM1_OC4Init:
1548  0000 89            	pushw	x
1549  0001 88            	push	a
1550       00000001      OFST:	set	1
1553                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1555  0002 9e            	ld	a,xh
1556  0003 4d            	tnz	a
1557  0004 2719          	jreq	L622
1558  0006 9e            	ld	a,xh
1559  0007 a110          	cp	a,#16
1560  0009 2714          	jreq	L622
1561  000b 9e            	ld	a,xh
1562  000c a120          	cp	a,#32
1563  000e 270f          	jreq	L622
1564  0010 9e            	ld	a,xh
1565  0011 a130          	cp	a,#48
1566  0013 270a          	jreq	L622
1567  0015 9e            	ld	a,xh
1568  0016 a160          	cp	a,#96
1569  0018 2705          	jreq	L622
1570  001a 9e            	ld	a,xh
1571  001b a170          	cp	a,#112
1572  001d 2603          	jrne	L422
1573  001f               L622:
1574  001f 4f            	clr	a
1575  0020 2010          	jra	L032
1576  0022               L422:
1577  0022 ae0159        	ldw	x,#345
1578  0025 89            	pushw	x
1579  0026 ae0000        	ldw	x,#0
1580  0029 89            	pushw	x
1581  002a ae0000        	ldw	x,#L37
1582  002d cd0000        	call	_assert_failed
1584  0030 5b04          	addw	sp,#4
1585  0032               L032:
1586                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1588  0032 0d03          	tnz	(OFST+2,sp)
1589  0034 2706          	jreq	L432
1590  0036 7b03          	ld	a,(OFST+2,sp)
1591  0038 a111          	cp	a,#17
1592  003a 2603          	jrne	L232
1593  003c               L432:
1594  003c 4f            	clr	a
1595  003d 2010          	jra	L632
1596  003f               L232:
1597  003f ae015a        	ldw	x,#346
1598  0042 89            	pushw	x
1599  0043 ae0000        	ldw	x,#0
1600  0046 89            	pushw	x
1601  0047 ae0000        	ldw	x,#L37
1602  004a cd0000        	call	_assert_failed
1604  004d 5b04          	addw	sp,#4
1605  004f               L632:
1606                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1608  004f 0d08          	tnz	(OFST+7,sp)
1609  0051 2706          	jreq	L242
1610  0053 7b08          	ld	a,(OFST+7,sp)
1611  0055 a122          	cp	a,#34
1612  0057 2603          	jrne	L042
1613  0059               L242:
1614  0059 4f            	clr	a
1615  005a 2010          	jra	L442
1616  005c               L042:
1617  005c ae015b        	ldw	x,#347
1618  005f 89            	pushw	x
1619  0060 ae0000        	ldw	x,#0
1620  0063 89            	pushw	x
1621  0064 ae0000        	ldw	x,#L37
1622  0067 cd0000        	call	_assert_failed
1624  006a 5b04          	addw	sp,#4
1625  006c               L442:
1626                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1628  006c 7b09          	ld	a,(OFST+8,sp)
1629  006e a155          	cp	a,#85
1630  0070 2704          	jreq	L052
1631  0072 0d09          	tnz	(OFST+8,sp)
1632  0074 2603          	jrne	L642
1633  0076               L052:
1634  0076 4f            	clr	a
1635  0077 2010          	jra	L252
1636  0079               L642:
1637  0079 ae015c        	ldw	x,#348
1638  007c 89            	pushw	x
1639  007d ae0000        	ldw	x,#0
1640  0080 89            	pushw	x
1641  0081 ae0000        	ldw	x,#L37
1642  0084 cd0000        	call	_assert_failed
1644  0087 5b04          	addw	sp,#4
1645  0089               L252:
1646                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1648  0089 c6525d        	ld	a,21085
1649  008c a4cf          	and	a,#207
1650  008e c7525d        	ld	21085,a
1651                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1651                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1653  0091 7b08          	ld	a,(OFST+7,sp)
1654  0093 a420          	and	a,#32
1655  0095 6b01          	ld	(OFST+0,sp),a
1656  0097 7b03          	ld	a,(OFST+2,sp)
1657  0099 a410          	and	a,#16
1658  009b 1a01          	or	a,(OFST+0,sp)
1659  009d ca525d        	or	a,21085
1660  00a0 c7525d        	ld	21085,a
1661                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1661                     ; 358                           TIM1_OCMode);
1663  00a3 c6525b        	ld	a,21083
1664  00a6 a48f          	and	a,#143
1665  00a8 1a02          	or	a,(OFST+1,sp)
1666  00aa c7525b        	ld	21083,a
1667                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1669  00ad 0d09          	tnz	(OFST+8,sp)
1670  00af 270a          	jreq	L124
1671                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1673  00b1 c6526f        	ld	a,21103
1674  00b4 aadf          	or	a,#223
1675  00b6 c7526f        	ld	21103,a
1677  00b9 2004          	jra	L324
1678  00bb               L124:
1679                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1681  00bb 721d526f      	bres	21103,#6
1682  00bf               L324:
1683                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1685  00bf 7b06          	ld	a,(OFST+5,sp)
1686  00c1 c7526b        	ld	21099,a
1687                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1689  00c4 7b07          	ld	a,(OFST+6,sp)
1690  00c6 c7526c        	ld	21100,a
1691                     ; 373 }
1694  00c9 5b03          	addw	sp,#3
1695  00cb 81            	ret
1899                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1899                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1899                     ; 390                      uint8_t TIM1_DeadTime,
1899                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1899                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1899                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1899                     ; 394 {
1900                     .text:	section	.text,new
1901  0000               _TIM1_BDTRConfig:
1903  0000 89            	pushw	x
1904  0001 88            	push	a
1905       00000001      OFST:	set	1
1908                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1910  0002 9e            	ld	a,xh
1911  0003 a104          	cp	a,#4
1912  0005 2704          	jreq	L062
1913  0007 9e            	ld	a,xh
1914  0008 4d            	tnz	a
1915  0009 2603          	jrne	L652
1916  000b               L062:
1917  000b 4f            	clr	a
1918  000c 2010          	jra	L262
1919  000e               L652:
1920  000e ae018c        	ldw	x,#396
1921  0011 89            	pushw	x
1922  0012 ae0000        	ldw	x,#0
1923  0015 89            	pushw	x
1924  0016 ae0000        	ldw	x,#L37
1925  0019 cd0000        	call	_assert_failed
1927  001c 5b04          	addw	sp,#4
1928  001e               L262:
1929                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1931  001e 0d03          	tnz	(OFST+2,sp)
1932  0020 2712          	jreq	L662
1933  0022 7b03          	ld	a,(OFST+2,sp)
1934  0024 a101          	cp	a,#1
1935  0026 270c          	jreq	L662
1936  0028 7b03          	ld	a,(OFST+2,sp)
1937  002a a102          	cp	a,#2
1938  002c 2706          	jreq	L662
1939  002e 7b03          	ld	a,(OFST+2,sp)
1940  0030 a103          	cp	a,#3
1941  0032 2603          	jrne	L462
1942  0034               L662:
1943  0034 4f            	clr	a
1944  0035 2010          	jra	L072
1945  0037               L462:
1946  0037 ae018d        	ldw	x,#397
1947  003a 89            	pushw	x
1948  003b ae0000        	ldw	x,#0
1949  003e 89            	pushw	x
1950  003f ae0000        	ldw	x,#L37
1951  0042 cd0000        	call	_assert_failed
1953  0045 5b04          	addw	sp,#4
1954  0047               L072:
1955                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1957  0047 7b07          	ld	a,(OFST+6,sp)
1958  0049 a110          	cp	a,#16
1959  004b 2704          	jreq	L472
1960  004d 0d07          	tnz	(OFST+6,sp)
1961  004f 2603          	jrne	L272
1962  0051               L472:
1963  0051 4f            	clr	a
1964  0052 2010          	jra	L672
1965  0054               L272:
1966  0054 ae018e        	ldw	x,#398
1967  0057 89            	pushw	x
1968  0058 ae0000        	ldw	x,#0
1969  005b 89            	pushw	x
1970  005c ae0000        	ldw	x,#L37
1971  005f cd0000        	call	_assert_failed
1973  0062 5b04          	addw	sp,#4
1974  0064               L672:
1975                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1977  0064 0d08          	tnz	(OFST+7,sp)
1978  0066 2706          	jreq	L203
1979  0068 7b08          	ld	a,(OFST+7,sp)
1980  006a a120          	cp	a,#32
1981  006c 2603          	jrne	L003
1982  006e               L203:
1983  006e 4f            	clr	a
1984  006f 2010          	jra	L403
1985  0071               L003:
1986  0071 ae018f        	ldw	x,#399
1987  0074 89            	pushw	x
1988  0075 ae0000        	ldw	x,#0
1989  0078 89            	pushw	x
1990  0079 ae0000        	ldw	x,#L37
1991  007c cd0000        	call	_assert_failed
1993  007f 5b04          	addw	sp,#4
1994  0081               L403:
1995                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1997  0081 7b09          	ld	a,(OFST+8,sp)
1998  0083 a140          	cp	a,#64
1999  0085 2704          	jreq	L013
2000  0087 0d09          	tnz	(OFST+8,sp)
2001  0089 2603          	jrne	L603
2002  008b               L013:
2003  008b 4f            	clr	a
2004  008c 2010          	jra	L213
2005  008e               L603:
2006  008e ae0190        	ldw	x,#400
2007  0091 89            	pushw	x
2008  0092 ae0000        	ldw	x,#0
2009  0095 89            	pushw	x
2010  0096 ae0000        	ldw	x,#L37
2011  0099 cd0000        	call	_assert_failed
2013  009c 5b04          	addw	sp,#4
2014  009e               L213:
2015                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2017  009e 7b06          	ld	a,(OFST+5,sp)
2018  00a0 c7526e        	ld	21102,a
2019                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2019                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2019                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2021  00a3 7b07          	ld	a,(OFST+6,sp)
2022  00a5 1a08          	or	a,(OFST+7,sp)
2023  00a7 1a09          	or	a,(OFST+8,sp)
2024  00a9 6b01          	ld	(OFST+0,sp),a
2025  00ab 7b02          	ld	a,(OFST+1,sp)
2026  00ad 1a03          	or	a,(OFST+2,sp)
2027  00af 1a01          	or	a,(OFST+0,sp)
2028  00b1 c7526d        	ld	21101,a
2029                     ; 409 }
2032  00b4 5b03          	addw	sp,#3
2033  00b6 81            	ret
2234                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2234                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2234                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2234                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2234                     ; 427                  uint8_t TIM1_ICFilter)
2234                     ; 428 {
2235                     .text:	section	.text,new
2236  0000               _TIM1_ICInit:
2238  0000 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2244  0001 9e            	ld	a,xh
2245  0002 4d            	tnz	a
2246  0003 270f          	jreq	L023
2247  0005 9e            	ld	a,xh
2248  0006 a101          	cp	a,#1
2249  0008 270a          	jreq	L023
2250  000a 9e            	ld	a,xh
2251  000b a102          	cp	a,#2
2252  000d 2705          	jreq	L023
2253  000f 9e            	ld	a,xh
2254  0010 a103          	cp	a,#3
2255  0012 2603          	jrne	L613
2256  0014               L023:
2257  0014 4f            	clr	a
2258  0015 2010          	jra	L223
2259  0017               L613:
2260  0017 ae01ae        	ldw	x,#430
2261  001a 89            	pushw	x
2262  001b ae0000        	ldw	x,#0
2263  001e 89            	pushw	x
2264  001f ae0000        	ldw	x,#L37
2265  0022 cd0000        	call	_assert_failed
2267  0025 5b04          	addw	sp,#4
2268  0027               L223:
2269                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2271  0027 0d02          	tnz	(OFST+2,sp)
2272  0029 2706          	jreq	L623
2273  002b 7b02          	ld	a,(OFST+2,sp)
2274  002d a101          	cp	a,#1
2275  002f 2603          	jrne	L423
2276  0031               L623:
2277  0031 4f            	clr	a
2278  0032 2010          	jra	L033
2279  0034               L423:
2280  0034 ae01af        	ldw	x,#431
2281  0037 89            	pushw	x
2282  0038 ae0000        	ldw	x,#0
2283  003b 89            	pushw	x
2284  003c ae0000        	ldw	x,#L37
2285  003f cd0000        	call	_assert_failed
2287  0042 5b04          	addw	sp,#4
2288  0044               L033:
2289                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2291  0044 7b05          	ld	a,(OFST+5,sp)
2292  0046 a101          	cp	a,#1
2293  0048 270c          	jreq	L433
2294  004a 7b05          	ld	a,(OFST+5,sp)
2295  004c a102          	cp	a,#2
2296  004e 2706          	jreq	L433
2297  0050 7b05          	ld	a,(OFST+5,sp)
2298  0052 a103          	cp	a,#3
2299  0054 2603          	jrne	L233
2300  0056               L433:
2301  0056 4f            	clr	a
2302  0057 2010          	jra	L633
2303  0059               L233:
2304  0059 ae01b0        	ldw	x,#432
2305  005c 89            	pushw	x
2306  005d ae0000        	ldw	x,#0
2307  0060 89            	pushw	x
2308  0061 ae0000        	ldw	x,#L37
2309  0064 cd0000        	call	_assert_failed
2311  0067 5b04          	addw	sp,#4
2312  0069               L633:
2313                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2315  0069 0d06          	tnz	(OFST+6,sp)
2316  006b 2712          	jreq	L243
2317  006d 7b06          	ld	a,(OFST+6,sp)
2318  006f a104          	cp	a,#4
2319  0071 270c          	jreq	L243
2320  0073 7b06          	ld	a,(OFST+6,sp)
2321  0075 a108          	cp	a,#8
2322  0077 2706          	jreq	L243
2323  0079 7b06          	ld	a,(OFST+6,sp)
2324  007b a10c          	cp	a,#12
2325  007d 2603          	jrne	L043
2326  007f               L243:
2327  007f 4f            	clr	a
2328  0080 2010          	jra	L443
2329  0082               L043:
2330  0082 ae01b1        	ldw	x,#433
2331  0085 89            	pushw	x
2332  0086 ae0000        	ldw	x,#0
2333  0089 89            	pushw	x
2334  008a ae0000        	ldw	x,#L37
2335  008d cd0000        	call	_assert_failed
2337  0090 5b04          	addw	sp,#4
2338  0092               L443:
2339                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2341  0092 7b07          	ld	a,(OFST+7,sp)
2342  0094 a110          	cp	a,#16
2343  0096 2403          	jruge	L643
2344  0098 4f            	clr	a
2345  0099 2010          	jra	L053
2346  009b               L643:
2347  009b ae01b2        	ldw	x,#434
2348  009e 89            	pushw	x
2349  009f ae0000        	ldw	x,#0
2350  00a2 89            	pushw	x
2351  00a3 ae0000        	ldw	x,#L37
2352  00a6 cd0000        	call	_assert_failed
2354  00a9 5b04          	addw	sp,#4
2355  00ab               L053:
2356                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2358  00ab 0d01          	tnz	(OFST+1,sp)
2359  00ad 2614          	jrne	L746
2360                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2360                     ; 440                (uint8_t)TIM1_ICSelection,
2360                     ; 441                (uint8_t)TIM1_ICFilter);
2362  00af 7b07          	ld	a,(OFST+7,sp)
2363  00b1 88            	push	a
2364  00b2 7b06          	ld	a,(OFST+6,sp)
2365  00b4 97            	ld	xl,a
2366  00b5 7b03          	ld	a,(OFST+3,sp)
2367  00b7 95            	ld	xh,a
2368  00b8 cd0000        	call	L3_TI1_Config
2370  00bb 84            	pop	a
2371                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2373  00bc 7b06          	ld	a,(OFST+6,sp)
2374  00be cd0000        	call	_TIM1_SetIC1Prescaler
2377  00c1 2046          	jra	L156
2378  00c3               L746:
2379                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2381  00c3 7b01          	ld	a,(OFST+1,sp)
2382  00c5 a101          	cp	a,#1
2383  00c7 2614          	jrne	L356
2384                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2384                     ; 449                (uint8_t)TIM1_ICSelection,
2384                     ; 450                (uint8_t)TIM1_ICFilter);
2386  00c9 7b07          	ld	a,(OFST+7,sp)
2387  00cb 88            	push	a
2388  00cc 7b06          	ld	a,(OFST+6,sp)
2389  00ce 97            	ld	xl,a
2390  00cf 7b03          	ld	a,(OFST+3,sp)
2391  00d1 95            	ld	xh,a
2392  00d2 cd0000        	call	L5_TI2_Config
2394  00d5 84            	pop	a
2395                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2397  00d6 7b06          	ld	a,(OFST+6,sp)
2398  00d8 cd0000        	call	_TIM1_SetIC2Prescaler
2401  00db 202c          	jra	L156
2402  00dd               L356:
2403                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2405  00dd 7b01          	ld	a,(OFST+1,sp)
2406  00df a102          	cp	a,#2
2407  00e1 2614          	jrne	L756
2408                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2408                     ; 458                (uint8_t)TIM1_ICSelection,
2408                     ; 459                (uint8_t)TIM1_ICFilter);
2410  00e3 7b07          	ld	a,(OFST+7,sp)
2411  00e5 88            	push	a
2412  00e6 7b06          	ld	a,(OFST+6,sp)
2413  00e8 97            	ld	xl,a
2414  00e9 7b03          	ld	a,(OFST+3,sp)
2415  00eb 95            	ld	xh,a
2416  00ec cd0000        	call	L7_TI3_Config
2418  00ef 84            	pop	a
2419                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2421  00f0 7b06          	ld	a,(OFST+6,sp)
2422  00f2 cd0000        	call	_TIM1_SetIC3Prescaler
2425  00f5 2012          	jra	L156
2426  00f7               L756:
2427                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2427                     ; 467                (uint8_t)TIM1_ICSelection,
2427                     ; 468                (uint8_t)TIM1_ICFilter);
2429  00f7 7b07          	ld	a,(OFST+7,sp)
2430  00f9 88            	push	a
2431  00fa 7b06          	ld	a,(OFST+6,sp)
2432  00fc 97            	ld	xl,a
2433  00fd 7b03          	ld	a,(OFST+3,sp)
2434  00ff 95            	ld	xh,a
2435  0100 cd0000        	call	L11_TI4_Config
2437  0103 84            	pop	a
2438                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2440  0104 7b06          	ld	a,(OFST+6,sp)
2441  0106 cd0000        	call	_TIM1_SetIC4Prescaler
2443  0109               L156:
2444                     ; 472 }
2447  0109 85            	popw	x
2448  010a 81            	ret
2539                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2539                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2539                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2539                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2539                     ; 492                      uint8_t TIM1_ICFilter)
2539                     ; 493 {
2540                     .text:	section	.text,new
2541  0000               _TIM1_PWMIConfig:
2543  0000 89            	pushw	x
2544  0001 89            	pushw	x
2545       00000002      OFST:	set	2
2548                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2550  0002 7b01          	ld	a,(OFST-1,sp)
2551  0004 97            	ld	xl,a
2552                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2554  0005 7b02          	ld	a,(OFST+0,sp)
2555  0007 97            	ld	xl,a
2556                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2558  0008 0d03          	tnz	(OFST+1,sp)
2559  000a 2706          	jreq	L653
2560  000c 7b03          	ld	a,(OFST+1,sp)
2561  000e a101          	cp	a,#1
2562  0010 2603          	jrne	L453
2563  0012               L653:
2564  0012 4f            	clr	a
2565  0013 2010          	jra	L063
2566  0015               L453:
2567  0015 ae01f2        	ldw	x,#498
2568  0018 89            	pushw	x
2569  0019 ae0000        	ldw	x,#0
2570  001c 89            	pushw	x
2571  001d ae0000        	ldw	x,#L37
2572  0020 cd0000        	call	_assert_failed
2574  0023 5b04          	addw	sp,#4
2575  0025               L063:
2576                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2578  0025 0d04          	tnz	(OFST+2,sp)
2579  0027 2706          	jreq	L463
2580  0029 7b04          	ld	a,(OFST+2,sp)
2581  002b a101          	cp	a,#1
2582  002d 2603          	jrne	L263
2583  002f               L463:
2584  002f 4f            	clr	a
2585  0030 2010          	jra	L663
2586  0032               L263:
2587  0032 ae01f3        	ldw	x,#499
2588  0035 89            	pushw	x
2589  0036 ae0000        	ldw	x,#0
2590  0039 89            	pushw	x
2591  003a ae0000        	ldw	x,#L37
2592  003d cd0000        	call	_assert_failed
2594  0040 5b04          	addw	sp,#4
2595  0042               L663:
2596                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2598  0042 7b07          	ld	a,(OFST+5,sp)
2599  0044 a101          	cp	a,#1
2600  0046 270c          	jreq	L273
2601  0048 7b07          	ld	a,(OFST+5,sp)
2602  004a a102          	cp	a,#2
2603  004c 2706          	jreq	L273
2604  004e 7b07          	ld	a,(OFST+5,sp)
2605  0050 a103          	cp	a,#3
2606  0052 2603          	jrne	L073
2607  0054               L273:
2608  0054 4f            	clr	a
2609  0055 2010          	jra	L473
2610  0057               L073:
2611  0057 ae01f4        	ldw	x,#500
2612  005a 89            	pushw	x
2613  005b ae0000        	ldw	x,#0
2614  005e 89            	pushw	x
2615  005f ae0000        	ldw	x,#L37
2616  0062 cd0000        	call	_assert_failed
2618  0065 5b04          	addw	sp,#4
2619  0067               L473:
2620                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2622  0067 0d08          	tnz	(OFST+6,sp)
2623  0069 2712          	jreq	L004
2624  006b 7b08          	ld	a,(OFST+6,sp)
2625  006d a104          	cp	a,#4
2626  006f 270c          	jreq	L004
2627  0071 7b08          	ld	a,(OFST+6,sp)
2628  0073 a108          	cp	a,#8
2629  0075 2706          	jreq	L004
2630  0077 7b08          	ld	a,(OFST+6,sp)
2631  0079 a10c          	cp	a,#12
2632  007b 2603          	jrne	L673
2633  007d               L004:
2634  007d 4f            	clr	a
2635  007e 2010          	jra	L204
2636  0080               L673:
2637  0080 ae01f5        	ldw	x,#501
2638  0083 89            	pushw	x
2639  0084 ae0000        	ldw	x,#0
2640  0087 89            	pushw	x
2641  0088 ae0000        	ldw	x,#L37
2642  008b cd0000        	call	_assert_failed
2644  008e 5b04          	addw	sp,#4
2645  0090               L204:
2646                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2648  0090 7b04          	ld	a,(OFST+2,sp)
2649  0092 a101          	cp	a,#1
2650  0094 2706          	jreq	L327
2651                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2653  0096 a601          	ld	a,#1
2654  0098 6b01          	ld	(OFST-1,sp),a
2656  009a 2002          	jra	L527
2657  009c               L327:
2658                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2660  009c 0f01          	clr	(OFST-1,sp)
2661  009e               L527:
2662                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2664  009e 7b07          	ld	a,(OFST+5,sp)
2665  00a0 a101          	cp	a,#1
2666  00a2 2606          	jrne	L727
2667                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2669  00a4 a602          	ld	a,#2
2670  00a6 6b02          	ld	(OFST+0,sp),a
2672  00a8 2004          	jra	L137
2673  00aa               L727:
2674                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2676  00aa a601          	ld	a,#1
2677  00ac 6b02          	ld	(OFST+0,sp),a
2678  00ae               L137:
2679                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2681  00ae 0d03          	tnz	(OFST+1,sp)
2682  00b0 2626          	jrne	L337
2683                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2683                     ; 527                (uint8_t)TIM1_ICFilter);
2685  00b2 7b09          	ld	a,(OFST+7,sp)
2686  00b4 88            	push	a
2687  00b5 7b08          	ld	a,(OFST+6,sp)
2688  00b7 97            	ld	xl,a
2689  00b8 7b05          	ld	a,(OFST+3,sp)
2690  00ba 95            	ld	xh,a
2691  00bb cd0000        	call	L3_TI1_Config
2693  00be 84            	pop	a
2694                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2696  00bf 7b08          	ld	a,(OFST+6,sp)
2697  00c1 cd0000        	call	_TIM1_SetIC1Prescaler
2699                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2701  00c4 7b09          	ld	a,(OFST+7,sp)
2702  00c6 88            	push	a
2703  00c7 7b03          	ld	a,(OFST+1,sp)
2704  00c9 97            	ld	xl,a
2705  00ca 7b02          	ld	a,(OFST+0,sp)
2706  00cc 95            	ld	xh,a
2707  00cd cd0000        	call	L5_TI2_Config
2709  00d0 84            	pop	a
2710                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2712  00d1 7b08          	ld	a,(OFST+6,sp)
2713  00d3 cd0000        	call	_TIM1_SetIC2Prescaler
2716  00d6 2024          	jra	L537
2717  00d8               L337:
2718                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2718                     ; 542                (uint8_t)TIM1_ICFilter);
2720  00d8 7b09          	ld	a,(OFST+7,sp)
2721  00da 88            	push	a
2722  00db 7b08          	ld	a,(OFST+6,sp)
2723  00dd 97            	ld	xl,a
2724  00de 7b05          	ld	a,(OFST+3,sp)
2725  00e0 95            	ld	xh,a
2726  00e1 cd0000        	call	L5_TI2_Config
2728  00e4 84            	pop	a
2729                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2731  00e5 7b08          	ld	a,(OFST+6,sp)
2732  00e7 cd0000        	call	_TIM1_SetIC2Prescaler
2734                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2736  00ea 7b09          	ld	a,(OFST+7,sp)
2737  00ec 88            	push	a
2738  00ed 7b03          	ld	a,(OFST+1,sp)
2739  00ef 97            	ld	xl,a
2740  00f0 7b02          	ld	a,(OFST+0,sp)
2741  00f2 95            	ld	xh,a
2742  00f3 cd0000        	call	L3_TI1_Config
2744  00f6 84            	pop	a
2745                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2747  00f7 7b08          	ld	a,(OFST+6,sp)
2748  00f9 cd0000        	call	_TIM1_SetIC1Prescaler
2750  00fc               L537:
2751                     ; 553 }
2754  00fc 5b04          	addw	sp,#4
2755  00fe 81            	ret
2811                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2811                     ; 562 {
2812                     .text:	section	.text,new
2813  0000               _TIM1_Cmd:
2815  0000 88            	push	a
2816       00000000      OFST:	set	0
2819                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2821  0001 4d            	tnz	a
2822  0002 2704          	jreq	L014
2823  0004 a101          	cp	a,#1
2824  0006 2603          	jrne	L604
2825  0008               L014:
2826  0008 4f            	clr	a
2827  0009 2010          	jra	L214
2828  000b               L604:
2829  000b ae0234        	ldw	x,#564
2830  000e 89            	pushw	x
2831  000f ae0000        	ldw	x,#0
2832  0012 89            	pushw	x
2833  0013 ae0000        	ldw	x,#L37
2834  0016 cd0000        	call	_assert_failed
2836  0019 5b04          	addw	sp,#4
2837  001b               L214:
2838                     ; 567   if (NewState != DISABLE)
2840  001b 0d01          	tnz	(OFST+1,sp)
2841  001d 2706          	jreq	L567
2842                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2844  001f 72105250      	bset	21072,#0
2846  0023 2004          	jra	L767
2847  0025               L567:
2848                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2850  0025 72115250      	bres	21072,#0
2851  0029               L767:
2852                     ; 575 }
2855  0029 84            	pop	a
2856  002a 81            	ret
2893                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2893                     ; 584 {
2894                     .text:	section	.text,new
2895  0000               _TIM1_CtrlPWMOutputs:
2897  0000 88            	push	a
2898       00000000      OFST:	set	0
2901                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2903  0001 4d            	tnz	a
2904  0002 2704          	jreq	L024
2905  0004 a101          	cp	a,#1
2906  0006 2603          	jrne	L614
2907  0008               L024:
2908  0008 4f            	clr	a
2909  0009 2010          	jra	L224
2910  000b               L614:
2911  000b ae024a        	ldw	x,#586
2912  000e 89            	pushw	x
2913  000f ae0000        	ldw	x,#0
2914  0012 89            	pushw	x
2915  0013 ae0000        	ldw	x,#L37
2916  0016 cd0000        	call	_assert_failed
2918  0019 5b04          	addw	sp,#4
2919  001b               L224:
2920                     ; 590   if (NewState != DISABLE)
2922  001b 0d01          	tnz	(OFST+1,sp)
2923  001d 2706          	jreq	L7001
2924                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2926  001f 721e526d      	bset	21101,#7
2928  0023 2004          	jra	L1101
2929  0025               L7001:
2930                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2932  0025 721f526d      	bres	21101,#7
2933  0029               L1101:
2934                     ; 598 }
2937  0029 84            	pop	a
2938  002a 81            	ret
3046                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3046                     ; 618 {
3047                     .text:	section	.text,new
3048  0000               _TIM1_ITConfig:
3050  0000 89            	pushw	x
3051       00000000      OFST:	set	0
3054                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3056  0001 9e            	ld	a,xh
3057  0002 4d            	tnz	a
3058  0003 2703          	jreq	L624
3059  0005 4f            	clr	a
3060  0006 2010          	jra	L034
3061  0008               L624:
3062  0008 ae026c        	ldw	x,#620
3063  000b 89            	pushw	x
3064  000c ae0000        	ldw	x,#0
3065  000f 89            	pushw	x
3066  0010 ae0000        	ldw	x,#L37
3067  0013 cd0000        	call	_assert_failed
3069  0016 5b04          	addw	sp,#4
3070  0018               L034:
3071                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3073  0018 0d02          	tnz	(OFST+2,sp)
3074  001a 2706          	jreq	L434
3075  001c 7b02          	ld	a,(OFST+2,sp)
3076  001e a101          	cp	a,#1
3077  0020 2603          	jrne	L234
3078  0022               L434:
3079  0022 4f            	clr	a
3080  0023 2010          	jra	L634
3081  0025               L234:
3082  0025 ae026d        	ldw	x,#621
3083  0028 89            	pushw	x
3084  0029 ae0000        	ldw	x,#0
3085  002c 89            	pushw	x
3086  002d ae0000        	ldw	x,#L37
3087  0030 cd0000        	call	_assert_failed
3089  0033 5b04          	addw	sp,#4
3090  0035               L634:
3091                     ; 623   if (NewState != DISABLE)
3093  0035 0d02          	tnz	(OFST+2,sp)
3094  0037 270a          	jreq	L1601
3095                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3097  0039 c65254        	ld	a,21076
3098  003c 1a01          	or	a,(OFST+1,sp)
3099  003e c75254        	ld	21076,a
3101  0041 2009          	jra	L3601
3102  0043               L1601:
3103                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3105  0043 7b01          	ld	a,(OFST+1,sp)
3106  0045 43            	cpl	a
3107  0046 c45254        	and	a,21076
3108  0049 c75254        	ld	21076,a
3109  004c               L3601:
3110                     ; 633 }
3113  004c 85            	popw	x
3114  004d 81            	ret
3138                     ; 640 void TIM1_InternalClockConfig(void)
3138                     ; 641 {
3139                     .text:	section	.text,new
3140  0000               _TIM1_InternalClockConfig:
3144                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3146  0000 c65252        	ld	a,21074
3147  0003 a4f8          	and	a,#248
3148  0005 c75252        	ld	21074,a
3149                     ; 644 }
3152  0008 81            	ret
3268                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3268                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3268                     ; 664                               uint8_t ExtTRGFilter)
3268                     ; 665 {
3269                     .text:	section	.text,new
3270  0000               _TIM1_ETRClockMode1Config:
3272  0000 89            	pushw	x
3273       00000000      OFST:	set	0
3276                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3278  0001 9e            	ld	a,xh
3279  0002 4d            	tnz	a
3280  0003 270f          	jreq	L644
3281  0005 9e            	ld	a,xh
3282  0006 a110          	cp	a,#16
3283  0008 270a          	jreq	L644
3284  000a 9e            	ld	a,xh
3285  000b a120          	cp	a,#32
3286  000d 2705          	jreq	L644
3287  000f 9e            	ld	a,xh
3288  0010 a130          	cp	a,#48
3289  0012 2603          	jrne	L444
3290  0014               L644:
3291  0014 4f            	clr	a
3292  0015 2010          	jra	L054
3293  0017               L444:
3294  0017 ae029b        	ldw	x,#667
3295  001a 89            	pushw	x
3296  001b ae0000        	ldw	x,#0
3297  001e 89            	pushw	x
3298  001f ae0000        	ldw	x,#L37
3299  0022 cd0000        	call	_assert_failed
3301  0025 5b04          	addw	sp,#4
3302  0027               L054:
3303                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3305  0027 7b02          	ld	a,(OFST+2,sp)
3306  0029 a180          	cp	a,#128
3307  002b 2704          	jreq	L454
3308  002d 0d02          	tnz	(OFST+2,sp)
3309  002f 2603          	jrne	L254
3310  0031               L454:
3311  0031 4f            	clr	a
3312  0032 2010          	jra	L654
3313  0034               L254:
3314  0034 ae029c        	ldw	x,#668
3315  0037 89            	pushw	x
3316  0038 ae0000        	ldw	x,#0
3317  003b 89            	pushw	x
3318  003c ae0000        	ldw	x,#L37
3319  003f cd0000        	call	_assert_failed
3321  0042 5b04          	addw	sp,#4
3322  0044               L654:
3323                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3325  0044 7b05          	ld	a,(OFST+5,sp)
3326  0046 88            	push	a
3327  0047 7b03          	ld	a,(OFST+3,sp)
3328  0049 97            	ld	xl,a
3329  004a 7b02          	ld	a,(OFST+2,sp)
3330  004c 95            	ld	xh,a
3331  004d cd0000        	call	_TIM1_ETRConfig
3333  0050 84            	pop	a
3334                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3334                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3336  0051 c65252        	ld	a,21074
3337  0054 a488          	and	a,#136
3338  0056 aa77          	or	a,#119
3339  0058 c75252        	ld	21074,a
3340                     ; 676 }
3343  005b 85            	popw	x
3344  005c 81            	ret
3401                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3401                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3401                     ; 696                               uint8_t ExtTRGFilter)
3401                     ; 697 {
3402                     .text:	section	.text,new
3403  0000               _TIM1_ETRClockMode2Config:
3405  0000 89            	pushw	x
3406       00000000      OFST:	set	0
3409                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3411  0001 9e            	ld	a,xh
3412  0002 4d            	tnz	a
3413  0003 270f          	jreq	L464
3414  0005 9e            	ld	a,xh
3415  0006 a110          	cp	a,#16
3416  0008 270a          	jreq	L464
3417  000a 9e            	ld	a,xh
3418  000b a120          	cp	a,#32
3419  000d 2705          	jreq	L464
3420  000f 9e            	ld	a,xh
3421  0010 a130          	cp	a,#48
3422  0012 2603          	jrne	L264
3423  0014               L464:
3424  0014 4f            	clr	a
3425  0015 2010          	jra	L664
3426  0017               L264:
3427  0017 ae02bb        	ldw	x,#699
3428  001a 89            	pushw	x
3429  001b ae0000        	ldw	x,#0
3430  001e 89            	pushw	x
3431  001f ae0000        	ldw	x,#L37
3432  0022 cd0000        	call	_assert_failed
3434  0025 5b04          	addw	sp,#4
3435  0027               L664:
3436                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3438  0027 7b02          	ld	a,(OFST+2,sp)
3439  0029 a180          	cp	a,#128
3440  002b 2704          	jreq	L274
3441  002d 0d02          	tnz	(OFST+2,sp)
3442  002f 2603          	jrne	L074
3443  0031               L274:
3444  0031 4f            	clr	a
3445  0032 2010          	jra	L474
3446  0034               L074:
3447  0034 ae02bc        	ldw	x,#700
3448  0037 89            	pushw	x
3449  0038 ae0000        	ldw	x,#0
3450  003b 89            	pushw	x
3451  003c ae0000        	ldw	x,#L37
3452  003f cd0000        	call	_assert_failed
3454  0042 5b04          	addw	sp,#4
3455  0044               L474:
3456                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3458  0044 7b05          	ld	a,(OFST+5,sp)
3459  0046 88            	push	a
3460  0047 7b03          	ld	a,(OFST+3,sp)
3461  0049 97            	ld	xl,a
3462  004a 7b02          	ld	a,(OFST+2,sp)
3463  004c 95            	ld	xh,a
3464  004d cd0000        	call	_TIM1_ETRConfig
3466  0050 84            	pop	a
3467                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3469  0051 721c5253      	bset	21075,#6
3470                     ; 707 }
3473  0055 85            	popw	x
3474  0056 81            	ret
3529                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3529                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3529                     ; 727                     uint8_t ExtTRGFilter)
3529                     ; 728 {
3530                     .text:	section	.text,new
3531  0000               _TIM1_ETRConfig:
3533  0000 89            	pushw	x
3534       00000000      OFST:	set	0
3537                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3539  0001 7b05          	ld	a,(OFST+5,sp)
3540  0003 a110          	cp	a,#16
3541  0005 2403          	jruge	L005
3542  0007 4f            	clr	a
3543  0008 2010          	jra	L205
3544  000a               L005:
3545  000a ae02da        	ldw	x,#730
3546  000d 89            	pushw	x
3547  000e ae0000        	ldw	x,#0
3548  0011 89            	pushw	x
3549  0012 ae0000        	ldw	x,#L37
3550  0015 cd0000        	call	_assert_failed
3552  0018 5b04          	addw	sp,#4
3553  001a               L205:
3554                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3554                     ; 733                          (uint8_t)ExtTRGFilter );
3556  001a 7b01          	ld	a,(OFST+1,sp)
3557  001c 1a02          	or	a,(OFST+2,sp)
3558  001e 1a05          	or	a,(OFST+5,sp)
3559  0020 ca5253        	or	a,21075
3560  0023 c75253        	ld	21075,a
3561                     ; 734 }
3564  0026 85            	popw	x
3565  0027 81            	ret
3653                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3653                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3653                     ; 753                                  uint8_t ICFilter)
3653                     ; 754 {
3654                     .text:	section	.text,new
3655  0000               _TIM1_TIxExternalClockConfig:
3657  0000 89            	pushw	x
3658       00000000      OFST:	set	0
3661                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3663  0001 9e            	ld	a,xh
3664  0002 a140          	cp	a,#64
3665  0004 270a          	jreq	L015
3666  0006 9e            	ld	a,xh
3667  0007 a160          	cp	a,#96
3668  0009 2705          	jreq	L015
3669  000b 9e            	ld	a,xh
3670  000c a150          	cp	a,#80
3671  000e 2603          	jrne	L605
3672  0010               L015:
3673  0010 4f            	clr	a
3674  0011 2010          	jra	L215
3675  0013               L605:
3676  0013 ae02f4        	ldw	x,#756
3677  0016 89            	pushw	x
3678  0017 ae0000        	ldw	x,#0
3679  001a 89            	pushw	x
3680  001b ae0000        	ldw	x,#L37
3681  001e cd0000        	call	_assert_failed
3683  0021 5b04          	addw	sp,#4
3684  0023               L215:
3685                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3687  0023 0d02          	tnz	(OFST+2,sp)
3688  0025 2706          	jreq	L615
3689  0027 7b02          	ld	a,(OFST+2,sp)
3690  0029 a101          	cp	a,#1
3691  002b 2603          	jrne	L415
3692  002d               L615:
3693  002d 4f            	clr	a
3694  002e 2010          	jra	L025
3695  0030               L415:
3696  0030 ae02f5        	ldw	x,#757
3697  0033 89            	pushw	x
3698  0034 ae0000        	ldw	x,#0
3699  0037 89            	pushw	x
3700  0038 ae0000        	ldw	x,#L37
3701  003b cd0000        	call	_assert_failed
3703  003e 5b04          	addw	sp,#4
3704  0040               L025:
3705                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3707  0040 7b05          	ld	a,(OFST+5,sp)
3708  0042 a110          	cp	a,#16
3709  0044 2403          	jruge	L225
3710  0046 4f            	clr	a
3711  0047 2010          	jra	L425
3712  0049               L225:
3713  0049 ae02f6        	ldw	x,#758
3714  004c 89            	pushw	x
3715  004d ae0000        	ldw	x,#0
3716  0050 89            	pushw	x
3717  0051 ae0000        	ldw	x,#L37
3718  0054 cd0000        	call	_assert_failed
3720  0057 5b04          	addw	sp,#4
3721  0059               L425:
3722                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3724  0059 7b01          	ld	a,(OFST+1,sp)
3725  005b a160          	cp	a,#96
3726  005d 260f          	jrne	L3521
3727                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3729  005f 7b05          	ld	a,(OFST+5,sp)
3730  0061 88            	push	a
3731  0062 ae0001        	ldw	x,#1
3732  0065 7b03          	ld	a,(OFST+3,sp)
3733  0067 95            	ld	xh,a
3734  0068 cd0000        	call	L5_TI2_Config
3736  006b 84            	pop	a
3738  006c 200d          	jra	L5521
3739  006e               L3521:
3740                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3742  006e 7b05          	ld	a,(OFST+5,sp)
3743  0070 88            	push	a
3744  0071 ae0001        	ldw	x,#1
3745  0074 7b03          	ld	a,(OFST+3,sp)
3746  0076 95            	ld	xh,a
3747  0077 cd0000        	call	L3_TI1_Config
3749  007a 84            	pop	a
3750  007b               L5521:
3751                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3753  007b 7b01          	ld	a,(OFST+1,sp)
3754  007d cd0000        	call	_TIM1_SelectInputTrigger
3756                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3758  0080 c65252        	ld	a,21074
3759  0083 aa07          	or	a,#7
3760  0085 c75252        	ld	21074,a
3761                     ; 775 }
3764  0088 85            	popw	x
3765  0089 81            	ret
3851                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3851                     ; 788 {
3852                     .text:	section	.text,new
3853  0000               _TIM1_SelectInputTrigger:
3855  0000 88            	push	a
3856       00000000      OFST:	set	0
3859                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3861  0001 a140          	cp	a,#64
3862  0003 2713          	jreq	L235
3863  0005 a150          	cp	a,#80
3864  0007 270f          	jreq	L235
3865  0009 a160          	cp	a,#96
3866  000b 270b          	jreq	L235
3867  000d a170          	cp	a,#112
3868  000f 2707          	jreq	L235
3869  0011 a130          	cp	a,#48
3870  0013 2703          	jreq	L235
3871  0015 4d            	tnz	a
3872  0016 2603          	jrne	L035
3873  0018               L235:
3874  0018 4f            	clr	a
3875  0019 2010          	jra	L435
3876  001b               L035:
3877  001b ae0316        	ldw	x,#790
3878  001e 89            	pushw	x
3879  001f ae0000        	ldw	x,#0
3880  0022 89            	pushw	x
3881  0023 ae0000        	ldw	x,#L37
3882  0026 cd0000        	call	_assert_failed
3884  0029 5b04          	addw	sp,#4
3885  002b               L435:
3886                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3888  002b c65252        	ld	a,21074
3889  002e a48f          	and	a,#143
3890  0030 1a01          	or	a,(OFST+1,sp)
3891  0032 c75252        	ld	21074,a
3892                     ; 794 }
3895  0035 84            	pop	a
3896  0036 81            	ret
3933                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3933                     ; 804 {
3934                     .text:	section	.text,new
3935  0000               _TIM1_UpdateDisableConfig:
3937  0000 88            	push	a
3938       00000000      OFST:	set	0
3941                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3943  0001 4d            	tnz	a
3944  0002 2704          	jreq	L245
3945  0004 a101          	cp	a,#1
3946  0006 2603          	jrne	L045
3947  0008               L245:
3948  0008 4f            	clr	a
3949  0009 2010          	jra	L445
3950  000b               L045:
3951  000b ae0326        	ldw	x,#806
3952  000e 89            	pushw	x
3953  000f ae0000        	ldw	x,#0
3954  0012 89            	pushw	x
3955  0013 ae0000        	ldw	x,#L37
3956  0016 cd0000        	call	_assert_failed
3958  0019 5b04          	addw	sp,#4
3959  001b               L445:
3960                     ; 809   if (NewState != DISABLE)
3962  001b 0d01          	tnz	(OFST+1,sp)
3963  001d 2706          	jreq	L3331
3964                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
3966  001f 72125250      	bset	21072,#1
3968  0023 2004          	jra	L5331
3969  0025               L3331:
3970                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
3972  0025 72135250      	bres	21072,#1
3973  0029               L5331:
3974                     ; 817 }
3977  0029 84            	pop	a
3978  002a 81            	ret
4037                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4037                     ; 828 {
4038                     .text:	section	.text,new
4039  0000               _TIM1_UpdateRequestConfig:
4041  0000 88            	push	a
4042       00000000      OFST:	set	0
4045                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4047  0001 4d            	tnz	a
4048  0002 2704          	jreq	L255
4049  0004 a101          	cp	a,#1
4050  0006 2603          	jrne	L055
4051  0008               L255:
4052  0008 4f            	clr	a
4053  0009 2010          	jra	L455
4054  000b               L055:
4055  000b ae033e        	ldw	x,#830
4056  000e 89            	pushw	x
4057  000f ae0000        	ldw	x,#0
4058  0012 89            	pushw	x
4059  0013 ae0000        	ldw	x,#L37
4060  0016 cd0000        	call	_assert_failed
4062  0019 5b04          	addw	sp,#4
4063  001b               L455:
4064                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4066  001b 0d01          	tnz	(OFST+1,sp)
4067  001d 2706          	jreq	L5631
4068                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4070  001f 72145250      	bset	21072,#2
4072  0023 2004          	jra	L7631
4073  0025               L5631:
4074                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4076  0025 72155250      	bres	21072,#2
4077  0029               L7631:
4078                     ; 841 }
4081  0029 84            	pop	a
4082  002a 81            	ret
4119                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4119                     ; 850 {
4120                     .text:	section	.text,new
4121  0000               _TIM1_SelectHallSensor:
4123  0000 88            	push	a
4124       00000000      OFST:	set	0
4127                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4129  0001 4d            	tnz	a
4130  0002 2704          	jreq	L265
4131  0004 a101          	cp	a,#1
4132  0006 2603          	jrne	L065
4133  0008               L265:
4134  0008 4f            	clr	a
4135  0009 2010          	jra	L465
4136  000b               L065:
4137  000b ae0354        	ldw	x,#852
4138  000e 89            	pushw	x
4139  000f ae0000        	ldw	x,#0
4140  0012 89            	pushw	x
4141  0013 ae0000        	ldw	x,#L37
4142  0016 cd0000        	call	_assert_failed
4144  0019 5b04          	addw	sp,#4
4145  001b               L465:
4146                     ; 855   if (NewState != DISABLE)
4148  001b 0d01          	tnz	(OFST+1,sp)
4149  001d 2706          	jreq	L7041
4150                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4152  001f 721e5251      	bset	21073,#7
4154  0023 2004          	jra	L1141
4155  0025               L7041:
4156                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4158  0025 721f5251      	bres	21073,#7
4159  0029               L1141:
4160                     ; 863 }
4163  0029 84            	pop	a
4164  002a 81            	ret
4222                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4222                     ; 874 {
4223                     .text:	section	.text,new
4224  0000               _TIM1_SelectOnePulseMode:
4226  0000 88            	push	a
4227       00000000      OFST:	set	0
4230                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4232  0001 a101          	cp	a,#1
4233  0003 2703          	jreq	L275
4234  0005 4d            	tnz	a
4235  0006 2603          	jrne	L075
4236  0008               L275:
4237  0008 4f            	clr	a
4238  0009 2010          	jra	L475
4239  000b               L075:
4240  000b ae036c        	ldw	x,#876
4241  000e 89            	pushw	x
4242  000f ae0000        	ldw	x,#0
4243  0012 89            	pushw	x
4244  0013 ae0000        	ldw	x,#L37
4245  0016 cd0000        	call	_assert_failed
4247  0019 5b04          	addw	sp,#4
4248  001b               L475:
4249                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4251  001b 0d01          	tnz	(OFST+1,sp)
4252  001d 2706          	jreq	L1441
4253                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4255  001f 72165250      	bset	21072,#3
4257  0023 2004          	jra	L3441
4258  0025               L1441:
4259                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4261  0025 72175250      	bres	21072,#3
4262  0029               L3441:
4263                     ; 888 }
4266  0029 84            	pop	a
4267  002a 81            	ret
4366                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4366                     ; 904 {
4367                     .text:	section	.text,new
4368  0000               _TIM1_SelectOutputTrigger:
4370  0000 88            	push	a
4371       00000000      OFST:	set	0
4374                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4376  0001 4d            	tnz	a
4377  0002 2718          	jreq	L206
4378  0004 a110          	cp	a,#16
4379  0006 2714          	jreq	L206
4380  0008 a120          	cp	a,#32
4381  000a 2710          	jreq	L206
4382  000c a130          	cp	a,#48
4383  000e 270c          	jreq	L206
4384  0010 a140          	cp	a,#64
4385  0012 2708          	jreq	L206
4386  0014 a150          	cp	a,#80
4387  0016 2704          	jreq	L206
4388  0018 a160          	cp	a,#96
4389  001a 2603          	jrne	L006
4390  001c               L206:
4391  001c 4f            	clr	a
4392  001d 2010          	jra	L406
4393  001f               L006:
4394  001f ae038a        	ldw	x,#906
4395  0022 89            	pushw	x
4396  0023 ae0000        	ldw	x,#0
4397  0026 89            	pushw	x
4398  0027 ae0000        	ldw	x,#L37
4399  002a cd0000        	call	_assert_failed
4401  002d 5b04          	addw	sp,#4
4402  002f               L406:
4403                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4403                     ; 910                         (uint8_t) TIM1_TRGOSource);
4405  002f c65251        	ld	a,21073
4406  0032 a48f          	and	a,#143
4407  0034 1a01          	or	a,(OFST+1,sp)
4408  0036 c75251        	ld	21073,a
4409                     ; 911 }
4412  0039 84            	pop	a
4413  003a 81            	ret
4488                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4488                     ; 924 {
4489                     .text:	section	.text,new
4490  0000               _TIM1_SelectSlaveMode:
4492  0000 88            	push	a
4493       00000000      OFST:	set	0
4496                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4498  0001 a104          	cp	a,#4
4499  0003 270c          	jreq	L216
4500  0005 a105          	cp	a,#5
4501  0007 2708          	jreq	L216
4502  0009 a106          	cp	a,#6
4503  000b 2704          	jreq	L216
4504  000d a107          	cp	a,#7
4505  000f 2603          	jrne	L016
4506  0011               L216:
4507  0011 4f            	clr	a
4508  0012 2010          	jra	L416
4509  0014               L016:
4510  0014 ae039e        	ldw	x,#926
4511  0017 89            	pushw	x
4512  0018 ae0000        	ldw	x,#0
4513  001b 89            	pushw	x
4514  001c ae0000        	ldw	x,#L37
4515  001f cd0000        	call	_assert_failed
4517  0022 5b04          	addw	sp,#4
4518  0024               L416:
4519                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4519                     ; 930                          (uint8_t)TIM1_SlaveMode);
4521  0024 c65252        	ld	a,21074
4522  0027 a4f8          	and	a,#248
4523  0029 1a01          	or	a,(OFST+1,sp)
4524  002b c75252        	ld	21074,a
4525                     ; 931 }
4528  002e 84            	pop	a
4529  002f 81            	ret
4566                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4566                     ; 940 {
4567                     .text:	section	.text,new
4568  0000               _TIM1_SelectMasterSlaveMode:
4570  0000 88            	push	a
4571       00000000      OFST:	set	0
4574                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4576  0001 4d            	tnz	a
4577  0002 2704          	jreq	L226
4578  0004 a101          	cp	a,#1
4579  0006 2603          	jrne	L026
4580  0008               L226:
4581  0008 4f            	clr	a
4582  0009 2010          	jra	L426
4583  000b               L026:
4584  000b ae03ae        	ldw	x,#942
4585  000e 89            	pushw	x
4586  000f ae0000        	ldw	x,#0
4587  0012 89            	pushw	x
4588  0013 ae0000        	ldw	x,#L37
4589  0016 cd0000        	call	_assert_failed
4591  0019 5b04          	addw	sp,#4
4592  001b               L426:
4593                     ; 945   if (NewState != DISABLE)
4595  001b 0d01          	tnz	(OFST+1,sp)
4596  001d 2706          	jreq	L5551
4597                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4599  001f 721e5252      	bset	21074,#7
4601  0023 2004          	jra	L7551
4602  0025               L5551:
4603                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4605  0025 721f5252      	bres	21074,#7
4606  0029               L7551:
4607                     ; 953 }
4610  0029 84            	pop	a
4611  002a 81            	ret
4698                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4698                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4698                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4698                     ; 978 {
4699                     .text:	section	.text,new
4700  0000               _TIM1_EncoderInterfaceConfig:
4702  0000 89            	pushw	x
4703       00000000      OFST:	set	0
4706                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4708  0001 9e            	ld	a,xh
4709  0002 a101          	cp	a,#1
4710  0004 270a          	jreq	L236
4711  0006 9e            	ld	a,xh
4712  0007 a102          	cp	a,#2
4713  0009 2705          	jreq	L236
4714  000b 9e            	ld	a,xh
4715  000c a103          	cp	a,#3
4716  000e 2603          	jrne	L036
4717  0010               L236:
4718  0010 4f            	clr	a
4719  0011 2010          	jra	L436
4720  0013               L036:
4721  0013 ae03d4        	ldw	x,#980
4722  0016 89            	pushw	x
4723  0017 ae0000        	ldw	x,#0
4724  001a 89            	pushw	x
4725  001b ae0000        	ldw	x,#L37
4726  001e cd0000        	call	_assert_failed
4728  0021 5b04          	addw	sp,#4
4729  0023               L436:
4730                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4732  0023 0d02          	tnz	(OFST+2,sp)
4733  0025 2706          	jreq	L046
4734  0027 7b02          	ld	a,(OFST+2,sp)
4735  0029 a101          	cp	a,#1
4736  002b 2603          	jrne	L636
4737  002d               L046:
4738  002d 4f            	clr	a
4739  002e 2010          	jra	L246
4740  0030               L636:
4741  0030 ae03d5        	ldw	x,#981
4742  0033 89            	pushw	x
4743  0034 ae0000        	ldw	x,#0
4744  0037 89            	pushw	x
4745  0038 ae0000        	ldw	x,#L37
4746  003b cd0000        	call	_assert_failed
4748  003e 5b04          	addw	sp,#4
4749  0040               L246:
4750                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4752  0040 0d05          	tnz	(OFST+5,sp)
4753  0042 2706          	jreq	L646
4754  0044 7b05          	ld	a,(OFST+5,sp)
4755  0046 a101          	cp	a,#1
4756  0048 2603          	jrne	L446
4757  004a               L646:
4758  004a 4f            	clr	a
4759  004b 2010          	jra	L056
4760  004d               L446:
4761  004d ae03d6        	ldw	x,#982
4762  0050 89            	pushw	x
4763  0051 ae0000        	ldw	x,#0
4764  0054 89            	pushw	x
4765  0055 ae0000        	ldw	x,#L37
4766  0058 cd0000        	call	_assert_failed
4768  005b 5b04          	addw	sp,#4
4769  005d               L056:
4770                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4772  005d 0d02          	tnz	(OFST+2,sp)
4773  005f 2706          	jreq	L1261
4774                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4776  0061 7212525c      	bset	21084,#1
4778  0065 2004          	jra	L3261
4779  0067               L1261:
4780                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4782  0067 7213525c      	bres	21084,#1
4783  006b               L3261:
4784                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4786  006b 0d05          	tnz	(OFST+5,sp)
4787  006d 2706          	jreq	L5261
4788                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4790  006f 721a525c      	bset	21084,#5
4792  0073 2004          	jra	L7261
4793  0075               L5261:
4794                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4796  0075 721b525c      	bres	21084,#5
4797  0079               L7261:
4798                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4798                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4800  0079 c65252        	ld	a,21074
4801  007c a4f0          	and	a,#240
4802  007e 1a01          	or	a,(OFST+1,sp)
4803  0080 c75252        	ld	21074,a
4804                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4804                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4806  0083 c65258        	ld	a,21080
4807  0086 a4fc          	and	a,#252
4808  0088 aa01          	or	a,#1
4809  008a c75258        	ld	21080,a
4810                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4810                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4812  008d c65259        	ld	a,21081
4813  0090 a4fc          	and	a,#252
4814  0092 aa01          	or	a,#1
4815  0094 c75259        	ld	21081,a
4816                     ; 1011 }
4819  0097 85            	popw	x
4820  0098 81            	ret
4886                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4886                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4886                     ; 1025 {
4887                     .text:	section	.text,new
4888  0000               _TIM1_PrescalerConfig:
4890  0000 89            	pushw	x
4891       00000000      OFST:	set	0
4894                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4896  0001 0d05          	tnz	(OFST+5,sp)
4897  0003 2706          	jreq	L656
4898  0005 7b05          	ld	a,(OFST+5,sp)
4899  0007 a101          	cp	a,#1
4900  0009 2603          	jrne	L456
4901  000b               L656:
4902  000b 4f            	clr	a
4903  000c 2010          	jra	L066
4904  000e               L456:
4905  000e ae0403        	ldw	x,#1027
4906  0011 89            	pushw	x
4907  0012 ae0000        	ldw	x,#0
4908  0015 89            	pushw	x
4909  0016 ae0000        	ldw	x,#L37
4910  0019 cd0000        	call	_assert_failed
4912  001c 5b04          	addw	sp,#4
4913  001e               L066:
4914                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4916  001e 7b01          	ld	a,(OFST+1,sp)
4917  0020 c75260        	ld	21088,a
4918                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4920  0023 7b02          	ld	a,(OFST+2,sp)
4921  0025 c75261        	ld	21089,a
4922                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4924  0028 7b05          	ld	a,(OFST+5,sp)
4925  002a c75257        	ld	21079,a
4926                     ; 1035 }
4929  002d 85            	popw	x
4930  002e 81            	ret
4967                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4967                     ; 1049 {
4968                     .text:	section	.text,new
4969  0000               _TIM1_CounterModeConfig:
4971  0000 88            	push	a
4972       00000000      OFST:	set	0
4975                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
4977  0001 4d            	tnz	a
4978  0002 2710          	jreq	L666
4979  0004 a110          	cp	a,#16
4980  0006 270c          	jreq	L666
4981  0008 a120          	cp	a,#32
4982  000a 2708          	jreq	L666
4983  000c a140          	cp	a,#64
4984  000e 2704          	jreq	L666
4985  0010 a160          	cp	a,#96
4986  0012 2603          	jrne	L466
4987  0014               L666:
4988  0014 4f            	clr	a
4989  0015 2010          	jra	L076
4990  0017               L466:
4991  0017 ae041b        	ldw	x,#1051
4992  001a 89            	pushw	x
4993  001b ae0000        	ldw	x,#0
4994  001e 89            	pushw	x
4995  001f ae0000        	ldw	x,#L37
4996  0022 cd0000        	call	_assert_failed
4998  0025 5b04          	addw	sp,#4
4999  0027               L076:
5000                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5000                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5002  0027 c65250        	ld	a,21072
5003  002a a48f          	and	a,#143
5004  002c 1a01          	or	a,(OFST+1,sp)
5005  002e c75250        	ld	21072,a
5006                     ; 1057 }
5009  0031 84            	pop	a
5010  0032 81            	ret
5069                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5069                     ; 1068 {
5070                     .text:	section	.text,new
5071  0000               _TIM1_ForcedOC1Config:
5073  0000 88            	push	a
5074       00000000      OFST:	set	0
5077                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5079  0001 a150          	cp	a,#80
5080  0003 2704          	jreq	L676
5081  0005 a140          	cp	a,#64
5082  0007 2603          	jrne	L476
5083  0009               L676:
5084  0009 4f            	clr	a
5085  000a 2010          	jra	L007
5086  000c               L476:
5087  000c ae042e        	ldw	x,#1070
5088  000f 89            	pushw	x
5089  0010 ae0000        	ldw	x,#0
5090  0013 89            	pushw	x
5091  0014 ae0000        	ldw	x,#L37
5092  0017 cd0000        	call	_assert_failed
5094  001a 5b04          	addw	sp,#4
5095  001c               L007:
5096                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5096                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5098  001c c65258        	ld	a,21080
5099  001f a48f          	and	a,#143
5100  0021 1a01          	or	a,(OFST+1,sp)
5101  0023 c75258        	ld	21080,a
5102                     ; 1075 }
5105  0026 84            	pop	a
5106  0027 81            	ret
5143                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5143                     ; 1086 {
5144                     .text:	section	.text,new
5145  0000               _TIM1_ForcedOC2Config:
5147  0000 88            	push	a
5148       00000000      OFST:	set	0
5151                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5153  0001 a150          	cp	a,#80
5154  0003 2704          	jreq	L607
5155  0005 a140          	cp	a,#64
5156  0007 2603          	jrne	L407
5157  0009               L607:
5158  0009 4f            	clr	a
5159  000a 2010          	jra	L017
5160  000c               L407:
5161  000c ae0440        	ldw	x,#1088
5162  000f 89            	pushw	x
5163  0010 ae0000        	ldw	x,#0
5164  0013 89            	pushw	x
5165  0014 ae0000        	ldw	x,#L37
5166  0017 cd0000        	call	_assert_failed
5168  001a 5b04          	addw	sp,#4
5169  001c               L017:
5170                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5170                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5172  001c c65259        	ld	a,21081
5173  001f a48f          	and	a,#143
5174  0021 1a01          	or	a,(OFST+1,sp)
5175  0023 c75259        	ld	21081,a
5176                     ; 1093 }
5179  0026 84            	pop	a
5180  0027 81            	ret
5217                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5217                     ; 1105 {
5218                     .text:	section	.text,new
5219  0000               _TIM1_ForcedOC3Config:
5221  0000 88            	push	a
5222       00000000      OFST:	set	0
5225                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5227  0001 a150          	cp	a,#80
5228  0003 2704          	jreq	L617
5229  0005 a140          	cp	a,#64
5230  0007 2603          	jrne	L417
5231  0009               L617:
5232  0009 4f            	clr	a
5233  000a 2010          	jra	L027
5234  000c               L417:
5235  000c ae0453        	ldw	x,#1107
5236  000f 89            	pushw	x
5237  0010 ae0000        	ldw	x,#0
5238  0013 89            	pushw	x
5239  0014 ae0000        	ldw	x,#L37
5240  0017 cd0000        	call	_assert_failed
5242  001a 5b04          	addw	sp,#4
5243  001c               L027:
5244                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5244                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5246  001c c6525a        	ld	a,21082
5247  001f a48f          	and	a,#143
5248  0021 1a01          	or	a,(OFST+1,sp)
5249  0023 c7525a        	ld	21082,a
5250                     ; 1112 }
5253  0026 84            	pop	a
5254  0027 81            	ret
5291                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5291                     ; 1124 {
5292                     .text:	section	.text,new
5293  0000               _TIM1_ForcedOC4Config:
5295  0000 88            	push	a
5296       00000000      OFST:	set	0
5299                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5301  0001 a150          	cp	a,#80
5302  0003 2704          	jreq	L627
5303  0005 a140          	cp	a,#64
5304  0007 2603          	jrne	L427
5305  0009               L627:
5306  0009 4f            	clr	a
5307  000a 2010          	jra	L037
5308  000c               L427:
5309  000c ae0466        	ldw	x,#1126
5310  000f 89            	pushw	x
5311  0010 ae0000        	ldw	x,#0
5312  0013 89            	pushw	x
5313  0014 ae0000        	ldw	x,#L37
5314  0017 cd0000        	call	_assert_failed
5316  001a 5b04          	addw	sp,#4
5317  001c               L037:
5318                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5318                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5320  001c c6525b        	ld	a,21083
5321  001f a48f          	and	a,#143
5322  0021 1a01          	or	a,(OFST+1,sp)
5323  0023 c7525b        	ld	21083,a
5324                     ; 1131 }
5327  0026 84            	pop	a
5328  0027 81            	ret
5365                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5365                     ; 1140 {
5366                     .text:	section	.text,new
5367  0000               _TIM1_ARRPreloadConfig:
5369  0000 88            	push	a
5370       00000000      OFST:	set	0
5373                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5375  0001 4d            	tnz	a
5376  0002 2704          	jreq	L637
5377  0004 a101          	cp	a,#1
5378  0006 2603          	jrne	L437
5379  0008               L637:
5380  0008 4f            	clr	a
5381  0009 2010          	jra	L047
5382  000b               L437:
5383  000b ae0476        	ldw	x,#1142
5384  000e 89            	pushw	x
5385  000f ae0000        	ldw	x,#0
5386  0012 89            	pushw	x
5387  0013 ae0000        	ldw	x,#L37
5388  0016 cd0000        	call	_assert_failed
5390  0019 5b04          	addw	sp,#4
5391  001b               L047:
5392                     ; 1145   if (NewState != DISABLE)
5394  001b 0d01          	tnz	(OFST+1,sp)
5395  001d 2706          	jreq	L5102
5396                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5398  001f 721e5250      	bset	21072,#7
5400  0023 2004          	jra	L7102
5401  0025               L5102:
5402                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5404  0025 721f5250      	bres	21072,#7
5405  0029               L7102:
5406                     ; 1153 }
5409  0029 84            	pop	a
5410  002a 81            	ret
5446                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5446                     ; 1162 {
5447                     .text:	section	.text,new
5448  0000               _TIM1_SelectCOM:
5450  0000 88            	push	a
5451       00000000      OFST:	set	0
5454                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5456  0001 4d            	tnz	a
5457  0002 2704          	jreq	L647
5458  0004 a101          	cp	a,#1
5459  0006 2603          	jrne	L447
5460  0008               L647:
5461  0008 4f            	clr	a
5462  0009 2010          	jra	L057
5463  000b               L447:
5464  000b ae048c        	ldw	x,#1164
5465  000e 89            	pushw	x
5466  000f ae0000        	ldw	x,#0
5467  0012 89            	pushw	x
5468  0013 ae0000        	ldw	x,#L37
5469  0016 cd0000        	call	_assert_failed
5471  0019 5b04          	addw	sp,#4
5472  001b               L057:
5473                     ; 1167   if (NewState != DISABLE)
5475  001b 0d01          	tnz	(OFST+1,sp)
5476  001d 2706          	jreq	L7302
5477                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5479  001f 72145251      	bset	21073,#2
5481  0023 2004          	jra	L1402
5482  0025               L7302:
5483                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5485  0025 72155251      	bres	21073,#2
5486  0029               L1402:
5487                     ; 1175 }
5490  0029 84            	pop	a
5491  002a 81            	ret
5528                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5528                     ; 1184 {
5529                     .text:	section	.text,new
5530  0000               _TIM1_CCPreloadControl:
5532  0000 88            	push	a
5533       00000000      OFST:	set	0
5536                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5538  0001 4d            	tnz	a
5539  0002 2704          	jreq	L657
5540  0004 a101          	cp	a,#1
5541  0006 2603          	jrne	L457
5542  0008               L657:
5543  0008 4f            	clr	a
5544  0009 2010          	jra	L067
5545  000b               L457:
5546  000b ae04a2        	ldw	x,#1186
5547  000e 89            	pushw	x
5548  000f ae0000        	ldw	x,#0
5549  0012 89            	pushw	x
5550  0013 ae0000        	ldw	x,#L37
5551  0016 cd0000        	call	_assert_failed
5553  0019 5b04          	addw	sp,#4
5554  001b               L067:
5555                     ; 1189   if (NewState != DISABLE)
5557  001b 0d01          	tnz	(OFST+1,sp)
5558  001d 2706          	jreq	L1602
5559                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5561  001f 72105251      	bset	21073,#0
5563  0023 2004          	jra	L3602
5564  0025               L1602:
5565                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5567  0025 72115251      	bres	21073,#0
5568  0029               L3602:
5569                     ; 1197 }
5572  0029 84            	pop	a
5573  002a 81            	ret
5610                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5610                     ; 1206 {
5611                     .text:	section	.text,new
5612  0000               _TIM1_OC1PreloadConfig:
5614  0000 88            	push	a
5615       00000000      OFST:	set	0
5618                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5620  0001 4d            	tnz	a
5621  0002 2704          	jreq	L667
5622  0004 a101          	cp	a,#1
5623  0006 2603          	jrne	L467
5624  0008               L667:
5625  0008 4f            	clr	a
5626  0009 2010          	jra	L077
5627  000b               L467:
5628  000b ae04b8        	ldw	x,#1208
5629  000e 89            	pushw	x
5630  000f ae0000        	ldw	x,#0
5631  0012 89            	pushw	x
5632  0013 ae0000        	ldw	x,#L37
5633  0016 cd0000        	call	_assert_failed
5635  0019 5b04          	addw	sp,#4
5636  001b               L077:
5637                     ; 1211   if (NewState != DISABLE)
5639  001b 0d01          	tnz	(OFST+1,sp)
5640  001d 2706          	jreq	L3012
5641                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5643  001f 72165258      	bset	21080,#3
5645  0023 2004          	jra	L5012
5646  0025               L3012:
5647                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5649  0025 72175258      	bres	21080,#3
5650  0029               L5012:
5651                     ; 1219 }
5654  0029 84            	pop	a
5655  002a 81            	ret
5692                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5692                     ; 1228 {
5693                     .text:	section	.text,new
5694  0000               _TIM1_OC2PreloadConfig:
5696  0000 88            	push	a
5697       00000000      OFST:	set	0
5700                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5702  0001 4d            	tnz	a
5703  0002 2704          	jreq	L677
5704  0004 a101          	cp	a,#1
5705  0006 2603          	jrne	L477
5706  0008               L677:
5707  0008 4f            	clr	a
5708  0009 2010          	jra	L0001
5709  000b               L477:
5710  000b ae04ce        	ldw	x,#1230
5711  000e 89            	pushw	x
5712  000f ae0000        	ldw	x,#0
5713  0012 89            	pushw	x
5714  0013 ae0000        	ldw	x,#L37
5715  0016 cd0000        	call	_assert_failed
5717  0019 5b04          	addw	sp,#4
5718  001b               L0001:
5719                     ; 1233   if (NewState != DISABLE)
5721  001b 0d01          	tnz	(OFST+1,sp)
5722  001d 2706          	jreq	L5212
5723                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5725  001f 72165259      	bset	21081,#3
5727  0023 2004          	jra	L7212
5728  0025               L5212:
5729                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5731  0025 72175259      	bres	21081,#3
5732  0029               L7212:
5733                     ; 1241 }
5736  0029 84            	pop	a
5737  002a 81            	ret
5774                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5774                     ; 1250 {
5775                     .text:	section	.text,new
5776  0000               _TIM1_OC3PreloadConfig:
5778  0000 88            	push	a
5779       00000000      OFST:	set	0
5782                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5784  0001 4d            	tnz	a
5785  0002 2704          	jreq	L6001
5786  0004 a101          	cp	a,#1
5787  0006 2603          	jrne	L4001
5788  0008               L6001:
5789  0008 4f            	clr	a
5790  0009 2010          	jra	L0101
5791  000b               L4001:
5792  000b ae04e4        	ldw	x,#1252
5793  000e 89            	pushw	x
5794  000f ae0000        	ldw	x,#0
5795  0012 89            	pushw	x
5796  0013 ae0000        	ldw	x,#L37
5797  0016 cd0000        	call	_assert_failed
5799  0019 5b04          	addw	sp,#4
5800  001b               L0101:
5801                     ; 1255   if (NewState != DISABLE)
5803  001b 0d01          	tnz	(OFST+1,sp)
5804  001d 2706          	jreq	L7412
5805                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5807  001f 7216525a      	bset	21082,#3
5809  0023 2004          	jra	L1512
5810  0025               L7412:
5811                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5813  0025 7217525a      	bres	21082,#3
5814  0029               L1512:
5815                     ; 1263 }
5818  0029 84            	pop	a
5819  002a 81            	ret
5856                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5856                     ; 1272 {
5857                     .text:	section	.text,new
5858  0000               _TIM1_OC4PreloadConfig:
5860  0000 88            	push	a
5861       00000000      OFST:	set	0
5864                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5866  0001 4d            	tnz	a
5867  0002 2704          	jreq	L6101
5868  0004 a101          	cp	a,#1
5869  0006 2603          	jrne	L4101
5870  0008               L6101:
5871  0008 4f            	clr	a
5872  0009 2010          	jra	L0201
5873  000b               L4101:
5874  000b ae04fa        	ldw	x,#1274
5875  000e 89            	pushw	x
5876  000f ae0000        	ldw	x,#0
5877  0012 89            	pushw	x
5878  0013 ae0000        	ldw	x,#L37
5879  0016 cd0000        	call	_assert_failed
5881  0019 5b04          	addw	sp,#4
5882  001b               L0201:
5883                     ; 1277   if (NewState != DISABLE)
5885  001b 0d01          	tnz	(OFST+1,sp)
5886  001d 2706          	jreq	L1712
5887                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5889  001f 7216525b      	bset	21083,#3
5891  0023 2004          	jra	L3712
5892  0025               L1712:
5893                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5895  0025 7217525b      	bres	21083,#3
5896  0029               L3712:
5897                     ; 1285 }
5900  0029 84            	pop	a
5901  002a 81            	ret
5937                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5937                     ; 1294 {
5938                     .text:	section	.text,new
5939  0000               _TIM1_OC1FastConfig:
5941  0000 88            	push	a
5942       00000000      OFST:	set	0
5945                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5947  0001 4d            	tnz	a
5948  0002 2704          	jreq	L6201
5949  0004 a101          	cp	a,#1
5950  0006 2603          	jrne	L4201
5951  0008               L6201:
5952  0008 4f            	clr	a
5953  0009 2010          	jra	L0301
5954  000b               L4201:
5955  000b ae0510        	ldw	x,#1296
5956  000e 89            	pushw	x
5957  000f ae0000        	ldw	x,#0
5958  0012 89            	pushw	x
5959  0013 ae0000        	ldw	x,#L37
5960  0016 cd0000        	call	_assert_failed
5962  0019 5b04          	addw	sp,#4
5963  001b               L0301:
5964                     ; 1299   if (NewState != DISABLE)
5966  001b 0d01          	tnz	(OFST+1,sp)
5967  001d 2706          	jreq	L3122
5968                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
5970  001f 72145258      	bset	21080,#2
5972  0023 2004          	jra	L5122
5973  0025               L3122:
5974                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5976  0025 72155258      	bres	21080,#2
5977  0029               L5122:
5978                     ; 1307 }
5981  0029 84            	pop	a
5982  002a 81            	ret
6018                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6018                     ; 1316 {
6019                     .text:	section	.text,new
6020  0000               _TIM1_OC2FastConfig:
6022  0000 88            	push	a
6023       00000000      OFST:	set	0
6026                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6028  0001 4d            	tnz	a
6029  0002 2704          	jreq	L6301
6030  0004 a101          	cp	a,#1
6031  0006 2603          	jrne	L4301
6032  0008               L6301:
6033  0008 4f            	clr	a
6034  0009 2010          	jra	L0401
6035  000b               L4301:
6036  000b ae0526        	ldw	x,#1318
6037  000e 89            	pushw	x
6038  000f ae0000        	ldw	x,#0
6039  0012 89            	pushw	x
6040  0013 ae0000        	ldw	x,#L37
6041  0016 cd0000        	call	_assert_failed
6043  0019 5b04          	addw	sp,#4
6044  001b               L0401:
6045                     ; 1321   if (NewState != DISABLE)
6047  001b 0d01          	tnz	(OFST+1,sp)
6048  001d 2706          	jreq	L5322
6049                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6051  001f 72145259      	bset	21081,#2
6053  0023 2004          	jra	L7322
6054  0025               L5322:
6055                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6057  0025 72155259      	bres	21081,#2
6058  0029               L7322:
6059                     ; 1329 }
6062  0029 84            	pop	a
6063  002a 81            	ret
6099                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6099                     ; 1338 {
6100                     .text:	section	.text,new
6101  0000               _TIM1_OC3FastConfig:
6103  0000 88            	push	a
6104       00000000      OFST:	set	0
6107                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6109  0001 4d            	tnz	a
6110  0002 2704          	jreq	L6401
6111  0004 a101          	cp	a,#1
6112  0006 2603          	jrne	L4401
6113  0008               L6401:
6114  0008 4f            	clr	a
6115  0009 2010          	jra	L0501
6116  000b               L4401:
6117  000b ae053c        	ldw	x,#1340
6118  000e 89            	pushw	x
6119  000f ae0000        	ldw	x,#0
6120  0012 89            	pushw	x
6121  0013 ae0000        	ldw	x,#L37
6122  0016 cd0000        	call	_assert_failed
6124  0019 5b04          	addw	sp,#4
6125  001b               L0501:
6126                     ; 1343   if (NewState != DISABLE)
6128  001b 0d01          	tnz	(OFST+1,sp)
6129  001d 2706          	jreq	L7522
6130                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6132  001f 7214525a      	bset	21082,#2
6134  0023 2004          	jra	L1622
6135  0025               L7522:
6136                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6138  0025 7215525a      	bres	21082,#2
6139  0029               L1622:
6140                     ; 1351 }
6143  0029 84            	pop	a
6144  002a 81            	ret
6180                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6180                     ; 1360 {
6181                     .text:	section	.text,new
6182  0000               _TIM1_OC4FastConfig:
6184  0000 88            	push	a
6185       00000000      OFST:	set	0
6188                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6190  0001 4d            	tnz	a
6191  0002 2704          	jreq	L6501
6192  0004 a101          	cp	a,#1
6193  0006 2603          	jrne	L4501
6194  0008               L6501:
6195  0008 4f            	clr	a
6196  0009 2010          	jra	L0601
6197  000b               L4501:
6198  000b ae0552        	ldw	x,#1362
6199  000e 89            	pushw	x
6200  000f ae0000        	ldw	x,#0
6201  0012 89            	pushw	x
6202  0013 ae0000        	ldw	x,#L37
6203  0016 cd0000        	call	_assert_failed
6205  0019 5b04          	addw	sp,#4
6206  001b               L0601:
6207                     ; 1365   if (NewState != DISABLE)
6209  001b 0d01          	tnz	(OFST+1,sp)
6210  001d 2706          	jreq	L1032
6211                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6213  001f 7214525b      	bset	21083,#2
6215  0023 2004          	jra	L3032
6216  0025               L1032:
6217                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6219  0025 7215525b      	bres	21083,#2
6220  0029               L3032:
6221                     ; 1373 }
6224  0029 84            	pop	a
6225  002a 81            	ret
6331                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6331                     ; 1390 {
6332                     .text:	section	.text,new
6333  0000               _TIM1_GenerateEvent:
6335  0000 88            	push	a
6336       00000000      OFST:	set	0
6339                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6341  0001 4d            	tnz	a
6342  0002 2703          	jreq	L4601
6343  0004 4f            	clr	a
6344  0005 2010          	jra	L6601
6345  0007               L4601:
6346  0007 ae0570        	ldw	x,#1392
6347  000a 89            	pushw	x
6348  000b ae0000        	ldw	x,#0
6349  000e 89            	pushw	x
6350  000f ae0000        	ldw	x,#L37
6351  0012 cd0000        	call	_assert_failed
6353  0015 5b04          	addw	sp,#4
6354  0017               L6601:
6355                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6357  0017 7b01          	ld	a,(OFST+1,sp)
6358  0019 c75257        	ld	21079,a
6359                     ; 1396 }
6362  001c 84            	pop	a
6363  001d 81            	ret
6400                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6400                     ; 1407 {
6401                     .text:	section	.text,new
6402  0000               _TIM1_OC1PolarityConfig:
6404  0000 88            	push	a
6405       00000000      OFST:	set	0
6408                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6410  0001 4d            	tnz	a
6411  0002 2704          	jreq	L4701
6412  0004 a122          	cp	a,#34
6413  0006 2603          	jrne	L2701
6414  0008               L4701:
6415  0008 4f            	clr	a
6416  0009 2010          	jra	L6701
6417  000b               L2701:
6418  000b ae0581        	ldw	x,#1409
6419  000e 89            	pushw	x
6420  000f ae0000        	ldw	x,#0
6421  0012 89            	pushw	x
6422  0013 ae0000        	ldw	x,#L37
6423  0016 cd0000        	call	_assert_failed
6425  0019 5b04          	addw	sp,#4
6426  001b               L6701:
6427                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6429  001b 0d01          	tnz	(OFST+1,sp)
6430  001d 2706          	jreq	L5632
6431                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6433  001f 7212525c      	bset	21084,#1
6435  0023 2004          	jra	L7632
6436  0025               L5632:
6437                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6439  0025 7213525c      	bres	21084,#1
6440  0029               L7632:
6441                     ; 1420 }
6444  0029 84            	pop	a
6445  002a 81            	ret
6482                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6482                     ; 1431 {
6483                     .text:	section	.text,new
6484  0000               _TIM1_OC1NPolarityConfig:
6486  0000 88            	push	a
6487       00000000      OFST:	set	0
6490                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6492  0001 4d            	tnz	a
6493  0002 2704          	jreq	L4011
6494  0004 a188          	cp	a,#136
6495  0006 2603          	jrne	L2011
6496  0008               L4011:
6497  0008 4f            	clr	a
6498  0009 2010          	jra	L6011
6499  000b               L2011:
6500  000b ae0599        	ldw	x,#1433
6501  000e 89            	pushw	x
6502  000f ae0000        	ldw	x,#0
6503  0012 89            	pushw	x
6504  0013 ae0000        	ldw	x,#L37
6505  0016 cd0000        	call	_assert_failed
6507  0019 5b04          	addw	sp,#4
6508  001b               L6011:
6509                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6511  001b 0d01          	tnz	(OFST+1,sp)
6512  001d 2706          	jreq	L7042
6513                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6515  001f 7216525c      	bset	21084,#3
6517  0023 2004          	jra	L1142
6518  0025               L7042:
6519                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6521  0025 7217525c      	bres	21084,#3
6522  0029               L1142:
6523                     ; 1444 }
6526  0029 84            	pop	a
6527  002a 81            	ret
6564                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6564                     ; 1455 {
6565                     .text:	section	.text,new
6566  0000               _TIM1_OC2PolarityConfig:
6568  0000 88            	push	a
6569       00000000      OFST:	set	0
6572                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6574  0001 4d            	tnz	a
6575  0002 2704          	jreq	L4111
6576  0004 a122          	cp	a,#34
6577  0006 2603          	jrne	L2111
6578  0008               L4111:
6579  0008 4f            	clr	a
6580  0009 2010          	jra	L6111
6581  000b               L2111:
6582  000b ae05b1        	ldw	x,#1457
6583  000e 89            	pushw	x
6584  000f ae0000        	ldw	x,#0
6585  0012 89            	pushw	x
6586  0013 ae0000        	ldw	x,#L37
6587  0016 cd0000        	call	_assert_failed
6589  0019 5b04          	addw	sp,#4
6590  001b               L6111:
6591                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6593  001b 0d01          	tnz	(OFST+1,sp)
6594  001d 2706          	jreq	L1342
6595                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6597  001f 721a525c      	bset	21084,#5
6599  0023 2004          	jra	L3342
6600  0025               L1342:
6601                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6603  0025 721b525c      	bres	21084,#5
6604  0029               L3342:
6605                     ; 1468 }
6608  0029 84            	pop	a
6609  002a 81            	ret
6646                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6646                     ; 1479 {
6647                     .text:	section	.text,new
6648  0000               _TIM1_OC2NPolarityConfig:
6650  0000 88            	push	a
6651       00000000      OFST:	set	0
6654                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6656  0001 4d            	tnz	a
6657  0002 2704          	jreq	L4211
6658  0004 a188          	cp	a,#136
6659  0006 2603          	jrne	L2211
6660  0008               L4211:
6661  0008 4f            	clr	a
6662  0009 2010          	jra	L6211
6663  000b               L2211:
6664  000b ae05c9        	ldw	x,#1481
6665  000e 89            	pushw	x
6666  000f ae0000        	ldw	x,#0
6667  0012 89            	pushw	x
6668  0013 ae0000        	ldw	x,#L37
6669  0016 cd0000        	call	_assert_failed
6671  0019 5b04          	addw	sp,#4
6672  001b               L6211:
6673                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6675  001b 0d01          	tnz	(OFST+1,sp)
6676  001d 2706          	jreq	L3542
6677                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6679  001f 721e525c      	bset	21084,#7
6681  0023 2004          	jra	L5542
6682  0025               L3542:
6683                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6685  0025 721f525c      	bres	21084,#7
6686  0029               L5542:
6687                     ; 1492 }
6690  0029 84            	pop	a
6691  002a 81            	ret
6728                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6728                     ; 1503 {
6729                     .text:	section	.text,new
6730  0000               _TIM1_OC3PolarityConfig:
6732  0000 88            	push	a
6733       00000000      OFST:	set	0
6736                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6738  0001 4d            	tnz	a
6739  0002 2704          	jreq	L4311
6740  0004 a122          	cp	a,#34
6741  0006 2603          	jrne	L2311
6742  0008               L4311:
6743  0008 4f            	clr	a
6744  0009 2010          	jra	L6311
6745  000b               L2311:
6746  000b ae05e1        	ldw	x,#1505
6747  000e 89            	pushw	x
6748  000f ae0000        	ldw	x,#0
6749  0012 89            	pushw	x
6750  0013 ae0000        	ldw	x,#L37
6751  0016 cd0000        	call	_assert_failed
6753  0019 5b04          	addw	sp,#4
6754  001b               L6311:
6755                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6757  001b 0d01          	tnz	(OFST+1,sp)
6758  001d 2706          	jreq	L5742
6759                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6761  001f 7212525d      	bset	21085,#1
6763  0023 2004          	jra	L7742
6764  0025               L5742:
6765                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6767  0025 7213525d      	bres	21085,#1
6768  0029               L7742:
6769                     ; 1516 }
6772  0029 84            	pop	a
6773  002a 81            	ret
6810                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6810                     ; 1528 {
6811                     .text:	section	.text,new
6812  0000               _TIM1_OC3NPolarityConfig:
6814  0000 88            	push	a
6815       00000000      OFST:	set	0
6818                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6820  0001 4d            	tnz	a
6821  0002 2704          	jreq	L4411
6822  0004 a188          	cp	a,#136
6823  0006 2603          	jrne	L2411
6824  0008               L4411:
6825  0008 4f            	clr	a
6826  0009 2010          	jra	L6411
6827  000b               L2411:
6828  000b ae05fa        	ldw	x,#1530
6829  000e 89            	pushw	x
6830  000f ae0000        	ldw	x,#0
6831  0012 89            	pushw	x
6832  0013 ae0000        	ldw	x,#L37
6833  0016 cd0000        	call	_assert_failed
6835  0019 5b04          	addw	sp,#4
6836  001b               L6411:
6837                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6839  001b 0d01          	tnz	(OFST+1,sp)
6840  001d 2706          	jreq	L7152
6841                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6843  001f 7216525d      	bset	21085,#3
6845  0023 2004          	jra	L1252
6846  0025               L7152:
6847                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6849  0025 7217525d      	bres	21085,#3
6850  0029               L1252:
6851                     ; 1541 }
6854  0029 84            	pop	a
6855  002a 81            	ret
6892                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6892                     ; 1552 {
6893                     .text:	section	.text,new
6894  0000               _TIM1_OC4PolarityConfig:
6896  0000 88            	push	a
6897       00000000      OFST:	set	0
6900                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6902  0001 4d            	tnz	a
6903  0002 2704          	jreq	L4511
6904  0004 a122          	cp	a,#34
6905  0006 2603          	jrne	L2511
6906  0008               L4511:
6907  0008 4f            	clr	a
6908  0009 2010          	jra	L6511
6909  000b               L2511:
6910  000b ae0612        	ldw	x,#1554
6911  000e 89            	pushw	x
6912  000f ae0000        	ldw	x,#0
6913  0012 89            	pushw	x
6914  0013 ae0000        	ldw	x,#L37
6915  0016 cd0000        	call	_assert_failed
6917  0019 5b04          	addw	sp,#4
6918  001b               L6511:
6919                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6921  001b 0d01          	tnz	(OFST+1,sp)
6922  001d 2706          	jreq	L1452
6923                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6925  001f 721a525d      	bset	21085,#5
6927  0023 2004          	jra	L3452
6928  0025               L1452:
6929                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6931  0025 721b525d      	bres	21085,#5
6932  0029               L3452:
6933                     ; 1565 }
6936  0029 84            	pop	a
6937  002a 81            	ret
6983                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6983                     ; 1580 {
6984                     .text:	section	.text,new
6985  0000               _TIM1_CCxCmd:
6987  0000 89            	pushw	x
6988       00000000      OFST:	set	0
6991                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
6993  0001 9e            	ld	a,xh
6994  0002 4d            	tnz	a
6995  0003 270f          	jreq	L4611
6996  0005 9e            	ld	a,xh
6997  0006 a101          	cp	a,#1
6998  0008 270a          	jreq	L4611
6999  000a 9e            	ld	a,xh
7000  000b a102          	cp	a,#2
7001  000d 2705          	jreq	L4611
7002  000f 9e            	ld	a,xh
7003  0010 a103          	cp	a,#3
7004  0012 2603          	jrne	L2611
7005  0014               L4611:
7006  0014 4f            	clr	a
7007  0015 2010          	jra	L6611
7008  0017               L2611:
7009  0017 ae062e        	ldw	x,#1582
7010  001a 89            	pushw	x
7011  001b ae0000        	ldw	x,#0
7012  001e 89            	pushw	x
7013  001f ae0000        	ldw	x,#L37
7014  0022 cd0000        	call	_assert_failed
7016  0025 5b04          	addw	sp,#4
7017  0027               L6611:
7018                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7020  0027 0d02          	tnz	(OFST+2,sp)
7021  0029 2706          	jreq	L2711
7022  002b 7b02          	ld	a,(OFST+2,sp)
7023  002d a101          	cp	a,#1
7024  002f 2603          	jrne	L0711
7025  0031               L2711:
7026  0031 4f            	clr	a
7027  0032 2010          	jra	L4711
7028  0034               L0711:
7029  0034 ae062f        	ldw	x,#1583
7030  0037 89            	pushw	x
7031  0038 ae0000        	ldw	x,#0
7032  003b 89            	pushw	x
7033  003c ae0000        	ldw	x,#L37
7034  003f cd0000        	call	_assert_failed
7036  0042 5b04          	addw	sp,#4
7037  0044               L4711:
7038                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7040  0044 0d01          	tnz	(OFST+1,sp)
7041  0046 2610          	jrne	L7652
7042                     ; 1588     if (NewState != DISABLE)
7044  0048 0d02          	tnz	(OFST+2,sp)
7045  004a 2706          	jreq	L1752
7046                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7048  004c 7210525c      	bset	21084,#0
7050  0050 2040          	jra	L5752
7051  0052               L1752:
7052                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7054  0052 7211525c      	bres	21084,#0
7055  0056 203a          	jra	L5752
7056  0058               L7652:
7057                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7059  0058 7b01          	ld	a,(OFST+1,sp)
7060  005a a101          	cp	a,#1
7061  005c 2610          	jrne	L7752
7062                     ; 1601     if (NewState != DISABLE)
7064  005e 0d02          	tnz	(OFST+2,sp)
7065  0060 2706          	jreq	L1062
7066                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7068  0062 7218525c      	bset	21084,#4
7070  0066 202a          	jra	L5752
7071  0068               L1062:
7072                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7074  0068 7219525c      	bres	21084,#4
7075  006c 2024          	jra	L5752
7076  006e               L7752:
7077                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7079  006e 7b01          	ld	a,(OFST+1,sp)
7080  0070 a102          	cp	a,#2
7081  0072 2610          	jrne	L7062
7082                     ; 1613     if (NewState != DISABLE)
7084  0074 0d02          	tnz	(OFST+2,sp)
7085  0076 2706          	jreq	L1162
7086                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7088  0078 7210525d      	bset	21085,#0
7090  007c 2014          	jra	L5752
7091  007e               L1162:
7092                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7094  007e 7211525d      	bres	21085,#0
7095  0082 200e          	jra	L5752
7096  0084               L7062:
7097                     ; 1625     if (NewState != DISABLE)
7099  0084 0d02          	tnz	(OFST+2,sp)
7100  0086 2706          	jreq	L7162
7101                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7103  0088 7218525d      	bset	21085,#4
7105  008c 2004          	jra	L5752
7106  008e               L7162:
7107                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7109  008e 7219525d      	bres	21085,#4
7110  0092               L5752:
7111                     ; 1634 }
7114  0092 85            	popw	x
7115  0093 81            	ret
7161                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7161                     ; 1648 {
7162                     .text:	section	.text,new
7163  0000               _TIM1_CCxNCmd:
7165  0000 89            	pushw	x
7166       00000000      OFST:	set	0
7169                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7171  0001 9e            	ld	a,xh
7172  0002 4d            	tnz	a
7173  0003 270a          	jreq	L2021
7174  0005 9e            	ld	a,xh
7175  0006 a101          	cp	a,#1
7176  0008 2705          	jreq	L2021
7177  000a 9e            	ld	a,xh
7178  000b a102          	cp	a,#2
7179  000d 2603          	jrne	L0021
7180  000f               L2021:
7181  000f 4f            	clr	a
7182  0010 2010          	jra	L4021
7183  0012               L0021:
7184  0012 ae0672        	ldw	x,#1650
7185  0015 89            	pushw	x
7186  0016 ae0000        	ldw	x,#0
7187  0019 89            	pushw	x
7188  001a ae0000        	ldw	x,#L37
7189  001d cd0000        	call	_assert_failed
7191  0020 5b04          	addw	sp,#4
7192  0022               L4021:
7193                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7195  0022 0d02          	tnz	(OFST+2,sp)
7196  0024 2706          	jreq	L0121
7197  0026 7b02          	ld	a,(OFST+2,sp)
7198  0028 a101          	cp	a,#1
7199  002a 2603          	jrne	L6021
7200  002c               L0121:
7201  002c 4f            	clr	a
7202  002d 2010          	jra	L2121
7203  002f               L6021:
7204  002f ae0673        	ldw	x,#1651
7205  0032 89            	pushw	x
7206  0033 ae0000        	ldw	x,#0
7207  0036 89            	pushw	x
7208  0037 ae0000        	ldw	x,#L37
7209  003a cd0000        	call	_assert_failed
7211  003d 5b04          	addw	sp,#4
7212  003f               L2121:
7213                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7215  003f 0d01          	tnz	(OFST+1,sp)
7216  0041 2610          	jrne	L5462
7217                     ; 1656     if (NewState != DISABLE)
7219  0043 0d02          	tnz	(OFST+2,sp)
7220  0045 2706          	jreq	L7462
7221                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7223  0047 7214525c      	bset	21084,#2
7225  004b 202a          	jra	L3562
7226  004d               L7462:
7227                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7229  004d 7215525c      	bres	21084,#2
7230  0051 2024          	jra	L3562
7231  0053               L5462:
7232                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7234  0053 7b01          	ld	a,(OFST+1,sp)
7235  0055 a101          	cp	a,#1
7236  0057 2610          	jrne	L5562
7237                     ; 1668     if (NewState != DISABLE)
7239  0059 0d02          	tnz	(OFST+2,sp)
7240  005b 2706          	jreq	L7562
7241                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7243  005d 721c525c      	bset	21084,#6
7245  0061 2014          	jra	L3562
7246  0063               L7562:
7247                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7249  0063 721d525c      	bres	21084,#6
7250  0067 200e          	jra	L3562
7251  0069               L5562:
7252                     ; 1680     if (NewState != DISABLE)
7254  0069 0d02          	tnz	(OFST+2,sp)
7255  006b 2706          	jreq	L5662
7256                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7258  006d 7214525d      	bset	21085,#2
7260  0071 2004          	jra	L3562
7261  0073               L5662:
7262                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7264  0073 7215525d      	bres	21085,#2
7265  0077               L3562:
7266                     ; 1689 }
7269  0077 85            	popw	x
7270  0078 81            	ret
7316                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7316                     ; 1713 {
7317                     .text:	section	.text,new
7318  0000               _TIM1_SelectOCxM:
7320  0000 89            	pushw	x
7321       00000000      OFST:	set	0
7324                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7326  0001 9e            	ld	a,xh
7327  0002 4d            	tnz	a
7328  0003 270f          	jreq	L0221
7329  0005 9e            	ld	a,xh
7330  0006 a101          	cp	a,#1
7331  0008 270a          	jreq	L0221
7332  000a 9e            	ld	a,xh
7333  000b a102          	cp	a,#2
7334  000d 2705          	jreq	L0221
7335  000f 9e            	ld	a,xh
7336  0010 a103          	cp	a,#3
7337  0012 2603          	jrne	L6121
7338  0014               L0221:
7339  0014 4f            	clr	a
7340  0015 2010          	jra	L2221
7341  0017               L6121:
7342  0017 ae06b3        	ldw	x,#1715
7343  001a 89            	pushw	x
7344  001b ae0000        	ldw	x,#0
7345  001e 89            	pushw	x
7346  001f ae0000        	ldw	x,#L37
7347  0022 cd0000        	call	_assert_failed
7349  0025 5b04          	addw	sp,#4
7350  0027               L2221:
7351                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7353  0027 0d02          	tnz	(OFST+2,sp)
7354  0029 272a          	jreq	L6221
7355  002b 7b02          	ld	a,(OFST+2,sp)
7356  002d a110          	cp	a,#16
7357  002f 2724          	jreq	L6221
7358  0031 7b02          	ld	a,(OFST+2,sp)
7359  0033 a120          	cp	a,#32
7360  0035 271e          	jreq	L6221
7361  0037 7b02          	ld	a,(OFST+2,sp)
7362  0039 a130          	cp	a,#48
7363  003b 2718          	jreq	L6221
7364  003d 7b02          	ld	a,(OFST+2,sp)
7365  003f a160          	cp	a,#96
7366  0041 2712          	jreq	L6221
7367  0043 7b02          	ld	a,(OFST+2,sp)
7368  0045 a170          	cp	a,#112
7369  0047 270c          	jreq	L6221
7370  0049 7b02          	ld	a,(OFST+2,sp)
7371  004b a150          	cp	a,#80
7372  004d 2706          	jreq	L6221
7373  004f 7b02          	ld	a,(OFST+2,sp)
7374  0051 a140          	cp	a,#64
7375  0053 2603          	jrne	L4221
7376  0055               L6221:
7377  0055 4f            	clr	a
7378  0056 2010          	jra	L0321
7379  0058               L4221:
7380  0058 ae06b4        	ldw	x,#1716
7381  005b 89            	pushw	x
7382  005c ae0000        	ldw	x,#0
7383  005f 89            	pushw	x
7384  0060 ae0000        	ldw	x,#L37
7385  0063 cd0000        	call	_assert_failed
7387  0066 5b04          	addw	sp,#4
7388  0068               L0321:
7389                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7391  0068 0d01          	tnz	(OFST+1,sp)
7392  006a 2610          	jrne	L3172
7393                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7395  006c 7211525c      	bres	21084,#0
7396                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7396                     ; 1725                             | (uint8_t)TIM1_OCMode);
7398  0070 c65258        	ld	a,21080
7399  0073 a48f          	and	a,#143
7400  0075 1a02          	or	a,(OFST+2,sp)
7401  0077 c75258        	ld	21080,a
7403  007a 203a          	jra	L5172
7404  007c               L3172:
7405                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7407  007c 7b01          	ld	a,(OFST+1,sp)
7408  007e a101          	cp	a,#1
7409  0080 2610          	jrne	L7172
7410                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7412  0082 7219525c      	bres	21084,#4
7413                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7413                     ; 1734                             | (uint8_t)TIM1_OCMode);
7415  0086 c65259        	ld	a,21081
7416  0089 a48f          	and	a,#143
7417  008b 1a02          	or	a,(OFST+2,sp)
7418  008d c75259        	ld	21081,a
7420  0090 2024          	jra	L5172
7421  0092               L7172:
7422                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7424  0092 7b01          	ld	a,(OFST+1,sp)
7425  0094 a102          	cp	a,#2
7426  0096 2610          	jrne	L3272
7427                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7429  0098 7211525d      	bres	21085,#0
7430                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7430                     ; 1743                             | (uint8_t)TIM1_OCMode);
7432  009c c6525a        	ld	a,21082
7433  009f a48f          	and	a,#143
7434  00a1 1a02          	or	a,(OFST+2,sp)
7435  00a3 c7525a        	ld	21082,a
7437  00a6 200e          	jra	L5172
7438  00a8               L3272:
7439                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7441  00a8 7219525d      	bres	21085,#4
7442                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7442                     ; 1752                             | (uint8_t)TIM1_OCMode);
7444  00ac c6525b        	ld	a,21083
7445  00af a48f          	and	a,#143
7446  00b1 1a02          	or	a,(OFST+2,sp)
7447  00b3 c7525b        	ld	21083,a
7448  00b6               L5172:
7449                     ; 1754 }
7452  00b6 85            	popw	x
7453  00b7 81            	ret
7485                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7485                     ; 1763 {
7486                     .text:	section	.text,new
7487  0000               _TIM1_SetCounter:
7491                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7493  0000 9e            	ld	a,xh
7494  0001 c7525e        	ld	21086,a
7495                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7497  0004 9f            	ld	a,xl
7498  0005 c7525f        	ld	21087,a
7499                     ; 1767 }
7502  0008 81            	ret
7534                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7534                     ; 1776 {
7535                     .text:	section	.text,new
7536  0000               _TIM1_SetAutoreload:
7540                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7542  0000 9e            	ld	a,xh
7543  0001 c75262        	ld	21090,a
7544                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7546  0004 9f            	ld	a,xl
7547  0005 c75263        	ld	21091,a
7548                     ; 1780  }
7551  0008 81            	ret
7583                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7583                     ; 1789 {
7584                     .text:	section	.text,new
7585  0000               _TIM1_SetCompare1:
7589                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7591  0000 9e            	ld	a,xh
7592  0001 c75265        	ld	21093,a
7593                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7595  0004 9f            	ld	a,xl
7596  0005 c75266        	ld	21094,a
7597                     ; 1793 }
7600  0008 81            	ret
7632                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7632                     ; 1802 {
7633                     .text:	section	.text,new
7634  0000               _TIM1_SetCompare2:
7638                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7640  0000 9e            	ld	a,xh
7641  0001 c75267        	ld	21095,a
7642                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7644  0004 9f            	ld	a,xl
7645  0005 c75268        	ld	21096,a
7646                     ; 1806 }
7649  0008 81            	ret
7681                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7681                     ; 1815 {
7682                     .text:	section	.text,new
7683  0000               _TIM1_SetCompare3:
7687                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7689  0000 9e            	ld	a,xh
7690  0001 c75269        	ld	21097,a
7691                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7693  0004 9f            	ld	a,xl
7694  0005 c7526a        	ld	21098,a
7695                     ; 1819 }
7698  0008 81            	ret
7730                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7730                     ; 1828 {
7731                     .text:	section	.text,new
7732  0000               _TIM1_SetCompare4:
7736                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7738  0000 9e            	ld	a,xh
7739  0001 c7526b        	ld	21099,a
7740                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7742  0004 9f            	ld	a,xl
7743  0005 c7526c        	ld	21100,a
7744                     ; 1832 }
7747  0008 81            	ret
7784                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7784                     ; 1845 {
7785                     .text:	section	.text,new
7786  0000               _TIM1_SetIC1Prescaler:
7788  0000 88            	push	a
7789       00000000      OFST:	set	0
7792                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7794  0001 4d            	tnz	a
7795  0002 270c          	jreq	L2521
7796  0004 a104          	cp	a,#4
7797  0006 2708          	jreq	L2521
7798  0008 a108          	cp	a,#8
7799  000a 2704          	jreq	L2521
7800  000c a10c          	cp	a,#12
7801  000e 2603          	jrne	L0521
7802  0010               L2521:
7803  0010 4f            	clr	a
7804  0011 2010          	jra	L4521
7805  0013               L0521:
7806  0013 ae0737        	ldw	x,#1847
7807  0016 89            	pushw	x
7808  0017 ae0000        	ldw	x,#0
7809  001a 89            	pushw	x
7810  001b ae0000        	ldw	x,#L37
7811  001e cd0000        	call	_assert_failed
7813  0021 5b04          	addw	sp,#4
7814  0023               L4521:
7815                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7815                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7817  0023 c65258        	ld	a,21080
7818  0026 a4f3          	and	a,#243
7819  0028 1a01          	or	a,(OFST+1,sp)
7820  002a c75258        	ld	21080,a
7821                     ; 1852 }
7824  002d 84            	pop	a
7825  002e 81            	ret
7862                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7862                     ; 1865 {
7863                     .text:	section	.text,new
7864  0000               _TIM1_SetIC2Prescaler:
7866  0000 88            	push	a
7867       00000000      OFST:	set	0
7870                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7872  0001 4d            	tnz	a
7873  0002 270c          	jreq	L2621
7874  0004 a104          	cp	a,#4
7875  0006 2708          	jreq	L2621
7876  0008 a108          	cp	a,#8
7877  000a 2704          	jreq	L2621
7878  000c a10c          	cp	a,#12
7879  000e 2603          	jrne	L0621
7880  0010               L2621:
7881  0010 4f            	clr	a
7882  0011 2010          	jra	L4621
7883  0013               L0621:
7884  0013 ae074c        	ldw	x,#1868
7885  0016 89            	pushw	x
7886  0017 ae0000        	ldw	x,#0
7887  001a 89            	pushw	x
7888  001b ae0000        	ldw	x,#L37
7889  001e cd0000        	call	_assert_failed
7891  0021 5b04          	addw	sp,#4
7892  0023               L4621:
7893                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7893                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7895  0023 c65259        	ld	a,21081
7896  0026 a4f3          	and	a,#243
7897  0028 1a01          	or	a,(OFST+1,sp)
7898  002a c75259        	ld	21081,a
7899                     ; 1873 }
7902  002d 84            	pop	a
7903  002e 81            	ret
7940                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7940                     ; 1886 {
7941                     .text:	section	.text,new
7942  0000               _TIM1_SetIC3Prescaler:
7944  0000 88            	push	a
7945       00000000      OFST:	set	0
7948                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7950  0001 4d            	tnz	a
7951  0002 270c          	jreq	L2721
7952  0004 a104          	cp	a,#4
7953  0006 2708          	jreq	L2721
7954  0008 a108          	cp	a,#8
7955  000a 2704          	jreq	L2721
7956  000c a10c          	cp	a,#12
7957  000e 2603          	jrne	L0721
7958  0010               L2721:
7959  0010 4f            	clr	a
7960  0011 2010          	jra	L4721
7961  0013               L0721:
7962  0013 ae0761        	ldw	x,#1889
7963  0016 89            	pushw	x
7964  0017 ae0000        	ldw	x,#0
7965  001a 89            	pushw	x
7966  001b ae0000        	ldw	x,#L37
7967  001e cd0000        	call	_assert_failed
7969  0021 5b04          	addw	sp,#4
7970  0023               L4721:
7971                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
7971                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
7973  0023 c6525a        	ld	a,21082
7974  0026 a4f3          	and	a,#243
7975  0028 1a01          	or	a,(OFST+1,sp)
7976  002a c7525a        	ld	21082,a
7977                     ; 1894 }
7980  002d 84            	pop	a
7981  002e 81            	ret
8018                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8018                     ; 1907 {
8019                     .text:	section	.text,new
8020  0000               _TIM1_SetIC4Prescaler:
8022  0000 88            	push	a
8023       00000000      OFST:	set	0
8026                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8028  0001 4d            	tnz	a
8029  0002 270c          	jreq	L2031
8030  0004 a104          	cp	a,#4
8031  0006 2708          	jreq	L2031
8032  0008 a108          	cp	a,#8
8033  000a 2704          	jreq	L2031
8034  000c a10c          	cp	a,#12
8035  000e 2603          	jrne	L0031
8036  0010               L2031:
8037  0010 4f            	clr	a
8038  0011 2010          	jra	L4031
8039  0013               L0031:
8040  0013 ae0776        	ldw	x,#1910
8041  0016 89            	pushw	x
8042  0017 ae0000        	ldw	x,#0
8043  001a 89            	pushw	x
8044  001b ae0000        	ldw	x,#L37
8045  001e cd0000        	call	_assert_failed
8047  0021 5b04          	addw	sp,#4
8048  0023               L4031:
8049                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8049                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8051  0023 c6525b        	ld	a,21083
8052  0026 a4f3          	and	a,#243
8053  0028 1a01          	or	a,(OFST+1,sp)
8054  002a c7525b        	ld	21083,a
8055                     ; 1915 }
8058  002d 84            	pop	a
8059  002e 81            	ret
8105                     ; 1922 uint16_t TIM1_GetCapture1(void)
8105                     ; 1923 {
8106                     .text:	section	.text,new
8107  0000               _TIM1_GetCapture1:
8109  0000 5204          	subw	sp,#4
8110       00000004      OFST:	set	4
8113                     ; 1926   uint16_t tmpccr1 = 0;
8115  0002 1e03          	ldw	x,(OFST-1,sp)
8116                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8118  0004 7b01          	ld	a,(OFST-3,sp)
8119  0006 97            	ld	xl,a
8122  0007 7b02          	ld	a,(OFST-2,sp)
8123  0009 97            	ld	xl,a
8124                     ; 1929   tmpccr1h = TIM1->CCR1H;
8126  000a c65265        	ld	a,21093
8127  000d 6b02          	ld	(OFST-2,sp),a
8128                     ; 1930   tmpccr1l = TIM1->CCR1L;
8130  000f c65266        	ld	a,21094
8131  0012 6b01          	ld	(OFST-3,sp),a
8132                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8134  0014 7b01          	ld	a,(OFST-3,sp)
8135  0016 5f            	clrw	x
8136  0017 97            	ld	xl,a
8137  0018 1f03          	ldw	(OFST-1,sp),x
8138                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8140  001a 7b02          	ld	a,(OFST-2,sp)
8141  001c 5f            	clrw	x
8142  001d 97            	ld	xl,a
8143  001e 4f            	clr	a
8144  001f 02            	rlwa	x,a
8145  0020 01            	rrwa	x,a
8146  0021 1a04          	or	a,(OFST+0,sp)
8147  0023 01            	rrwa	x,a
8148  0024 1a03          	or	a,(OFST-1,sp)
8149  0026 01            	rrwa	x,a
8150  0027 1f03          	ldw	(OFST-1,sp),x
8151                     ; 1935   return (uint16_t)tmpccr1;
8153  0029 1e03          	ldw	x,(OFST-1,sp)
8156  002b 5b04          	addw	sp,#4
8157  002d 81            	ret
8203                     ; 1943 uint16_t TIM1_GetCapture2(void)
8203                     ; 1944 {
8204                     .text:	section	.text,new
8205  0000               _TIM1_GetCapture2:
8207  0000 5204          	subw	sp,#4
8208       00000004      OFST:	set	4
8211                     ; 1947   uint16_t tmpccr2 = 0;
8213  0002 1e03          	ldw	x,(OFST-1,sp)
8214                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8216  0004 7b01          	ld	a,(OFST-3,sp)
8217  0006 97            	ld	xl,a
8220  0007 7b02          	ld	a,(OFST-2,sp)
8221  0009 97            	ld	xl,a
8222                     ; 1950   tmpccr2h = TIM1->CCR2H;
8224  000a c65267        	ld	a,21095
8225  000d 6b02          	ld	(OFST-2,sp),a
8226                     ; 1951   tmpccr2l = TIM1->CCR2L;
8228  000f c65268        	ld	a,21096
8229  0012 6b01          	ld	(OFST-3,sp),a
8230                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8232  0014 7b01          	ld	a,(OFST-3,sp)
8233  0016 5f            	clrw	x
8234  0017 97            	ld	xl,a
8235  0018 1f03          	ldw	(OFST-1,sp),x
8236                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8238  001a 7b02          	ld	a,(OFST-2,sp)
8239  001c 5f            	clrw	x
8240  001d 97            	ld	xl,a
8241  001e 4f            	clr	a
8242  001f 02            	rlwa	x,a
8243  0020 01            	rrwa	x,a
8244  0021 1a04          	or	a,(OFST+0,sp)
8245  0023 01            	rrwa	x,a
8246  0024 1a03          	or	a,(OFST-1,sp)
8247  0026 01            	rrwa	x,a
8248  0027 1f03          	ldw	(OFST-1,sp),x
8249                     ; 1956   return (uint16_t)tmpccr2;
8251  0029 1e03          	ldw	x,(OFST-1,sp)
8254  002b 5b04          	addw	sp,#4
8255  002d 81            	ret
8301                     ; 1964 uint16_t TIM1_GetCapture3(void)
8301                     ; 1965 {
8302                     .text:	section	.text,new
8303  0000               _TIM1_GetCapture3:
8305  0000 5204          	subw	sp,#4
8306       00000004      OFST:	set	4
8309                     ; 1967   uint16_t tmpccr3 = 0;
8311  0002 1e03          	ldw	x,(OFST-1,sp)
8312                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8314  0004 7b01          	ld	a,(OFST-3,sp)
8315  0006 97            	ld	xl,a
8318  0007 7b02          	ld	a,(OFST-2,sp)
8319  0009 97            	ld	xl,a
8320                     ; 1970   tmpccr3h = TIM1->CCR3H;
8322  000a c65269        	ld	a,21097
8323  000d 6b02          	ld	(OFST-2,sp),a
8324                     ; 1971   tmpccr3l = TIM1->CCR3L;
8326  000f c6526a        	ld	a,21098
8327  0012 6b01          	ld	(OFST-3,sp),a
8328                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8330  0014 7b01          	ld	a,(OFST-3,sp)
8331  0016 5f            	clrw	x
8332  0017 97            	ld	xl,a
8333  0018 1f03          	ldw	(OFST-1,sp),x
8334                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8336  001a 7b02          	ld	a,(OFST-2,sp)
8337  001c 5f            	clrw	x
8338  001d 97            	ld	xl,a
8339  001e 4f            	clr	a
8340  001f 02            	rlwa	x,a
8341  0020 01            	rrwa	x,a
8342  0021 1a04          	or	a,(OFST+0,sp)
8343  0023 01            	rrwa	x,a
8344  0024 1a03          	or	a,(OFST-1,sp)
8345  0026 01            	rrwa	x,a
8346  0027 1f03          	ldw	(OFST-1,sp),x
8347                     ; 1976   return (uint16_t)tmpccr3;
8349  0029 1e03          	ldw	x,(OFST-1,sp)
8352  002b 5b04          	addw	sp,#4
8353  002d 81            	ret
8399                     ; 1984 uint16_t TIM1_GetCapture4(void)
8399                     ; 1985 {
8400                     .text:	section	.text,new
8401  0000               _TIM1_GetCapture4:
8403  0000 5204          	subw	sp,#4
8404       00000004      OFST:	set	4
8407                     ; 1987   uint16_t tmpccr4 = 0;
8409  0002 1e03          	ldw	x,(OFST-1,sp)
8410                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8412  0004 7b01          	ld	a,(OFST-3,sp)
8413  0006 97            	ld	xl,a
8416  0007 7b02          	ld	a,(OFST-2,sp)
8417  0009 97            	ld	xl,a
8418                     ; 1990   tmpccr4h = TIM1->CCR4H;
8420  000a c6526b        	ld	a,21099
8421  000d 6b02          	ld	(OFST-2,sp),a
8422                     ; 1991   tmpccr4l = TIM1->CCR4L;
8424  000f c6526c        	ld	a,21100
8425  0012 6b01          	ld	(OFST-3,sp),a
8426                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8428  0014 7b01          	ld	a,(OFST-3,sp)
8429  0016 5f            	clrw	x
8430  0017 97            	ld	xl,a
8431  0018 1f03          	ldw	(OFST-1,sp),x
8432                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8434  001a 7b02          	ld	a,(OFST-2,sp)
8435  001c 5f            	clrw	x
8436  001d 97            	ld	xl,a
8437  001e 4f            	clr	a
8438  001f 02            	rlwa	x,a
8439  0020 01            	rrwa	x,a
8440  0021 1a04          	or	a,(OFST+0,sp)
8441  0023 01            	rrwa	x,a
8442  0024 1a03          	or	a,(OFST-1,sp)
8443  0026 01            	rrwa	x,a
8444  0027 1f03          	ldw	(OFST-1,sp),x
8445                     ; 1996   return (uint16_t)tmpccr4;
8447  0029 1e03          	ldw	x,(OFST-1,sp)
8450  002b 5b04          	addw	sp,#4
8451  002d 81            	ret
8483                     ; 2004 uint16_t TIM1_GetCounter(void)
8483                     ; 2005 {
8484                     .text:	section	.text,new
8485  0000               _TIM1_GetCounter:
8487  0000 89            	pushw	x
8488       00000002      OFST:	set	2
8491                     ; 2006   uint16_t tmpcntr = 0;
8493  0001 5f            	clrw	x
8494  0002 1f01          	ldw	(OFST-1,sp),x
8495                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8497  0004 c6525e        	ld	a,21086
8498  0007 5f            	clrw	x
8499  0008 97            	ld	xl,a
8500  0009 4f            	clr	a
8501  000a 02            	rlwa	x,a
8502  000b 1f01          	ldw	(OFST-1,sp),x
8503                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8505  000d c6525f        	ld	a,21087
8506  0010 5f            	clrw	x
8507  0011 97            	ld	xl,a
8508  0012 01            	rrwa	x,a
8509  0013 1a02          	or	a,(OFST+0,sp)
8510  0015 01            	rrwa	x,a
8511  0016 1a01          	or	a,(OFST-1,sp)
8512  0018 01            	rrwa	x,a
8515  0019 5b02          	addw	sp,#2
8516  001b 81            	ret
8548                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8548                     ; 2020 {
8549                     .text:	section	.text,new
8550  0000               _TIM1_GetPrescaler:
8552  0000 89            	pushw	x
8553       00000002      OFST:	set	2
8556                     ; 2021   uint16_t temp = 0;
8558  0001 5f            	clrw	x
8559  0002 1f01          	ldw	(OFST-1,sp),x
8560                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8562  0004 c65260        	ld	a,21088
8563  0007 5f            	clrw	x
8564  0008 97            	ld	xl,a
8565  0009 4f            	clr	a
8566  000a 02            	rlwa	x,a
8567  000b 1f01          	ldw	(OFST-1,sp),x
8568                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8570  000d c65261        	ld	a,21089
8571  0010 5f            	clrw	x
8572  0011 97            	ld	xl,a
8573  0012 01            	rrwa	x,a
8574  0013 1a02          	or	a,(OFST+0,sp)
8575  0015 01            	rrwa	x,a
8576  0016 1a01          	or	a,(OFST-1,sp)
8577  0018 01            	rrwa	x,a
8580  0019 5b02          	addw	sp,#2
8581  001b 81            	ret
8752                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8752                     ; 2048 {
8753                     .text:	section	.text,new
8754  0000               _TIM1_GetFlagStatus:
8756  0000 89            	pushw	x
8757  0001 89            	pushw	x
8758       00000002      OFST:	set	2
8761                     ; 2049   FlagStatus bitstatus = RESET;
8763  0002 7b02          	ld	a,(OFST+0,sp)
8764  0004 97            	ld	xl,a
8765                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8767  0005 7b01          	ld	a,(OFST-1,sp)
8768  0007 97            	ld	xl,a
8771  0008 7b02          	ld	a,(OFST+0,sp)
8772  000a 97            	ld	xl,a
8773                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8775  000b 1e03          	ldw	x,(OFST+1,sp)
8776  000d a30001        	cpw	x,#1
8777  0010 274d          	jreq	L6231
8778  0012 1e03          	ldw	x,(OFST+1,sp)
8779  0014 a30002        	cpw	x,#2
8780  0017 2746          	jreq	L6231
8781  0019 1e03          	ldw	x,(OFST+1,sp)
8782  001b a30004        	cpw	x,#4
8783  001e 273f          	jreq	L6231
8784  0020 1e03          	ldw	x,(OFST+1,sp)
8785  0022 a30008        	cpw	x,#8
8786  0025 2738          	jreq	L6231
8787  0027 1e03          	ldw	x,(OFST+1,sp)
8788  0029 a30010        	cpw	x,#16
8789  002c 2731          	jreq	L6231
8790  002e 1e03          	ldw	x,(OFST+1,sp)
8791  0030 a30020        	cpw	x,#32
8792  0033 272a          	jreq	L6231
8793  0035 1e03          	ldw	x,(OFST+1,sp)
8794  0037 a30040        	cpw	x,#64
8795  003a 2723          	jreq	L6231
8796  003c 1e03          	ldw	x,(OFST+1,sp)
8797  003e a30080        	cpw	x,#128
8798  0041 271c          	jreq	L6231
8799  0043 1e03          	ldw	x,(OFST+1,sp)
8800  0045 a30200        	cpw	x,#512
8801  0048 2715          	jreq	L6231
8802  004a 1e03          	ldw	x,(OFST+1,sp)
8803  004c a30400        	cpw	x,#1024
8804  004f 270e          	jreq	L6231
8805  0051 1e03          	ldw	x,(OFST+1,sp)
8806  0053 a30800        	cpw	x,#2048
8807  0056 2707          	jreq	L6231
8808  0058 1e03          	ldw	x,(OFST+1,sp)
8809  005a a31000        	cpw	x,#4096
8810  005d 2603          	jrne	L4231
8811  005f               L6231:
8812  005f 4f            	clr	a
8813  0060 2010          	jra	L0331
8814  0062               L4231:
8815  0062 ae0805        	ldw	x,#2053
8816  0065 89            	pushw	x
8817  0066 ae0000        	ldw	x,#0
8818  0069 89            	pushw	x
8819  006a ae0000        	ldw	x,#L37
8820  006d cd0000        	call	_assert_failed
8822  0070 5b04          	addw	sp,#4
8823  0072               L0331:
8824                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8826  0072 c65255        	ld	a,21077
8827  0075 1404          	and	a,(OFST+2,sp)
8828  0077 6b01          	ld	(OFST-1,sp),a
8829                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8831  0079 7b03          	ld	a,(OFST+1,sp)
8832  007b 6b02          	ld	(OFST+0,sp),a
8833                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8835  007d c65256        	ld	a,21078
8836  0080 1402          	and	a,(OFST+0,sp)
8837  0082 1a01          	or	a,(OFST-1,sp)
8838  0084 2706          	jreq	L1533
8839                     ; 2060     bitstatus = SET;
8841  0086 a601          	ld	a,#1
8842  0088 6b02          	ld	(OFST+0,sp),a
8844  008a 2002          	jra	L3533
8845  008c               L1533:
8846                     ; 2064     bitstatus = RESET;
8848  008c 0f02          	clr	(OFST+0,sp)
8849  008e               L3533:
8850                     ; 2066   return (FlagStatus)(bitstatus);
8852  008e 7b02          	ld	a,(OFST+0,sp)
8855  0090 5b04          	addw	sp,#4
8856  0092 81            	ret
8892                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8892                     ; 2088 {
8893                     .text:	section	.text,new
8894  0000               _TIM1_ClearFlag:
8896  0000 89            	pushw	x
8897       00000000      OFST:	set	0
8900                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8902  0001 01            	rrwa	x,a
8903  0002 9f            	ld	a,xl
8904  0003 a4e1          	and	a,#225
8905  0005 97            	ld	xl,a
8906  0006 4f            	clr	a
8907  0007 02            	rlwa	x,a
8908  0008 5d            	tnzw	x
8909  0009 2607          	jrne	L4331
8910  000b 1e01          	ldw	x,(OFST+1,sp)
8911  000d 2703          	jreq	L4331
8912  000f 4f            	clr	a
8913  0010 2010          	jra	L6331
8914  0012               L4331:
8915  0012 ae082a        	ldw	x,#2090
8916  0015 89            	pushw	x
8917  0016 ae0000        	ldw	x,#0
8918  0019 89            	pushw	x
8919  001a ae0000        	ldw	x,#L37
8920  001d cd0000        	call	_assert_failed
8922  0020 5b04          	addw	sp,#4
8923  0022               L6331:
8924                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8926  0022 7b02          	ld	a,(OFST+2,sp)
8927  0024 43            	cpl	a
8928  0025 c75255        	ld	21077,a
8929                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8929                     ; 2095                         (uint8_t)0x1E);
8931  0028 7b01          	ld	a,(OFST+1,sp)
8932  002a 43            	cpl	a
8933  002b a41e          	and	a,#30
8934  002d c75256        	ld	21078,a
8935                     ; 2096 }
8938  0030 85            	popw	x
8939  0031 81            	ret
9000                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9000                     ; 2113 {
9001                     .text:	section	.text,new
9002  0000               _TIM1_GetITStatus:
9004  0000 88            	push	a
9005  0001 89            	pushw	x
9006       00000002      OFST:	set	2
9009                     ; 2114   ITStatus bitstatus = RESET;
9011  0002 7b02          	ld	a,(OFST+0,sp)
9012  0004 97            	ld	xl,a
9013                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9015  0005 7b01          	ld	a,(OFST-1,sp)
9016  0007 97            	ld	xl,a
9019  0008 7b02          	ld	a,(OFST+0,sp)
9020  000a 97            	ld	xl,a
9021                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9023  000b 7b03          	ld	a,(OFST+1,sp)
9024  000d a101          	cp	a,#1
9025  000f 272a          	jreq	L4431
9026  0011 7b03          	ld	a,(OFST+1,sp)
9027  0013 a102          	cp	a,#2
9028  0015 2724          	jreq	L4431
9029  0017 7b03          	ld	a,(OFST+1,sp)
9030  0019 a104          	cp	a,#4
9031  001b 271e          	jreq	L4431
9032  001d 7b03          	ld	a,(OFST+1,sp)
9033  001f a108          	cp	a,#8
9034  0021 2718          	jreq	L4431
9035  0023 7b03          	ld	a,(OFST+1,sp)
9036  0025 a110          	cp	a,#16
9037  0027 2712          	jreq	L4431
9038  0029 7b03          	ld	a,(OFST+1,sp)
9039  002b a120          	cp	a,#32
9040  002d 270c          	jreq	L4431
9041  002f 7b03          	ld	a,(OFST+1,sp)
9042  0031 a140          	cp	a,#64
9043  0033 2706          	jreq	L4431
9044  0035 7b03          	ld	a,(OFST+1,sp)
9045  0037 a180          	cp	a,#128
9046  0039 2603          	jrne	L2431
9047  003b               L4431:
9048  003b 4f            	clr	a
9049  003c 2010          	jra	L6431
9050  003e               L2431:
9051  003e ae0846        	ldw	x,#2118
9052  0041 89            	pushw	x
9053  0042 ae0000        	ldw	x,#0
9054  0045 89            	pushw	x
9055  0046 ae0000        	ldw	x,#L37
9056  0049 cd0000        	call	_assert_failed
9058  004c 5b04          	addw	sp,#4
9059  004e               L6431:
9060                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9062  004e c65255        	ld	a,21077
9063  0051 1403          	and	a,(OFST+1,sp)
9064  0053 6b01          	ld	(OFST-1,sp),a
9065                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9067  0055 c65254        	ld	a,21076
9068  0058 1403          	and	a,(OFST+1,sp)
9069  005a 6b02          	ld	(OFST+0,sp),a
9070                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9072  005c 0d01          	tnz	(OFST-1,sp)
9073  005e 270a          	jreq	L1243
9075  0060 0d02          	tnz	(OFST+0,sp)
9076  0062 2706          	jreq	L1243
9077                     ; 2126     bitstatus = SET;
9079  0064 a601          	ld	a,#1
9080  0066 6b02          	ld	(OFST+0,sp),a
9082  0068 2002          	jra	L3243
9083  006a               L1243:
9084                     ; 2130     bitstatus = RESET;
9086  006a 0f02          	clr	(OFST+0,sp)
9087  006c               L3243:
9088                     ; 2132   return (ITStatus)(bitstatus);
9090  006c 7b02          	ld	a,(OFST+0,sp)
9093  006e 5b03          	addw	sp,#3
9094  0070 81            	ret
9131                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9131                     ; 2150 {
9132                     .text:	section	.text,new
9133  0000               _TIM1_ClearITPendingBit:
9135  0000 88            	push	a
9136       00000000      OFST:	set	0
9139                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9141  0001 4d            	tnz	a
9142  0002 2703          	jreq	L2531
9143  0004 4f            	clr	a
9144  0005 2010          	jra	L4531
9145  0007               L2531:
9146  0007 ae0868        	ldw	x,#2152
9147  000a 89            	pushw	x
9148  000b ae0000        	ldw	x,#0
9149  000e 89            	pushw	x
9150  000f ae0000        	ldw	x,#L37
9151  0012 cd0000        	call	_assert_failed
9153  0015 5b04          	addw	sp,#4
9154  0017               L4531:
9155                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9157  0017 7b01          	ld	a,(OFST+1,sp)
9158  0019 43            	cpl	a
9159  001a c75255        	ld	21077,a
9160                     ; 2156 }
9163  001d 84            	pop	a
9164  001e 81            	ret
9210                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9210                     ; 2175                        uint8_t TIM1_ICSelection,
9210                     ; 2176                        uint8_t TIM1_ICFilter)
9210                     ; 2177 {
9211                     .text:	section	.text,new
9212  0000               L3_TI1_Config:
9214  0000 89            	pushw	x
9215  0001 88            	push	a
9216       00000001      OFST:	set	1
9219                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9221  0002 7211525c      	bres	21084,#0
9222                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9222                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9224  0006 7b06          	ld	a,(OFST+5,sp)
9225  0008 97            	ld	xl,a
9226  0009 a610          	ld	a,#16
9227  000b 42            	mul	x,a
9228  000c 9f            	ld	a,xl
9229  000d 1a03          	or	a,(OFST+2,sp)
9230  000f 6b01          	ld	(OFST+0,sp),a
9231  0011 c65258        	ld	a,21080
9232  0014 a40c          	and	a,#12
9233  0016 1a01          	or	a,(OFST+0,sp)
9234  0018 c75258        	ld	21080,a
9235                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9237  001b 0d02          	tnz	(OFST+1,sp)
9238  001d 2706          	jreq	L3643
9239                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9241  001f 7212525c      	bset	21084,#1
9243  0023 2004          	jra	L5643
9244  0025               L3643:
9245                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9247  0025 7213525c      	bres	21084,#1
9248  0029               L5643:
9249                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9251  0029 7210525c      	bset	21084,#0
9252                     ; 2197 }
9255  002d 5b03          	addw	sp,#3
9256  002f 81            	ret
9302                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9302                     ; 2216                        uint8_t TIM1_ICSelection,
9302                     ; 2217                        uint8_t TIM1_ICFilter)
9302                     ; 2218 {
9303                     .text:	section	.text,new
9304  0000               L5_TI2_Config:
9306  0000 89            	pushw	x
9307  0001 88            	push	a
9308       00000001      OFST:	set	1
9311                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9313  0002 7219525c      	bres	21084,#4
9314                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9314                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9316  0006 7b06          	ld	a,(OFST+5,sp)
9317  0008 97            	ld	xl,a
9318  0009 a610          	ld	a,#16
9319  000b 42            	mul	x,a
9320  000c 9f            	ld	a,xl
9321  000d 1a03          	or	a,(OFST+2,sp)
9322  000f 6b01          	ld	(OFST+0,sp),a
9323  0011 c65259        	ld	a,21081
9324  0014 a40c          	and	a,#12
9325  0016 1a01          	or	a,(OFST+0,sp)
9326  0018 c75259        	ld	21081,a
9327                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9329  001b 0d02          	tnz	(OFST+1,sp)
9330  001d 2706          	jreq	L7053
9331                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9333  001f 721a525c      	bset	21084,#5
9335  0023 2004          	jra	L1153
9336  0025               L7053:
9337                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9339  0025 721b525c      	bres	21084,#5
9340  0029               L1153:
9341                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9343  0029 7218525c      	bset	21084,#4
9344                     ; 2236 }
9347  002d 5b03          	addw	sp,#3
9348  002f 81            	ret
9394                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9394                     ; 2255                        uint8_t TIM1_ICSelection,
9394                     ; 2256                        uint8_t TIM1_ICFilter)
9394                     ; 2257 {
9395                     .text:	section	.text,new
9396  0000               L7_TI3_Config:
9398  0000 89            	pushw	x
9399  0001 88            	push	a
9400       00000001      OFST:	set	1
9403                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9405  0002 7211525d      	bres	21085,#0
9406                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9406                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9408  0006 7b06          	ld	a,(OFST+5,sp)
9409  0008 97            	ld	xl,a
9410  0009 a610          	ld	a,#16
9411  000b 42            	mul	x,a
9412  000c 9f            	ld	a,xl
9413  000d 1a03          	or	a,(OFST+2,sp)
9414  000f 6b01          	ld	(OFST+0,sp),a
9415  0011 c6525a        	ld	a,21082
9416  0014 a40c          	and	a,#12
9417  0016 1a01          	or	a,(OFST+0,sp)
9418  0018 c7525a        	ld	21082,a
9419                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9421  001b 0d02          	tnz	(OFST+1,sp)
9422  001d 2706          	jreq	L3353
9423                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9425  001f 7212525d      	bset	21085,#1
9427  0023 2004          	jra	L5353
9428  0025               L3353:
9429                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9431  0025 7213525d      	bres	21085,#1
9432  0029               L5353:
9433                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9435  0029 7210525d      	bset	21085,#0
9436                     ; 2276 }
9439  002d 5b03          	addw	sp,#3
9440  002f 81            	ret
9486                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9486                     ; 2295                        uint8_t TIM1_ICSelection,
9486                     ; 2296                        uint8_t TIM1_ICFilter)
9486                     ; 2297 {
9487                     .text:	section	.text,new
9488  0000               L11_TI4_Config:
9490  0000 89            	pushw	x
9491  0001 88            	push	a
9492       00000001      OFST:	set	1
9495                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9497  0002 7219525d      	bres	21085,#4
9498                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9498                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9500  0006 7b06          	ld	a,(OFST+5,sp)
9501  0008 97            	ld	xl,a
9502  0009 a610          	ld	a,#16
9503  000b 42            	mul	x,a
9504  000c 9f            	ld	a,xl
9505  000d 1a03          	or	a,(OFST+2,sp)
9506  000f 6b01          	ld	(OFST+0,sp),a
9507  0011 c6525b        	ld	a,21083
9508  0014 a40c          	and	a,#12
9509  0016 1a01          	or	a,(OFST+0,sp)
9510  0018 c7525b        	ld	21083,a
9511                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9513  001b 0d02          	tnz	(OFST+1,sp)
9514  001d 2706          	jreq	L7553
9515                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9517  001f 721a525d      	bset	21085,#5
9519  0023 2004          	jra	L1653
9520  0025               L7553:
9521                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9523  0025 721b525d      	bres	21085,#5
9524  0029               L1653:
9525                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9527  0029 7218525d      	bset	21085,#4
9528                     ; 2317 }
9531  002d 5b03          	addw	sp,#3
9532  002f 81            	ret
9545                     	xdef	_TIM1_ClearITPendingBit
9546                     	xdef	_TIM1_GetITStatus
9547                     	xdef	_TIM1_ClearFlag
9548                     	xdef	_TIM1_GetFlagStatus
9549                     	xdef	_TIM1_GetPrescaler
9550                     	xdef	_TIM1_GetCounter
9551                     	xdef	_TIM1_GetCapture4
9552                     	xdef	_TIM1_GetCapture3
9553                     	xdef	_TIM1_GetCapture2
9554                     	xdef	_TIM1_GetCapture1
9555                     	xdef	_TIM1_SetIC4Prescaler
9556                     	xdef	_TIM1_SetIC3Prescaler
9557                     	xdef	_TIM1_SetIC2Prescaler
9558                     	xdef	_TIM1_SetIC1Prescaler
9559                     	xdef	_TIM1_SetCompare4
9560                     	xdef	_TIM1_SetCompare3
9561                     	xdef	_TIM1_SetCompare2
9562                     	xdef	_TIM1_SetCompare1
9563                     	xdef	_TIM1_SetAutoreload
9564                     	xdef	_TIM1_SetCounter
9565                     	xdef	_TIM1_SelectOCxM
9566                     	xdef	_TIM1_CCxNCmd
9567                     	xdef	_TIM1_CCxCmd
9568                     	xdef	_TIM1_OC4PolarityConfig
9569                     	xdef	_TIM1_OC3NPolarityConfig
9570                     	xdef	_TIM1_OC3PolarityConfig
9571                     	xdef	_TIM1_OC2NPolarityConfig
9572                     	xdef	_TIM1_OC2PolarityConfig
9573                     	xdef	_TIM1_OC1NPolarityConfig
9574                     	xdef	_TIM1_OC1PolarityConfig
9575                     	xdef	_TIM1_GenerateEvent
9576                     	xdef	_TIM1_OC4FastConfig
9577                     	xdef	_TIM1_OC3FastConfig
9578                     	xdef	_TIM1_OC2FastConfig
9579                     	xdef	_TIM1_OC1FastConfig
9580                     	xdef	_TIM1_OC4PreloadConfig
9581                     	xdef	_TIM1_OC3PreloadConfig
9582                     	xdef	_TIM1_OC2PreloadConfig
9583                     	xdef	_TIM1_OC1PreloadConfig
9584                     	xdef	_TIM1_CCPreloadControl
9585                     	xdef	_TIM1_SelectCOM
9586                     	xdef	_TIM1_ARRPreloadConfig
9587                     	xdef	_TIM1_ForcedOC4Config
9588                     	xdef	_TIM1_ForcedOC3Config
9589                     	xdef	_TIM1_ForcedOC2Config
9590                     	xdef	_TIM1_ForcedOC1Config
9591                     	xdef	_TIM1_CounterModeConfig
9592                     	xdef	_TIM1_PrescalerConfig
9593                     	xdef	_TIM1_EncoderInterfaceConfig
9594                     	xdef	_TIM1_SelectMasterSlaveMode
9595                     	xdef	_TIM1_SelectSlaveMode
9596                     	xdef	_TIM1_SelectOutputTrigger
9597                     	xdef	_TIM1_SelectOnePulseMode
9598                     	xdef	_TIM1_SelectHallSensor
9599                     	xdef	_TIM1_UpdateRequestConfig
9600                     	xdef	_TIM1_UpdateDisableConfig
9601                     	xdef	_TIM1_SelectInputTrigger
9602                     	xdef	_TIM1_TIxExternalClockConfig
9603                     	xdef	_TIM1_ETRConfig
9604                     	xdef	_TIM1_ETRClockMode2Config
9605                     	xdef	_TIM1_ETRClockMode1Config
9606                     	xdef	_TIM1_InternalClockConfig
9607                     	xdef	_TIM1_ITConfig
9608                     	xdef	_TIM1_CtrlPWMOutputs
9609                     	xdef	_TIM1_Cmd
9610                     	xdef	_TIM1_PWMIConfig
9611                     	xdef	_TIM1_ICInit
9612                     	xdef	_TIM1_BDTRConfig
9613                     	xdef	_TIM1_OC4Init
9614                     	xdef	_TIM1_OC3Init
9615                     	xdef	_TIM1_OC2Init
9616                     	xdef	_TIM1_OC1Init
9617                     	xdef	_TIM1_TimeBaseInit
9618                     	xdef	_TIM1_DeInit
9619                     	xref	_assert_failed
9620                     .const:	section	.text
9621  0000               L37:
9622  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
9623  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
9624  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
9625  0036 6d312e6300    	dc.b	"m1.c",0
9645                     	end
