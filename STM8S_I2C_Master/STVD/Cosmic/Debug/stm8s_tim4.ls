   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 49 void TIM4_DeInit(void)
  32                     ; 50 {
  34                     .text:	section	.text,new
  35  0000               _TIM4_DeInit:
  39                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  41  0000 725f5340      	clr	21312
  42                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  44  0004 725f5341      	clr	21313
  45                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  47  0008 725f5344      	clr	21316
  48                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  50  000c 725f5345      	clr	21317
  51                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  53  0010 35ff5346      	mov	21318,#255
  54                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  56  0014 725f5342      	clr	21314
  57                     ; 57 }
  60  0018 81            	ret
 165                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 165                     ; 66 {
 166                     .text:	section	.text,new
 167  0000               _TIM4_TimeBaseInit:
 169  0000 89            	pushw	x
 170       00000000      OFST:	set	0
 173                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 175  0001 9e            	ld	a,xh
 176  0002 4d            	tnz	a
 177  0003 2723          	jreq	L21
 178  0005 9e            	ld	a,xh
 179  0006 a101          	cp	a,#1
 180  0008 271e          	jreq	L21
 181  000a 9e            	ld	a,xh
 182  000b a102          	cp	a,#2
 183  000d 2719          	jreq	L21
 184  000f 9e            	ld	a,xh
 185  0010 a103          	cp	a,#3
 186  0012 2714          	jreq	L21
 187  0014 9e            	ld	a,xh
 188  0015 a104          	cp	a,#4
 189  0017 270f          	jreq	L21
 190  0019 9e            	ld	a,xh
 191  001a a105          	cp	a,#5
 192  001c 270a          	jreq	L21
 193  001e 9e            	ld	a,xh
 194  001f a106          	cp	a,#6
 195  0021 2705          	jreq	L21
 196  0023 9e            	ld	a,xh
 197  0024 a107          	cp	a,#7
 198  0026 2603          	jrne	L01
 199  0028               L21:
 200  0028 4f            	clr	a
 201  0029 2010          	jra	L41
 202  002b               L01:
 203  002b ae0044        	ldw	x,#68
 204  002e 89            	pushw	x
 205  002f ae0000        	ldw	x,#0
 206  0032 89            	pushw	x
 207  0033 ae0000        	ldw	x,#L56
 208  0036 cd0000        	call	_assert_failed
 210  0039 5b04          	addw	sp,#4
 211  003b               L41:
 212                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 214  003b 7b01          	ld	a,(OFST+1,sp)
 215  003d c75345        	ld	21317,a
 216                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 218  0040 7b02          	ld	a,(OFST+2,sp)
 219  0042 c75346        	ld	21318,a
 220                     ; 73 }
 223  0045 85            	popw	x
 224  0046 81            	ret
 280                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 280                     ; 82 {
 281                     .text:	section	.text,new
 282  0000               _TIM4_Cmd:
 284  0000 88            	push	a
 285       00000000      OFST:	set	0
 288                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 290  0001 4d            	tnz	a
 291  0002 2704          	jreq	L22
 292  0004 a101          	cp	a,#1
 293  0006 2603          	jrne	L02
 294  0008               L22:
 295  0008 4f            	clr	a
 296  0009 2010          	jra	L42
 297  000b               L02:
 298  000b ae0054        	ldw	x,#84
 299  000e 89            	pushw	x
 300  000f ae0000        	ldw	x,#0
 301  0012 89            	pushw	x
 302  0013 ae0000        	ldw	x,#L56
 303  0016 cd0000        	call	_assert_failed
 305  0019 5b04          	addw	sp,#4
 306  001b               L42:
 307                     ; 87   if (NewState != DISABLE)
 309  001b 0d01          	tnz	(OFST+1,sp)
 310  001d 2706          	jreq	L511
 311                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 313  001f 72105340      	bset	21312,#0
 315  0023 2004          	jra	L711
 316  0025               L511:
 317                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 319  0025 72115340      	bres	21312,#0
 320  0029               L711:
 321                     ; 95 }
 324  0029 84            	pop	a
 325  002a 81            	ret
 384                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 384                     ; 108 {
 385                     .text:	section	.text,new
 386  0000               _TIM4_ITConfig:
 388  0000 89            	pushw	x
 389       00000000      OFST:	set	0
 392                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 394  0001 9e            	ld	a,xh
 395  0002 a101          	cp	a,#1
 396  0004 2603          	jrne	L03
 397  0006 4f            	clr	a
 398  0007 2010          	jra	L23
 399  0009               L03:
 400  0009 ae006e        	ldw	x,#110
 401  000c 89            	pushw	x
 402  000d ae0000        	ldw	x,#0
 403  0010 89            	pushw	x
 404  0011 ae0000        	ldw	x,#L56
 405  0014 cd0000        	call	_assert_failed
 407  0017 5b04          	addw	sp,#4
 408  0019               L23:
 409                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 411  0019 0d02          	tnz	(OFST+2,sp)
 412  001b 2706          	jreq	L63
 413  001d 7b02          	ld	a,(OFST+2,sp)
 414  001f a101          	cp	a,#1
 415  0021 2603          	jrne	L43
 416  0023               L63:
 417  0023 4f            	clr	a
 418  0024 2010          	jra	L04
 419  0026               L43:
 420  0026 ae006f        	ldw	x,#111
 421  0029 89            	pushw	x
 422  002a ae0000        	ldw	x,#0
 423  002d 89            	pushw	x
 424  002e ae0000        	ldw	x,#L56
 425  0031 cd0000        	call	_assert_failed
 427  0034 5b04          	addw	sp,#4
 428  0036               L04:
 429                     ; 113   if (NewState != DISABLE)
 431  0036 0d02          	tnz	(OFST+2,sp)
 432  0038 270a          	jreq	L151
 433                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 435  003a c65341        	ld	a,21313
 436  003d 1a01          	or	a,(OFST+1,sp)
 437  003f c75341        	ld	21313,a
 439  0042 2009          	jra	L351
 440  0044               L151:
 441                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 443  0044 7b01          	ld	a,(OFST+1,sp)
 444  0046 43            	cpl	a
 445  0047 c45341        	and	a,21313
 446  004a c75341        	ld	21313,a
 447  004d               L351:
 448                     ; 123 }
 451  004d 85            	popw	x
 452  004e 81            	ret
 489                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 489                     ; 132 {
 490                     .text:	section	.text,new
 491  0000               _TIM4_UpdateDisableConfig:
 493  0000 88            	push	a
 494       00000000      OFST:	set	0
 497                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 499  0001 4d            	tnz	a
 500  0002 2704          	jreq	L64
 501  0004 a101          	cp	a,#1
 502  0006 2603          	jrne	L44
 503  0008               L64:
 504  0008 4f            	clr	a
 505  0009 2010          	jra	L05
 506  000b               L44:
 507  000b ae0086        	ldw	x,#134
 508  000e 89            	pushw	x
 509  000f ae0000        	ldw	x,#0
 510  0012 89            	pushw	x
 511  0013 ae0000        	ldw	x,#L56
 512  0016 cd0000        	call	_assert_failed
 514  0019 5b04          	addw	sp,#4
 515  001b               L05:
 516                     ; 137   if (NewState != DISABLE)
 518  001b 0d01          	tnz	(OFST+1,sp)
 519  001d 2706          	jreq	L371
 520                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 522  001f 72125340      	bset	21312,#1
 524  0023 2004          	jra	L571
 525  0025               L371:
 526                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 528  0025 72135340      	bres	21312,#1
 529  0029               L571:
 530                     ; 145 }
 533  0029 84            	pop	a
 534  002a 81            	ret
 593                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 593                     ; 156 {
 594                     .text:	section	.text,new
 595  0000               _TIM4_UpdateRequestConfig:
 597  0000 88            	push	a
 598       00000000      OFST:	set	0
 601                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 603  0001 4d            	tnz	a
 604  0002 2704          	jreq	L65
 605  0004 a101          	cp	a,#1
 606  0006 2603          	jrne	L45
 607  0008               L65:
 608  0008 4f            	clr	a
 609  0009 2010          	jra	L06
 610  000b               L45:
 611  000b ae009e        	ldw	x,#158
 612  000e 89            	pushw	x
 613  000f ae0000        	ldw	x,#0
 614  0012 89            	pushw	x
 615  0013 ae0000        	ldw	x,#L56
 616  0016 cd0000        	call	_assert_failed
 618  0019 5b04          	addw	sp,#4
 619  001b               L06:
 620                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 622  001b 0d01          	tnz	(OFST+1,sp)
 623  001d 2706          	jreq	L522
 624                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 626  001f 72145340      	bset	21312,#2
 628  0023 2004          	jra	L722
 629  0025               L522:
 630                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 632  0025 72155340      	bres	21312,#2
 633  0029               L722:
 634                     ; 169 }
 637  0029 84            	pop	a
 638  002a 81            	ret
 696                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 696                     ; 180 {
 697                     .text:	section	.text,new
 698  0000               _TIM4_SelectOnePulseMode:
 700  0000 88            	push	a
 701       00000000      OFST:	set	0
 704                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 706  0001 a101          	cp	a,#1
 707  0003 2703          	jreq	L66
 708  0005 4d            	tnz	a
 709  0006 2603          	jrne	L46
 710  0008               L66:
 711  0008 4f            	clr	a
 712  0009 2010          	jra	L07
 713  000b               L46:
 714  000b ae00b6        	ldw	x,#182
 715  000e 89            	pushw	x
 716  000f ae0000        	ldw	x,#0
 717  0012 89            	pushw	x
 718  0013 ae0000        	ldw	x,#L56
 719  0016 cd0000        	call	_assert_failed
 721  0019 5b04          	addw	sp,#4
 722  001b               L07:
 723                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 725  001b 0d01          	tnz	(OFST+1,sp)
 726  001d 2706          	jreq	L752
 727                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 729  001f 72165340      	bset	21312,#3
 731  0023 2004          	jra	L162
 732  0025               L752:
 733                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 735  0025 72175340      	bres	21312,#3
 736  0029               L162:
 737                     ; 193 }
 740  0029 84            	pop	a
 741  002a 81            	ret
 810                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 810                     ; 216 {
 811                     .text:	section	.text,new
 812  0000               _TIM4_PrescalerConfig:
 814  0000 89            	pushw	x
 815       00000000      OFST:	set	0
 818                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 820  0001 9f            	ld	a,xl
 821  0002 4d            	tnz	a
 822  0003 2705          	jreq	L67
 823  0005 9f            	ld	a,xl
 824  0006 a101          	cp	a,#1
 825  0008 2603          	jrne	L47
 826  000a               L67:
 827  000a 4f            	clr	a
 828  000b 2010          	jra	L001
 829  000d               L47:
 830  000d ae00da        	ldw	x,#218
 831  0010 89            	pushw	x
 832  0011 ae0000        	ldw	x,#0
 833  0014 89            	pushw	x
 834  0015 ae0000        	ldw	x,#L56
 835  0018 cd0000        	call	_assert_failed
 837  001b 5b04          	addw	sp,#4
 838  001d               L001:
 839                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 841  001d 0d01          	tnz	(OFST+1,sp)
 842  001f 272a          	jreq	L401
 843  0021 7b01          	ld	a,(OFST+1,sp)
 844  0023 a101          	cp	a,#1
 845  0025 2724          	jreq	L401
 846  0027 7b01          	ld	a,(OFST+1,sp)
 847  0029 a102          	cp	a,#2
 848  002b 271e          	jreq	L401
 849  002d 7b01          	ld	a,(OFST+1,sp)
 850  002f a103          	cp	a,#3
 851  0031 2718          	jreq	L401
 852  0033 7b01          	ld	a,(OFST+1,sp)
 853  0035 a104          	cp	a,#4
 854  0037 2712          	jreq	L401
 855  0039 7b01          	ld	a,(OFST+1,sp)
 856  003b a105          	cp	a,#5
 857  003d 270c          	jreq	L401
 858  003f 7b01          	ld	a,(OFST+1,sp)
 859  0041 a106          	cp	a,#6
 860  0043 2706          	jreq	L401
 861  0045 7b01          	ld	a,(OFST+1,sp)
 862  0047 a107          	cp	a,#7
 863  0049 2603          	jrne	L201
 864  004b               L401:
 865  004b 4f            	clr	a
 866  004c 2010          	jra	L601
 867  004e               L201:
 868  004e ae00db        	ldw	x,#219
 869  0051 89            	pushw	x
 870  0052 ae0000        	ldw	x,#0
 871  0055 89            	pushw	x
 872  0056 ae0000        	ldw	x,#L56
 873  0059 cd0000        	call	_assert_failed
 875  005c 5b04          	addw	sp,#4
 876  005e               L601:
 877                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 879  005e 7b01          	ld	a,(OFST+1,sp)
 880  0060 c75345        	ld	21317,a
 881                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 883  0063 7b02          	ld	a,(OFST+2,sp)
 884  0065 c75343        	ld	21315,a
 885                     ; 226 }
 888  0068 85            	popw	x
 889  0069 81            	ret
 926                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 926                     ; 235 {
 927                     .text:	section	.text,new
 928  0000               _TIM4_ARRPreloadConfig:
 930  0000 88            	push	a
 931       00000000      OFST:	set	0
 934                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 936  0001 4d            	tnz	a
 937  0002 2704          	jreq	L411
 938  0004 a101          	cp	a,#1
 939  0006 2603          	jrne	L211
 940  0008               L411:
 941  0008 4f            	clr	a
 942  0009 2010          	jra	L611
 943  000b               L211:
 944  000b ae00ed        	ldw	x,#237
 945  000e 89            	pushw	x
 946  000f ae0000        	ldw	x,#0
 947  0012 89            	pushw	x
 948  0013 ae0000        	ldw	x,#L56
 949  0016 cd0000        	call	_assert_failed
 951  0019 5b04          	addw	sp,#4
 952  001b               L611:
 953                     ; 240   if (NewState != DISABLE)
 955  001b 0d01          	tnz	(OFST+1,sp)
 956  001d 2706          	jreq	L333
 957                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 959  001f 721e5340      	bset	21312,#7
 961  0023 2004          	jra	L533
 962  0025               L333:
 963                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 965  0025 721f5340      	bres	21312,#7
 966  0029               L533:
 967                     ; 248 }
 970  0029 84            	pop	a
 971  002a 81            	ret
