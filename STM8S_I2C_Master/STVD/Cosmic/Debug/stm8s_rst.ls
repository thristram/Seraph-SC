   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 107                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 107                     ; 55 {
 109                     .text:	section	.text,new
 110  0000               _RST_GetFlagStatus:
 112  0000 88            	push	a
 113       00000000      OFST:	set	0
 116                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 118  0001 a110          	cp	a,#16
 119  0003 2710          	jreq	L01
 120  0005 a108          	cp	a,#8
 121  0007 270c          	jreq	L01
 122  0009 a104          	cp	a,#4
 123  000b 2708          	jreq	L01
 124  000d a102          	cp	a,#2
 125  000f 2704          	jreq	L01
 126  0011 a101          	cp	a,#1
 127  0013 2603          	jrne	L6
 128  0015               L01:
 129  0015 4f            	clr	a
 130  0016 2010          	jra	L21
 131  0018               L6:
 132  0018 ae0039        	ldw	x,#57
 133  001b 89            	pushw	x
 134  001c ae0000        	ldw	x,#0
 135  001f 89            	pushw	x
 136  0020 ae0000        	ldw	x,#L55
 137  0023 cd0000        	call	_assert_failed
 139  0026 5b04          	addw	sp,#4
 140  0028               L21:
 141                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 143  0028 c650b3        	ld	a,20659
 144  002b 1501          	bcp	a,(OFST+1,sp)
 145  002d 2603          	jrne	L41
 146  002f 4f            	clr	a
 147  0030 2002          	jra	L61
 148  0032               L41:
 149  0032 a601          	ld	a,#1
 150  0034               L61:
 153  0034 5b01          	addw	sp,#1
 154  0036 81            	ret
 190                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 190                     ; 70 {
 191                     .text:	section	.text,new
 192  0000               _RST_ClearFlag:
 194  0000 88            	push	a
 195       00000000      OFST:	set	0
 198                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 200  0001 a110          	cp	a,#16
 201  0003 2710          	jreq	L42
 202  0005 a108          	cp	a,#8
 203  0007 270c          	jreq	L42
 204  0009 a104          	cp	a,#4
 205  000b 2708          	jreq	L42
 206  000d a102          	cp	a,#2
 207  000f 2704          	jreq	L42
 208  0011 a101          	cp	a,#1
 209  0013 2603          	jrne	L22
 210  0015               L42:
 211  0015 4f            	clr	a
 212  0016 2010          	jra	L62
 213  0018               L22:
 214  0018 ae0048        	ldw	x,#72
 215  001b 89            	pushw	x
 216  001c ae0000        	ldw	x,#0
 217  001f 89            	pushw	x
 218  0020 ae0000        	ldw	x,#L55
 219  0023 cd0000        	call	_assert_failed
 221  0026 5b04          	addw	sp,#4
 222  0028               L62:
 223                     ; 74   RST->SR = (uint8_t)RST_Flag;
 225  0028 7b01          	ld	a,(OFST+1,sp)
 226  002a c750b3        	ld	20659,a
 227                     ; 75 }
 230  002d 84            	pop	a
 231  002e 81            	ret
 244                     	xdef	_RST_ClearFlag
 245                     	xdef	_RST_GetFlagStatus
 246                     	xref	_assert_failed
 247                     .const:	section	.text
 248  0000               L55:
 249  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 250  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 251  0024 72697665725c  	dc.b	"river\src\stm8s_rs"
 252  0036 742e6300      	dc.b	"t.c",0
 272                     	end
