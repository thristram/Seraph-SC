   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _DUMMY_INIT:
   6  0000 10            	dc.b	16
   7  0001 20            	dc.b	32
   8  0002 30            	dc.b	48
   9  0003 40            	dc.b	64
  10  0004 50            	dc.b	80
  11  0005 60            	dc.b	96
  12  0006 70            	dc.b	112
  13  0007 80            	dc.b	128
  14  0008 90            	dc.b	144
  15  0009 a0            	dc.b	160
  16                     	bsct
  17  0000               _IIC_ErrorStr:
  18  0000 004c          	dc.w	L3
  19  0002 0039          	dc.w	L5
  20  0004 002a          	dc.w	L7
  21  0006 0018          	dc.w	L11
  71                     ; 41 void main (void) { 
  73                     .text:	section	.text,new
  74  0000               _main:
  76  0000 89            	pushw	x
  77       00000002      OFST:	set	2
  80                     ; 42 	int ret,i,j,k,slave_num = 0;
  82  0001 5f            	clrw	x
  83  0002 1f01          	ldw	(OFST-1,sp),x
  84                     ; 46   CLK->SWCR |= 0x02; //开启切换
  86  0004 721250c5      	bset	20677,#1
  87                     ; 47   CLK->SWR   = 0xb4;       //选择时钟为外部8M
  89  0008 35b450c4      	mov	20676,#180
  91  000c               L34:
  92                     ; 48   while((CLK->SWCR & 0x01)==0x01);
  94  000c c650c5        	ld	a,20677
  95  000f a401          	and	a,#1
  96  0011 a101          	cp	a,#1
  97  0013 27f7          	jreq	L34
  98                     ; 49   CLK->CKDIVR = 0x80;    //不分频
 100  0015 358050c6      	mov	20678,#128
 101                     ; 50   CLK->SWCR  &= ~0x02; //关闭切换
 103  0019 721350c5      	bres	20677,#1
 104                     ; 52   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 106  001d 4be0          	push	#224
 107  001f 4b08          	push	#8
 108  0021 ae5000        	ldw	x,#20480
 109  0024 cd0000        	call	_GPIO_Init
 111  0027 85            	popw	x
 112                     ; 53 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 114  0028 4b08          	push	#8
 115  002a ae5000        	ldw	x,#20480
 116  002d cd0000        	call	_GPIO_WriteHigh
 118  0030 84            	pop	a
 119                     ; 54 	Init_Time4();
 121  0031 cd0000        	call	_Init_Time4
 123                     ; 55 	enableInterrupts();
 126  0034 9a            rim
 128                     ; 56 	TIM4->CR1 |= 0x01;//使能计数器
 131  0035 72105340      	bset	21312,#0
 132                     ; 58 	Init_UART1();
 134  0039 cd0000        	call	_Init_UART1
 136  003c               L74:
 137                     ; 238 		if(f_300ms){
 139  003c b600          	ld	a,_Flag1_
 140  003e a504          	bcp	a,#4
 141  0040 270a          	jreq	L35
 142                     ; 239 			f_300ms = 0;
 144  0042 72150000      	bres	_Flag1_,#2
 145                     ; 240 			UART1_Send_Data_Init();
 147  0046 cd0000        	call	_UART1_Send_Data_Init
 149                     ; 241 			UART1_Send_Data_Start();
 151  0049 cd0000        	call	_UART1_Send_Data_Start
 153  004c               L35:
 154                     ; 244 		if(f_1s){
 156  004c b600          	ld	a,_Flag1_
 157  004e a508          	bcp	a,#8
 158  0050 27ea          	jreq	L74
 159                     ; 245 			f_1s = 0;
 161  0052 72170000      	bres	_Flag1_,#3
 162                     ; 246 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 164  0056 4b08          	push	#8
 165  0058 ae5000        	ldw	x,#20480
 166  005b cd0000        	call	_GPIO_WriteReverse
 168  005e 84            	pop	a
 169                     ; 247 			printf("Hello World!\n");
 171  005f ae000a        	ldw	x,#L75
 172  0062 cd0000        	call	_printf
 174  0065 20d5          	jra	L74
 209                     ; 261 void assert_failed(uint8_t* file, uint32_t line)
 209                     ; 262 { 
 210                     .text:	section	.text,new
 211  0000               _assert_failed:
 215  0000               L77:
 216  0000 20fe          	jra	L77
 272                     	xdef	_main
 273                     	switch	.ubsct
 274  0000               _read_buffer:
 275  0000 000000000000  	ds.b	10
 276                     	xdef	_read_buffer
 277  000a               _write_buffer:
 278  000a 000000000000  	ds.b	10
 279                     	xdef	_write_buffer
 280                     	xdef	_IIC_ErrorStr
 281                     	xdef	_DUMMY_INIT
 282                     	xref	_printf
 283                     	xref	_UART1_Send_Data_Start
 284                     	xref	_UART1_Send_Data_Init
 285                     	xref	_Init_UART1
 286                     	xref	_Init_Time4
 287                     	xref.b	_Flag1_
 288                     	xdef	_assert_failed
 289                     	xref	_GPIO_WriteReverse
 290                     	xref	_GPIO_WriteHigh
 291                     	xref	_GPIO_Init
 292                     	switch	.const
 293  000a               L75:
 294  000a 48656c6c6f20  	dc.b	"Hello World!",10,0
 295  0018               L11:
 296  0018 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 297  002a               L7:
 298  002a 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 299  0039               L5:
 300  0039 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 301  004c               L3:
 302  004c 4949435f5355  	dc.b	"IIC_SUCCESS",0
 322                     	end
