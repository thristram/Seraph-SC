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
  76                     ; 40 	sc.HWTtest = 0xC0;
  78  0001 35c00007      	mov	_sc+7,#192
  79                     ; 41 	for(i = 0; i < 15; i++){
  81  0005 0f02          	clr	(OFST+0,sp)
  82  0007               L73:
  83                     ; 42 		for(j = 0; j < 4;j++){
  85  0007 0f01          	clr	(OFST-1,sp)
  86  0009               L54:
  87                     ; 43 			sc.slc[i].deviceid[j] = 0x00;
  89  0009 7b02          	ld	a,(OFST+0,sp)
  90  000b 97            	ld	xl,a
  91  000c a61a          	ld	a,#26
  92  000e 42            	mul	x,a
  93  000f 01            	rrwa	x,a
  94  0010 1b01          	add	a,(OFST-1,sp)
  95  0012 2401          	jrnc	L6
  96  0014 5c            	incw	x
  97  0015               L6:
  98  0015 02            	rlwa	x,a
  99  0016 724f01bf      	clr	(_sc+447,x)
 100                     ; 44 			sc.spc[i].deviceid[j] = 0x00;
 102  001a 7b02          	ld	a,(OFST+0,sp)
 103  001c 97            	ld	xl,a
 104  001d a61c          	ld	a,#28
 105  001f 42            	mul	x,a
 106  0020 01            	rrwa	x,a
 107  0021 1b01          	add	a,(OFST-1,sp)
 108  0023 2401          	jrnc	L01
 109  0025 5c            	incw	x
 110  0026               L01:
 111  0026 02            	rlwa	x,a
 112  0027 724f001b      	clr	(_sc+27,x)
 113                     ; 42 		for(j = 0; j < 4;j++){
 115  002b 0c01          	inc	(OFST-1,sp)
 118  002d 7b01          	ld	a,(OFST-1,sp)
 119  002f a104          	cp	a,#4
 120  0031 25d6          	jrult	L54
 121                     ; 46 		sc.slc[i].firmware = 0x00;
 123  0033 7b02          	ld	a,(OFST+0,sp)
 124  0035 97            	ld	xl,a
 125  0036 a61a          	ld	a,#26
 126  0038 42            	mul	x,a
 127  0039 724f01c3      	clr	(_sc+451,x)
 128                     ; 47 		sc.slc[i].HWTtest = 0xC0;
 130  003d 7b02          	ld	a,(OFST+0,sp)
 131  003f 97            	ld	xl,a
 132  0040 a61a          	ld	a,#26
 133  0042 42            	mul	x,a
 134  0043 a6c0          	ld	a,#192
 135  0045 d701c4        	ld	(_sc+452,x),a
 136                     ; 48 		sc.slc[i].MDID = 0x00;
 138  0048 7b02          	ld	a,(OFST+0,sp)
 139  004a 97            	ld	xl,a
 140  004b a61a          	ld	a,#26
 141  004d 42            	mul	x,a
 142  004e 905f          	clrw	y
 143  0050 df01d0        	ldw	(_sc+464,x),y
 144                     ; 49 		sc.slc[i].model = 0x00;
 146  0053 7b02          	ld	a,(OFST+0,sp)
 147  0055 97            	ld	xl,a
 148  0056 a61a          	ld	a,#26
 149  0058 42            	mul	x,a
 150  0059 724f01c5      	clr	(_sc+453,x)
 151                     ; 50 		sc.slc[i].flag._flag_byte = 0x00;
 153  005d 7b02          	ld	a,(OFST+0,sp)
 154  005f 97            	ld	xl,a
 155  0060 a61a          	ld	a,#26
 156  0062 42            	mul	x,a
 157  0063 724f01d6      	clr	(_sc+470,x)
 158                     ; 51 		sc.slc[i].ch1_status = 0x00;
 160  0067 7b02          	ld	a,(OFST+0,sp)
 161  0069 97            	ld	xl,a
 162  006a a61a          	ld	a,#26
 163  006c 42            	mul	x,a
 164  006d 724f01d2      	clr	(_sc+466,x)
 165                     ; 52 		sc.slc[i].ch2_status = 0x00;
 167  0071 7b02          	ld	a,(OFST+0,sp)
 168  0073 97            	ld	xl,a
 169  0074 a61a          	ld	a,#26
 170  0076 42            	mul	x,a
 171  0077 724f01d3      	clr	(_sc+467,x)
 172                     ; 53 		sc.slc[i].ch3_status = 0x00;
 174  007b 7b02          	ld	a,(OFST+0,sp)
 175  007d 97            	ld	xl,a
 176  007e a61a          	ld	a,#26
 177  0080 42            	mul	x,a
 178  0081 724f01d4      	clr	(_sc+468,x)
 179                     ; 54 		sc.slc[i].ch4_status = 0x00;
 181  0085 7b02          	ld	a,(OFST+0,sp)
 182  0087 97            	ld	xl,a
 183  0088 a61a          	ld	a,#26
 184  008a 42            	mul	x,a
 185  008b 724f01d5      	clr	(_sc+469,x)
 186                     ; 55 		sc.spc[i].firmware = 0x00;
 188  008f 7b02          	ld	a,(OFST+0,sp)
 189  0091 97            	ld	xl,a
 190  0092 a61c          	ld	a,#28
 191  0094 42            	mul	x,a
 192  0095 724f001f      	clr	(_sc+31,x)
 193                     ; 56 		sc.spc[i].HWTtest = 0xC0;
 195  0099 7b02          	ld	a,(OFST+0,sp)
 196  009b 97            	ld	xl,a
 197  009c a61c          	ld	a,#28
 198  009e 42            	mul	x,a
 199  009f a6c0          	ld	a,#192
 200  00a1 d70020        	ld	(_sc+32,x),a
 201                     ; 57 		sc.spc[i].MDID = 0x00;
 203  00a4 7b02          	ld	a,(OFST+0,sp)
 204  00a6 97            	ld	xl,a
 205  00a7 a61c          	ld	a,#28
 206  00a9 42            	mul	x,a
 207  00aa 905f          	clrw	y
 208  00ac df002c        	ldw	(_sc+44,x),y
 209                     ; 58 		sc.spc[i].model = 0x00;
 211  00af 7b02          	ld	a,(OFST+0,sp)
 212  00b1 97            	ld	xl,a
 213  00b2 a61c          	ld	a,#28
 214  00b4 42            	mul	x,a
 215  00b5 724f0021      	clr	(_sc+33,x)
 216                     ; 59 		sc.spc[i].flag._flag_byte = 0x00;
 218  00b9 7b02          	ld	a,(OFST+0,sp)
 219  00bb 97            	ld	xl,a
 220  00bc a61c          	ld	a,#28
 221  00be 42            	mul	x,a
 222  00bf 724f0034      	clr	(_sc+52,x)
 223                     ; 60 		sc.spc[i].energy_consum = 0x0000;
 225  00c3 7b02          	ld	a,(OFST+0,sp)
 226  00c5 97            	ld	xl,a
 227  00c6 a61c          	ld	a,#28
 228  00c8 42            	mul	x,a
 229  00c9 905f          	clrw	y
 230  00cb df0032        	ldw	(_sc+50,x),y
 231                     ; 61 		sc.spc[i].ch1_status = 0x00;
 233  00ce 7b02          	ld	a,(OFST+0,sp)
 234  00d0 97            	ld	xl,a
 235  00d1 a61c          	ld	a,#28
 236  00d3 42            	mul	x,a
 237  00d4 724f002e      	clr	(_sc+46,x)
 238                     ; 62 		sc.spc[i].ch2_status = 0x00;
 240  00d8 7b02          	ld	a,(OFST+0,sp)
 241  00da 97            	ld	xl,a
 242  00db a61c          	ld	a,#28
 243  00dd 42            	mul	x,a
 244  00de 724f002f      	clr	(_sc+47,x)
 245                     ; 63 		sc.spc[i].ch3_status = 0x00;
 247  00e2 7b02          	ld	a,(OFST+0,sp)
 248  00e4 97            	ld	xl,a
 249  00e5 a61c          	ld	a,#28
 250  00e7 42            	mul	x,a
 251  00e8 724f0030      	clr	(_sc+48,x)
 252                     ; 64 		sc.spc[i].ch4_status = 0x00;	
 254  00ec 7b02          	ld	a,(OFST+0,sp)
 255  00ee 97            	ld	xl,a
 256  00ef a61c          	ld	a,#28
 257  00f1 42            	mul	x,a
 258  00f2 724f0031      	clr	(_sc+49,x)
 259                     ; 41 	for(i = 0; i < 15; i++){
 261  00f6 0c02          	inc	(OFST+0,sp)
 264  00f8 7b02          	ld	a,(OFST+0,sp)
 265  00fa a10f          	cp	a,#15
 266  00fc 2403          	jruge	L21
 267  00fe cc0007        	jp	L73
 268  0101               L21:
 269                     ; 66 }
 272  0101 85            	popw	x
 273  0102 81            	ret
 340                     ; 76 void main (void) { 
 341                     .text:	section	.text,new
 342  0000               _main:
 344  0000 5204          	subw	sp,#4
 345       00000004      OFST:	set	4
 348                     ; 77 	int ret,i,j,k,slave_num = 0;
 350  0002 5f            	clrw	x
 351  0003 1f01          	ldw	(OFST-3,sp),x
 352                     ; 81   CLK->SWCR |= 0x02; //开启切换
 354  0005 721250c5      	bset	20677,#1
 355                     ; 82   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 357  0009 35b450c4      	mov	20676,#180
 359  000d               L57:
 360                     ; 83   while((CLK->SWCR & 0x01)==0x01);
 362  000d c650c5        	ld	a,20677
 363  0010 a401          	and	a,#1
 364  0012 a101          	cp	a,#1
 365  0014 27f7          	jreq	L57
 366                     ; 84   CLK->CKDIVR = 0x80;    //不分频
 368  0016 358050c6      	mov	20678,#128
 369                     ; 85   CLK->SWCR  &= ~0x02; //关闭切换
 371  001a 721350c5      	bres	20677,#1
 372                     ; 87   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 374  001e 4be0          	push	#224
 375  0020 4b08          	push	#8
 376  0022 ae5005        	ldw	x,#20485
 377  0025 cd0000        	call	_GPIO_Init
 379  0028 85            	popw	x
 380                     ; 88 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 382  0029 4be0          	push	#224
 383  002b 4b04          	push	#4
 384  002d ae5005        	ldw	x,#20485
 385  0030 cd0000        	call	_GPIO_Init
 387  0033 85            	popw	x
 388                     ; 89 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 390  0034 4b08          	push	#8
 391  0036 ae5005        	ldw	x,#20485
 392  0039 cd0000        	call	_GPIO_WriteHigh
 394  003c 84            	pop	a
 395                     ; 90 	enableInterrupts();
 398  003d 9a            rim
 400                     ; 91 	Init_Time4();
 403  003e cd0000        	call	_Init_Time4
 405                     ; 93 	Init_uart2();
 407  0041 cd0000        	call	_Init_uart2
 409                     ; 95 	I2C_Config();
 411  0044 cd0000        	call	_I2C_Config
 413                     ; 96 	sys_init();
 415  0047 cd0000        	call	_sys_init
 417  004a               L101:
 418                     ; 280 		if(!init_slc_spc_done){
 420  004a 725d0015      	tnz	_init_slc_spc_done
 421  004e 260d          	jrne	L501
 422                     ; 281 		scan_device();
 424  0050 cd0000        	call	_scan_device
 426                     ; 282 		i2c_device_info();
 428  0053 cd0000        	call	_i2c_device_info
 430                     ; 283 		send_device_info();
 432  0056 cd0000        	call	_send_device_info
 434                     ; 284 		init_slc_spc_done = 1;
 436  0059 35010015      	mov	_init_slc_spc_done,#1
 437  005d               L501:
 438                     ; 287 		if(f_100ms){
 440  005d c60000        	ld	a,_Flag1_
 441  0060 a502          	bcp	a,#2
 442  0062 2746          	jreq	L701
 443                     ; 288 			f_100ms = 0;
 445  0064 72130000      	bres	_Flag1_,#1
 446                     ; 289 			if(action_dimmer_ext > 0)	{
 448  0068 725d0000      	tnz	_action_dimmer_ext
 449  006c 2739          	jreq	L111
 450                     ; 290 				action_dimmer_ext -= 1;
 452  006e 725a0000      	dec	_action_dimmer_ext
 453                     ; 291 				if(action_dimmer_ext == 0){
 455  0072 725d0000      	tnz	_action_dimmer_ext
 456  0076 262f          	jrne	L111
 457                     ; 293 					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
 459  0078 c60000        	ld	a,_action_dimmer_MDID
 460  007b cd0000        	call	_i2c_single_action_dimmer_result
 462  007e 5f            	clrw	x
 463  007f 97            	ld	xl,a
 464  0080 1f03          	ldw	(OFST-1,sp),x
 465                     ; 294 					if(ret == IIC_SUCCESS) {
 467  0082 1e03          	ldw	x,(OFST-1,sp)
 468  0084 2621          	jrne	L111
 469                     ; 295 						action_dimmer_MDID = 0x00;
 471  0086 725f0000      	clr	_action_dimmer_MDID
 472                     ; 296 						delay(10);
 474  008a ae000a        	ldw	x,#10
 475  008d cd0000        	call	_delay
 477                     ; 297 						sicp_receipt_Done(0x05,rev_ad_message_id,ns_own_meshid_H,ns_own_meshid_L,0x01,rev_ad_mdid);
 479  0090 3b0000        	push	_rev_ad_mdid
 480  0093 4b01          	push	#1
 481  0095 3b0000        	push	_ns_own_meshid_L
 482  0098 3b0000        	push	_ns_own_meshid_H
 483  009b c60000        	ld	a,_rev_ad_message_id
 484  009e 97            	ld	xl,a
 485  009f a605          	ld	a,#5
 486  00a1 95            	ld	xh,a
 487  00a2 cd0000        	call	_sicp_receipt_Done
 489  00a5 5b04          	addw	sp,#4
 490  00a7               L111:
 491                     ; 301 			rev_anaylze();
 493  00a7 cd0000        	call	_rev_anaylze
 495  00aa               L701:
 496                     ; 308 		if(f_1s){
 498  00aa c60000        	ld	a,_Flag1_
 499  00ad a508          	bcp	a,#8
 500  00af 2799          	jreq	L101
 501                     ; 309 			f_1s = 0;
 503  00b1 72170000      	bres	_Flag1_,#3
 504                     ; 310 			tick_5s++;
 506  00b5 725c0000      	inc	_tick_5s
 507                     ; 311 			check_send_repeatedly();
 509  00b9 cd0000        	call	_check_send_repeatedly
 511                     ; 312 			report_energy_consum();
 513  00bc cd0000        	call	_report_energy_consum
 515                     ; 313 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 517  00bf c60000        	ld	a,_tick_5s
 518  00c2 a105          	cp	a,#5
 519  00c4 2507          	jrult	L121
 522  00c6 725f0000      	clr	_tick_5s
 525  00ca cd0000        	call	_i2c_heartbeat
 527  00cd               L121:
 528                     ; 314 			send_malfunction();
 530  00cd cd0000        	call	_send_malfunction
 532                     ; 315 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 534  00d0 4b08          	push	#8
 535  00d2 ae5005        	ldw	x,#20485
 536  00d5 cd0000        	call	_GPIO_WriteReverse
 538  00d8 84            	pop	a
 539  00d9 ac4a004a      	jpf	L101
 574                     ; 329 void assert_failed(uint8_t* file, uint32_t line)
 574                     ; 330 { 
 575                     .text:	section	.text,new
 576  0000               _assert_failed:
 580  0000               L141:
 581  0000 20fe          	jra	L141
 651                     	xdef	_main
 652                     	xref	_delay
 653                     	switch	.bss
 654  0000               _tick_5s:
 655  0000 00            	ds.b	1
 656                     	xdef	_tick_5s
 657  0001               _read_buffer:
 658  0001 000000000000  	ds.b	10
 659                     	xdef	_read_buffer
 660  000b               _write_buffer:
 661  000b 000000000000  	ds.b	10
 662                     	xdef	_write_buffer
 663                     	xdef	_IIC_ErrorStr
 664                     	xdef	_DUMMY_INIT
 665                     	xref	_i2c_single_action_dimmer_result
 666                     	xref	_i2c_heartbeat
 667                     	xref	_i2c_device_info
 668                     	xref	_scan_device
 669                     	xref	_action_dimmer_ext
 670                     	xref	_action_dimmer_MDID
 671  0015               _init_slc_spc_done:
 672  0015 00            	ds.b	1
 673                     	xdef	_init_slc_spc_done
 674                     	xdef	_sys_init
 675                     	xref	_check_send_repeatedly
 676                     	xref	_send_malfunction
 677                     	xref	_send_device_info
 678                     	xref	_report_energy_consum
 679                     	xref	_sicp_receipt_Done
 680                     	xref	_rev_anaylze
 681                     	xref	_Init_uart2
 682                     	xref	_rev_ad_mdid
 683                     	xref	_rev_ad_message_id
 684                     	xref	_ns_own_meshid_L
 685                     	xref	_ns_own_meshid_H
 686                     	xref	_sc
 687                     	xref	_Init_Time4
 688                     	xref	_Flag1_
 689                     	xref	_I2C_Config
 690                     	xdef	_assert_failed
 691                     	xref	_GPIO_WriteReverse
 692                     	xref	_GPIO_WriteHigh
 693                     	xref	_GPIO_Init
 694                     	switch	.const
 695  000a               L11:
 696  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 697  001c               L7:
 698  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 699  002b               L5:
 700  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 701  003e               L3:
 702  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 722                     	end
