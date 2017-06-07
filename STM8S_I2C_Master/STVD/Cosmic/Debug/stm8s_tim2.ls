   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 52 void TIM2_DeInit(void)
  32                     ; 53 {
  34                     .text:	section	.text,new
  35  0000               _TIM2_DeInit:
  39                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  41  0000 725f5300      	clr	21248
  42                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  44  0004 725f5301      	clr	21249
  45                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  47  0008 725f5303      	clr	21251
  48                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  50  000c 725f5308      	clr	21256
  51                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  53  0010 725f5309      	clr	21257
  54                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  56  0014 725f5308      	clr	21256
  57                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  59  0018 725f5309      	clr	21257
  60                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  62  001c 725f5305      	clr	21253
  63                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  65  0020 725f5306      	clr	21254
  66                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  68  0024 725f5307      	clr	21255
  69                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  71  0028 725f530a      	clr	21258
  72                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  74  002c 725f530b      	clr	21259
  75                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  77  0030 725f530c      	clr	21260
  78                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  80  0034 35ff530d      	mov	21261,#255
  81                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  83  0038 35ff530e      	mov	21262,#255
  84                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  86  003c 725f530f      	clr	21263
  87                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
  89  0040 725f5310      	clr	21264
  90                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
  92  0044 725f5311      	clr	21265
  93                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
  95  0048 725f5312      	clr	21266
  96                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
  98  004c 725f5313      	clr	21267
  99                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 101  0050 725f5314      	clr	21268
 102                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 104  0054 725f5302      	clr	21250
 105                     ; 81 }
 108  0058 81            	ret
 274                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 274                     ; 90                         uint16_t TIM2_Period)
 274                     ; 91 {
 275                     .text:	section	.text,new
 276  0000               _TIM2_TimeBaseInit:
 278  0000 88            	push	a
 279       00000000      OFST:	set	0
 282                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 284  0001 c7530c        	ld	21260,a
 285                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 287  0004 7b04          	ld	a,(OFST+4,sp)
 288  0006 c7530d        	ld	21261,a
 289                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 291  0009 7b05          	ld	a,(OFST+5,sp)
 292  000b c7530e        	ld	21262,a
 293                     ; 97 }
 296  000e 84            	pop	a
 297  000f 81            	ret
 453                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 453                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 453                     ; 110                   uint16_t TIM2_Pulse,
 453                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 453                     ; 112 {
 454                     .text:	section	.text,new
 455  0000               _TIM2_OC1Init:
 457  0000 89            	pushw	x
 458  0001 88            	push	a
 459       00000001      OFST:	set	1
 462                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 464  0002 9e            	ld	a,xh
 465  0003 4d            	tnz	a
 466  0004 2719          	jreq	L41
 467  0006 9e            	ld	a,xh
 468  0007 a110          	cp	a,#16
 469  0009 2714          	jreq	L41
 470  000b 9e            	ld	a,xh
 471  000c a120          	cp	a,#32
 472  000e 270f          	jreq	L41
 473  0010 9e            	ld	a,xh
 474  0011 a130          	cp	a,#48
 475  0013 270a          	jreq	L41
 476  0015 9e            	ld	a,xh
 477  0016 a160          	cp	a,#96
 478  0018 2705          	jreq	L41
 479  001a 9e            	ld	a,xh
 480  001b a170          	cp	a,#112
 481  001d 2603          	jrne	L21
 482  001f               L41:
 483  001f 4f            	clr	a
 484  0020 2010          	jra	L61
 485  0022               L21:
 486  0022 ae0072        	ldw	x,#114
 487  0025 89            	pushw	x
 488  0026 ae0000        	ldw	x,#0
 489  0029 89            	pushw	x
 490  002a ae0000        	ldw	x,#L302
 491  002d cd0000        	call	_assert_failed
 493  0030 5b04          	addw	sp,#4
 494  0032               L61:
 495                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 497  0032 0d03          	tnz	(OFST+2,sp)
 498  0034 2706          	jreq	L22
 499  0036 7b03          	ld	a,(OFST+2,sp)
 500  0038 a111          	cp	a,#17
 501  003a 2603          	jrne	L02
 502  003c               L22:
 503  003c 4f            	clr	a
 504  003d 2010          	jra	L42
 505  003f               L02:
 506  003f ae0073        	ldw	x,#115
 507  0042 89            	pushw	x
 508  0043 ae0000        	ldw	x,#0
 509  0046 89            	pushw	x
 510  0047 ae0000        	ldw	x,#L302
 511  004a cd0000        	call	_assert_failed
 513  004d 5b04          	addw	sp,#4
 514  004f               L42:
 515                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 517  004f 0d08          	tnz	(OFST+7,sp)
 518  0051 2706          	jreq	L03
 519  0053 7b08          	ld	a,(OFST+7,sp)
 520  0055 a122          	cp	a,#34
 521  0057 2603          	jrne	L62
 522  0059               L03:
 523  0059 4f            	clr	a
 524  005a 2010          	jra	L23
 525  005c               L62:
 526  005c ae0074        	ldw	x,#116
 527  005f 89            	pushw	x
 528  0060 ae0000        	ldw	x,#0
 529  0063 89            	pushw	x
 530  0064 ae0000        	ldw	x,#L302
 531  0067 cd0000        	call	_assert_failed
 533  006a 5b04          	addw	sp,#4
 534  006c               L23:
 535                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 537  006c c65308        	ld	a,21256
 538  006f a4fc          	and	a,#252
 539  0071 c75308        	ld	21256,a
 540                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 540                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 542  0074 7b08          	ld	a,(OFST+7,sp)
 543  0076 a402          	and	a,#2
 544  0078 6b01          	ld	(OFST+0,sp),a
 545  007a 7b03          	ld	a,(OFST+2,sp)
 546  007c a401          	and	a,#1
 547  007e 1a01          	or	a,(OFST+0,sp)
 548  0080 ca5308        	or	a,21256
 549  0083 c75308        	ld	21256,a
 550                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 550                     ; 126                           (uint8_t)TIM2_OCMode);
 552  0086 c65305        	ld	a,21253
 553  0089 a48f          	and	a,#143
 554  008b 1a02          	or	a,(OFST+1,sp)
 555  008d c75305        	ld	21253,a
 556                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 558  0090 7b06          	ld	a,(OFST+5,sp)
 559  0092 c7530f        	ld	21263,a
 560                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 562  0095 7b07          	ld	a,(OFST+6,sp)
 563  0097 c75310        	ld	21264,a
 564                     ; 131 }
 567  009a 5b03          	addw	sp,#3
 568  009c 81            	ret
 631                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 631                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 631                     ; 144                   uint16_t TIM2_Pulse,
 631                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 631                     ; 146 {
 632                     .text:	section	.text,new
 633  0000               _TIM2_OC2Init:
 635  0000 89            	pushw	x
 636  0001 88            	push	a
 637       00000001      OFST:	set	1
 640                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 642  0002 9e            	ld	a,xh
 643  0003 4d            	tnz	a
 644  0004 2719          	jreq	L04
 645  0006 9e            	ld	a,xh
 646  0007 a110          	cp	a,#16
 647  0009 2714          	jreq	L04
 648  000b 9e            	ld	a,xh
 649  000c a120          	cp	a,#32
 650  000e 270f          	jreq	L04
 651  0010 9e            	ld	a,xh
 652  0011 a130          	cp	a,#48
 653  0013 270a          	jreq	L04
 654  0015 9e            	ld	a,xh
 655  0016 a160          	cp	a,#96
 656  0018 2705          	jreq	L04
 657  001a 9e            	ld	a,xh
 658  001b a170          	cp	a,#112
 659  001d 2603          	jrne	L63
 660  001f               L04:
 661  001f 4f            	clr	a
 662  0020 2010          	jra	L24
 663  0022               L63:
 664  0022 ae0094        	ldw	x,#148
 665  0025 89            	pushw	x
 666  0026 ae0000        	ldw	x,#0
 667  0029 89            	pushw	x
 668  002a ae0000        	ldw	x,#L302
 669  002d cd0000        	call	_assert_failed
 671  0030 5b04          	addw	sp,#4
 672  0032               L24:
 673                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 675  0032 0d03          	tnz	(OFST+2,sp)
 676  0034 2706          	jreq	L64
 677  0036 7b03          	ld	a,(OFST+2,sp)
 678  0038 a111          	cp	a,#17
 679  003a 2603          	jrne	L44
 680  003c               L64:
 681  003c 4f            	clr	a
 682  003d 2010          	jra	L05
 683  003f               L44:
 684  003f ae0095        	ldw	x,#149
 685  0042 89            	pushw	x
 686  0043 ae0000        	ldw	x,#0
 687  0046 89            	pushw	x
 688  0047 ae0000        	ldw	x,#L302
 689  004a cd0000        	call	_assert_failed
 691  004d 5b04          	addw	sp,#4
 692  004f               L05:
 693                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 695  004f 0d08          	tnz	(OFST+7,sp)
 696  0051 2706          	jreq	L45
 697  0053 7b08          	ld	a,(OFST+7,sp)
 698  0055 a122          	cp	a,#34
 699  0057 2603          	jrne	L25
 700  0059               L45:
 701  0059 4f            	clr	a
 702  005a 2010          	jra	L65
 703  005c               L25:
 704  005c ae0096        	ldw	x,#150
 705  005f 89            	pushw	x
 706  0060 ae0000        	ldw	x,#0
 707  0063 89            	pushw	x
 708  0064 ae0000        	ldw	x,#L302
 709  0067 cd0000        	call	_assert_failed
 711  006a 5b04          	addw	sp,#4
 712  006c               L65:
 713                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 715  006c c65308        	ld	a,21256
 716  006f a4cf          	and	a,#207
 717  0071 c75308        	ld	21256,a
 718                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 718                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 720  0074 7b08          	ld	a,(OFST+7,sp)
 721  0076 a420          	and	a,#32
 722  0078 6b01          	ld	(OFST+0,sp),a
 723  007a 7b03          	ld	a,(OFST+2,sp)
 724  007c a410          	and	a,#16
 725  007e 1a01          	or	a,(OFST+0,sp)
 726  0080 ca5308        	or	a,21256
 727  0083 c75308        	ld	21256,a
 728                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 728                     ; 162                           (uint8_t)TIM2_OCMode);
 730  0086 c65306        	ld	a,21254
 731  0089 a48f          	and	a,#143
 732  008b 1a02          	or	a,(OFST+1,sp)
 733  008d c75306        	ld	21254,a
 734                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 736  0090 7b06          	ld	a,(OFST+5,sp)
 737  0092 c75311        	ld	21265,a
 738                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 740  0095 7b07          	ld	a,(OFST+6,sp)
 741  0097 c75312        	ld	21266,a
 742                     ; 168 }
 745  009a 5b03          	addw	sp,#3
 746  009c 81            	ret
 809                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 809                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 809                     ; 181                   uint16_t TIM2_Pulse,
 809                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 809                     ; 183 {
 810                     .text:	section	.text,new
 811  0000               _TIM2_OC3Init:
 813  0000 89            	pushw	x
 814  0001 88            	push	a
 815       00000001      OFST:	set	1
 818                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 820  0002 9e            	ld	a,xh
 821  0003 4d            	tnz	a
 822  0004 2719          	jreq	L46
 823  0006 9e            	ld	a,xh
 824  0007 a110          	cp	a,#16
 825  0009 2714          	jreq	L46
 826  000b 9e            	ld	a,xh
 827  000c a120          	cp	a,#32
 828  000e 270f          	jreq	L46
 829  0010 9e            	ld	a,xh
 830  0011 a130          	cp	a,#48
 831  0013 270a          	jreq	L46
 832  0015 9e            	ld	a,xh
 833  0016 a160          	cp	a,#96
 834  0018 2705          	jreq	L46
 835  001a 9e            	ld	a,xh
 836  001b a170          	cp	a,#112
 837  001d 2603          	jrne	L26
 838  001f               L46:
 839  001f 4f            	clr	a
 840  0020 2010          	jra	L66
 841  0022               L26:
 842  0022 ae00b9        	ldw	x,#185
 843  0025 89            	pushw	x
 844  0026 ae0000        	ldw	x,#0
 845  0029 89            	pushw	x
 846  002a ae0000        	ldw	x,#L302
 847  002d cd0000        	call	_assert_failed
 849  0030 5b04          	addw	sp,#4
 850  0032               L66:
 851                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 853  0032 0d03          	tnz	(OFST+2,sp)
 854  0034 2706          	jreq	L27
 855  0036 7b03          	ld	a,(OFST+2,sp)
 856  0038 a111          	cp	a,#17
 857  003a 2603          	jrne	L07
 858  003c               L27:
 859  003c 4f            	clr	a
 860  003d 2010          	jra	L47
 861  003f               L07:
 862  003f ae00ba        	ldw	x,#186
 863  0042 89            	pushw	x
 864  0043 ae0000        	ldw	x,#0
 865  0046 89            	pushw	x
 866  0047 ae0000        	ldw	x,#L302
 867  004a cd0000        	call	_assert_failed
 869  004d 5b04          	addw	sp,#4
 870  004f               L47:
 871                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 873  004f 0d08          	tnz	(OFST+7,sp)
 874  0051 2706          	jreq	L001
 875  0053 7b08          	ld	a,(OFST+7,sp)
 876  0055 a122          	cp	a,#34
 877  0057 2603          	jrne	L67
 878  0059               L001:
 879  0059 4f            	clr	a
 880  005a 2010          	jra	L201
 881  005c               L67:
 882  005c ae00bb        	ldw	x,#187
 883  005f 89            	pushw	x
 884  0060 ae0000        	ldw	x,#0
 885  0063 89            	pushw	x
 886  0064 ae0000        	ldw	x,#L302
 887  0067 cd0000        	call	_assert_failed
 889  006a 5b04          	addw	sp,#4
 890  006c               L201:
 891                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 893  006c c65309        	ld	a,21257
 894  006f a4fc          	and	a,#252
 895  0071 c75309        	ld	21257,a
 896                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 896                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 898  0074 7b08          	ld	a,(OFST+7,sp)
 899  0076 a402          	and	a,#2
 900  0078 6b01          	ld	(OFST+0,sp),a
 901  007a 7b03          	ld	a,(OFST+2,sp)
 902  007c a401          	and	a,#1
 903  007e 1a01          	or	a,(OFST+0,sp)
 904  0080 ca5309        	or	a,21257
 905  0083 c75309        	ld	21257,a
 906                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 906                     ; 196                           (uint8_t)TIM2_OCMode);
 908  0086 c65307        	ld	a,21255
 909  0089 a48f          	and	a,#143
 910  008b 1a02          	or	a,(OFST+1,sp)
 911  008d c75307        	ld	21255,a
 912                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 914  0090 7b06          	ld	a,(OFST+5,sp)
 915  0092 c75313        	ld	21267,a
 916                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 918  0095 7b07          	ld	a,(OFST+6,sp)
 919  0097 c75314        	ld	21268,a
 920                     ; 201 }
 923  009a 5b03          	addw	sp,#3
 924  009c 81            	ret
