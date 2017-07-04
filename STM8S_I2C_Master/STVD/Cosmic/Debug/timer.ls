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
 257  0015 72120008      	bset	_Flag1_,#1
 258  0019               L721:
 259                     ; 49 	systime_count[1]++;
 261  0019 ce0002        	ldw	x,_systime_count+2
 262  001c 1c0001        	addw	x,#1
 263  001f cf0002        	ldw	_systime_count+2,x
 264                     ; 50 	if (systime_count[1] >= 300)
 266  0022 ce0002        	ldw	x,_systime_count+2
 267  0025 a3012c        	cpw	x,#300
 268  0028 2508          	jrult	L131
 269                     ; 52 		systime_count[1] = 0;
 271  002a 5f            	clrw	x
 272  002b cf0002        	ldw	_systime_count+2,x
 273                     ; 53 		f_300ms = 1;
 275  002e 72140008      	bset	_Flag1_,#2
 276  0032               L131:
 277                     ; 55 	systime_count[2]++;
 279  0032 ce0004        	ldw	x,_systime_count+4
 280  0035 1c0001        	addw	x,#1
 281  0038 cf0004        	ldw	_systime_count+4,x
 282                     ; 56 	if (systime_count[2] >= 1000)
 284  003b ce0004        	ldw	x,_systime_count+4
 285  003e a303e8        	cpw	x,#1000
 286  0041 2508          	jrult	L331
 287                     ; 58 		systime_count[2] = 0;
 289  0043 5f            	clrw	x
 290  0044 cf0004        	ldw	_systime_count+4,x
 291                     ; 59 		f_1s = 1;
 293  0047 72160008      	bset	_Flag1_,#3
 294  004b               L331:
 295                     ; 61 }
 298  004b 81            	ret
 326                     ; 64 @far @interrupt void TIM4InterruptHandle (void) {
 328                     .text:	section	.text,new
 329  0000               f_TIM4InterruptHandle:
 332  0000 3b0002        	push	c_x+2
 333  0003 be00          	ldw	x,c_x
 334  0005 89            	pushw	x
 335  0006 3b0002        	push	c_y+2
 336  0009 be00          	ldw	x,c_y
 337  000b 89            	pushw	x
 340                     ; 68   f_1ms = 1;
 342  000c 72100008      	bset	_Flag1_,#0
 343                     ; 69   TIM4->SR1= 0;
 345  0010 725f5342      	clr	21314
 346                     ; 70 	Sys_Time_Manage();
 348  0014 cd0000        	call	_Sys_Time_Manage
 350                     ; 71 	 if(TIM4_tout)
 352  0017 ce0000        	ldw	x,_TIM4_tout
 353  001a 270c          	jreq	L541
 354                     ; 72     if(--TIM4_tout == 0)
 356  001c ce0000        	ldw	x,_TIM4_tout
 357  001f 1d0001        	subw	x,#1
 358  0022 cf0000        	ldw	_TIM4_tout,x
 359  0025 2601          	jrne	L541
 360                     ; 74       _asm("nop");
 363  0027 9d            nop
 365  0028               L541:
 366                     ; 78 }
 369  0028 85            	popw	x
 370  0029 bf00          	ldw	c_y,x
 371  002b 320002        	pop	c_y+2
 372  002e 85            	popw	x
 373  002f bf00          	ldw	c_x,x
 374  0031 320002        	pop	c_x+2
 375  0034 80            	iret
 387                     	xref	_TIM4_tout
 388                     	xdef	f_TIM4InterruptHandle
 389                     	xdef	_Sys_Time_Manage
 390                     	xdef	_Init_Time4
 391                     	switch	.bss
 392  0000               _systime_count:
 393  0000 000000000000  	ds.b	8
 394                     	xdef	_systime_count
 395  0008               _Flag1_:
 396  0008 00            	ds.b	1
 397                     	xdef	_Flag1_
 398                     	xref.b	c_x
 399                     	xref.b	c_y
 419                     	end
