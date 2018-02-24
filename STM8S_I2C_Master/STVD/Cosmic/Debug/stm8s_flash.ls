   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  65                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  65                     ; 88 {
  67                     .text:	section	.text,new
  68  0000               _FLASH_Unlock:
  70  0000 88            	push	a
  71       00000000      OFST:	set	0
  74                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  76  0001 a1fd          	cp	a,#253
  77  0003 2704          	jreq	L01
  78  0005 a1f7          	cp	a,#247
  79  0007 2603          	jrne	L6
  80  0009               L01:
  81  0009 4f            	clr	a
  82  000a 2010          	jra	L21
  83  000c               L6:
  84  000c ae005a        	ldw	x,#90
  85  000f 89            	pushw	x
  86  0010 ae0000        	ldw	x,#0
  87  0013 89            	pushw	x
  88  0014 ae0010        	ldw	x,#L73
  89  0017 cd0000        	call	_assert_failed
  91  001a 5b04          	addw	sp,#4
  92  001c               L21:
  93                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  95  001c 7b01          	ld	a,(OFST+1,sp)
  96  001e a1fd          	cp	a,#253
  97  0020 260a          	jrne	L14
  98                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
 100  0022 35565062      	mov	20578,#86
 101                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
 103  0026 35ae5062      	mov	20578,#174
 105  002a 2008          	jra	L34
 106  002c               L14:
 107                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 109  002c 35ae5064      	mov	20580,#174
 110                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
 112  0030 35565064      	mov	20580,#86
 113  0034               L34:
 114                     ; 104 }
 117  0034 84            	pop	a
 118  0035 81            	ret
 154                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 154                     ; 113 {
 155                     .text:	section	.text,new
 156  0000               _FLASH_Lock:
 158  0000 88            	push	a
 159       00000000      OFST:	set	0
 162                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 164  0001 a1fd          	cp	a,#253
 165  0003 2704          	jreq	L02
 166  0005 a1f7          	cp	a,#247
 167  0007 2603          	jrne	L61
 168  0009               L02:
 169  0009 4f            	clr	a
 170  000a 2010          	jra	L22
 171  000c               L61:
 172  000c ae0073        	ldw	x,#115
 173  000f 89            	pushw	x
 174  0010 ae0000        	ldw	x,#0
 175  0013 89            	pushw	x
 176  0014 ae0010        	ldw	x,#L73
 177  0017 cd0000        	call	_assert_failed
 179  001a 5b04          	addw	sp,#4
 180  001c               L22:
 181                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 183  001c c6505f        	ld	a,20575
 184  001f 1401          	and	a,(OFST+1,sp)
 185  0021 c7505f        	ld	20575,a
 186                     ; 119 }
 189  0024 84            	pop	a
 190  0025 81            	ret
 213                     ; 126 void FLASH_DeInit(void)
 213                     ; 127 {
 214                     .text:	section	.text,new
 215  0000               _FLASH_DeInit:
 219                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 221  0000 725f505a      	clr	20570
 222                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 224  0004 725f505b      	clr	20571
 225                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 227  0008 35ff505c      	mov	20572,#255
 228                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 230  000c 7217505f      	bres	20575,#3
 231                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 233  0010 7213505f      	bres	20575,#1
 234                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 236  0014 c6505f        	ld	a,20575
 237  0017 97            	ld	xl,a
 238                     ; 134 }
 241  0018 81            	ret
 297                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
 297                     ; 143 {
 298                     .text:	section	.text,new
 299  0000               _FLASH_ITConfig:
 301  0000 88            	push	a
 302       00000000      OFST:	set	0
 305                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 307  0001 4d            	tnz	a
 308  0002 2704          	jreq	L23
 309  0004 a101          	cp	a,#1
 310  0006 2603          	jrne	L03
 311  0008               L23:
 312  0008 4f            	clr	a
 313  0009 2010          	jra	L43
 314  000b               L03:
 315  000b ae0091        	ldw	x,#145
 316  000e 89            	pushw	x
 317  000f ae0000        	ldw	x,#0
 318  0012 89            	pushw	x
 319  0013 ae0010        	ldw	x,#L73
 320  0016 cd0000        	call	_assert_failed
 322  0019 5b04          	addw	sp,#4
 323  001b               L43:
 324                     ; 147   if(NewState != DISABLE)
 326  001b 0d01          	tnz	(OFST+1,sp)
 327  001d 2706          	jreq	L121
 328                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 330  001f 7212505a      	bset	20570,#1
 332  0023 2004          	jra	L321
 333  0025               L121:
 334                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 336  0025 7213505a      	bres	20570,#1
 337  0029               L321:
 338                     ; 155 }
 341  0029 84            	pop	a
 342  002a 81            	ret
 375                     .const:	section	.text
 376  0000               L64:
 377  0000 00008000      	dc.l	32768
 378  0004               L05:
 379  0004 00028000      	dc.l	163840
 380  0008               L25:
 381  0008 00004000      	dc.l	16384
 382  000c               L45:
 383  000c 00004800      	dc.l	18432
 384                     ; 164 void FLASH_EraseByte(uint32_t Address)
 384                     ; 165 {
 385                     .text:	section	.text,new
 386  0000               _FLASH_EraseByte:
 388       00000000      OFST:	set	0
 391                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
 393  0000 96            	ldw	x,sp
 394  0001 1c0003        	addw	x,#OFST+3
 395  0004 cd0000        	call	c_ltor
 397  0007 ae0000        	ldw	x,#L64
 398  000a cd0000        	call	c_lcmp
 400  000d 250f          	jrult	L44
 401  000f 96            	ldw	x,sp
 402  0010 1c0003        	addw	x,#OFST+3
 403  0013 cd0000        	call	c_ltor
 405  0016 ae0004        	ldw	x,#L05
 406  0019 cd0000        	call	c_lcmp
 408  001c 251e          	jrult	L24
 409  001e               L44:
 410  001e 96            	ldw	x,sp
 411  001f 1c0003        	addw	x,#OFST+3
 412  0022 cd0000        	call	c_ltor
 414  0025 ae0008        	ldw	x,#L25
 415  0028 cd0000        	call	c_lcmp
 417  002b 2512          	jrult	L04
 418  002d 96            	ldw	x,sp
 419  002e 1c0003        	addw	x,#OFST+3
 420  0031 cd0000        	call	c_ltor
 422  0034 ae000c        	ldw	x,#L45
 423  0037 cd0000        	call	c_lcmp
 425  003a 2403          	jruge	L04
 426  003c               L24:
 427  003c 4f            	clr	a
 428  003d 2010          	jra	L65
 429  003f               L04:
 430  003f ae00a7        	ldw	x,#167
 431  0042 89            	pushw	x
 432  0043 ae0000        	ldw	x,#0
 433  0046 89            	pushw	x
 434  0047 ae0010        	ldw	x,#L73
 435  004a cd0000        	call	_assert_failed
 437  004d 5b04          	addw	sp,#4
 438  004f               L65:
 439                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
 441  004f 7b04          	ld	a,(OFST+4,sp)
 442  0051 b700          	ld	c_x,a
 443  0053 1e05          	ldw	x,(OFST+5,sp)
 444  0055 bf01          	ldw	c_x+1,x
 445  0057 4f            	clr	a
 446  0058 92bd0000      	ldf	[c_x.e],a
 447                     ; 171 }
 450  005c 81            	ret
 490                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 490                     ; 182 {
 491                     .text:	section	.text,new
 492  0000               _FLASH_ProgramByte:
 494       00000000      OFST:	set	0
 497                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 499  0000 96            	ldw	x,sp
 500  0001 1c0003        	addw	x,#OFST+3
 501  0004 cd0000        	call	c_ltor
 503  0007 ae0000        	ldw	x,#L64
 504  000a cd0000        	call	c_lcmp
 506  000d 250f          	jrult	L66
 507  000f 96            	ldw	x,sp
 508  0010 1c0003        	addw	x,#OFST+3
 509  0013 cd0000        	call	c_ltor
 511  0016 ae0004        	ldw	x,#L05
 512  0019 cd0000        	call	c_lcmp
 514  001c 251e          	jrult	L46
 515  001e               L66:
 516  001e 96            	ldw	x,sp
 517  001f 1c0003        	addw	x,#OFST+3
 518  0022 cd0000        	call	c_ltor
 520  0025 ae0008        	ldw	x,#L25
 521  0028 cd0000        	call	c_lcmp
 523  002b 2512          	jrult	L26
 524  002d 96            	ldw	x,sp
 525  002e 1c0003        	addw	x,#OFST+3
 526  0031 cd0000        	call	c_ltor
 528  0034 ae000c        	ldw	x,#L45
 529  0037 cd0000        	call	c_lcmp
 531  003a 2403          	jruge	L26
 532  003c               L46:
 533  003c 4f            	clr	a
 534  003d 2010          	jra	L07
 535  003f               L26:
 536  003f ae00b8        	ldw	x,#184
 537  0042 89            	pushw	x
 538  0043 ae0000        	ldw	x,#0
 539  0046 89            	pushw	x
 540  0047 ae0010        	ldw	x,#L73
 541  004a cd0000        	call	_assert_failed
 543  004d 5b04          	addw	sp,#4
 544  004f               L07:
 545                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 547  004f 7b07          	ld	a,(OFST+7,sp)
 548  0051 88            	push	a
 549  0052 7b05          	ld	a,(OFST+5,sp)
 550  0054 b700          	ld	c_x,a
 551  0056 1e06          	ldw	x,(OFST+6,sp)
 552  0058 84            	pop	a
 553  0059 bf01          	ldw	c_x+1,x
 554  005b 92bd0000      	ldf	[c_x.e],a
 555                     ; 186 }
 558  005f 81            	ret
 591                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 591                     ; 196 {
 592                     .text:	section	.text,new
 593  0000               _FLASH_ReadByte:
 595       00000000      OFST:	set	0
 598                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 600  0000 96            	ldw	x,sp
 601  0001 1c0003        	addw	x,#OFST+3
 602  0004 cd0000        	call	c_ltor
 604  0007 ae0000        	ldw	x,#L64
 605  000a cd0000        	call	c_lcmp
 607  000d 250f          	jrult	L001
 608  000f 96            	ldw	x,sp
 609  0010 1c0003        	addw	x,#OFST+3
 610  0013 cd0000        	call	c_ltor
 612  0016 ae0004        	ldw	x,#L05
 613  0019 cd0000        	call	c_lcmp
 615  001c 251e          	jrult	L67
 616  001e               L001:
 617  001e 96            	ldw	x,sp
 618  001f 1c0003        	addw	x,#OFST+3
 619  0022 cd0000        	call	c_ltor
 621  0025 ae0008        	ldw	x,#L25
 622  0028 cd0000        	call	c_lcmp
 624  002b 2512          	jrult	L47
 625  002d 96            	ldw	x,sp
 626  002e 1c0003        	addw	x,#OFST+3
 627  0031 cd0000        	call	c_ltor
 629  0034 ae000c        	ldw	x,#L45
 630  0037 cd0000        	call	c_lcmp
 632  003a 2403          	jruge	L47
 633  003c               L67:
 634  003c 4f            	clr	a
 635  003d 2010          	jra	L201
 636  003f               L47:
 637  003f ae00c6        	ldw	x,#198
 638  0042 89            	pushw	x
 639  0043 ae0000        	ldw	x,#0
 640  0046 89            	pushw	x
 641  0047 ae0010        	ldw	x,#L73
 642  004a cd0000        	call	_assert_failed
 644  004d 5b04          	addw	sp,#4
 645  004f               L201:
 646                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 648  004f 7b04          	ld	a,(OFST+4,sp)
 649  0051 b700          	ld	c_x,a
 650  0053 1e05          	ldw	x,(OFST+5,sp)
 651  0055 bf01          	ldw	c_x+1,x
 652  0057 92bc0000      	ldf	a,[c_x.e]
 655  005b 81            	ret
 695                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 695                     ; 213 {
 696                     .text:	section	.text,new
 697  0000               _FLASH_ProgramWord:
 699       00000000      OFST:	set	0
 702                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 704  0000 96            	ldw	x,sp
 705  0001 1c0003        	addw	x,#OFST+3
 706  0004 cd0000        	call	c_ltor
 708  0007 ae0000        	ldw	x,#L64
 709  000a cd0000        	call	c_lcmp
 711  000d 250f          	jrult	L211
 712  000f 96            	ldw	x,sp
 713  0010 1c0003        	addw	x,#OFST+3
 714  0013 cd0000        	call	c_ltor
 716  0016 ae0004        	ldw	x,#L05
 717  0019 cd0000        	call	c_lcmp
 719  001c 251e          	jrult	L011
 720  001e               L211:
 721  001e 96            	ldw	x,sp
 722  001f 1c0003        	addw	x,#OFST+3
 723  0022 cd0000        	call	c_ltor
 725  0025 ae0008        	ldw	x,#L25
 726  0028 cd0000        	call	c_lcmp
 728  002b 2512          	jrult	L601
 729  002d 96            	ldw	x,sp
 730  002e 1c0003        	addw	x,#OFST+3
 731  0031 cd0000        	call	c_ltor
 733  0034 ae000c        	ldw	x,#L45
 734  0037 cd0000        	call	c_lcmp
 736  003a 2403          	jruge	L601
 737  003c               L011:
 738  003c 4f            	clr	a
 739  003d 2010          	jra	L411
 740  003f               L601:
 741  003f ae00d7        	ldw	x,#215
 742  0042 89            	pushw	x
 743  0043 ae0000        	ldw	x,#0
 744  0046 89            	pushw	x
 745  0047 ae0010        	ldw	x,#L73
 746  004a cd0000        	call	_assert_failed
 748  004d 5b04          	addw	sp,#4
 749  004f               L411:
 750                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 752  004f 721c505b      	bset	20571,#6
 753                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 755  0053 721d505c      	bres	20572,#6
 756                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 758  0057 7b07          	ld	a,(OFST+7,sp)
 759  0059 88            	push	a
 760  005a 7b05          	ld	a,(OFST+5,sp)
 761  005c b700          	ld	c_x,a
 762  005e 1e06          	ldw	x,(OFST+6,sp)
 763  0060 84            	pop	a
 764  0061 bf01          	ldw	c_x+1,x
 765  0063 92bd0000      	ldf	[c_x.e],a
 766                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 768  0067 7b08          	ld	a,(OFST+8,sp)
 769  0069 88            	push	a
 770  006a 7b05          	ld	a,(OFST+5,sp)
 771  006c b700          	ld	c_x,a
 772  006e 1e06          	ldw	x,(OFST+6,sp)
 773  0070 84            	pop	a
 774  0071 90ae0001      	ldw	y,#1
 775  0075 bf01          	ldw	c_x+1,x
 776  0077 93            	ldw	x,y
 777  0078 92a70000      	ldf	([c_x.e],x),a
 778                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 780  007c 7b09          	ld	a,(OFST+9,sp)
 781  007e 88            	push	a
 782  007f 7b05          	ld	a,(OFST+5,sp)
 783  0081 b700          	ld	c_x,a
 784  0083 1e06          	ldw	x,(OFST+6,sp)
 785  0085 84            	pop	a
 786  0086 90ae0002      	ldw	y,#2
 787  008a bf01          	ldw	c_x+1,x
 788  008c 93            	ldw	x,y
 789  008d 92a70000      	ldf	([c_x.e],x),a
 790                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 792  0091 7b0a          	ld	a,(OFST+10,sp)
 793  0093 88            	push	a
 794  0094 7b05          	ld	a,(OFST+5,sp)
 795  0096 b700          	ld	c_x,a
 796  0098 1e06          	ldw	x,(OFST+6,sp)
 797  009a 84            	pop	a
 798  009b 90ae0003      	ldw	y,#3
 799  009f bf01          	ldw	c_x+1,x
 800  00a1 93            	ldw	x,y
 801  00a2 92a70000      	ldf	([c_x.e],x),a
 802                     ; 229 }
 805  00a6 81            	ret
 847                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 847                     ; 238 {
 848                     .text:	section	.text,new
 849  0000               _FLASH_ProgramOptionByte:
 851  0000 89            	pushw	x
 852       00000000      OFST:	set	0
 855                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 857  0001 a34800        	cpw	x,#18432
 858  0004 2508          	jrult	L021
 859  0006 a34880        	cpw	x,#18560
 860  0009 2403          	jruge	L021
 861  000b 4f            	clr	a
 862  000c 2010          	jra	L221
 863  000e               L021:
 864  000e ae00f0        	ldw	x,#240
 865  0011 89            	pushw	x
 866  0012 ae0000        	ldw	x,#0
 867  0015 89            	pushw	x
 868  0016 ae0010        	ldw	x,#L73
 869  0019 cd0000        	call	_assert_failed
 871  001c 5b04          	addw	sp,#4
 872  001e               L221:
 873                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 875  001e 721e505b      	bset	20571,#7
 876                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 878  0022 721f505c      	bres	20572,#7
 879                     ; 247   if(Address == 0x4800)
 881  0026 1e01          	ldw	x,(OFST+1,sp)
 882  0028 a34800        	cpw	x,#18432
 883  002b 2607          	jrne	L722
 884                     ; 250     *((NEAR uint8_t*)Address) = Data;
 886  002d 7b05          	ld	a,(OFST+5,sp)
 887  002f 1e01          	ldw	x,(OFST+1,sp)
 888  0031 f7            	ld	(x),a
 890  0032 200c          	jra	L132
 891  0034               L722:
 892                     ; 255     *((NEAR uint8_t*)Address) = Data;
 894  0034 7b05          	ld	a,(OFST+5,sp)
 895  0036 1e01          	ldw	x,(OFST+1,sp)
 896  0038 f7            	ld	(x),a
 897                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 899  0039 7b05          	ld	a,(OFST+5,sp)
 900  003b 43            	cpl	a
 901  003c 1e01          	ldw	x,(OFST+1,sp)
 902  003e e701          	ld	(1,x),a
 903  0040               L132:
 904                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 906  0040 a6fd          	ld	a,#253
 907  0042 cd0000        	call	_FLASH_WaitForLastOperation
 909                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 911  0045 721f505b      	bres	20571,#7
 912                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 914  0049 721e505c      	bset	20572,#7
 915                     ; 263 }
 918  004d 85            	popw	x
 919  004e 81            	ret
 954                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 954                     ; 271 {
 955                     .text:	section	.text,new
 956  0000               _FLASH_EraseOptionByte:
 958  0000 89            	pushw	x
 959       00000000      OFST:	set	0
 962                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 964  0001 a34800        	cpw	x,#18432
 965  0004 2508          	jrult	L621
 966  0006 a34880        	cpw	x,#18560
 967  0009 2403          	jruge	L621
 968  000b 4f            	clr	a
 969  000c 2010          	jra	L031
 970  000e               L621:
 971  000e ae0111        	ldw	x,#273
 972  0011 89            	pushw	x
 973  0012 ae0000        	ldw	x,#0
 974  0015 89            	pushw	x
 975  0016 ae0010        	ldw	x,#L73
 976  0019 cd0000        	call	_assert_failed
 978  001c 5b04          	addw	sp,#4
 979  001e               L031:
 980                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 982  001e 721e505b      	bset	20571,#7
 983                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 985  0022 721f505c      	bres	20572,#7
 986                     ; 280   if(Address == 0x4800)
 988  0026 1e01          	ldw	x,(OFST+1,sp)
 989  0028 a34800        	cpw	x,#18432
 990  002b 2605          	jrne	L742
 991                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 993  002d 1e01          	ldw	x,(OFST+1,sp)
 994  002f 7f            	clr	(x)
 996  0030 2009          	jra	L152
 997  0032               L742:
 998                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1000  0032 1e01          	ldw	x,(OFST+1,sp)
1001  0034 7f            	clr	(x)
1002                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1004  0035 1e01          	ldw	x,(OFST+1,sp)
1005  0037 a6ff          	ld	a,#255
1006  0039 e701          	ld	(1,x),a
1007  003b               L152:
1008                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1010  003b a6fd          	ld	a,#253
1011  003d cd0000        	call	_FLASH_WaitForLastOperation
1013                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1015  0040 721f505b      	bres	20571,#7
1016                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
1018  0044 721e505c      	bset	20572,#7
1019                     ; 296 }
1022  0048 85            	popw	x
1023  0049 81            	ret
1079                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1079                     ; 304 {
1080                     .text:	section	.text,new
1081  0000               _FLASH_ReadOptionByte:
1083  0000 89            	pushw	x
1084  0001 5204          	subw	sp,#4
1085       00000004      OFST:	set	4
1088                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
1090  0003 7b01          	ld	a,(OFST-3,sp)
1091  0005 97            	ld	xl,a
1092                     ; 306   uint16_t res_value = 0;
1094  0006 1e03          	ldw	x,(OFST-1,sp)
1095                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1097  0008 1e05          	ldw	x,(OFST+1,sp)
1098  000a a34800        	cpw	x,#18432
1099  000d 250a          	jrult	L431
1100  000f 1e05          	ldw	x,(OFST+1,sp)
1101  0011 a34880        	cpw	x,#18560
1102  0014 2403          	jruge	L431
1103  0016 4f            	clr	a
1104  0017 2010          	jra	L631
1105  0019               L431:
1106  0019 ae0135        	ldw	x,#309
1107  001c 89            	pushw	x
1108  001d ae0000        	ldw	x,#0
1109  0020 89            	pushw	x
1110  0021 ae0010        	ldw	x,#L73
1111  0024 cd0000        	call	_assert_failed
1113  0027 5b04          	addw	sp,#4
1114  0029               L631:
1115                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1117  0029 1e05          	ldw	x,(OFST+1,sp)
1118  002b f6            	ld	a,(x)
1119  002c 6b02          	ld	(OFST-2,sp),a
1120                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1122  002e 1e05          	ldw	x,(OFST+1,sp)
1123  0030 e601          	ld	a,(1,x)
1124  0032 6b01          	ld	(OFST-3,sp),a
1125                     ; 315   if(Address == 0x4800)	 
1127  0034 1e05          	ldw	x,(OFST+1,sp)
1128  0036 a34800        	cpw	x,#18432
1129  0039 2608          	jrne	L572
1130                     ; 317     res_value =	 value_optbyte;
1132  003b 7b02          	ld	a,(OFST-2,sp)
1133  003d 5f            	clrw	x
1134  003e 97            	ld	xl,a
1135  003f 1f03          	ldw	(OFST-1,sp),x
1137  0041 2023          	jra	L772
1138  0043               L572:
1139                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
1141  0043 7b01          	ld	a,(OFST-3,sp)
1142  0045 43            	cpl	a
1143  0046 1102          	cp	a,(OFST-2,sp)
1144  0048 2617          	jrne	L103
1145                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1147  004a 7b02          	ld	a,(OFST-2,sp)
1148  004c 5f            	clrw	x
1149  004d 97            	ld	xl,a
1150  004e 4f            	clr	a
1151  004f 02            	rlwa	x,a
1152  0050 1f03          	ldw	(OFST-1,sp),x
1153                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
1155  0052 7b01          	ld	a,(OFST-3,sp)
1156  0054 5f            	clrw	x
1157  0055 97            	ld	xl,a
1158  0056 01            	rrwa	x,a
1159  0057 1a04          	or	a,(OFST+0,sp)
1160  0059 01            	rrwa	x,a
1161  005a 1a03          	or	a,(OFST-1,sp)
1162  005c 01            	rrwa	x,a
1163  005d 1f03          	ldw	(OFST-1,sp),x
1165  005f 2005          	jra	L772
1166  0061               L103:
1167                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
1169  0061 ae5555        	ldw	x,#21845
1170  0064 1f03          	ldw	(OFST-1,sp),x
1171  0066               L772:
1172                     ; 331   return(res_value);
1174  0066 1e03          	ldw	x,(OFST-1,sp)
1177  0068 5b06          	addw	sp,#6
1178  006a 81            	ret
1253                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1253                     ; 341 {
1254                     .text:	section	.text,new
1255  0000               _FLASH_SetLowPowerMode:
1257  0000 88            	push	a
1258       00000000      OFST:	set	0
1261                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1263  0001 a104          	cp	a,#4
1264  0003 270b          	jreq	L441
1265  0005 a108          	cp	a,#8
1266  0007 2707          	jreq	L441
1267  0009 4d            	tnz	a
1268  000a 2704          	jreq	L441
1269  000c a10c          	cp	a,#12
1270  000e 2603          	jrne	L241
1271  0010               L441:
1272  0010 4f            	clr	a
1273  0011 2010          	jra	L641
1274  0013               L241:
1275  0013 ae0157        	ldw	x,#343
1276  0016 89            	pushw	x
1277  0017 ae0000        	ldw	x,#0
1278  001a 89            	pushw	x
1279  001b ae0010        	ldw	x,#L73
1280  001e cd0000        	call	_assert_failed
1282  0021 5b04          	addw	sp,#4
1283  0023               L641:
1284                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1286  0023 c6505a        	ld	a,20570
1287  0026 a4f3          	and	a,#243
1288  0028 c7505a        	ld	20570,a
1289                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1291  002b c6505a        	ld	a,20570
1292  002e 1a01          	or	a,(OFST+1,sp)
1293  0030 c7505a        	ld	20570,a
1294                     ; 350 }
1297  0033 84            	pop	a
1298  0034 81            	ret
1357                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1357                     ; 359 {
1358                     .text:	section	.text,new
1359  0000               _FLASH_SetProgrammingTime:
1361  0000 88            	push	a
1362       00000000      OFST:	set	0
1365                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1367  0001 4d            	tnz	a
1368  0002 2704          	jreq	L451
1369  0004 a101          	cp	a,#1
1370  0006 2603          	jrne	L251
1371  0008               L451:
1372  0008 4f            	clr	a
1373  0009 2010          	jra	L651
1374  000b               L251:
1375  000b ae0169        	ldw	x,#361
1376  000e 89            	pushw	x
1377  000f ae0000        	ldw	x,#0
1378  0012 89            	pushw	x
1379  0013 ae0010        	ldw	x,#L73
1380  0016 cd0000        	call	_assert_failed
1382  0019 5b04          	addw	sp,#4
1383  001b               L651:
1384                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1386  001b 7211505a      	bres	20570,#0
1387                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1389  001f c6505a        	ld	a,20570
1390  0022 1a01          	or	a,(OFST+1,sp)
1391  0024 c7505a        	ld	20570,a
1392                     ; 365 }
1395  0027 84            	pop	a
1396  0028 81            	ret
1421                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1421                     ; 373 {
1422                     .text:	section	.text,new
1423  0000               _FLASH_GetLowPowerMode:
1427                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1429  0000 c6505a        	ld	a,20570
1430  0003 a40c          	and	a,#12
1433  0005 81            	ret
1458                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1458                     ; 383 {
1459                     .text:	section	.text,new
1460  0000               _FLASH_GetProgrammingTime:
1464                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1466  0000 c6505a        	ld	a,20570
1467  0003 a401          	and	a,#1
1470  0005 81            	ret
1502                     ; 392 uint32_t FLASH_GetBootSize(void)
1502                     ; 393 {
1503                     .text:	section	.text,new
1504  0000               _FLASH_GetBootSize:
1506  0000 5204          	subw	sp,#4
1507       00000004      OFST:	set	4
1510                     ; 394   uint32_t temp = 0;
1512  0002 ae0000        	ldw	x,#0
1513  0005 1f03          	ldw	(OFST-1,sp),x
1514  0007 ae0000        	ldw	x,#0
1515  000a 1f01          	ldw	(OFST-3,sp),x
1516                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1518  000c c6505d        	ld	a,20573
1519  000f 5f            	clrw	x
1520  0010 97            	ld	xl,a
1521  0011 90ae0200      	ldw	y,#512
1522  0015 cd0000        	call	c_umul
1524  0018 96            	ldw	x,sp
1525  0019 1c0001        	addw	x,#OFST-3
1526  001c cd0000        	call	c_rtol
1528                     ; 400   if(FLASH->FPR == 0xFF)
1530  001f c6505d        	ld	a,20573
1531  0022 a1ff          	cp	a,#255
1532  0024 2611          	jrne	L124
1533                     ; 402     temp += 512;
1535  0026 ae0200        	ldw	x,#512
1536  0029 bf02          	ldw	c_lreg+2,x
1537  002b ae0000        	ldw	x,#0
1538  002e bf00          	ldw	c_lreg,x
1539  0030 96            	ldw	x,sp
1540  0031 1c0001        	addw	x,#OFST-3
1541  0034 cd0000        	call	c_lgadd
1543  0037               L124:
1544                     ; 406   return(temp);
1546  0037 96            	ldw	x,sp
1547  0038 1c0001        	addw	x,#OFST-3
1548  003b cd0000        	call	c_ltor
1552  003e 5b04          	addw	sp,#4
1553  0040 81            	ret
1663                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1663                     ; 418 {
1664                     .text:	section	.text,new
1665  0000               _FLASH_GetFlagStatus:
1667  0000 88            	push	a
1668  0001 88            	push	a
1669       00000001      OFST:	set	1
1672                     ; 419   FlagStatus status = RESET;
1674  0002 0f01          	clr	(OFST+0,sp)
1675                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1677  0004 a140          	cp	a,#64
1678  0006 2710          	jreq	L271
1679  0008 a108          	cp	a,#8
1680  000a 270c          	jreq	L271
1681  000c a104          	cp	a,#4
1682  000e 2708          	jreq	L271
1683  0010 a102          	cp	a,#2
1684  0012 2704          	jreq	L271
1685  0014 a101          	cp	a,#1
1686  0016 2603          	jrne	L071
1687  0018               L271:
1688  0018 4f            	clr	a
1689  0019 2010          	jra	L471
1690  001b               L071:
1691  001b ae01a5        	ldw	x,#421
1692  001e 89            	pushw	x
1693  001f ae0000        	ldw	x,#0
1694  0022 89            	pushw	x
1695  0023 ae0010        	ldw	x,#L73
1696  0026 cd0000        	call	_assert_failed
1698  0029 5b04          	addw	sp,#4
1699  002b               L471:
1700                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1702  002b c6505f        	ld	a,20575
1703  002e 1502          	bcp	a,(OFST+1,sp)
1704  0030 2706          	jreq	L374
1705                     ; 426     status = SET; /* FLASH_FLAG is set */
1707  0032 a601          	ld	a,#1
1708  0034 6b01          	ld	(OFST+0,sp),a
1710  0036 2002          	jra	L574
1711  0038               L374:
1712                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
1714  0038 0f01          	clr	(OFST+0,sp)
1715  003a               L574:
1716                     ; 434   return status;
1718  003a 7b01          	ld	a,(OFST+0,sp)
1721  003c 85            	popw	x
1722  003d 81            	ret
1811                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1811                     ; 550 {
1812                     .FLASH_CODE:	section	.text,new
1813  0000               _FLASH_WaitForLastOperation:
1815  0000 5203          	subw	sp,#3
1816       00000003      OFST:	set	3
1819                     ; 551   uint8_t flagstatus = 0x00;
1821  0002 0f03          	clr	(OFST+0,sp)
1822                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
1824  0004 aeffff        	ldw	x,#65535
1825  0007 1f01          	ldw	(OFST-2,sp),x
1826                     ; 557     if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1828  0009 a1fd          	cp	a,#253
1829  000b 2628          	jrne	L355
1831  000d 200e          	jra	L145
1832  000f               L735:
1833                     ; 561         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1833                     ; 562                                                         FLASH_IAPSR_WR_PG_DIS));
1835  000f c6505f        	ld	a,20575
1836  0012 a405          	and	a,#5
1837  0014 6b03          	ld	(OFST+0,sp),a
1838                     ; 563         timeout--;
1840  0016 1e01          	ldw	x,(OFST-2,sp)
1841  0018 1d0001        	subw	x,#1
1842  001b 1f01          	ldw	(OFST-2,sp),x
1843  001d               L145:
1844                     ; 559       while((flagstatus == 0x00) && (timeout != 0x00))
1846  001d 0d03          	tnz	(OFST+0,sp)
1847  001f 261c          	jrne	L745
1849  0021 1e01          	ldw	x,(OFST-2,sp)
1850  0023 26ea          	jrne	L735
1851  0025 2016          	jra	L745
1852  0027               L155:
1853                     ; 570         flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1853                     ; 571                                                         FLASH_IAPSR_WR_PG_DIS));
1855  0027 c6505f        	ld	a,20575
1856  002a a441          	and	a,#65
1857  002c 6b03          	ld	(OFST+0,sp),a
1858                     ; 572         timeout--;
1860  002e 1e01          	ldw	x,(OFST-2,sp)
1861  0030 1d0001        	subw	x,#1
1862  0033 1f01          	ldw	(OFST-2,sp),x
1863  0035               L355:
1864                     ; 568       while((flagstatus == 0x00) && (timeout != 0x00))
1866  0035 0d03          	tnz	(OFST+0,sp)
1867  0037 2604          	jrne	L745
1869  0039 1e01          	ldw	x,(OFST-2,sp)
1870  003b 26ea          	jrne	L155
1871  003d               L745:
1872                     ; 583   if(timeout == 0x00 )
1874  003d 1e01          	ldw	x,(OFST-2,sp)
1875  003f 2604          	jrne	L165
1876                     ; 585     flagstatus = FLASH_STATUS_TIMEOUT;
1878  0041 a602          	ld	a,#2
1879  0043 6b03          	ld	(OFST+0,sp),a
1880  0045               L165:
1881                     ; 588   return((FLASH_Status_TypeDef)flagstatus);
1883  0045 7b03          	ld	a,(OFST+0,sp)
1886  0047 5b03          	addw	sp,#3
1887  0049 81            	ret
1947                     ; 598 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1947                     ; 599 {
1948                     .FLASH_CODE:	section	.text,new
1949  0000               _FLASH_EraseBlock:
1951  0000 89            	pushw	x
1952  0001 5207          	subw	sp,#7
1953       00000007      OFST:	set	7
1956                     ; 600   uint32_t startaddress = 0;
1958  0003 96            	ldw	x,sp
1959  0004 1c0001        	addw	x,#OFST-6
1960  0007 cd0000        	call	c_ltor
1962                     ; 610   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1964  000a 7b0c          	ld	a,(OFST+5,sp)
1965  000c a1fd          	cp	a,#253
1966  000e 2706          	jreq	L402
1967  0010 7b0c          	ld	a,(OFST+5,sp)
1968  0012 a1f7          	cp	a,#247
1969  0014 2603          	jrne	L202
1970  0016               L402:
1971  0016 4f            	clr	a
1972  0017 2010          	jra	L602
1973  0019               L202:
1974  0019 ae0262        	ldw	x,#610
1975  001c 89            	pushw	x
1976  001d ae0000        	ldw	x,#0
1977  0020 89            	pushw	x
1978  0021 ae0010        	ldw	x,#L73
1979  0024 cd0000        	call	_assert_failed
1981  0027 5b04          	addw	sp,#4
1982  0029               L602:
1983                     ; 611   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
1985  0029 7b0c          	ld	a,(OFST+5,sp)
1986  002b a1fd          	cp	a,#253
1987  002d 2626          	jrne	L116
1988                     ; 613     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1990  002f 1e08          	ldw	x,(OFST+1,sp)
1991  0031 a30400        	cpw	x,#1024
1992  0034 2403          	jruge	L012
1993  0036 4f            	clr	a
1994  0037 2010          	jra	L212
1995  0039               L012:
1996  0039 ae0265        	ldw	x,#613
1997  003c 89            	pushw	x
1998  003d ae0000        	ldw	x,#0
1999  0040 89            	pushw	x
2000  0041 ae0010        	ldw	x,#L73
2001  0044 cd0000        	call	_assert_failed
2003  0047 5b04          	addw	sp,#4
2004  0049               L212:
2005                     ; 614     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2007  0049 ae8000        	ldw	x,#32768
2008  004c 1f03          	ldw	(OFST-4,sp),x
2009  004e ae0000        	ldw	x,#0
2010  0051 1f01          	ldw	(OFST-6,sp),x
2012  0053 2024          	jra	L316
2013  0055               L116:
2014                     ; 618     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2016  0055 1e08          	ldw	x,(OFST+1,sp)
2017  0057 a30010        	cpw	x,#16
2018  005a 2403          	jruge	L412
2019  005c 4f            	clr	a
2020  005d 2010          	jra	L612
2021  005f               L412:
2022  005f ae026a        	ldw	x,#618
2023  0062 89            	pushw	x
2024  0063 ae0000        	ldw	x,#0
2025  0066 89            	pushw	x
2026  0067 ae0010        	ldw	x,#L73
2027  006a cd0000        	call	_assert_failed
2029  006d 5b04          	addw	sp,#4
2030  006f               L612:
2031                     ; 619     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2033  006f ae4000        	ldw	x,#16384
2034  0072 1f03          	ldw	(OFST-4,sp),x
2035  0074 ae0000        	ldw	x,#0
2036  0077 1f01          	ldw	(OFST-6,sp),x
2037  0079               L316:
2038                     ; 624   pwFlash = (PointerAttr uint8_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2040  0079 1e08          	ldw	x,(OFST+1,sp)
2041  007b a680          	ld	a,#128
2042  007d cd0000        	call	c_cmulx
2044  0080 96            	ldw	x,sp
2045  0081 1c0001        	addw	x,#OFST-6
2046  0084 cd0000        	call	c_ladd
2048  0087 450100        	mov	c_x,c_lreg+1
2049  008a be02          	ldw	x,c_lreg+2
2050  008c b600          	ld	a,c_x
2051  008e 6b05          	ld	(OFST-2,sp),a
2052  0090 1f06          	ldw	(OFST-1,sp),x
2053                     ; 631   FLASH->CR2 |= FLASH_CR2_ERASE;
2055  0092 721a505b      	bset	20571,#5
2056                     ; 632   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2058  0096 721b505c      	bres	20572,#5
2059                     ; 639     *pwFlash = (uint8_t)0;
2061  009a 7b05          	ld	a,(OFST-2,sp)
2062  009c b700          	ld	c_x,a
2063  009e 1e06          	ldw	x,(OFST-1,sp)
2064  00a0 bf01          	ldw	c_x+1,x
2065  00a2 4f            	clr	a
2066  00a3 92bd0000      	ldf	[c_x.e],a
2067                     ; 640   *(pwFlash + 1) = (uint8_t)0;
2069  00a7 7b05          	ld	a,(OFST-2,sp)
2070  00a9 b700          	ld	c_x,a
2071  00ab 1e06          	ldw	x,(OFST-1,sp)
2072  00ad 90ae0001      	ldw	y,#1
2073  00b1 bf01          	ldw	c_x+1,x
2074  00b3 93            	ldw	x,y
2075  00b4 4f            	clr	a
2076  00b5 92a70000      	ldf	([c_x.e],x),a
2077                     ; 641   *(pwFlash + 2) = (uint8_t)0;
2079  00b9 7b05          	ld	a,(OFST-2,sp)
2080  00bb b700          	ld	c_x,a
2081  00bd 1e06          	ldw	x,(OFST-1,sp)
2082  00bf 90ae0002      	ldw	y,#2
2083  00c3 bf01          	ldw	c_x+1,x
2084  00c5 93            	ldw	x,y
2085  00c6 4f            	clr	a
2086  00c7 92a70000      	ldf	([c_x.e],x),a
2087                     ; 642   *(pwFlash + 3) = (uint8_t)0;    
2089  00cb 7b05          	ld	a,(OFST-2,sp)
2090  00cd b700          	ld	c_x,a
2091  00cf 1e06          	ldw	x,(OFST-1,sp)
2092  00d1 90ae0003      	ldw	y,#3
2093  00d5 bf01          	ldw	c_x+1,x
2094  00d7 93            	ldw	x,y
2095  00d8 4f            	clr	a
2096  00d9 92a70000      	ldf	([c_x.e],x),a
2097                     ; 644 }
2100  00dd 5b09          	addw	sp,#9
2101  00df 81            	ret
2200                     ; 655 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2200                     ; 656                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2200                     ; 657 {
2201                     .FLASH_CODE:	section	.text,new
2202  0000               _FLASH_ProgramBlock:
2204  0000 89            	pushw	x
2205  0001 5206          	subw	sp,#6
2206       00000006      OFST:	set	6
2209                     ; 658   uint16_t Count = 0;
2211  0003 1e05          	ldw	x,(OFST-1,sp)
2212                     ; 659   uint32_t startaddress = 0;
2214  0005 96            	ldw	x,sp
2215  0006 1c0001        	addw	x,#OFST-5
2216  0009 cd0000        	call	c_ltor
2218                     ; 662   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2220  000c 7b0b          	ld	a,(OFST+5,sp)
2221  000e a1fd          	cp	a,#253
2222  0010 2706          	jreq	L422
2223  0012 7b0b          	ld	a,(OFST+5,sp)
2224  0014 a1f7          	cp	a,#247
2225  0016 2603          	jrne	L222
2226  0018               L422:
2227  0018 4f            	clr	a
2228  0019 2010          	jra	L622
2229  001b               L222:
2230  001b ae0296        	ldw	x,#662
2231  001e 89            	pushw	x
2232  001f ae0000        	ldw	x,#0
2233  0022 89            	pushw	x
2234  0023 ae0010        	ldw	x,#L73
2235  0026 cd0000        	call	_assert_failed
2237  0029 5b04          	addw	sp,#4
2238  002b               L622:
2239                     ; 663   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2241  002b 0d0c          	tnz	(OFST+6,sp)
2242  002d 2706          	jreq	L232
2243  002f 7b0c          	ld	a,(OFST+6,sp)
2244  0031 a110          	cp	a,#16
2245  0033 2603          	jrne	L032
2246  0035               L232:
2247  0035 4f            	clr	a
2248  0036 2010          	jra	L432
2249  0038               L032:
2250  0038 ae0297        	ldw	x,#663
2251  003b 89            	pushw	x
2252  003c ae0000        	ldw	x,#0
2253  003f 89            	pushw	x
2254  0040 ae0010        	ldw	x,#L73
2255  0043 cd0000        	call	_assert_failed
2257  0046 5b04          	addw	sp,#4
2258  0048               L432:
2259                     ; 664   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
2261  0048 7b0b          	ld	a,(OFST+5,sp)
2262  004a a1fd          	cp	a,#253
2263  004c 2626          	jrne	L166
2264                     ; 666     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2266  004e 1e07          	ldw	x,(OFST+1,sp)
2267  0050 a30400        	cpw	x,#1024
2268  0053 2403          	jruge	L632
2269  0055 4f            	clr	a
2270  0056 2010          	jra	L042
2271  0058               L632:
2272  0058 ae029a        	ldw	x,#666
2273  005b 89            	pushw	x
2274  005c ae0000        	ldw	x,#0
2275  005f 89            	pushw	x
2276  0060 ae0010        	ldw	x,#L73
2277  0063 cd0000        	call	_assert_failed
2279  0066 5b04          	addw	sp,#4
2280  0068               L042:
2281                     ; 667     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2283  0068 ae8000        	ldw	x,#32768
2284  006b 1f03          	ldw	(OFST-3,sp),x
2285  006d ae0000        	ldw	x,#0
2286  0070 1f01          	ldw	(OFST-5,sp),x
2288  0072 2024          	jra	L366
2289  0074               L166:
2290                     ; 671     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2292  0074 1e07          	ldw	x,(OFST+1,sp)
2293  0076 a30010        	cpw	x,#16
2294  0079 2403          	jruge	L242
2295  007b 4f            	clr	a
2296  007c 2010          	jra	L442
2297  007e               L242:
2298  007e ae029f        	ldw	x,#671
2299  0081 89            	pushw	x
2300  0082 ae0000        	ldw	x,#0
2301  0085 89            	pushw	x
2302  0086 ae0010        	ldw	x,#L73
2303  0089 cd0000        	call	_assert_failed
2305  008c 5b04          	addw	sp,#4
2306  008e               L442:
2307                     ; 672     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2309  008e ae4000        	ldw	x,#16384
2310  0091 1f03          	ldw	(OFST-3,sp),x
2311  0093 ae0000        	ldw	x,#0
2312  0096 1f01          	ldw	(OFST-5,sp),x
2313  0098               L366:
2314                     ; 676   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2316  0098 1e07          	ldw	x,(OFST+1,sp)
2317  009a a680          	ld	a,#128
2318  009c cd0000        	call	c_cmulx
2320  009f 96            	ldw	x,sp
2321  00a0 1c0001        	addw	x,#OFST-5
2322  00a3 cd0000        	call	c_lgadd
2324                     ; 679   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2326  00a6 0d0c          	tnz	(OFST+6,sp)
2327  00a8 260a          	jrne	L566
2328                     ; 682     FLASH->CR2 |= FLASH_CR2_PRG;
2330  00aa 7210505b      	bset	20571,#0
2331                     ; 683     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2333  00ae 7211505c      	bres	20572,#0
2335  00b2 2008          	jra	L766
2336  00b4               L566:
2337                     ; 688     FLASH->CR2 |= FLASH_CR2_FPRG;
2339  00b4 7218505b      	bset	20571,#4
2340                     ; 689     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2342  00b8 7219505c      	bres	20572,#4
2343  00bc               L766:
2344                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2346  00bc 5f            	clrw	x
2347  00bd 1f05          	ldw	(OFST-1,sp),x
2348  00bf               L176:
2349                     ; 695     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2351  00bf 1e0d          	ldw	x,(OFST+7,sp)
2352  00c1 72fb05        	addw	x,(OFST-1,sp)
2353  00c4 f6            	ld	a,(x)
2354  00c5 88            	push	a
2355  00c6 7b03          	ld	a,(OFST-3,sp)
2356  00c8 b700          	ld	c_x,a
2357  00ca 1e04          	ldw	x,(OFST-2,sp)
2358  00cc 84            	pop	a
2359  00cd 1605          	ldw	y,(OFST-1,sp)
2360  00cf bf01          	ldw	c_x+1,x
2361  00d1 93            	ldw	x,y
2362  00d2 92a70000      	ldf	([c_x.e],x),a
2363                     ; 693   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2365  00d6 1e05          	ldw	x,(OFST-1,sp)
2366  00d8 1c0001        	addw	x,#1
2367  00db 1f05          	ldw	(OFST-1,sp),x
2370  00dd 1e05          	ldw	x,(OFST-1,sp)
2371  00df a30080        	cpw	x,#128
2372  00e2 25db          	jrult	L176
2373                     ; 697 }
2376  00e4 5b08          	addw	sp,#8
2377  00e6 81            	ret
2390                     	xdef	_FLASH_WaitForLastOperation
2391                     	xdef	_FLASH_ProgramBlock
2392                     	xdef	_FLASH_EraseBlock
2393                     	xdef	_FLASH_GetFlagStatus
2394                     	xdef	_FLASH_GetBootSize
2395                     	xdef	_FLASH_GetProgrammingTime
2396                     	xdef	_FLASH_GetLowPowerMode
2397                     	xdef	_FLASH_SetProgrammingTime
2398                     	xdef	_FLASH_SetLowPowerMode
2399                     	xdef	_FLASH_EraseOptionByte
2400                     	xdef	_FLASH_ProgramOptionByte
2401                     	xdef	_FLASH_ReadOptionByte
2402                     	xdef	_FLASH_ProgramWord
2403                     	xdef	_FLASH_ReadByte
2404                     	xdef	_FLASH_ProgramByte
2405                     	xdef	_FLASH_EraseByte
2406                     	xdef	_FLASH_ITConfig
2407                     	xdef	_FLASH_DeInit
2408                     	xdef	_FLASH_Lock
2409                     	xdef	_FLASH_Unlock
2410                     	xref	_assert_failed
2411                     	switch	.const
2412  0010               L73:
2413  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
2414  0022 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
2415  0034 72697665725c  	dc.b	"river\src\stm8s_fl"
2416  0046 6173682e6300  	dc.b	"ash.c",0
2417                     	xref.b	c_lreg
2418                     	xref.b	c_x
2438                     	xref	c_ladd
2439                     	xref	c_cmulx
2440                     	xref	c_lgadd
2441                     	xref	c_rtol
2442                     	xref	c_umul
2443                     	xref	c_lcmp
2444                     	xref	c_ltor
2445                     	end