1021                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1021                     ; 258 {
1022                     .text:	section	.text,new
1023  0000               _TIM4_GenerateEvent:
1025  0000 88            	push	a
1026       00000000      OFST:	set	0
1029                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1031  0001 a101          	cp	a,#1
1032  0003 2603          	jrne	L221
1033  0005 4f            	clr	a
1034  0006 2010          	jra	L421
1035  0008               L221:
1036  0008 ae0104        	ldw	x,#260
1037  000b 89            	pushw	x
1038  000c ae0000        	ldw	x,#0
1039  000f 89            	pushw	x
1040  0010 ae0000        	ldw	x,#L56
1041  0013 cd0000        	call	_assert_failed
1043  0016 5b04          	addw	sp,#4
1044  0018               L421:
1045                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
1047  0018 7b01          	ld	a,(OFST+1,sp)
1048  001a c75343        	ld	21315,a
1049                     ; 264 }
1052  001d 84            	pop	a
1053  001e 81            	ret
1085                     ; 272 void TIM4_SetCounter(uint8_t Counter)
1085                     ; 273 {
1086                     .text:	section	.text,new
1087  0000               _TIM4_SetCounter:
1091                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
1093  0000 c75344        	ld	21316,a
1094                     ; 276 }
1097  0003 81            	ret
1129                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
1129                     ; 285 {
1130                     .text:	section	.text,new
1131  0000               _TIM4_SetAutoreload:
1135                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
1137  0000 c75346        	ld	21318,a
1138                     ; 288 }
1141  0003 81            	ret
1164                     ; 295 uint8_t TIM4_GetCounter(void)
1164                     ; 296 {
1165                     .text:	section	.text,new
1166  0000               _TIM4_GetCounter:
1170                     ; 298   return (uint8_t)(TIM4->CNTR);
1172  0000 c65344        	ld	a,21316
1175  0003 81            	ret
1199                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1199                     ; 307 {
1200                     .text:	section	.text,new
1201  0000               _TIM4_GetPrescaler:
1205                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1207  0000 c65345        	ld	a,21317
1210  0003 81            	ret
1290                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1290                     ; 320 {
1291                     .text:	section	.text,new
1292  0000               _TIM4_GetFlagStatus:
1294  0000 88            	push	a
1295  0001 88            	push	a
1296       00000001      OFST:	set	1
1299                     ; 321   FlagStatus bitstatus = RESET;
1301  0002 0f01          	clr	(OFST+0,sp)
1302                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1304  0004 a101          	cp	a,#1
1305  0006 2603          	jrne	L041
1306  0008 4f            	clr	a
1307  0009 2010          	jra	L241
1308  000b               L041:
1309  000b ae0144        	ldw	x,#324
1310  000e 89            	pushw	x
1311  000f ae0000        	ldw	x,#0
1312  0012 89            	pushw	x
1313  0013 ae0000        	ldw	x,#L56
1314  0016 cd0000        	call	_assert_failed
1316  0019 5b04          	addw	sp,#4
1317  001b               L241:
1318                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1320  001b c65342        	ld	a,21314
1321  001e 1502          	bcp	a,(OFST+1,sp)
1322  0020 2706          	jreq	L374
1323                     ; 328     bitstatus = SET;
1325  0022 a601          	ld	a,#1
1326  0024 6b01          	ld	(OFST+0,sp),a
1328  0026 2002          	jra	L574
1329  0028               L374:
1330                     ; 332     bitstatus = RESET;
1332  0028 0f01          	clr	(OFST+0,sp)
1333  002a               L574:
1334                     ; 334   return ((FlagStatus)bitstatus);
1336  002a 7b01          	ld	a,(OFST+0,sp)
1339  002c 85            	popw	x
1340  002d 81            	ret
1376                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1376                     ; 345 {
1377                     .text:	section	.text,new
1378  0000               _TIM4_ClearFlag:
1380  0000 88            	push	a
1381       00000000      OFST:	set	0
1384                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1386  0001 a101          	cp	a,#1
1387  0003 2603          	jrne	L641
1388  0005 4f            	clr	a
1389  0006 2010          	jra	L051
1390  0008               L641:
1391  0008 ae015b        	ldw	x,#347
1392  000b 89            	pushw	x
1393  000c ae0000        	ldw	x,#0
1394  000f 89            	pushw	x
1395  0010 ae0000        	ldw	x,#L56
1396  0013 cd0000        	call	_assert_failed
1398  0016 5b04          	addw	sp,#4
1399  0018               L051:
1400                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1402  0018 7b01          	ld	a,(OFST+1,sp)
1403  001a 43            	cpl	a
1404  001b c75342        	ld	21314,a
1405                     ; 351 }
1408  001e 84            	pop	a
1409  001f 81            	ret
1470                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1470                     ; 361 {
1471                     .text:	section	.text,new
1472  0000               _TIM4_GetITStatus:
1474  0000 88            	push	a
1475  0001 89            	pushw	x
1476       00000002      OFST:	set	2
1479                     ; 362   ITStatus bitstatus = RESET;
1481  0002 7b02          	ld	a,(OFST+0,sp)
1482  0004 97            	ld	xl,a
1483                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1485  0005 7b01          	ld	a,(OFST-1,sp)
1486  0007 97            	ld	xl,a
1489  0008 7b02          	ld	a,(OFST+0,sp)
1490  000a 97            	ld	xl,a
1491                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1493  000b 7b03          	ld	a,(OFST+1,sp)
1494  000d a101          	cp	a,#1
1495  000f 2603          	jrne	L451
1496  0011 4f            	clr	a
1497  0012 2010          	jra	L651
1498  0014               L451:
1499  0014 ae016f        	ldw	x,#367
1500  0017 89            	pushw	x
1501  0018 ae0000        	ldw	x,#0
1502  001b 89            	pushw	x
1503  001c ae0000        	ldw	x,#L56
1504  001f cd0000        	call	_assert_failed
1506  0022 5b04          	addw	sp,#4
1507  0024               L651:
1508                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1510  0024 c65342        	ld	a,21314
1511  0027 1403          	and	a,(OFST+1,sp)
1512  0029 6b01          	ld	(OFST-1,sp),a
1513                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1515  002b c65341        	ld	a,21313
1516  002e 1403          	and	a,(OFST+1,sp)
1517  0030 6b02          	ld	(OFST+0,sp),a
1518                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1520  0032 0d01          	tnz	(OFST-1,sp)
1521  0034 270a          	jreq	L345
1523  0036 0d02          	tnz	(OFST+0,sp)
1524  0038 2706          	jreq	L345
1525                     ; 375     bitstatus = (ITStatus)SET;
1527  003a a601          	ld	a,#1
1528  003c 6b02          	ld	(OFST+0,sp),a
1530  003e 2002          	jra	L545
1531  0040               L345:
1532                     ; 379     bitstatus = (ITStatus)RESET;
1534  0040 0f02          	clr	(OFST+0,sp)
1535  0042               L545:
1536                     ; 381   return ((ITStatus)bitstatus);
1538  0042 7b02          	ld	a,(OFST+0,sp)
1541  0044 5b03          	addw	sp,#3
1542  0046 81            	ret
1579                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1579                     ; 392 {
1580                     .text:	section	.text,new
1581  0000               _TIM4_ClearITPendingBit:
1583  0000 88            	push	a
1584       00000000      OFST:	set	0
1587                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1589  0001 a101          	cp	a,#1
1590  0003 2603          	jrne	L261
1591  0005 4f            	clr	a
1592  0006 2010          	jra	L461
1593  0008               L261:
1594  0008 ae018a        	ldw	x,#394
1595  000b 89            	pushw	x
1596  000c ae0000        	ldw	x,#0
1597  000f 89            	pushw	x
1598  0010 ae0000        	ldw	x,#L56
1599  0013 cd0000        	call	_assert_failed
1601  0016 5b04          	addw	sp,#4
1602  0018               L461:
1603                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1605  0018 7b01          	ld	a,(OFST+1,sp)
1606  001a 43            	cpl	a
1607  001b c75342        	ld	21314,a
1608                     ; 398 }
1611  001e 84            	pop	a
1612  001f 81            	ret
1625                     	xdef	_TIM4_ClearITPendingBit
1626                     	xdef	_TIM4_GetITStatus
1627                     	xdef	_TIM4_ClearFlag
1628                     	xdef	_TIM4_GetFlagStatus
1629                     	xdef	_TIM4_GetPrescaler
1630                     	xdef	_TIM4_GetCounter
1631                     	xdef	_TIM4_SetAutoreload
1632                     	xdef	_TIM4_SetCounter
1633                     	xdef	_TIM4_GenerateEvent
1634                     	xdef	_TIM4_ARRPreloadConfig
1635                     	xdef	_TIM4_PrescalerConfig
1636                     	xdef	_TIM4_SelectOnePulseMode
1637                     	xdef	_TIM4_UpdateRequestConfig
1638                     	xdef	_TIM4_UpdateDisableConfig
1639                     	xdef	_TIM4_ITConfig
1640                     	xdef	_TIM4_Cmd
1641                     	xdef	_TIM4_TimeBaseInit
1642                     	xdef	_TIM4_DeInit
1643                     	xref	_assert_failed
1644                     .const:	section	.text
1645  0000               L56:
1646  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
1647  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
1648  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
1649  0036 6d342e6300    	dc.b	"m4.c",0
1669                     	end
