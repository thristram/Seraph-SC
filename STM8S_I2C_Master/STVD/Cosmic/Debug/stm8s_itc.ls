   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 50 uint8_t ITC_GetCPUCC(void)
  32                     ; 51 {
  34                     .text:	section	.text,new
  35  0000               _ITC_GetCPUCC:
  39                     ; 53   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 54   _asm("pop a");
  47  0001 84            pop a
  49                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 80 void ITC_DeInit(void)
  75                     ; 81 {
  76                     .text:	section	.text,new
  77  0000               _ITC_DeInit:
  81                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0000 35ff7f70      	mov	32624,#255
  84                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0004 35ff7f71      	mov	32625,#255
  87                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  0008 35ff7f72      	mov	32626,#255
  90                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000c 35ff7f73      	mov	32627,#255
  93                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0010 35ff7f74      	mov	32628,#255
  96                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0014 35ff7f75      	mov	32629,#255
  99                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  0018 35ff7f76      	mov	32630,#255
 102                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001c 35ff7f77      	mov	32631,#255
 105                     ; 90 }
 108  0020 81            	ret
 133                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 98 {
 134                     .text:	section	.text,new
 135  0000               _ITC_GetSoftIntStatus:
 139                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 141  0000 cd0000        	call	_ITC_GetCPUCC
 143  0003 a428          	and	a,#40
 146  0005 81            	ret
 392                     .const:	section	.text
 393  0000               L62:
 394  0000 0041          	dc.w	L14
 395  0002 0041          	dc.w	L14
 396  0004 0041          	dc.w	L14
 397  0006 0041          	dc.w	L14
 398  0008 004a          	dc.w	L34
 399  000a 004a          	dc.w	L34
 400  000c 004a          	dc.w	L34
 401  000e 004a          	dc.w	L34
 402  0010 007e          	dc.w	L102
 403  0012 007e          	dc.w	L102
 404  0014 0053          	dc.w	L54
 405  0016 0053          	dc.w	L54
 406  0018 005c          	dc.w	L74
 407  001a 005c          	dc.w	L74
 408  001c 005c          	dc.w	L74
 409  001e 005c          	dc.w	L74
 410  0020 0065          	dc.w	L15
 411  0022 007e          	dc.w	L102
 412  0024 007e          	dc.w	L102
 413  0026 0065          	dc.w	L15
 414  0028 006e          	dc.w	L35
 415  002a 006e          	dc.w	L35
 416  002c 006e          	dc.w	L35
 417  002e 006e          	dc.w	L35
 418  0030 0077          	dc.w	L55
 419                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 419                     ; 108 {
 420                     .text:	section	.text,new
 421  0000               _ITC_GetSoftwarePriority:
 423  0000 88            	push	a
 424  0001 89            	pushw	x
 425       00000002      OFST:	set	2
 428                     ; 109   uint8_t Value = 0;
 430  0002 0f02          	clr	(OFST+0,sp)
 431                     ; 110   uint8_t Mask = 0;
 433  0004 7b01          	ld	a,(OFST-1,sp)
 434  0006 97            	ld	xl,a
 435                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 437  0007 7b03          	ld	a,(OFST+1,sp)
 438  0009 a119          	cp	a,#25
 439  000b 2403          	jruge	L41
 440  000d 4f            	clr	a
 441  000e 2010          	jra	L61
 442  0010               L41:
 443  0010 ae0071        	ldw	x,#113
 444  0013 89            	pushw	x
 445  0014 ae0000        	ldw	x,#0
 446  0017 89            	pushw	x
 447  0018 ae0064        	ldw	x,#L571
 448  001b cd0000        	call	_assert_failed
 450  001e 5b04          	addw	sp,#4
 451  0020               L61:
 452                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 454  0020 7b03          	ld	a,(OFST+1,sp)
 455  0022 a403          	and	a,#3
 456  0024 48            	sll	a
 457  0025 5f            	clrw	x
 458  0026 97            	ld	xl,a
 459  0027 a603          	ld	a,#3
 460  0029 5d            	tnzw	x
 461  002a 2704          	jreq	L02
 462  002c               L22:
 463  002c 48            	sll	a
 464  002d 5a            	decw	x
 465  002e 26fc          	jrne	L22
 466  0030               L02:
 467  0030 6b01          	ld	(OFST-1,sp),a
 468                     ; 118   switch (IrqNum)
 470  0032 7b03          	ld	a,(OFST+1,sp)
 472                     ; 198   default:
 472                     ; 199     break;
 473  0034 a119          	cp	a,#25
 474  0036 2407          	jruge	L42
 475  0038 5f            	clrw	x
 476  0039 97            	ld	xl,a
 477  003a 58            	sllw	x
 478  003b de0000        	ldw	x,(L62,x)
 479  003e fc            	jp	(x)
 480  003f               L42:
 481  003f 203d          	jra	L102
 482  0041               L14:
 483                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 483                     ; 121   case ITC_IRQ_AWU:
 483                     ; 122   case ITC_IRQ_CLK:
 483                     ; 123   case ITC_IRQ_PORTA:
 483                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 485  0041 c67f70        	ld	a,32624
 486  0044 1401          	and	a,(OFST-1,sp)
 487  0046 6b02          	ld	(OFST+0,sp),a
 488                     ; 125     break;
 490  0048 2034          	jra	L102
 491  004a               L34:
 492                     ; 127   case ITC_IRQ_PORTB:
 492                     ; 128   case ITC_IRQ_PORTC:
 492                     ; 129   case ITC_IRQ_PORTD:
 492                     ; 130   case ITC_IRQ_PORTE:
 492                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 494  004a c67f71        	ld	a,32625
 495  004d 1401          	and	a,(OFST-1,sp)
 496  004f 6b02          	ld	(OFST+0,sp),a
 497                     ; 132     break;
 499  0051 202b          	jra	L102
 500  0053               L54:
 501                     ; 141   case ITC_IRQ_SPI:
 501                     ; 142   case ITC_IRQ_TIM1_OVF:
 501                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 503  0053 c67f72        	ld	a,32626
 504  0056 1401          	and	a,(OFST-1,sp)
 505  0058 6b02          	ld	(OFST+0,sp),a
 506                     ; 144     break;
 508  005a 2022          	jra	L102
 509  005c               L74:
 510                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 510                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 510                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 510                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 510                     ; 150 #else
 510                     ; 151   case ITC_IRQ_TIM2_OVF:
 510                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 510                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 510                     ; 154   case ITC_IRQ_TIM3_OVF:
 510                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 512  005c c67f73        	ld	a,32627
 513  005f 1401          	and	a,(OFST-1,sp)
 514  0061 6b02          	ld	(OFST+0,sp),a
 515                     ; 156     break;
 517  0063 2019          	jra	L102
 518  0065               L15:
 519                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 519                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 519                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 519                     ; 161   case ITC_IRQ_UART1_TX:
 519                     ; 162   case ITC_IRQ_UART1_RX:
 519                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 519                     ; 164 #if defined(STM8AF622x)
 519                     ; 165   case ITC_IRQ_UART4_TX:
 519                     ; 166   case ITC_IRQ_UART4_RX:
 519                     ; 167 #endif /*STM8AF622x */
 519                     ; 168   case ITC_IRQ_I2C:
 519                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 521  0065 c67f74        	ld	a,32628
 522  0068 1401          	and	a,(OFST-1,sp)
 523  006a 6b02          	ld	(OFST+0,sp),a
 524                     ; 170     break;
 526  006c 2010          	jra	L102
 527  006e               L35:
 528                     ; 173   case ITC_IRQ_UART2_TX:
 528                     ; 174   case ITC_IRQ_UART2_RX:
 528                     ; 175 #endif /*STM8S105 or STM8AF626x*/
 528                     ; 176 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 528                     ; 177     defined(STM8AF62Ax)
 528                     ; 178   case ITC_IRQ_UART3_TX:
 528                     ; 179   case ITC_IRQ_UART3_RX:
 528                     ; 180   case ITC_IRQ_ADC2:
 528                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 528                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 528                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 528                     ; 184   case ITC_IRQ_ADC1:
 528                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 528                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 528                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 528                     ; 188 #else
 528                     ; 189   case ITC_IRQ_TIM4_OVF:
 528                     ; 190 #endif /*STM8S903 or STM8AF622x */
 528                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 530  006e c67f75        	ld	a,32629
 531  0071 1401          	and	a,(OFST-1,sp)
 532  0073 6b02          	ld	(OFST+0,sp),a
 533                     ; 192     break;
 535  0075 2007          	jra	L102
 536  0077               L55:
 537                     ; 194   case ITC_IRQ_EEPROM_EEC:
 537                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 539  0077 c67f76        	ld	a,32630
 540  007a 1401          	and	a,(OFST-1,sp)
 541  007c 6b02          	ld	(OFST+0,sp),a
 542                     ; 196     break;
 544  007e               L75:
 545                     ; 198   default:
 545                     ; 199     break;
 547  007e               L102:
 548                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 550  007e 7b03          	ld	a,(OFST+1,sp)
 551  0080 a403          	and	a,#3
 552  0082 48            	sll	a
 553  0083 5f            	clrw	x
 554  0084 97            	ld	xl,a
 555  0085 7b02          	ld	a,(OFST+0,sp)
 556  0087 5d            	tnzw	x
 557  0088 2704          	jreq	L03
 558  008a               L23:
 559  008a 44            	srl	a
 560  008b 5a            	decw	x
 561  008c 26fc          	jrne	L23
 562  008e               L03:
 563  008e 6b02          	ld	(OFST+0,sp),a
 564                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 566  0090 7b02          	ld	a,(OFST+0,sp)
 569  0092 5b03          	addw	sp,#3
 570  0094 81            	ret
 632                     	switch	.const
 633  0032               L66:
 634  0032 0098          	dc.w	L302
 635  0034 0098          	dc.w	L302
 636  0036 0098          	dc.w	L302
 637  0038 0098          	dc.w	L302
 638  003a 00aa          	dc.w	L502
 639  003c 00aa          	dc.w	L502
 640  003e 00aa          	dc.w	L502
 641  0040 00aa          	dc.w	L502
 642  0042 0114          	dc.w	L352
 643  0044 0114          	dc.w	L352
 644  0046 00bc          	dc.w	L702
 645  0048 00bc          	dc.w	L702
 646  004a 00ce          	dc.w	L112
 647  004c 00ce          	dc.w	L112
 648  004e 00ce          	dc.w	L112
 649  0050 00ce          	dc.w	L112
 650  0052 00e0          	dc.w	L312
 651  0054 0114          	dc.w	L352
 652  0056 0114          	dc.w	L352
 653  0058 00e0          	dc.w	L312
 654  005a 00f2          	dc.w	L512
 655  005c 00f2          	dc.w	L512
 656  005e 00f2          	dc.w	L512
 657  0060 00f2          	dc.w	L512
 658  0062 0104          	dc.w	L712
 659                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 659                     ; 221 {
 660                     .text:	section	.text,new
 661  0000               _ITC_SetSoftwarePriority:
 663  0000 89            	pushw	x
 664  0001 89            	pushw	x
 665       00000002      OFST:	set	2
 668                     ; 222   uint8_t Mask = 0;
 670  0002 7b01          	ld	a,(OFST-1,sp)
 671  0004 97            	ld	xl,a
 672                     ; 223   uint8_t NewPriority = 0;
 674  0005 7b02          	ld	a,(OFST+0,sp)
 675  0007 97            	ld	xl,a
 676                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 678  0008 7b03          	ld	a,(OFST+1,sp)
 679  000a a119          	cp	a,#25
 680  000c 2403          	jruge	L63
 681  000e 4f            	clr	a
 682  000f 2010          	jra	L04
 683  0011               L63:
 684  0011 ae00e2        	ldw	x,#226
 685  0014 89            	pushw	x
 686  0015 ae0000        	ldw	x,#0
 687  0018 89            	pushw	x
 688  0019 ae0064        	ldw	x,#L571
 689  001c cd0000        	call	_assert_failed
 691  001f 5b04          	addw	sp,#4
 692  0021               L04:
 693                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 695  0021 7b04          	ld	a,(OFST+2,sp)
 696  0023 a102          	cp	a,#2
 697  0025 2710          	jreq	L44
 698  0027 7b04          	ld	a,(OFST+2,sp)
 699  0029 a101          	cp	a,#1
 700  002b 270a          	jreq	L44
 701  002d 0d04          	tnz	(OFST+2,sp)
 702  002f 2706          	jreq	L44
 703  0031 7b04          	ld	a,(OFST+2,sp)
 704  0033 a103          	cp	a,#3
 705  0035 2603          	jrne	L24
 706  0037               L44:
 707  0037 4f            	clr	a
 708  0038 2010          	jra	L64
 709  003a               L24:
 710  003a ae00e3        	ldw	x,#227
 711  003d 89            	pushw	x
 712  003e ae0000        	ldw	x,#0
 713  0041 89            	pushw	x
 714  0042 ae0064        	ldw	x,#L571
 715  0045 cd0000        	call	_assert_failed
 717  0048 5b04          	addw	sp,#4
 718  004a               L64:
 719                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 721  004a cd0000        	call	_ITC_GetSoftIntStatus
 723  004d a128          	cp	a,#40
 724  004f 2603          	jrne	L05
 725  0051 4f            	clr	a
 726  0052 2010          	jra	L25
 727  0054               L05:
 728  0054 ae00e6        	ldw	x,#230
 729  0057 89            	pushw	x
 730  0058 ae0000        	ldw	x,#0
 731  005b 89            	pushw	x
 732  005c ae0064        	ldw	x,#L571
 733  005f cd0000        	call	_assert_failed
 735  0062 5b04          	addw	sp,#4
 736  0064               L25:
 737                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 739  0064 7b03          	ld	a,(OFST+1,sp)
 740  0066 a403          	and	a,#3
 741  0068 48            	sll	a
 742  0069 5f            	clrw	x
 743  006a 97            	ld	xl,a
 744  006b a603          	ld	a,#3
 745  006d 5d            	tnzw	x
 746  006e 2704          	jreq	L45
 747  0070               L65:
 748  0070 48            	sll	a
 749  0071 5a            	decw	x
 750  0072 26fc          	jrne	L65
 751  0074               L45:
 752  0074 43            	cpl	a
 753  0075 6b01          	ld	(OFST-1,sp),a
 754                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 756  0077 7b03          	ld	a,(OFST+1,sp)
 757  0079 a403          	and	a,#3
 758  007b 48            	sll	a
 759  007c 5f            	clrw	x
 760  007d 97            	ld	xl,a
 761  007e 7b04          	ld	a,(OFST+2,sp)
 762  0080 5d            	tnzw	x
 763  0081 2704          	jreq	L06
 764  0083               L26:
 765  0083 48            	sll	a
 766  0084 5a            	decw	x
 767  0085 26fc          	jrne	L26
 768  0087               L06:
 769  0087 6b02          	ld	(OFST+0,sp),a
 770                     ; 239   switch (IrqNum)
 772  0089 7b03          	ld	a,(OFST+1,sp)
 774                     ; 329   default:
 774                     ; 330     break;
 775  008b a119          	cp	a,#25
 776  008d 2407          	jruge	L46
 777  008f 5f            	clrw	x
 778  0090 97            	ld	xl,a
 779  0091 58            	sllw	x
 780  0092 de0032        	ldw	x,(L66,x)
 781  0095 fc            	jp	(x)
 782  0096               L46:
 783  0096 207c          	jra	L352
 784  0098               L302:
 785                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 785                     ; 242   case ITC_IRQ_AWU:
 785                     ; 243   case ITC_IRQ_CLK:
 785                     ; 244   case ITC_IRQ_PORTA:
 785                     ; 245     ITC->ISPR1 &= Mask;
 787  0098 c67f70        	ld	a,32624
 788  009b 1401          	and	a,(OFST-1,sp)
 789  009d c77f70        	ld	32624,a
 790                     ; 246     ITC->ISPR1 |= NewPriority;
 792  00a0 c67f70        	ld	a,32624
 793  00a3 1a02          	or	a,(OFST+0,sp)
 794  00a5 c77f70        	ld	32624,a
 795                     ; 247     break;
 797  00a8 206a          	jra	L352
 798  00aa               L502:
 799                     ; 249   case ITC_IRQ_PORTB:
 799                     ; 250   case ITC_IRQ_PORTC:
 799                     ; 251   case ITC_IRQ_PORTD:
 799                     ; 252   case ITC_IRQ_PORTE:
 799                     ; 253     ITC->ISPR2 &= Mask;
 801  00aa c67f71        	ld	a,32625
 802  00ad 1401          	and	a,(OFST-1,sp)
 803  00af c77f71        	ld	32625,a
 804                     ; 254     ITC->ISPR2 |= NewPriority;
 806  00b2 c67f71        	ld	a,32625
 807  00b5 1a02          	or	a,(OFST+0,sp)
 808  00b7 c77f71        	ld	32625,a
 809                     ; 255     break;
 811  00ba 2058          	jra	L352
 812  00bc               L702:
 813                     ; 264   case ITC_IRQ_SPI:
 813                     ; 265   case ITC_IRQ_TIM1_OVF:
 813                     ; 266     ITC->ISPR3 &= Mask;
 815  00bc c67f72        	ld	a,32626
 816  00bf 1401          	and	a,(OFST-1,sp)
 817  00c1 c77f72        	ld	32626,a
 818                     ; 267     ITC->ISPR3 |= NewPriority;
 820  00c4 c67f72        	ld	a,32626
 821  00c7 1a02          	or	a,(OFST+0,sp)
 822  00c9 c77f72        	ld	32626,a
 823                     ; 268     break;
 825  00cc 2046          	jra	L352
 826  00ce               L112:
 827                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 827                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 827                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 827                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 827                     ; 274 #else
 827                     ; 275   case ITC_IRQ_TIM2_OVF:
 827                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 827                     ; 277 #endif /*STM8S903 or STM8AF622x */
 827                     ; 278   case ITC_IRQ_TIM3_OVF:
 827                     ; 279     ITC->ISPR4 &= Mask;
 829  00ce c67f73        	ld	a,32627
 830  00d1 1401          	and	a,(OFST-1,sp)
 831  00d3 c77f73        	ld	32627,a
 832                     ; 280     ITC->ISPR4 |= NewPriority;
 834  00d6 c67f73        	ld	a,32627
 835  00d9 1a02          	or	a,(OFST+0,sp)
 836  00db c77f73        	ld	32627,a
 837                     ; 281     break;
 839  00de 2034          	jra	L352
 840  00e0               L312:
 841                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 841                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 841                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 841                     ; 286   case ITC_IRQ_UART1_TX:
 841                     ; 287   case ITC_IRQ_UART1_RX:
 841                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 841                     ; 289 #if defined(STM8AF622x)
 841                     ; 290   case ITC_IRQ_UART4_TX:
 841                     ; 291   case ITC_IRQ_UART4_RX:
 841                     ; 292 #endif /*STM8AF622x */
 841                     ; 293   case ITC_IRQ_I2C:
 841                     ; 294     ITC->ISPR5 &= Mask;
 843  00e0 c67f74        	ld	a,32628
 844  00e3 1401          	and	a,(OFST-1,sp)
 845  00e5 c77f74        	ld	32628,a
 846                     ; 295     ITC->ISPR5 |= NewPriority;
 848  00e8 c67f74        	ld	a,32628
 849  00eb 1a02          	or	a,(OFST+0,sp)
 850  00ed c77f74        	ld	32628,a
 851                     ; 296     break;
 853  00f0 2022          	jra	L352
 854  00f2               L512:
 855                     ; 299   case ITC_IRQ_UART2_TX:
 855                     ; 300   case ITC_IRQ_UART2_RX:
 855                     ; 301 #endif /*STM8S105 or STM8AF626x */
 855                     ; 302     
 855                     ; 303 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 855                     ; 304     defined(STM8AF62Ax)
 855                     ; 305   case ITC_IRQ_UART3_TX:
 855                     ; 306   case ITC_IRQ_UART3_RX:
 855                     ; 307   case ITC_IRQ_ADC2:
 855                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 855                     ; 309     
 855                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 855                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 855                     ; 312   case ITC_IRQ_ADC1:
 855                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 855                     ; 314     
 855                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 855                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 855                     ; 317 #else
 855                     ; 318   case ITC_IRQ_TIM4_OVF:
 855                     ; 319 #endif /* STM8S903 or STM8AF622x */
 855                     ; 320     ITC->ISPR6 &= Mask;
 857  00f2 c67f75        	ld	a,32629
 858  00f5 1401          	and	a,(OFST-1,sp)
 859  00f7 c77f75        	ld	32629,a
 860                     ; 321     ITC->ISPR6 |= NewPriority;
 862  00fa c67f75        	ld	a,32629
 863  00fd 1a02          	or	a,(OFST+0,sp)
 864  00ff c77f75        	ld	32629,a
 865                     ; 322     break;
 867  0102 2010          	jra	L352
 868  0104               L712:
 869                     ; 324   case ITC_IRQ_EEPROM_EEC:
 869                     ; 325     ITC->ISPR7 &= Mask;
 871  0104 c67f76        	ld	a,32630
 872  0107 1401          	and	a,(OFST-1,sp)
 873  0109 c77f76        	ld	32630,a
 874                     ; 326     ITC->ISPR7 |= NewPriority;
 876  010c c67f76        	ld	a,32630
 877  010f 1a02          	or	a,(OFST+0,sp)
 878  0111 c77f76        	ld	32630,a
 879                     ; 327     break;
 881  0114               L122:
 882                     ; 329   default:
 882                     ; 330     break;
 884  0114               L352:
 885                     ; 332 }
 888  0114 5b04          	addw	sp,#4
 889  0116 81            	ret
 902                     	xdef	_ITC_GetSoftwarePriority
 903                     	xdef	_ITC_SetSoftwarePriority
 904                     	xdef	_ITC_GetSoftIntStatus
 905                     	xdef	_ITC_DeInit
 906                     	xdef	_ITC_GetCPUCC
 907                     	xref	_assert_failed
 908                     	switch	.const
 909  0064               L571:
 910  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 911  0076 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 912  0088 72697665725c  	dc.b	"river\src\stm8s_it"
 913  009a 632e6300      	dc.b	"c.c",0
 933                     	end
