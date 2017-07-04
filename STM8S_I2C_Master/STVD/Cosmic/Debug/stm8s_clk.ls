   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _HSIDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004               _CLKPrescTable:
  11  0004 01            	dc.b	1
  12  0005 02            	dc.b	2
  13  0006 04            	dc.b	4
  14  0007 08            	dc.b	8
  15  0008 0a            	dc.b	10
  16  0009 10            	dc.b	16
  17  000a 14            	dc.b	20
  18  000b 28            	dc.b	40
  47                     ; 72 void CLK_DeInit(void)
  47                     ; 73 {
  49                     .text:	section	.text,new
  50  0000               _CLK_DeInit:
  54                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  56  0000 350150c0      	mov	20672,#1
  57                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  59  0004 725f50c1      	clr	20673
  60                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  62  0008 35e150c4      	mov	20676,#225
  63                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  65  000c 725f50c5      	clr	20677
  66                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  68  0010 351850c6      	mov	20678,#24
  69                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  71  0014 35ff50c7      	mov	20679,#255
  72                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  74  0018 35ff50ca      	mov	20682,#255
  75                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  77  001c 725f50c8      	clr	20680
  78                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  80  0020 725f50c9      	clr	20681
  82  0024               L52:
  83                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  85  0024 c650c9        	ld	a,20681
  86  0027 a501          	bcp	a,#1
  87  0029 26f9          	jrne	L52
  88                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  002b 725f50c9      	clr	20681
  91                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  93  002f 725f50cc      	clr	20684
  94                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  96  0033 725f50cd      	clr	20685
  97                     ; 88 }
 100  0037 81            	ret
 157                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 157                     ; 100 {
 158                     .text:	section	.text,new
 159  0000               _CLK_FastHaltWakeUpCmd:
 161  0000 88            	push	a
 162       00000000      OFST:	set	0
 165                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 167  0001 4d            	tnz	a
 168  0002 2704          	jreq	L21
 169  0004 a101          	cp	a,#1
 170  0006 2603          	jrne	L01
 171  0008               L21:
 172  0008 4f            	clr	a
 173  0009 2010          	jra	L41
 174  000b               L01:
 175  000b ae0066        	ldw	x,#102
 176  000e 89            	pushw	x
 177  000f ae0000        	ldw	x,#0
 178  0012 89            	pushw	x
 179  0013 ae000c        	ldw	x,#L75
 180  0016 cd0000        	call	_assert_failed
 182  0019 5b04          	addw	sp,#4
 183  001b               L41:
 184                     ; 104   if (NewState != DISABLE)
 186  001b 0d01          	tnz	(OFST+1,sp)
 187  001d 2706          	jreq	L16
 188                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 190  001f 721450c0      	bset	20672,#2
 192  0023 2004          	jra	L36
 193  0025               L16:
 194                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 196  0025 721550c0      	bres	20672,#2
 197  0029               L36:
 198                     ; 114 }
 201  0029 84            	pop	a
 202  002a 81            	ret
 238                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 238                     ; 122 {
 239                     .text:	section	.text,new
 240  0000               _CLK_HSECmd:
 242  0000 88            	push	a
 243       00000000      OFST:	set	0
 246                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 248  0001 4d            	tnz	a
 249  0002 2704          	jreq	L22
 250  0004 a101          	cp	a,#1
 251  0006 2603          	jrne	L02
 252  0008               L22:
 253  0008 4f            	clr	a
 254  0009 2010          	jra	L42
 255  000b               L02:
 256  000b ae007c        	ldw	x,#124
 257  000e 89            	pushw	x
 258  000f ae0000        	ldw	x,#0
 259  0012 89            	pushw	x
 260  0013 ae000c        	ldw	x,#L75
 261  0016 cd0000        	call	_assert_failed
 263  0019 5b04          	addw	sp,#4
 264  001b               L42:
 265                     ; 126   if (NewState != DISABLE)
 267  001b 0d01          	tnz	(OFST+1,sp)
 268  001d 2706          	jreq	L301
 269                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 271  001f 721050c1      	bset	20673,#0
 273  0023 2004          	jra	L501
 274  0025               L301:
 275                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 277  0025 721150c1      	bres	20673,#0
 278  0029               L501:
 279                     ; 136 }
 282  0029 84            	pop	a
 283  002a 81            	ret
 319                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 319                     ; 144 {
 320                     .text:	section	.text,new
 321  0000               _CLK_HSICmd:
 323  0000 88            	push	a
 324       00000000      OFST:	set	0
 327                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 329  0001 4d            	tnz	a
 330  0002 2704          	jreq	L23
 331  0004 a101          	cp	a,#1
 332  0006 2603          	jrne	L03
 333  0008               L23:
 334  0008 4f            	clr	a
 335  0009 2010          	jra	L43
 336  000b               L03:
 337  000b ae0092        	ldw	x,#146
 338  000e 89            	pushw	x
 339  000f ae0000        	ldw	x,#0
 340  0012 89            	pushw	x
 341  0013 ae000c        	ldw	x,#L75
 342  0016 cd0000        	call	_assert_failed
 344  0019 5b04          	addw	sp,#4
 345  001b               L43:
 346                     ; 148   if (NewState != DISABLE)
 348  001b 0d01          	tnz	(OFST+1,sp)
 349  001d 2706          	jreq	L521
 350                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 352  001f 721050c0      	bset	20672,#0
 354  0023 2004          	jra	L721
 355  0025               L521:
 356                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 358  0025 721150c0      	bres	20672,#0
 359  0029               L721:
 360                     ; 158 }
 363  0029 84            	pop	a
 364  002a 81            	ret
 400                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 400                     ; 167 {
 401                     .text:	section	.text,new
 402  0000               _CLK_LSICmd:
 404  0000 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410  0001 4d            	tnz	a
 411  0002 2704          	jreq	L24
 412  0004 a101          	cp	a,#1
 413  0006 2603          	jrne	L04
 414  0008               L24:
 415  0008 4f            	clr	a
 416  0009 2010          	jra	L44
 417  000b               L04:
 418  000b ae00a9        	ldw	x,#169
 419  000e 89            	pushw	x
 420  000f ae0000        	ldw	x,#0
 421  0012 89            	pushw	x
 422  0013 ae000c        	ldw	x,#L75
 423  0016 cd0000        	call	_assert_failed
 425  0019 5b04          	addw	sp,#4
 426  001b               L44:
 427                     ; 171   if (NewState != DISABLE)
 429  001b 0d01          	tnz	(OFST+1,sp)
 430  001d 2706          	jreq	L741
 431                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 433  001f 721650c0      	bset	20672,#3
 435  0023 2004          	jra	L151
 436  0025               L741:
 437                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 439  0025 721750c0      	bres	20672,#3
 440  0029               L151:
 441                     ; 181 }
 444  0029 84            	pop	a
 445  002a 81            	ret
 481                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 481                     ; 190 {
 482                     .text:	section	.text,new
 483  0000               _CLK_CCOCmd:
 485  0000 88            	push	a
 486       00000000      OFST:	set	0
 489                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 491  0001 4d            	tnz	a
 492  0002 2704          	jreq	L25
 493  0004 a101          	cp	a,#1
 494  0006 2603          	jrne	L05
 495  0008               L25:
 496  0008 4f            	clr	a
 497  0009 2010          	jra	L45
 498  000b               L05:
 499  000b ae00c0        	ldw	x,#192
 500  000e 89            	pushw	x
 501  000f ae0000        	ldw	x,#0
 502  0012 89            	pushw	x
 503  0013 ae000c        	ldw	x,#L75
 504  0016 cd0000        	call	_assert_failed
 506  0019 5b04          	addw	sp,#4
 507  001b               L45:
 508                     ; 194   if (NewState != DISABLE)
 510  001b 0d01          	tnz	(OFST+1,sp)
 511  001d 2706          	jreq	L171
 512                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 514  001f 721050c9      	bset	20681,#0
 516  0023 2004          	jra	L371
 517  0025               L171:
 518                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 520  0025 721150c9      	bres	20681,#0
 521  0029               L371:
 522                     ; 204 }
 525  0029 84            	pop	a
 526  002a 81            	ret
 562                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 562                     ; 214 {
 563                     .text:	section	.text,new
 564  0000               _CLK_ClockSwitchCmd:
 566  0000 88            	push	a
 567       00000000      OFST:	set	0
 570                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 572  0001 4d            	tnz	a
 573  0002 2704          	jreq	L26
 574  0004 a101          	cp	a,#1
 575  0006 2603          	jrne	L06
 576  0008               L26:
 577  0008 4f            	clr	a
 578  0009 2010          	jra	L46
 579  000b               L06:
 580  000b ae00d8        	ldw	x,#216
 581  000e 89            	pushw	x
 582  000f ae0000        	ldw	x,#0
 583  0012 89            	pushw	x
 584  0013 ae000c        	ldw	x,#L75
 585  0016 cd0000        	call	_assert_failed
 587  0019 5b04          	addw	sp,#4
 588  001b               L46:
 589                     ; 218   if (NewState != DISABLE )
 591  001b 0d01          	tnz	(OFST+1,sp)
 592  001d 2706          	jreq	L312
 593                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 595  001f 721250c5      	bset	20677,#1
 597  0023 2004          	jra	L512
 598  0025               L312:
 599                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 601  0025 721350c5      	bres	20677,#1
 602  0029               L512:
 603                     ; 228 }
 606  0029 84            	pop	a
 607  002a 81            	ret
 644                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 644                     ; 239 {
 645                     .text:	section	.text,new
 646  0000               _CLK_SlowActiveHaltWakeUpCmd:
 648  0000 88            	push	a
 649       00000000      OFST:	set	0
 652                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 654  0001 4d            	tnz	a
 655  0002 2704          	jreq	L27
 656  0004 a101          	cp	a,#1
 657  0006 2603          	jrne	L07
 658  0008               L27:
 659  0008 4f            	clr	a
 660  0009 2010          	jra	L47
 661  000b               L07:
 662  000b ae00f1        	ldw	x,#241
 663  000e 89            	pushw	x
 664  000f ae0000        	ldw	x,#0
 665  0012 89            	pushw	x
 666  0013 ae000c        	ldw	x,#L75
 667  0016 cd0000        	call	_assert_failed
 669  0019 5b04          	addw	sp,#4
 670  001b               L47:
 671                     ; 243   if (NewState != DISABLE)
 673  001b 0d01          	tnz	(OFST+1,sp)
 674  001d 2706          	jreq	L532
 675                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 677  001f 721a50c0      	bset	20672,#5
 679  0023 2004          	jra	L732
 680  0025               L532:
 681                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 683  0025 721b50c0      	bres	20672,#5
 684  0029               L732:
 685                     ; 253 }
 688  0029 84            	pop	a
 689  002a 81            	ret
 849                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 849                     ; 264 {
 850                     .text:	section	.text,new
 851  0000               _CLK_PeripheralClockConfig:
 853  0000 89            	pushw	x
 854       00000000      OFST:	set	0
 857                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859  0001 9f            	ld	a,xl
 860  0002 4d            	tnz	a
 861  0003 2705          	jreq	L201
 862  0005 9f            	ld	a,xl
 863  0006 a101          	cp	a,#1
 864  0008 2603          	jrne	L001
 865  000a               L201:
 866  000a 4f            	clr	a
 867  000b 2010          	jra	L401
 868  000d               L001:
 869  000d ae010a        	ldw	x,#266
 870  0010 89            	pushw	x
 871  0011 ae0000        	ldw	x,#0
 872  0014 89            	pushw	x
 873  0015 ae000c        	ldw	x,#L75
 874  0018 cd0000        	call	_assert_failed
 876  001b 5b04          	addw	sp,#4
 877  001d               L401:
 878                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 880  001d 0d01          	tnz	(OFST+1,sp)
 881  001f 274e          	jreq	L011
 882  0021 7b01          	ld	a,(OFST+1,sp)
 883  0023 a101          	cp	a,#1
 884  0025 2748          	jreq	L011
 885  0027 7b01          	ld	a,(OFST+1,sp)
 886  0029 a103          	cp	a,#3
 887  002b 2742          	jreq	L011
 888  002d 7b01          	ld	a,(OFST+1,sp)
 889  002f a103          	cp	a,#3
 890  0031 273c          	jreq	L011
 891  0033 7b01          	ld	a,(OFST+1,sp)
 892  0035 a103          	cp	a,#3
 893  0037 2736          	jreq	L011
 894  0039 7b01          	ld	a,(OFST+1,sp)
 895  003b a104          	cp	a,#4
 896  003d 2730          	jreq	L011
 897  003f 7b01          	ld	a,(OFST+1,sp)
 898  0041 a105          	cp	a,#5
 899  0043 272a          	jreq	L011
 900  0045 7b01          	ld	a,(OFST+1,sp)
 901  0047 a105          	cp	a,#5
 902  0049 2724          	jreq	L011
 903  004b 7b01          	ld	a,(OFST+1,sp)
 904  004d a104          	cp	a,#4
 905  004f 271e          	jreq	L011
 906  0051 7b01          	ld	a,(OFST+1,sp)
 907  0053 a106          	cp	a,#6
 908  0055 2718          	jreq	L011
 909  0057 7b01          	ld	a,(OFST+1,sp)
 910  0059 a107          	cp	a,#7
 911  005b 2712          	jreq	L011
 912  005d 7b01          	ld	a,(OFST+1,sp)
 913  005f a117          	cp	a,#23
 914  0061 270c          	jreq	L011
 915  0063 7b01          	ld	a,(OFST+1,sp)
 916  0065 a113          	cp	a,#19
 917  0067 2706          	jreq	L011
 918  0069 7b01          	ld	a,(OFST+1,sp)
 919  006b a112          	cp	a,#18
 920  006d 2603          	jrne	L601
 921  006f               L011:
 922  006f 4f            	clr	a
 923  0070 2010          	jra	L211
 924  0072               L601:
 925  0072 ae010b        	ldw	x,#267
 926  0075 89            	pushw	x
 927  0076 ae0000        	ldw	x,#0
 928  0079 89            	pushw	x
 929  007a ae000c        	ldw	x,#L75
 930  007d cd0000        	call	_assert_failed
 932  0080 5b04          	addw	sp,#4
 933  0082               L211:
 934                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 936  0082 7b01          	ld	a,(OFST+1,sp)
 937  0084 a510          	bcp	a,#16
 938  0086 2633          	jrne	L323
 939                     ; 271     if (NewState != DISABLE)
 941  0088 0d02          	tnz	(OFST+2,sp)
 942  008a 2717          	jreq	L523
 943                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 945  008c 7b01          	ld	a,(OFST+1,sp)
 946  008e a40f          	and	a,#15
 947  0090 5f            	clrw	x
 948  0091 97            	ld	xl,a
 949  0092 a601          	ld	a,#1
 950  0094 5d            	tnzw	x
 951  0095 2704          	jreq	L411
 952  0097               L611:
 953  0097 48            	sll	a
 954  0098 5a            	decw	x
 955  0099 26fc          	jrne	L611
 956  009b               L411:
 957  009b ca50c7        	or	a,20679
 958  009e c750c7        	ld	20679,a
 960  00a1 2049          	jra	L133
 961  00a3               L523:
 962                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 964  00a3 7b01          	ld	a,(OFST+1,sp)
 965  00a5 a40f          	and	a,#15
 966  00a7 5f            	clrw	x
 967  00a8 97            	ld	xl,a
 968  00a9 a601          	ld	a,#1
 969  00ab 5d            	tnzw	x
 970  00ac 2704          	jreq	L021
 971  00ae               L221:
 972  00ae 48            	sll	a
 973  00af 5a            	decw	x
 974  00b0 26fc          	jrne	L221
 975  00b2               L021:
 976  00b2 43            	cpl	a
 977  00b3 c450c7        	and	a,20679
 978  00b6 c750c7        	ld	20679,a
 979  00b9 2031          	jra	L133
 980  00bb               L323:
 981                     ; 284     if (NewState != DISABLE)
 983  00bb 0d02          	tnz	(OFST+2,sp)
 984  00bd 2717          	jreq	L333
 985                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 987  00bf 7b01          	ld	a,(OFST+1,sp)
 988  00c1 a40f          	and	a,#15
 989  00c3 5f            	clrw	x
 990  00c4 97            	ld	xl,a
 991  00c5 a601          	ld	a,#1
 992  00c7 5d            	tnzw	x
 993  00c8 2704          	jreq	L421
 994  00ca               L621:
 995  00ca 48            	sll	a
 996  00cb 5a            	decw	x
 997  00cc 26fc          	jrne	L621
 998  00ce               L421:
 999  00ce ca50ca        	or	a,20682
1000  00d1 c750ca        	ld	20682,a
1002  00d4 2016          	jra	L133
1003  00d6               L333:
1004                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1006  00d6 7b01          	ld	a,(OFST+1,sp)
1007  00d8 a40f          	and	a,#15
1008  00da 5f            	clrw	x
1009  00db 97            	ld	xl,a
1010  00dc a601          	ld	a,#1
1011  00de 5d            	tnzw	x
1012  00df 2704          	jreq	L031
1013  00e1               L231:
1014  00e1 48            	sll	a
1015  00e2 5a            	decw	x
1016  00e3 26fc          	jrne	L231
1017  00e5               L031:
1018  00e5 43            	cpl	a
1019  00e6 c450ca        	and	a,20682
1020  00e9 c750ca        	ld	20682,a
1021  00ec               L133:
1022                     ; 295 }
1025  00ec 85            	popw	x
1026  00ed 81            	ret
1213                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1213                     ; 310 {
1214                     .text:	section	.text,new
1215  0000               _CLK_ClockSwitchConfig:
1217  0000 89            	pushw	x
1218  0001 5204          	subw	sp,#4
1219       00000004      OFST:	set	4
1222                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1224  0003 aeffff        	ldw	x,#65535
1225  0006 1f03          	ldw	(OFST-1,sp),x
1226                     ; 313   ErrorStatus Swif = ERROR;
1228  0008 7b02          	ld	a,(OFST-2,sp)
1229  000a 97            	ld	xl,a
1230                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1232  000b 7b06          	ld	a,(OFST+2,sp)
1233  000d a1e1          	cp	a,#225
1234  000f 270c          	jreq	L041
1235  0011 7b06          	ld	a,(OFST+2,sp)
1236  0013 a1d2          	cp	a,#210
1237  0015 2706          	jreq	L041
1238  0017 7b06          	ld	a,(OFST+2,sp)
1239  0019 a1b4          	cp	a,#180
1240  001b 2603          	jrne	L631
1241  001d               L041:
1242  001d 4f            	clr	a
1243  001e 2010          	jra	L241
1244  0020               L631:
1245  0020 ae013c        	ldw	x,#316
1246  0023 89            	pushw	x
1247  0024 ae0000        	ldw	x,#0
1248  0027 89            	pushw	x
1249  0028 ae000c        	ldw	x,#L75
1250  002b cd0000        	call	_assert_failed
1252  002e 5b04          	addw	sp,#4
1253  0030               L241:
1254                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1256  0030 0d05          	tnz	(OFST+1,sp)
1257  0032 2706          	jreq	L641
1258  0034 7b05          	ld	a,(OFST+1,sp)
1259  0036 a101          	cp	a,#1
1260  0038 2603          	jrne	L441
1261  003a               L641:
1262  003a 4f            	clr	a
1263  003b 2010          	jra	L051
1264  003d               L441:
1265  003d ae013d        	ldw	x,#317
1266  0040 89            	pushw	x
1267  0041 ae0000        	ldw	x,#0
1268  0044 89            	pushw	x
1269  0045 ae000c        	ldw	x,#L75
1270  0048 cd0000        	call	_assert_failed
1272  004b 5b04          	addw	sp,#4
1273  004d               L051:
1274                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1276  004d 0d09          	tnz	(OFST+5,sp)
1277  004f 2706          	jreq	L451
1278  0051 7b09          	ld	a,(OFST+5,sp)
1279  0053 a101          	cp	a,#1
1280  0055 2603          	jrne	L251
1281  0057               L451:
1282  0057 4f            	clr	a
1283  0058 2010          	jra	L651
1284  005a               L251:
1285  005a ae013e        	ldw	x,#318
1286  005d 89            	pushw	x
1287  005e ae0000        	ldw	x,#0
1288  0061 89            	pushw	x
1289  0062 ae000c        	ldw	x,#L75
1290  0065 cd0000        	call	_assert_failed
1292  0068 5b04          	addw	sp,#4
1293  006a               L651:
1294                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1296  006a 0d0a          	tnz	(OFST+6,sp)
1297  006c 2706          	jreq	L261
1298  006e 7b0a          	ld	a,(OFST+6,sp)
1299  0070 a101          	cp	a,#1
1300  0072 2603          	jrne	L061
1301  0074               L261:
1302  0074 4f            	clr	a
1303  0075 2010          	jra	L461
1304  0077               L061:
1305  0077 ae013f        	ldw	x,#319
1306  007a 89            	pushw	x
1307  007b ae0000        	ldw	x,#0
1308  007e 89            	pushw	x
1309  007f ae000c        	ldw	x,#L75
1310  0082 cd0000        	call	_assert_failed
1312  0085 5b04          	addw	sp,#4
1313  0087               L461:
1314                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1316  0087 c650c3        	ld	a,20675
1317  008a 6b01          	ld	(OFST-3,sp),a
1318                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1320  008c 7b05          	ld	a,(OFST+1,sp)
1321  008e a101          	cp	a,#1
1322  0090 264b          	jrne	L544
1323                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1325  0092 721250c5      	bset	20677,#1
1326                     ; 331     if (ITState != DISABLE)
1328  0096 0d09          	tnz	(OFST+5,sp)
1329  0098 2706          	jreq	L744
1330                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1332  009a 721450c5      	bset	20677,#2
1334  009e 2004          	jra	L154
1335  00a0               L744:
1336                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1338  00a0 721550c5      	bres	20677,#2
1339  00a4               L154:
1340                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1342  00a4 7b06          	ld	a,(OFST+2,sp)
1343  00a6 c750c4        	ld	20676,a
1345  00a9 2007          	jra	L754
1346  00ab               L354:
1347                     ; 346       DownCounter--;
1349  00ab 1e03          	ldw	x,(OFST-1,sp)
1350  00ad 1d0001        	subw	x,#1
1351  00b0 1f03          	ldw	(OFST-1,sp),x
1352  00b2               L754:
1353                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1355  00b2 c650c5        	ld	a,20677
1356  00b5 a501          	bcp	a,#1
1357  00b7 2704          	jreq	L364
1359  00b9 1e03          	ldw	x,(OFST-1,sp)
1360  00bb 26ee          	jrne	L354
1361  00bd               L364:
1362                     ; 349     if(DownCounter != 0)
1364  00bd 1e03          	ldw	x,(OFST-1,sp)
1365  00bf 2706          	jreq	L564
1366                     ; 351       Swif = SUCCESS;
1368  00c1 a601          	ld	a,#1
1369  00c3 6b02          	ld	(OFST-2,sp),a
1371  00c5 2002          	jra	L174
1372  00c7               L564:
1373                     ; 355       Swif = ERROR;
1375  00c7 0f02          	clr	(OFST-2,sp)
1376  00c9               L174:
1377                     ; 390   if(Swif != ERROR)
1379  00c9 0d02          	tnz	(OFST-2,sp)
1380  00cb 2767          	jreq	L515
1381                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1383  00cd 0d0a          	tnz	(OFST+6,sp)
1384  00cf 2645          	jrne	L715
1386  00d1 7b01          	ld	a,(OFST-3,sp)
1387  00d3 a1e1          	cp	a,#225
1388  00d5 263f          	jrne	L715
1389                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1391  00d7 721150c0      	bres	20672,#0
1393  00db 2057          	jra	L515
1394  00dd               L544:
1395                     ; 361     if (ITState != DISABLE)
1397  00dd 0d09          	tnz	(OFST+5,sp)
1398  00df 2706          	jreq	L374
1399                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1401  00e1 721450c5      	bset	20677,#2
1403  00e5 2004          	jra	L574
1404  00e7               L374:
1405                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1407  00e7 721550c5      	bres	20677,#2
1408  00eb               L574:
1409                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1411  00eb 7b06          	ld	a,(OFST+2,sp)
1412  00ed c750c4        	ld	20676,a
1414  00f0 2007          	jra	L305
1415  00f2               L774:
1416                     ; 376       DownCounter--;
1418  00f2 1e03          	ldw	x,(OFST-1,sp)
1419  00f4 1d0001        	subw	x,#1
1420  00f7 1f03          	ldw	(OFST-1,sp),x
1421  00f9               L305:
1422                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1424  00f9 c650c5        	ld	a,20677
1425  00fc a508          	bcp	a,#8
1426  00fe 2704          	jreq	L705
1428  0100 1e03          	ldw	x,(OFST-1,sp)
1429  0102 26ee          	jrne	L774
1430  0104               L705:
1431                     ; 379     if(DownCounter != 0)
1433  0104 1e03          	ldw	x,(OFST-1,sp)
1434  0106 270a          	jreq	L115
1435                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1437  0108 721250c5      	bset	20677,#1
1438                     ; 383       Swif = SUCCESS;
1440  010c a601          	ld	a,#1
1441  010e 6b02          	ld	(OFST-2,sp),a
1443  0110 20b7          	jra	L174
1444  0112               L115:
1445                     ; 387       Swif = ERROR;
1447  0112 0f02          	clr	(OFST-2,sp)
1448  0114 20b3          	jra	L174
1449  0116               L715:
1450                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1452  0116 0d0a          	tnz	(OFST+6,sp)
1453  0118 260c          	jrne	L325
1455  011a 7b01          	ld	a,(OFST-3,sp)
1456  011c a1d2          	cp	a,#210
1457  011e 2606          	jrne	L325
1458                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1460  0120 721750c0      	bres	20672,#3
1462  0124 200e          	jra	L515
1463  0126               L325:
1464                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1466  0126 0d0a          	tnz	(OFST+6,sp)
1467  0128 260a          	jrne	L515
1469  012a 7b01          	ld	a,(OFST-3,sp)
1470  012c a1b4          	cp	a,#180
1471  012e 2604          	jrne	L515
1472                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1474  0130 721150c1      	bres	20673,#0
1475  0134               L515:
1476                     ; 406   return(Swif);
1478  0134 7b02          	ld	a,(OFST-2,sp)
1481  0136 5b06          	addw	sp,#6
1482  0138 81            	ret
1621                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1621                     ; 416 {
1622                     .text:	section	.text,new
1623  0000               _CLK_HSIPrescalerConfig:
1625  0000 88            	push	a
1626       00000000      OFST:	set	0
1629                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1631  0001 4d            	tnz	a
1632  0002 270c          	jreq	L271
1633  0004 a108          	cp	a,#8
1634  0006 2708          	jreq	L271
1635  0008 a110          	cp	a,#16
1636  000a 2704          	jreq	L271
1637  000c a118          	cp	a,#24
1638  000e 2603          	jrne	L071
1639  0010               L271:
1640  0010 4f            	clr	a
1641  0011 2010          	jra	L471
1642  0013               L071:
1643  0013 ae01a2        	ldw	x,#418
1644  0016 89            	pushw	x
1645  0017 ae0000        	ldw	x,#0
1646  001a 89            	pushw	x
1647  001b ae000c        	ldw	x,#L75
1648  001e cd0000        	call	_assert_failed
1650  0021 5b04          	addw	sp,#4
1651  0023               L471:
1652                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1654  0023 c650c6        	ld	a,20678
1655  0026 a4e7          	and	a,#231
1656  0028 c750c6        	ld	20678,a
1657                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1659  002b c650c6        	ld	a,20678
1660  002e 1a01          	or	a,(OFST+1,sp)
1661  0030 c750c6        	ld	20678,a
1662                     ; 425 }
1665  0033 84            	pop	a
1666  0034 81            	ret
1802                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1802                     ; 437 {
1803                     .text:	section	.text,new
1804  0000               _CLK_CCOConfig:
1806  0000 88            	push	a
1807       00000000      OFST:	set	0
1810                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1812  0001 4d            	tnz	a
1813  0002 2730          	jreq	L202
1814  0004 a104          	cp	a,#4
1815  0006 272c          	jreq	L202
1816  0008 a102          	cp	a,#2
1817  000a 2728          	jreq	L202
1818  000c a108          	cp	a,#8
1819  000e 2724          	jreq	L202
1820  0010 a10a          	cp	a,#10
1821  0012 2720          	jreq	L202
1822  0014 a10c          	cp	a,#12
1823  0016 271c          	jreq	L202
1824  0018 a10e          	cp	a,#14
1825  001a 2718          	jreq	L202
1826  001c a110          	cp	a,#16
1827  001e 2714          	jreq	L202
1828  0020 a112          	cp	a,#18
1829  0022 2710          	jreq	L202
1830  0024 a114          	cp	a,#20
1831  0026 270c          	jreq	L202
1832  0028 a116          	cp	a,#22
1833  002a 2708          	jreq	L202
1834  002c a118          	cp	a,#24
1835  002e 2704          	jreq	L202
1836  0030 a11a          	cp	a,#26
1837  0032 2603          	jrne	L002
1838  0034               L202:
1839  0034 4f            	clr	a
1840  0035 2010          	jra	L402
1841  0037               L002:
1842  0037 ae01b7        	ldw	x,#439
1843  003a 89            	pushw	x
1844  003b ae0000        	ldw	x,#0
1845  003e 89            	pushw	x
1846  003f ae000c        	ldw	x,#L75
1847  0042 cd0000        	call	_assert_failed
1849  0045 5b04          	addw	sp,#4
1850  0047               L402:
1851                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1853  0047 c650c9        	ld	a,20681
1854  004a a4e1          	and	a,#225
1855  004c c750c9        	ld	20681,a
1856                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1858  004f c650c9        	ld	a,20681
1859  0052 1a01          	or	a,(OFST+1,sp)
1860  0054 c750c9        	ld	20681,a
1861                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1863  0057 721050c9      	bset	20681,#0
1864                     ; 449 }
1867  005b 84            	pop	a
1868  005c 81            	ret
1934                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1934                     ; 460 {
1935                     .text:	section	.text,new
1936  0000               _CLK_ITConfig:
1938  0000 89            	pushw	x
1939       00000000      OFST:	set	0
1942                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1944  0001 9f            	ld	a,xl
1945  0002 4d            	tnz	a
1946  0003 2705          	jreq	L212
1947  0005 9f            	ld	a,xl
1948  0006 a101          	cp	a,#1
1949  0008 2603          	jrne	L012
1950  000a               L212:
1951  000a 4f            	clr	a
1952  000b 2010          	jra	L412
1953  000d               L012:
1954  000d ae01ce        	ldw	x,#462
1955  0010 89            	pushw	x
1956  0011 ae0000        	ldw	x,#0
1957  0014 89            	pushw	x
1958  0015 ae000c        	ldw	x,#L75
1959  0018 cd0000        	call	_assert_failed
1961  001b 5b04          	addw	sp,#4
1962  001d               L412:
1963                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1965  001d 7b01          	ld	a,(OFST+1,sp)
1966  001f a10c          	cp	a,#12
1967  0021 2706          	jreq	L022
1968  0023 7b01          	ld	a,(OFST+1,sp)
1969  0025 a11c          	cp	a,#28
1970  0027 2603          	jrne	L612
1971  0029               L022:
1972  0029 4f            	clr	a
1973  002a 2010          	jra	L222
1974  002c               L612:
1975  002c ae01cf        	ldw	x,#463
1976  002f 89            	pushw	x
1977  0030 ae0000        	ldw	x,#0
1978  0033 89            	pushw	x
1979  0034 ae000c        	ldw	x,#L75
1980  0037 cd0000        	call	_assert_failed
1982  003a 5b04          	addw	sp,#4
1983  003c               L222:
1984                     ; 465   if (NewState != DISABLE)
1986  003c 0d02          	tnz	(OFST+2,sp)
1987  003e 271a          	jreq	L527
1988                     ; 467     switch (CLK_IT)
1990  0040 7b01          	ld	a,(OFST+1,sp)
1992                     ; 475     default:
1992                     ; 476       break;
1993  0042 a00c          	sub	a,#12
1994  0044 270a          	jreq	L166
1995  0046 a010          	sub	a,#16
1996  0048 2624          	jrne	L337
1997                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1997                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1999  004a 721450c5      	bset	20677,#2
2000                     ; 471       break;
2002  004e 201e          	jra	L337
2003  0050               L166:
2004                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
2004                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
2006  0050 721450c8      	bset	20680,#2
2007                     ; 474       break;
2009  0054 2018          	jra	L337
2010  0056               L366:
2011                     ; 475     default:
2011                     ; 476       break;
2013  0056 2016          	jra	L337
2014  0058               L137:
2016  0058 2014          	jra	L337
2017  005a               L527:
2018                     ; 481     switch (CLK_IT)
2020  005a 7b01          	ld	a,(OFST+1,sp)
2022                     ; 489     default:
2022                     ; 490       break;
2023  005c a00c          	sub	a,#12
2024  005e 270a          	jreq	L766
2025  0060 a010          	sub	a,#16
2026  0062 260a          	jrne	L337
2027                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2027                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2029  0064 721550c5      	bres	20677,#2
2030                     ; 485       break;
2032  0068 2004          	jra	L337
2033  006a               L766:
2034                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2034                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2036  006a 721550c8      	bres	20680,#2
2037                     ; 488       break;
2038  006e               L337:
2039                     ; 493 }
2042  006e 85            	popw	x
2043  006f 81            	ret
2044  0070               L176:
2045                     ; 489     default:
2045                     ; 490       break;
2047  0070 20fc          	jra	L337
2048  0072               L737:
2049  0072 20fa          	jra	L337
2085                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2085                     ; 501 {
2086                     .text:	section	.text,new
2087  0000               _CLK_SYSCLKConfig:
2089  0000 88            	push	a
2090       00000000      OFST:	set	0
2093                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2095  0001 4d            	tnz	a
2096  0002 272c          	jreq	L032
2097  0004 a108          	cp	a,#8
2098  0006 2728          	jreq	L032
2099  0008 a110          	cp	a,#16
2100  000a 2724          	jreq	L032
2101  000c a118          	cp	a,#24
2102  000e 2720          	jreq	L032
2103  0010 a180          	cp	a,#128
2104  0012 271c          	jreq	L032
2105  0014 a181          	cp	a,#129
2106  0016 2718          	jreq	L032
2107  0018 a182          	cp	a,#130
2108  001a 2714          	jreq	L032
2109  001c a183          	cp	a,#131
2110  001e 2710          	jreq	L032
2111  0020 a184          	cp	a,#132
2112  0022 270c          	jreq	L032
2113  0024 a185          	cp	a,#133
2114  0026 2708          	jreq	L032
2115  0028 a186          	cp	a,#134
2116  002a 2704          	jreq	L032
2117  002c a187          	cp	a,#135
2118  002e 2603          	jrne	L622
2119  0030               L032:
2120  0030 4f            	clr	a
2121  0031 2010          	jra	L232
2122  0033               L622:
2123  0033 ae01f7        	ldw	x,#503
2124  0036 89            	pushw	x
2125  0037 ae0000        	ldw	x,#0
2126  003a 89            	pushw	x
2127  003b ae000c        	ldw	x,#L75
2128  003e cd0000        	call	_assert_failed
2130  0041 5b04          	addw	sp,#4
2131  0043               L232:
2132                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2134  0043 7b01          	ld	a,(OFST+1,sp)
2135  0045 a580          	bcp	a,#128
2136  0047 2614          	jrne	L757
2137                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2139  0049 c650c6        	ld	a,20678
2140  004c a4e7          	and	a,#231
2141  004e c750c6        	ld	20678,a
2142                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2144  0051 7b01          	ld	a,(OFST+1,sp)
2145  0053 a418          	and	a,#24
2146  0055 ca50c6        	or	a,20678
2147  0058 c750c6        	ld	20678,a
2149  005b 2012          	jra	L167
2150  005d               L757:
2151                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2153  005d c650c6        	ld	a,20678
2154  0060 a4f8          	and	a,#248
2155  0062 c750c6        	ld	20678,a
2156                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2158  0065 7b01          	ld	a,(OFST+1,sp)
2159  0067 a407          	and	a,#7
2160  0069 ca50c6        	or	a,20678
2161  006c c750c6        	ld	20678,a
2162  006f               L167:
2163                     ; 515 }
2166  006f 84            	pop	a
2167  0070 81            	ret
2224                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2224                     ; 524 {
2225                     .text:	section	.text,new
2226  0000               _CLK_SWIMConfig:
2228  0000 88            	push	a
2229       00000000      OFST:	set	0
2232                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2234  0001 4d            	tnz	a
2235  0002 2704          	jreq	L042
2236  0004 a101          	cp	a,#1
2237  0006 2603          	jrne	L632
2238  0008               L042:
2239  0008 4f            	clr	a
2240  0009 2010          	jra	L242
2241  000b               L632:
2242  000b ae020e        	ldw	x,#526
2243  000e 89            	pushw	x
2244  000f ae0000        	ldw	x,#0
2245  0012 89            	pushw	x
2246  0013 ae000c        	ldw	x,#L75
2247  0016 cd0000        	call	_assert_failed
2249  0019 5b04          	addw	sp,#4
2250  001b               L242:
2251                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2253  001b 0d01          	tnz	(OFST+1,sp)
2254  001d 2706          	jreq	L1101
2255                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2257  001f 721050cd      	bset	20685,#0
2259  0023 2004          	jra	L3101
2260  0025               L1101:
2261                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2263  0025 721150cd      	bres	20685,#0
2264  0029               L3101:
2265                     ; 538 }
2268  0029 84            	pop	a
2269  002a 81            	ret
2293                     ; 547 void CLK_ClockSecuritySystemEnable(void)
2293                     ; 548 {
2294                     .text:	section	.text,new
2295  0000               _CLK_ClockSecuritySystemEnable:
2299                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
2301  0000 721050c8      	bset	20680,#0
2302                     ; 551 }
2305  0004 81            	ret
2330                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2330                     ; 560 {
2331                     .text:	section	.text,new
2332  0000               _CLK_GetSYSCLKSource:
2336                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
2338  0000 c650c3        	ld	a,20675
2341  0003 81            	ret
2398                     ; 569 uint32_t CLK_GetClockFreq(void)
2398                     ; 570 {
2399                     .text:	section	.text,new
2400  0000               _CLK_GetClockFreq:
2402  0000 5209          	subw	sp,#9
2403       00000009      OFST:	set	9
2406                     ; 571   uint32_t clockfrequency = 0;
2408  0002 96            	ldw	x,sp
2409  0003 1c0005        	addw	x,#OFST-4
2410  0006 cd0000        	call	c_ltor
2412                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2414  0009 7b09          	ld	a,(OFST+0,sp)
2415  000b 97            	ld	xl,a
2416                     ; 573   uint8_t tmp = 0, presc = 0;
2418  000c 7b09          	ld	a,(OFST+0,sp)
2419  000e 97            	ld	xl,a
2422  000f 7b09          	ld	a,(OFST+0,sp)
2423  0011 97            	ld	xl,a
2424                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2426  0012 c650c3        	ld	a,20675
2427  0015 6b09          	ld	(OFST+0,sp),a
2428                     ; 578   if (clocksource == CLK_SOURCE_HSI)
2430  0017 7b09          	ld	a,(OFST+0,sp)
2431  0019 a1e1          	cp	a,#225
2432  001b 2642          	jrne	L1601
2433                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2435  001d c650c6        	ld	a,20678
2436  0020 a418          	and	a,#24
2437  0022 6b09          	ld	(OFST+0,sp),a
2438                     ; 581     tmp = (uint8_t)(tmp >> 3);
2440  0024 7b09          	ld	a,(OFST+0,sp)
2441  0026 44            	srl	a
2442  0027 44            	srl	a
2443  0028 44            	srl	a
2444  0029 6b09          	ld	(OFST+0,sp),a
2445                     ; 582     presc = HSIDivFactor[tmp];
2447  002b 7b09          	ld	a,(OFST+0,sp)
2448  002d 5f            	clrw	x
2449  002e 97            	ld	xl,a
2450  002f d60000        	ld	a,(_HSIDivFactor,x)
2451  0032 6b09          	ld	(OFST+0,sp),a
2452                     ; 583     clockfrequency = HSI_VALUE / presc;
2454  0034 7b09          	ld	a,(OFST+0,sp)
2455  0036 b703          	ld	c_lreg+3,a
2456  0038 3f02          	clr	c_lreg+2
2457  003a 3f01          	clr	c_lreg+1
2458  003c 3f00          	clr	c_lreg
2459  003e 96            	ldw	x,sp
2460  003f 1c0001        	addw	x,#OFST-8
2461  0042 cd0000        	call	c_rtol
2463  0045 ae2400        	ldw	x,#9216
2464  0048 bf02          	ldw	c_lreg+2,x
2465  004a ae00f4        	ldw	x,#244
2466  004d bf00          	ldw	c_lreg,x
2467  004f 96            	ldw	x,sp
2468  0050 1c0001        	addw	x,#OFST-8
2469  0053 cd0000        	call	c_ludv
2471  0056 96            	ldw	x,sp
2472  0057 1c0005        	addw	x,#OFST-4
2473  005a cd0000        	call	c_rtol
2476  005d 201c          	jra	L3601
2477  005f               L1601:
2478                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2480  005f 7b09          	ld	a,(OFST+0,sp)
2481  0061 a1d2          	cp	a,#210
2482  0063 260c          	jrne	L5601
2483                     ; 587     clockfrequency = LSI_VALUE;
2485  0065 aef400        	ldw	x,#62464
2486  0068 1f07          	ldw	(OFST-2,sp),x
2487  006a ae0001        	ldw	x,#1
2488  006d 1f05          	ldw	(OFST-4,sp),x
2490  006f 200a          	jra	L3601
2491  0071               L5601:
2492                     ; 591     clockfrequency = HSE_VALUE;
2494  0071 ae2400        	ldw	x,#9216
2495  0074 1f07          	ldw	(OFST-2,sp),x
2496  0076 ae00f4        	ldw	x,#244
2497  0079 1f05          	ldw	(OFST-4,sp),x
2498  007b               L3601:
2499                     ; 594   return((uint32_t)clockfrequency);
2501  007b 96            	ldw	x,sp
2502  007c 1c0005        	addw	x,#OFST-4
2503  007f cd0000        	call	c_ltor
2507  0082 5b09          	addw	sp,#9
2508  0084 81            	ret
2608                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2608                     ; 605 {
2609                     .text:	section	.text,new
2610  0000               _CLK_AdjustHSICalibrationValue:
2612  0000 88            	push	a
2613       00000000      OFST:	set	0
2616                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2618  0001 4d            	tnz	a
2619  0002 271c          	jreq	L652
2620  0004 a101          	cp	a,#1
2621  0006 2718          	jreq	L652
2622  0008 a102          	cp	a,#2
2623  000a 2714          	jreq	L652
2624  000c a103          	cp	a,#3
2625  000e 2710          	jreq	L652
2626  0010 a104          	cp	a,#4
2627  0012 270c          	jreq	L652
2628  0014 a105          	cp	a,#5
2629  0016 2708          	jreq	L652
2630  0018 a106          	cp	a,#6
2631  001a 2704          	jreq	L652
2632  001c a107          	cp	a,#7
2633  001e 2603          	jrne	L452
2634  0020               L652:
2635  0020 4f            	clr	a
2636  0021 2010          	jra	L062
2637  0023               L452:
2638  0023 ae025f        	ldw	x,#607
2639  0026 89            	pushw	x
2640  0027 ae0000        	ldw	x,#0
2641  002a 89            	pushw	x
2642  002b ae000c        	ldw	x,#L75
2643  002e cd0000        	call	_assert_failed
2645  0031 5b04          	addw	sp,#4
2646  0033               L062:
2647                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2649  0033 c650cc        	ld	a,20684
2650  0036 a4f8          	and	a,#248
2651  0038 1a01          	or	a,(OFST+1,sp)
2652  003a c750cc        	ld	20684,a
2653                     ; 611 }
2656  003d 84            	pop	a
2657  003e 81            	ret
2681                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2681                     ; 623 {
2682                     .text:	section	.text,new
2683  0000               _CLK_SYSCLKEmergencyClear:
2687                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2689  0000 721150c5      	bres	20677,#0
2690                     ; 625 }
2693  0004 81            	ret
2843                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2843                     ; 635 {
2844                     .text:	section	.text,new
2845  0000               _CLK_GetFlagStatus:
2847  0000 89            	pushw	x
2848  0001 5203          	subw	sp,#3
2849       00000003      OFST:	set	3
2852                     ; 636   uint16_t statusreg = 0;
2854  0003 1e01          	ldw	x,(OFST-2,sp)
2855                     ; 637   uint8_t tmpreg = 0;
2857  0005 7b03          	ld	a,(OFST+0,sp)
2858  0007 97            	ld	xl,a
2859                     ; 638   FlagStatus bitstatus = RESET;
2861  0008 7b03          	ld	a,(OFST+0,sp)
2862  000a 97            	ld	xl,a
2863                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2865  000b 1e04          	ldw	x,(OFST+1,sp)
2866  000d a30110        	cpw	x,#272
2867  0010 2738          	jreq	L072
2868  0012 1e04          	ldw	x,(OFST+1,sp)
2869  0014 a30102        	cpw	x,#258
2870  0017 2731          	jreq	L072
2871  0019 1e04          	ldw	x,(OFST+1,sp)
2872  001b a30202        	cpw	x,#514
2873  001e 272a          	jreq	L072
2874  0020 1e04          	ldw	x,(OFST+1,sp)
2875  0022 a30308        	cpw	x,#776
2876  0025 2723          	jreq	L072
2877  0027 1e04          	ldw	x,(OFST+1,sp)
2878  0029 a30301        	cpw	x,#769
2879  002c 271c          	jreq	L072
2880  002e 1e04          	ldw	x,(OFST+1,sp)
2881  0030 a30408        	cpw	x,#1032
2882  0033 2715          	jreq	L072
2883  0035 1e04          	ldw	x,(OFST+1,sp)
2884  0037 a30402        	cpw	x,#1026
2885  003a 270e          	jreq	L072
2886  003c 1e04          	ldw	x,(OFST+1,sp)
2887  003e a30504        	cpw	x,#1284
2888  0041 2707          	jreq	L072
2889  0043 1e04          	ldw	x,(OFST+1,sp)
2890  0045 a30502        	cpw	x,#1282
2891  0048 2603          	jrne	L662
2892  004a               L072:
2893  004a 4f            	clr	a
2894  004b 2010          	jra	L272
2895  004d               L662:
2896  004d ae0281        	ldw	x,#641
2897  0050 89            	pushw	x
2898  0051 ae0000        	ldw	x,#0
2899  0054 89            	pushw	x
2900  0055 ae000c        	ldw	x,#L75
2901  0058 cd0000        	call	_assert_failed
2903  005b 5b04          	addw	sp,#4
2904  005d               L272:
2905                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2907  005d 7b04          	ld	a,(OFST+1,sp)
2908  005f 97            	ld	xl,a
2909  0060 7b05          	ld	a,(OFST+2,sp)
2910  0062 9f            	ld	a,xl
2911  0063 a4ff          	and	a,#255
2912  0065 97            	ld	xl,a
2913  0066 4f            	clr	a
2914  0067 02            	rlwa	x,a
2915  0068 1f01          	ldw	(OFST-2,sp),x
2916  006a 01            	rrwa	x,a
2917                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2919  006b 1e01          	ldw	x,(OFST-2,sp)
2920  006d a30100        	cpw	x,#256
2921  0070 2607          	jrne	L7221
2922                     ; 649     tmpreg = CLK->ICKR;
2924  0072 c650c0        	ld	a,20672
2925  0075 6b03          	ld	(OFST+0,sp),a
2927  0077 202f          	jra	L1321
2928  0079               L7221:
2929                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2931  0079 1e01          	ldw	x,(OFST-2,sp)
2932  007b a30200        	cpw	x,#512
2933  007e 2607          	jrne	L3321
2934                     ; 653     tmpreg = CLK->ECKR;
2936  0080 c650c1        	ld	a,20673
2937  0083 6b03          	ld	(OFST+0,sp),a
2939  0085 2021          	jra	L1321
2940  0087               L3321:
2941                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2943  0087 1e01          	ldw	x,(OFST-2,sp)
2944  0089 a30300        	cpw	x,#768
2945  008c 2607          	jrne	L7321
2946                     ; 657     tmpreg = CLK->SWCR;
2948  008e c650c5        	ld	a,20677
2949  0091 6b03          	ld	(OFST+0,sp),a
2951  0093 2013          	jra	L1321
2952  0095               L7321:
2953                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2955  0095 1e01          	ldw	x,(OFST-2,sp)
2956  0097 a30400        	cpw	x,#1024
2957  009a 2607          	jrne	L3421
2958                     ; 661     tmpreg = CLK->CSSR;
2960  009c c650c8        	ld	a,20680
2961  009f 6b03          	ld	(OFST+0,sp),a
2963  00a1 2005          	jra	L1321
2964  00a3               L3421:
2965                     ; 665     tmpreg = CLK->CCOR;
2967  00a3 c650c9        	ld	a,20681
2968  00a6 6b03          	ld	(OFST+0,sp),a
2969  00a8               L1321:
2970                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2972  00a8 7b05          	ld	a,(OFST+2,sp)
2973  00aa 1503          	bcp	a,(OFST+0,sp)
2974  00ac 2706          	jreq	L7421
2975                     ; 670     bitstatus = SET;
2977  00ae a601          	ld	a,#1
2978  00b0 6b03          	ld	(OFST+0,sp),a
2980  00b2 2002          	jra	L1521
2981  00b4               L7421:
2982                     ; 674     bitstatus = RESET;
2984  00b4 0f03          	clr	(OFST+0,sp)
2985  00b6               L1521:
2986                     ; 678   return((FlagStatus)bitstatus);
2988  00b6 7b03          	ld	a,(OFST+0,sp)
2991  00b8 5b05          	addw	sp,#5
2992  00ba 81            	ret
3039                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3039                     ; 688 {
3040                     .text:	section	.text,new
3041  0000               _CLK_GetITStatus:
3043  0000 88            	push	a
3044  0001 88            	push	a
3045       00000001      OFST:	set	1
3048                     ; 689   ITStatus bitstatus = RESET;
3050  0002 0f01          	clr	(OFST+0,sp)
3051                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
3053  0004 a10c          	cp	a,#12
3054  0006 2704          	jreq	L003
3055  0008 a11c          	cp	a,#28
3056  000a 2603          	jrne	L672
3057  000c               L003:
3058  000c 4f            	clr	a
3059  000d 2010          	jra	L203
3060  000f               L672:
3061  000f ae02b4        	ldw	x,#692
3062  0012 89            	pushw	x
3063  0013 ae0000        	ldw	x,#0
3064  0016 89            	pushw	x
3065  0017 ae000c        	ldw	x,#L75
3066  001a cd0000        	call	_assert_failed
3068  001d 5b04          	addw	sp,#4
3069  001f               L203:
3070                     ; 694   if (CLK_IT == CLK_IT_SWIF)
3072  001f 7b02          	ld	a,(OFST+1,sp)
3073  0021 a11c          	cp	a,#28
3074  0023 2613          	jrne	L5721
3075                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3077  0025 c650c5        	ld	a,20677
3078  0028 1402          	and	a,(OFST+1,sp)
3079  002a a10c          	cp	a,#12
3080  002c 2606          	jrne	L7721
3081                     ; 699       bitstatus = SET;
3083  002e a601          	ld	a,#1
3084  0030 6b01          	ld	(OFST+0,sp),a
3086  0032 2015          	jra	L3031
3087  0034               L7721:
3088                     ; 703       bitstatus = RESET;
3090  0034 0f01          	clr	(OFST+0,sp)
3091  0036 2011          	jra	L3031
3092  0038               L5721:
3093                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3095  0038 c650c8        	ld	a,20680
3096  003b 1402          	and	a,(OFST+1,sp)
3097  003d a10c          	cp	a,#12
3098  003f 2606          	jrne	L5031
3099                     ; 711       bitstatus = SET;
3101  0041 a601          	ld	a,#1
3102  0043 6b01          	ld	(OFST+0,sp),a
3104  0045 2002          	jra	L3031
3105  0047               L5031:
3106                     ; 715       bitstatus = RESET;
3108  0047 0f01          	clr	(OFST+0,sp)
3109  0049               L3031:
3110                     ; 720   return bitstatus;
3112  0049 7b01          	ld	a,(OFST+0,sp)
3115  004b 85            	popw	x
3116  004c 81            	ret
3153                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3153                     ; 730 {
3154                     .text:	section	.text,new
3155  0000               _CLK_ClearITPendingBit:
3157  0000 88            	push	a
3158       00000000      OFST:	set	0
3161                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
3163  0001 a10c          	cp	a,#12
3164  0003 2704          	jreq	L013
3165  0005 a11c          	cp	a,#28
3166  0007 2603          	jrne	L603
3167  0009               L013:
3168  0009 4f            	clr	a
3169  000a 2010          	jra	L213
3170  000c               L603:
3171  000c ae02dc        	ldw	x,#732
3172  000f 89            	pushw	x
3173  0010 ae0000        	ldw	x,#0
3174  0013 89            	pushw	x
3175  0014 ae000c        	ldw	x,#L75
3176  0017 cd0000        	call	_assert_failed
3178  001a 5b04          	addw	sp,#4
3179  001c               L213:
3180                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3182  001c 7b01          	ld	a,(OFST+1,sp)
3183  001e a10c          	cp	a,#12
3184  0020 2606          	jrne	L7231
3185                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3187  0022 721750c8      	bres	20680,#3
3189  0026 2004          	jra	L1331
3190  0028               L7231:
3191                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3193  0028 721750c5      	bres	20677,#3
3194  002c               L1331:
3195                     ; 745 }
3198  002c 84            	pop	a
3199  002d 81            	ret
3234                     	xdef	_CLKPrescTable
3235                     	xdef	_HSIDivFactor
3236                     	xdef	_CLK_ClearITPendingBit
3237                     	xdef	_CLK_GetITStatus
3238                     	xdef	_CLK_GetFlagStatus
3239                     	xdef	_CLK_GetSYSCLKSource
3240                     	xdef	_CLK_GetClockFreq
3241                     	xdef	_CLK_AdjustHSICalibrationValue
3242                     	xdef	_CLK_SYSCLKEmergencyClear
3243                     	xdef	_CLK_ClockSecuritySystemEnable
3244                     	xdef	_CLK_SWIMConfig
3245                     	xdef	_CLK_SYSCLKConfig
3246                     	xdef	_CLK_ITConfig
3247                     	xdef	_CLK_CCOConfig
3248                     	xdef	_CLK_HSIPrescalerConfig
3249                     	xdef	_CLK_ClockSwitchConfig
3250                     	xdef	_CLK_PeripheralClockConfig
3251                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3252                     	xdef	_CLK_FastHaltWakeUpCmd
3253                     	xdef	_CLK_ClockSwitchCmd
3254                     	xdef	_CLK_CCOCmd
3255                     	xdef	_CLK_LSICmd
3256                     	xdef	_CLK_HSICmd
3257                     	xdef	_CLK_HSECmd
3258                     	xdef	_CLK_DeInit
3259                     	xref	_assert_failed
3260                     	switch	.const
3261  000c               L75:
3262  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3263  001e 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3264  0030 72697665725c  	dc.b	"river\src\stm8s_cl"
3265  0042 6b2e6300      	dc.b	"k.c",0
3266                     	xref.b	c_lreg
3286                     	xref	c_ludv
3287                     	xref	c_rtol
3288                     	xref	c_ltor
3289                     	end
