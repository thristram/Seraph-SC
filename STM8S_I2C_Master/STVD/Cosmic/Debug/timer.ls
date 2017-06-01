   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 182                     ; 21 void Init_Time4(void)
 182                     ; 22 {
 184                     .text:	section	.text,new
 185  0000               _Init_Time4:
 189                     ; 24 	TIM4->PSCR = 0x06;//分频值 8M/2^6 = 12.5K
 191  0000 35065347      	mov	21319,#6
 192                     ; 25 	TIM4->IER = 0x01;//使能触发中断
 194  0004 35015343      	mov	21315,#1
 195                     ; 26 	TIM4->CNTR = 125;//125*(1/12.5K) = 0.001s
 197  0008 357d5346      	mov	21318,#125
 198                     ; 27 	TIM4->ARR = 125;//自动重装的值
 200  000c 357d5348      	mov	21320,#125
 201                     ; 28 }
 204  0010 81            	ret
 229                     ; 36 void Sys_Time_Manage(void)
 229                     ; 37 {
 230                     .text:	section	.text,new
 231  0000               _Sys_Time_Manage:
 235                     ; 38 	systime_count[0]++;
 237  0000 be00          	ldw	x,_systime_count
 238  0002 1c0001        	addw	x,#1
 239  0005 bf00          	ldw	_systime_count,x
 240                     ; 39 	if (systime_count[0] >= 100)
 242  0007 be00          	ldw	x,_systime_count
 243  0009 a30064        	cpw	x,#100
 244  000c 2507          	jrult	L721
 245                     ; 41 		systime_count[0] = 0;
 247  000e 5f            	clrw	x
 248  000f bf00          	ldw	_systime_count,x
 249                     ; 42 		f_100ms = 1;
 251  0011 72120008      	bset	_Flag1_,#1
 252  0015               L721:
 253                     ; 44 	systime_count[1]++;
 255  0015 be02          	ldw	x,_systime_count+2
 256  0017 1c0001        	addw	x,#1
 257  001a bf02          	ldw	_systime_count+2,x
 258                     ; 45 	if (systime_count[1] >= 300)
 260  001c be02          	ldw	x,_systime_count+2
 261  001e a3012c        	cpw	x,#300
 262  0021 2507          	jrult	L131
 263                     ; 47 		systime_count[1] = 0;
 265  0023 5f            	clrw	x
 266  0024 bf02          	ldw	_systime_count+2,x
 267                     ; 48 		f_300ms = 1;
 269  0026 72140008      	bset	_Flag1_,#2
 270  002a               L131:
 271                     ; 50 	systime_count[2]++;
 273  002a be04          	ldw	x,_systime_count+4
 274  002c 1c0001        	addw	x,#1
 275  002f bf04          	ldw	_systime_count+4,x
 276                     ; 51 	if (systime_count[2] >= 1000)
 278  0031 be04          	ldw	x,_systime_count+4
 279  0033 a303e8        	cpw	x,#1000
 280  0036 2507          	jrult	L331
 281                     ; 53 		systime_count[2] = 0;
 283  0038 5f            	clrw	x
 284  0039 bf04          	ldw	_systime_count+4,x
 285                     ; 54 		f_1s = 1;
 287  003b 72160008      	bset	_Flag1_,#3
 288  003f               L331:
 289                     ; 56 }
 292  003f 81            	ret
 320                     ; 59 @far @interrupt void TIM4InterruptHandle (void) {
 322                     .text:	section	.text,new
 323  0000               f_TIM4InterruptHandle:
 326  0000 3b0002        	push	c_x+2
 327  0003 be00          	ldw	x,c_x
 328  0005 89            	pushw	x
 329  0006 3b0002        	push	c_y+2
 330  0009 be00          	ldw	x,c_y
 331  000b 89            	pushw	x
 334                     ; 63   f_1ms = 1;
 336  000c 72100008      	bset	_Flag1_,#0
 337                     ; 64   TIM4->SR1= 0;
 339  0010 725f5344      	clr	21316
 340                     ; 65 	Sys_Time_Manage();
 342  0014 cd0000        	call	_Sys_Time_Manage
 344                     ; 67 	 if(TIM4_tout)
 346  0017 be00          	ldw	x,_TIM4_tout
 347  0019 270a          	jreq	L541
 348                     ; 68     if(--TIM4_tout == 0)
 350  001b be00          	ldw	x,_TIM4_tout
 351  001d 1d0001        	subw	x,#1
 352  0020 bf00          	ldw	_TIM4_tout,x
 353  0022 2601          	jrne	L541
 354                     ; 70       _asm("nop");
 357  0024 9d            nop
 359  0025               L541:
 360                     ; 74 }
 363  0025 85            	popw	x
 364  0026 bf00          	ldw	c_y,x
 365  0028 320002        	pop	c_y+2
 366  002b 85            	popw	x
 367  002c bf00          	ldw	c_x,x
 368  002e 320002        	pop	c_x+2
 369  0031 80            	iret
 381                     	xref.b	_TIM4_tout
 382                     	xdef	f_TIM4InterruptHandle
 383                     	xdef	_Sys_Time_Manage
 384                     	xdef	_Init_Time4
 385                     	switch	.ubsct
 386  0000               _systime_count:
 387  0000 000000000000  	ds.b	8
 388                     	xdef	_systime_count
 389  0008               _Flag1_:
 390  0008 00            	ds.b	1
 391                     	xdef	_Flag1_
 392                     	xref.b	c_x
 393                     	xref.b	c_y
 413                     	end
