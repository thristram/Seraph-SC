   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 51 void TIM3_DeInit(void)
  32                     ; 52 {
  34                     .text:	section	.text,new
  35  0000               _TIM3_DeInit:
  39                     ; 53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  41  0000 725f5320      	clr	21280
  42                     ; 54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  44  0004 725f5321      	clr	21281
  45                     ; 55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  47  0008 725f5323      	clr	21283
  48                     ; 58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  50  000c 725f5327      	clr	21287
  51                     ; 61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  53  0010 725f5327      	clr	21287
  54                     ; 62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  56  0014 725f5325      	clr	21285
  57                     ; 63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  59  0018 725f5326      	clr	21286
  60                     ; 64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  62  001c 725f5328      	clr	21288
  63                     ; 65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  65  0020 725f5329      	clr	21289
  66                     ; 66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  68  0024 725f532a      	clr	21290
  69                     ; 67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  71  0028 35ff532b      	mov	21291,#255
  72                     ; 68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  74  002c 35ff532c      	mov	21292,#255
  75                     ; 69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  77  0030 725f532d      	clr	21293
  78                     ; 70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  80  0034 725f532e      	clr	21294
  81                     ; 71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  83  0038 725f532f      	clr	21295
  84                     ; 72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  86  003c 725f5330      	clr	21296
  87                     ; 73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  89  0040 725f5322      	clr	21282
  90                     ; 74 }
  93  0044 81            	ret
 259                     ; 82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 259                     ; 83                         uint16_t TIM3_Period)
 259                     ; 84 {
 260                     .text:	section	.text,new
 261  0000               _TIM3_TimeBaseInit:
 263  0000 88            	push	a
 264       00000000      OFST:	set	0
 267                     ; 86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 269  0001 c7532a        	ld	21290,a
 270                     ; 88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 272  0004 7b04          	ld	a,(OFST+4,sp)
 273  0006 c7532b        	ld	21291,a
 274                     ; 89   TIM3->ARRL = (uint8_t)(TIM3_Period);
 276  0009 7b05          	ld	a,(OFST+5,sp)
 277  000b c7532c        	ld	21292,a
 278                     ; 90 }
 281  000e 84            	pop	a
 282  000f 81            	ret
 438                     ; 100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 438                     ; 101                   TIM3_OutputState_TypeDef TIM3_OutputState,
 438                     ; 102                   uint16_t TIM3_Pulse,
 438                     ; 103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 438                     ; 104 {
 439                     .text:	section	.text,new
 440  0000               _TIM3_OC1Init:
 442  0000 89            	pushw	x
 443  0001 88            	push	a
 444       00000001      OFST:	set	1
 447                     ; 106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 449  0002 9e            	ld	a,xh
 450  0003 4d            	tnz	a
 451  0004 2719          	jreq	L41
 452  0006 9e            	ld	a,xh
 453  0007 a110          	cp	a,#16
 454  0009 2714          	jreq	L41
 455  000b 9e            	ld	a,xh
 456  000c a120          	cp	a,#32
 457  000e 270f          	jreq	L41
 458  0010 9e            	ld	a,xh
 459  0011 a130          	cp	a,#48
 460  0013 270a          	jreq	L41
 461  0015 9e            	ld	a,xh
 462  0016 a160          	cp	a,#96
 463  0018 2705          	jreq	L41
 464  001a 9e            	ld	a,xh
 465  001b a170          	cp	a,#112
 466  001d 2603          	jrne	L21
 467  001f               L41:
 468  001f 4f            	clr	a
 469  0020 2010          	jra	L61
 470  0022               L21:
 471  0022 ae006a        	ldw	x,#106
 472  0025 89            	pushw	x
 473  0026 ae0000        	ldw	x,#0
 474  0029 89            	pushw	x
 475  002a ae0000        	ldw	x,#L102
 476  002d cd0000        	call	_assert_failed
 478  0030 5b04          	addw	sp,#4
 479  0032               L61:
 480                     ; 107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 482  0032 0d03          	tnz	(OFST+2,sp)
 483  0034 2706          	jreq	L22
 484  0036 7b03          	ld	a,(OFST+2,sp)
 485  0038 a111          	cp	a,#17
 486  003a 2603          	jrne	L02
 487  003c               L22:
 488  003c 4f            	clr	a
 489  003d 2010          	jra	L42
 490  003f               L02:
 491  003f ae006b        	ldw	x,#107
 492  0042 89            	pushw	x
 493  0043 ae0000        	ldw	x,#0
 494  0046 89            	pushw	x
 495  0047 ae0000        	ldw	x,#L102
 496  004a cd0000        	call	_assert_failed
 498  004d 5b04          	addw	sp,#4
 499  004f               L42:
 500                     ; 108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 502  004f 0d08          	tnz	(OFST+7,sp)
 503  0051 2706          	jreq	L03
 504  0053 7b08          	ld	a,(OFST+7,sp)
 505  0055 a122          	cp	a,#34
 506  0057 2603          	jrne	L62
 507  0059               L03:
 508  0059 4f            	clr	a
 509  005a 2010          	jra	L23
 510  005c               L62:
 511  005c ae006c        	ldw	x,#108
 512  005f 89            	pushw	x
 513  0060 ae0000        	ldw	x,#0
 514  0063 89            	pushw	x
 515  0064 ae0000        	ldw	x,#L102
 516  0067 cd0000        	call	_assert_failed
 518  006a 5b04          	addw	sp,#4
 519  006c               L23:
 520                     ; 111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 522  006c c65327        	ld	a,21287
 523  006f a4fc          	and	a,#252
 524  0071 c75327        	ld	21287,a
 525                     ; 113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 527  0074 7b08          	ld	a,(OFST+7,sp)
 528  0076 a402          	and	a,#2
 529  0078 6b01          	ld	(OFST+0,sp),a
 530  007a 7b03          	ld	a,(OFST+2,sp)
 531  007c a401          	and	a,#1
 532  007e 1a01          	or	a,(OFST+0,sp)
 533  0080 ca5327        	or	a,21287
 534  0083 c75327        	ld	21287,a
 535                     ; 116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 537  0086 c65325        	ld	a,21285
 538  0089 a48f          	and	a,#143
 539  008b 1a02          	or	a,(OFST+1,sp)
 540  008d c75325        	ld	21285,a
 541                     ; 119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 543  0090 7b06          	ld	a,(OFST+5,sp)
 544  0092 c7532d        	ld	21293,a
 545                     ; 120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 547  0095 7b07          	ld	a,(OFST+6,sp)
 548  0097 c7532e        	ld	21294,a
 549                     ; 121 }
 552  009a 5b03          	addw	sp,#3
 553  009c 81            	ret
 616                     ; 131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 616                     ; 132                   TIM3_OutputState_TypeDef TIM3_OutputState,
 616                     ; 133                   uint16_t TIM3_Pulse,
 616                     ; 134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 616                     ; 135 {
 617                     .text:	section	.text,new
 618  0000               _TIM3_OC2Init:
 620  0000 89            	pushw	x
 621  0001 88            	push	a
 622       00000001      OFST:	set	1
 625                     ; 137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 627  0002 9e            	ld	a,xh
 628  0003 4d            	tnz	a
 629  0004 2719          	jreq	L04
 630  0006 9e            	ld	a,xh
 631  0007 a110          	cp	a,#16
 632  0009 2714          	jreq	L04
 633  000b 9e            	ld	a,xh
 634  000c a120          	cp	a,#32
 635  000e 270f          	jreq	L04
 636  0010 9e            	ld	a,xh
 637  0011 a130          	cp	a,#48
 638  0013 270a          	jreq	L04
 639  0015 9e            	ld	a,xh
 640  0016 a160          	cp	a,#96
 641  0018 2705          	jreq	L04
 642  001a 9e            	ld	a,xh
 643  001b a170          	cp	a,#112
 644  001d 2603          	jrne	L63
 645  001f               L04:
 646  001f 4f            	clr	a
 647  0020 2010          	jra	L24
 648  0022               L63:
 649  0022 ae0089        	ldw	x,#137
 650  0025 89            	pushw	x
 651  0026 ae0000        	ldw	x,#0
 652  0029 89            	pushw	x
 653  002a ae0000        	ldw	x,#L102
 654  002d cd0000        	call	_assert_failed
 656  0030 5b04          	addw	sp,#4
 657  0032               L24:
 658                     ; 138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 660  0032 0d03          	tnz	(OFST+2,sp)
 661  0034 2706          	jreq	L64
 662  0036 7b03          	ld	a,(OFST+2,sp)
 663  0038 a111          	cp	a,#17
 664  003a 2603          	jrne	L44
 665  003c               L64:
 666  003c 4f            	clr	a
 667  003d 2010          	jra	L05
 668  003f               L44:
 669  003f ae008a        	ldw	x,#138
 670  0042 89            	pushw	x
 671  0043 ae0000        	ldw	x,#0
 672  0046 89            	pushw	x
 673  0047 ae0000        	ldw	x,#L102
 674  004a cd0000        	call	_assert_failed
 676  004d 5b04          	addw	sp,#4
 677  004f               L05:
 678                     ; 139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 680  004f 0d08          	tnz	(OFST+7,sp)
 681  0051 2706          	jreq	L45
 682  0053 7b08          	ld	a,(OFST+7,sp)
 683  0055 a122          	cp	a,#34
 684  0057 2603          	jrne	L25
 685  0059               L45:
 686  0059 4f            	clr	a
 687  005a 2010          	jra	L65
 688  005c               L25:
 689  005c ae008b        	ldw	x,#139
 690  005f 89            	pushw	x
 691  0060 ae0000        	ldw	x,#0
 692  0063 89            	pushw	x
 693  0064 ae0000        	ldw	x,#L102
 694  0067 cd0000        	call	_assert_failed
 696  006a 5b04          	addw	sp,#4
 697  006c               L65:
 698                     ; 143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 700  006c c65327        	ld	a,21287
 701  006f a4cf          	and	a,#207
 702  0071 c75327        	ld	21287,a
 703                     ; 145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 705  0074 7b08          	ld	a,(OFST+7,sp)
 706  0076 a420          	and	a,#32
 707  0078 6b01          	ld	(OFST+0,sp),a
 708  007a 7b03          	ld	a,(OFST+2,sp)
 709  007c a410          	and	a,#16
 710  007e 1a01          	or	a,(OFST+0,sp)
 711  0080 ca5327        	or	a,21287
 712  0083 c75327        	ld	21287,a
 713                     ; 149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 715  0086 c65326        	ld	a,21286
 716  0089 a48f          	and	a,#143
 717  008b 1a02          	or	a,(OFST+1,sp)
 718  008d c75326        	ld	21286,a
 719                     ; 153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 721  0090 7b06          	ld	a,(OFST+5,sp)
 722  0092 c7532f        	ld	21295,a
 723                     ; 154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 725  0095 7b07          	ld	a,(OFST+6,sp)
 726  0097 c75330        	ld	21296,a
 727                     ; 155 }
 730  009a 5b03          	addw	sp,#3
 731  009c 81            	ret
 914                     ; 166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 914                     ; 167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 914                     ; 168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 914                     ; 169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 914                     ; 170                  uint8_t TIM3_ICFilter)
 914                     ; 171 {
 915                     .text:	section	.text,new
 916  0000               _TIM3_ICInit:
 918  0000 89            	pushw	x
 919       00000000      OFST:	set	0
 922                     ; 173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 924  0001 9e            	ld	a,xh
 925  0002 4d            	tnz	a
 926  0003 2705          	jreq	L46
 927  0005 9e            	ld	a,xh
 928  0006 a101          	cp	a,#1
 929  0008 2603          	jrne	L26
 930  000a               L46:
 931  000a 4f            	clr	a
 932  000b 2010          	jra	L66
 933  000d               L26:
 934  000d ae00ad        	ldw	x,#173
 935  0010 89            	pushw	x
 936  0011 ae0000        	ldw	x,#0
 937  0014 89            	pushw	x
 938  0015 ae0000        	ldw	x,#L102
 939  0018 cd0000        	call	_assert_failed
 941  001b 5b04          	addw	sp,#4
 942  001d               L66:
 943                     ; 174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 945  001d 0d02          	tnz	(OFST+2,sp)
 946  001f 2706          	jreq	L27
 947  0021 7b02          	ld	a,(OFST+2,sp)
 948  0023 a144          	cp	a,#68
 949  0025 2603          	jrne	L07
 950  0027               L27:
 951  0027 4f            	clr	a
 952  0028 2010          	jra	L47
 953  002a               L07:
 954  002a ae00ae        	ldw	x,#174
 955  002d 89            	pushw	x
 956  002e ae0000        	ldw	x,#0
 957  0031 89            	pushw	x
 958  0032 ae0000        	ldw	x,#L102
 959  0035 cd0000        	call	_assert_failed
 961  0038 5b04          	addw	sp,#4
 962  003a               L47:
 963                     ; 175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 965  003a 7b05          	ld	a,(OFST+5,sp)
 966  003c a101          	cp	a,#1
 967  003e 270c          	jreq	L001
 968  0040 7b05          	ld	a,(OFST+5,sp)
 969  0042 a102          	cp	a,#2
 970  0044 2706          	jreq	L001
 971  0046 7b05          	ld	a,(OFST+5,sp)
 972  0048 a103          	cp	a,#3
 973  004a 2603          	jrne	L67
 974  004c               L001:
 975  004c 4f            	clr	a
 976  004d 2010          	jra	L201
 977  004f               L67:
 978  004f ae00af        	ldw	x,#175
 979  0052 89            	pushw	x
 980  0053 ae0000        	ldw	x,#0
 981  0056 89            	pushw	x
 982  0057 ae0000        	ldw	x,#L102
 983  005a cd0000        	call	_assert_failed
 985  005d 5b04          	addw	sp,#4
 986  005f               L201:
 987                     ; 176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 989  005f 0d06          	tnz	(OFST+6,sp)
 990  0061 2712          	jreq	L601
 991  0063 7b06          	ld	a,(OFST+6,sp)
 992  0065 a104          	cp	a,#4
 993  0067 270c          	jreq	L601
 994  0069 7b06          	ld	a,(OFST+6,sp)
 995  006b a108          	cp	a,#8
 996  006d 2706          	jreq	L601
 997  006f 7b06          	ld	a,(OFST+6,sp)
 998  0071 a10c          	cp	a,#12
 999  0073 2603          	jrne	L401
1000  0075               L601:
1001  0075 4f            	clr	a
1002  0076 2010          	jra	L011
1003  0078               L401:
1004  0078 ae00b0        	ldw	x,#176
1005  007b 89            	pushw	x
1006  007c ae0000        	ldw	x,#0
1007  007f 89            	pushw	x
1008  0080 ae0000        	ldw	x,#L102
1009  0083 cd0000        	call	_assert_failed
1011  0086 5b04          	addw	sp,#4
1012  0088               L011:
1013                     ; 177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1015  0088 7b07          	ld	a,(OFST+7,sp)
1016  008a a110          	cp	a,#16
1017  008c 2403          	jruge	L211
1018  008e 4f            	clr	a
1019  008f 2010          	jra	L411
1020  0091               L211:
1021  0091 ae00b1        	ldw	x,#177
1022  0094 89            	pushw	x
1023  0095 ae0000        	ldw	x,#0
1024  0098 89            	pushw	x
1025  0099 ae0000        	ldw	x,#L102
1026  009c cd0000        	call	_assert_failed
1028  009f 5b04          	addw	sp,#4
1029  00a1               L411:
1030                     ; 179   if (TIM3_Channel != TIM3_CHANNEL_2)
1032  00a1 7b01          	ld	a,(OFST+1,sp)
1033  00a3 a101          	cp	a,#1
1034  00a5 2714          	jreq	L533
1035                     ; 182     TI1_Config((uint8_t)TIM3_ICPolarity,
1035                     ; 183                (uint8_t)TIM3_ICSelection,
1035                     ; 184                (uint8_t)TIM3_ICFilter);
1037  00a7 7b07          	ld	a,(OFST+7,sp)
1038  00a9 88            	push	a
1039  00aa 7b06          	ld	a,(OFST+6,sp)
1040  00ac 97            	ld	xl,a
1041  00ad 7b03          	ld	a,(OFST+3,sp)
1042  00af 95            	ld	xh,a
1043  00b0 cd0000        	call	L3_TI1_Config
1045  00b3 84            	pop	a
1046                     ; 187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1048  00b4 7b06          	ld	a,(OFST+6,sp)
1049  00b6 cd0000        	call	_TIM3_SetIC1Prescaler
1052  00b9 2012          	jra	L733
1053  00bb               L533:
1054                     ; 192     TI2_Config((uint8_t)TIM3_ICPolarity,
1054                     ; 193                (uint8_t)TIM3_ICSelection,
1054                     ; 194                (uint8_t)TIM3_ICFilter);
1056  00bb 7b07          	ld	a,(OFST+7,sp)
1057  00bd 88            	push	a
1058  00be 7b06          	ld	a,(OFST+6,sp)
1059  00c0 97            	ld	xl,a
1060  00c1 7b03          	ld	a,(OFST+3,sp)
1061  00c3 95            	ld	xh,a
1062  00c4 cd0000        	call	L5_TI2_Config
1064  00c7 84            	pop	a
1065                     ; 197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1067  00c8 7b06          	ld	a,(OFST+6,sp)
1068  00ca cd0000        	call	_TIM3_SetIC2Prescaler
1070  00cd               L733:
1071                     ; 199 }
1074  00cd 85            	popw	x
1075  00ce 81            	ret
1166                     ; 210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1166                     ; 211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1166                     ; 212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1166                     ; 213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1166                     ; 214                      uint8_t TIM3_ICFilter)
1166                     ; 215 {
1167                     .text:	section	.text,new
1168  0000               _TIM3_PWMIConfig:
1170  0000 89            	pushw	x
1171  0001 89            	pushw	x
1172       00000002      OFST:	set	2
1175                     ; 216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1177  0002 7b01          	ld	a,(OFST-1,sp)
1178  0004 97            	ld	xl,a
1179                     ; 217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1181  0005 7b02          	ld	a,(OFST+0,sp)
1182  0007 97            	ld	xl,a
1183                     ; 220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1185  0008 0d03          	tnz	(OFST+1,sp)
1186  000a 2706          	jreq	L221
1187  000c 7b03          	ld	a,(OFST+1,sp)
1188  000e a101          	cp	a,#1
1189  0010 2603          	jrne	L021
1190  0012               L221:
1191  0012 4f            	clr	a
1192  0013 2010          	jra	L421
1193  0015               L021:
1194  0015 ae00dc        	ldw	x,#220
1195  0018 89            	pushw	x
1196  0019 ae0000        	ldw	x,#0
1197  001c 89            	pushw	x
1198  001d ae0000        	ldw	x,#L102
1199  0020 cd0000        	call	_assert_failed
1201  0023 5b04          	addw	sp,#4
1202  0025               L421:
1203                     ; 221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1205  0025 0d04          	tnz	(OFST+2,sp)
1206  0027 2706          	jreq	L031
1207  0029 7b04          	ld	a,(OFST+2,sp)
1208  002b a144          	cp	a,#68
1209  002d 2603          	jrne	L621
1210  002f               L031:
1211  002f 4f            	clr	a
1212  0030 2010          	jra	L231
1213  0032               L621:
1214  0032 ae00dd        	ldw	x,#221
1215  0035 89            	pushw	x
1216  0036 ae0000        	ldw	x,#0
1217  0039 89            	pushw	x
1218  003a ae0000        	ldw	x,#L102
1219  003d cd0000        	call	_assert_failed
1221  0040 5b04          	addw	sp,#4
1222  0042               L231:
1223                     ; 222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1225  0042 7b07          	ld	a,(OFST+5,sp)
1226  0044 a101          	cp	a,#1
1227  0046 270c          	jreq	L631
1228  0048 7b07          	ld	a,(OFST+5,sp)
1229  004a a102          	cp	a,#2
1230  004c 2706          	jreq	L631
1231  004e 7b07          	ld	a,(OFST+5,sp)
1232  0050 a103          	cp	a,#3
1233  0052 2603          	jrne	L431
1234  0054               L631:
1235  0054 4f            	clr	a
1236  0055 2010          	jra	L041
1237  0057               L431:
1238  0057 ae00de        	ldw	x,#222
1239  005a 89            	pushw	x
1240  005b ae0000        	ldw	x,#0
1241  005e 89            	pushw	x
1242  005f ae0000        	ldw	x,#L102
1243  0062 cd0000        	call	_assert_failed
1245  0065 5b04          	addw	sp,#4
1246  0067               L041:
1247                     ; 223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1249  0067 0d08          	tnz	(OFST+6,sp)
1250  0069 2712          	jreq	L441
1251  006b 7b08          	ld	a,(OFST+6,sp)
1252  006d a104          	cp	a,#4
1253  006f 270c          	jreq	L441
1254  0071 7b08          	ld	a,(OFST+6,sp)
1255  0073 a108          	cp	a,#8
1256  0075 2706          	jreq	L441
1257  0077 7b08          	ld	a,(OFST+6,sp)
1258  0079 a10c          	cp	a,#12
1259  007b 2603          	jrne	L241
1260  007d               L441:
1261  007d 4f            	clr	a
1262  007e 2010          	jra	L641
1263  0080               L241:
1264  0080 ae00df        	ldw	x,#223
1265  0083 89            	pushw	x
1266  0084 ae0000        	ldw	x,#0
1267  0087 89            	pushw	x
1268  0088 ae0000        	ldw	x,#L102
1269  008b cd0000        	call	_assert_failed
1271  008e 5b04          	addw	sp,#4
1272  0090               L641:
1273                     ; 226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1275  0090 7b04          	ld	a,(OFST+2,sp)
1276  0092 a144          	cp	a,#68
1277  0094 2706          	jreq	L104
1278                     ; 228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1280  0096 a644          	ld	a,#68
1281  0098 6b01          	ld	(OFST-1,sp),a
1283  009a 2002          	jra	L304
1284  009c               L104:
1285                     ; 232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1287  009c 0f01          	clr	(OFST-1,sp)
1288  009e               L304:
1289                     ; 236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1291  009e 7b07          	ld	a,(OFST+5,sp)
1292  00a0 a101          	cp	a,#1
1293  00a2 2606          	jrne	L504
1294                     ; 238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1296  00a4 a602          	ld	a,#2
1297  00a6 6b02          	ld	(OFST+0,sp),a
1299  00a8 2004          	jra	L704
1300  00aa               L504:
1301                     ; 242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1303  00aa a601          	ld	a,#1
1304  00ac 6b02          	ld	(OFST+0,sp),a
1305  00ae               L704:
1306                     ; 245   if (TIM3_Channel != TIM3_CHANNEL_2)
1308  00ae 7b03          	ld	a,(OFST+1,sp)
1309  00b0 a101          	cp	a,#1
1310  00b2 2726          	jreq	L114
1311                     ; 248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1311                     ; 249                (uint8_t)TIM3_ICFilter);
1313  00b4 7b09          	ld	a,(OFST+7,sp)
1314  00b6 88            	push	a
1315  00b7 7b08          	ld	a,(OFST+6,sp)
1316  00b9 97            	ld	xl,a
1317  00ba 7b05          	ld	a,(OFST+3,sp)
1318  00bc 95            	ld	xh,a
1319  00bd cd0000        	call	L3_TI1_Config
1321  00c0 84            	pop	a
1322                     ; 252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1324  00c1 7b08          	ld	a,(OFST+6,sp)
1325  00c3 cd0000        	call	_TIM3_SetIC1Prescaler
1327                     ; 255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1329  00c6 7b09          	ld	a,(OFST+7,sp)
1330  00c8 88            	push	a
1331  00c9 7b03          	ld	a,(OFST+1,sp)
1332  00cb 97            	ld	xl,a
1333  00cc 7b02          	ld	a,(OFST+0,sp)
1334  00ce 95            	ld	xh,a
1335  00cf cd0000        	call	L5_TI2_Config
1337  00d2 84            	pop	a
1338                     ; 258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1340  00d3 7b08          	ld	a,(OFST+6,sp)
1341  00d5 cd0000        	call	_TIM3_SetIC2Prescaler
1344  00d8 2024          	jra	L314
1345  00da               L114:
1346                     ; 263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1346                     ; 264                (uint8_t)TIM3_ICFilter);
1348  00da 7b09          	ld	a,(OFST+7,sp)
1349  00dc 88            	push	a
1350  00dd 7b08          	ld	a,(OFST+6,sp)
1351  00df 97            	ld	xl,a
1352  00e0 7b05          	ld	a,(OFST+3,sp)
1353  00e2 95            	ld	xh,a
1354  00e3 cd0000        	call	L5_TI2_Config
1356  00e6 84            	pop	a
1357                     ; 267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1359  00e7 7b08          	ld	a,(OFST+6,sp)
1360  00e9 cd0000        	call	_TIM3_SetIC2Prescaler
1362                     ; 270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1364  00ec 7b09          	ld	a,(OFST+7,sp)
1365  00ee 88            	push	a
1366  00ef 7b03          	ld	a,(OFST+1,sp)
1367  00f1 97            	ld	xl,a
1368  00f2 7b02          	ld	a,(OFST+0,sp)
1369  00f4 95            	ld	xh,a
1370  00f5 cd0000        	call	L3_TI1_Config
1372  00f8 84            	pop	a
1373                     ; 273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1375  00f9 7b08          	ld	a,(OFST+6,sp)
1376  00fb cd0000        	call	_TIM3_SetIC1Prescaler
1378  00fe               L314:
1379                     ; 275 }
1382  00fe 5b04          	addw	sp,#4
1383  0100 81            	ret
1439                     ; 283 void TIM3_Cmd(FunctionalState NewState)
1439                     ; 284 {
1440                     .text:	section	.text,new
1441  0000               _TIM3_Cmd:
1443  0000 88            	push	a
1444       00000000      OFST:	set	0
1447                     ; 286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1449  0001 4d            	tnz	a
1450  0002 2704          	jreq	L451
1451  0004 a101          	cp	a,#1
1452  0006 2603          	jrne	L251
1453  0008               L451:
1454  0008 4f            	clr	a
1455  0009 2010          	jra	L651
1456  000b               L251:
1457  000b ae011e        	ldw	x,#286
1458  000e 89            	pushw	x
1459  000f ae0000        	ldw	x,#0
1460  0012 89            	pushw	x
1461  0013 ae0000        	ldw	x,#L102
1462  0016 cd0000        	call	_assert_failed
1464  0019 5b04          	addw	sp,#4
1465  001b               L651:
1466                     ; 289   if (NewState != DISABLE)
1468  001b 0d01          	tnz	(OFST+1,sp)
1469  001d 2706          	jreq	L344
1470                     ; 291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1472  001f 72105320      	bset	21280,#0
1474  0023 2004          	jra	L544
1475  0025               L344:
1476                     ; 295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1478  0025 72115320      	bres	21280,#0
1479  0029               L544:
1480                     ; 297 }
1483  0029 84            	pop	a
1484  002a 81            	ret
1557                     ; 311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1557                     ; 312 {
1558                     .text:	section	.text,new
1559  0000               _TIM3_ITConfig:
1561  0000 89            	pushw	x
1562       00000000      OFST:	set	0
1565                     ; 314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
1567  0001 9e            	ld	a,xh
1568  0002 4d            	tnz	a
1569  0003 2708          	jreq	L261
1570  0005 9e            	ld	a,xh
1571  0006 a108          	cp	a,#8
1572  0008 2403          	jruge	L261
1573  000a 4f            	clr	a
1574  000b 2010          	jra	L461
1575  000d               L261:
1576  000d ae013a        	ldw	x,#314
1577  0010 89            	pushw	x
1578  0011 ae0000        	ldw	x,#0
1579  0014 89            	pushw	x
1580  0015 ae0000        	ldw	x,#L102
1581  0018 cd0000        	call	_assert_failed
1583  001b 5b04          	addw	sp,#4
1584  001d               L461:
1585                     ; 315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1587  001d 0d02          	tnz	(OFST+2,sp)
1588  001f 2706          	jreq	L071
1589  0021 7b02          	ld	a,(OFST+2,sp)
1590  0023 a101          	cp	a,#1
1591  0025 2603          	jrne	L661
1592  0027               L071:
1593  0027 4f            	clr	a
1594  0028 2010          	jra	L271
1595  002a               L661:
1596  002a ae013b        	ldw	x,#315
1597  002d 89            	pushw	x
1598  002e ae0000        	ldw	x,#0
1599  0031 89            	pushw	x
1600  0032 ae0000        	ldw	x,#L102
1601  0035 cd0000        	call	_assert_failed
1603  0038 5b04          	addw	sp,#4
1604  003a               L271:
1605                     ; 317   if (NewState != DISABLE)
1607  003a 0d02          	tnz	(OFST+2,sp)
1608  003c 270a          	jreq	L305
1609                     ; 320     TIM3->IER |= (uint8_t)TIM3_IT;
1611  003e c65321        	ld	a,21281
1612  0041 1a01          	or	a,(OFST+1,sp)
1613  0043 c75321        	ld	21281,a
1615  0046 2009          	jra	L505
1616  0048               L305:
1617                     ; 325     TIM3->IER &= (uint8_t)(~TIM3_IT);
1619  0048 7b01          	ld	a,(OFST+1,sp)
1620  004a 43            	cpl	a
1621  004b c45321        	and	a,21281
1622  004e c75321        	ld	21281,a
1623  0051               L505:
1624                     ; 327 }
1627  0051 85            	popw	x
1628  0052 81            	ret
1665                     ; 335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1665                     ; 336 {
1666                     .text:	section	.text,new
1667  0000               _TIM3_UpdateDisableConfig:
1669  0000 88            	push	a
1670       00000000      OFST:	set	0
1673                     ; 338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1675  0001 4d            	tnz	a
1676  0002 2704          	jreq	L002
1677  0004 a101          	cp	a,#1
1678  0006 2603          	jrne	L671
1679  0008               L002:
1680  0008 4f            	clr	a
1681  0009 2010          	jra	L202
1682  000b               L671:
1683  000b ae0152        	ldw	x,#338
1684  000e 89            	pushw	x
1685  000f ae0000        	ldw	x,#0
1686  0012 89            	pushw	x
1687  0013 ae0000        	ldw	x,#L102
1688  0016 cd0000        	call	_assert_failed
1690  0019 5b04          	addw	sp,#4
1691  001b               L202:
1692                     ; 341   if (NewState != DISABLE)
1694  001b 0d01          	tnz	(OFST+1,sp)
1695  001d 2706          	jreq	L525
1696                     ; 343     TIM3->CR1 |= TIM3_CR1_UDIS;
1698  001f 72125320      	bset	21280,#1
1700  0023 2004          	jra	L725
1701  0025               L525:
1702                     ; 347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1704  0025 72135320      	bres	21280,#1
1705  0029               L725:
1706                     ; 349 }
1709  0029 84            	pop	a
1710  002a 81            	ret
1769                     ; 359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1769                     ; 360 {
1770                     .text:	section	.text,new
1771  0000               _TIM3_UpdateRequestConfig:
1773  0000 88            	push	a
1774       00000000      OFST:	set	0
1777                     ; 362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1779  0001 4d            	tnz	a
1780  0002 2704          	jreq	L012
1781  0004 a101          	cp	a,#1
1782  0006 2603          	jrne	L602
1783  0008               L012:
1784  0008 4f            	clr	a
1785  0009 2010          	jra	L212
1786  000b               L602:
1787  000b ae016a        	ldw	x,#362
1788  000e 89            	pushw	x
1789  000f ae0000        	ldw	x,#0
1790  0012 89            	pushw	x
1791  0013 ae0000        	ldw	x,#L102
1792  0016 cd0000        	call	_assert_failed
1794  0019 5b04          	addw	sp,#4
1795  001b               L212:
1796                     ; 365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1798  001b 0d01          	tnz	(OFST+1,sp)
1799  001d 2706          	jreq	L755
1800                     ; 367     TIM3->CR1 |= TIM3_CR1_URS;
1802  001f 72145320      	bset	21280,#2
1804  0023 2004          	jra	L165
1805  0025               L755:
1806                     ; 371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1808  0025 72155320      	bres	21280,#2
1809  0029               L165:
1810                     ; 373 }
1813  0029 84            	pop	a
1814  002a 81            	ret
1872                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1872                     ; 384 {
1873                     .text:	section	.text,new
1874  0000               _TIM3_SelectOnePulseMode:
1876  0000 88            	push	a
1877       00000000      OFST:	set	0
1880                     ; 386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1882  0001 a101          	cp	a,#1
1883  0003 2703          	jreq	L022
1884  0005 4d            	tnz	a
1885  0006 2603          	jrne	L612
1886  0008               L022:
1887  0008 4f            	clr	a
1888  0009 2010          	jra	L222
1889  000b               L612:
1890  000b ae0182        	ldw	x,#386
1891  000e 89            	pushw	x
1892  000f ae0000        	ldw	x,#0
1893  0012 89            	pushw	x
1894  0013 ae0000        	ldw	x,#L102
1895  0016 cd0000        	call	_assert_failed
1897  0019 5b04          	addw	sp,#4
1898  001b               L222:
1899                     ; 389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1901  001b 0d01          	tnz	(OFST+1,sp)
1902  001d 2706          	jreq	L116
1903                     ; 391     TIM3->CR1 |= TIM3_CR1_OPM;
1905  001f 72165320      	bset	21280,#3
1907  0023 2004          	jra	L316
1908  0025               L116:
1909                     ; 395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1911  0025 72175320      	bres	21280,#3
1912  0029               L316:
1913                     ; 397 }
1916  0029 84            	pop	a
1917  002a 81            	ret
1986                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1986                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1986                     ; 429 {
1987                     .text:	section	.text,new
1988  0000               _TIM3_PrescalerConfig:
1990  0000 89            	pushw	x
1991       00000000      OFST:	set	0
1994                     ; 431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1996  0001 9f            	ld	a,xl
1997  0002 4d            	tnz	a
1998  0003 2705          	jreq	L032
1999  0005 9f            	ld	a,xl
2000  0006 a101          	cp	a,#1
2001  0008 2603          	jrne	L622
2002  000a               L032:
2003  000a 4f            	clr	a
2004  000b 2010          	jra	L232
2005  000d               L622:
2006  000d ae01af        	ldw	x,#431
2007  0010 89            	pushw	x
2008  0011 ae0000        	ldw	x,#0
2009  0014 89            	pushw	x
2010  0015 ae0000        	ldw	x,#L102
2011  0018 cd0000        	call	_assert_failed
2013  001b 5b04          	addw	sp,#4
2014  001d               L232:
2015                     ; 432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2017  001d 0d01          	tnz	(OFST+1,sp)
2018  001f 275a          	jreq	L632
2019  0021 7b01          	ld	a,(OFST+1,sp)
2020  0023 a101          	cp	a,#1
2021  0025 2754          	jreq	L632
2022  0027 7b01          	ld	a,(OFST+1,sp)
2023  0029 a102          	cp	a,#2
2024  002b 274e          	jreq	L632
2025  002d 7b01          	ld	a,(OFST+1,sp)
2026  002f a103          	cp	a,#3
2027  0031 2748          	jreq	L632
2028  0033 7b01          	ld	a,(OFST+1,sp)
2029  0035 a104          	cp	a,#4
2030  0037 2742          	jreq	L632
2031  0039 7b01          	ld	a,(OFST+1,sp)
2032  003b a105          	cp	a,#5
2033  003d 273c          	jreq	L632
2034  003f 7b01          	ld	a,(OFST+1,sp)
2035  0041 a106          	cp	a,#6
2036  0043 2736          	jreq	L632
2037  0045 7b01          	ld	a,(OFST+1,sp)
2038  0047 a107          	cp	a,#7
2039  0049 2730          	jreq	L632
2040  004b 7b01          	ld	a,(OFST+1,sp)
2041  004d a108          	cp	a,#8
2042  004f 272a          	jreq	L632
2043  0051 7b01          	ld	a,(OFST+1,sp)
2044  0053 a109          	cp	a,#9
2045  0055 2724          	jreq	L632
2046  0057 7b01          	ld	a,(OFST+1,sp)
2047  0059 a10a          	cp	a,#10
2048  005b 271e          	jreq	L632
2049  005d 7b01          	ld	a,(OFST+1,sp)
2050  005f a10b          	cp	a,#11
2051  0061 2718          	jreq	L632
2052  0063 7b01          	ld	a,(OFST+1,sp)
2053  0065 a10c          	cp	a,#12
2054  0067 2712          	jreq	L632
2055  0069 7b01          	ld	a,(OFST+1,sp)
2056  006b a10d          	cp	a,#13
2057  006d 270c          	jreq	L632
2058  006f 7b01          	ld	a,(OFST+1,sp)
2059  0071 a10e          	cp	a,#14
2060  0073 2706          	jreq	L632
2061  0075 7b01          	ld	a,(OFST+1,sp)
2062  0077 a10f          	cp	a,#15
2063  0079 2603          	jrne	L432
2064  007b               L632:
2065  007b 4f            	clr	a
2066  007c 2010          	jra	L042
2067  007e               L432:
2068  007e ae01b0        	ldw	x,#432
2069  0081 89            	pushw	x
2070  0082 ae0000        	ldw	x,#0
2071  0085 89            	pushw	x
2072  0086 ae0000        	ldw	x,#L102
2073  0089 cd0000        	call	_assert_failed
2075  008c 5b04          	addw	sp,#4
2076  008e               L042:
2077                     ; 435   TIM3->PSCR = (uint8_t)Prescaler;
2079  008e 7b01          	ld	a,(OFST+1,sp)
2080  0090 c7532a        	ld	21290,a
2081                     ; 438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2083  0093 7b02          	ld	a,(OFST+2,sp)
2084  0095 c75324        	ld	21284,a
2085                     ; 439 }
2088  0098 85            	popw	x
2089  0099 81            	ret
2148                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2148                     ; 451 {
2149                     .text:	section	.text,new
2150  0000               _TIM3_ForcedOC1Config:
2152  0000 88            	push	a
2153       00000000      OFST:	set	0
2156                     ; 453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2158  0001 a150          	cp	a,#80
2159  0003 2704          	jreq	L642
2160  0005 a140          	cp	a,#64
2161  0007 2603          	jrne	L442
2162  0009               L642:
2163  0009 4f            	clr	a
2164  000a 2010          	jra	L052
2165  000c               L442:
2166  000c ae01c5        	ldw	x,#453
2167  000f 89            	pushw	x
2168  0010 ae0000        	ldw	x,#0
2169  0013 89            	pushw	x
2170  0014 ae0000        	ldw	x,#L102
2171  0017 cd0000        	call	_assert_failed
2173  001a 5b04          	addw	sp,#4
2174  001c               L052:
2175                     ; 456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2177  001c c65325        	ld	a,21285
2178  001f a48f          	and	a,#143
2179  0021 1a01          	or	a,(OFST+1,sp)
2180  0023 c75325        	ld	21285,a
2181                     ; 457 }
2184  0026 84            	pop	a
2185  0027 81            	ret
2222                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2222                     ; 469 {
2223                     .text:	section	.text,new
2224  0000               _TIM3_ForcedOC2Config:
2226  0000 88            	push	a
2227       00000000      OFST:	set	0
2230                     ; 471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2232  0001 a150          	cp	a,#80
2233  0003 2704          	jreq	L652
2234  0005 a140          	cp	a,#64
2235  0007 2603          	jrne	L452
2236  0009               L652:
2237  0009 4f            	clr	a
2238  000a 2010          	jra	L062
2239  000c               L452:
2240  000c ae01d7        	ldw	x,#471
2241  000f 89            	pushw	x
2242  0010 ae0000        	ldw	x,#0
2243  0013 89            	pushw	x
2244  0014 ae0000        	ldw	x,#L102
2245  0017 cd0000        	call	_assert_failed
2247  001a 5b04          	addw	sp,#4
2248  001c               L062:
2249                     ; 474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2251  001c c65326        	ld	a,21286
2252  001f a48f          	and	a,#143
2253  0021 1a01          	or	a,(OFST+1,sp)
2254  0023 c75326        	ld	21286,a
2255                     ; 475 }
2258  0026 84            	pop	a
2259  0027 81            	ret
2296                     ; 483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2296                     ; 484 {
2297                     .text:	section	.text,new
2298  0000               _TIM3_ARRPreloadConfig:
2300  0000 88            	push	a
2301       00000000      OFST:	set	0
2304                     ; 486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2306  0001 4d            	tnz	a
2307  0002 2704          	jreq	L662
2308  0004 a101          	cp	a,#1
2309  0006 2603          	jrne	L462
2310  0008               L662:
2311  0008 4f            	clr	a
2312  0009 2010          	jra	L072
2313  000b               L462:
2314  000b ae01e6        	ldw	x,#486
2315  000e 89            	pushw	x
2316  000f ae0000        	ldw	x,#0
2317  0012 89            	pushw	x
2318  0013 ae0000        	ldw	x,#L102
2319  0016 cd0000        	call	_assert_failed
2321  0019 5b04          	addw	sp,#4
2322  001b               L072:
2323                     ; 489   if (NewState != DISABLE)
2325  001b 0d01          	tnz	(OFST+1,sp)
2326  001d 2706          	jreq	L137
2327                     ; 491     TIM3->CR1 |= TIM3_CR1_ARPE;
2329  001f 721e5320      	bset	21280,#7
2331  0023 2004          	jra	L337
2332  0025               L137:
2333                     ; 495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2335  0025 721f5320      	bres	21280,#7
2336  0029               L337:
2337                     ; 497 }
2340  0029 84            	pop	a
2341  002a 81            	ret
2378                     ; 505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2378                     ; 506 {
2379                     .text:	section	.text,new
2380  0000               _TIM3_OC1PreloadConfig:
2382  0000 88            	push	a
2383       00000000      OFST:	set	0
2386                     ; 508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2388  0001 4d            	tnz	a
2389  0002 2704          	jreq	L672
2390  0004 a101          	cp	a,#1
2391  0006 2603          	jrne	L472
2392  0008               L672:
2393  0008 4f            	clr	a
2394  0009 2010          	jra	L003
2395  000b               L472:
2396  000b ae01fc        	ldw	x,#508
2397  000e 89            	pushw	x
2398  000f ae0000        	ldw	x,#0
2399  0012 89            	pushw	x
2400  0013 ae0000        	ldw	x,#L102
2401  0016 cd0000        	call	_assert_failed
2403  0019 5b04          	addw	sp,#4
2404  001b               L003:
2405                     ; 511   if (NewState != DISABLE)
2407  001b 0d01          	tnz	(OFST+1,sp)
2408  001d 2706          	jreq	L357
2409                     ; 513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2411  001f 72165325      	bset	21285,#3
2413  0023 2004          	jra	L557
2414  0025               L357:
2415                     ; 517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2417  0025 72175325      	bres	21285,#3
2418  0029               L557:
2419                     ; 519 }
2422  0029 84            	pop	a
2423  002a 81            	ret
2460                     ; 527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2460                     ; 528 {
2461                     .text:	section	.text,new
2462  0000               _TIM3_OC2PreloadConfig:
2464  0000 88            	push	a
2465       00000000      OFST:	set	0
2468                     ; 530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2470  0001 4d            	tnz	a
2471  0002 2704          	jreq	L603
2472  0004 a101          	cp	a,#1
2473  0006 2603          	jrne	L403
2474  0008               L603:
2475  0008 4f            	clr	a
2476  0009 2010          	jra	L013
2477  000b               L403:
2478  000b ae0212        	ldw	x,#530
2479  000e 89            	pushw	x
2480  000f ae0000        	ldw	x,#0
2481  0012 89            	pushw	x
2482  0013 ae0000        	ldw	x,#L102
2483  0016 cd0000        	call	_assert_failed
2485  0019 5b04          	addw	sp,#4
2486  001b               L013:
2487                     ; 533   if (NewState != DISABLE)
2489  001b 0d01          	tnz	(OFST+1,sp)
2490  001d 2706          	jreq	L577
2491                     ; 535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2493  001f 72165326      	bset	21286,#3
2495  0023 2004          	jra	L777
2496  0025               L577:
2497                     ; 539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2499  0025 72175326      	bres	21286,#3
2500  0029               L777:
2501                     ; 541 }
2504  0029 84            	pop	a
2505  002a 81            	ret
2571                     ; 552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2571                     ; 553 {
2572                     .text:	section	.text,new
2573  0000               _TIM3_GenerateEvent:
2575  0000 88            	push	a
2576       00000000      OFST:	set	0
2579                     ; 555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2581  0001 4d            	tnz	a
2582  0002 2703          	jreq	L413
2583  0004 4f            	clr	a
2584  0005 2010          	jra	L613
2585  0007               L413:
2586  0007 ae022b        	ldw	x,#555
2587  000a 89            	pushw	x
2588  000b ae0000        	ldw	x,#0
2589  000e 89            	pushw	x
2590  000f ae0000        	ldw	x,#L102
2591  0012 cd0000        	call	_assert_failed
2593  0015 5b04          	addw	sp,#4
2594  0017               L613:
2595                     ; 558   TIM3->EGR = (uint8_t)TIM3_EventSource;
2597  0017 7b01          	ld	a,(OFST+1,sp)
2598  0019 c75324        	ld	21284,a
2599                     ; 559 }
2602  001c 84            	pop	a
2603  001d 81            	ret
2640                     ; 569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2640                     ; 570 {
2641                     .text:	section	.text,new
2642  0000               _TIM3_OC1PolarityConfig:
2644  0000 88            	push	a
2645       00000000      OFST:	set	0
2648                     ; 572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2650  0001 4d            	tnz	a
2651  0002 2704          	jreq	L423
2652  0004 a122          	cp	a,#34
2653  0006 2603          	jrne	L223
2654  0008               L423:
2655  0008 4f            	clr	a
2656  0009 2010          	jra	L623
2657  000b               L223:
2658  000b ae023c        	ldw	x,#572
2659  000e 89            	pushw	x
2660  000f ae0000        	ldw	x,#0
2661  0012 89            	pushw	x
2662  0013 ae0000        	ldw	x,#L102
2663  0016 cd0000        	call	_assert_failed
2665  0019 5b04          	addw	sp,#4
2666  001b               L623:
2667                     ; 575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2669  001b 0d01          	tnz	(OFST+1,sp)
2670  001d 2706          	jreq	L7401
2671                     ; 577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
2673  001f 72125327      	bset	21287,#1
2675  0023 2004          	jra	L1501
2676  0025               L7401:
2677                     ; 581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2679  0025 72135327      	bres	21287,#1
2680  0029               L1501:
2681                     ; 583 }
2684  0029 84            	pop	a
2685  002a 81            	ret
2722                     ; 593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2722                     ; 594 {
2723                     .text:	section	.text,new
2724  0000               _TIM3_OC2PolarityConfig:
2726  0000 88            	push	a
2727       00000000      OFST:	set	0
2730                     ; 596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2732  0001 4d            	tnz	a
2733  0002 2704          	jreq	L433
2734  0004 a122          	cp	a,#34
2735  0006 2603          	jrne	L233
2736  0008               L433:
2737  0008 4f            	clr	a
2738  0009 2010          	jra	L633
2739  000b               L233:
2740  000b ae0254        	ldw	x,#596
2741  000e 89            	pushw	x
2742  000f ae0000        	ldw	x,#0
2743  0012 89            	pushw	x
2744  0013 ae0000        	ldw	x,#L102
2745  0016 cd0000        	call	_assert_failed
2747  0019 5b04          	addw	sp,#4
2748  001b               L633:
2749                     ; 599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2751  001b 0d01          	tnz	(OFST+1,sp)
2752  001d 2706          	jreq	L1701
2753                     ; 601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
2755  001f 721a5327      	bset	21287,#5
2757  0023 2004          	jra	L3701
2758  0025               L1701:
2759                     ; 605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2761  0025 721b5327      	bres	21287,#5
2762  0029               L3701:
2763                     ; 607 }
2766  0029 84            	pop	a
2767  002a 81            	ret
2813                     ; 619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2813                     ; 620 {
2814                     .text:	section	.text,new
2815  0000               _TIM3_CCxCmd:
2817  0000 89            	pushw	x
2818       00000000      OFST:	set	0
2821                     ; 622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2823  0001 9e            	ld	a,xh
2824  0002 4d            	tnz	a
2825  0003 2705          	jreq	L443
2826  0005 9e            	ld	a,xh
2827  0006 a101          	cp	a,#1
2828  0008 2603          	jrne	L243
2829  000a               L443:
2830  000a 4f            	clr	a
2831  000b 2010          	jra	L643
2832  000d               L243:
2833  000d ae026e        	ldw	x,#622
2834  0010 89            	pushw	x
2835  0011 ae0000        	ldw	x,#0
2836  0014 89            	pushw	x
2837  0015 ae0000        	ldw	x,#L102
2838  0018 cd0000        	call	_assert_failed
2840  001b 5b04          	addw	sp,#4
2841  001d               L643:
2842                     ; 623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2844  001d 0d02          	tnz	(OFST+2,sp)
2845  001f 2706          	jreq	L253
2846  0021 7b02          	ld	a,(OFST+2,sp)
2847  0023 a101          	cp	a,#1
2848  0025 2603          	jrne	L053
2849  0027               L253:
2850  0027 4f            	clr	a
2851  0028 2010          	jra	L453
2852  002a               L053:
2853  002a ae026f        	ldw	x,#623
2854  002d 89            	pushw	x
2855  002e ae0000        	ldw	x,#0
2856  0031 89            	pushw	x
2857  0032 ae0000        	ldw	x,#L102
2858  0035 cd0000        	call	_assert_failed
2860  0038 5b04          	addw	sp,#4
2861  003a               L453:
2862                     ; 625   if (TIM3_Channel == TIM3_CHANNEL_1)
2864  003a 0d01          	tnz	(OFST+1,sp)
2865  003c 2610          	jrne	L7111
2866                     ; 628     if (NewState != DISABLE)
2868  003e 0d02          	tnz	(OFST+2,sp)
2869  0040 2706          	jreq	L1211
2870                     ; 630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
2872  0042 72105327      	bset	21287,#0
2874  0046 2014          	jra	L5211
2875  0048               L1211:
2876                     ; 634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2878  0048 72115327      	bres	21287,#0
2879  004c 200e          	jra	L5211
2880  004e               L7111:
2881                     ; 641     if (NewState != DISABLE)
2883  004e 0d02          	tnz	(OFST+2,sp)
2884  0050 2706          	jreq	L7211
2885                     ; 643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
2887  0052 72185327      	bset	21287,#4
2889  0056 2004          	jra	L5211
2890  0058               L7211:
2891                     ; 647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2893  0058 72195327      	bres	21287,#4
2894  005c               L5211:
2895                     ; 650 }
2898  005c 85            	popw	x
2899  005d 81            	ret
2945                     ; 671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2945                     ; 672 {
2946                     .text:	section	.text,new
2947  0000               _TIM3_SelectOCxM:
2949  0000 89            	pushw	x
2950       00000000      OFST:	set	0
2953                     ; 674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2955  0001 9e            	ld	a,xh
2956  0002 4d            	tnz	a
2957  0003 2705          	jreq	L263
2958  0005 9e            	ld	a,xh
2959  0006 a101          	cp	a,#1
2960  0008 2603          	jrne	L063
2961  000a               L263:
2962  000a 4f            	clr	a
2963  000b 2010          	jra	L463
2964  000d               L063:
2965  000d ae02a2        	ldw	x,#674
2966  0010 89            	pushw	x
2967  0011 ae0000        	ldw	x,#0
2968  0014 89            	pushw	x
2969  0015 ae0000        	ldw	x,#L102
2970  0018 cd0000        	call	_assert_failed
2972  001b 5b04          	addw	sp,#4
2973  001d               L463:
2974                     ; 675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2976  001d 0d02          	tnz	(OFST+2,sp)
2977  001f 272a          	jreq	L073
2978  0021 7b02          	ld	a,(OFST+2,sp)
2979  0023 a110          	cp	a,#16
2980  0025 2724          	jreq	L073
2981  0027 7b02          	ld	a,(OFST+2,sp)
2982  0029 a120          	cp	a,#32
2983  002b 271e          	jreq	L073
2984  002d 7b02          	ld	a,(OFST+2,sp)
2985  002f a130          	cp	a,#48
2986  0031 2718          	jreq	L073
2987  0033 7b02          	ld	a,(OFST+2,sp)
2988  0035 a160          	cp	a,#96
2989  0037 2712          	jreq	L073
2990  0039 7b02          	ld	a,(OFST+2,sp)
2991  003b a170          	cp	a,#112
2992  003d 270c          	jreq	L073
2993  003f 7b02          	ld	a,(OFST+2,sp)
2994  0041 a150          	cp	a,#80
2995  0043 2706          	jreq	L073
2996  0045 7b02          	ld	a,(OFST+2,sp)
2997  0047 a140          	cp	a,#64
2998  0049 2603          	jrne	L663
2999  004b               L073:
3000  004b 4f            	clr	a
3001  004c 2010          	jra	L273
3002  004e               L663:
3003  004e ae02a3        	ldw	x,#675
3004  0051 89            	pushw	x
3005  0052 ae0000        	ldw	x,#0
3006  0055 89            	pushw	x
3007  0056 ae0000        	ldw	x,#L102
3008  0059 cd0000        	call	_assert_failed
3010  005c 5b04          	addw	sp,#4
3011  005e               L273:
3012                     ; 677   if (TIM3_Channel == TIM3_CHANNEL_1)
3014  005e 0d01          	tnz	(OFST+1,sp)
3015  0060 2610          	jrne	L5511
3016                     ; 680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3018  0062 72115327      	bres	21287,#0
3019                     ; 683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3021  0066 c65325        	ld	a,21285
3022  0069 a48f          	and	a,#143
3023  006b 1a02          	or	a,(OFST+2,sp)
3024  006d c75325        	ld	21285,a
3026  0070 200e          	jra	L7511
3027  0072               L5511:
3028                     ; 688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3030  0072 72195327      	bres	21287,#4
3031                     ; 691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3033  0076 c65326        	ld	a,21286
3034  0079 a48f          	and	a,#143
3035  007b 1a02          	or	a,(OFST+2,sp)
3036  007d c75326        	ld	21286,a
3037  0080               L7511:
3038                     ; 693 }
3041  0080 85            	popw	x
3042  0081 81            	ret
3074                     ; 701 void TIM3_SetCounter(uint16_t Counter)
3074                     ; 702 {
3075                     .text:	section	.text,new
3076  0000               _TIM3_SetCounter:
3080                     ; 704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
3082  0000 9e            	ld	a,xh
3083  0001 c75328        	ld	21288,a
3084                     ; 705   TIM3->CNTRL = (uint8_t)(Counter);
3086  0004 9f            	ld	a,xl
3087  0005 c75329        	ld	21289,a
3088                     ; 706 }
3091  0008 81            	ret
3123                     ; 714 void TIM3_SetAutoreload(uint16_t Autoreload)
3123                     ; 715 {
3124                     .text:	section	.text,new
3125  0000               _TIM3_SetAutoreload:
3129                     ; 717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3131  0000 9e            	ld	a,xh
3132  0001 c7532b        	ld	21291,a
3133                     ; 718   TIM3->ARRL = (uint8_t)(Autoreload);
3135  0004 9f            	ld	a,xl
3136  0005 c7532c        	ld	21292,a
3137                     ; 719 }
3140  0008 81            	ret
3172                     ; 727 void TIM3_SetCompare1(uint16_t Compare1)
3172                     ; 728 {
3173                     .text:	section	.text,new
3174  0000               _TIM3_SetCompare1:
3178                     ; 730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3180  0000 9e            	ld	a,xh
3181  0001 c7532d        	ld	21293,a
3182                     ; 731   TIM3->CCR1L = (uint8_t)(Compare1);
3184  0004 9f            	ld	a,xl
3185  0005 c7532e        	ld	21294,a
3186                     ; 732 }
3189  0008 81            	ret
3221                     ; 740 void TIM3_SetCompare2(uint16_t Compare2)
3221                     ; 741 {
3222                     .text:	section	.text,new
3223  0000               _TIM3_SetCompare2:
3227                     ; 743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3229  0000 9e            	ld	a,xh
3230  0001 c7532f        	ld	21295,a
3231                     ; 744   TIM3->CCR2L = (uint8_t)(Compare2);
3233  0004 9f            	ld	a,xl
3234  0005 c75330        	ld	21296,a
3235                     ; 745 }
3238  0008 81            	ret
3275                     ; 757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3275                     ; 758 {
3276                     .text:	section	.text,new
3277  0000               _TIM3_SetIC1Prescaler:
3279  0000 88            	push	a
3280       00000000      OFST:	set	0
3283                     ; 760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3285  0001 4d            	tnz	a
3286  0002 270c          	jreq	L014
3287  0004 a104          	cp	a,#4
3288  0006 2708          	jreq	L014
3289  0008 a108          	cp	a,#8
3290  000a 2704          	jreq	L014
3291  000c a10c          	cp	a,#12
3292  000e 2603          	jrne	L604
3293  0010               L014:
3294  0010 4f            	clr	a
3295  0011 2010          	jra	L214
3296  0013               L604:
3297  0013 ae02f8        	ldw	x,#760
3298  0016 89            	pushw	x
3299  0017 ae0000        	ldw	x,#0
3300  001a 89            	pushw	x
3301  001b ae0000        	ldw	x,#L102
3302  001e cd0000        	call	_assert_failed
3304  0021 5b04          	addw	sp,#4
3305  0023               L214:
3306                     ; 763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3308  0023 c65325        	ld	a,21285
3309  0026 a4f3          	and	a,#243
3310  0028 1a01          	or	a,(OFST+1,sp)
3311  002a c75325        	ld	21285,a
3312                     ; 764 }
3315  002d 84            	pop	a
3316  002e 81            	ret
3353                     ; 776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3353                     ; 777 {
3354                     .text:	section	.text,new
3355  0000               _TIM3_SetIC2Prescaler:
3357  0000 88            	push	a
3358       00000000      OFST:	set	0
3361                     ; 779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3363  0001 4d            	tnz	a
3364  0002 270c          	jreq	L024
3365  0004 a104          	cp	a,#4
3366  0006 2708          	jreq	L024
3367  0008 a108          	cp	a,#8
3368  000a 2704          	jreq	L024
3369  000c a10c          	cp	a,#12
3370  000e 2603          	jrne	L614
3371  0010               L024:
3372  0010 4f            	clr	a
3373  0011 2010          	jra	L224
3374  0013               L614:
3375  0013 ae030b        	ldw	x,#779
3376  0016 89            	pushw	x
3377  0017 ae0000        	ldw	x,#0
3378  001a 89            	pushw	x
3379  001b ae0000        	ldw	x,#L102
3380  001e cd0000        	call	_assert_failed
3382  0021 5b04          	addw	sp,#4
3383  0023               L224:
3384                     ; 782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3386  0023 c65326        	ld	a,21286
3387  0026 a4f3          	and	a,#243
3388  0028 1a01          	or	a,(OFST+1,sp)
3389  002a c75326        	ld	21286,a
3390                     ; 783 }
3393  002d 84            	pop	a
3394  002e 81            	ret
3440                     ; 790 uint16_t TIM3_GetCapture1(void)
3440                     ; 791 {
3441                     .text:	section	.text,new
3442  0000               _TIM3_GetCapture1:
3444  0000 5204          	subw	sp,#4
3445       00000004      OFST:	set	4
3448                     ; 793   uint16_t tmpccr1 = 0;
3450  0002 1e03          	ldw	x,(OFST-1,sp)
3451                     ; 794   uint8_t tmpccr1l=0, tmpccr1h=0;
3453  0004 7b01          	ld	a,(OFST-3,sp)
3454  0006 97            	ld	xl,a
3457  0007 7b02          	ld	a,(OFST-2,sp)
3458  0009 97            	ld	xl,a
3459                     ; 796   tmpccr1h = TIM3->CCR1H;
3461  000a c6532d        	ld	a,21293
3462  000d 6b02          	ld	(OFST-2,sp),a
3463                     ; 797   tmpccr1l = TIM3->CCR1L;
3465  000f c6532e        	ld	a,21294
3466  0012 6b01          	ld	(OFST-3,sp),a
3467                     ; 799   tmpccr1 = (uint16_t)(tmpccr1l);
3469  0014 7b01          	ld	a,(OFST-3,sp)
3470  0016 5f            	clrw	x
3471  0017 97            	ld	xl,a
3472  0018 1f03          	ldw	(OFST-1,sp),x
3473                     ; 800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3475  001a 7b02          	ld	a,(OFST-2,sp)
3476  001c 5f            	clrw	x
3477  001d 97            	ld	xl,a
3478  001e 4f            	clr	a
3479  001f 02            	rlwa	x,a
3480  0020 01            	rrwa	x,a
3481  0021 1a04          	or	a,(OFST+0,sp)
3482  0023 01            	rrwa	x,a
3483  0024 1a03          	or	a,(OFST-1,sp)
3484  0026 01            	rrwa	x,a
3485  0027 1f03          	ldw	(OFST-1,sp),x
3486                     ; 802   return (uint16_t)tmpccr1;
3488  0029 1e03          	ldw	x,(OFST-1,sp)
3491  002b 5b04          	addw	sp,#4
3492  002d 81            	ret
3538                     ; 810 uint16_t TIM3_GetCapture2(void)
3538                     ; 811 {
3539                     .text:	section	.text,new
3540  0000               _TIM3_GetCapture2:
3542  0000 5204          	subw	sp,#4
3543       00000004      OFST:	set	4
3546                     ; 813   uint16_t tmpccr2 = 0;
3548  0002 1e03          	ldw	x,(OFST-1,sp)
3549                     ; 814   uint8_t tmpccr2l=0, tmpccr2h=0;
3551  0004 7b01          	ld	a,(OFST-3,sp)
3552  0006 97            	ld	xl,a
3555  0007 7b02          	ld	a,(OFST-2,sp)
3556  0009 97            	ld	xl,a
3557                     ; 816   tmpccr2h = TIM3->CCR2H;
3559  000a c6532f        	ld	a,21295
3560  000d 6b02          	ld	(OFST-2,sp),a
3561                     ; 817   tmpccr2l = TIM3->CCR2L;
3563  000f c65330        	ld	a,21296
3564  0012 6b01          	ld	(OFST-3,sp),a
3565                     ; 819   tmpccr2 = (uint16_t)(tmpccr2l);
3567  0014 7b01          	ld	a,(OFST-3,sp)
3568  0016 5f            	clrw	x
3569  0017 97            	ld	xl,a
3570  0018 1f03          	ldw	(OFST-1,sp),x
3571                     ; 820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3573  001a 7b02          	ld	a,(OFST-2,sp)
3574  001c 5f            	clrw	x
3575  001d 97            	ld	xl,a
3576  001e 4f            	clr	a
3577  001f 02            	rlwa	x,a
3578  0020 01            	rrwa	x,a
3579  0021 1a04          	or	a,(OFST+0,sp)
3580  0023 01            	rrwa	x,a
3581  0024 1a03          	or	a,(OFST-1,sp)
3582  0026 01            	rrwa	x,a
3583  0027 1f03          	ldw	(OFST-1,sp),x
3584                     ; 822   return (uint16_t)tmpccr2;
3586  0029 1e03          	ldw	x,(OFST-1,sp)
3589  002b 5b04          	addw	sp,#4
3590  002d 81            	ret
3622                     ; 830 uint16_t TIM3_GetCounter(void)
3622                     ; 831 {
3623                     .text:	section	.text,new
3624  0000               _TIM3_GetCounter:
3626  0000 89            	pushw	x
3627       00000002      OFST:	set	2
3630                     ; 832   uint16_t tmpcntr = 0;
3632  0001 5f            	clrw	x
3633  0002 1f01          	ldw	(OFST-1,sp),x
3634                     ; 834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3636  0004 c65328        	ld	a,21288
3637  0007 5f            	clrw	x
3638  0008 97            	ld	xl,a
3639  0009 4f            	clr	a
3640  000a 02            	rlwa	x,a
3641  000b 1f01          	ldw	(OFST-1,sp),x
3642                     ; 836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3644  000d c65329        	ld	a,21289
3645  0010 5f            	clrw	x
3646  0011 97            	ld	xl,a
3647  0012 01            	rrwa	x,a
3648  0013 1a02          	or	a,(OFST+0,sp)
3649  0015 01            	rrwa	x,a
3650  0016 1a01          	or	a,(OFST-1,sp)
3651  0018 01            	rrwa	x,a
3654  0019 5b02          	addw	sp,#2
3655  001b 81            	ret
3679                     ; 844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3679                     ; 845 {
3680                     .text:	section	.text,new
3681  0000               _TIM3_GetPrescaler:
3685                     ; 847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3687  0000 c6532a        	ld	a,21290
3690  0003 81            	ret
3812                     ; 861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3812                     ; 862 {
3813                     .text:	section	.text,new
3814  0000               _TIM3_GetFlagStatus:
3816  0000 89            	pushw	x
3817  0001 89            	pushw	x
3818       00000002      OFST:	set	2
3821                     ; 863   FlagStatus bitstatus = RESET;
3823  0002 7b02          	ld	a,(OFST+0,sp)
3824  0004 97            	ld	xl,a
3825                     ; 864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3827  0005 7b01          	ld	a,(OFST-1,sp)
3828  0007 97            	ld	xl,a
3831  0008 7b02          	ld	a,(OFST+0,sp)
3832  000a 97            	ld	xl,a
3833                     ; 867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3835  000b 1e03          	ldw	x,(OFST+1,sp)
3836  000d a30001        	cpw	x,#1
3837  0010 271c          	jreq	L044
3838  0012 1e03          	ldw	x,(OFST+1,sp)
3839  0014 a30002        	cpw	x,#2
3840  0017 2715          	jreq	L044
3841  0019 1e03          	ldw	x,(OFST+1,sp)
3842  001b a30004        	cpw	x,#4
3843  001e 270e          	jreq	L044
3844  0020 1e03          	ldw	x,(OFST+1,sp)
3845  0022 a30200        	cpw	x,#512
3846  0025 2707          	jreq	L044
3847  0027 1e03          	ldw	x,(OFST+1,sp)
3848  0029 a30400        	cpw	x,#1024
3849  002c 2603          	jrne	L634
3850  002e               L044:
3851  002e 4f            	clr	a
3852  002f 2010          	jra	L244
3853  0031               L634:
3854  0031 ae0363        	ldw	x,#867
3855  0034 89            	pushw	x
3856  0035 ae0000        	ldw	x,#0
3857  0038 89            	pushw	x
3858  0039 ae0000        	ldw	x,#L102
3859  003c cd0000        	call	_assert_failed
3861  003f 5b04          	addw	sp,#4
3862  0041               L244:
3863                     ; 869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3865  0041 c65322        	ld	a,21282
3866  0044 1404          	and	a,(OFST+2,sp)
3867  0046 6b01          	ld	(OFST-1,sp),a
3868                     ; 870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3870  0048 7b03          	ld	a,(OFST+1,sp)
3871  004a 6b02          	ld	(OFST+0,sp),a
3872                     ; 872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3874  004c c65323        	ld	a,21283
3875  004f 1402          	and	a,(OFST+0,sp)
3876  0051 1a01          	or	a,(OFST-1,sp)
3877  0053 2706          	jreq	L5341
3878                     ; 874     bitstatus = SET;
3880  0055 a601          	ld	a,#1
3881  0057 6b02          	ld	(OFST+0,sp),a
3883  0059 2002          	jra	L7341
3884  005b               L5341:
3885                     ; 878     bitstatus = RESET;
3887  005b 0f02          	clr	(OFST+0,sp)
3888  005d               L7341:
3889                     ; 880   return (FlagStatus)bitstatus;
3891  005d 7b02          	ld	a,(OFST+0,sp)
3894  005f 5b04          	addw	sp,#4
3895  0061 81            	ret
3931                     ; 894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3931                     ; 895 {
3932                     .text:	section	.text,new
3933  0000               _TIM3_ClearFlag:
3935  0000 89            	pushw	x
3936       00000000      OFST:	set	0
3939                     ; 897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3941  0001 01            	rrwa	x,a
3942  0002 a4f8          	and	a,#248
3943  0004 01            	rrwa	x,a
3944  0005 a4f9          	and	a,#249
3945  0007 01            	rrwa	x,a
3946  0008 a30000        	cpw	x,#0
3947  000b 2607          	jrne	L644
3948  000d 1e01          	ldw	x,(OFST+1,sp)
3949  000f 2703          	jreq	L644
3950  0011 4f            	clr	a
3951  0012 2010          	jra	L054
3952  0014               L644:
3953  0014 ae0381        	ldw	x,#897
3954  0017 89            	pushw	x
3955  0018 ae0000        	ldw	x,#0
3956  001b 89            	pushw	x
3957  001c ae0000        	ldw	x,#L102
3958  001f cd0000        	call	_assert_failed
3960  0022 5b04          	addw	sp,#4
3961  0024               L054:
3962                     ; 900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3964  0024 7b02          	ld	a,(OFST+2,sp)
3965  0026 43            	cpl	a
3966  0027 c75322        	ld	21282,a
3967                     ; 901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3969  002a 7b01          	ld	a,(OFST+1,sp)
3970  002c 43            	cpl	a
3971  002d c75323        	ld	21283,a
3972                     ; 902 }
3975  0030 85            	popw	x
3976  0031 81            	ret
4037                     ; 913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4037                     ; 914 {
4038                     .text:	section	.text,new
4039  0000               _TIM3_GetITStatus:
4041  0000 88            	push	a
4042  0001 89            	pushw	x
4043       00000002      OFST:	set	2
4046                     ; 915   ITStatus bitstatus = RESET;
4048  0002 7b02          	ld	a,(OFST+0,sp)
4049  0004 97            	ld	xl,a
4050                     ; 916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4052  0005 7b01          	ld	a,(OFST-1,sp)
4053  0007 97            	ld	xl,a
4056  0008 7b02          	ld	a,(OFST+0,sp)
4057  000a 97            	ld	xl,a
4058                     ; 919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4060  000b 7b03          	ld	a,(OFST+1,sp)
4061  000d a101          	cp	a,#1
4062  000f 270c          	jreq	L654
4063  0011 7b03          	ld	a,(OFST+1,sp)
4064  0013 a102          	cp	a,#2
4065  0015 2706          	jreq	L654
4066  0017 7b03          	ld	a,(OFST+1,sp)
4067  0019 a104          	cp	a,#4
4068  001b 2603          	jrne	L454
4069  001d               L654:
4070  001d 4f            	clr	a
4071  001e 2010          	jra	L064
4072  0020               L454:
4073  0020 ae0397        	ldw	x,#919
4074  0023 89            	pushw	x
4075  0024 ae0000        	ldw	x,#0
4076  0027 89            	pushw	x
4077  0028 ae0000        	ldw	x,#L102
4078  002b cd0000        	call	_assert_failed
4080  002e 5b04          	addw	sp,#4
4081  0030               L064:
4082                     ; 921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4084  0030 c65322        	ld	a,21282
4085  0033 1403          	and	a,(OFST+1,sp)
4086  0035 6b01          	ld	(OFST-1,sp),a
4087                     ; 923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4089  0037 c65321        	ld	a,21281
4090  003a 1403          	and	a,(OFST+1,sp)
4091  003c 6b02          	ld	(OFST+0,sp),a
4092                     ; 925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4094  003e 0d01          	tnz	(OFST-1,sp)
4095  0040 270a          	jreq	L5051
4097  0042 0d02          	tnz	(OFST+0,sp)
4098  0044 2706          	jreq	L5051
4099                     ; 927     bitstatus = SET;
4101  0046 a601          	ld	a,#1
4102  0048 6b02          	ld	(OFST+0,sp),a
4104  004a 2002          	jra	L7051
4105  004c               L5051:
4106                     ; 931     bitstatus = RESET;
4108  004c 0f02          	clr	(OFST+0,sp)
4109  004e               L7051:
4110                     ; 933   return (ITStatus)(bitstatus);
4112  004e 7b02          	ld	a,(OFST+0,sp)
4115  0050 5b03          	addw	sp,#3
4116  0052 81            	ret
4153                     ; 945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4153                     ; 946 {
4154                     .text:	section	.text,new
4155  0000               _TIM3_ClearITPendingBit:
4157  0000 88            	push	a
4158       00000000      OFST:	set	0
4161                     ; 948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
4163  0001 4d            	tnz	a
4164  0002 2707          	jreq	L464
4165  0004 a108          	cp	a,#8
4166  0006 2403          	jruge	L464
4167  0008 4f            	clr	a
4168  0009 2010          	jra	L664
4169  000b               L464:
4170  000b ae03b4        	ldw	x,#948
4171  000e 89            	pushw	x
4172  000f ae0000        	ldw	x,#0
4173  0012 89            	pushw	x
4174  0013 ae0000        	ldw	x,#L102
4175  0016 cd0000        	call	_assert_failed
4177  0019 5b04          	addw	sp,#4
4178  001b               L664:
4179                     ; 951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
4181  001b 7b01          	ld	a,(OFST+1,sp)
4182  001d 43            	cpl	a
4183  001e c75322        	ld	21282,a
4184                     ; 952 }
4187  0021 84            	pop	a
4188  0022 81            	ret
4234                     ; 970 static void TI1_Config(uint8_t TIM3_ICPolarity,
4234                     ; 971                        uint8_t TIM3_ICSelection,
4234                     ; 972                        uint8_t TIM3_ICFilter)
4234                     ; 973 {
4235                     .text:	section	.text,new
4236  0000               L3_TI1_Config:
4238  0000 89            	pushw	x
4239  0001 88            	push	a
4240       00000001      OFST:	set	1
4243                     ; 975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4245  0002 72115327      	bres	21287,#0
4246                     ; 978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4248  0006 7b06          	ld	a,(OFST+5,sp)
4249  0008 97            	ld	xl,a
4250  0009 a610          	ld	a,#16
4251  000b 42            	mul	x,a
4252  000c 9f            	ld	a,xl
4253  000d 1a03          	or	a,(OFST+2,sp)
4254  000f 6b01          	ld	(OFST+0,sp),a
4255  0011 c65325        	ld	a,21285
4256  0014 a40c          	and	a,#12
4257  0016 1a01          	or	a,(OFST+0,sp)
4258  0018 c75325        	ld	21285,a
4259                     ; 981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4261  001b 0d02          	tnz	(OFST+1,sp)
4262  001d 2706          	jreq	L7451
4263                     ; 983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
4265  001f 72125327      	bset	21287,#1
4267  0023 2004          	jra	L1551
4268  0025               L7451:
4269                     ; 987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4271  0025 72135327      	bres	21287,#1
4272  0029               L1551:
4273                     ; 990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
4275  0029 72105327      	bset	21287,#0
4276                     ; 991 }
4279  002d 5b03          	addw	sp,#3
4280  002f 81            	ret
4326                     ; 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
4326                     ; 1010                        uint8_t TIM3_ICSelection,
4326                     ; 1011                        uint8_t TIM3_ICFilter)
4326                     ; 1012 {
4327                     .text:	section	.text,new
4328  0000               L5_TI2_Config:
4330  0000 89            	pushw	x
4331  0001 88            	push	a
4332       00000001      OFST:	set	1
4335                     ; 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4337  0002 72195327      	bres	21287,#4
4338                     ; 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4338                     ; 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4338                     ; 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
4340  0006 7b06          	ld	a,(OFST+5,sp)
4341  0008 97            	ld	xl,a
4342  0009 a610          	ld	a,#16
4343  000b 42            	mul	x,a
4344  000c 9f            	ld	a,xl
4345  000d 1a03          	or	a,(OFST+2,sp)
4346  000f 6b01          	ld	(OFST+0,sp),a
4347  0011 c65326        	ld	a,21286
4348  0014 a40c          	and	a,#12
4349  0016 1a01          	or	a,(OFST+0,sp)
4350  0018 c75326        	ld	21286,a
4351                     ; 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4353  001b 0d02          	tnz	(OFST+1,sp)
4354  001d 2706          	jreq	L3751
4355                     ; 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
4357  001f 721a5327      	bset	21287,#5
4359  0023 2004          	jra	L5751
4360  0025               L3751:
4361                     ; 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4363  0025 721b5327      	bres	21287,#5
4364  0029               L5751:
4365                     ; 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
4367  0029 72185327      	bset	21287,#4
4368                     ; 1033 }
4371  002d 5b03          	addw	sp,#3
4372  002f 81            	ret
4385                     	xdef	_TIM3_ClearITPendingBit
4386                     	xdef	_TIM3_GetITStatus
4387                     	xdef	_TIM3_ClearFlag
4388                     	xdef	_TIM3_GetFlagStatus
4389                     	xdef	_TIM3_GetPrescaler
4390                     	xdef	_TIM3_GetCounter
4391                     	xdef	_TIM3_GetCapture2
4392                     	xdef	_TIM3_GetCapture1
4393                     	xdef	_TIM3_SetIC2Prescaler
4394                     	xdef	_TIM3_SetIC1Prescaler
4395                     	xdef	_TIM3_SetCompare2
4396                     	xdef	_TIM3_SetCompare1
4397                     	xdef	_TIM3_SetAutoreload
4398                     	xdef	_TIM3_SetCounter
4399                     	xdef	_TIM3_SelectOCxM
4400                     	xdef	_TIM3_CCxCmd
4401                     	xdef	_TIM3_OC2PolarityConfig
4402                     	xdef	_TIM3_OC1PolarityConfig
4403                     	xdef	_TIM3_GenerateEvent
4404                     	xdef	_TIM3_OC2PreloadConfig
4405                     	xdef	_TIM3_OC1PreloadConfig
4406                     	xdef	_TIM3_ARRPreloadConfig
4407                     	xdef	_TIM3_ForcedOC2Config
4408                     	xdef	_TIM3_ForcedOC1Config
4409                     	xdef	_TIM3_PrescalerConfig
4410                     	xdef	_TIM3_SelectOnePulseMode
4411                     	xdef	_TIM3_UpdateRequestConfig
4412                     	xdef	_TIM3_UpdateDisableConfig
4413                     	xdef	_TIM3_ITConfig
4414                     	xdef	_TIM3_Cmd
4415                     	xdef	_TIM3_PWMIConfig
4416                     	xdef	_TIM3_ICInit
4417                     	xdef	_TIM3_OC2Init
4418                     	xdef	_TIM3_OC1Init
4419                     	xdef	_TIM3_TimeBaseInit
4420                     	xdef	_TIM3_DeInit
4421                     	xref	_assert_failed
4422                     .const:	section	.text
4423  0000               L102:
4424  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
4425  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
4426  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
4427  0036 6d332e6300    	dc.b	"m3.c",0
4447                     	end
