   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 53 void EXTI_DeInit(void)
  32                     ; 54 {
  34                     .text:	section	.text,new
  35  0000               _EXTI_DeInit:
  39                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  41  0000 725f50a0      	clr	20640
  42                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  44  0004 725f50a1      	clr	20641
  45                     ; 57 }
  48  0008 81            	ret
 174                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 174                     ; 71 {
 175                     .text:	section	.text,new
 176  0000               _EXTI_SetExtIntSensitivity:
 178  0000 89            	pushw	x
 179       00000000      OFST:	set	0
 182                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 184  0001 9e            	ld	a,xh
 185  0002 4d            	tnz	a
 186  0003 2714          	jreq	L21
 187  0005 9e            	ld	a,xh
 188  0006 a101          	cp	a,#1
 189  0008 270f          	jreq	L21
 190  000a 9e            	ld	a,xh
 191  000b a102          	cp	a,#2
 192  000d 270a          	jreq	L21
 193  000f 9e            	ld	a,xh
 194  0010 a103          	cp	a,#3
 195  0012 2705          	jreq	L21
 196  0014 9e            	ld	a,xh
 197  0015 a104          	cp	a,#4
 198  0017 2603          	jrne	L01
 199  0019               L21:
 200  0019 4f            	clr	a
 201  001a 2010          	jra	L41
 202  001c               L01:
 203  001c ae0049        	ldw	x,#73
 204  001f 89            	pushw	x
 205  0020 ae0000        	ldw	x,#0
 206  0023 89            	pushw	x
 207  0024 ae0000        	ldw	x,#L111
 208  0027 cd0000        	call	_assert_failed
 210  002a 5b04          	addw	sp,#4
 211  002c               L41:
 212                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 214  002c 0d02          	tnz	(OFST+2,sp)
 215  002e 2712          	jreq	L02
 216  0030 7b02          	ld	a,(OFST+2,sp)
 217  0032 a101          	cp	a,#1
 218  0034 270c          	jreq	L02
 219  0036 7b02          	ld	a,(OFST+2,sp)
 220  0038 a102          	cp	a,#2
 221  003a 2706          	jreq	L02
 222  003c 7b02          	ld	a,(OFST+2,sp)
 223  003e a103          	cp	a,#3
 224  0040 2603          	jrne	L61
 225  0042               L02:
 226  0042 4f            	clr	a
 227  0043 2010          	jra	L22
 228  0045               L61:
 229  0045 ae004a        	ldw	x,#74
 230  0048 89            	pushw	x
 231  0049 ae0000        	ldw	x,#0
 232  004c 89            	pushw	x
 233  004d ae0000        	ldw	x,#L111
 234  0050 cd0000        	call	_assert_failed
 236  0053 5b04          	addw	sp,#4
 237  0055               L22:
 238                     ; 77   switch (Port)
 240  0055 7b01          	ld	a,(OFST+1,sp)
 242                     ; 99   default:
 242                     ; 100     break;
 243  0057 4d            	tnz	a
 244  0058 270e          	jreq	L12
 245  005a 4a            	dec	a
 246  005b 271d          	jreq	L32
 247  005d 4a            	dec	a
 248  005e 272e          	jreq	L52
 249  0060 4a            	dec	a
 250  0061 2742          	jreq	L72
 251  0063 4a            	dec	a
 252  0064 2756          	jreq	L13
 253  0066 2064          	jra	L511
 254  0068               L12:
 255                     ; 79   case EXTI_PORT_GPIOA:
 255                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 257  0068 c650a0        	ld	a,20640
 258  006b a4fc          	and	a,#252
 259  006d c750a0        	ld	20640,a
 260                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 262  0070 c650a0        	ld	a,20640
 263  0073 1a02          	or	a,(OFST+2,sp)
 264  0075 c750a0        	ld	20640,a
 265                     ; 82     break;
 267  0078 2052          	jra	L511
 268  007a               L32:
 269                     ; 83   case EXTI_PORT_GPIOB:
 269                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 271  007a c650a0        	ld	a,20640
 272  007d a4f3          	and	a,#243
 273  007f c750a0        	ld	20640,a
 274                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 276  0082 7b02          	ld	a,(OFST+2,sp)
 277  0084 48            	sll	a
 278  0085 48            	sll	a
 279  0086 ca50a0        	or	a,20640
 280  0089 c750a0        	ld	20640,a
 281                     ; 86     break;
 283  008c 203e          	jra	L511
 284  008e               L52:
 285                     ; 87   case EXTI_PORT_GPIOC:
 285                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 287  008e c650a0        	ld	a,20640
 288  0091 a4cf          	and	a,#207
 289  0093 c750a0        	ld	20640,a
 290                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 292  0096 7b02          	ld	a,(OFST+2,sp)
 293  0098 97            	ld	xl,a
 294  0099 a610          	ld	a,#16
 295  009b 42            	mul	x,a
 296  009c 9f            	ld	a,xl
 297  009d ca50a0        	or	a,20640
 298  00a0 c750a0        	ld	20640,a
 299                     ; 90     break;
 301  00a3 2027          	jra	L511
 302  00a5               L72:
 303                     ; 91   case EXTI_PORT_GPIOD:
 303                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 305  00a5 c650a0        	ld	a,20640
 306  00a8 a43f          	and	a,#63
 307  00aa c750a0        	ld	20640,a
 308                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 310  00ad 7b02          	ld	a,(OFST+2,sp)
 311  00af 97            	ld	xl,a
 312  00b0 a640          	ld	a,#64
 313  00b2 42            	mul	x,a
 314  00b3 9f            	ld	a,xl
 315  00b4 ca50a0        	or	a,20640
 316  00b7 c750a0        	ld	20640,a
 317                     ; 94     break;
 319  00ba 2010          	jra	L511
 320  00bc               L13:
 321                     ; 95   case EXTI_PORT_GPIOE:
 321                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 323  00bc c650a1        	ld	a,20641
 324  00bf a4fc          	and	a,#252
 325  00c1 c750a1        	ld	20641,a
 326                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 328  00c4 c650a1        	ld	a,20641
 329  00c7 1a02          	or	a,(OFST+2,sp)
 330  00c9 c750a1        	ld	20641,a
 331                     ; 98     break;
 333  00cc               L33:
 334                     ; 99   default:
 334                     ; 100     break;
 336  00cc               L511:
 337                     ; 102 }
 340  00cc 85            	popw	x
 341  00cd 81            	ret
 400                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 400                     ; 112 {
 401                     .text:	section	.text,new
 402  0000               _EXTI_SetTLISensitivity:
 404  0000 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 410  0001 4d            	tnz	a
 411  0002 2704          	jreq	L03
 412  0004 a104          	cp	a,#4
 413  0006 2603          	jrne	L62
 414  0008               L03:
 415  0008 4f            	clr	a
 416  0009 2010          	jra	L23
 417  000b               L62:
 418  000b ae0072        	ldw	x,#114
 419  000e 89            	pushw	x
 420  000f ae0000        	ldw	x,#0
 421  0012 89            	pushw	x
 422  0013 ae0000        	ldw	x,#L111
 423  0016 cd0000        	call	_assert_failed
 425  0019 5b04          	addw	sp,#4
 426  001b               L23:
 427                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 429  001b 721550a1      	bres	20641,#2
 430                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 432  001f c650a1        	ld	a,20641
 433  0022 1a01          	or	a,(OFST+1,sp)
 434  0024 c750a1        	ld	20641,a
 435                     ; 119 }
 438  0027 84            	pop	a
 439  0028 81            	ret
 484                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 484                     ; 127 {
 485                     .text:	section	.text,new
 486  0000               _EXTI_GetExtIntSensitivity:
 488  0000 88            	push	a
 489  0001 88            	push	a
 490       00000001      OFST:	set	1
 493                     ; 128   uint8_t value = 0;
 495  0002 0f01          	clr	(OFST+0,sp)
 496                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 498  0004 4d            	tnz	a
 499  0005 2710          	jreq	L04
 500  0007 a101          	cp	a,#1
 501  0009 270c          	jreq	L04
 502  000b a102          	cp	a,#2
 503  000d 2708          	jreq	L04
 504  000f a103          	cp	a,#3
 505  0011 2704          	jreq	L04
 506  0013 a104          	cp	a,#4
 507  0015 2603          	jrne	L63
 508  0017               L04:
 509  0017 4f            	clr	a
 510  0018 2010          	jra	L24
 511  001a               L63:
 512  001a ae0083        	ldw	x,#131
 513  001d 89            	pushw	x
 514  001e ae0000        	ldw	x,#0
 515  0021 89            	pushw	x
 516  0022 ae0000        	ldw	x,#L111
 517  0025 cd0000        	call	_assert_failed
 519  0028 5b04          	addw	sp,#4
 520  002a               L24:
 521                     ; 133   switch (Port)
 523  002a 7b02          	ld	a,(OFST+1,sp)
 525                     ; 150   default:
 525                     ; 151     break;
 526  002c 4d            	tnz	a
 527  002d 270e          	jreq	L541
 528  002f 4a            	dec	a
 529  0030 2714          	jreq	L741
 530  0032 4a            	dec	a
 531  0033 271c          	jreq	L151
 532  0035 4a            	dec	a
 533  0036 2725          	jreq	L351
 534  0038 4a            	dec	a
 535  0039 2730          	jreq	L551
 536  003b 2035          	jra	L302
 537  003d               L541:
 538                     ; 135   case EXTI_PORT_GPIOA:
 538                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 540  003d c650a0        	ld	a,20640
 541  0040 a403          	and	a,#3
 542  0042 6b01          	ld	(OFST+0,sp),a
 543                     ; 137     break;
 545  0044 202c          	jra	L302
 546  0046               L741:
 547                     ; 138   case EXTI_PORT_GPIOB:
 547                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 549  0046 c650a0        	ld	a,20640
 550  0049 a40c          	and	a,#12
 551  004b 44            	srl	a
 552  004c 44            	srl	a
 553  004d 6b01          	ld	(OFST+0,sp),a
 554                     ; 140     break;
 556  004f 2021          	jra	L302
 557  0051               L151:
 558                     ; 141   case EXTI_PORT_GPIOC:
 558                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 560  0051 c650a0        	ld	a,20640
 561  0054 a430          	and	a,#48
 562  0056 4e            	swap	a
 563  0057 a40f          	and	a,#15
 564  0059 6b01          	ld	(OFST+0,sp),a
 565                     ; 143     break;
 567  005b 2015          	jra	L302
 568  005d               L351:
 569                     ; 144   case EXTI_PORT_GPIOD:
 569                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 571  005d c650a0        	ld	a,20640
 572  0060 a4c0          	and	a,#192
 573  0062 4e            	swap	a
 574  0063 44            	srl	a
 575  0064 44            	srl	a
 576  0065 a403          	and	a,#3
 577  0067 6b01          	ld	(OFST+0,sp),a
 578                     ; 146     break;
 580  0069 2007          	jra	L302
 581  006b               L551:
 582                     ; 147   case EXTI_PORT_GPIOE:
 582                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 584  006b c650a1        	ld	a,20641
 585  006e a403          	and	a,#3
 586  0070 6b01          	ld	(OFST+0,sp),a
 587                     ; 149     break;
 589  0072               L751:
 590                     ; 150   default:
 590                     ; 151     break;
 592  0072               L302:
 593                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 595  0072 7b01          	ld	a,(OFST+0,sp)
 598  0074 85            	popw	x
 599  0075 81            	ret
 633                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 633                     ; 163 {
 634                     .text:	section	.text,new
 635  0000               _EXTI_GetTLISensitivity:
 637  0000 88            	push	a
 638       00000001      OFST:	set	1
 641                     ; 164   uint8_t value = 0;
 643  0001 0f01          	clr	(OFST+0,sp)
 644                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 646  0003 c650a1        	ld	a,20641
 647  0006 a404          	and	a,#4
 648  0008 6b01          	ld	(OFST+0,sp),a
 649                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 651  000a 7b01          	ld	a,(OFST+0,sp)
 654  000c 5b01          	addw	sp,#1
 655  000e 81            	ret
 668                     	xdef	_EXTI_GetTLISensitivity
 669                     	xdef	_EXTI_GetExtIntSensitivity
 670                     	xdef	_EXTI_SetTLISensitivity
 671                     	xdef	_EXTI_SetExtIntSensitivity
 672                     	xdef	_EXTI_DeInit
 673                     	xref	_assert_failed
 674                     .const:	section	.text
 675  0000               L111:
 676  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 677  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 678  0024 72697665725c  	dc.b	"river\src\stm8s_ex"
 679  0036 74692e6300    	dc.b	"ti.c",0
 699                     	end
