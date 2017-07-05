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
  76                     ; 45 	sc.HWTtest = 0xC0;
  78  0001 35c00007      	mov	_sc+7,#192
  79                     ; 46 	sc.deviceid[0] = 0xAA;
  81  0005 35aa0002      	mov	_sc+2,#170
  82                     ; 47 	sc.deviceid[1] = 0x55;
  84  0009 35550003      	mov	_sc+3,#85
  85                     ; 48 	sc.deviceid[2] = 0xAB;
  87  000d 35ab0004      	mov	_sc+4,#171
  88                     ; 49 	sc.deviceid[3] = 0x56;
  90  0011 35560005      	mov	_sc+5,#86
  91                     ; 50 	for(i = 0; i < 15; i++){
  93  0015 0f02          	clr	(OFST+0,sp)
  94  0017               L73:
  95                     ; 51 		for(j = 0; j < 4;j++){
  97  0017 0f01          	clr	(OFST-1,sp)
  98  0019               L54:
  99                     ; 52 			sc.slc[i].deviceid[j] = 0x00;
 101  0019 7b02          	ld	a,(OFST+0,sp)
 102  001b 97            	ld	xl,a
 103  001c a61a          	ld	a,#26
 104  001e 42            	mul	x,a
 105  001f 01            	rrwa	x,a
 106  0020 1b01          	add	a,(OFST-1,sp)
 107  0022 2401          	jrnc	L6
 108  0024 5c            	incw	x
 109  0025               L6:
 110  0025 02            	rlwa	x,a
 111  0026 724f01bf      	clr	(_sc+447,x)
 112                     ; 53 			sc.spc[i].deviceid[j] = 0x00;
 114  002a 7b02          	ld	a,(OFST+0,sp)
 115  002c 97            	ld	xl,a
 116  002d a61c          	ld	a,#28
 117  002f 42            	mul	x,a
 118  0030 01            	rrwa	x,a
 119  0031 1b01          	add	a,(OFST-1,sp)
 120  0033 2401          	jrnc	L01
 121  0035 5c            	incw	x
 122  0036               L01:
 123  0036 02            	rlwa	x,a
 124  0037 724f001b      	clr	(_sc+27,x)
 125                     ; 51 		for(j = 0; j < 4;j++){
 127  003b 0c01          	inc	(OFST-1,sp)
 130  003d 7b01          	ld	a,(OFST-1,sp)
 131  003f a104          	cp	a,#4
 132  0041 25d6          	jrult	L54
 133                     ; 55 		sc.slc[i].firmware = 0x00;
 135  0043 7b02          	ld	a,(OFST+0,sp)
 136  0045 97            	ld	xl,a
 137  0046 a61a          	ld	a,#26
 138  0048 42            	mul	x,a
 139  0049 724f01c3      	clr	(_sc+451,x)
 140                     ; 56 		sc.slc[i].HWTtest = 0xC0;
 142  004d 7b02          	ld	a,(OFST+0,sp)
 143  004f 97            	ld	xl,a
 144  0050 a61a          	ld	a,#26
 145  0052 42            	mul	x,a
 146  0053 a6c0          	ld	a,#192
 147  0055 d701c4        	ld	(_sc+452,x),a
 148                     ; 57 		sc.slc[i].MDID = 0x00;
 150  0058 7b02          	ld	a,(OFST+0,sp)
 151  005a 97            	ld	xl,a
 152  005b a61a          	ld	a,#26
 153  005d 42            	mul	x,a
 154  005e 905f          	clrw	y
 155  0060 df01d0        	ldw	(_sc+464,x),y
 156                     ; 58 		sc.slc[i].model = 0x00;
 158  0063 7b02          	ld	a,(OFST+0,sp)
 159  0065 97            	ld	xl,a
 160  0066 a61a          	ld	a,#26
 161  0068 42            	mul	x,a
 162  0069 724f01c5      	clr	(_sc+453,x)
 163                     ; 59 		sc.slc[i].flag._flag_byte = 0x00;
 165  006d 7b02          	ld	a,(OFST+0,sp)
 166  006f 97            	ld	xl,a
 167  0070 a61a          	ld	a,#26
 168  0072 42            	mul	x,a
 169  0073 724f01d6      	clr	(_sc+470,x)
 170                     ; 60 		sc.slc[i].ch1_status = 0x00;
 172  0077 7b02          	ld	a,(OFST+0,sp)
 173  0079 97            	ld	xl,a
 174  007a a61a          	ld	a,#26
 175  007c 42            	mul	x,a
 176  007d 724f01d2      	clr	(_sc+466,x)
 177                     ; 61 		sc.slc[i].ch2_status = 0x00;
 179  0081 7b02          	ld	a,(OFST+0,sp)
 180  0083 97            	ld	xl,a
 181  0084 a61a          	ld	a,#26
 182  0086 42            	mul	x,a
 183  0087 724f01d3      	clr	(_sc+467,x)
 184                     ; 62 		sc.slc[i].ch3_status = 0x00;
 186  008b 7b02          	ld	a,(OFST+0,sp)
 187  008d 97            	ld	xl,a
 188  008e a61a          	ld	a,#26
 189  0090 42            	mul	x,a
 190  0091 724f01d4      	clr	(_sc+468,x)
 191                     ; 63 		sc.slc[i].ch4_status = 0x00;
 193  0095 7b02          	ld	a,(OFST+0,sp)
 194  0097 97            	ld	xl,a
 195  0098 a61a          	ld	a,#26
 196  009a 42            	mul	x,a
 197  009b 724f01d5      	clr	(_sc+469,x)
 198                     ; 64 		sc.spc[i].firmware = 0x00;
 200  009f 7b02          	ld	a,(OFST+0,sp)
 201  00a1 97            	ld	xl,a
 202  00a2 a61c          	ld	a,#28
 203  00a4 42            	mul	x,a
 204  00a5 724f001f      	clr	(_sc+31,x)
 205                     ; 65 		sc.spc[i].HWTtest = 0xC0;
 207  00a9 7b02          	ld	a,(OFST+0,sp)
 208  00ab 97            	ld	xl,a
 209  00ac a61c          	ld	a,#28
 210  00ae 42            	mul	x,a
 211  00af a6c0          	ld	a,#192
 212  00b1 d70020        	ld	(_sc+32,x),a
 213                     ; 66 		sc.spc[i].MDID = 0x00;
 215  00b4 7b02          	ld	a,(OFST+0,sp)
 216  00b6 97            	ld	xl,a
 217  00b7 a61c          	ld	a,#28
 218  00b9 42            	mul	x,a
 219  00ba 905f          	clrw	y
 220  00bc df002c        	ldw	(_sc+44,x),y
 221                     ; 67 		sc.spc[i].model = 0x00;
 223  00bf 7b02          	ld	a,(OFST+0,sp)
 224  00c1 97            	ld	xl,a
 225  00c2 a61c          	ld	a,#28
 226  00c4 42            	mul	x,a
 227  00c5 724f0021      	clr	(_sc+33,x)
 228                     ; 68 		sc.spc[i].flag._flag_byte = 0x00;
 230  00c9 7b02          	ld	a,(OFST+0,sp)
 231  00cb 97            	ld	xl,a
 232  00cc a61c          	ld	a,#28
 233  00ce 42            	mul	x,a
 234  00cf 724f0034      	clr	(_sc+52,x)
 235                     ; 69 		sc.spc[i].energy_consum = 0x0000;
 237  00d3 7b02          	ld	a,(OFST+0,sp)
 238  00d5 97            	ld	xl,a
 239  00d6 a61c          	ld	a,#28
 240  00d8 42            	mul	x,a
 241  00d9 905f          	clrw	y
 242  00db df0032        	ldw	(_sc+50,x),y
 243                     ; 70 		sc.spc[i].ch1_status = 0x00;
 245  00de 7b02          	ld	a,(OFST+0,sp)
 246  00e0 97            	ld	xl,a
 247  00e1 a61c          	ld	a,#28
 248  00e3 42            	mul	x,a
 249  00e4 724f002e      	clr	(_sc+46,x)
 250                     ; 71 		sc.spc[i].ch2_status = 0x00;
 252  00e8 7b02          	ld	a,(OFST+0,sp)
 253  00ea 97            	ld	xl,a
 254  00eb a61c          	ld	a,#28
 255  00ed 42            	mul	x,a
 256  00ee 724f002f      	clr	(_sc+47,x)
 257                     ; 72 		sc.spc[i].ch3_status = 0x00;
 259  00f2 7b02          	ld	a,(OFST+0,sp)
 260  00f4 97            	ld	xl,a
 261  00f5 a61c          	ld	a,#28
 262  00f7 42            	mul	x,a
 263  00f8 724f0030      	clr	(_sc+48,x)
 264                     ; 73 		sc.spc[i].ch4_status = 0x00;	
 266  00fc 7b02          	ld	a,(OFST+0,sp)
 267  00fe 97            	ld	xl,a
 268  00ff a61c          	ld	a,#28
 269  0101 42            	mul	x,a
 270  0102 724f0031      	clr	(_sc+49,x)
 271                     ; 50 	for(i = 0; i < 15; i++){
 273  0106 0c02          	inc	(OFST+0,sp)
 276  0108 7b02          	ld	a,(OFST+0,sp)
 277  010a a10f          	cp	a,#15
 278  010c 2403          	jruge	L21
 279  010e cc0017        	jp	L73
 280  0111               L21:
 281                     ; 75 }
 284  0111 85            	popw	x
 285  0112 81            	ret
 353                     ; 85 void main (void) { 
 354                     .text:	section	.text,new
 355  0000               _main:
 357  0000 5204          	subw	sp,#4
 358       00000004      OFST:	set	4
 361                     ; 86 	int ret,i,j,k,slave_num = 0;
 363  0002 5f            	clrw	x
 364  0003 1f01          	ldw	(OFST-3,sp),x
 365                     ; 90   CLK->SWCR |= 0x02; //开启切换
 367  0005 721250c5      	bset	20677,#1
 368                     ; 91   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 370  0009 35b450c4      	mov	20676,#180
 372  000d               L57:
 373                     ; 92   while((CLK->SWCR & 0x01)==0x01);
 375  000d c650c5        	ld	a,20677
 376  0010 a401          	and	a,#1
 377  0012 a101          	cp	a,#1
 378  0014 27f7          	jreq	L57
 379                     ; 93   CLK->CKDIVR = 0x80;    //不分频
 381  0016 358050c6      	mov	20678,#128
 382                     ; 94   CLK->SWCR  &= ~0x02; //关闭切换
 384  001a 721350c5      	bres	20677,#1
 385                     ; 96   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 387  001e 4be0          	push	#224
 388  0020 4b08          	push	#8
 389  0022 ae5005        	ldw	x,#20485
 390  0025 cd0000        	call	_GPIO_Init
 392  0028 85            	popw	x
 393                     ; 97 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 395  0029 4be0          	push	#224
 396  002b 4b04          	push	#4
 397  002d ae5005        	ldw	x,#20485
 398  0030 cd0000        	call	_GPIO_Init
 400  0033 85            	popw	x
 401                     ; 98 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 403  0034 4b08          	push	#8
 404  0036 ae5005        	ldw	x,#20485
 405  0039 cd0000        	call	_GPIO_WriteHigh
 407  003c 84            	pop	a
 408                     ; 99 	enableInterrupts();
 411  003d 9a            rim
 413                     ; 100 	Init_Time4();
 416  003e cd0000        	call	_Init_Time4
 418                     ; 102 	Init_uart2();
 420  0041 cd0000        	call	_Init_uart2
 422                     ; 104 	I2C_Config();
 424  0044 cd0000        	call	_I2C_Config
 426                     ; 105 	sys_init();
 428  0047 cd0000        	call	_sys_init
 430                     ; 106 	delay(2500);//等待SLC SPC上电完成初始化。10s
 432  004a ae09c4        	ldw	x,#2500
 433  004d cd0000        	call	_delay
 435  0050               L101:
 436                     ; 109 		if((!init_slc_spc_done)&&(rev_bleheartbeat)){
 438  0050 725d0015      	tnz	_init_slc_spc_done
 439  0054 2618          	jrne	L501
 441  0056 c60000        	ld	a,_UART1Flag2_
 442  0059 a502          	bcp	a,#2
 443  005b 2711          	jreq	L501
 444                     ; 110 			rev_bleheartbeat = 0;
 446  005d 72130000      	bres	_UART1Flag2_,#1
 447                     ; 111 			scan_device();
 449  0061 cd0000        	call	_scan_device
 451                     ; 112 			i2c_device_info();
 453  0064 cd0000        	call	_i2c_device_info
 455                     ; 113 			send_device_info();
 457  0067 cd0000        	call	_send_device_info
 459                     ; 114 			init_slc_spc_done = 1;
 461  006a 35010015      	mov	_init_slc_spc_done,#1
 462  006e               L501:
 463                     ; 117 		if(f_100ms){
 465  006e c60000        	ld	a,_Flag1_
 466  0071 a502          	bcp	a,#2
 467  0073 2746          	jreq	L701
 468                     ; 118 			f_100ms = 0;
 470  0075 72130000      	bres	_Flag1_,#1
 471                     ; 119 			if(action_dimmer_ext > 0)	{
 473  0079 725d0000      	tnz	_action_dimmer_ext
 474  007d 2739          	jreq	L111
 475                     ; 120 				action_dimmer_ext -= 1;
 477  007f 725a0000      	dec	_action_dimmer_ext
 478                     ; 121 				if(action_dimmer_ext == 0){
 480  0083 725d0000      	tnz	_action_dimmer_ext
 481  0087 262f          	jrne	L111
 482                     ; 123 					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
 484  0089 c60000        	ld	a,_action_dimmer_MDID
 485  008c cd0000        	call	_i2c_single_action_dimmer_result
 487  008f 5f            	clrw	x
 488  0090 97            	ld	xl,a
 489  0091 1f03          	ldw	(OFST-1,sp),x
 490                     ; 124 					if(ret == IIC_SUCCESS) {
 492  0093 1e03          	ldw	x,(OFST-1,sp)
 493  0095 2621          	jrne	L111
 494                     ; 125 						action_dimmer_MDID = 0x00;
 496  0097 725f0000      	clr	_action_dimmer_MDID
 497                     ; 126 						delay(10);
 499  009b ae000a        	ldw	x,#10
 500  009e cd0000        	call	_delay
 502                     ; 127 						sicp_receipt_Done(0x05,rev_ad_message_id,ns_host_meshid_H,ns_host_meshid_L,0x01,rev_ad_mdid);
 504  00a1 3b0000        	push	_rev_ad_mdid
 505  00a4 4b01          	push	#1
 506  00a6 3b0000        	push	_ns_host_meshid_L
 507  00a9 3b0000        	push	_ns_host_meshid_H
 508  00ac c60000        	ld	a,_rev_ad_message_id
 509  00af 97            	ld	xl,a
 510  00b0 a605          	ld	a,#5
 511  00b2 95            	ld	xh,a
 512  00b3 cd0000        	call	_sicp_receipt_Done
 514  00b6 5b04          	addw	sp,#4
 515  00b8               L111:
 516                     ; 131 			rev_anaylze();
 518  00b8 cd0000        	call	_rev_anaylze
 520  00bb               L701:
 521                     ; 138 		if(f_1s){
 523  00bb c60000        	ld	a,_Flag1_
 524  00be a508          	bcp	a,#8
 525  00c0 278e          	jreq	L101
 526                     ; 139 			f_1s = 0;
 528  00c2 72170000      	bres	_Flag1_,#3
 529                     ; 140 			tick_5s++;
 531  00c6 725c0000      	inc	_tick_5s
 532                     ; 141 			check_send_repeatedly();
 534  00ca cd0000        	call	_check_send_repeatedly
 536                     ; 142 			report_energy_consum();
 538  00cd cd0000        	call	_report_energy_consum
 540                     ; 143 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 542  00d0 c60000        	ld	a,_tick_5s
 543  00d3 a105          	cp	a,#5
 544  00d5 2507          	jrult	L121
 547  00d7 725f0000      	clr	_tick_5s
 550  00db cd0000        	call	_i2c_heartbeat
 552  00de               L121:
 553                     ; 144 			send_malfunction();
 555  00de cd0000        	call	_send_malfunction
 557                     ; 145 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 559  00e1 4b08          	push	#8
 560  00e3 ae5005        	ldw	x,#20485
 561  00e6 cd0000        	call	_GPIO_WriteReverse
 563  00e9 84            	pop	a
 564  00ea ac500050      	jpf	L101
 599                     ; 159 void assert_failed(uint8_t* file, uint32_t line)
 599                     ; 160 { 
 600                     .text:	section	.text,new
 601  0000               _assert_failed:
 605  0000               L141:
 606  0000 20fe          	jra	L141
 676                     	xdef	_main
 677                     	switch	.bss
 678  0000               _tick_5s:
 679  0000 00            	ds.b	1
 680                     	xdef	_tick_5s
 681  0001               _read_buffer:
 682  0001 000000000000  	ds.b	10
 683                     	xdef	_read_buffer
 684  000b               _write_buffer:
 685  000b 000000000000  	ds.b	10
 686                     	xdef	_write_buffer
 687                     	xdef	_IIC_ErrorStr
 688                     	xdef	_DUMMY_INIT
 689                     	xref	_i2c_single_action_dimmer_result
 690                     	xref	_i2c_heartbeat
 691                     	xref	_i2c_device_info
 692                     	xref	_scan_device
 693                     	xref	_action_dimmer_ext
 694                     	xref	_action_dimmer_MDID
 695  0015               _init_slc_spc_done:
 696  0015 00            	ds.b	1
 697                     	xdef	_init_slc_spc_done
 698                     	xdef	_sys_init
 699                     	xref	_check_send_repeatedly
 700                     	xref	_send_malfunction
 701                     	xref	_send_device_info
 702                     	xref	_report_energy_consum
 703                     	xref	_sicp_receipt_Done
 704                     	xref	_rev_anaylze
 705                     	xref	_Init_uart2
 706                     	xref	_rev_ad_mdid
 707                     	xref	_rev_ad_message_id
 708                     	xref	_ns_host_meshid_L
 709                     	xref	_ns_host_meshid_H
 710                     	xref	_sc
 711                     	xref	_UART1Flag2_
 712                     	xref	_Init_Time4
 713                     	xref	_Flag1_
 714                     	xref	_I2C_Config
 715                     	xref	_delay
 716                     	xdef	_assert_failed
 717                     	xref	_GPIO_WriteReverse
 718                     	xref	_GPIO_WriteHigh
 719                     	xref	_GPIO_Init
 720                     	switch	.const
 721  000a               L11:
 722  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 723  001c               L7:
 724  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 725  002b               L5:
 726  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 727  003e               L3:
 728  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 748                     	end
