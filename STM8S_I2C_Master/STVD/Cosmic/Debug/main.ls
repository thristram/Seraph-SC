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
  16                     	switch	.data
  17  0000               _IIC_ErrorStr:
  18  0000 003e          	dc.w	L3
  19  0002 002b          	dc.w	L5
  20  0004 001c          	dc.w	L7
  21  0006 000a          	dc.w	L11
  67                     ; 37 void sys_init(void)
  67                     ; 38 {
  69                     .text:	section	.text,new
  70  0000               _sys_init:
  72  0000 89            	pushw	x
  73       00000002      OFST:	set	2
  76                     ; 40 	for(i = 0; i < 15; i++){
  78  0001 0f02          	clr	(OFST+0,sp)
  79  0003               L73:
  80                     ; 41 		for(j = 0; j < 4;j++){
  82  0003 0f01          	clr	(OFST-1,sp)
  83  0005               L54:
  84                     ; 42 			sc.slc[i].deviceid[j] = 0x00;
  86  0005 7b02          	ld	a,(OFST+0,sp)
  87  0007 97            	ld	xl,a
  88  0008 a61a          	ld	a,#26
  89  000a 42            	mul	x,a
  90  000b 01            	rrwa	x,a
  91  000c 1b01          	add	a,(OFST-1,sp)
  92  000e 2401          	jrnc	L6
  93  0010 5c            	incw	x
  94  0011               L6:
  95  0011 02            	rlwa	x,a
  96  0012 724f01bf      	clr	(_sc+447,x)
  97                     ; 43 			sc.spc[i].deviceid[j] = 0x00;
  99  0016 7b02          	ld	a,(OFST+0,sp)
 100  0018 97            	ld	xl,a
 101  0019 a61c          	ld	a,#28
 102  001b 42            	mul	x,a
 103  001c 01            	rrwa	x,a
 104  001d 1b01          	add	a,(OFST-1,sp)
 105  001f 2401          	jrnc	L01
 106  0021 5c            	incw	x
 107  0022               L01:
 108  0022 02            	rlwa	x,a
 109  0023 724f001b      	clr	(_sc+27,x)
 110                     ; 41 		for(j = 0; j < 4;j++){
 112  0027 0c01          	inc	(OFST-1,sp)
 115  0029 7b01          	ld	a,(OFST-1,sp)
 116  002b a104          	cp	a,#4
 117  002d 25d6          	jrult	L54
 118                     ; 45 		sc.slc[i].firmware = 0x00;
 120  002f 7b02          	ld	a,(OFST+0,sp)
 121  0031 97            	ld	xl,a
 122  0032 a61a          	ld	a,#26
 123  0034 42            	mul	x,a
 124  0035 724f01c3      	clr	(_sc+451,x)
 125                     ; 46 		sc.slc[i].HWTtest = 0x00;
 127  0039 7b02          	ld	a,(OFST+0,sp)
 128  003b 97            	ld	xl,a
 129  003c a61a          	ld	a,#26
 130  003e 42            	mul	x,a
 131  003f 724f01c4      	clr	(_sc+452,x)
 132                     ; 47 		sc.slc[i].MDID = 0x00;
 134  0043 7b02          	ld	a,(OFST+0,sp)
 135  0045 97            	ld	xl,a
 136  0046 a61a          	ld	a,#26
 137  0048 42            	mul	x,a
 138  0049 905f          	clrw	y
 139  004b df01d0        	ldw	(_sc+464,x),y
 140                     ; 48 		sc.slc[i].model = 0x00;
 142  004e 7b02          	ld	a,(OFST+0,sp)
 143  0050 97            	ld	xl,a
 144  0051 a61a          	ld	a,#26
 145  0053 42            	mul	x,a
 146  0054 724f01c5      	clr	(_sc+453,x)
 147                     ; 49 		sc.slc[i].flag._flag_byte = 0x00;
 149  0058 7b02          	ld	a,(OFST+0,sp)
 150  005a 97            	ld	xl,a
 151  005b a61a          	ld	a,#26
 152  005d 42            	mul	x,a
 153  005e 724f01d6      	clr	(_sc+470,x)
 154                     ; 50 		sc.slc[i].ch1_status = 0x00;
 156  0062 7b02          	ld	a,(OFST+0,sp)
 157  0064 97            	ld	xl,a
 158  0065 a61a          	ld	a,#26
 159  0067 42            	mul	x,a
 160  0068 724f01d2      	clr	(_sc+466,x)
 161                     ; 51 		sc.slc[i].ch2_status = 0x00;
 163  006c 7b02          	ld	a,(OFST+0,sp)
 164  006e 97            	ld	xl,a
 165  006f a61a          	ld	a,#26
 166  0071 42            	mul	x,a
 167  0072 724f01d3      	clr	(_sc+467,x)
 168                     ; 52 		sc.slc[i].ch3_status = 0x00;
 170  0076 7b02          	ld	a,(OFST+0,sp)
 171  0078 97            	ld	xl,a
 172  0079 a61a          	ld	a,#26
 173  007b 42            	mul	x,a
 174  007c 724f01d4      	clr	(_sc+468,x)
 175                     ; 53 		sc.slc[i].ch4_status = 0x00;
 177  0080 7b02          	ld	a,(OFST+0,sp)
 178  0082 97            	ld	xl,a
 179  0083 a61a          	ld	a,#26
 180  0085 42            	mul	x,a
 181  0086 724f01d5      	clr	(_sc+469,x)
 182                     ; 54 		sc.spc[i].firmware = 0x00;
 184  008a 7b02          	ld	a,(OFST+0,sp)
 185  008c 97            	ld	xl,a
 186  008d a61c          	ld	a,#28
 187  008f 42            	mul	x,a
 188  0090 724f001f      	clr	(_sc+31,x)
 189                     ; 55 		sc.spc[i].HWTtest = 0x00;
 191  0094 7b02          	ld	a,(OFST+0,sp)
 192  0096 97            	ld	xl,a
 193  0097 a61c          	ld	a,#28
 194  0099 42            	mul	x,a
 195  009a 724f0020      	clr	(_sc+32,x)
 196                     ; 56 		sc.spc[i].MDID = 0x00;
 198  009e 7b02          	ld	a,(OFST+0,sp)
 199  00a0 97            	ld	xl,a
 200  00a1 a61c          	ld	a,#28
 201  00a3 42            	mul	x,a
 202  00a4 905f          	clrw	y
 203  00a6 df002c        	ldw	(_sc+44,x),y
 204                     ; 57 		sc.spc[i].model = 0x00;
 206  00a9 7b02          	ld	a,(OFST+0,sp)
 207  00ab 97            	ld	xl,a
 208  00ac a61c          	ld	a,#28
 209  00ae 42            	mul	x,a
 210  00af 724f0021      	clr	(_sc+33,x)
 211                     ; 58 		sc.spc[i].flag._flag_byte = 0x00;
 213  00b3 7b02          	ld	a,(OFST+0,sp)
 214  00b5 97            	ld	xl,a
 215  00b6 a61c          	ld	a,#28
 216  00b8 42            	mul	x,a
 217  00b9 724f0034      	clr	(_sc+52,x)
 218                     ; 59 		sc.spc[i].energy_consum = 0x0000;
 220  00bd 7b02          	ld	a,(OFST+0,sp)
 221  00bf 97            	ld	xl,a
 222  00c0 a61c          	ld	a,#28
 223  00c2 42            	mul	x,a
 224  00c3 905f          	clrw	y
 225  00c5 df0032        	ldw	(_sc+50,x),y
 226                     ; 60 		sc.spc[i].ch1_status = 0x00;
 228  00c8 7b02          	ld	a,(OFST+0,sp)
 229  00ca 97            	ld	xl,a
 230  00cb a61c          	ld	a,#28
 231  00cd 42            	mul	x,a
 232  00ce 724f002e      	clr	(_sc+46,x)
 233                     ; 61 		sc.spc[i].ch2_status = 0x00;
 235  00d2 7b02          	ld	a,(OFST+0,sp)
 236  00d4 97            	ld	xl,a
 237  00d5 a61c          	ld	a,#28
 238  00d7 42            	mul	x,a
 239  00d8 724f002f      	clr	(_sc+47,x)
 240                     ; 62 		sc.spc[i].ch3_status = 0x00;
 242  00dc 7b02          	ld	a,(OFST+0,sp)
 243  00de 97            	ld	xl,a
 244  00df a61c          	ld	a,#28
 245  00e1 42            	mul	x,a
 246  00e2 724f0030      	clr	(_sc+48,x)
 247                     ; 63 		sc.spc[i].ch4_status = 0x00;	
 249  00e6 7b02          	ld	a,(OFST+0,sp)
 250  00e8 97            	ld	xl,a
 251  00e9 a61c          	ld	a,#28
 252  00eb 42            	mul	x,a
 253  00ec 724f0031      	clr	(_sc+49,x)
 254                     ; 40 	for(i = 0; i < 15; i++){
 256  00f0 0c02          	inc	(OFST+0,sp)
 259  00f2 7b02          	ld	a,(OFST+0,sp)
 260  00f4 a10f          	cp	a,#15
 261  00f6 2403          	jruge	L21
 262  00f8 cc0003        	jp	L73
 263  00fb               L21:
 264                     ; 65 }
 267  00fb 85            	popw	x
 268  00fc 81            	ret
 318                     ; 75 void main (void) { 
 319                     .text:	section	.text,new
 320  0000               _main:
 322  0000 89            	pushw	x
 323       00000002      OFST:	set	2
 326                     ; 76 	int ret,i,j,k,slave_num = 0;
 328  0001 5f            	clrw	x
 329  0002 1f01          	ldw	(OFST-1,sp),x
 330                     ; 80   CLK->SWCR |= 0x02; //开启切换
 332  0004 721250c5      	bset	20677,#1
 333                     ; 81   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 335  0008 35b450c4      	mov	20676,#180
 337  000c               L37:
 338                     ; 82   while((CLK->SWCR & 0x01)==0x01);
 340  000c c650c5        	ld	a,20677
 341  000f a401          	and	a,#1
 342  0011 a101          	cp	a,#1
 343  0013 27f7          	jreq	L37
 344                     ; 83   CLK->CKDIVR = 0x80;    //不分频
 346  0015 358050c6      	mov	20678,#128
 347                     ; 84   CLK->SWCR  &= ~0x02; //关闭切换
 349  0019 721350c5      	bres	20677,#1
 350                     ; 86   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 352  001d 4be0          	push	#224
 353  001f 4b08          	push	#8
 354  0021 ae5005        	ldw	x,#20485
 355  0024 cd0000        	call	_GPIO_Init
 357  0027 85            	popw	x
 358                     ; 87 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 360  0028 4be0          	push	#224
 361  002a 4b04          	push	#4
 362  002c ae5005        	ldw	x,#20485
 363  002f cd0000        	call	_GPIO_Init
 365  0032 85            	popw	x
 366                     ; 88 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 368  0033 4b08          	push	#8
 369  0035 ae5005        	ldw	x,#20485
 370  0038 cd0000        	call	_GPIO_WriteHigh
 372  003b 84            	pop	a
 373                     ; 89 	enableInterrupts();
 376  003c 9a            rim
 378                     ; 90 	Init_Time4();
 381  003d cd0000        	call	_Init_Time4
 383                     ; 92 	Init_uart2();
 385  0040 cd0000        	call	_Init_uart2
 387                     ; 94 	I2C_Config();
 389  0043 cd0000        	call	_I2C_Config
 391  0046               L77:
 392                     ; 278 		if(!init_slc_spc_done){
 394  0046 725d0015      	tnz	_init_slc_spc_done
 395  004a 260d          	jrne	L301
 396                     ; 279 		scan_device();
 398  004c cd0000        	call	_scan_device
 400                     ; 280 		i2c_device_info();
 402  004f cd0000        	call	_i2c_device_info
 404                     ; 281 		send_device_info();
 406  0052 cd0000        	call	_send_device_info
 408                     ; 282 		init_slc_spc_done = 1;
 410  0055 35010015      	mov	_init_slc_spc_done,#1
 411  0059               L301:
 412                     ; 285 		if(f_100ms){
 414  0059 c60000        	ld	a,_Flag1_
 415  005c a502          	bcp	a,#2
 416  005e 2707          	jreq	L501
 417                     ; 286 			f_100ms = 0;
 419  0060 72130000      	bres	_Flag1_,#1
 420                     ; 287 			rev_anaylze();
 422  0064 cd0000        	call	_rev_anaylze
 424  0067               L501:
 425                     ; 294 		if(f_1s){
 427  0067 c60000        	ld	a,_Flag1_
 428  006a a508          	bcp	a,#8
 429  006c 27d8          	jreq	L77
 430                     ; 295 			f_1s = 0;
 432  006e 72170000      	bres	_Flag1_,#3
 433                     ; 296 			tick_5s++;
 435  0072 725c0000      	inc	_tick_5s
 436                     ; 297 			check_send_repeatedly();
 438  0076 cd0000        	call	_check_send_repeatedly
 440                     ; 298 			report_energy_consum();
 442  0079 cd0000        	call	_report_energy_consum
 444                     ; 299 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 446  007c c60000        	ld	a,_tick_5s
 447  007f a105          	cp	a,#5
 448  0081 2507          	jrult	L111
 451  0083 725f0000      	clr	_tick_5s
 454  0087 cd0000        	call	_i2c_heartbeat
 456  008a               L111:
 457                     ; 300 			send_malfunction();
 459  008a cd0000        	call	_send_malfunction
 461                     ; 301 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 463  008d 4b08          	push	#8
 464  008f ae5005        	ldw	x,#20485
 465  0092 cd0000        	call	_GPIO_WriteReverse
 467  0095 84            	pop	a
 468  0096 20ae          	jra	L77
 503                     ; 315 void assert_failed(uint8_t* file, uint32_t line)
 503                     ; 316 { 
 504                     .text:	section	.text,new
 505  0000               _assert_failed:
 509  0000               L131:
 510  0000 20fe          	jra	L131
 580                     	xdef	_main
 581                     	switch	.bss
 582  0000               _tick_5s:
 583  0000 00            	ds.b	1
 584                     	xdef	_tick_5s
 585  0001               _read_buffer:
 586  0001 000000000000  	ds.b	10
 587                     	xdef	_read_buffer
 588  000b               _write_buffer:
 589  000b 000000000000  	ds.b	10
 590                     	xdef	_write_buffer
 591                     	xdef	_IIC_ErrorStr
 592                     	xdef	_DUMMY_INIT
 593                     	xref	_i2c_heartbeat
 594                     	xref	_i2c_device_info
 595                     	xref	_scan_device
 596  0015               _init_slc_spc_done:
 597  0015 00            	ds.b	1
 598                     	xdef	_init_slc_spc_done
 599                     	xdef	_sys_init
 600                     	xref	_check_send_repeatedly
 601                     	xref	_send_malfunction
 602                     	xref	_send_device_info
 603                     	xref	_report_energy_consum
 604                     	xref	_rev_anaylze
 605                     	xref	_Init_uart2
 606                     	xref	_sc
 607                     	xref	_Init_Time4
 608                     	xref	_Flag1_
 609                     	xref	_I2C_Config
 610                     	xdef	_assert_failed
 611                     	xref	_GPIO_WriteReverse
 612                     	xref	_GPIO_WriteHigh
 613                     	xref	_GPIO_Init
 614                     	switch	.const
 615  000a               L11:
 616  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 617  001c               L7:
 618  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 619  002b               L5:
 620  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 621  003e               L3:
 622  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 642                     	end
