   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  98                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 54 {
 100                     .text:	section	.text,new
 101  0000               _GPIO_DeInit:
 105                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 107  0000 7f            	clr	(x)
 108                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 110  0001 6f02          	clr	(2,x)
 111                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 113  0003 6f03          	clr	(3,x)
 114                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 116  0005 6f04          	clr	(4,x)
 117                     ; 59 }
 120  0007 81            	ret
 361                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 361                     ; 72 {
 362                     .text:	section	.text,new
 363  0000               _GPIO_Init:
 365  0000 89            	pushw	x
 366       00000000      OFST:	set	0
 369                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 371  0001 0d06          	tnz	(OFST+6,sp)
 372  0003 2742          	jreq	L21
 373  0005 7b06          	ld	a,(OFST+6,sp)
 374  0007 a140          	cp	a,#64
 375  0009 273c          	jreq	L21
 376  000b 7b06          	ld	a,(OFST+6,sp)
 377  000d a120          	cp	a,#32
 378  000f 2736          	jreq	L21
 379  0011 7b06          	ld	a,(OFST+6,sp)
 380  0013 a160          	cp	a,#96
 381  0015 2730          	jreq	L21
 382  0017 7b06          	ld	a,(OFST+6,sp)
 383  0019 a1a0          	cp	a,#160
 384  001b 272a          	jreq	L21
 385  001d 7b06          	ld	a,(OFST+6,sp)
 386  001f a1e0          	cp	a,#224
 387  0021 2724          	jreq	L21
 388  0023 7b06          	ld	a,(OFST+6,sp)
 389  0025 a180          	cp	a,#128
 390  0027 271e          	jreq	L21
 391  0029 7b06          	ld	a,(OFST+6,sp)
 392  002b a1c0          	cp	a,#192
 393  002d 2718          	jreq	L21
 394  002f 7b06          	ld	a,(OFST+6,sp)
 395  0031 a1b0          	cp	a,#176
 396  0033 2712          	jreq	L21
 397  0035 7b06          	ld	a,(OFST+6,sp)
 398  0037 a1f0          	cp	a,#240
 399  0039 270c          	jreq	L21
 400  003b 7b06          	ld	a,(OFST+6,sp)
 401  003d a190          	cp	a,#144
 402  003f 2706          	jreq	L21
 403  0041 7b06          	ld	a,(OFST+6,sp)
 404  0043 a1d0          	cp	a,#208
 405  0045 2603          	jrne	L01
 406  0047               L21:
 407  0047 4f            	clr	a
 408  0048 2010          	jra	L41
 409  004a               L01:
 410  004a ae004d        	ldw	x,#77
 411  004d 89            	pushw	x
 412  004e ae0000        	ldw	x,#0
 413  0051 89            	pushw	x
 414  0052 ae0000        	ldw	x,#L771
 415  0055 cd0000        	call	_assert_failed
 417  0058 5b04          	addw	sp,#4
 418  005a               L41:
 419                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 421  005a 0d05          	tnz	(OFST+5,sp)
 422  005c 2703          	jreq	L61
 423  005e 4f            	clr	a
 424  005f 2010          	jra	L02
 425  0061               L61:
 426  0061 ae004e        	ldw	x,#78
 427  0064 89            	pushw	x
 428  0065 ae0000        	ldw	x,#0
 429  0068 89            	pushw	x
 430  0069 ae0000        	ldw	x,#L771
 431  006c cd0000        	call	_assert_failed
 433  006f 5b04          	addw	sp,#4
 434  0071               L02:
 435                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 437  0071 1e01          	ldw	x,(OFST+1,sp)
 438  0073 7b05          	ld	a,(OFST+5,sp)
 439  0075 43            	cpl	a
 440  0076 e404          	and	a,(4,x)
 441  0078 e704          	ld	(4,x),a
 442                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 444  007a 7b06          	ld	a,(OFST+6,sp)
 445  007c a580          	bcp	a,#128
 446  007e 271f          	jreq	L102
 447                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 449  0080 7b06          	ld	a,(OFST+6,sp)
 450  0082 a510          	bcp	a,#16
 451  0084 2708          	jreq	L302
 452                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 454  0086 1e01          	ldw	x,(OFST+1,sp)
 455  0088 f6            	ld	a,(x)
 456  0089 1a05          	or	a,(OFST+5,sp)
 457  008b f7            	ld	(x),a
 459  008c 2007          	jra	L502
 460  008e               L302:
 461                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 463  008e 1e01          	ldw	x,(OFST+1,sp)
 464  0090 7b05          	ld	a,(OFST+5,sp)
 465  0092 43            	cpl	a
 466  0093 f4            	and	a,(x)
 467  0094 f7            	ld	(x),a
 468  0095               L502:
 469                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 471  0095 1e01          	ldw	x,(OFST+1,sp)
 472  0097 e602          	ld	a,(2,x)
 473  0099 1a05          	or	a,(OFST+5,sp)
 474  009b e702          	ld	(2,x),a
 476  009d 2009          	jra	L702
 477  009f               L102:
 478                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 480  009f 1e01          	ldw	x,(OFST+1,sp)
 481  00a1 7b05          	ld	a,(OFST+5,sp)
 482  00a3 43            	cpl	a
 483  00a4 e402          	and	a,(2,x)
 484  00a6 e702          	ld	(2,x),a
 485  00a8               L702:
 486                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 488  00a8 7b06          	ld	a,(OFST+6,sp)
 489  00aa a540          	bcp	a,#64
 490  00ac 270a          	jreq	L112
 491                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 493  00ae 1e01          	ldw	x,(OFST+1,sp)
 494  00b0 e603          	ld	a,(3,x)
 495  00b2 1a05          	or	a,(OFST+5,sp)
 496  00b4 e703          	ld	(3,x),a
 498  00b6 2009          	jra	L312
 499  00b8               L112:
 500                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 502  00b8 1e01          	ldw	x,(OFST+1,sp)
 503  00ba 7b05          	ld	a,(OFST+5,sp)
 504  00bc 43            	cpl	a
 505  00bd e403          	and	a,(3,x)
 506  00bf e703          	ld	(3,x),a
 507  00c1               L312:
 508                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 510  00c1 7b06          	ld	a,(OFST+6,sp)
 511  00c3 a520          	bcp	a,#32
 512  00c5 270a          	jreq	L512
 513                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 515  00c7 1e01          	ldw	x,(OFST+1,sp)
 516  00c9 e604          	ld	a,(4,x)
 517  00cb 1a05          	or	a,(OFST+5,sp)
 518  00cd e704          	ld	(4,x),a
 520  00cf 2009          	jra	L712
 521  00d1               L512:
 522                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 524  00d1 1e01          	ldw	x,(OFST+1,sp)
 525  00d3 7b05          	ld	a,(OFST+5,sp)
 526  00d5 43            	cpl	a
 527  00d6 e404          	and	a,(4,x)
 528  00d8 e704          	ld	(4,x),a
 529  00da               L712:
 530                     ; 131 }
 533  00da 85            	popw	x
 534  00db 81            	ret
 578                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 578                     ; 142 {
 579                     .text:	section	.text,new
 580  0000               _GPIO_Write:
 582  0000 89            	pushw	x
 583       00000000      OFST:	set	0
 586                     ; 143   GPIOx->ODR = PortVal;
 588  0001 7b05          	ld	a,(OFST+5,sp)
 589  0003 1e01          	ldw	x,(OFST+1,sp)
 590  0005 f7            	ld	(x),a
 591                     ; 144 }
 594  0006 85            	popw	x
 595  0007 81            	ret
 642                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 642                     ; 155 {
 643                     .text:	section	.text,new
 644  0000               _GPIO_WriteHigh:
 646  0000 89            	pushw	x
 647       00000000      OFST:	set	0
 650                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 652  0001 f6            	ld	a,(x)
 653  0002 1a05          	or	a,(OFST+5,sp)
 654  0004 f7            	ld	(x),a
 655                     ; 157 }
 658  0005 85            	popw	x
 659  0006 81            	ret
 706                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 706                     ; 168 {
 707                     .text:	section	.text,new
 708  0000               _GPIO_WriteLow:
 710  0000 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 716  0001 7b05          	ld	a,(OFST+5,sp)
 717  0003 43            	cpl	a
 718  0004 f4            	and	a,(x)
 719  0005 f7            	ld	(x),a
 720                     ; 170 }
 723  0006 85            	popw	x
 724  0007 81            	ret
 771                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 771                     ; 181 {
 772                     .text:	section	.text,new
 773  0000               _GPIO_WriteReverse:
 775  0000 89            	pushw	x
 776       00000000      OFST:	set	0
 779                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 781  0001 f6            	ld	a,(x)
 782  0002 1805          	xor	a,	(OFST+5,sp)
 783  0004 f7            	ld	(x),a
 784                     ; 183 }
 787  0005 85            	popw	x
 788  0006 81            	ret
 826                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 826                     ; 192 {
 827                     .text:	section	.text,new
 828  0000               _GPIO_ReadOutputData:
 832                     ; 193   return ((uint8_t)GPIOx->ODR);
 834  0000 f6            	ld	a,(x)
 837  0001 81            	ret
 874                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 874                     ; 203 {
 875                     .text:	section	.text,new
 876  0000               _GPIO_ReadInputData:
 880                     ; 204   return ((uint8_t)GPIOx->IDR);
 882  0000 e601          	ld	a,(1,x)
 885  0002 81            	ret
 953                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 953                     ; 214 {
 954                     .text:	section	.text,new
 955  0000               _GPIO_ReadInputPin:
 957  0000 89            	pushw	x
 958       00000000      OFST:	set	0
 961                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 963  0001 e601          	ld	a,(1,x)
 964  0003 1405          	and	a,(OFST+5,sp)
 967  0005 85            	popw	x
 968  0006 81            	ret
1047                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1047                     ; 226 {
1048                     .text:	section	.text,new
1049  0000               _GPIO_ExternalPullUpConfig:
1051  0000 89            	pushw	x
1052       00000000      OFST:	set	0
1055                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1057  0001 0d05          	tnz	(OFST+5,sp)
1058  0003 2703          	jreq	L24
1059  0005 4f            	clr	a
1060  0006 2010          	jra	L44
1061  0008               L24:
1062  0008 ae00e4        	ldw	x,#228
1063  000b 89            	pushw	x
1064  000c ae0000        	ldw	x,#0
1065  000f 89            	pushw	x
1066  0010 ae0000        	ldw	x,#L771
1067  0013 cd0000        	call	_assert_failed
1069  0016 5b04          	addw	sp,#4
1070  0018               L44:
1071                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1073  0018 0d06          	tnz	(OFST+6,sp)
1074  001a 2706          	jreq	L05
1075  001c 7b06          	ld	a,(OFST+6,sp)
1076  001e a101          	cp	a,#1
1077  0020 2603          	jrne	L64
1078  0022               L05:
1079  0022 4f            	clr	a
1080  0023 2010          	jra	L25
1081  0025               L64:
1082  0025 ae00e5        	ldw	x,#229
1083  0028 89            	pushw	x
1084  0029 ae0000        	ldw	x,#0
1085  002c 89            	pushw	x
1086  002d ae0000        	ldw	x,#L771
1087  0030 cd0000        	call	_assert_failed
1089  0033 5b04          	addw	sp,#4
1090  0035               L25:
1091                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1093  0035 0d06          	tnz	(OFST+6,sp)
1094  0037 270a          	jreq	L374
1095                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1097  0039 1e01          	ldw	x,(OFST+1,sp)
1098  003b e603          	ld	a,(3,x)
1099  003d 1a05          	or	a,(OFST+5,sp)
1100  003f e703          	ld	(3,x),a
1102  0041 2009          	jra	L574
1103  0043               L374:
1104                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1106  0043 1e01          	ldw	x,(OFST+1,sp)
1107  0045 7b05          	ld	a,(OFST+5,sp)
1108  0047 43            	cpl	a
1109  0048 e403          	and	a,(3,x)
1110  004a e703          	ld	(3,x),a
1111  004c               L574:
1112                     ; 238 }
1115  004c 85            	popw	x
1116  004d 81            	ret
1129                     	xdef	_GPIO_ExternalPullUpConfig
1130                     	xdef	_GPIO_ReadInputPin
1131                     	xdef	_GPIO_ReadOutputData
1132                     	xdef	_GPIO_ReadInputData
1133                     	xdef	_GPIO_WriteReverse
1134                     	xdef	_GPIO_WriteLow
1135                     	xdef	_GPIO_WriteHigh
1136                     	xdef	_GPIO_Write
1137                     	xdef	_GPIO_Init
1138                     	xdef	_GPIO_DeInit
1139                     	xref	_assert_failed
1140                     .const:	section	.text
1141  0000               L771:
1142  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
1143  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
1144  0024 72697665725c  	dc.b	"river\src\stm8s_gp"
1145  0036 696f2e6300    	dc.b	"io.c",0
1165                     	end
