   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 67 void I2C_DeInit(void)
  32                     ; 68 {
  34                     .text:	section	.text,new
  35  0000               _I2C_DeInit:
  39                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  41  0000 725f5210      	clr	21008
  42                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  44  0004 725f5211      	clr	21009
  45                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  47  0008 725f5212      	clr	21010
  48                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  50  000c 725f5213      	clr	21011
  51                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  53  0010 725f5214      	clr	21012
  54                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  56  0014 725f521a      	clr	21018
  57                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  59  0018 725f521b      	clr	21019
  60                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  62  001c 725f521c      	clr	21020
  63                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  65  0020 3502521d      	mov	21021,#2
  66                     ; 78 }
  69  0024 81            	ret
 237                     .const:	section	.text
 238  0000               L44:
 239  0000 00061a81      	dc.l	400001
 240  0004               L05:
 241  0004 000186a1      	dc.l	100001
 242  0008               L25:
 243  0008 000f4240      	dc.l	1000000
 244                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 244                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 244                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 244                     ; 99 {
 245                     .text:	section	.text,new
 246  0000               _I2C_Init:
 248  0000 5209          	subw	sp,#9
 249       00000009      OFST:	set	9
 252                     ; 100   uint16_t result = 0x0004;
 254  0002 1e08          	ldw	x,(OFST-1,sp)
 255                     ; 101   uint16_t tmpval = 0;
 257  0004 1e05          	ldw	x,(OFST-4,sp)
 258                     ; 102   uint8_t tmpccrh = 0;
 260  0006 0f07          	clr	(OFST-2,sp)
 261                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 263  0008 0d13          	tnz	(OFST+10,sp)
 264  000a 270c          	jreq	L21
 265  000c 7b13          	ld	a,(OFST+10,sp)
 266  000e a101          	cp	a,#1
 267  0010 2706          	jreq	L21
 268  0012 7b13          	ld	a,(OFST+10,sp)
 269  0014 a102          	cp	a,#2
 270  0016 2603          	jrne	L01
 271  0018               L21:
 272  0018 4f            	clr	a
 273  0019 2010          	jra	L41
 274  001b               L01:
 275  001b ae0069        	ldw	x,#105
 276  001e 89            	pushw	x
 277  001f ae0000        	ldw	x,#0
 278  0022 89            	pushw	x
 279  0023 ae000c        	ldw	x,#L511
 280  0026 cd0000        	call	_assert_failed
 282  0029 5b04          	addw	sp,#4
 283  002b               L41:
 284                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 286  002b 0d14          	tnz	(OFST+11,sp)
 287  002d 2706          	jreq	L02
 288  002f 7b14          	ld	a,(OFST+11,sp)
 289  0031 a180          	cp	a,#128
 290  0033 2603          	jrne	L61
 291  0035               L02:
 292  0035 4f            	clr	a
 293  0036 2010          	jra	L22
 294  0038               L61:
 295  0038 ae006a        	ldw	x,#106
 296  003b 89            	pushw	x
 297  003c ae0000        	ldw	x,#0
 298  003f 89            	pushw	x
 299  0040 ae000c        	ldw	x,#L511
 300  0043 cd0000        	call	_assert_failed
 302  0046 5b04          	addw	sp,#4
 303  0048               L22:
 304                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 306  0048 1e10          	ldw	x,(OFST+7,sp)
 307  004a a30400        	cpw	x,#1024
 308  004d 2403          	jruge	L42
 309  004f 4f            	clr	a
 310  0050 2010          	jra	L62
 311  0052               L42:
 312  0052 ae006b        	ldw	x,#107
 313  0055 89            	pushw	x
 314  0056 ae0000        	ldw	x,#0
 315  0059 89            	pushw	x
 316  005a ae000c        	ldw	x,#L511
 317  005d cd0000        	call	_assert_failed
 319  0060 5b04          	addw	sp,#4
 320  0062               L62:
 321                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 323  0062 0d12          	tnz	(OFST+9,sp)
 324  0064 2706          	jreq	L23
 325  0066 7b12          	ld	a,(OFST+9,sp)
 326  0068 a140          	cp	a,#64
 327  006a 2603          	jrne	L03
 328  006c               L23:
 329  006c 4f            	clr	a
 330  006d 2010          	jra	L43
 331  006f               L03:
 332  006f ae006c        	ldw	x,#108
 333  0072 89            	pushw	x
 334  0073 ae0000        	ldw	x,#0
 335  0076 89            	pushw	x
 336  0077 ae000c        	ldw	x,#L511
 337  007a cd0000        	call	_assert_failed
 339  007d 5b04          	addw	sp,#4
 340  007f               L43:
 341                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 343  007f 0d15          	tnz	(OFST+12,sp)
 344  0081 2709          	jreq	L63
 345  0083 7b15          	ld	a,(OFST+12,sp)
 346  0085 a111          	cp	a,#17
 347  0087 2403          	jruge	L63
 348  0089 4f            	clr	a
 349  008a 2010          	jra	L04
 350  008c               L63:
 351  008c ae006d        	ldw	x,#109
 352  008f 89            	pushw	x
 353  0090 ae0000        	ldw	x,#0
 354  0093 89            	pushw	x
 355  0094 ae000c        	ldw	x,#L511
 356  0097 cd0000        	call	_assert_failed
 358  009a 5b04          	addw	sp,#4
 359  009c               L04:
 360                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 362  009c 96            	ldw	x,sp
 363  009d 1c000c        	addw	x,#OFST+3
 364  00a0 cd0000        	call	c_lzmp
 366  00a3 2712          	jreq	L24
 367  00a5 96            	ldw	x,sp
 368  00a6 1c000c        	addw	x,#OFST+3
 369  00a9 cd0000        	call	c_ltor
 371  00ac ae0000        	ldw	x,#L44
 372  00af cd0000        	call	c_lcmp
 374  00b2 2403          	jruge	L24
 375  00b4 4f            	clr	a
 376  00b5 2010          	jra	L64
 377  00b7               L24:
 378  00b7 ae006e        	ldw	x,#110
 379  00ba 89            	pushw	x
 380  00bb ae0000        	ldw	x,#0
 381  00be 89            	pushw	x
 382  00bf ae000c        	ldw	x,#L511
 383  00c2 cd0000        	call	_assert_failed
 385  00c5 5b04          	addw	sp,#4
 386  00c7               L64:
 387                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 389  00c7 c65212        	ld	a,21010
 390  00ca a4c0          	and	a,#192
 391  00cc c75212        	ld	21010,a
 392                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 394  00cf c65212        	ld	a,21010
 395  00d2 1a15          	or	a,(OFST+12,sp)
 396  00d4 c75212        	ld	21010,a
 397                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 399  00d7 72115210      	bres	21008,#0
 400                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 402  00db c6521c        	ld	a,21020
 403  00de a430          	and	a,#48
 404  00e0 c7521c        	ld	21020,a
 405                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 407  00e3 725f521b      	clr	21019
 408                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 410  00e7 96            	ldw	x,sp
 411  00e8 1c000c        	addw	x,#OFST+3
 412  00eb cd0000        	call	c_ltor
 414  00ee ae0004        	ldw	x,#L05
 415  00f1 cd0000        	call	c_lcmp
 417  00f4 2403          	jruge	L65
 418  00f6 cc0183        	jp	L711
 419  00f9               L65:
 420                     ; 131     tmpccrh = I2C_CCRH_FS;
 422  00f9 a680          	ld	a,#128
 423  00fb 6b07          	ld	(OFST-2,sp),a
 424                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 426  00fd 0d12          	tnz	(OFST+9,sp)
 427  00ff 2630          	jrne	L121
 428                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 430  0101 96            	ldw	x,sp
 431  0102 1c000c        	addw	x,#OFST+3
 432  0105 cd0000        	call	c_ltor
 434  0108 a603          	ld	a,#3
 435  010a cd0000        	call	c_smul
 437  010d 96            	ldw	x,sp
 438  010e 1c0001        	addw	x,#OFST-8
 439  0111 cd0000        	call	c_rtol
 441  0114 7b15          	ld	a,(OFST+12,sp)
 442  0116 b703          	ld	c_lreg+3,a
 443  0118 3f02          	clr	c_lreg+2
 444  011a 3f01          	clr	c_lreg+1
 445  011c 3f00          	clr	c_lreg
 446  011e ae0008        	ldw	x,#L25
 447  0121 cd0000        	call	c_lmul
 449  0124 96            	ldw	x,sp
 450  0125 1c0001        	addw	x,#OFST-8
 451  0128 cd0000        	call	c_ludv
 453  012b be02          	ldw	x,c_lreg+2
 454  012d 1f08          	ldw	(OFST-1,sp),x
 456  012f 2034          	jra	L321
 457  0131               L121:
 458                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 460  0131 96            	ldw	x,sp
 461  0132 1c000c        	addw	x,#OFST+3
 462  0135 cd0000        	call	c_ltor
 464  0138 a619          	ld	a,#25
 465  013a cd0000        	call	c_smul
 467  013d 96            	ldw	x,sp
 468  013e 1c0001        	addw	x,#OFST-8
 469  0141 cd0000        	call	c_rtol
 471  0144 7b15          	ld	a,(OFST+12,sp)
 472  0146 b703          	ld	c_lreg+3,a
 473  0148 3f02          	clr	c_lreg+2
 474  014a 3f01          	clr	c_lreg+1
 475  014c 3f00          	clr	c_lreg
 476  014e ae0008        	ldw	x,#L25
 477  0151 cd0000        	call	c_lmul
 479  0154 96            	ldw	x,sp
 480  0155 1c0001        	addw	x,#OFST-8
 481  0158 cd0000        	call	c_ludv
 483  015b be02          	ldw	x,c_lreg+2
 484  015d 1f08          	ldw	(OFST-1,sp),x
 485                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 487  015f 7b07          	ld	a,(OFST-2,sp)
 488  0161 aa40          	or	a,#64
 489  0163 6b07          	ld	(OFST-2,sp),a
 490  0165               L321:
 491                     ; 147     if (result < (uint16_t)0x01)
 493  0165 1e08          	ldw	x,(OFST-1,sp)
 494  0167 2605          	jrne	L521
 495                     ; 150       result = (uint16_t)0x0001;
 497  0169 ae0001        	ldw	x,#1
 498  016c 1f08          	ldw	(OFST-1,sp),x
 499  016e               L521:
 500                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 502  016e 7b15          	ld	a,(OFST+12,sp)
 503  0170 97            	ld	xl,a
 504  0171 a603          	ld	a,#3
 505  0173 42            	mul	x,a
 506  0174 a60a          	ld	a,#10
 507  0176 cd0000        	call	c_sdivx
 509  0179 5c            	incw	x
 510  017a 1f05          	ldw	(OFST-4,sp),x
 511                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 513  017c 7b06          	ld	a,(OFST-3,sp)
 514  017e c7521d        	ld	21021,a
 516  0181 2043          	jra	L721
 517  0183               L711:
 518                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 520  0183 96            	ldw	x,sp
 521  0184 1c000c        	addw	x,#OFST+3
 522  0187 cd0000        	call	c_ltor
 524  018a 3803          	sll	c_lreg+3
 525  018c 3902          	rlc	c_lreg+2
 526  018e 3901          	rlc	c_lreg+1
 527  0190 3900          	rlc	c_lreg
 528  0192 96            	ldw	x,sp
 529  0193 1c0001        	addw	x,#OFST-8
 530  0196 cd0000        	call	c_rtol
 532  0199 7b15          	ld	a,(OFST+12,sp)
 533  019b b703          	ld	c_lreg+3,a
 534  019d 3f02          	clr	c_lreg+2
 535  019f 3f01          	clr	c_lreg+1
 536  01a1 3f00          	clr	c_lreg
 537  01a3 ae0008        	ldw	x,#L25
 538  01a6 cd0000        	call	c_lmul
 540  01a9 96            	ldw	x,sp
 541  01aa 1c0001        	addw	x,#OFST-8
 542  01ad cd0000        	call	c_ludv
 544  01b0 be02          	ldw	x,c_lreg+2
 545  01b2 1f08          	ldw	(OFST-1,sp),x
 546                     ; 167     if (result < (uint16_t)0x0004)
 548  01b4 1e08          	ldw	x,(OFST-1,sp)
 549  01b6 a30004        	cpw	x,#4
 550  01b9 2405          	jruge	L131
 551                     ; 170       result = (uint16_t)0x0004;
 553  01bb ae0004        	ldw	x,#4
 554  01be 1f08          	ldw	(OFST-1,sp),x
 555  01c0               L131:
 556                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 558  01c0 7b15          	ld	a,(OFST+12,sp)
 559  01c2 4c            	inc	a
 560  01c3 c7521d        	ld	21021,a
 561  01c6               L721:
 562                     ; 181   I2C->CCRL = (uint8_t)result;
 564  01c6 7b09          	ld	a,(OFST+0,sp)
 565  01c8 c7521b        	ld	21019,a
 566                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 568  01cb 7b08          	ld	a,(OFST-1,sp)
 569  01cd a40f          	and	a,#15
 570  01cf 1a07          	or	a,(OFST-2,sp)
 571  01d1 c7521c        	ld	21020,a
 572                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 574  01d4 72105210      	bset	21008,#0
 575                     ; 188   I2C_AcknowledgeConfig(Ack);
 577  01d8 7b13          	ld	a,(OFST+10,sp)
 578  01da cd0000        	call	_I2C_AcknowledgeConfig
 580                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 582  01dd 7b11          	ld	a,(OFST+8,sp)
 583  01df c75213        	ld	21011,a
 584                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 584                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 586  01e2 7b10          	ld	a,(OFST+7,sp)
 587  01e4 97            	ld	xl,a
 588  01e5 7b11          	ld	a,(OFST+8,sp)
 589  01e7 9f            	ld	a,xl
 590  01e8 a403          	and	a,#3
 591  01ea 97            	ld	xl,a
 592  01eb 4f            	clr	a
 593  01ec 02            	rlwa	x,a
 594  01ed a607          	ld	a,#7
 595  01ef               L45:
 596  01ef 54            	srlw	x
 597  01f0 4a            	dec	a
 598  01f1 26fc          	jrne	L45
 599  01f3 9f            	ld	a,xl
 600  01f4 6b04          	ld	(OFST-5,sp),a
 601  01f6 7b14          	ld	a,(OFST+11,sp)
 602  01f8 aa40          	or	a,#64
 603  01fa 1a04          	or	a,(OFST-5,sp)
 604  01fc c75214        	ld	21012,a
 605                     ; 194 }
 608  01ff 5b09          	addw	sp,#9
 609  0201 81            	ret
 665                     ; 202 void I2C_Cmd(FunctionalState NewState)
 665                     ; 203 {
 666                     .text:	section	.text,new
 667  0000               _I2C_Cmd:
 669  0000 88            	push	a
 670       00000000      OFST:	set	0
 673                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 675  0001 4d            	tnz	a
 676  0002 2704          	jreq	L46
 677  0004 a101          	cp	a,#1
 678  0006 2603          	jrne	L26
 679  0008               L46:
 680  0008 4f            	clr	a
 681  0009 2010          	jra	L66
 682  000b               L26:
 683  000b ae00cd        	ldw	x,#205
 684  000e 89            	pushw	x
 685  000f ae0000        	ldw	x,#0
 686  0012 89            	pushw	x
 687  0013 ae000c        	ldw	x,#L511
 688  0016 cd0000        	call	_assert_failed
 690  0019 5b04          	addw	sp,#4
 691  001b               L66:
 692                     ; 207   if (NewState != DISABLE)
 694  001b 0d01          	tnz	(OFST+1,sp)
 695  001d 2706          	jreq	L161
 696                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 698  001f 72105210      	bset	21008,#0
 700  0023 2004          	jra	L361
 701  0025               L161:
 702                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 704  0025 72115210      	bres	21008,#0
 705  0029               L361:
 706                     ; 217 }
 709  0029 84            	pop	a
 710  002a 81            	ret
 746                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 746                     ; 226 {
 747                     .text:	section	.text,new
 748  0000               _I2C_GeneralCallCmd:
 750  0000 88            	push	a
 751       00000000      OFST:	set	0
 754                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 756  0001 4d            	tnz	a
 757  0002 2704          	jreq	L47
 758  0004 a101          	cp	a,#1
 759  0006 2603          	jrne	L27
 760  0008               L47:
 761  0008 4f            	clr	a
 762  0009 2010          	jra	L67
 763  000b               L27:
 764  000b ae00e4        	ldw	x,#228
 765  000e 89            	pushw	x
 766  000f ae0000        	ldw	x,#0
 767  0012 89            	pushw	x
 768  0013 ae000c        	ldw	x,#L511
 769  0016 cd0000        	call	_assert_failed
 771  0019 5b04          	addw	sp,#4
 772  001b               L67:
 773                     ; 230   if (NewState != DISABLE)
 775  001b 0d01          	tnz	(OFST+1,sp)
 776  001d 2706          	jreq	L302
 777                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 779  001f 721c5210      	bset	21008,#6
 781  0023 2004          	jra	L502
 782  0025               L302:
 783                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 785  0025 721d5210      	bres	21008,#6
 786  0029               L502:
 787                     ; 240 }
 790  0029 84            	pop	a
 791  002a 81            	ret
 827                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 827                     ; 251 {
 828                     .text:	section	.text,new
 829  0000               _I2C_GenerateSTART:
 831  0000 88            	push	a
 832       00000000      OFST:	set	0
 835                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 837  0001 4d            	tnz	a
 838  0002 2704          	jreq	L401
 839  0004 a101          	cp	a,#1
 840  0006 2603          	jrne	L201
 841  0008               L401:
 842  0008 4f            	clr	a
 843  0009 2010          	jra	L601
 844  000b               L201:
 845  000b ae00fd        	ldw	x,#253
 846  000e 89            	pushw	x
 847  000f ae0000        	ldw	x,#0
 848  0012 89            	pushw	x
 849  0013 ae000c        	ldw	x,#L511
 850  0016 cd0000        	call	_assert_failed
 852  0019 5b04          	addw	sp,#4
 853  001b               L601:
 854                     ; 255   if (NewState != DISABLE)
 856  001b 0d01          	tnz	(OFST+1,sp)
 857  001d 2706          	jreq	L522
 858                     ; 258     I2C->CR2 |= I2C_CR2_START;
 860  001f 72105211      	bset	21009,#0
 862  0023 2004          	jra	L722
 863  0025               L522:
 864                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 866  0025 72115211      	bres	21009,#0
 867  0029               L722:
 868                     ; 265 }
 871  0029 84            	pop	a
 872  002a 81            	ret
 908                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 908                     ; 274 {
 909                     .text:	section	.text,new
 910  0000               _I2C_GenerateSTOP:
 912  0000 88            	push	a
 913       00000000      OFST:	set	0
 916                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 918  0001 4d            	tnz	a
 919  0002 2704          	jreq	L411
 920  0004 a101          	cp	a,#1
 921  0006 2603          	jrne	L211
 922  0008               L411:
 923  0008 4f            	clr	a
 924  0009 2010          	jra	L611
 925  000b               L211:
 926  000b ae0114        	ldw	x,#276
 927  000e 89            	pushw	x
 928  000f ae0000        	ldw	x,#0
 929  0012 89            	pushw	x
 930  0013 ae000c        	ldw	x,#L511
 931  0016 cd0000        	call	_assert_failed
 933  0019 5b04          	addw	sp,#4
 934  001b               L611:
 935                     ; 278   if (NewState != DISABLE)
 937  001b 0d01          	tnz	(OFST+1,sp)
 938  001d 2706          	jreq	L742
 939                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 941  001f 72125211      	bset	21009,#1
 943  0023 2004          	jra	L152
 944  0025               L742:
 945                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 947  0025 72135211      	bres	21009,#1
 948  0029               L152:
 949                     ; 288 }
 952  0029 84            	pop	a
 953  002a 81            	ret
 990                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 990                     ; 297 {
 991                     .text:	section	.text,new
 992  0000               _I2C_SoftwareResetCmd:
 994  0000 88            	push	a
 995       00000000      OFST:	set	0
 998                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1000  0001 4d            	tnz	a
1001  0002 2704          	jreq	L421
1002  0004 a101          	cp	a,#1
1003  0006 2603          	jrne	L221
1004  0008               L421:
1005  0008 4f            	clr	a
1006  0009 2010          	jra	L621
1007  000b               L221:
1008  000b ae012b        	ldw	x,#299
1009  000e 89            	pushw	x
1010  000f ae0000        	ldw	x,#0
1011  0012 89            	pushw	x
1012  0013 ae000c        	ldw	x,#L511
1013  0016 cd0000        	call	_assert_failed
1015  0019 5b04          	addw	sp,#4
1016  001b               L621:
1017                     ; 301   if (NewState != DISABLE)
1019  001b 0d01          	tnz	(OFST+1,sp)
1020  001d 2706          	jreq	L172
1021                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
1023  001f 721e5211      	bset	21009,#7
1025  0023 2004          	jra	L372
1026  0025               L172:
1027                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1029  0025 721f5211      	bres	21009,#7
1030  0029               L372:
1031                     ; 311 }
1034  0029 84            	pop	a
1035  002a 81            	ret
1072                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
1072                     ; 321 {
1073                     .text:	section	.text,new
1074  0000               _I2C_StretchClockCmd:
1076  0000 88            	push	a
1077       00000000      OFST:	set	0
1080                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1082  0001 4d            	tnz	a
1083  0002 2704          	jreq	L431
1084  0004 a101          	cp	a,#1
1085  0006 2603          	jrne	L231
1086  0008               L431:
1087  0008 4f            	clr	a
1088  0009 2010          	jra	L631
1089  000b               L231:
1090  000b ae0143        	ldw	x,#323
1091  000e 89            	pushw	x
1092  000f ae0000        	ldw	x,#0
1093  0012 89            	pushw	x
1094  0013 ae000c        	ldw	x,#L511
1095  0016 cd0000        	call	_assert_failed
1097  0019 5b04          	addw	sp,#4
1098  001b               L631:
1099                     ; 325   if (NewState != DISABLE)
1101  001b 0d01          	tnz	(OFST+1,sp)
1102  001d 2706          	jreq	L313
1103                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1105  001f 721f5210      	bres	21008,#7
1107  0023 2004          	jra	L513
1108  0025               L313:
1109                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1111  0025 721e5210      	bset	21008,#7
1112  0029               L513:
1113                     ; 336 }
1116  0029 84            	pop	a
1117  002a 81            	ret
1154                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1154                     ; 346 {
1155                     .text:	section	.text,new
1156  0000               _I2C_AcknowledgeConfig:
1158  0000 88            	push	a
1159       00000000      OFST:	set	0
1162                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
1164  0001 4d            	tnz	a
1165  0002 2708          	jreq	L441
1166  0004 a101          	cp	a,#1
1167  0006 2704          	jreq	L441
1168  0008 a102          	cp	a,#2
1169  000a 2603          	jrne	L241
1170  000c               L441:
1171  000c 4f            	clr	a
1172  000d 2010          	jra	L641
1173  000f               L241:
1174  000f ae015c        	ldw	x,#348
1175  0012 89            	pushw	x
1176  0013 ae0000        	ldw	x,#0
1177  0016 89            	pushw	x
1178  0017 ae000c        	ldw	x,#L511
1179  001a cd0000        	call	_assert_failed
1181  001d 5b04          	addw	sp,#4
1182  001f               L641:
1183                     ; 350   if (Ack == I2C_ACK_NONE)
1185  001f 0d01          	tnz	(OFST+1,sp)
1186  0021 2606          	jrne	L533
1187                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1189  0023 72155211      	bres	21009,#2
1191  0027 2014          	jra	L733
1192  0029               L533:
1193                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
1195  0029 72145211      	bset	21009,#2
1196                     ; 360     if (Ack == I2C_ACK_CURR)
1198  002d 7b01          	ld	a,(OFST+1,sp)
1199  002f a101          	cp	a,#1
1200  0031 2606          	jrne	L143
1201                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1203  0033 72175211      	bres	21009,#3
1205  0037 2004          	jra	L733
1206  0039               L143:
1207                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1209  0039 72165211      	bset	21009,#3
1210  003d               L733:
1211                     ; 371 }
1214  003d 84            	pop	a
1215  003e 81            	ret
1288                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1288                     ; 382 {
1289                     .text:	section	.text,new
1290  0000               _I2C_ITConfig:
1292  0000 89            	pushw	x
1293       00000000      OFST:	set	0
1296                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1298  0001 9e            	ld	a,xh
1299  0002 a101          	cp	a,#1
1300  0004 271e          	jreq	L451
1301  0006 9e            	ld	a,xh
1302  0007 a102          	cp	a,#2
1303  0009 2719          	jreq	L451
1304  000b 9e            	ld	a,xh
1305  000c a104          	cp	a,#4
1306  000e 2714          	jreq	L451
1307  0010 9e            	ld	a,xh
1308  0011 a103          	cp	a,#3
1309  0013 270f          	jreq	L451
1310  0015 9e            	ld	a,xh
1311  0016 a105          	cp	a,#5
1312  0018 270a          	jreq	L451
1313  001a 9e            	ld	a,xh
1314  001b a106          	cp	a,#6
1315  001d 2705          	jreq	L451
1316  001f 9e            	ld	a,xh
1317  0020 a107          	cp	a,#7
1318  0022 2603          	jrne	L251
1319  0024               L451:
1320  0024 4f            	clr	a
1321  0025 2010          	jra	L651
1322  0027               L251:
1323  0027 ae0180        	ldw	x,#384
1324  002a 89            	pushw	x
1325  002b ae0000        	ldw	x,#0
1326  002e 89            	pushw	x
1327  002f ae000c        	ldw	x,#L511
1328  0032 cd0000        	call	_assert_failed
1330  0035 5b04          	addw	sp,#4
1331  0037               L651:
1332                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1334  0037 0d02          	tnz	(OFST+2,sp)
1335  0039 2706          	jreq	L261
1336  003b 7b02          	ld	a,(OFST+2,sp)
1337  003d a101          	cp	a,#1
1338  003f 2603          	jrne	L061
1339  0041               L261:
1340  0041 4f            	clr	a
1341  0042 2010          	jra	L461
1342  0044               L061:
1343  0044 ae0181        	ldw	x,#385
1344  0047 89            	pushw	x
1345  0048 ae0000        	ldw	x,#0
1346  004b 89            	pushw	x
1347  004c ae000c        	ldw	x,#L511
1348  004f cd0000        	call	_assert_failed
1350  0052 5b04          	addw	sp,#4
1351  0054               L461:
1352                     ; 387   if (NewState != DISABLE)
1354  0054 0d02          	tnz	(OFST+2,sp)
1355  0056 270a          	jreq	L104
1356                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1358  0058 c6521a        	ld	a,21018
1359  005b 1a01          	or	a,(OFST+1,sp)
1360  005d c7521a        	ld	21018,a
1362  0060 2009          	jra	L304
1363  0062               L104:
1364                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1366  0062 7b01          	ld	a,(OFST+1,sp)
1367  0064 43            	cpl	a
1368  0065 c4521a        	and	a,21018
1369  0068 c7521a        	ld	21018,a
1370  006b               L304:
1371                     ; 397 }
1374  006b 85            	popw	x
1375  006c 81            	ret
1412                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1412                     ; 406 {
1413                     .text:	section	.text,new
1414  0000               _I2C_FastModeDutyCycleConfig:
1416  0000 88            	push	a
1417       00000000      OFST:	set	0
1420                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1422  0001 4d            	tnz	a
1423  0002 2704          	jreq	L271
1424  0004 a140          	cp	a,#64
1425  0006 2603          	jrne	L071
1426  0008               L271:
1427  0008 4f            	clr	a
1428  0009 2010          	jra	L471
1429  000b               L071:
1430  000b ae0198        	ldw	x,#408
1431  000e 89            	pushw	x
1432  000f ae0000        	ldw	x,#0
1433  0012 89            	pushw	x
1434  0013 ae000c        	ldw	x,#L511
1435  0016 cd0000        	call	_assert_failed
1437  0019 5b04          	addw	sp,#4
1438  001b               L471:
1439                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1441  001b 7b01          	ld	a,(OFST+1,sp)
1442  001d a140          	cp	a,#64
1443  001f 2606          	jrne	L324
1444                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1446  0021 721c521c      	bset	21020,#6
1448  0025 2004          	jra	L524
1449  0027               L324:
1450                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1452  0027 721d521c      	bres	21020,#6
1453  002b               L524:
1454                     ; 420 }
1457  002b 84            	pop	a
1458  002c 81            	ret
1481                     ; 427 uint8_t I2C_ReceiveData(void)
1481                     ; 428 {
1482                     .text:	section	.text,new
1483  0000               _I2C_ReceiveData:
1487                     ; 430   return ((uint8_t)I2C->DR);
1489  0000 c65216        	ld	a,21014
1492  0003 81            	ret
1556                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1556                     ; 441 {
1557                     .text:	section	.text,new
1558  0000               _I2C_Send7bitAddress:
1560  0000 89            	pushw	x
1561       00000000      OFST:	set	0
1564                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1566  0001 9e            	ld	a,xh
1567  0002 a501          	bcp	a,#1
1568  0004 2603          	jrne	L202
1569  0006 4f            	clr	a
1570  0007 2010          	jra	L402
1571  0009               L202:
1572  0009 ae01bb        	ldw	x,#443
1573  000c 89            	pushw	x
1574  000d ae0000        	ldw	x,#0
1575  0010 89            	pushw	x
1576  0011 ae000c        	ldw	x,#L511
1577  0014 cd0000        	call	_assert_failed
1579  0017 5b04          	addw	sp,#4
1580  0019               L402:
1581                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1583  0019 0d02          	tnz	(OFST+2,sp)
1584  001b 2706          	jreq	L012
1585  001d 7b02          	ld	a,(OFST+2,sp)
1586  001f a101          	cp	a,#1
1587  0021 2603          	jrne	L602
1588  0023               L012:
1589  0023 4f            	clr	a
1590  0024 2010          	jra	L212
1591  0026               L602:
1592  0026 ae01bc        	ldw	x,#444
1593  0029 89            	pushw	x
1594  002a ae0000        	ldw	x,#0
1595  002d 89            	pushw	x
1596  002e ae000c        	ldw	x,#L511
1597  0031 cd0000        	call	_assert_failed
1599  0034 5b04          	addw	sp,#4
1600  0036               L212:
1601                     ; 447   Address &= (uint8_t)0xFE;
1603  0036 7b01          	ld	a,(OFST+1,sp)
1604  0038 a4fe          	and	a,#254
1605  003a 6b01          	ld	(OFST+1,sp),a
1606                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1608  003c 7b01          	ld	a,(OFST+1,sp)
1609  003e 1a02          	or	a,(OFST+2,sp)
1610  0040 c75216        	ld	21014,a
1611                     ; 451 }
1614  0043 85            	popw	x
1615  0044 81            	ret
1647                     ; 458 void I2C_SendData(uint8_t Data)
1647                     ; 459 {
1648                     .text:	section	.text,new
1649  0000               _I2C_SendData:
1653                     ; 461   I2C->DR = Data;
1655  0000 c75216        	ld	21014,a
1656                     ; 462 }
1659  0003 81            	ret
1880                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1880                     ; 579 {
1881                     .text:	section	.text,new
1882  0000               _I2C_CheckEvent:
1884  0000 89            	pushw	x
1885  0001 5206          	subw	sp,#6
1886       00000006      OFST:	set	6
1889                     ; 580   __IO uint16_t lastevent = 0x00;
1891  0003 5f            	clrw	x
1892  0004 1f04          	ldw	(OFST-2,sp),x
1893                     ; 581   uint8_t flag1 = 0x00 ;
1895  0006 7b03          	ld	a,(OFST-3,sp)
1896  0008 97            	ld	xl,a
1897                     ; 582   uint8_t flag2 = 0x00;
1899  0009 7b06          	ld	a,(OFST+0,sp)
1900  000b 97            	ld	xl,a
1901                     ; 583   ErrorStatus status = ERROR;
1903  000c 7b06          	ld	a,(OFST+0,sp)
1904  000e 97            	ld	xl,a
1905                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1907  000f 1e07          	ldw	x,(OFST+1,sp)
1908  0011 a30682        	cpw	x,#1666
1909  0014 2769          	jreq	L222
1910  0016 1e07          	ldw	x,(OFST+1,sp)
1911  0018 a30202        	cpw	x,#514
1912  001b 2762          	jreq	L222
1913  001d 1e07          	ldw	x,(OFST+1,sp)
1914  001f a31200        	cpw	x,#4608
1915  0022 275b          	jreq	L222
1916  0024 1e07          	ldw	x,(OFST+1,sp)
1917  0026 a30240        	cpw	x,#576
1918  0029 2754          	jreq	L222
1919  002b 1e07          	ldw	x,(OFST+1,sp)
1920  002d a30350        	cpw	x,#848
1921  0030 274d          	jreq	L222
1922  0032 1e07          	ldw	x,(OFST+1,sp)
1923  0034 a30684        	cpw	x,#1668
1924  0037 2746          	jreq	L222
1925  0039 1e07          	ldw	x,(OFST+1,sp)
1926  003b a30794        	cpw	x,#1940
1927  003e 273f          	jreq	L222
1928  0040 1e07          	ldw	x,(OFST+1,sp)
1929  0042 a30004        	cpw	x,#4
1930  0045 2738          	jreq	L222
1931  0047 1e07          	ldw	x,(OFST+1,sp)
1932  0049 a30010        	cpw	x,#16
1933  004c 2731          	jreq	L222
1934  004e 1e07          	ldw	x,(OFST+1,sp)
1935  0050 a30301        	cpw	x,#769
1936  0053 272a          	jreq	L222
1937  0055 1e07          	ldw	x,(OFST+1,sp)
1938  0057 a30782        	cpw	x,#1922
1939  005a 2723          	jreq	L222
1940  005c 1e07          	ldw	x,(OFST+1,sp)
1941  005e a30302        	cpw	x,#770
1942  0061 271c          	jreq	L222
1943  0063 1e07          	ldw	x,(OFST+1,sp)
1944  0065 a30340        	cpw	x,#832
1945  0068 2715          	jreq	L222
1946  006a 1e07          	ldw	x,(OFST+1,sp)
1947  006c a30784        	cpw	x,#1924
1948  006f 270e          	jreq	L222
1949  0071 1e07          	ldw	x,(OFST+1,sp)
1950  0073 a30780        	cpw	x,#1920
1951  0076 2707          	jreq	L222
1952  0078 1e07          	ldw	x,(OFST+1,sp)
1953  007a a30308        	cpw	x,#776
1954  007d 2603          	jrne	L022
1955  007f               L222:
1956  007f 4f            	clr	a
1957  0080 2010          	jra	L422
1958  0082               L022:
1959  0082 ae024a        	ldw	x,#586
1960  0085 89            	pushw	x
1961  0086 ae0000        	ldw	x,#0
1962  0089 89            	pushw	x
1963  008a ae000c        	ldw	x,#L511
1964  008d cd0000        	call	_assert_failed
1966  0090 5b04          	addw	sp,#4
1967  0092               L422:
1968                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1970  0092 1e07          	ldw	x,(OFST+1,sp)
1971  0094 a30004        	cpw	x,#4
1972  0097 260b          	jrne	L706
1973                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1975  0099 c65218        	ld	a,21016
1976  009c a404          	and	a,#4
1977  009e 5f            	clrw	x
1978  009f 97            	ld	xl,a
1979  00a0 1f04          	ldw	(OFST-2,sp),x
1981  00a2 201f          	jra	L116
1982  00a4               L706:
1983                     ; 594     flag1 = I2C->SR1;
1985  00a4 c65217        	ld	a,21015
1986  00a7 6b03          	ld	(OFST-3,sp),a
1987                     ; 595     flag2 = I2C->SR3;
1989  00a9 c65219        	ld	a,21017
1990  00ac 6b06          	ld	(OFST+0,sp),a
1991                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1993  00ae 7b03          	ld	a,(OFST-3,sp)
1994  00b0 5f            	clrw	x
1995  00b1 97            	ld	xl,a
1996  00b2 1f01          	ldw	(OFST-5,sp),x
1997  00b4 7b06          	ld	a,(OFST+0,sp)
1998  00b6 5f            	clrw	x
1999  00b7 97            	ld	xl,a
2000  00b8 4f            	clr	a
2001  00b9 02            	rlwa	x,a
2002  00ba 01            	rrwa	x,a
2003  00bb 1a02          	or	a,(OFST-4,sp)
2004  00bd 01            	rrwa	x,a
2005  00be 1a01          	or	a,(OFST-5,sp)
2006  00c0 01            	rrwa	x,a
2007  00c1 1f04          	ldw	(OFST-2,sp),x
2008  00c3               L116:
2009                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2011  00c3 1e04          	ldw	x,(OFST-2,sp)
2012  00c5 01            	rrwa	x,a
2013  00c6 1408          	and	a,(OFST+2,sp)
2014  00c8 01            	rrwa	x,a
2015  00c9 1407          	and	a,(OFST+1,sp)
2016  00cb 01            	rrwa	x,a
2017  00cc 1307          	cpw	x,(OFST+1,sp)
2018  00ce 2606          	jrne	L316
2019                     ; 602     status = SUCCESS;
2021  00d0 a601          	ld	a,#1
2022  00d2 6b06          	ld	(OFST+0,sp),a
2024  00d4 2002          	jra	L516
2025  00d6               L316:
2026                     ; 607     status = ERROR;
2028  00d6 0f06          	clr	(OFST+0,sp)
2029  00d8               L516:
2030                     ; 611   return status;
2032  00d8 7b06          	ld	a,(OFST+0,sp)
2035  00da 5b08          	addw	sp,#8
2036  00dc 81            	ret
2085                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
2085                     ; 629 {
2086                     .text:	section	.text,new
2087  0000               _I2C_GetLastEvent:
2089  0000 5206          	subw	sp,#6
2090       00000006      OFST:	set	6
2093                     ; 630   __IO uint16_t lastevent = 0;
2095  0002 5f            	clrw	x
2096  0003 1f05          	ldw	(OFST-1,sp),x
2097                     ; 631   uint16_t flag1 = 0;
2099  0005 1e01          	ldw	x,(OFST-5,sp)
2100                     ; 632   uint16_t flag2 = 0;
2102  0007 1e03          	ldw	x,(OFST-3,sp)
2103                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2105  0009 c65218        	ld	a,21016
2106  000c a504          	bcp	a,#4
2107  000e 2707          	jreq	L146
2108                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2110  0010 ae0004        	ldw	x,#4
2111  0013 1f05          	ldw	(OFST-1,sp),x
2113  0015 201b          	jra	L346
2114  0017               L146:
2115                     ; 641     flag1 = I2C->SR1;
2117  0017 c65217        	ld	a,21015
2118  001a 5f            	clrw	x
2119  001b 97            	ld	xl,a
2120  001c 1f01          	ldw	(OFST-5,sp),x
2121                     ; 642     flag2 = I2C->SR3;
2123  001e c65219        	ld	a,21017
2124  0021 5f            	clrw	x
2125  0022 97            	ld	xl,a
2126  0023 1f03          	ldw	(OFST-3,sp),x
2127                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2129  0025 1e03          	ldw	x,(OFST-3,sp)
2130  0027 4f            	clr	a
2131  0028 02            	rlwa	x,a
2132  0029 01            	rrwa	x,a
2133  002a 1a02          	or	a,(OFST-4,sp)
2134  002c 01            	rrwa	x,a
2135  002d 1a01          	or	a,(OFST-5,sp)
2136  002f 01            	rrwa	x,a
2137  0030 1f05          	ldw	(OFST-1,sp),x
2138  0032               L346:
2139                     ; 648   return (I2C_Event_TypeDef)lastevent;
2141  0032 1e05          	ldw	x,(OFST-1,sp)
2144  0034 5b06          	addw	sp,#6
2145  0036 81            	ret
2357                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2357                     ; 680 {
2358                     .text:	section	.text,new
2359  0000               _I2C_GetFlagStatus:
2361  0000 89            	pushw	x
2362  0001 89            	pushw	x
2363       00000002      OFST:	set	2
2366                     ; 681   uint8_t tempreg = 0;
2368  0002 0f02          	clr	(OFST+0,sp)
2369                     ; 682   uint8_t regindex = 0;
2371  0004 7b01          	ld	a,(OFST-1,sp)
2372  0006 97            	ld	xl,a
2373                     ; 683   FlagStatus bitstatus = RESET;
2375  0007 7b02          	ld	a,(OFST+0,sp)
2376  0009 97            	ld	xl,a
2377                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2379  000a 1e03          	ldw	x,(OFST+1,sp)
2380  000c a30180        	cpw	x,#384
2381  000f 2769          	jreq	L432
2382  0011 1e03          	ldw	x,(OFST+1,sp)
2383  0013 a30140        	cpw	x,#320
2384  0016 2762          	jreq	L432
2385  0018 1e03          	ldw	x,(OFST+1,sp)
2386  001a a30110        	cpw	x,#272
2387  001d 275b          	jreq	L432
2388  001f 1e03          	ldw	x,(OFST+1,sp)
2389  0021 a30108        	cpw	x,#264
2390  0024 2754          	jreq	L432
2391  0026 1e03          	ldw	x,(OFST+1,sp)
2392  0028 a30104        	cpw	x,#260
2393  002b 274d          	jreq	L432
2394  002d 1e03          	ldw	x,(OFST+1,sp)
2395  002f a30102        	cpw	x,#258
2396  0032 2746          	jreq	L432
2397  0034 1e03          	ldw	x,(OFST+1,sp)
2398  0036 a30101        	cpw	x,#257
2399  0039 273f          	jreq	L432
2400  003b 1e03          	ldw	x,(OFST+1,sp)
2401  003d a30220        	cpw	x,#544
2402  0040 2738          	jreq	L432
2403  0042 1e03          	ldw	x,(OFST+1,sp)
2404  0044 a30208        	cpw	x,#520
2405  0047 2731          	jreq	L432
2406  0049 1e03          	ldw	x,(OFST+1,sp)
2407  004b a30204        	cpw	x,#516
2408  004e 272a          	jreq	L432
2409  0050 1e03          	ldw	x,(OFST+1,sp)
2410  0052 a30202        	cpw	x,#514
2411  0055 2723          	jreq	L432
2412  0057 1e03          	ldw	x,(OFST+1,sp)
2413  0059 a30201        	cpw	x,#513
2414  005c 271c          	jreq	L432
2415  005e 1e03          	ldw	x,(OFST+1,sp)
2416  0060 a30310        	cpw	x,#784
2417  0063 2715          	jreq	L432
2418  0065 1e03          	ldw	x,(OFST+1,sp)
2419  0067 a30304        	cpw	x,#772
2420  006a 270e          	jreq	L432
2421  006c 1e03          	ldw	x,(OFST+1,sp)
2422  006e a30302        	cpw	x,#770
2423  0071 2707          	jreq	L432
2424  0073 1e03          	ldw	x,(OFST+1,sp)
2425  0075 a30301        	cpw	x,#769
2426  0078 2603          	jrne	L232
2427  007a               L432:
2428  007a 4f            	clr	a
2429  007b 2010          	jra	L632
2430  007d               L232:
2431  007d ae02ae        	ldw	x,#686
2432  0080 89            	pushw	x
2433  0081 ae0000        	ldw	x,#0
2434  0084 89            	pushw	x
2435  0085 ae000c        	ldw	x,#L511
2436  0088 cd0000        	call	_assert_failed
2438  008b 5b04          	addw	sp,#4
2439  008d               L632:
2440                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2442  008d 7b03          	ld	a,(OFST+1,sp)
2443  008f 6b01          	ld	(OFST-1,sp),a
2444                     ; 691   switch (regindex)
2446  0091 7b01          	ld	a,(OFST-1,sp)
2448                     ; 708     default:
2448                     ; 709       break;
2449  0093 4a            	dec	a
2450  0094 2708          	jreq	L546
2451  0096 4a            	dec	a
2452  0097 270c          	jreq	L746
2453  0099 4a            	dec	a
2454  009a 2710          	jreq	L156
2455  009c 2013          	jra	L167
2456  009e               L546:
2457                     ; 694     case 0x01:
2457                     ; 695       tempreg = (uint8_t)I2C->SR1;
2459  009e c65217        	ld	a,21015
2460  00a1 6b02          	ld	(OFST+0,sp),a
2461                     ; 696       break;
2463  00a3 200c          	jra	L167
2464  00a5               L746:
2465                     ; 699     case 0x02:
2465                     ; 700       tempreg = (uint8_t)I2C->SR2;
2467  00a5 c65218        	ld	a,21016
2468  00a8 6b02          	ld	(OFST+0,sp),a
2469                     ; 701       break;
2471  00aa 2005          	jra	L167
2472  00ac               L156:
2473                     ; 704     case 0x03:
2473                     ; 705       tempreg = (uint8_t)I2C->SR3;
2475  00ac c65219        	ld	a,21017
2476  00af 6b02          	ld	(OFST+0,sp),a
2477                     ; 706       break;
2479  00b1               L356:
2480                     ; 708     default:
2480                     ; 709       break;
2482  00b1               L167:
2483                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2485  00b1 7b04          	ld	a,(OFST+2,sp)
2486  00b3 1502          	bcp	a,(OFST+0,sp)
2487  00b5 2706          	jreq	L367
2488                     ; 716     bitstatus = SET;
2490  00b7 a601          	ld	a,#1
2491  00b9 6b02          	ld	(OFST+0,sp),a
2493  00bb 2002          	jra	L567
2494  00bd               L367:
2495                     ; 721     bitstatus = RESET;
2497  00bd 0f02          	clr	(OFST+0,sp)
2498  00bf               L567:
2499                     ; 724   return bitstatus;
2501  00bf 7b02          	ld	a,(OFST+0,sp)
2504  00c1 5b04          	addw	sp,#4
2505  00c3 81            	ret
2548                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2548                     ; 760 {
2549                     .text:	section	.text,new
2550  0000               _I2C_ClearFlag:
2552  0000 89            	pushw	x
2553  0001 89            	pushw	x
2554       00000002      OFST:	set	2
2557                     ; 761   uint16_t flagpos = 0;
2559  0002 5f            	clrw	x
2560  0003 1f01          	ldw	(OFST-1,sp),x
2561                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2563  0005 7b03          	ld	a,(OFST+1,sp)
2564  0007 a5fd          	bcp	a,#253
2565  0009 2607          	jrne	L242
2566  000b 1e03          	ldw	x,(OFST+1,sp)
2567  000d 2703          	jreq	L242
2568  000f 4f            	clr	a
2569  0010 2010          	jra	L442
2570  0012               L242:
2571  0012 ae02fb        	ldw	x,#763
2572  0015 89            	pushw	x
2573  0016 ae0000        	ldw	x,#0
2574  0019 89            	pushw	x
2575  001a ae000c        	ldw	x,#L511
2576  001d cd0000        	call	_assert_failed
2578  0020 5b04          	addw	sp,#4
2579  0022               L442:
2580                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2582  0022 7b03          	ld	a,(OFST+1,sp)
2583  0024 97            	ld	xl,a
2584  0025 7b04          	ld	a,(OFST+2,sp)
2585  0027 a4ff          	and	a,#255
2586  0029 5f            	clrw	x
2587  002a 02            	rlwa	x,a
2588  002b 1f01          	ldw	(OFST-1,sp),x
2589  002d 01            	rrwa	x,a
2590                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2592  002e 7b02          	ld	a,(OFST+0,sp)
2593  0030 43            	cpl	a
2594  0031 c75218        	ld	21016,a
2595                     ; 769 }
2598  0034 5b04          	addw	sp,#4
2599  0036 81            	ret
2764                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2764                     ; 792 {
2765                     .text:	section	.text,new
2766  0000               _I2C_GetITStatus:
2768  0000 89            	pushw	x
2769  0001 5204          	subw	sp,#4
2770       00000004      OFST:	set	4
2773                     ; 793   ITStatus bitstatus = RESET;
2775  0003 7b04          	ld	a,(OFST+0,sp)
2776  0005 97            	ld	xl,a
2777                     ; 794   __IO uint8_t enablestatus = 0;
2779  0006 0f03          	clr	(OFST-1,sp)
2780                     ; 795   uint16_t tempregister = 0;
2782  0008 1e01          	ldw	x,(OFST-3,sp)
2783                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2785  000a 1e05          	ldw	x,(OFST+1,sp)
2786  000c a31680        	cpw	x,#5760
2787  000f 274d          	jreq	L252
2788  0011 1e05          	ldw	x,(OFST+1,sp)
2789  0013 a31640        	cpw	x,#5696
2790  0016 2746          	jreq	L252
2791  0018 1e05          	ldw	x,(OFST+1,sp)
2792  001a a31210        	cpw	x,#4624
2793  001d 273f          	jreq	L252
2794  001f 1e05          	ldw	x,(OFST+1,sp)
2795  0021 a31208        	cpw	x,#4616
2796  0024 2738          	jreq	L252
2797  0026 1e05          	ldw	x,(OFST+1,sp)
2798  0028 a31204        	cpw	x,#4612
2799  002b 2731          	jreq	L252
2800  002d 1e05          	ldw	x,(OFST+1,sp)
2801  002f a31202        	cpw	x,#4610
2802  0032 272a          	jreq	L252
2803  0034 1e05          	ldw	x,(OFST+1,sp)
2804  0036 a31201        	cpw	x,#4609
2805  0039 2723          	jreq	L252
2806  003b 1e05          	ldw	x,(OFST+1,sp)
2807  003d a32220        	cpw	x,#8736
2808  0040 271c          	jreq	L252
2809  0042 1e05          	ldw	x,(OFST+1,sp)
2810  0044 a32108        	cpw	x,#8456
2811  0047 2715          	jreq	L252
2812  0049 1e05          	ldw	x,(OFST+1,sp)
2813  004b a32104        	cpw	x,#8452
2814  004e 270e          	jreq	L252
2815  0050 1e05          	ldw	x,(OFST+1,sp)
2816  0052 a32102        	cpw	x,#8450
2817  0055 2707          	jreq	L252
2818  0057 1e05          	ldw	x,(OFST+1,sp)
2819  0059 a32101        	cpw	x,#8449
2820  005c 2603          	jrne	L052
2821  005e               L252:
2822  005e 4f            	clr	a
2823  005f 2010          	jra	L452
2824  0061               L052:
2825  0061 ae031e        	ldw	x,#798
2826  0064 89            	pushw	x
2827  0065 ae0000        	ldw	x,#0
2828  0068 89            	pushw	x
2829  0069 ae000c        	ldw	x,#L511
2830  006c cd0000        	call	_assert_failed
2832  006f 5b04          	addw	sp,#4
2833  0071               L452:
2834                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2836  0071 7b05          	ld	a,(OFST+1,sp)
2837  0073 97            	ld	xl,a
2838  0074 7b06          	ld	a,(OFST+2,sp)
2839  0076 9f            	ld	a,xl
2840  0077 a407          	and	a,#7
2841  0079 97            	ld	xl,a
2842  007a 4f            	clr	a
2843  007b 02            	rlwa	x,a
2844  007c 4f            	clr	a
2845  007d 01            	rrwa	x,a
2846  007e 9f            	ld	a,xl
2847  007f 5f            	clrw	x
2848  0080 97            	ld	xl,a
2849  0081 1f01          	ldw	(OFST-3,sp),x
2850                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2852  0083 c6521a        	ld	a,21018
2853  0086 1402          	and	a,(OFST-2,sp)
2854  0088 6b03          	ld	(OFST-1,sp),a
2855                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2857  008a 7b05          	ld	a,(OFST+1,sp)
2858  008c 97            	ld	xl,a
2859  008d 7b06          	ld	a,(OFST+2,sp)
2860  008f 9f            	ld	a,xl
2861  0090 a430          	and	a,#48
2862  0092 97            	ld	xl,a
2863  0093 4f            	clr	a
2864  0094 02            	rlwa	x,a
2865  0095 a30100        	cpw	x,#256
2866  0098 2615          	jrne	L3701
2867                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2869  009a c65217        	ld	a,21015
2870  009d 1506          	bcp	a,(OFST+2,sp)
2871  009f 270a          	jreq	L5701
2873  00a1 0d03          	tnz	(OFST-1,sp)
2874  00a3 2706          	jreq	L5701
2875                     ; 811       bitstatus = SET;
2877  00a5 a601          	ld	a,#1
2878  00a7 6b04          	ld	(OFST+0,sp),a
2880  00a9 2017          	jra	L1011
2881  00ab               L5701:
2882                     ; 816       bitstatus = RESET;
2884  00ab 0f04          	clr	(OFST+0,sp)
2885  00ad 2013          	jra	L1011
2886  00af               L3701:
2887                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2889  00af c65218        	ld	a,21016
2890  00b2 1506          	bcp	a,(OFST+2,sp)
2891  00b4 270a          	jreq	L3011
2893  00b6 0d03          	tnz	(OFST-1,sp)
2894  00b8 2706          	jreq	L3011
2895                     ; 825       bitstatus = SET;
2897  00ba a601          	ld	a,#1
2898  00bc 6b04          	ld	(OFST+0,sp),a
2900  00be 2002          	jra	L1011
2901  00c0               L3011:
2902                     ; 830       bitstatus = RESET;
2904  00c0 0f04          	clr	(OFST+0,sp)
2905  00c2               L1011:
2906                     ; 834   return  bitstatus;
2908  00c2 7b04          	ld	a,(OFST+0,sp)
2911  00c4 5b06          	addw	sp,#6
2912  00c6 81            	ret
2956                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2956                     ; 872 {
2957                     .text:	section	.text,new
2958  0000               _I2C_ClearITPendingBit:
2960  0000 89            	pushw	x
2961  0001 89            	pushw	x
2962       00000002      OFST:	set	2
2965                     ; 873   uint16_t flagpos = 0;
2967  0002 5f            	clrw	x
2968  0003 1f01          	ldw	(OFST-1,sp),x
2969                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2971  0005 1e03          	ldw	x,(OFST+1,sp)
2972  0007 a32220        	cpw	x,#8736
2973  000a 271c          	jreq	L262
2974  000c 1e03          	ldw	x,(OFST+1,sp)
2975  000e a32108        	cpw	x,#8456
2976  0011 2715          	jreq	L262
2977  0013 1e03          	ldw	x,(OFST+1,sp)
2978  0015 a32104        	cpw	x,#8452
2979  0018 270e          	jreq	L262
2980  001a 1e03          	ldw	x,(OFST+1,sp)
2981  001c a32102        	cpw	x,#8450
2982  001f 2707          	jreq	L262
2983  0021 1e03          	ldw	x,(OFST+1,sp)
2984  0023 a32101        	cpw	x,#8449
2985  0026 2603          	jrne	L062
2986  0028               L262:
2987  0028 4f            	clr	a
2988  0029 2010          	jra	L462
2989  002b               L062:
2990  002b ae036c        	ldw	x,#876
2991  002e 89            	pushw	x
2992  002f ae0000        	ldw	x,#0
2993  0032 89            	pushw	x
2994  0033 ae000c        	ldw	x,#L511
2995  0036 cd0000        	call	_assert_failed
2997  0039 5b04          	addw	sp,#4
2998  003b               L462:
2999                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
3001  003b 7b03          	ld	a,(OFST+1,sp)
3002  003d 97            	ld	xl,a
3003  003e 7b04          	ld	a,(OFST+2,sp)
3004  0040 a4ff          	and	a,#255
3005  0042 5f            	clrw	x
3006  0043 02            	rlwa	x,a
3007  0044 1f01          	ldw	(OFST-1,sp),x
3008  0046 01            	rrwa	x,a
3009                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3011  0047 7b02          	ld	a,(OFST+0,sp)
3012  0049 43            	cpl	a
3013  004a c75218        	ld	21016,a
3014                     ; 883 }
3017  004d 5b04          	addw	sp,#4
3018  004f 81            	ret
3031                     	xdef	_I2C_ClearITPendingBit
3032                     	xdef	_I2C_GetITStatus
3033                     	xdef	_I2C_ClearFlag
3034                     	xdef	_I2C_GetFlagStatus
3035                     	xdef	_I2C_GetLastEvent
3036                     	xdef	_I2C_CheckEvent
3037                     	xdef	_I2C_SendData
3038                     	xdef	_I2C_Send7bitAddress
3039                     	xdef	_I2C_ReceiveData
3040                     	xdef	_I2C_ITConfig
3041                     	xdef	_I2C_FastModeDutyCycleConfig
3042                     	xdef	_I2C_AcknowledgeConfig
3043                     	xdef	_I2C_StretchClockCmd
3044                     	xdef	_I2C_SoftwareResetCmd
3045                     	xdef	_I2C_GenerateSTOP
3046                     	xdef	_I2C_GenerateSTART
3047                     	xdef	_I2C_GeneralCallCmd
3048                     	xdef	_I2C_Cmd
3049                     	xdef	_I2C_Init
3050                     	xdef	_I2C_DeInit
3051                     	xref	_assert_failed
3052                     	switch	.const
3053  000c               L511:
3054  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3055  001e 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3056  0030 72697665725c  	dc.b	"river\src\stm8s_i2"
3057  0042 632e6300      	dc.b	"c.c",0
3058                     	xref.b	c_lreg
3078                     	xref	c_sdivx
3079                     	xref	c_ludv
3080                     	xref	c_rtol
3081                     	xref	c_smul
3082                     	xref	c_lmul
3083                     	xref	c_lcmp
3084                     	xref	c_ltor
3085                     	xref	c_lzmp
3086                     	end
