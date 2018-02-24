   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 172                     ; 21 void timer4_init(void)
 172                     ; 22 {
 174                     .text:	section	.text,new
 175  0000               _timer4_init:
 179                     ; 24 	TIM4->PSCR = 0x06;		//分频值 16M/2^6 = 250K
 181  0000 35065345      	mov	21317,#6
 182                     ; 25 	TIM4->IER = 0x01;		//使能触发中断
 184  0004 35015341      	mov	21313,#1
 185                     ; 26 	TIM4->CNTR = 250;		//250*(1/250K) = 0.001s
 187  0008 35fa5344      	mov	21316,#250
 188                     ; 27 	TIM4->ARR = 249;		//自动重装的值	
 190  000c 35f95346      	mov	21318,#249
 191                     ; 32 	TIM4->IER = 0x01;     	// Enable interrupt
 193  0010 35015341      	mov	21313,#1
 194                     ; 33   	TIM4->CR1 = 0x01;     	// Start timer
 196  0014 35015340      	mov	21312,#1
 197                     ; 35 }
 200  0018 81            	ret
 227                     ; 40 void timer2_init(void)
 227                     ; 41 {    
 228                     .text:	section	.text,new
 229  0000               _timer2_init:
 233                     ; 42 	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 25000);
 235  0000 ae61a8        	ldw	x,#25000
 236  0003 89            	pushw	x
 237  0004 a606          	ld	a,#6
 238  0006 cd0000        	call	_TIM2_TimeBaseInit
 240  0009 85            	popw	x
 241                     ; 43 	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 243  000a ae0001        	ldw	x,#1
 244  000d cd0000        	call	_TIM2_ClearFlag
 246                     ; 44 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);	
 248  0010 ae0001        	ldw	x,#1
 249  0013 a601          	ld	a,#1
 250  0015 95            	ld	xh,a
 251  0016 cd0000        	call	_TIM2_ITConfig
 253                     ; 45 	TIM2_Cmd(ENABLE);	
 255  0019 a601          	ld	a,#1
 256  001b cd0000        	call	_TIM2_Cmd
 258                     ; 47 }
 261  001e 81            	ret
 286                     ; 55 @far @interrupt void Timer4_ISR (void)
 286                     ; 56 #else
 286                     ; 57 void Timer4_ISR (void) interrupt 23 
 286                     ; 58 #endif
 286                     ; 59  { 
 288                     .text:	section	.text,new
 289  0000               f_Timer4_ISR:
 294                     ; 60   	TIM4->SR1 = 0;
 296  0000 725f5342      	clr	21314
 297                     ; 62  	f_1ms = 1;
 299  0004 72100000      	bset	_Flag1_,#0
 300                     ; 64 	swuart_frame.txOverWait++;
 302  0008 ce000e        	ldw	x,_swuart_frame+14
 303  000b 1c0001        	addw	x,#1
 304  000e cf000e        	ldw	_swuart_frame+14,x
 305                     ; 65 	swuart_frame.rxOverWait++;
 307  0011 ce0008        	ldw	x,_swuart_frame+8
 308  0014 1c0001        	addw	x,#1
 309  0017 cf0008        	ldw	_swuart_frame+8,x
 310                     ; 68 }
 313  001a 80            	iret
 315                     	switch	.data
 316  0000               L331_count_1s:
 317  0000 00            	dc.b	0
 348                     ; 80 @far @interrupt void Timer2_ISR(void) {
 349                     .text:	section	.text,new
 350  0000               f_Timer2_ISR:
 355                     ; 86 	TIM2->SR1 = 0;
 357  0000 725f5302      	clr	21250
 358                     ; 89 	f_100ms = 1;
 360  0004 72120000      	bset	_Flag1_,#1
 361                     ; 91 	count_1s++;
 363  0008 725c0000      	inc	L331_count_1s
 364                     ; 93 	if (count_1s >= 10){
 366  000c c60000        	ld	a,L331_count_1s
 367  000f a10a          	cp	a,#10
 368  0011 2508          	jrult	L151
 369                     ; 94 		count_1s = 0;
 371  0013 725f0000      	clr	L331_count_1s
 372                     ; 95 		f_1s = 1;
 374  0017 72160000      	bset	_Flag1_,#3
 375  001b               L151:
 376                     ; 100 }
 379  001b 80            	iret
 391                     	xref	_swuart_frame
 392                     	xdef	f_Timer2_ISR
 393                     	xdef	f_Timer4_ISR
 394                     	xdef	_timer2_init
 395                     	xdef	_timer4_init
 396                     	switch	.bss
 397  0000               _Flag1_:
 398  0000 00            	ds.b	1
 399                     	xdef	_Flag1_
 400                     	xref	_TIM2_ClearFlag
 401                     	xref	_TIM2_ITConfig
 402                     	xref	_TIM2_Cmd
 403                     	xref	_TIM2_TimeBaseInit
 423                     	end
