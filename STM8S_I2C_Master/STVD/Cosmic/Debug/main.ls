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
  91                     ; 46 	sc.slc[0].deviceid[0] = 0xAA;
  93  0015 35aa01bf      	mov	_sc+447,#170
  94                     ; 47 	sc.slc[0].deviceid[1] = 0x55;
  96  0019 355501c0      	mov	_sc+448,#85
  97                     ; 48 	sc.slc[0].deviceid[2] = 0xAB;
  99  001d 35ab01c1      	mov	_sc+449,#171
 100                     ; 49 	sc.slc[0].deviceid[3] = 0x57;
 102  0021 355701c2      	mov	_sc+450,#87
 103                     ; 50 	sc.spc[1].deviceid[0] = 0xAA;
 105  0025 35aa0037      	mov	_sc+55,#170
 106                     ; 51 	sc.spc[1].deviceid[1] = 0x55;
 108  0029 35550038      	mov	_sc+56,#85
 109                     ; 52 	sc.spc[1].deviceid[2] = 0xAB;
 111  002d 35ab0039      	mov	_sc+57,#171
 112                     ; 53 	sc.spc[1].deviceid[3] = 0x58;
 114  0031 3558003a      	mov	_sc+58,#88
 115                     ; 54 	for(i = 0; i < 15; i++){
 117  0035 0f02          	clr	(OFST+0,sp)
 118  0037               L73:
 119                     ; 55 		for(j = 0; j < 4;j++){
 121  0037 0f01          	clr	(OFST-1,sp)
 122  0039               L54:
 125  0039 0c01          	inc	(OFST-1,sp)
 128  003b 7b01          	ld	a,(OFST-1,sp)
 129  003d a104          	cp	a,#4
 130  003f 25f8          	jrult	L54
 131                     ; 59 		sc.slc[i].firmware = 0x00;
 133  0041 7b02          	ld	a,(OFST+0,sp)
 134  0043 97            	ld	xl,a
 135  0044 a61a          	ld	a,#26
 136  0046 42            	mul	x,a
 137  0047 724f01c3      	clr	(_sc+451,x)
 138                     ; 60 		sc.slc[i].HWTtest = 0xC0;
 140  004b 7b02          	ld	a,(OFST+0,sp)
 141  004d 97            	ld	xl,a
 142  004e a61a          	ld	a,#26
 143  0050 42            	mul	x,a
 144  0051 a6c0          	ld	a,#192
 145  0053 d701c4        	ld	(_sc+452,x),a
 146                     ; 61 		sc.slc[i].MDID = 0x00;
 148  0056 7b02          	ld	a,(OFST+0,sp)
 149  0058 97            	ld	xl,a
 150  0059 a61a          	ld	a,#26
 151  005b 42            	mul	x,a
 152  005c 905f          	clrw	y
 153  005e df01d0        	ldw	(_sc+464,x),y
 154                     ; 62 		sc.slc[i].model = 0x00;
 156  0061 7b02          	ld	a,(OFST+0,sp)
 157  0063 97            	ld	xl,a
 158  0064 a61a          	ld	a,#26
 159  0066 42            	mul	x,a
 160  0067 724f01c5      	clr	(_sc+453,x)
 161                     ; 63 		sc.slc[i].flag._flag_byte = 0x00;
 163  006b 7b02          	ld	a,(OFST+0,sp)
 164  006d 97            	ld	xl,a
 165  006e a61a          	ld	a,#26
 166  0070 42            	mul	x,a
 167  0071 724f01d6      	clr	(_sc+470,x)
 168                     ; 64 		sc.slc[i].ch1_status = 0x00;
 170  0075 7b02          	ld	a,(OFST+0,sp)
 171  0077 97            	ld	xl,a
 172  0078 a61a          	ld	a,#26
 173  007a 42            	mul	x,a
 174  007b 724f01d2      	clr	(_sc+466,x)
 175                     ; 65 		sc.slc[i].ch2_status = 0x00;
 177  007f 7b02          	ld	a,(OFST+0,sp)
 178  0081 97            	ld	xl,a
 179  0082 a61a          	ld	a,#26
 180  0084 42            	mul	x,a
 181  0085 724f01d3      	clr	(_sc+467,x)
 182                     ; 66 		sc.slc[i].ch3_status = 0x00;
 184  0089 7b02          	ld	a,(OFST+0,sp)
 185  008b 97            	ld	xl,a
 186  008c a61a          	ld	a,#26
 187  008e 42            	mul	x,a
 188  008f 724f01d4      	clr	(_sc+468,x)
 189                     ; 67 		sc.slc[i].ch4_status = 0x00;
 191  0093 7b02          	ld	a,(OFST+0,sp)
 192  0095 97            	ld	xl,a
 193  0096 a61a          	ld	a,#26
 194  0098 42            	mul	x,a
 195  0099 724f01d5      	clr	(_sc+469,x)
 196                     ; 68 		sc.spc[i].firmware = 0x00;
 198  009d 7b02          	ld	a,(OFST+0,sp)
 199  009f 97            	ld	xl,a
 200  00a0 a61c          	ld	a,#28
 201  00a2 42            	mul	x,a
 202  00a3 724f001f      	clr	(_sc+31,x)
 203                     ; 69 		sc.spc[i].HWTtest = 0xC0;
 205  00a7 7b02          	ld	a,(OFST+0,sp)
 206  00a9 97            	ld	xl,a
 207  00aa a61c          	ld	a,#28
 208  00ac 42            	mul	x,a
 209  00ad a6c0          	ld	a,#192
 210  00af d70020        	ld	(_sc+32,x),a
 211                     ; 70 		sc.spc[i].MDID = 0x00;
 213  00b2 7b02          	ld	a,(OFST+0,sp)
 214  00b4 97            	ld	xl,a
 215  00b5 a61c          	ld	a,#28
 216  00b7 42            	mul	x,a
 217  00b8 905f          	clrw	y
 218  00ba df002c        	ldw	(_sc+44,x),y
 219                     ; 71 		sc.spc[i].model = 0x00;
 221  00bd 7b02          	ld	a,(OFST+0,sp)
 222  00bf 97            	ld	xl,a
 223  00c0 a61c          	ld	a,#28
 224  00c2 42            	mul	x,a
 225  00c3 724f0021      	clr	(_sc+33,x)
 226                     ; 72 		sc.spc[i].flag._flag_byte = 0x00;
 228  00c7 7b02          	ld	a,(OFST+0,sp)
 229  00c9 97            	ld	xl,a
 230  00ca a61c          	ld	a,#28
 231  00cc 42            	mul	x,a
 232  00cd 724f0034      	clr	(_sc+52,x)
 233                     ; 73 		sc.spc[i].energy_consum = 0x0000;
 235  00d1 7b02          	ld	a,(OFST+0,sp)
 236  00d3 97            	ld	xl,a
 237  00d4 a61c          	ld	a,#28
 238  00d6 42            	mul	x,a
 239  00d7 905f          	clrw	y
 240  00d9 df0032        	ldw	(_sc+50,x),y
 241                     ; 74 		sc.spc[i].ch1_status = 0x00;
 243  00dc 7b02          	ld	a,(OFST+0,sp)
 244  00de 97            	ld	xl,a
 245  00df a61c          	ld	a,#28
 246  00e1 42            	mul	x,a
 247  00e2 724f002e      	clr	(_sc+46,x)
 248                     ; 75 		sc.spc[i].ch2_status = 0x00;
 250  00e6 7b02          	ld	a,(OFST+0,sp)
 251  00e8 97            	ld	xl,a
 252  00e9 a61c          	ld	a,#28
 253  00eb 42            	mul	x,a
 254  00ec 724f002f      	clr	(_sc+47,x)
 255                     ; 76 		sc.spc[i].ch3_status = 0x00;
 257  00f0 7b02          	ld	a,(OFST+0,sp)
 258  00f2 97            	ld	xl,a
 259  00f3 a61c          	ld	a,#28
 260  00f5 42            	mul	x,a
 261  00f6 724f0030      	clr	(_sc+48,x)
 262                     ; 77 		sc.spc[i].ch4_status = 0x00;	
 264  00fa 7b02          	ld	a,(OFST+0,sp)
 265  00fc 97            	ld	xl,a
 266  00fd a61c          	ld	a,#28
 267  00ff 42            	mul	x,a
 268  0100 724f0031      	clr	(_sc+49,x)
 269                     ; 54 	for(i = 0; i < 15; i++){
 271  0104 0c02          	inc	(OFST+0,sp)
 274  0106 7b02          	ld	a,(OFST+0,sp)
 275  0108 a10f          	cp	a,#15
 276  010a 2403          	jruge	L6
 277  010c cc0037        	jp	L73
 278  010f               L6:
 279                     ; 79 }
 282  010f 85            	popw	x
 283  0110 81            	ret
 351                     ; 89 void main (void) { 
 352                     .text:	section	.text,new
 353  0000               _main:
 355  0000 5204          	subw	sp,#4
 356       00000004      OFST:	set	4
 359                     ; 90 	int ret,i,j,k,slave_num = 0;
 361  0002 5f            	clrw	x
 362  0003 1f01          	ldw	(OFST-3,sp),x
 363                     ; 94   CLK->SWCR |= 0x02; //开启切换
 365  0005 721250c5      	bset	20677,#1
 366                     ; 95   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 368  0009 35b450c4      	mov	20676,#180
 370  000d               L57:
 371                     ; 96   while((CLK->SWCR & 0x01)==0x01);
 373  000d c650c5        	ld	a,20677
 374  0010 a401          	and	a,#1
 375  0012 a101          	cp	a,#1
 376  0014 27f7          	jreq	L57
 377                     ; 97   CLK->CKDIVR = 0x80;    //不分频
 379  0016 358050c6      	mov	20678,#128
 380                     ; 98   CLK->SWCR  &= ~0x02; //关闭切换
 382  001a 721350c5      	bres	20677,#1
 383                     ; 100   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 385  001e 4be0          	push	#224
 386  0020 4b08          	push	#8
 387  0022 ae5005        	ldw	x,#20485
 388  0025 cd0000        	call	_GPIO_Init
 390  0028 85            	popw	x
 391                     ; 101 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 393  0029 4be0          	push	#224
 394  002b 4b04          	push	#4
 395  002d ae5005        	ldw	x,#20485
 396  0030 cd0000        	call	_GPIO_Init
 398  0033 85            	popw	x
 399                     ; 102 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 401  0034 4b08          	push	#8
 402  0036 ae5005        	ldw	x,#20485
 403  0039 cd0000        	call	_GPIO_WriteHigh
 405  003c 84            	pop	a
 406                     ; 103 	enableInterrupts();
 409  003d 9a            rim
 411                     ; 104 	Init_Time4();
 414  003e cd0000        	call	_Init_Time4
 416                     ; 106 	Init_uart2();
 418  0041 cd0000        	call	_Init_uart2
 420                     ; 108 	I2C_Config();
 422  0044 cd0000        	call	_I2C_Config
 424                     ; 109 	sys_init();
 426  0047 cd0000        	call	_sys_init
 428                     ; 110 	delay(2500);//等待SLC SPC上电完成初始化。10s
 430  004a ae09c4        	ldw	x,#2500
 431  004d cd0000        	call	_delay
 433  0050               L101:
 434                     ; 113 		if((!init_slc_spc_done)&&(rev_bleheartbeat)){
 436  0050 725d0015      	tnz	_init_slc_spc_done
 437  0054 2618          	jrne	L501
 439  0056 c60000        	ld	a,_UART1Flag2_
 440  0059 a502          	bcp	a,#2
 441  005b 2711          	jreq	L501
 442                     ; 114 			rev_bleheartbeat = 0;
 444  005d 72130000      	bres	_UART1Flag2_,#1
 445                     ; 115 			scan_device();
 447  0061 cd0000        	call	_scan_device
 449                     ; 116 			i2c_device_info();
 451  0064 cd0000        	call	_i2c_device_info
 453                     ; 117 			send_device_info();
 455  0067 cd0000        	call	_send_device_info
 457                     ; 118 			init_slc_spc_done = 1;
 459  006a 35010015      	mov	_init_slc_spc_done,#1
 460  006e               L501:
 461                     ; 121 		if(f_100ms){
 463  006e c60000        	ld	a,_Flag1_
 464  0071 a502          	bcp	a,#2
 465  0073 2746          	jreq	L701
 466                     ; 122 			f_100ms = 0;
 468  0075 72130000      	bres	_Flag1_,#1
 469                     ; 123 			if(action_dimmer_ext > 0)	{
 471  0079 725d0000      	tnz	_action_dimmer_ext
 472  007d 2739          	jreq	L111
 473                     ; 124 				action_dimmer_ext -= 1;
 475  007f 725a0000      	dec	_action_dimmer_ext
 476                     ; 125 				if(action_dimmer_ext == 0){
 478  0083 725d0000      	tnz	_action_dimmer_ext
 479  0087 262f          	jrne	L111
 480                     ; 127 					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
 482  0089 c60000        	ld	a,_action_dimmer_MDID
 483  008c cd0000        	call	_i2c_single_action_dimmer_result
 485  008f 5f            	clrw	x
 486  0090 97            	ld	xl,a
 487  0091 1f03          	ldw	(OFST-1,sp),x
 488                     ; 128 					if(ret == IIC_SUCCESS) {
 490  0093 1e03          	ldw	x,(OFST-1,sp)
 491  0095 2621          	jrne	L111
 492                     ; 129 						action_dimmer_MDID = 0x00;
 494  0097 725f0000      	clr	_action_dimmer_MDID
 495                     ; 130 						sicp_receipt_Done(0x05,rev_ad_message_id,ns_host_meshid_H,ns_host_meshid_L,0x01,rev_ad_mdid);
 497  009b 3b0000        	push	_rev_ad_mdid
 498  009e 4b01          	push	#1
 499  00a0 3b0000        	push	_ns_host_meshid_L
 500  00a3 3b0000        	push	_ns_host_meshid_H
 501  00a6 c60000        	ld	a,_rev_ad_message_id
 502  00a9 97            	ld	xl,a
 503  00aa a605          	ld	a,#5
 504  00ac 95            	ld	xh,a
 505  00ad cd0000        	call	_sicp_receipt_Done
 507  00b0 5b04          	addw	sp,#4
 508                     ; 131 						delay(100);
 510  00b2 ae0064        	ldw	x,#100
 511  00b5 cd0000        	call	_delay
 513  00b8               L111:
 514                     ; 135 			rev_anaylze();
 516  00b8 cd0000        	call	_rev_anaylze
 518  00bb               L701:
 519                     ; 142 		if(f_1s){
 521  00bb c60000        	ld	a,_Flag1_
 522  00be a508          	bcp	a,#8
 523  00c0 278e          	jreq	L101
 524                     ; 143 			f_1s = 0;
 526  00c2 72170000      	bres	_Flag1_,#3
 527                     ; 144 			tick_5s++;
 529  00c6 725c0000      	inc	_tick_5s
 530                     ; 145 			check_send_repeatedly();
 532  00ca cd0000        	call	_check_send_repeatedly
 534                     ; 146 			report_energy_consum();
 536  00cd cd0000        	call	_report_energy_consum
 538                     ; 147 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 540  00d0 c60000        	ld	a,_tick_5s
 541  00d3 a105          	cp	a,#5
 542  00d5 2507          	jrult	L121
 545  00d7 725f0000      	clr	_tick_5s
 548  00db cd0000        	call	_i2c_heartbeat
 550  00de               L121:
 551                     ; 148 			send_malfunction();
 553  00de cd0000        	call	_send_malfunction
 555                     ; 149 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 557  00e1 4b08          	push	#8
 558  00e3 ae5005        	ldw	x,#20485
 559  00e6 cd0000        	call	_GPIO_WriteReverse
 561  00e9 84            	pop	a
 562  00ea ac500050      	jpf	L101
 597                     ; 163 void assert_failed(uint8_t* file, uint32_t line)
 597                     ; 164 { 
 598                     .text:	section	.text,new
 599  0000               _assert_failed:
 603  0000               L141:
 604  0000 20fe          	jra	L141
 674                     	xdef	_main
 675                     	switch	.bss
 676  0000               _tick_5s:
 677  0000 00            	ds.b	1
 678                     	xdef	_tick_5s
 679  0001               _read_buffer:
 680  0001 000000000000  	ds.b	10
 681                     	xdef	_read_buffer
 682  000b               _write_buffer:
 683  000b 000000000000  	ds.b	10
 684                     	xdef	_write_buffer
 685                     	xdef	_IIC_ErrorStr
 686                     	xdef	_DUMMY_INIT
 687                     	xref	_i2c_single_action_dimmer_result
 688                     	xref	_i2c_heartbeat
 689                     	xref	_i2c_device_info
 690                     	xref	_scan_device
 691                     	xref	_action_dimmer_ext
 692                     	xref	_action_dimmer_MDID
 693  0015               _init_slc_spc_done:
 694  0015 00            	ds.b	1
 695                     	xdef	_init_slc_spc_done
 696                     	xdef	_sys_init
 697                     	xref	_check_send_repeatedly
 698                     	xref	_send_malfunction
 699                     	xref	_send_device_info
 700                     	xref	_report_energy_consum
 701                     	xref	_sicp_receipt_Done
 702                     	xref	_rev_anaylze
 703                     	xref	_Init_uart2
 704                     	xref	_rev_ad_mdid
 705                     	xref	_rev_ad_message_id
 706                     	xref	_ns_host_meshid_L
 707                     	xref	_ns_host_meshid_H
 708                     	xref	_sc
 709                     	xref	_UART1Flag2_
 710                     	xref	_Init_Time4
 711                     	xref	_Flag1_
 712                     	xref	_I2C_Config
 713                     	xref	_delay
 714                     	xdef	_assert_failed
 715                     	xref	_GPIO_WriteReverse
 716                     	xref	_GPIO_WriteHigh
 717                     	xref	_GPIO_Init
 718                     	switch	.const
 719  000a               L11:
 720  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 721  001c               L7:
 722  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 723  002b               L5:
 724  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 725  003e               L3:
 726  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 746                     	end
