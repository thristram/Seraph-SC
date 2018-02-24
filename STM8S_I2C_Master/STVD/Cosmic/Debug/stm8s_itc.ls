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
 406                     .const:	section	.text
 407  0000               L62:
 408  0000 0041          	dc.w	L14
 409  0002 0041          	dc.w	L14
 410  0004 0041          	dc.w	L14
 411  0006 0041          	dc.w	L14
 412  0008 004a          	dc.w	L34
 413  000a 004a          	dc.w	L34
 414  000c 004a          	dc.w	L34
 415  000e 004a          	dc.w	L34
 416  0010 007e          	dc.w	L502
 417  0012 007e          	dc.w	L502
 418  0014 0053          	dc.w	L54
 419  0016 0053          	dc.w	L54
 420  0018 005c          	dc.w	L74
 421  001a 005c          	dc.w	L74
 422  001c 005c          	dc.w	L74
 423  001e 005c          	dc.w	L74
 424  0020 0065          	dc.w	L15
 425  0022 0065          	dc.w	L15
 426  0024 0065          	dc.w	L15
 427  0026 0065          	dc.w	L15
 428  0028 006e          	dc.w	L35
 429  002a 006e          	dc.w	L35
 430  002c 006e          	dc.w	L35
 431  002e 006e          	dc.w	L35
 432  0030 0077          	dc.w	L55
 433                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 433                     ; 108 {
 434                     .text:	section	.text,new
 435  0000               _ITC_GetSoftwarePriority:
 437  0000 88            	push	a
 438  0001 89            	pushw	x
 439       00000002      OFST:	set	2
 442                     ; 109   uint8_t Value = 0;
 444  0002 0f02          	clr	(OFST+0,sp)
 445                     ; 110   uint8_t Mask = 0;
 447  0004 7b01          	ld	a,(OFST-1,sp)
 448  0006 97            	ld	xl,a
 449                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 451  0007 7b03          	ld	a,(OFST+1,sp)
 452  0009 a119          	cp	a,#25
 453  000b 2403          	jruge	L41
 454  000d 4f            	clr	a
 455  000e 2010          	jra	L61
 456  0010               L41:
 457  0010 ae0071        	ldw	x,#113
 458  0013 89            	pushw	x
 459  0014 ae0000        	ldw	x,#0
 460  0017 89            	pushw	x
 461  0018 ae0064        	ldw	x,#L102
 462  001b cd0000        	call	_assert_failed
 464  001e 5b04          	addw	sp,#4
 465  0020               L61:
 466                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 468  0020 7b03          	ld	a,(OFST+1,sp)
 469  0022 a403          	and	a,#3
 470  0024 48            	sll	a
 471  0025 5f            	clrw	x
 472  0026 97            	ld	xl,a
 473  0027 a603          	ld	a,#3
 474  0029 5d            	tnzw	x
 475  002a 2704          	jreq	L02
 476  002c               L22:
 477  002c 48            	sll	a
 478  002d 5a            	decw	x
 479  002e 26fc          	jrne	L22
 480  0030               L02:
 481  0030 6b01          	ld	(OFST-1,sp),a
 482                     ; 118   switch (IrqNum)
 484  0032 7b03          	ld	a,(OFST+1,sp)
 486                     ; 198   default:
 486                     ; 199     break;
 487  0034 a119          	cp	a,#25
 488  0036 2407          	jruge	L42
 489  0038 5f            	clrw	x
 490  0039 97            	ld	xl,a
 491  003a 58            	sllw	x
 492  003b de0000        	ldw	x,(L62,x)
 493  003e fc            	jp	(x)
 494  003f               L42:
 495  003f 203d          	jra	L502
 496  0041               L14:
 497                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 497                     ; 121   case ITC_IRQ_AWU:
 497                     ; 122   case ITC_IRQ_CLK:
 497                     ; 123   case ITC_IRQ_PORTA:
 497                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 499  0041 c67f70        	ld	a,32624
 500  0044 1401          	and	a,(OFST-1,sp)
 501  0046 6b02          	ld	(OFST+0,sp),a
 502                     ; 125     break;
 504  0048 2034          	jra	L502
 505  004a               L34:
 506                     ; 127   case ITC_IRQ_PORTB:
 506                     ; 128   case ITC_IRQ_PORTC:
 506                     ; 129   case ITC_IRQ_PORTD:
 506                     ; 130   case ITC_IRQ_PORTE:
 506                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 508  004a c67f71        	ld	a,32625
 509  004d 1401          	and	a,(OFST-1,sp)
 510  004f 6b02          	ld	(OFST+0,sp),a
 511                     ; 132     break;
 513  0051 202b          	jra	L502
 514  0053               L54:
 515                     ; 141   case ITC_IRQ_SPI:
 515                     ; 142   case ITC_IRQ_TIM1_OVF:
 515                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 517  0053 c67f72        	ld	a,32626
 518  0056 1401          	and	a,(OFST-1,sp)
 519  0058 6b02          	ld	(OFST+0,sp),a
 520                     ; 144     break;
 522  005a 2022          	jra	L502
 523  005c               L74:
 524                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 524                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 524                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 524                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 524                     ; 150 #else
 524                     ; 151   case ITC_IRQ_TIM2_OVF:
 524                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 524                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 524                     ; 154   case ITC_IRQ_TIM3_OVF:
 524                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 526  005c c67f73        	ld	a,32627
 527  005f 1401          	and	a,(OFST-1,sp)
 528  0061 6b02          	ld	(OFST+0,sp),a
 529                     ; 156     break;
 531  0063 2019          	jra	L502
 532  0065               L15:
 533                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 533                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 533                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 533                     ; 161   case ITC_IRQ_UART1_TX:
 533                     ; 162   case ITC_IRQ_UART1_RX:
 533                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 533                     ; 164 #if defined(STM8AF622x)
 533                     ; 165   case ITC_IRQ_UART4_TX:
 533                     ; 166   case ITC_IRQ_UART4_RX:
 533                     ; 167 #endif /*STM8AF622x */
 533                     ; 168   case ITC_IRQ_I2C:
 533                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 535  0065 c67f74        	ld	a,32628
 536  0068 1401          	and	a,(OFST-1,sp)
 537  006a 6b02          	ld	(OFST+0,sp),a
 538                     ; 170     break;
 540  006c 2010          	jra	L502
 541  006e               L35:
 542                     ; 178   case ITC_IRQ_UART3_TX:
 542                     ; 179   case ITC_IRQ_UART3_RX:
 542                     ; 180   case ITC_IRQ_ADC2:
 542                     ; 181 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 542                     ; 182 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 542                     ; 183     defined(STM8S903) || defined(STM8AF626x) || defined(STM8AF622x)
 542                     ; 184   case ITC_IRQ_ADC1:
 542                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 542                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 542                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 542                     ; 188 #else
 542                     ; 189   case ITC_IRQ_TIM4_OVF:
 542                     ; 190 #endif /*STM8S903 or STM8AF622x */
 542                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 544  006e c67f75        	ld	a,32629
 545  0071 1401          	and	a,(OFST-1,sp)
 546  0073 6b02          	ld	(OFST+0,sp),a
 547                     ; 192     break;
 549  0075 2007          	jra	L502
 550  0077               L55:
 551                     ; 194   case ITC_IRQ_EEPROM_EEC:
 551                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 553  0077 c67f76        	ld	a,32630
 554  007a 1401          	and	a,(OFST-1,sp)
 555  007c 6b02          	ld	(OFST+0,sp),a
 556                     ; 196     break;
 558  007e               L75:
 559                     ; 198   default:
 559                     ; 199     break;
 561  007e               L502:
 562                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 564  007e 7b03          	ld	a,(OFST+1,sp)
 565  0080 a403          	and	a,#3
 566  0082 48            	sll	a
 567  0083 5f            	clrw	x
 568  0084 97            	ld	xl,a
 569  0085 7b02          	ld	a,(OFST+0,sp)
 570  0087 5d            	tnzw	x
 571  0088 2704          	jreq	L03
 572  008a               L23:
 573  008a 44            	srl	a
 574  008b 5a            	decw	x
 575  008c 26fc          	jrne	L23
 576  008e               L03:
 577  008e 6b02          	ld	(OFST+0,sp),a
 578                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 580  0090 7b02          	ld	a,(OFST+0,sp)
 583  0092 5b03          	addw	sp,#3
 584  0094 81            	ret
 646                     	switch	.const
 647  0032               L66:
 648  0032 0098          	dc.w	L702
 649  0034 0098          	dc.w	L702
 650  0036 0098          	dc.w	L702
 651  0038 0098          	dc.w	L702
 652  003a 00aa          	dc.w	L112
 653  003c 00aa          	dc.w	L112
 654  003e 00aa          	dc.w	L112
 655  0040 00aa          	dc.w	L112
 656  0042 0114          	dc.w	L752
 657  0044 0114          	dc.w	L752
 658  0046 00bc          	dc.w	L312
 659  0048 00bc          	dc.w	L312
 660  004a 00ce          	dc.w	L512
 661  004c 00ce          	dc.w	L512
 662  004e 00ce          	dc.w	L512
 663  0050 00ce          	dc.w	L512
 664  0052 00e0          	dc.w	L712
 665  0054 00e0          	dc.w	L712
 666  0056 00e0          	dc.w	L712
 667  0058 00e0          	dc.w	L712
 668  005a 00f2          	dc.w	L122
 669  005c 00f2          	dc.w	L122
 670  005e 00f2          	dc.w	L122
 671  0060 00f2          	dc.w	L122
 672  0062 0104          	dc.w	L322
 673                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 673                     ; 221 {
 674                     .text:	section	.text,new
 675  0000               _ITC_SetSoftwarePriority:
 677  0000 89            	pushw	x
 678  0001 89            	pushw	x
 679       00000002      OFST:	set	2
 682                     ; 222   uint8_t Mask = 0;
 684  0002 7b01          	ld	a,(OFST-1,sp)
 685  0004 97            	ld	xl,a
 686                     ; 223   uint8_t NewPriority = 0;
 688  0005 7b02          	ld	a,(OFST+0,sp)
 689  0007 97            	ld	xl,a
 690                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 692  0008 7b03          	ld	a,(OFST+1,sp)
 693  000a a119          	cp	a,#25
 694  000c 2403          	jruge	L63
 695  000e 4f            	clr	a
 696  000f 2010          	jra	L04
 697  0011               L63:
 698  0011 ae00e2        	ldw	x,#226
 699  0014 89            	pushw	x
 700  0015 ae0000        	ldw	x,#0
 701  0018 89            	pushw	x
 702  0019 ae0064        	ldw	x,#L102
 703  001c cd0000        	call	_assert_failed
 705  001f 5b04          	addw	sp,#4
 706  0021               L04:
 707                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 709  0021 7b04          	ld	a,(OFST+2,sp)
 710  0023 a102          	cp	a,#2
 711  0025 2710          	jreq	L44
 712  0027 7b04          	ld	a,(OFST+2,sp)
 713  0029 a101          	cp	a,#1
 714  002b 270a          	jreq	L44
 715  002d 0d04          	tnz	(OFST+2,sp)
 716  002f 2706          	jreq	L44
 717  0031 7b04          	ld	a,(OFST+2,sp)
 718  0033 a103          	cp	a,#3
 719  0035 2603          	jrne	L24
 720  0037               L44:
 721  0037 4f            	clr	a
 722  0038 2010          	jra	L64
 723  003a               L24:
 724  003a ae00e3        	ldw	x,#227
 725  003d 89            	pushw	x
 726  003e ae0000        	ldw	x,#0
 727  0041 89            	pushw	x
 728  0042 ae0064        	ldw	x,#L102
 729  0045 cd0000        	call	_assert_failed
 731  0048 5b04          	addw	sp,#4
 732  004a               L64:
 733                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 735  004a cd0000        	call	_ITC_GetSoftIntStatus
 737  004d a128          	cp	a,#40
 738  004f 2603          	jrne	L05
 739  0051 4f            	clr	a
 740  0052 2010          	jra	L25
 741  0054               L05:
 742  0054 ae00e6        	ldw	x,#230
 743  0057 89            	pushw	x
 744  0058 ae0000        	ldw	x,#0
 745  005b 89            	pushw	x
 746  005c ae0064        	ldw	x,#L102
 747  005f cd0000        	call	_assert_failed
 749  0062 5b04          	addw	sp,#4
 750  0064               L25:
 751                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 753  0064 7b03          	ld	a,(OFST+1,sp)
 754  0066 a403          	and	a,#3
 755  0068 48            	sll	a
 756  0069 5f            	clrw	x
 757  006a 97            	ld	xl,a
 758  006b a603          	ld	a,#3
 759  006d 5d            	tnzw	x
 760  006e 2704          	jreq	L45
 761  0070               L65:
 762  0070 48            	sll	a
 763  0071 5a            	decw	x
 764  0072 26fc          	jrne	L65
 765  0074               L45:
 766  0074 43            	cpl	a
 767  0075 6b01          	ld	(OFST-1,sp),a
 768                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 770  0077 7b03          	ld	a,(OFST+1,sp)
 771  0079 a403          	and	a,#3
 772  007b 48            	sll	a
 773  007c 5f            	clrw	x
 774  007d 97            	ld	xl,a
 775  007e 7b04          	ld	a,(OFST+2,sp)
 776  0080 5d            	tnzw	x
 777  0081 2704          	jreq	L06
 778  0083               L26:
 779  0083 48            	sll	a
 780  0084 5a            	decw	x
 781  0085 26fc          	jrne	L26
 782  0087               L06:
 783  0087 6b02          	ld	(OFST+0,sp),a
 784                     ; 239   switch (IrqNum)
 786  0089 7b03          	ld	a,(OFST+1,sp)
 788                     ; 329   default:
 788                     ; 330     break;
 789  008b a119          	cp	a,#25
 790  008d 2407          	jruge	L46
 791  008f 5f            	clrw	x
 792  0090 97            	ld	xl,a
 793  0091 58            	sllw	x
 794  0092 de0032        	ldw	x,(L66,x)
 795  0095 fc            	jp	(x)
 796  0096               L46:
 797  0096 207c          	jra	L752
 798  0098               L702:
 799                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 799                     ; 242   case ITC_IRQ_AWU:
 799                     ; 243   case ITC_IRQ_CLK:
 799                     ; 244   case ITC_IRQ_PORTA:
 799                     ; 245     ITC->ISPR1 &= Mask;
 801  0098 c67f70        	ld	a,32624
 802  009b 1401          	and	a,(OFST-1,sp)
 803  009d c77f70        	ld	32624,a
 804                     ; 246     ITC->ISPR1 |= NewPriority;
 806  00a0 c67f70        	ld	a,32624
 807  00a3 1a02          	or	a,(OFST+0,sp)
 808  00a5 c77f70        	ld	32624,a
 809                     ; 247     break;
 811  00a8 206a          	jra	L752
 812  00aa               L112:
 813                     ; 249   case ITC_IRQ_PORTB:
 813                     ; 250   case ITC_IRQ_PORTC:
 813                     ; 251   case ITC_IRQ_PORTD:
 813                     ; 252   case ITC_IRQ_PORTE:
 813                     ; 253     ITC->ISPR2 &= Mask;
 815  00aa c67f71        	ld	a,32625
 816  00ad 1401          	and	a,(OFST-1,sp)
 817  00af c77f71        	ld	32625,a
 818                     ; 254     ITC->ISPR2 |= NewPriority;
 820  00b2 c67f71        	ld	a,32625
 821  00b5 1a02          	or	a,(OFST+0,sp)
 822  00b7 c77f71        	ld	32625,a
 823                     ; 255     break;
 825  00ba 2058          	jra	L752
 826  00bc               L312:
 827                     ; 264   case ITC_IRQ_SPI:
 827                     ; 265   case ITC_IRQ_TIM1_OVF:
 827                     ; 266     ITC->ISPR3 &= Mask;
 829  00bc c67f72        	ld	a,32626
 830  00bf 1401          	and	a,(OFST-1,sp)
 831  00c1 c77f72        	ld	32626,a
 832                     ; 267     ITC->ISPR3 |= NewPriority;
 834  00c4 c67f72        	ld	a,32626
 835  00c7 1a02          	or	a,(OFST+0,sp)
 836  00c9 c77f72        	ld	32626,a
 837                     ; 268     break;
 839  00cc 2046          	jra	L752
 840  00ce               L512:
 841                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 841                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 841                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 841                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 841                     ; 274 #else
 841                     ; 275   case ITC_IRQ_TIM2_OVF:
 841                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 841                     ; 277 #endif /*STM8S903 or STM8AF622x */
 841                     ; 278   case ITC_IRQ_TIM3_OVF:
 841                     ; 279     ITC->ISPR4 &= Mask;
 843  00ce c67f73        	ld	a,32627
 844  00d1 1401          	and	a,(OFST-1,sp)
 845  00d3 c77f73        	ld	32627,a
 846                     ; 280     ITC->ISPR4 |= NewPriority;
 848  00d6 c67f73        	ld	a,32627
 849  00d9 1a02          	or	a,(OFST+0,sp)
 850  00db c77f73        	ld	32627,a
 851                     ; 281     break;
 853  00de 2034          	jra	L752
 854  00e0               L712:
 855                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 855                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 855                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 855                     ; 286   case ITC_IRQ_UART1_TX:
 855                     ; 287   case ITC_IRQ_UART1_RX:
 855                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 855                     ; 289 #if defined(STM8AF622x)
 855                     ; 290   case ITC_IRQ_UART4_TX:
 855                     ; 291   case ITC_IRQ_UART4_RX:
 855                     ; 292 #endif /*STM8AF622x */
 855                     ; 293   case ITC_IRQ_I2C:
 855                     ; 294     ITC->ISPR5 &= Mask;
 857  00e0 c67f74        	ld	a,32628
 858  00e3 1401          	and	a,(OFST-1,sp)
 859  00e5 c77f74        	ld	32628,a
 860                     ; 295     ITC->ISPR5 |= NewPriority;
 862  00e8 c67f74        	ld	a,32628
 863  00eb 1a02          	or	a,(OFST+0,sp)
 864  00ed c77f74        	ld	32628,a
 865                     ; 296     break;
 867  00f0 2022          	jra	L752
 868  00f2               L122:
 869                     ; 305   case ITC_IRQ_UART3_TX:
 869                     ; 306   case ITC_IRQ_UART3_RX:
 869                     ; 307   case ITC_IRQ_ADC2:
 869                     ; 308 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 869                     ; 309     
 869                     ; 310 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 869                     ; 311     defined(STM8S903) || defined(STM8AF626x) || defined (STM8AF622x)
 869                     ; 312   case ITC_IRQ_ADC1:
 869                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 869                     ; 314     
 869                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 869                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 869                     ; 317 #else
 869                     ; 318   case ITC_IRQ_TIM4_OVF:
 869                     ; 319 #endif /* STM8S903 or STM8AF622x */
 869                     ; 320     ITC->ISPR6 &= Mask;
 871  00f2 c67f75        	ld	a,32629
 872  00f5 1401          	and	a,(OFST-1,sp)
 873  00f7 c77f75        	ld	32629,a
 874                     ; 321     ITC->ISPR6 |= NewPriority;
 876  00fa c67f75        	ld	a,32629
 877  00fd 1a02          	or	a,(OFST+0,sp)
 878  00ff c77f75        	ld	32629,a
 879                     ; 322     break;
 881  0102 2010          	jra	L752
 882  0104               L322:
 883                     ; 324   case ITC_IRQ_EEPROM_EEC:
 883                     ; 325     ITC->ISPR7 &= Mask;
 885  0104 c67f76        	ld	a,32630
 886  0107 1401          	and	a,(OFST-1,sp)
 887  0109 c77f76        	ld	32630,a
 888                     ; 326     ITC->ISPR7 |= NewPriority;
 890  010c c67f76        	ld	a,32630
 891  010f 1a02          	or	a,(OFST+0,sp)
 892  0111 c77f76        	ld	32630,a
 893                     ; 327     break;
 895  0114               L522:
 896                     ; 329   default:
 896                     ; 330     break;
 898  0114               L752:
 899                     ; 332 }
 902  0114 5b04          	addw	sp,#4
 903  0116 81            	ret
 916                     	xdef	_ITC_GetSoftwarePriority
 917                     	xdef	_ITC_SetSoftwarePriority
 918                     	xdef	_ITC_GetSoftIntStatus
 919                     	xdef	_ITC_DeInit
 920                     	xdef	_ITC_GetCPUCC
 921                     	xref	_assert_failed
 922                     	switch	.const
 923  0064               L102:
 924  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 925  0076 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 926  0088 72697665725c  	dc.b	"river\src\stm8s_it"
 927  009a 632e6300      	dc.b	"c.c",0
 947                     	end