1116                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1116                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1116                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1116                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1116                     ; 216                  uint8_t TIM2_ICFilter)
1116                     ; 217 {
1117                     .text:	section	.text,new
1118  0000               _TIM2_ICInit:
1120  0000 89            	pushw	x
1121       00000000      OFST:	set	0
1124                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1126  0001 9e            	ld	a,xh
1127  0002 4d            	tnz	a
1128  0003 270a          	jreq	L011
1129  0005 9e            	ld	a,xh
1130  0006 a101          	cp	a,#1
1131  0008 2705          	jreq	L011
1132  000a 9e            	ld	a,xh
1133  000b a102          	cp	a,#2
1134  000d 2603          	jrne	L601
1135  000f               L011:
1136  000f 4f            	clr	a
1137  0010 2010          	jra	L211
1138  0012               L601:
1139  0012 ae00db        	ldw	x,#219
1140  0015 89            	pushw	x
1141  0016 ae0000        	ldw	x,#0
1142  0019 89            	pushw	x
1143  001a ae0000        	ldw	x,#L302
1144  001d cd0000        	call	_assert_failed
1146  0020 5b04          	addw	sp,#4
1147  0022               L211:
1148                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1150  0022 0d02          	tnz	(OFST+2,sp)
1151  0024 2706          	jreq	L611
1152  0026 7b02          	ld	a,(OFST+2,sp)
1153  0028 a144          	cp	a,#68
1154  002a 2603          	jrne	L411
1155  002c               L611:
1156  002c 4f            	clr	a
1157  002d 2010          	jra	L021
1158  002f               L411:
1159  002f ae00dc        	ldw	x,#220
1160  0032 89            	pushw	x
1161  0033 ae0000        	ldw	x,#0
1162  0036 89            	pushw	x
1163  0037 ae0000        	ldw	x,#L302
1164  003a cd0000        	call	_assert_failed
1166  003d 5b04          	addw	sp,#4
1167  003f               L021:
1168                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1170  003f 7b05          	ld	a,(OFST+5,sp)
1171  0041 a101          	cp	a,#1
1172  0043 270c          	jreq	L421
1173  0045 7b05          	ld	a,(OFST+5,sp)
1174  0047 a102          	cp	a,#2
1175  0049 2706          	jreq	L421
1176  004b 7b05          	ld	a,(OFST+5,sp)
1177  004d a103          	cp	a,#3
1178  004f 2603          	jrne	L221
1179  0051               L421:
1180  0051 4f            	clr	a
1181  0052 2010          	jra	L621
1182  0054               L221:
1183  0054 ae00dd        	ldw	x,#221
1184  0057 89            	pushw	x
1185  0058 ae0000        	ldw	x,#0
1186  005b 89            	pushw	x
1187  005c ae0000        	ldw	x,#L302
1188  005f cd0000        	call	_assert_failed
1190  0062 5b04          	addw	sp,#4
1191  0064               L621:
1192                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1194  0064 0d06          	tnz	(OFST+6,sp)
1195  0066 2712          	jreq	L231
1196  0068 7b06          	ld	a,(OFST+6,sp)
1197  006a a104          	cp	a,#4
1198  006c 270c          	jreq	L231
1199  006e 7b06          	ld	a,(OFST+6,sp)
1200  0070 a108          	cp	a,#8
1201  0072 2706          	jreq	L231
1202  0074 7b06          	ld	a,(OFST+6,sp)
1203  0076 a10c          	cp	a,#12
1204  0078 2603          	jrne	L031
1205  007a               L231:
1206  007a 4f            	clr	a
1207  007b 2010          	jra	L431
1208  007d               L031:
1209  007d ae00de        	ldw	x,#222
1210  0080 89            	pushw	x
1211  0081 ae0000        	ldw	x,#0
1212  0084 89            	pushw	x
1213  0085 ae0000        	ldw	x,#L302
1214  0088 cd0000        	call	_assert_failed
1216  008b 5b04          	addw	sp,#4
1217  008d               L431:
1218                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1220  008d 7b07          	ld	a,(OFST+7,sp)
1221  008f a110          	cp	a,#16
1222  0091 2403          	jruge	L631
1223  0093 4f            	clr	a
1224  0094 2010          	jra	L041
1225  0096               L631:
1226  0096 ae00df        	ldw	x,#223
1227  0099 89            	pushw	x
1228  009a ae0000        	ldw	x,#0
1229  009d 89            	pushw	x
1230  009e ae0000        	ldw	x,#L302
1231  00a1 cd0000        	call	_assert_failed
1233  00a4 5b04          	addw	sp,#4
1234  00a6               L041:
1235                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1237  00a6 0d01          	tnz	(OFST+1,sp)
1238  00a8 2614          	jrne	L173
1239                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1239                     ; 229                (uint8_t)TIM2_ICSelection,
1239                     ; 230                (uint8_t)TIM2_ICFilter);
1241  00aa 7b07          	ld	a,(OFST+7,sp)
1242  00ac 88            	push	a
1243  00ad 7b06          	ld	a,(OFST+6,sp)
1244  00af 97            	ld	xl,a
1245  00b0 7b03          	ld	a,(OFST+3,sp)
1246  00b2 95            	ld	xh,a
1247  00b3 cd0000        	call	L3_TI1_Config
1249  00b6 84            	pop	a
1250                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1252  00b7 7b06          	ld	a,(OFST+6,sp)
1253  00b9 cd0000        	call	_TIM2_SetIC1Prescaler
1256  00bc 202c          	jra	L373
1257  00be               L173:
1258                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1260  00be 7b01          	ld	a,(OFST+1,sp)
1261  00c0 a101          	cp	a,#1
1262  00c2 2614          	jrne	L573
1263                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1263                     ; 239                (uint8_t)TIM2_ICSelection,
1263                     ; 240                (uint8_t)TIM2_ICFilter);
1265  00c4 7b07          	ld	a,(OFST+7,sp)
1266  00c6 88            	push	a
1267  00c7 7b06          	ld	a,(OFST+6,sp)
1268  00c9 97            	ld	xl,a
1269  00ca 7b03          	ld	a,(OFST+3,sp)
1270  00cc 95            	ld	xh,a
1271  00cd cd0000        	call	L5_TI2_Config
1273  00d0 84            	pop	a
1274                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1276  00d1 7b06          	ld	a,(OFST+6,sp)
1277  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1280  00d6 2012          	jra	L373
1281  00d8               L573:
1282                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1282                     ; 249                (uint8_t)TIM2_ICSelection,
1282                     ; 250                (uint8_t)TIM2_ICFilter);
1284  00d8 7b07          	ld	a,(OFST+7,sp)
1285  00da 88            	push	a
1286  00db 7b06          	ld	a,(OFST+6,sp)
1287  00dd 97            	ld	xl,a
1288  00de 7b03          	ld	a,(OFST+3,sp)
1289  00e0 95            	ld	xh,a
1290  00e1 cd0000        	call	L7_TI3_Config
1292  00e4 84            	pop	a
1293                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1295  00e5 7b06          	ld	a,(OFST+6,sp)
1296  00e7 cd0000        	call	_TIM2_SetIC3Prescaler
1298  00ea               L373:
1299                     ; 255 }
1302  00ea 85            	popw	x
1303  00eb 81            	ret
1394                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1394                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1394                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1394                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1394                     ; 270                      uint8_t TIM2_ICFilter)
1394                     ; 271 {
1395                     .text:	section	.text,new
1396  0000               _TIM2_PWMIConfig:
1398  0000 89            	pushw	x
1399  0001 89            	pushw	x
1400       00000002      OFST:	set	2
1403                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1405  0002 7b01          	ld	a,(OFST-1,sp)
1406  0004 97            	ld	xl,a
1407                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1409  0005 7b02          	ld	a,(OFST+0,sp)
1410  0007 97            	ld	xl,a
1411                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1413  0008 0d03          	tnz	(OFST+1,sp)
1414  000a 2706          	jreq	L641
1415  000c 7b03          	ld	a,(OFST+1,sp)
1416  000e a101          	cp	a,#1
1417  0010 2603          	jrne	L441
1418  0012               L641:
1419  0012 4f            	clr	a
1420  0013 2010          	jra	L051
1421  0015               L441:
1422  0015 ae0114        	ldw	x,#276
1423  0018 89            	pushw	x
1424  0019 ae0000        	ldw	x,#0
1425  001c 89            	pushw	x
1426  001d ae0000        	ldw	x,#L302
1427  0020 cd0000        	call	_assert_failed
1429  0023 5b04          	addw	sp,#4
1430  0025               L051:
1431                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1433  0025 0d04          	tnz	(OFST+2,sp)
1434  0027 2706          	jreq	L451
1435  0029 7b04          	ld	a,(OFST+2,sp)
1436  002b a144          	cp	a,#68
1437  002d 2603          	jrne	L251
1438  002f               L451:
1439  002f 4f            	clr	a
1440  0030 2010          	jra	L651
1441  0032               L251:
1442  0032 ae0115        	ldw	x,#277
1443  0035 89            	pushw	x
1444  0036 ae0000        	ldw	x,#0
1445  0039 89            	pushw	x
1446  003a ae0000        	ldw	x,#L302
1447  003d cd0000        	call	_assert_failed
1449  0040 5b04          	addw	sp,#4
1450  0042               L651:
1451                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1453  0042 7b07          	ld	a,(OFST+5,sp)
1454  0044 a101          	cp	a,#1
1455  0046 270c          	jreq	L261
1456  0048 7b07          	ld	a,(OFST+5,sp)
1457  004a a102          	cp	a,#2
1458  004c 2706          	jreq	L261
1459  004e 7b07          	ld	a,(OFST+5,sp)
1460  0050 a103          	cp	a,#3
1461  0052 2603          	jrne	L061
1462  0054               L261:
1463  0054 4f            	clr	a
1464  0055 2010          	jra	L461
1465  0057               L061:
1466  0057 ae0116        	ldw	x,#278
1467  005a 89            	pushw	x
1468  005b ae0000        	ldw	x,#0
1469  005e 89            	pushw	x
1470  005f ae0000        	ldw	x,#L302
1471  0062 cd0000        	call	_assert_failed
1473  0065 5b04          	addw	sp,#4
1474  0067               L461:
1475                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1477  0067 0d08          	tnz	(OFST+6,sp)
1478  0069 2712          	jreq	L071
1479  006b 7b08          	ld	a,(OFST+6,sp)
1480  006d a104          	cp	a,#4
1481  006f 270c          	jreq	L071
1482  0071 7b08          	ld	a,(OFST+6,sp)
1483  0073 a108          	cp	a,#8
1484  0075 2706          	jreq	L071
1485  0077 7b08          	ld	a,(OFST+6,sp)
1486  0079 a10c          	cp	a,#12
1487  007b 2603          	jrne	L661
1488  007d               L071:
1489  007d 4f            	clr	a
1490  007e 2010          	jra	L271
1491  0080               L661:
1492  0080 ae0117        	ldw	x,#279
1493  0083 89            	pushw	x
1494  0084 ae0000        	ldw	x,#0
1495  0087 89            	pushw	x
1496  0088 ae0000        	ldw	x,#L302
1497  008b cd0000        	call	_assert_failed
1499  008e 5b04          	addw	sp,#4
1500  0090               L271:
1501                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1503  0090 7b04          	ld	a,(OFST+2,sp)
1504  0092 a144          	cp	a,#68
1505  0094 2706          	jreq	L144
1506                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1508  0096 a644          	ld	a,#68
1509  0098 6b01          	ld	(OFST-1,sp),a
1511  009a 2002          	jra	L344
1512  009c               L144:
1513                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1515  009c 0f01          	clr	(OFST-1,sp)
1516  009e               L344:
1517                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1519  009e 7b07          	ld	a,(OFST+5,sp)
1520  00a0 a101          	cp	a,#1
1521  00a2 2606          	jrne	L544
1522                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1524  00a4 a602          	ld	a,#2
1525  00a6 6b02          	ld	(OFST+0,sp),a
1527  00a8 2004          	jra	L744
1528  00aa               L544:
1529                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1531  00aa a601          	ld	a,#1
1532  00ac 6b02          	ld	(OFST+0,sp),a
1533  00ae               L744:
1534                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1536  00ae 0d03          	tnz	(OFST+1,sp)
1537  00b0 2626          	jrne	L154
1538                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1538                     ; 305                (uint8_t)TIM2_ICFilter);
1540  00b2 7b09          	ld	a,(OFST+7,sp)
1541  00b4 88            	push	a
1542  00b5 7b08          	ld	a,(OFST+6,sp)
1543  00b7 97            	ld	xl,a
1544  00b8 7b05          	ld	a,(OFST+3,sp)
1545  00ba 95            	ld	xh,a
1546  00bb cd0000        	call	L3_TI1_Config
1548  00be 84            	pop	a
1549                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1551  00bf 7b08          	ld	a,(OFST+6,sp)
1552  00c1 cd0000        	call	_TIM2_SetIC1Prescaler
1554                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1556  00c4 7b09          	ld	a,(OFST+7,sp)
1557  00c6 88            	push	a
1558  00c7 7b03          	ld	a,(OFST+1,sp)
1559  00c9 97            	ld	xl,a
1560  00ca 7b02          	ld	a,(OFST+0,sp)
1561  00cc 95            	ld	xh,a
1562  00cd cd0000        	call	L5_TI2_Config
1564  00d0 84            	pop	a
1565                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1567  00d1 7b08          	ld	a,(OFST+6,sp)
1568  00d3 cd0000        	call	_TIM2_SetIC2Prescaler
1571  00d6 2024          	jra	L354
1572  00d8               L154:
1573                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1573                     ; 320                (uint8_t)TIM2_ICFilter);
1575  00d8 7b09          	ld	a,(OFST+7,sp)
1576  00da 88            	push	a
1577  00db 7b08          	ld	a,(OFST+6,sp)
1578  00dd 97            	ld	xl,a
1579  00de 7b05          	ld	a,(OFST+3,sp)
1580  00e0 95            	ld	xh,a
1581  00e1 cd0000        	call	L5_TI2_Config
1583  00e4 84            	pop	a
1584                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1586  00e5 7b08          	ld	a,(OFST+6,sp)
1587  00e7 cd0000        	call	_TIM2_SetIC2Prescaler
1589                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1591  00ea 7b09          	ld	a,(OFST+7,sp)
1592  00ec 88            	push	a
1593  00ed 7b03          	ld	a,(OFST+1,sp)
1594  00ef 97            	ld	xl,a
1595  00f0 7b02          	ld	a,(OFST+0,sp)
1596  00f2 95            	ld	xh,a
1597  00f3 cd0000        	call	L3_TI1_Config
1599  00f6 84            	pop	a
1600                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1602  00f7 7b08          	ld	a,(OFST+6,sp)
1603  00f9 cd0000        	call	_TIM2_SetIC1Prescaler
1605  00fc               L354:
1606                     ; 331 }
1609  00fc 5b04          	addw	sp,#4
1610  00fe 81            	ret
1666                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1666                     ; 340 {
1667                     .text:	section	.text,new
1668  0000               _TIM2_Cmd:
1670  0000 88            	push	a
1671       00000000      OFST:	set	0
1674                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1676  0001 4d            	tnz	a
1677  0002 2704          	jreq	L002
1678  0004 a101          	cp	a,#1
1679  0006 2603          	jrne	L671
1680  0008               L002:
1681  0008 4f            	clr	a
1682  0009 2010          	jra	L202
1683  000b               L671:
1684  000b ae0156        	ldw	x,#342
1685  000e 89            	pushw	x
1686  000f ae0000        	ldw	x,#0
1687  0012 89            	pushw	x
1688  0013 ae0000        	ldw	x,#L302
1689  0016 cd0000        	call	_assert_failed
1691  0019 5b04          	addw	sp,#4
1692  001b               L202:
1693                     ; 345   if (NewState != DISABLE)
1695  001b 0d01          	tnz	(OFST+1,sp)
1696  001d 2706          	jreq	L305
1697                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1699  001f 72105300      	bset	21248,#0
1701  0023 2004          	jra	L505
1702  0025               L305:
1703                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1705  0025 72115300      	bres	21248,#0
1706  0029               L505:
1707                     ; 353 }
1710  0029 84            	pop	a
1711  002a 81            	ret
1791                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1791                     ; 369 {
1792                     .text:	section	.text,new
1793  0000               _TIM2_ITConfig:
1795  0000 89            	pushw	x
1796       00000000      OFST:	set	0
1799                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1801  0001 9e            	ld	a,xh
1802  0002 4d            	tnz	a
1803  0003 2708          	jreq	L602
1804  0005 9e            	ld	a,xh
1805  0006 a110          	cp	a,#16
1806  0008 2403          	jruge	L602
1807  000a 4f            	clr	a
1808  000b 2010          	jra	L012
1809  000d               L602:
1810  000d ae0173        	ldw	x,#371
1811  0010 89            	pushw	x
1812  0011 ae0000        	ldw	x,#0
1813  0014 89            	pushw	x
1814  0015 ae0000        	ldw	x,#L302
1815  0018 cd0000        	call	_assert_failed
1817  001b 5b04          	addw	sp,#4
1818  001d               L012:
1819                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1821  001d 0d02          	tnz	(OFST+2,sp)
1822  001f 2706          	jreq	L412
1823  0021 7b02          	ld	a,(OFST+2,sp)
1824  0023 a101          	cp	a,#1
1825  0025 2603          	jrne	L212
1826  0027               L412:
1827  0027 4f            	clr	a
1828  0028 2010          	jra	L612
1829  002a               L212:
1830  002a ae0174        	ldw	x,#372
1831  002d 89            	pushw	x
1832  002e ae0000        	ldw	x,#0
1833  0031 89            	pushw	x
1834  0032 ae0000        	ldw	x,#L302
1835  0035 cd0000        	call	_assert_failed
1837  0038 5b04          	addw	sp,#4
1838  003a               L612:
1839                     ; 374   if (NewState != DISABLE)
1841  003a 0d02          	tnz	(OFST+2,sp)
1842  003c 270a          	jreq	L545
1843                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1845  003e c65301        	ld	a,21249
1846  0041 1a01          	or	a,(OFST+1,sp)
1847  0043 c75301        	ld	21249,a
1849  0046 2009          	jra	L745
1850  0048               L545:
1851                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1853  0048 7b01          	ld	a,(OFST+1,sp)
1854  004a 43            	cpl	a
1855  004b c45301        	and	a,21249
1856  004e c75301        	ld	21249,a
1857  0051               L745:
1858                     ; 384 }
1861  0051 85            	popw	x
1862  0052 81            	ret
1899                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1899                     ; 393 {
1900                     .text:	section	.text,new
1901  0000               _TIM2_UpdateDisableConfig:
1903  0000 88            	push	a
1904       00000000      OFST:	set	0
1907                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1909  0001 4d            	tnz	a
1910  0002 2704          	jreq	L422
1911  0004 a101          	cp	a,#1
1912  0006 2603          	jrne	L222
1913  0008               L422:
1914  0008 4f            	clr	a
1915  0009 2010          	jra	L622
1916  000b               L222:
1917  000b ae018b        	ldw	x,#395
1918  000e 89            	pushw	x
1919  000f ae0000        	ldw	x,#0
1920  0012 89            	pushw	x
1921  0013 ae0000        	ldw	x,#L302
1922  0016 cd0000        	call	_assert_failed
1924  0019 5b04          	addw	sp,#4
1925  001b               L622:
1926                     ; 398   if (NewState != DISABLE)
1928  001b 0d01          	tnz	(OFST+1,sp)
1929  001d 2706          	jreq	L765
1930                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1932  001f 72125300      	bset	21248,#1
1934  0023 2004          	jra	L175
1935  0025               L765:
1936                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1938  0025 72135300      	bres	21248,#1
1939  0029               L175:
1940                     ; 406 }
1943  0029 84            	pop	a
1944  002a 81            	ret
2003                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2003                     ; 417 {
2004                     .text:	section	.text,new
2005  0000               _TIM2_UpdateRequestConfig:
2007  0000 88            	push	a
2008       00000000      OFST:	set	0
2011                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2013  0001 4d            	tnz	a
2014  0002 2704          	jreq	L432
2015  0004 a101          	cp	a,#1
2016  0006 2603          	jrne	L232
2017  0008               L432:
2018  0008 4f            	clr	a
2019  0009 2010          	jra	L632
2020  000b               L232:
2021  000b ae01a3        	ldw	x,#419
2022  000e 89            	pushw	x
2023  000f ae0000        	ldw	x,#0
2024  0012 89            	pushw	x
2025  0013 ae0000        	ldw	x,#L302
2026  0016 cd0000        	call	_assert_failed
2028  0019 5b04          	addw	sp,#4
2029  001b               L632:
2030                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2032  001b 0d01          	tnz	(OFST+1,sp)
2033  001d 2706          	jreq	L126
2034                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2036  001f 72145300      	bset	21248,#2
2038  0023 2004          	jra	L326
2039  0025               L126:
2040                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2042  0025 72155300      	bres	21248,#2
2043  0029               L326:
2044                     ; 430 }
2047  0029 84            	pop	a
2048  002a 81            	ret
2106                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2106                     ; 441 {
2107                     .text:	section	.text,new
2108  0000               _TIM2_SelectOnePulseMode:
2110  0000 88            	push	a
2111       00000000      OFST:	set	0
2114                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2116  0001 a101          	cp	a,#1
2117  0003 2703          	jreq	L442
2118  0005 4d            	tnz	a
2119  0006 2603          	jrne	L242
2120  0008               L442:
2121  0008 4f            	clr	a
2122  0009 2010          	jra	L642
2123  000b               L242:
2124  000b ae01bb        	ldw	x,#443
2125  000e 89            	pushw	x
2126  000f ae0000        	ldw	x,#0
2127  0012 89            	pushw	x
2128  0013 ae0000        	ldw	x,#L302
2129  0016 cd0000        	call	_assert_failed
2131  0019 5b04          	addw	sp,#4
2132  001b               L642:
2133                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2135  001b 0d01          	tnz	(OFST+1,sp)
2136  001d 2706          	jreq	L356
2137                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2139  001f 72165300      	bset	21248,#3
2141  0023 2004          	jra	L556
2142  0025               L356:
2143                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2145  0025 72175300      	bres	21248,#3
2146  0029               L556:
2147                     ; 454 }
2150  0029 84            	pop	a
2151  002a 81            	ret
2220                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2220                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2220                     ; 486 {
2221                     .text:	section	.text,new
2222  0000               _TIM2_PrescalerConfig:
2224  0000 89            	pushw	x
2225       00000000      OFST:	set	0
2228                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2230  0001 9f            	ld	a,xl
2231  0002 4d            	tnz	a
2232  0003 2705          	jreq	L452
2233  0005 9f            	ld	a,xl
2234  0006 a101          	cp	a,#1
2235  0008 2603          	jrne	L252
2236  000a               L452:
2237  000a 4f            	clr	a
2238  000b 2010          	jra	L652
2239  000d               L252:
2240  000d ae01e8        	ldw	x,#488
2241  0010 89            	pushw	x
2242  0011 ae0000        	ldw	x,#0
2243  0014 89            	pushw	x
2244  0015 ae0000        	ldw	x,#L302
2245  0018 cd0000        	call	_assert_failed
2247  001b 5b04          	addw	sp,#4
2248  001d               L652:
2249                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2251  001d 0d01          	tnz	(OFST+1,sp)
2252  001f 275a          	jreq	L262
2253  0021 7b01          	ld	a,(OFST+1,sp)
2254  0023 a101          	cp	a,#1
2255  0025 2754          	jreq	L262
2256  0027 7b01          	ld	a,(OFST+1,sp)
2257  0029 a102          	cp	a,#2
2258  002b 274e          	jreq	L262
2259  002d 7b01          	ld	a,(OFST+1,sp)
2260  002f a103          	cp	a,#3
2261  0031 2748          	jreq	L262
2262  0033 7b01          	ld	a,(OFST+1,sp)
2263  0035 a104          	cp	a,#4
2264  0037 2742          	jreq	L262
2265  0039 7b01          	ld	a,(OFST+1,sp)
2266  003b a105          	cp	a,#5
2267  003d 273c          	jreq	L262
2268  003f 7b01          	ld	a,(OFST+1,sp)
2269  0041 a106          	cp	a,#6
2270  0043 2736          	jreq	L262
2271  0045 7b01          	ld	a,(OFST+1,sp)
2272  0047 a107          	cp	a,#7
2273  0049 2730          	jreq	L262
2274  004b 7b01          	ld	a,(OFST+1,sp)
2275  004d a108          	cp	a,#8
2276  004f 272a          	jreq	L262
2277  0051 7b01          	ld	a,(OFST+1,sp)
2278  0053 a109          	cp	a,#9
2279  0055 2724          	jreq	L262
2280  0057 7b01          	ld	a,(OFST+1,sp)
2281  0059 a10a          	cp	a,#10
2282  005b 271e          	jreq	L262
2283  005d 7b01          	ld	a,(OFST+1,sp)
2284  005f a10b          	cp	a,#11
2285  0061 2718          	jreq	L262
2286  0063 7b01          	ld	a,(OFST+1,sp)
2287  0065 a10c          	cp	a,#12
2288  0067 2712          	jreq	L262
2289  0069 7b01          	ld	a,(OFST+1,sp)
2290  006b a10d          	cp	a,#13
2291  006d 270c          	jreq	L262
2292  006f 7b01          	ld	a,(OFST+1,sp)
2293  0071 a10e          	cp	a,#14
2294  0073 2706          	jreq	L262
2295  0075 7b01          	ld	a,(OFST+1,sp)
2296  0077 a10f          	cp	a,#15
2297  0079 2603          	jrne	L062
2298  007b               L262:
2299  007b 4f            	clr	a
2300  007c 2010          	jra	L462
2301  007e               L062:
2302  007e ae01e9        	ldw	x,#489
2303  0081 89            	pushw	x
2304  0082 ae0000        	ldw	x,#0
2305  0085 89            	pushw	x
2306  0086 ae0000        	ldw	x,#L302
2307  0089 cd0000        	call	_assert_failed
2309  008c 5b04          	addw	sp,#4
2310  008e               L462:
2311                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2313  008e 7b01          	ld	a,(OFST+1,sp)
2314  0090 c7530c        	ld	21260,a
2315                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2317  0093 7b02          	ld	a,(OFST+2,sp)
2318  0095 c75304        	ld	21252,a
2319                     ; 496 }
2322  0098 85            	popw	x
2323  0099 81            	ret
2382                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2382                     ; 508 {
2383                     .text:	section	.text,new
2384  0000               _TIM2_ForcedOC1Config:
2386  0000 88            	push	a
2387       00000000      OFST:	set	0
2390                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2392  0001 a150          	cp	a,#80
2393  0003 2704          	jreq	L272
2394  0005 a140          	cp	a,#64
2395  0007 2603          	jrne	L072
2396  0009               L272:
2397  0009 4f            	clr	a
2398  000a 2010          	jra	L472
2399  000c               L072:
2400  000c ae01fe        	ldw	x,#510
2401  000f 89            	pushw	x
2402  0010 ae0000        	ldw	x,#0
2403  0013 89            	pushw	x
2404  0014 ae0000        	ldw	x,#L302
2405  0017 cd0000        	call	_assert_failed
2407  001a 5b04          	addw	sp,#4
2408  001c               L472:
2409                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2409                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2411  001c c65305        	ld	a,21253
2412  001f a48f          	and	a,#143
2413  0021 1a01          	or	a,(OFST+1,sp)
2414  0023 c75305        	ld	21253,a
2415                     ; 515 }
2418  0026 84            	pop	a
2419  0027 81            	ret
2456                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2456                     ; 527 {
2457                     .text:	section	.text,new
2458  0000               _TIM2_ForcedOC2Config:
2460  0000 88            	push	a
2461       00000000      OFST:	set	0
2464                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2466  0001 a150          	cp	a,#80
2467  0003 2704          	jreq	L203
2468  0005 a140          	cp	a,#64
2469  0007 2603          	jrne	L003
2470  0009               L203:
2471  0009 4f            	clr	a
2472  000a 2010          	jra	L403
2473  000c               L003:
2474  000c ae0211        	ldw	x,#529
2475  000f 89            	pushw	x
2476  0010 ae0000        	ldw	x,#0
2477  0013 89            	pushw	x
2478  0014 ae0000        	ldw	x,#L302
2479  0017 cd0000        	call	_assert_failed
2481  001a 5b04          	addw	sp,#4
2482  001c               L403:
2483                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2483                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2485  001c c65306        	ld	a,21254
2486  001f a48f          	and	a,#143
2487  0021 1a01          	or	a,(OFST+1,sp)
2488  0023 c75306        	ld	21254,a
2489                     ; 534 }
2492  0026 84            	pop	a
2493  0027 81            	ret
2530                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2530                     ; 546 {
2531                     .text:	section	.text,new
2532  0000               _TIM2_ForcedOC3Config:
2534  0000 88            	push	a
2535       00000000      OFST:	set	0
2538                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2540  0001 a150          	cp	a,#80
2541  0003 2704          	jreq	L213
2542  0005 a140          	cp	a,#64
2543  0007 2603          	jrne	L013
2544  0009               L213:
2545  0009 4f            	clr	a
2546  000a 2010          	jra	L413
2547  000c               L013:
2548  000c ae0224        	ldw	x,#548
2549  000f 89            	pushw	x
2550  0010 ae0000        	ldw	x,#0
2551  0013 89            	pushw	x
2552  0014 ae0000        	ldw	x,#L302
2553  0017 cd0000        	call	_assert_failed
2555  001a 5b04          	addw	sp,#4
2556  001c               L413:
2557                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2557                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2559  001c c65307        	ld	a,21255
2560  001f a48f          	and	a,#143
2561  0021 1a01          	or	a,(OFST+1,sp)
2562  0023 c75307        	ld	21255,a
2563                     ; 553 }
2566  0026 84            	pop	a
2567  0027 81            	ret
2604                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2604                     ; 562 {
2605                     .text:	section	.text,new
2606  0000               _TIM2_ARRPreloadConfig:
2608  0000 88            	push	a
2609       00000000      OFST:	set	0
2612                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2614  0001 4d            	tnz	a
2615  0002 2704          	jreq	L223
2616  0004 a101          	cp	a,#1
2617  0006 2603          	jrne	L023
2618  0008               L223:
2619  0008 4f            	clr	a
2620  0009 2010          	jra	L423
2621  000b               L023:
2622  000b ae0234        	ldw	x,#564
2623  000e 89            	pushw	x
2624  000f ae0000        	ldw	x,#0
2625  0012 89            	pushw	x
2626  0013 ae0000        	ldw	x,#L302
2627  0016 cd0000        	call	_assert_failed
2629  0019 5b04          	addw	sp,#4
2630  001b               L423:
2631                     ; 567   if (NewState != DISABLE)
2633  001b 0d01          	tnz	(OFST+1,sp)
2634  001d 2706          	jreq	L1101
2635                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2637  001f 721e5300      	bset	21248,#7
2639  0023 2004          	jra	L3101
2640  0025               L1101:
2641                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2643  0025 721f5300      	bres	21248,#7
2644  0029               L3101:
2645                     ; 575 }
2648  0029 84            	pop	a
2649  002a 81            	ret
2686                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2686                     ; 584 {
2687                     .text:	section	.text,new
2688  0000               _TIM2_OC1PreloadConfig:
2690  0000 88            	push	a
2691       00000000      OFST:	set	0
2694                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2696  0001 4d            	tnz	a
2697  0002 2704          	jreq	L233
2698  0004 a101          	cp	a,#1
2699  0006 2603          	jrne	L033
2700  0008               L233:
2701  0008 4f            	clr	a
2702  0009 2010          	jra	L433
2703  000b               L033:
2704  000b ae024a        	ldw	x,#586
2705  000e 89            	pushw	x
2706  000f ae0000        	ldw	x,#0
2707  0012 89            	pushw	x
2708  0013 ae0000        	ldw	x,#L302
2709  0016 cd0000        	call	_assert_failed
2711  0019 5b04          	addw	sp,#4
2712  001b               L433:
2713                     ; 589   if (NewState != DISABLE)
2715  001b 0d01          	tnz	(OFST+1,sp)
2716  001d 2706          	jreq	L3301
2717                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2719  001f 72165305      	bset	21253,#3
2721  0023 2004          	jra	L5301
2722  0025               L3301:
2723                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2725  0025 72175305      	bres	21253,#3
2726  0029               L5301:
2727                     ; 597 }
2730  0029 84            	pop	a
2731  002a 81            	ret
2768                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2768                     ; 606 {
2769                     .text:	section	.text,new
2770  0000               _TIM2_OC2PreloadConfig:
2772  0000 88            	push	a
2773       00000000      OFST:	set	0
2776                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2778  0001 4d            	tnz	a
2779  0002 2704          	jreq	L243
2780  0004 a101          	cp	a,#1
2781  0006 2603          	jrne	L043
2782  0008               L243:
2783  0008 4f            	clr	a
2784  0009 2010          	jra	L443
2785  000b               L043:
2786  000b ae0260        	ldw	x,#608
2787  000e 89            	pushw	x
2788  000f ae0000        	ldw	x,#0
2789  0012 89            	pushw	x
2790  0013 ae0000        	ldw	x,#L302
2791  0016 cd0000        	call	_assert_failed
2793  0019 5b04          	addw	sp,#4
2794  001b               L443:
2795                     ; 611   if (NewState != DISABLE)
2797  001b 0d01          	tnz	(OFST+1,sp)
2798  001d 2706          	jreq	L5501
2799                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2801  001f 72165306      	bset	21254,#3
2803  0023 2004          	jra	L7501
2804  0025               L5501:
2805                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2807  0025 72175306      	bres	21254,#3
2808  0029               L7501:
2809                     ; 619 }
2812  0029 84            	pop	a
2813  002a 81            	ret
2850                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2850                     ; 628 {
2851                     .text:	section	.text,new
2852  0000               _TIM2_OC3PreloadConfig:
2854  0000 88            	push	a
2855       00000000      OFST:	set	0
2858                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2860  0001 4d            	tnz	a
2861  0002 2704          	jreq	L253
2862  0004 a101          	cp	a,#1
2863  0006 2603          	jrne	L053
2864  0008               L253:
2865  0008 4f            	clr	a
2866  0009 2010          	jra	L453
2867  000b               L053:
2868  000b ae0276        	ldw	x,#630
2869  000e 89            	pushw	x
2870  000f ae0000        	ldw	x,#0
2871  0012 89            	pushw	x
2872  0013 ae0000        	ldw	x,#L302
2873  0016 cd0000        	call	_assert_failed
2875  0019 5b04          	addw	sp,#4
2876  001b               L453:
2877                     ; 633   if (NewState != DISABLE)
2879  001b 0d01          	tnz	(OFST+1,sp)
2880  001d 2706          	jreq	L7701
2881                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2883  001f 72165307      	bset	21255,#3
2885  0023 2004          	jra	L1011
2886  0025               L7701:
2887                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2889  0025 72175307      	bres	21255,#3
2890  0029               L1011:
2891                     ; 641 }
2894  0029 84            	pop	a
2895  002a 81            	ret
2969                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2969                     ; 654 {
2970                     .text:	section	.text,new
2971  0000               _TIM2_GenerateEvent:
2973  0000 88            	push	a
2974       00000000      OFST:	set	0
2977                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2979  0001 4d            	tnz	a
2980  0002 2703          	jreq	L063
2981  0004 4f            	clr	a
2982  0005 2010          	jra	L263
2983  0007               L063:
2984  0007 ae0290        	ldw	x,#656
2985  000a 89            	pushw	x
2986  000b ae0000        	ldw	x,#0
2987  000e 89            	pushw	x
2988  000f ae0000        	ldw	x,#L302
2989  0012 cd0000        	call	_assert_failed
2991  0015 5b04          	addw	sp,#4
2992  0017               L263:
2993                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2995  0017 7b01          	ld	a,(OFST+1,sp)
2996  0019 c75304        	ld	21252,a
2997                     ; 660 }
3000  001c 84            	pop	a
3001  001d 81            	ret
3038                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3038                     ; 671 {
3039                     .text:	section	.text,new
3040  0000               _TIM2_OC1PolarityConfig:
3042  0000 88            	push	a
3043       00000000      OFST:	set	0
3046                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3048  0001 4d            	tnz	a
3049  0002 2704          	jreq	L073
3050  0004 a122          	cp	a,#34
3051  0006 2603          	jrne	L663
3052  0008               L073:
3053  0008 4f            	clr	a
3054  0009 2010          	jra	L273
3055  000b               L663:
3056  000b ae02a1        	ldw	x,#673
3057  000e 89            	pushw	x
3058  000f ae0000        	ldw	x,#0
3059  0012 89            	pushw	x
3060  0013 ae0000        	ldw	x,#L302
3061  0016 cd0000        	call	_assert_failed
3063  0019 5b04          	addw	sp,#4
3064  001b               L273:
3065                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3067  001b 0d01          	tnz	(OFST+1,sp)
3068  001d 2706          	jreq	L3511
3069                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3071  001f 72125308      	bset	21256,#1
3073  0023 2004          	jra	L5511
3074  0025               L3511:
3075                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3077  0025 72135308      	bres	21256,#1
3078  0029               L5511:
3079                     ; 684 }
3082  0029 84            	pop	a
3083  002a 81            	ret
3120                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3120                     ; 695 {
3121                     .text:	section	.text,new
3122  0000               _TIM2_OC2PolarityConfig:
3124  0000 88            	push	a
3125       00000000      OFST:	set	0
3128                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3130  0001 4d            	tnz	a
3131  0002 2704          	jreq	L004
3132  0004 a122          	cp	a,#34
3133  0006 2603          	jrne	L673
3134  0008               L004:
3135  0008 4f            	clr	a
3136  0009 2010          	jra	L204
3137  000b               L673:
3138  000b ae02b9        	ldw	x,#697
3139  000e 89            	pushw	x
3140  000f ae0000        	ldw	x,#0
3141  0012 89            	pushw	x
3142  0013 ae0000        	ldw	x,#L302
3143  0016 cd0000        	call	_assert_failed
3145  0019 5b04          	addw	sp,#4
3146  001b               L204:
3147                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3149  001b 0d01          	tnz	(OFST+1,sp)
3150  001d 2706          	jreq	L5711
3151                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
3153  001f 721a5308      	bset	21256,#5
3155  0023 2004          	jra	L7711
3156  0025               L5711:
3157                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3159  0025 721b5308      	bres	21256,#5
3160  0029               L7711:
3161                     ; 708 }
3164  0029 84            	pop	a
3165  002a 81            	ret
3202                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3202                     ; 719 {
3203                     .text:	section	.text,new
3204  0000               _TIM2_OC3PolarityConfig:
3206  0000 88            	push	a
3207       00000000      OFST:	set	0
3210                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3212  0001 4d            	tnz	a
3213  0002 2704          	jreq	L014
3214  0004 a122          	cp	a,#34
3215  0006 2603          	jrne	L604
3216  0008               L014:
3217  0008 4f            	clr	a
3218  0009 2010          	jra	L214
3219  000b               L604:
3220  000b ae02d1        	ldw	x,#721
3221  000e 89            	pushw	x
3222  000f ae0000        	ldw	x,#0
3223  0012 89            	pushw	x
3224  0013 ae0000        	ldw	x,#L302
3225  0016 cd0000        	call	_assert_failed
3227  0019 5b04          	addw	sp,#4
3228  001b               L214:
3229                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3231  001b 0d01          	tnz	(OFST+1,sp)
3232  001d 2706          	jreq	L7121
3233                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3235  001f 72125309      	bset	21257,#1
3237  0023 2004          	jra	L1221
3238  0025               L7121:
3239                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3241  0025 72135309      	bres	21257,#1
3242  0029               L1221:
3243                     ; 732 }
3246  0029 84            	pop	a
3247  002a 81            	ret
3293                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3293                     ; 746 {
3294                     .text:	section	.text,new
3295  0000               _TIM2_CCxCmd:
3297  0000 89            	pushw	x
3298       00000000      OFST:	set	0
3301                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3303  0001 9e            	ld	a,xh
3304  0002 4d            	tnz	a
3305  0003 270a          	jreq	L024
3306  0005 9e            	ld	a,xh
3307  0006 a101          	cp	a,#1
3308  0008 2705          	jreq	L024
3309  000a 9e            	ld	a,xh
3310  000b a102          	cp	a,#2
3311  000d 2603          	jrne	L614
3312  000f               L024:
3313  000f 4f            	clr	a
3314  0010 2010          	jra	L224
3315  0012               L614:
3316  0012 ae02ec        	ldw	x,#748
3317  0015 89            	pushw	x
3318  0016 ae0000        	ldw	x,#0
3319  0019 89            	pushw	x
3320  001a ae0000        	ldw	x,#L302
3321  001d cd0000        	call	_assert_failed
3323  0020 5b04          	addw	sp,#4
3324  0022               L224:
3325                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3327  0022 0d02          	tnz	(OFST+2,sp)
3328  0024 2706          	jreq	L624
3329  0026 7b02          	ld	a,(OFST+2,sp)
3330  0028 a101          	cp	a,#1
3331  002a 2603          	jrne	L424
3332  002c               L624:
3333  002c 4f            	clr	a
3334  002d 2010          	jra	L034
3335  002f               L424:
3336  002f ae02ed        	ldw	x,#749
3337  0032 89            	pushw	x
3338  0033 ae0000        	ldw	x,#0
3339  0036 89            	pushw	x
3340  0037 ae0000        	ldw	x,#L302
3341  003a cd0000        	call	_assert_failed
3343  003d 5b04          	addw	sp,#4
3344  003f               L034:
3345                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3347  003f 0d01          	tnz	(OFST+1,sp)
3348  0041 2610          	jrne	L5421
3349                     ; 754     if (NewState != DISABLE)
3351  0043 0d02          	tnz	(OFST+2,sp)
3352  0045 2706          	jreq	L7421
3353                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3355  0047 72105308      	bset	21256,#0
3357  004b 202a          	jra	L3521
3358  004d               L7421:
3359                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3361  004d 72115308      	bres	21256,#0
3362  0051 2024          	jra	L3521
3363  0053               L5421:
3364                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3366  0053 7b01          	ld	a,(OFST+1,sp)
3367  0055 a101          	cp	a,#1
3368  0057 2610          	jrne	L5521
3369                     ; 767     if (NewState != DISABLE)
3371  0059 0d02          	tnz	(OFST+2,sp)
3372  005b 2706          	jreq	L7521
3373                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3375  005d 72185308      	bset	21256,#4
3377  0061 2014          	jra	L3521
3378  0063               L7521:
3379                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3381  0063 72195308      	bres	21256,#4
3382  0067 200e          	jra	L3521
3383  0069               L5521:
3384                     ; 779     if (NewState != DISABLE)
3386  0069 0d02          	tnz	(OFST+2,sp)
3387  006b 2706          	jreq	L5621
3388                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3390  006d 72105309      	bset	21257,#0
3392  0071 2004          	jra	L3521
3393  0073               L5621:
3394                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3396  0073 72115309      	bres	21257,#0
3397  0077               L3521:
3398                     ; 788 }
3401  0077 85            	popw	x
3402  0078 81            	ret
3448                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3448                     ; 811 {
3449                     .text:	section	.text,new
3450  0000               _TIM2_SelectOCxM:
3452  0000 89            	pushw	x
3453       00000000      OFST:	set	0
3456                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3458  0001 9e            	ld	a,xh
3459  0002 4d            	tnz	a
3460  0003 270a          	jreq	L634
3461  0005 9e            	ld	a,xh
3462  0006 a101          	cp	a,#1
3463  0008 2705          	jreq	L634
3464  000a 9e            	ld	a,xh
3465  000b a102          	cp	a,#2
3466  000d 2603          	jrne	L434
3467  000f               L634:
3468  000f 4f            	clr	a
3469  0010 2010          	jra	L044
3470  0012               L434:
3471  0012 ae032d        	ldw	x,#813
3472  0015 89            	pushw	x
3473  0016 ae0000        	ldw	x,#0
3474  0019 89            	pushw	x
3475  001a ae0000        	ldw	x,#L302
3476  001d cd0000        	call	_assert_failed
3478  0020 5b04          	addw	sp,#4
3479  0022               L044:
3480                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3482  0022 0d02          	tnz	(OFST+2,sp)
3483  0024 272a          	jreq	L444
3484  0026 7b02          	ld	a,(OFST+2,sp)
3485  0028 a110          	cp	a,#16
3486  002a 2724          	jreq	L444
3487  002c 7b02          	ld	a,(OFST+2,sp)
3488  002e a120          	cp	a,#32
3489  0030 271e          	jreq	L444
3490  0032 7b02          	ld	a,(OFST+2,sp)
3491  0034 a130          	cp	a,#48
3492  0036 2718          	jreq	L444
3493  0038 7b02          	ld	a,(OFST+2,sp)
3494  003a a160          	cp	a,#96
3495  003c 2712          	jreq	L444
3496  003e 7b02          	ld	a,(OFST+2,sp)
3497  0040 a170          	cp	a,#112
3498  0042 270c          	jreq	L444
3499  0044 7b02          	ld	a,(OFST+2,sp)
3500  0046 a150          	cp	a,#80
3501  0048 2706          	jreq	L444
3502  004a 7b02          	ld	a,(OFST+2,sp)
3503  004c a140          	cp	a,#64
3504  004e 2603          	jrne	L244
3505  0050               L444:
3506  0050 4f            	clr	a
3507  0051 2010          	jra	L644
3508  0053               L244:
3509  0053 ae032e        	ldw	x,#814
3510  0056 89            	pushw	x
3511  0057 ae0000        	ldw	x,#0
3512  005a 89            	pushw	x
3513  005b ae0000        	ldw	x,#L302
3514  005e cd0000        	call	_assert_failed
3516  0061 5b04          	addw	sp,#4
3517  0063               L644:
3518                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3520  0063 0d01          	tnz	(OFST+1,sp)
3521  0065 2610          	jrne	L3131
3522                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3524  0067 72115308      	bres	21256,#0
3525                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3525                     ; 823                             | (uint8_t)TIM2_OCMode);
3527  006b c65305        	ld	a,21253
3528  006e a48f          	and	a,#143
3529  0070 1a02          	or	a,(OFST+2,sp)
3530  0072 c75305        	ld	21253,a
3532  0075 2024          	jra	L5131
3533  0077               L3131:
3534                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3536  0077 7b01          	ld	a,(OFST+1,sp)
3537  0079 a101          	cp	a,#1
3538  007b 2610          	jrne	L7131
3539                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3541  007d 72195308      	bres	21256,#4
3542                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3542                     ; 832                             | (uint8_t)TIM2_OCMode);
3544  0081 c65306        	ld	a,21254
3545  0084 a48f          	and	a,#143
3546  0086 1a02          	or	a,(OFST+2,sp)
3547  0088 c75306        	ld	21254,a
3549  008b 200e          	jra	L5131
3550  008d               L7131:
3551                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3553  008d 72115309      	bres	21257,#0
3554                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3554                     ; 841                             | (uint8_t)TIM2_OCMode);
3556  0091 c65307        	ld	a,21255
3557  0094 a48f          	and	a,#143
3558  0096 1a02          	or	a,(OFST+2,sp)
3559  0098 c75307        	ld	21255,a
3560  009b               L5131:
3561                     ; 843 }
3564  009b 85            	popw	x
3565  009c 81            	ret
3597                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3597                     ; 852 {
3598                     .text:	section	.text,new
3599  0000               _TIM2_SetCounter:
3603                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3605  0000 9e            	ld	a,xh
3606  0001 c7530a        	ld	21258,a
3607                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3609  0004 9f            	ld	a,xl
3610  0005 c7530b        	ld	21259,a
3611                     ; 856 }
3614  0008 81            	ret
3646                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3646                     ; 865 {
3647                     .text:	section	.text,new
3648  0000               _TIM2_SetAutoreload:
3652                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3654  0000 9e            	ld	a,xh
3655  0001 c7530d        	ld	21261,a
3656                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3658  0004 9f            	ld	a,xl
3659  0005 c7530e        	ld	21262,a
3660                     ; 869 }
3663  0008 81            	ret
3695                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3695                     ; 878 {
3696                     .text:	section	.text,new
3697  0000               _TIM2_SetCompare1:
3701                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3703  0000 9e            	ld	a,xh
3704  0001 c7530f        	ld	21263,a
3705                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3707  0004 9f            	ld	a,xl
3708  0005 c75310        	ld	21264,a
3709                     ; 882 }
3712  0008 81            	ret
3744                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3744                     ; 891 {
3745                     .text:	section	.text,new
3746  0000               _TIM2_SetCompare2:
3750                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3752  0000 9e            	ld	a,xh
3753  0001 c75311        	ld	21265,a
3754                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3756  0004 9f            	ld	a,xl
3757  0005 c75312        	ld	21266,a
3758                     ; 895 }
3761  0008 81            	ret
3793                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3793                     ; 904 {
3794                     .text:	section	.text,new
3795  0000               _TIM2_SetCompare3:
3799                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3801  0000 9e            	ld	a,xh
3802  0001 c75313        	ld	21267,a
3803                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3805  0004 9f            	ld	a,xl
3806  0005 c75314        	ld	21268,a
3807                     ; 908 }
3810  0008 81            	ret
3847                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3847                     ; 921 {
3848                     .text:	section	.text,new
3849  0000               _TIM2_SetIC1Prescaler:
3851  0000 88            	push	a
3852       00000000      OFST:	set	0
3855                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3857  0001 4d            	tnz	a
3858  0002 270c          	jreq	L664
3859  0004 a104          	cp	a,#4
3860  0006 2708          	jreq	L664
3861  0008 a108          	cp	a,#8
3862  000a 2704          	jreq	L664
3863  000c a10c          	cp	a,#12
3864  000e 2603          	jrne	L464
3865  0010               L664:
3866  0010 4f            	clr	a
3867  0011 2010          	jra	L074
3868  0013               L464:
3869  0013 ae039b        	ldw	x,#923
3870  0016 89            	pushw	x
3871  0017 ae0000        	ldw	x,#0
3872  001a 89            	pushw	x
3873  001b ae0000        	ldw	x,#L302
3874  001e cd0000        	call	_assert_failed
3876  0021 5b04          	addw	sp,#4
3877  0023               L074:
3878                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3878                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3880  0023 c65305        	ld	a,21253
3881  0026 a4f3          	and	a,#243
3882  0028 1a01          	or	a,(OFST+1,sp)
3883  002a c75305        	ld	21253,a
3884                     ; 928 }
3887  002d 84            	pop	a
3888  002e 81            	ret
3925                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3925                     ; 941 {
3926                     .text:	section	.text,new
3927  0000               _TIM2_SetIC2Prescaler:
3929  0000 88            	push	a
3930       00000000      OFST:	set	0
3933                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3935  0001 4d            	tnz	a
3936  0002 270c          	jreq	L674
3937  0004 a104          	cp	a,#4
3938  0006 2708          	jreq	L674
3939  0008 a108          	cp	a,#8
3940  000a 2704          	jreq	L674
3941  000c a10c          	cp	a,#12
3942  000e 2603          	jrne	L474
3943  0010               L674:
3944  0010 4f            	clr	a
3945  0011 2010          	jra	L005
3946  0013               L474:
3947  0013 ae03af        	ldw	x,#943
3948  0016 89            	pushw	x
3949  0017 ae0000        	ldw	x,#0
3950  001a 89            	pushw	x
3951  001b ae0000        	ldw	x,#L302
3952  001e cd0000        	call	_assert_failed
3954  0021 5b04          	addw	sp,#4
3955  0023               L005:
3956                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3956                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3958  0023 c65306        	ld	a,21254
3959  0026 a4f3          	and	a,#243
3960  0028 1a01          	or	a,(OFST+1,sp)
3961  002a c75306        	ld	21254,a
3962                     ; 948 }
3965  002d 84            	pop	a
3966  002e 81            	ret
4003                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4003                     ; 961 {
4004                     .text:	section	.text,new
4005  0000               _TIM2_SetIC3Prescaler:
4007  0000 88            	push	a
4008       00000000      OFST:	set	0
4011                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4013  0001 4d            	tnz	a
4014  0002 270c          	jreq	L605
4015  0004 a104          	cp	a,#4
4016  0006 2708          	jreq	L605
4017  0008 a108          	cp	a,#8
4018  000a 2704          	jreq	L605
4019  000c a10c          	cp	a,#12
4020  000e 2603          	jrne	L405
4021  0010               L605:
4022  0010 4f            	clr	a
4023  0011 2010          	jra	L015
4024  0013               L405:
4025  0013 ae03c4        	ldw	x,#964
4026  0016 89            	pushw	x
4027  0017 ae0000        	ldw	x,#0
4028  001a 89            	pushw	x
4029  001b ae0000        	ldw	x,#L302
4030  001e cd0000        	call	_assert_failed
4032  0021 5b04          	addw	sp,#4
4033  0023               L015:
4034                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4034                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
4036  0023 c65307        	ld	a,21255
4037  0026 a4f3          	and	a,#243
4038  0028 1a01          	or	a,(OFST+1,sp)
4039  002a c75307        	ld	21255,a
4040                     ; 968 }
4043  002d 84            	pop	a
4044  002e 81            	ret
4090                     ; 975 uint16_t TIM2_GetCapture1(void)
4090                     ; 976 {
4091                     .text:	section	.text,new
4092  0000               _TIM2_GetCapture1:
4094  0000 5204          	subw	sp,#4
4095       00000004      OFST:	set	4
4098                     ; 978   uint16_t tmpccr1 = 0;
4100  0002 1e03          	ldw	x,(OFST-1,sp)
4101                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
4103  0004 7b01          	ld	a,(OFST-3,sp)
4104  0006 97            	ld	xl,a
4107  0007 7b02          	ld	a,(OFST-2,sp)
4108  0009 97            	ld	xl,a
4109                     ; 981   tmpccr1h = TIM2->CCR1H;
4111  000a c6530f        	ld	a,21263
4112  000d 6b02          	ld	(OFST-2,sp),a
4113                     ; 982   tmpccr1l = TIM2->CCR1L;
4115  000f c65310        	ld	a,21264
4116  0012 6b01          	ld	(OFST-3,sp),a
4117                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
4119  0014 7b01          	ld	a,(OFST-3,sp)
4120  0016 5f            	clrw	x
4121  0017 97            	ld	xl,a
4122  0018 1f03          	ldw	(OFST-1,sp),x
4123                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4125  001a 7b02          	ld	a,(OFST-2,sp)
4126  001c 5f            	clrw	x
4127  001d 97            	ld	xl,a
4128  001e 4f            	clr	a
4129  001f 02            	rlwa	x,a
4130  0020 01            	rrwa	x,a
4131  0021 1a04          	or	a,(OFST+0,sp)
4132  0023 01            	rrwa	x,a
4133  0024 1a03          	or	a,(OFST-1,sp)
4134  0026 01            	rrwa	x,a
4135  0027 1f03          	ldw	(OFST-1,sp),x
4136                     ; 987   return (uint16_t)tmpccr1;
4138  0029 1e03          	ldw	x,(OFST-1,sp)
4141  002b 5b04          	addw	sp,#4
4142  002d 81            	ret
4188                     ; 995 uint16_t TIM2_GetCapture2(void)
4188                     ; 996 {
4189                     .text:	section	.text,new
4190  0000               _TIM2_GetCapture2:
4192  0000 5204          	subw	sp,#4
4193       00000004      OFST:	set	4
4196                     ; 998   uint16_t tmpccr2 = 0;
4198  0002 1e03          	ldw	x,(OFST-1,sp)
4199                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
4201  0004 7b01          	ld	a,(OFST-3,sp)
4202  0006 97            	ld	xl,a
4205  0007 7b02          	ld	a,(OFST-2,sp)
4206  0009 97            	ld	xl,a
4207                     ; 1001   tmpccr2h = TIM2->CCR2H;
4209  000a c65311        	ld	a,21265
4210  000d 6b02          	ld	(OFST-2,sp),a
4211                     ; 1002   tmpccr2l = TIM2->CCR2L;
4213  000f c65312        	ld	a,21266
4214  0012 6b01          	ld	(OFST-3,sp),a
4215                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4217  0014 7b01          	ld	a,(OFST-3,sp)
4218  0016 5f            	clrw	x
4219  0017 97            	ld	xl,a
4220  0018 1f03          	ldw	(OFST-1,sp),x
4221                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4223  001a 7b02          	ld	a,(OFST-2,sp)
4224  001c 5f            	clrw	x
4225  001d 97            	ld	xl,a
4226  001e 4f            	clr	a
4227  001f 02            	rlwa	x,a
4228  0020 01            	rrwa	x,a
4229  0021 1a04          	or	a,(OFST+0,sp)
4230  0023 01            	rrwa	x,a
4231  0024 1a03          	or	a,(OFST-1,sp)
4232  0026 01            	rrwa	x,a
4233  0027 1f03          	ldw	(OFST-1,sp),x
4234                     ; 1007   return (uint16_t)tmpccr2;
4236  0029 1e03          	ldw	x,(OFST-1,sp)
4239  002b 5b04          	addw	sp,#4
4240  002d 81            	ret
4286                     ; 1015 uint16_t TIM2_GetCapture3(void)
4286                     ; 1016 {
4287                     .text:	section	.text,new
4288  0000               _TIM2_GetCapture3:
4290  0000 5204          	subw	sp,#4
4291       00000004      OFST:	set	4
4294                     ; 1018   uint16_t tmpccr3 = 0;
4296  0002 1e03          	ldw	x,(OFST-1,sp)
4297                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4299  0004 7b01          	ld	a,(OFST-3,sp)
4300  0006 97            	ld	xl,a
4303  0007 7b02          	ld	a,(OFST-2,sp)
4304  0009 97            	ld	xl,a
4305                     ; 1021   tmpccr3h = TIM2->CCR3H;
4307  000a c65313        	ld	a,21267
4308  000d 6b02          	ld	(OFST-2,sp),a
4309                     ; 1022   tmpccr3l = TIM2->CCR3L;
4311  000f c65314        	ld	a,21268
4312  0012 6b01          	ld	(OFST-3,sp),a
4313                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4315  0014 7b01          	ld	a,(OFST-3,sp)
4316  0016 5f            	clrw	x
4317  0017 97            	ld	xl,a
4318  0018 1f03          	ldw	(OFST-1,sp),x
4319                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4321  001a 7b02          	ld	a,(OFST-2,sp)
4322  001c 5f            	clrw	x
4323  001d 97            	ld	xl,a
4324  001e 4f            	clr	a
4325  001f 02            	rlwa	x,a
4326  0020 01            	rrwa	x,a
4327  0021 1a04          	or	a,(OFST+0,sp)
4328  0023 01            	rrwa	x,a
4329  0024 1a03          	or	a,(OFST-1,sp)
4330  0026 01            	rrwa	x,a
4331  0027 1f03          	ldw	(OFST-1,sp),x
4332                     ; 1027   return (uint16_t)tmpccr3;
4334  0029 1e03          	ldw	x,(OFST-1,sp)
4337  002b 5b04          	addw	sp,#4
4338  002d 81            	ret
4370                     ; 1035 uint16_t TIM2_GetCounter(void)
4370                     ; 1036 {
4371                     .text:	section	.text,new
4372  0000               _TIM2_GetCounter:
4374  0000 89            	pushw	x
4375       00000002      OFST:	set	2
4378                     ; 1037   uint16_t tmpcntr = 0;
4380  0001 5f            	clrw	x
4381  0002 1f01          	ldw	(OFST-1,sp),x
4382                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4384  0004 c6530a        	ld	a,21258
4385  0007 5f            	clrw	x
4386  0008 97            	ld	xl,a
4387  0009 4f            	clr	a
4388  000a 02            	rlwa	x,a
4389  000b 1f01          	ldw	(OFST-1,sp),x
4390                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4392  000d c6530b        	ld	a,21259
4393  0010 5f            	clrw	x
4394  0011 97            	ld	xl,a
4395  0012 01            	rrwa	x,a
4396  0013 1a02          	or	a,(OFST+0,sp)
4397  0015 01            	rrwa	x,a
4398  0016 1a01          	or	a,(OFST-1,sp)
4399  0018 01            	rrwa	x,a
4402  0019 5b02          	addw	sp,#2
4403  001b 81            	ret
4427                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4427                     ; 1050 {
4428                     .text:	section	.text,new
4429  0000               _TIM2_GetPrescaler:
4433                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4435  0000 c6530c        	ld	a,21260
4438  0003 81            	ret
4574                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4574                     ; 1069 {
4575                     .text:	section	.text,new
4576  0000               _TIM2_GetFlagStatus:
4578  0000 89            	pushw	x
4579  0001 89            	pushw	x
4580       00000002      OFST:	set	2
4583                     ; 1070   FlagStatus bitstatus = RESET;
4585  0002 7b02          	ld	a,(OFST+0,sp)
4586  0004 97            	ld	xl,a
4587                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4589  0005 7b01          	ld	a,(OFST-1,sp)
4590  0007 97            	ld	xl,a
4593  0008 7b02          	ld	a,(OFST+0,sp)
4594  000a 97            	ld	xl,a
4595                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4597  000b 1e03          	ldw	x,(OFST+1,sp)
4598  000d a30001        	cpw	x,#1
4599  0010 272a          	jreq	L035
4600  0012 1e03          	ldw	x,(OFST+1,sp)
4601  0014 a30002        	cpw	x,#2
4602  0017 2723          	jreq	L035
4603  0019 1e03          	ldw	x,(OFST+1,sp)
4604  001b a30004        	cpw	x,#4
4605  001e 271c          	jreq	L035
4606  0020 1e03          	ldw	x,(OFST+1,sp)
4607  0022 a30008        	cpw	x,#8
4608  0025 2715          	jreq	L035
4609  0027 1e03          	ldw	x,(OFST+1,sp)
4610  0029 a30200        	cpw	x,#512
4611  002c 270e          	jreq	L035
4612  002e 1e03          	ldw	x,(OFST+1,sp)
4613  0030 a30400        	cpw	x,#1024
4614  0033 2707          	jreq	L035
4615  0035 1e03          	ldw	x,(OFST+1,sp)
4616  0037 a30800        	cpw	x,#2048
4617  003a 2603          	jrne	L625
4618  003c               L035:
4619  003c 4f            	clr	a
4620  003d 2010          	jra	L235
4621  003f               L625:
4622  003f ae0432        	ldw	x,#1074
4623  0042 89            	pushw	x
4624  0043 ae0000        	ldw	x,#0
4625  0046 89            	pushw	x
4626  0047 ae0000        	ldw	x,#L302
4627  004a cd0000        	call	_assert_failed
4629  004d 5b04          	addw	sp,#4
4630  004f               L235:
4631                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4633  004f c65302        	ld	a,21250
4634  0052 1404          	and	a,(OFST+2,sp)
4635  0054 6b01          	ld	(OFST-1,sp),a
4636                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4638  0056 7b03          	ld	a,(OFST+1,sp)
4639  0058 6b02          	ld	(OFST+0,sp),a
4640                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4642  005a c65303        	ld	a,21251
4643  005d 1402          	and	a,(OFST+0,sp)
4644  005f 1a01          	or	a,(OFST-1,sp)
4645  0061 2706          	jreq	L5561
4646                     ; 1081     bitstatus = SET;
4648  0063 a601          	ld	a,#1
4649  0065 6b02          	ld	(OFST+0,sp),a
4651  0067 2002          	jra	L7561
4652  0069               L5561:
4653                     ; 1085     bitstatus = RESET;
4655  0069 0f02          	clr	(OFST+0,sp)
4656  006b               L7561:
4657                     ; 1087   return (FlagStatus)bitstatus;
4659  006b 7b02          	ld	a,(OFST+0,sp)
4662  006d 5b04          	addw	sp,#4
4663  006f 81            	ret
4699                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4699                     ; 1104 {
4700                     .text:	section	.text,new
4701  0000               _TIM2_ClearFlag:
4703  0000 89            	pushw	x
4704       00000000      OFST:	set	0
4707                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4709  0001 01            	rrwa	x,a
4710  0002 a4f0          	and	a,#240
4711  0004 01            	rrwa	x,a
4712  0005 a4f1          	and	a,#241
4713  0007 01            	rrwa	x,a
4714  0008 a30000        	cpw	x,#0
4715  000b 2607          	jrne	L635
4716  000d 1e01          	ldw	x,(OFST+1,sp)
4717  000f 2703          	jreq	L635
4718  0011 4f            	clr	a
4719  0012 2010          	jra	L045
4720  0014               L635:
4721  0014 ae0452        	ldw	x,#1106
4722  0017 89            	pushw	x
4723  0018 ae0000        	ldw	x,#0
4724  001b 89            	pushw	x
4725  001c ae0000        	ldw	x,#L302
4726  001f cd0000        	call	_assert_failed
4728  0022 5b04          	addw	sp,#4
4729  0024               L045:
4730                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4732  0024 7b02          	ld	a,(OFST+2,sp)
4733  0026 43            	cpl	a
4734  0027 c75302        	ld	21250,a
4735                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4737  002a 35ff5303      	mov	21251,#255
4738                     ; 1111 }
4741  002e 85            	popw	x
4742  002f 81            	ret
4803                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4803                     ; 1124 {
4804                     .text:	section	.text,new
4805  0000               _TIM2_GetITStatus:
4807  0000 88            	push	a
4808  0001 89            	pushw	x
4809       00000002      OFST:	set	2
4812                     ; 1125   ITStatus bitstatus = RESET;
4814  0002 7b02          	ld	a,(OFST+0,sp)
4815  0004 97            	ld	xl,a
4816                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4818  0005 7b01          	ld	a,(OFST-1,sp)
4819  0007 97            	ld	xl,a
4822  0008 7b02          	ld	a,(OFST+0,sp)
4823  000a 97            	ld	xl,a
4824                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4826  000b 7b03          	ld	a,(OFST+1,sp)
4827  000d a101          	cp	a,#1
4828  000f 2712          	jreq	L645
4829  0011 7b03          	ld	a,(OFST+1,sp)
4830  0013 a102          	cp	a,#2
4831  0015 270c          	jreq	L645
4832  0017 7b03          	ld	a,(OFST+1,sp)
4833  0019 a104          	cp	a,#4
4834  001b 2706          	jreq	L645
4835  001d 7b03          	ld	a,(OFST+1,sp)
4836  001f a108          	cp	a,#8
4837  0021 2603          	jrne	L445
4838  0023               L645:
4839  0023 4f            	clr	a
4840  0024 2010          	jra	L055
4841  0026               L445:
4842  0026 ae0469        	ldw	x,#1129
4843  0029 89            	pushw	x
4844  002a ae0000        	ldw	x,#0
4845  002d 89            	pushw	x
4846  002e ae0000        	ldw	x,#L302
4847  0031 cd0000        	call	_assert_failed
4849  0034 5b04          	addw	sp,#4
4850  0036               L055:
4851                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4853  0036 c65302        	ld	a,21250
4854  0039 1403          	and	a,(OFST+1,sp)
4855  003b 6b01          	ld	(OFST-1,sp),a
4856                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4858  003d c65301        	ld	a,21249
4859  0040 1403          	and	a,(OFST+1,sp)
4860  0042 6b02          	ld	(OFST+0,sp),a
4861                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4863  0044 0d01          	tnz	(OFST-1,sp)
4864  0046 270a          	jreq	L5271
4866  0048 0d02          	tnz	(OFST+0,sp)
4867  004a 2706          	jreq	L5271
4868                     ; 1137     bitstatus = SET;
4870  004c a601          	ld	a,#1
4871  004e 6b02          	ld	(OFST+0,sp),a
4873  0050 2002          	jra	L7271
4874  0052               L5271:
4875                     ; 1141     bitstatus = RESET;
4877  0052 0f02          	clr	(OFST+0,sp)
4878  0054               L7271:
4879                     ; 1143   return (ITStatus)(bitstatus);
4881  0054 7b02          	ld	a,(OFST+0,sp)
4884  0056 5b03          	addw	sp,#3
4885  0058 81            	ret
4922                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4922                     ; 1157 {
4923                     .text:	section	.text,new
4924  0000               _TIM2_ClearITPendingBit:
4926  0000 88            	push	a
4927       00000000      OFST:	set	0
4930                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4932  0001 4d            	tnz	a
4933  0002 2707          	jreq	L455
4934  0004 a110          	cp	a,#16
4935  0006 2403          	jruge	L455
4936  0008 4f            	clr	a
4937  0009 2010          	jra	L655
4938  000b               L455:
4939  000b ae0487        	ldw	x,#1159
4940  000e 89            	pushw	x
4941  000f ae0000        	ldw	x,#0
4942  0012 89            	pushw	x
4943  0013 ae0000        	ldw	x,#L302
4944  0016 cd0000        	call	_assert_failed
4946  0019 5b04          	addw	sp,#4
4947  001b               L655:
4948                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4950  001b 7b01          	ld	a,(OFST+1,sp)
4951  001d 43            	cpl	a
4952  001e c75302        	ld	21250,a
4953                     ; 1163 }
4956  0021 84            	pop	a
4957  0022 81            	ret
5003                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
5003                     ; 1182                        uint8_t TIM2_ICSelection,
5003                     ; 1183                        uint8_t TIM2_ICFilter)
5003                     ; 1184 {
5004                     .text:	section	.text,new
5005  0000               L3_TI1_Config:
5007  0000 89            	pushw	x
5008  0001 88            	push	a
5009       00000001      OFST:	set	1
5012                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5014  0002 72115308      	bres	21256,#0
5015                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5015                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5017  0006 7b06          	ld	a,(OFST+5,sp)
5018  0008 97            	ld	xl,a
5019  0009 a610          	ld	a,#16
5020  000b 42            	mul	x,a
5021  000c 9f            	ld	a,xl
5022  000d 1a03          	or	a,(OFST+2,sp)
5023  000f 6b01          	ld	(OFST+0,sp),a
5024  0011 c65305        	ld	a,21253
5025  0014 a40c          	and	a,#12
5026  0016 1a01          	or	a,(OFST+0,sp)
5027  0018 c75305        	ld	21253,a
5028                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5030  001b 0d02          	tnz	(OFST+1,sp)
5031  001d 2706          	jreq	L7671
5032                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
5034  001f 72125308      	bset	21256,#1
5036  0023 2004          	jra	L1771
5037  0025               L7671:
5038                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5040  0025 72135308      	bres	21256,#1
5041  0029               L1771:
5042                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
5044  0029 72105308      	bset	21256,#0
5045                     ; 1203 }
5048  002d 5b03          	addw	sp,#3
5049  002f 81            	ret
5095                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
5095                     ; 1222                        uint8_t TIM2_ICSelection,
5095                     ; 1223                        uint8_t TIM2_ICFilter)
5095                     ; 1224 {
5096                     .text:	section	.text,new
5097  0000               L5_TI2_Config:
5099  0000 89            	pushw	x
5100  0001 88            	push	a
5101       00000001      OFST:	set	1
5104                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5106  0002 72195308      	bres	21256,#4
5107                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5107                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5109  0006 7b06          	ld	a,(OFST+5,sp)
5110  0008 97            	ld	xl,a
5111  0009 a610          	ld	a,#16
5112  000b 42            	mul	x,a
5113  000c 9f            	ld	a,xl
5114  000d 1a03          	or	a,(OFST+2,sp)
5115  000f 6b01          	ld	(OFST+0,sp),a
5116  0011 c65306        	ld	a,21254
5117  0014 a40c          	and	a,#12
5118  0016 1a01          	or	a,(OFST+0,sp)
5119  0018 c75306        	ld	21254,a
5120                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5122  001b 0d02          	tnz	(OFST+1,sp)
5123  001d 2706          	jreq	L3102
5124                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
5126  001f 721a5308      	bset	21256,#5
5128  0023 2004          	jra	L5102
5129  0025               L3102:
5130                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5132  0025 721b5308      	bres	21256,#5
5133  0029               L5102:
5134                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
5136  0029 72185308      	bset	21256,#4
5137                     ; 1245 }
5140  002d 5b03          	addw	sp,#3
5141  002f 81            	ret
5187                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5187                     ; 1262                        uint8_t TIM2_ICFilter)
5187                     ; 1263 {
5188                     .text:	section	.text,new
5189  0000               L7_TI3_Config:
5191  0000 89            	pushw	x
5192  0001 88            	push	a
5193       00000001      OFST:	set	1
5196                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5198  0002 72115309      	bres	21257,#0
5199                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5199                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5201  0006 7b06          	ld	a,(OFST+5,sp)
5202  0008 97            	ld	xl,a
5203  0009 a610          	ld	a,#16
5204  000b 42            	mul	x,a
5205  000c 9f            	ld	a,xl
5206  000d 1a03          	or	a,(OFST+2,sp)
5207  000f 6b01          	ld	(OFST+0,sp),a
5208  0011 c65307        	ld	a,21255
5209  0014 a40c          	and	a,#12
5210  0016 1a01          	or	a,(OFST+0,sp)
5211  0018 c75307        	ld	21255,a
5212                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5214  001b 0d02          	tnz	(OFST+1,sp)
5215  001d 2706          	jreq	L7302
5216                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
5218  001f 72125309      	bset	21257,#1
5220  0023 2004          	jra	L1402
5221  0025               L7302:
5222                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5224  0025 72135309      	bres	21257,#1
5225  0029               L1402:
5226                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
5228  0029 72105309      	bset	21257,#0
5229                     ; 1283 }
5232  002d 5b03          	addw	sp,#3
5233  002f 81            	ret
5246                     	xdef	_TIM2_ClearITPendingBit
5247                     	xdef	_TIM2_GetITStatus
5248                     	xdef	_TIM2_ClearFlag
5249                     	xdef	_TIM2_GetFlagStatus
5250                     	xdef	_TIM2_GetPrescaler
5251                     	xdef	_TIM2_GetCounter
5252                     	xdef	_TIM2_GetCapture3
5253                     	xdef	_TIM2_GetCapture2
5254                     	xdef	_TIM2_GetCapture1
5255                     	xdef	_TIM2_SetIC3Prescaler
5256                     	xdef	_TIM2_SetIC2Prescaler
5257                     	xdef	_TIM2_SetIC1Prescaler
5258                     	xdef	_TIM2_SetCompare3
5259                     	xdef	_TIM2_SetCompare2
5260                     	xdef	_TIM2_SetCompare1
5261                     	xdef	_TIM2_SetAutoreload
5262                     	xdef	_TIM2_SetCounter
5263                     	xdef	_TIM2_SelectOCxM
5264                     	xdef	_TIM2_CCxCmd
5265                     	xdef	_TIM2_OC3PolarityConfig
5266                     	xdef	_TIM2_OC2PolarityConfig
5267                     	xdef	_TIM2_OC1PolarityConfig
5268                     	xdef	_TIM2_GenerateEvent
5269                     	xdef	_TIM2_OC3PreloadConfig
5270                     	xdef	_TIM2_OC2PreloadConfig
5271                     	xdef	_TIM2_OC1PreloadConfig
5272                     	xdef	_TIM2_ARRPreloadConfig
5273                     	xdef	_TIM2_ForcedOC3Config
5274                     	xdef	_TIM2_ForcedOC2Config
5275                     	xdef	_TIM2_ForcedOC1Config
5276                     	xdef	_TIM2_PrescalerConfig
5277                     	xdef	_TIM2_SelectOnePulseMode
5278                     	xdef	_TIM2_UpdateRequestConfig
5279                     	xdef	_TIM2_UpdateDisableConfig
5280                     	xdef	_TIM2_ITConfig
5281                     	xdef	_TIM2_Cmd
5282                     	xdef	_TIM2_PWMIConfig
5283                     	xdef	_TIM2_ICInit
5284                     	xdef	_TIM2_OC3Init
5285                     	xdef	_TIM2_OC2Init
5286                     	xdef	_TIM2_OC1Init
5287                     	xdef	_TIM2_TimeBaseInit
5288                     	xdef	_TIM2_DeInit
5289                     	xref	_assert_failed
5290                     .const:	section	.text
5291  0000               L302:
5292  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
5293  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
5294  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
5295  0036 6d322e6300    	dc.b	"m2.c",0
5315                     	end
