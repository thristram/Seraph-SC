   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 182                     ; 21 void Init_Time4(void)
 182                     ; 22 {
 184                     .text:	section	.text,new
 185  0000               _Init_Time4:
 189                     ; 24 	TIM4->PSCR = 0x06;//分频值 16M/2^6 = 250K
 191  0000 35065345      	mov	21317,#6
 192                     ; 25 	TIM4->IER = 0x01;//使能触发中断
 194  0004 35015341      	mov	21313,#1
 195                     ; 26 	TIM4->CNTR = 250;//250*(1/250K) = 0.001s
 197  0008 35fa5344      	mov	21316,#250
 198                     ; 27 	TIM4->ARR = 249;//自动重装的值
 200  000c 35f95346      	mov	21318,#249
 201                     ; 31 	TIM4->IER = 0x01;     // Enable interrupt
 203  0010 35015341      	mov	21313,#1
 204                     ; 32   TIM4->CR1 = 0x01;     // Start timer
 206  0014 35015340      	mov	21312,#1
 207                     ; 33 }
 210  0018 81            	ret
 235                     ; 41 void Sys_Time_Manage(void)
 235                     ; 42 {
 236                     .text:	section	.text,new
 237  0000               _Sys_Time_Manage:
 241                     ; 43 	systime_count[0]++;
 243  0000 ce0000        	ldw	x,_systime_count
 244  0003 1c0001        	addw	x,#1
 245  0006 cf0000        	ldw	_systime_count,x
 246                     ; 44 	if (systime_count[0] >= 100)
 248  0009 ce0000        	ldw	x,_systime_count
 249  000c a30064        	cpw	x,#100
 250  000f 2508          	jrult	L721
 251                     ; 46 		systime_count[0] = 0;
 253  0011 5f            	clrw	x
 254  0012 cf0000        	ldw	_systime_count,x
 255                     ; 47 		f_100ms = 1;
 257  0015 7212000a      	bset	_Flag1_,#1
 258  0019               L721:
 259                     ; 55 	systime_count[2]++;
 261  0019 ce0004        	ldw	x,_systime_count+4
 262  001c 1c0001        	addw	x,#1
 263  001f cf0004        	ldw	_systime_count+4,x
 264                     ; 56 	if (systime_count[2] >= 1000)
 266  0022 ce0004        	ldw	x,_systime_count+4
 267  0025 a303e8        	cpw	x,#1000
 268  0028 2508          	jrult	L131
 269                     ; 58 		systime_count[2] = 0;
 271  002a 5f            	clrw	x
 272  002b cf0004        	ldw	_systime_count+4,x
 273                     ; 59 		f_1s = 1;
 275  002e 7216000a      	bset	_Flag1_,#3
 276  0032               L131:
 277                     ; 61 }
 280  0032 81            	ret
 308                     ; 64 @far @interrupt void TIM4InterruptHandle (void) {
 310                     .text:	section	.text,new
 311  0000               f_TIM4InterruptHandle:
 314  0000 3b0002        	push	c_x+2
 315  0003 be00          	ldw	x,c_x
 316  0005 89            	pushw	x
 317  0006 3b0002        	push	c_y+2
 318  0009 be00          	ldw	x,c_y
 319  000b 89            	pushw	x
 322                     ; 68   f_1ms = 1;
 324  000c 7210000a      	bset	_Flag1_,#0
 325                     ; 69   TIM4->SR1= 0;
 327  0010 725f5342      	clr	21314
 328                     ; 70 	Sys_Time_Manage();
 330  0014 cd0000        	call	_Sys_Time_Manage
 332                     ; 71 	 if(TIM4_tout)
 334  0017 ce0000        	ldw	x,_TIM4_tout
 335  001a 270c          	jreq	L341
 336                     ; 72     if(--TIM4_tout == 0)
 338  001c ce0000        	ldw	x,_TIM4_tout
 339  001f 1d0001        	subw	x,#1
 340  0022 cf0000        	ldw	_TIM4_tout,x
 341  0025 2601          	jrne	L341
 342                     ; 74       _asm("nop");
 345  0027 9d            nop
 347  0028               L341:
 348                     ; 78 }
 351  0028 85            	popw	x
 352  0029 bf00          	ldw	c_y,x
 353  002b 320002        	pop	c_y+2
 354  002e 85            	popw	x
 355  002f bf00          	ldw	c_x,x
 356  0031 320002        	pop	c_x+2
 357  0034 80            	iret
 369                     	xref	_TIM4_tout
 370                     	xdef	f_TIM4InterruptHandle
 371                     	xdef	_Sys_Time_Manage
 372                     	xdef	_Init_Time4
 373                     	switch	.bss
 374  0000               _systime_count:
 375  0000 000000000000  	ds.b	10
 376                     	xdef	_systime_count
 377  000a               _Flag1_:
 378  000a 00            	ds.b	1
 379                     	xdef	_Flag1_
 380                     	xref.b	c_x
 381                     	xref.b	c_y
 401                     	end
