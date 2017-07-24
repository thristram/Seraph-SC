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
  76                     ; 41 	sc.HWTtest = 0xC0;
  78  0001 35c00007      	mov	_sc+7,#192
  79                     ; 42 	sc.deviceid[0] = 0xAA;
  81  0005 35aa0002      	mov	_sc+2,#170
  82                     ; 43 	sc.deviceid[1] = 0x55;
  84  0009 35550003      	mov	_sc+3,#85
  85                     ; 44 	sc.deviceid[2] = 0xAB;
  87  000d 35ab0004      	mov	_sc+4,#171
  88                     ; 45 	sc.deviceid[3] = 0x56;
  90  0011 35560005      	mov	_sc+5,#86
  91                     ; 54 	for(i = 0; i < 15; i++){
  93  0015 0f02          	clr	(OFST+0,sp)
  94  0017               L73:
  95                     ; 55 		for(j = 0; j < 4;j++){
  97  0017 0f01          	clr	(OFST-1,sp)
  98  0019               L54:
 101  0019 0c01          	inc	(OFST-1,sp)
 104  001b 7b01          	ld	a,(OFST-1,sp)
 105  001d a104          	cp	a,#4
 106  001f 25f8          	jrult	L54
 107                     ; 59 		sc.slc[i].firmware = 0x00;
 109  0021 7b02          	ld	a,(OFST+0,sp)
 110  0023 97            	ld	xl,a
 111  0024 a61a          	ld	a,#26
 112  0026 42            	mul	x,a
 113  0027 724f01c3      	clr	(_sc+451,x)
 114                     ; 60 		sc.slc[i].HWTtest = 0xC0;
 116  002b 7b02          	ld	a,(OFST+0,sp)
 117  002d 97            	ld	xl,a
 118  002e a61a          	ld	a,#26
 119  0030 42            	mul	x,a
 120  0031 a6c0          	ld	a,#192
 121  0033 d701c4        	ld	(_sc+452,x),a
 122                     ; 61 		sc.slc[i].MDID = 0x00;
 124  0036 7b02          	ld	a,(OFST+0,sp)
 125  0038 97            	ld	xl,a
 126  0039 a61a          	ld	a,#26
 127  003b 42            	mul	x,a
 128  003c 905f          	clrw	y
 129  003e df01d0        	ldw	(_sc+464,x),y
 130                     ; 62 		sc.slc[i].model = 0x00;
 132  0041 7b02          	ld	a,(OFST+0,sp)
 133  0043 97            	ld	xl,a
 134  0044 a61a          	ld	a,#26
 135  0046 42            	mul	x,a
 136  0047 724f01c5      	clr	(_sc+453,x)
 137                     ; 63 		sc.slc[i].flag._flag_byte = 0x00;
 139  004b 7b02          	ld	a,(OFST+0,sp)
 140  004d 97            	ld	xl,a
 141  004e a61a          	ld	a,#26
 142  0050 42            	mul	x,a
 143  0051 724f01d6      	clr	(_sc+470,x)
 144                     ; 64 		sc.slc[i].ch1_status = 0x00;
 146  0055 7b02          	ld	a,(OFST+0,sp)
 147  0057 97            	ld	xl,a
 148  0058 a61a          	ld	a,#26
 149  005a 42            	mul	x,a
 150  005b 724f01d2      	clr	(_sc+466,x)
 151                     ; 65 		sc.slc[i].ch2_status = 0x00;
 153  005f 7b02          	ld	a,(OFST+0,sp)
 154  0061 97            	ld	xl,a
 155  0062 a61a          	ld	a,#26
 156  0064 42            	mul	x,a
 157  0065 724f01d3      	clr	(_sc+467,x)
 158                     ; 66 		sc.slc[i].ch3_status = 0x00;
 160  0069 7b02          	ld	a,(OFST+0,sp)
 161  006b 97            	ld	xl,a
 162  006c a61a          	ld	a,#26
 163  006e 42            	mul	x,a
 164  006f 724f01d4      	clr	(_sc+468,x)
 165                     ; 67 		sc.slc[i].ch4_status = 0x00;
 167  0073 7b02          	ld	a,(OFST+0,sp)
 168  0075 97            	ld	xl,a
 169  0076 a61a          	ld	a,#26
 170  0078 42            	mul	x,a
 171  0079 724f01d5      	clr	(_sc+469,x)
 172                     ; 68 		sc.spc[i].firmware = 0x00;
 174  007d 7b02          	ld	a,(OFST+0,sp)
 175  007f 97            	ld	xl,a
 176  0080 a61c          	ld	a,#28
 177  0082 42            	mul	x,a
 178  0083 724f001f      	clr	(_sc+31,x)
 179                     ; 69 		sc.spc[i].HWTtest = 0xC0;
 181  0087 7b02          	ld	a,(OFST+0,sp)
 182  0089 97            	ld	xl,a
 183  008a a61c          	ld	a,#28
 184  008c 42            	mul	x,a
 185  008d a6c0          	ld	a,#192
 186  008f d70020        	ld	(_sc+32,x),a
 187                     ; 70 		sc.spc[i].MDID = 0x00;
 189  0092 7b02          	ld	a,(OFST+0,sp)
 190  0094 97            	ld	xl,a
 191  0095 a61c          	ld	a,#28
 192  0097 42            	mul	x,a
 193  0098 905f          	clrw	y
 194  009a df002c        	ldw	(_sc+44,x),y
 195                     ; 71 		sc.spc[i].model = 0x00;
 197  009d 7b02          	ld	a,(OFST+0,sp)
 198  009f 97            	ld	xl,a
 199  00a0 a61c          	ld	a,#28
 200  00a2 42            	mul	x,a
 201  00a3 724f0021      	clr	(_sc+33,x)
 202                     ; 72 		sc.spc[i].flag._flag_byte = 0x00;
 204  00a7 7b02          	ld	a,(OFST+0,sp)
 205  00a9 97            	ld	xl,a
 206  00aa a61c          	ld	a,#28
 207  00ac 42            	mul	x,a
 208  00ad 724f0034      	clr	(_sc+52,x)
 209                     ; 73 		sc.spc[i].energy_consum = 0x0000;
 211  00b1 7b02          	ld	a,(OFST+0,sp)
 212  00b3 97            	ld	xl,a
 213  00b4 a61c          	ld	a,#28
 214  00b6 42            	mul	x,a
 215  00b7 905f          	clrw	y
 216  00b9 df0032        	ldw	(_sc+50,x),y
 217                     ; 74 		sc.spc[i].ch1_status = 0x00;
 219  00bc 7b02          	ld	a,(OFST+0,sp)
 220  00be 97            	ld	xl,a
 221  00bf a61c          	ld	a,#28
 222  00c1 42            	mul	x,a
 223  00c2 724f002e      	clr	(_sc+46,x)
 224                     ; 75 		sc.spc[i].ch2_status = 0x00;
 226  00c6 7b02          	ld	a,(OFST+0,sp)
 227  00c8 97            	ld	xl,a
 228  00c9 a61c          	ld	a,#28
 229  00cb 42            	mul	x,a
 230  00cc 724f002f      	clr	(_sc+47,x)
 231                     ; 76 		sc.spc[i].ch3_status = 0x00;
 233  00d0 7b02          	ld	a,(OFST+0,sp)
 234  00d2 97            	ld	xl,a
 235  00d3 a61c          	ld	a,#28
 236  00d5 42            	mul	x,a
 237  00d6 724f0030      	clr	(_sc+48,x)
 238                     ; 77 		sc.spc[i].ch4_status = 0x00;	
 240  00da 7b02          	ld	a,(OFST+0,sp)
 241  00dc 97            	ld	xl,a
 242  00dd a61c          	ld	a,#28
 243  00df 42            	mul	x,a
 244  00e0 724f0031      	clr	(_sc+49,x)
 245                     ; 54 	for(i = 0; i < 15; i++){
 247  00e4 0c02          	inc	(OFST+0,sp)
 250  00e6 7b02          	ld	a,(OFST+0,sp)
 251  00e8 a10f          	cp	a,#15
 252  00ea 2403          	jruge	L6
 253  00ec cc0017        	jp	L73
 254  00ef               L6:
 255                     ; 79 }
 258  00ef 85            	popw	x
 259  00f0 81            	ret
 327                     ; 89 void main (void) { 
 328                     .text:	section	.text,new
 329  0000               _main:
 331  0000 5204          	subw	sp,#4
 332       00000004      OFST:	set	4
 335                     ; 90 	int ret,i,j,k,slave_num = 0;
 337  0002 5f            	clrw	x
 338  0003 1f01          	ldw	(OFST-3,sp),x
 339                     ; 94   CLK->SWCR |= 0x02; //开启切换
 341  0005 721250c5      	bset	20677,#1
 342                     ; 95   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 344  0009 35b450c4      	mov	20676,#180
 346  000d               L57:
 347                     ; 96   while((CLK->SWCR & 0x01)==0x01);
 349  000d c650c5        	ld	a,20677
 350  0010 a401          	and	a,#1
 351  0012 a101          	cp	a,#1
 352  0014 27f7          	jreq	L57
 353                     ; 97   CLK->CKDIVR = 0x80;    //不分频
 355  0016 358050c6      	mov	20678,#128
 356                     ; 98   CLK->SWCR  &= ~0x02; //关闭切换
 358  001a 721350c5      	bres	20677,#1
 359                     ; 100   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 361  001e 4be0          	push	#224
 362  0020 4b08          	push	#8
 363  0022 ae5005        	ldw	x,#20485
 364  0025 cd0000        	call	_GPIO_Init
 366  0028 85            	popw	x
 367                     ; 101 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 369  0029 4be0          	push	#224
 370  002b 4b04          	push	#4
 371  002d ae5005        	ldw	x,#20485
 372  0030 cd0000        	call	_GPIO_Init
 374  0033 85            	popw	x
 375                     ; 102 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 377  0034 4b08          	push	#8
 378  0036 ae5005        	ldw	x,#20485
 379  0039 cd0000        	call	_GPIO_WriteHigh
 381  003c 84            	pop	a
 382                     ; 103 	enableInterrupts();
 385  003d 9a            rim
 387                     ; 104 	Init_Time4();
 390  003e cd0000        	call	_Init_Time4
 392                     ; 106 	Init_uart2();
 394  0041 cd0000        	call	_Init_uart2
 396                     ; 108 	I2C_Config();
 398  0044 cd0000        	call	_I2C_Config
 400                     ; 109 	sys_init();
 402  0047 cd0000        	call	_sys_init
 404                     ; 110 	delay(2500);//等待SLC SPC上电完成初始化。10s
 406  004a ae09c4        	ldw	x,#2500
 407  004d cd0000        	call	_delay
 409  0050               L101:
 410                     ; 113 		if((!init_slc_spc_done)&&(rev_bleheartbeat)&&(rev_ssbroadcast)){
 412  0050 725d0015      	tnz	_init_slc_spc_done
 413  0054 2623          	jrne	L501
 415  0056 c60000        	ld	a,_UART1Flag2_
 416  0059 a502          	bcp	a,#2
 417  005b 271c          	jreq	L501
 419  005d c60000        	ld	a,_UART1Flag2_
 420  0060 a504          	bcp	a,#4
 421  0062 2715          	jreq	L501
 422                     ; 114 			rev_bleheartbeat = 0;rev_ssbroadcast = 0;
 424  0064 72130000      	bres	_UART1Flag2_,#1
 427  0068 72150000      	bres	_UART1Flag2_,#2
 428                     ; 115 			scan_device();
 430  006c cd0000        	call	_scan_device
 432                     ; 116 			i2c_device_info();
 434  006f cd0000        	call	_i2c_device_info
 436                     ; 117 			send_device_info();
 438  0072 cd0000        	call	_send_device_info
 440                     ; 118 			init_slc_spc_done = 1;
 442  0075 35010015      	mov	_init_slc_spc_done,#1
 443  0079               L501:
 444                     ; 121 		if(f_100ms){
 446  0079 c60000        	ld	a,_Flag1_
 447  007c a502          	bcp	a,#2
 448  007e 2740          	jreq	L701
 449                     ; 122 			f_100ms = 0;
 451  0080 72130000      	bres	_Flag1_,#1
 452                     ; 123 			if(action_dimmer_ext > 0)	{
 454  0084 725d0000      	tnz	_action_dimmer_ext
 455  0088 2733          	jreq	L111
 456                     ; 124 				action_dimmer_ext -= 1;
 458  008a 725a0000      	dec	_action_dimmer_ext
 459                     ; 125 				if(action_dimmer_ext == 0){
 461  008e 725d0000      	tnz	_action_dimmer_ext
 462  0092 2629          	jrne	L111
 463                     ; 127 					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
 465  0094 c60000        	ld	a,_action_dimmer_MDID
 466  0097 cd0000        	call	_i2c_single_action_dimmer_result
 468  009a 5f            	clrw	x
 469  009b 97            	ld	xl,a
 470  009c 1f03          	ldw	(OFST-1,sp),x
 471                     ; 128 					if(ret == IIC_SUCCESS) {
 473  009e 1e03          	ldw	x,(OFST-1,sp)
 474  00a0 261b          	jrne	L111
 475                     ; 129 						action_dimmer_MDID = 0x00;
 477  00a2 725f0000      	clr	_action_dimmer_MDID
 478                     ; 130 						sicp_receipt_Done(0x05,rev_ad_message_id,ns_host_meshid_H,ns_host_meshid_L,0x01,rev_ad_mdid);
 480  00a6 3b0000        	push	_rev_ad_mdid
 481  00a9 4b01          	push	#1
 482  00ab 3b0000        	push	_ns_host_meshid_L
 483  00ae 3b0000        	push	_ns_host_meshid_H
 484  00b1 c60000        	ld	a,_rev_ad_message_id
 485  00b4 97            	ld	xl,a
 486  00b5 a605          	ld	a,#5
 487  00b7 95            	ld	xh,a
 488  00b8 cd0000        	call	_sicp_receipt_Done
 490  00bb 5b04          	addw	sp,#4
 491  00bd               L111:
 492                     ; 134 			rev_anaylze();
 494  00bd cd0000        	call	_rev_anaylze
 496  00c0               L701:
 497                     ; 141 		if(f_1s){
 499  00c0 c60000        	ld	a,_Flag1_
 500  00c3 a508          	bcp	a,#8
 501  00c5 2789          	jreq	L101
 502                     ; 142 			f_1s = 0;
 504  00c7 72170000      	bres	_Flag1_,#3
 505                     ; 143 			tick_5s++;
 507  00cb 725c0000      	inc	_tick_5s
 508                     ; 144 			check_send_repeatedly();
 510  00cf cd0000        	call	_check_send_repeatedly
 512                     ; 145 			report_energy_consum();
 514  00d2 cd0000        	call	_report_energy_consum
 516                     ; 146 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 518  00d5 c60000        	ld	a,_tick_5s
 519  00d8 a105          	cp	a,#5
 520  00da 2507          	jrult	L121
 523  00dc 725f0000      	clr	_tick_5s
 526  00e0 cd0000        	call	_i2c_heartbeat
 528  00e3               L121:
 529                     ; 147 			send_malfunction();
 531  00e3 cd0000        	call	_send_malfunction
 533                     ; 148 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 535  00e6 4b08          	push	#8
 536  00e8 ae5005        	ldw	x,#20485
 537  00eb cd0000        	call	_GPIO_WriteReverse
 539  00ee 84            	pop	a
 540  00ef ac500050      	jpf	L101
 575                     ; 162 void assert_failed(uint8_t* file, uint32_t line)
 575                     ; 163 { 
 576                     .text:	section	.text,new
 577  0000               _assert_failed:
 581  0000               L141:
 582  0000 20fe          	jra	L141
 652                     	xdef	_main
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
 684                     	xref	_ns_host_meshid_L
 685                     	xref	_ns_host_meshid_H
 686                     	xref	_sc
 687                     	xref	_UART1Flag2_
 688                     	xref	_Init_Time4
 689                     	xref	_Flag1_
 690                     	xref	_I2C_Config
 691                     	xref	_delay
 692                     	xdef	_assert_failed
 693                     	xref	_GPIO_WriteReverse
 694                     	xref	_GPIO_WriteHigh
 695                     	xref	_GPIO_Init
 696                     	switch	.const
 697  000a               L11:
 698  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 699  001c               L7:
 700  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 701  002b               L5:
 702  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 703  003e               L3:
 704  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 724                     	end
