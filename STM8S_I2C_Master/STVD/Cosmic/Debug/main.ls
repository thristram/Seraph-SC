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
  71                     ; 37 void sys_init(void)
  71                     ; 38 {
  73                     .text:	section	.text,new
  74  0000               _sys_init:
  76  0000 89            	pushw	x
  77       00000002      OFST:	set	2
  80                     ; 40 	ns_own_meshid_H = 0x80;
  82  0001 35800000      	mov	_ns_own_meshid_H,#128
  83                     ; 41 	ns_own_meshid_L = 0x04;
  85  0005 35040000      	mov	_ns_own_meshid_L,#4
  86                     ; 42 	ns_host_meshid_H = 0x80;
  88  0009 35800000      	mov	_ns_host_meshid_H,#128
  89                     ; 43 	ns_host_meshid_L = 0x05;
  91  000d 35050000      	mov	_ns_host_meshid_L,#5
  92                     ; 45 	sc.HWTtest = 0xC0;
  94  0011 35c00007      	mov	_sc+7,#192
  95                     ; 46 	sc.deviceid[0] = 0xAA;
  97  0015 35aa0002      	mov	_sc+2,#170
  98                     ; 47 	sc.deviceid[1] = 0x55;
 100  0019 35550003      	mov	_sc+3,#85
 101                     ; 48 	sc.deviceid[2] = 0xAB;
 103  001d 35ab0004      	mov	_sc+4,#171
 104                     ; 49 	sc.deviceid[3] = 0x56;
 106  0021 35560005      	mov	_sc+5,#86
 107                     ; 50 	for(i = 0; i < 15; i++){
 109  0025 0f02          	clr	(OFST+0,sp)
 110  0027               L73:
 111                     ; 51 		for(j = 0; j < 4;j++){
 113  0027 0f01          	clr	(OFST-1,sp)
 114  0029               L54:
 115                     ; 52 			sc.slc[i].deviceid[j] = 0x00;
 117  0029 7b02          	ld	a,(OFST+0,sp)
 118  002b 97            	ld	xl,a
 119  002c a61a          	ld	a,#26
 120  002e 42            	mul	x,a
 121  002f 01            	rrwa	x,a
 122  0030 1b01          	add	a,(OFST-1,sp)
 123  0032 2401          	jrnc	L6
 124  0034 5c            	incw	x
 125  0035               L6:
 126  0035 02            	rlwa	x,a
 127  0036 724f01bf      	clr	(_sc+447,x)
 128                     ; 53 			sc.spc[i].deviceid[j] = 0x00;
 130  003a 7b02          	ld	a,(OFST+0,sp)
 131  003c 97            	ld	xl,a
 132  003d a61c          	ld	a,#28
 133  003f 42            	mul	x,a
 134  0040 01            	rrwa	x,a
 135  0041 1b01          	add	a,(OFST-1,sp)
 136  0043 2401          	jrnc	L01
 137  0045 5c            	incw	x
 138  0046               L01:
 139  0046 02            	rlwa	x,a
 140  0047 724f001b      	clr	(_sc+27,x)
 141                     ; 51 		for(j = 0; j < 4;j++){
 143  004b 0c01          	inc	(OFST-1,sp)
 146  004d 7b01          	ld	a,(OFST-1,sp)
 147  004f a104          	cp	a,#4
 148  0051 25d6          	jrult	L54
 149                     ; 55 		sc.slc[i].firmware = 0x00;
 151  0053 7b02          	ld	a,(OFST+0,sp)
 152  0055 97            	ld	xl,a
 153  0056 a61a          	ld	a,#26
 154  0058 42            	mul	x,a
 155  0059 724f01c3      	clr	(_sc+451,x)
 156                     ; 56 		sc.slc[i].HWTtest = 0xC0;
 158  005d 7b02          	ld	a,(OFST+0,sp)
 159  005f 97            	ld	xl,a
 160  0060 a61a          	ld	a,#26
 161  0062 42            	mul	x,a
 162  0063 a6c0          	ld	a,#192
 163  0065 d701c4        	ld	(_sc+452,x),a
 164                     ; 57 		sc.slc[i].MDID = 0x00;
 166  0068 7b02          	ld	a,(OFST+0,sp)
 167  006a 97            	ld	xl,a
 168  006b a61a          	ld	a,#26
 169  006d 42            	mul	x,a
 170  006e 905f          	clrw	y
 171  0070 df01d0        	ldw	(_sc+464,x),y
 172                     ; 58 		sc.slc[i].model = 0x00;
 174  0073 7b02          	ld	a,(OFST+0,sp)
 175  0075 97            	ld	xl,a
 176  0076 a61a          	ld	a,#26
 177  0078 42            	mul	x,a
 178  0079 724f01c5      	clr	(_sc+453,x)
 179                     ; 59 		sc.slc[i].flag._flag_byte = 0x00;
 181  007d 7b02          	ld	a,(OFST+0,sp)
 182  007f 97            	ld	xl,a
 183  0080 a61a          	ld	a,#26
 184  0082 42            	mul	x,a
 185  0083 724f01d6      	clr	(_sc+470,x)
 186                     ; 60 		sc.slc[i].ch1_status = 0x00;
 188  0087 7b02          	ld	a,(OFST+0,sp)
 189  0089 97            	ld	xl,a
 190  008a a61a          	ld	a,#26
 191  008c 42            	mul	x,a
 192  008d 724f01d2      	clr	(_sc+466,x)
 193                     ; 61 		sc.slc[i].ch2_status = 0x00;
 195  0091 7b02          	ld	a,(OFST+0,sp)
 196  0093 97            	ld	xl,a
 197  0094 a61a          	ld	a,#26
 198  0096 42            	mul	x,a
 199  0097 724f01d3      	clr	(_sc+467,x)
 200                     ; 62 		sc.slc[i].ch3_status = 0x00;
 202  009b 7b02          	ld	a,(OFST+0,sp)
 203  009d 97            	ld	xl,a
 204  009e a61a          	ld	a,#26
 205  00a0 42            	mul	x,a
 206  00a1 724f01d4      	clr	(_sc+468,x)
 207                     ; 63 		sc.slc[i].ch4_status = 0x00;
 209  00a5 7b02          	ld	a,(OFST+0,sp)
 210  00a7 97            	ld	xl,a
 211  00a8 a61a          	ld	a,#26
 212  00aa 42            	mul	x,a
 213  00ab 724f01d5      	clr	(_sc+469,x)
 214                     ; 64 		sc.spc[i].firmware = 0x00;
 216  00af 7b02          	ld	a,(OFST+0,sp)
 217  00b1 97            	ld	xl,a
 218  00b2 a61c          	ld	a,#28
 219  00b4 42            	mul	x,a
 220  00b5 724f001f      	clr	(_sc+31,x)
 221                     ; 65 		sc.spc[i].HWTtest = 0xC0;
 223  00b9 7b02          	ld	a,(OFST+0,sp)
 224  00bb 97            	ld	xl,a
 225  00bc a61c          	ld	a,#28
 226  00be 42            	mul	x,a
 227  00bf a6c0          	ld	a,#192
 228  00c1 d70020        	ld	(_sc+32,x),a
 229                     ; 66 		sc.spc[i].MDID = 0x00;
 231  00c4 7b02          	ld	a,(OFST+0,sp)
 232  00c6 97            	ld	xl,a
 233  00c7 a61c          	ld	a,#28
 234  00c9 42            	mul	x,a
 235  00ca 905f          	clrw	y
 236  00cc df002c        	ldw	(_sc+44,x),y
 237                     ; 67 		sc.spc[i].model = 0x00;
 239  00cf 7b02          	ld	a,(OFST+0,sp)
 240  00d1 97            	ld	xl,a
 241  00d2 a61c          	ld	a,#28
 242  00d4 42            	mul	x,a
 243  00d5 724f0021      	clr	(_sc+33,x)
 244                     ; 68 		sc.spc[i].flag._flag_byte = 0x00;
 246  00d9 7b02          	ld	a,(OFST+0,sp)
 247  00db 97            	ld	xl,a
 248  00dc a61c          	ld	a,#28
 249  00de 42            	mul	x,a
 250  00df 724f0034      	clr	(_sc+52,x)
 251                     ; 69 		sc.spc[i].energy_consum = 0x0000;
 253  00e3 7b02          	ld	a,(OFST+0,sp)
 254  00e5 97            	ld	xl,a
 255  00e6 a61c          	ld	a,#28
 256  00e8 42            	mul	x,a
 257  00e9 905f          	clrw	y
 258  00eb df0032        	ldw	(_sc+50,x),y
 259                     ; 70 		sc.spc[i].ch1_status = 0x00;
 261  00ee 7b02          	ld	a,(OFST+0,sp)
 262  00f0 97            	ld	xl,a
 263  00f1 a61c          	ld	a,#28
 264  00f3 42            	mul	x,a
 265  00f4 724f002e      	clr	(_sc+46,x)
 266                     ; 71 		sc.spc[i].ch2_status = 0x00;
 268  00f8 7b02          	ld	a,(OFST+0,sp)
 269  00fa 97            	ld	xl,a
 270  00fb a61c          	ld	a,#28
 271  00fd 42            	mul	x,a
 272  00fe 724f002f      	clr	(_sc+47,x)
 273                     ; 72 		sc.spc[i].ch3_status = 0x00;
 275  0102 7b02          	ld	a,(OFST+0,sp)
 276  0104 97            	ld	xl,a
 277  0105 a61c          	ld	a,#28
 278  0107 42            	mul	x,a
 279  0108 724f0030      	clr	(_sc+48,x)
 280                     ; 73 		sc.spc[i].ch4_status = 0x00;	
 282  010c 7b02          	ld	a,(OFST+0,sp)
 283  010e 97            	ld	xl,a
 284  010f a61c          	ld	a,#28
 285  0111 42            	mul	x,a
 286  0112 724f0031      	clr	(_sc+49,x)
 287                     ; 50 	for(i = 0; i < 15; i++){
 289  0116 0c02          	inc	(OFST+0,sp)
 292  0118 7b02          	ld	a,(OFST+0,sp)
 293  011a a10f          	cp	a,#15
 294  011c 2403          	jruge	L21
 295  011e cc0027        	jp	L73
 296  0121               L21:
 297                     ; 75 }
 300  0121 85            	popw	x
 301  0122 81            	ret
 368                     ; 85 void main (void) { 
 369                     .text:	section	.text,new
 370  0000               _main:
 372  0000 5204          	subw	sp,#4
 373       00000004      OFST:	set	4
 376                     ; 86 	int ret,i,j,k,slave_num = 0;
 378  0002 5f            	clrw	x
 379  0003 1f01          	ldw	(OFST-3,sp),x
 380                     ; 90   CLK->SWCR |= 0x02; //开启切换
 382  0005 721250c5      	bset	20677,#1
 383                     ; 91   CLK->SWR   = 0xb4;       //选择时钟为外部8M
 385  0009 35b450c4      	mov	20676,#180
 387  000d               L57:
 388                     ; 92   while((CLK->SWCR & 0x01)==0x01);
 390  000d c650c5        	ld	a,20677
 391  0010 a401          	and	a,#1
 392  0012 a101          	cp	a,#1
 393  0014 27f7          	jreq	L57
 394                     ; 93   CLK->CKDIVR = 0x80;    //不分频
 396  0016 358050c6      	mov	20678,#128
 397                     ; 94   CLK->SWCR  &= ~0x02; //关闭切换
 399  001a 721350c5      	bres	20677,#1
 400                     ; 96   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
 402  001e 4be0          	push	#224
 403  0020 4b08          	push	#8
 404  0022 ae5005        	ldw	x,#20485
 405  0025 cd0000        	call	_GPIO_Init
 407  0028 85            	popw	x
 408                     ; 97 	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
 410  0029 4be0          	push	#224
 411  002b 4b04          	push	#4
 412  002d ae5005        	ldw	x,#20485
 413  0030 cd0000        	call	_GPIO_Init
 415  0033 85            	popw	x
 416                     ; 98 	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 418  0034 4b08          	push	#8
 419  0036 ae5005        	ldw	x,#20485
 420  0039 cd0000        	call	_GPIO_WriteHigh
 422  003c 84            	pop	a
 423                     ; 99 	enableInterrupts();
 426  003d 9a            rim
 428                     ; 100 	Init_Time4();
 431  003e cd0000        	call	_Init_Time4
 433                     ; 102 	Init_uart2();
 435  0041 cd0000        	call	_Init_uart2
 437                     ; 104 	I2C_Config();
 439  0044 cd0000        	call	_I2C_Config
 441                     ; 105 	sys_init();
 443  0047 cd0000        	call	_sys_init
 445  004a               L101:
 446                     ; 109 		if(!init_slc_spc_done){
 448  004a 725d0015      	tnz	_init_slc_spc_done
 449  004e 260d          	jrne	L501
 450                     ; 110 		scan_device();
 452  0050 cd0000        	call	_scan_device
 454                     ; 111 		i2c_device_info();
 456  0053 cd0000        	call	_i2c_device_info
 458                     ; 112 		send_device_info();
 460  0056 cd0000        	call	_send_device_info
 462                     ; 113 		init_slc_spc_done = 1;
 464  0059 35010015      	mov	_init_slc_spc_done,#1
 465  005d               L501:
 466                     ; 116 		if(f_100ms){
 468  005d c60000        	ld	a,_Flag1_
 469  0060 a502          	bcp	a,#2
 470  0062 2746          	jreq	L701
 471                     ; 117 			f_100ms = 0;
 473  0064 72130000      	bres	_Flag1_,#1
 474                     ; 118 			if(action_dimmer_ext > 0)	{
 476  0068 725d0000      	tnz	_action_dimmer_ext
 477  006c 2739          	jreq	L111
 478                     ; 119 				action_dimmer_ext -= 1;
 480  006e 725a0000      	dec	_action_dimmer_ext
 481                     ; 120 				if(action_dimmer_ext == 0){
 483  0072 725d0000      	tnz	_action_dimmer_ext
 484  0076 262f          	jrne	L111
 485                     ; 122 					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
 487  0078 c60000        	ld	a,_action_dimmer_MDID
 488  007b cd0000        	call	_i2c_single_action_dimmer_result
 490  007e 5f            	clrw	x
 491  007f 97            	ld	xl,a
 492  0080 1f03          	ldw	(OFST-1,sp),x
 493                     ; 123 					if(ret == IIC_SUCCESS) {
 495  0082 1e03          	ldw	x,(OFST-1,sp)
 496  0084 2621          	jrne	L111
 497                     ; 124 						action_dimmer_MDID = 0x00;
 499  0086 725f0000      	clr	_action_dimmer_MDID
 500                     ; 125 						delay(10);
 502  008a ae000a        	ldw	x,#10
 503  008d cd0000        	call	_delay
 505                     ; 126 						sicp_receipt_Done(0x05,rev_ad_message_id,ns_own_meshid_H,ns_own_meshid_L,0x01,rev_ad_mdid);
 507  0090 3b0000        	push	_rev_ad_mdid
 508  0093 4b01          	push	#1
 509  0095 3b0000        	push	_ns_own_meshid_L
 510  0098 3b0000        	push	_ns_own_meshid_H
 511  009b c60000        	ld	a,_rev_ad_message_id
 512  009e 97            	ld	xl,a
 513  009f a605          	ld	a,#5
 514  00a1 95            	ld	xh,a
 515  00a2 cd0000        	call	_sicp_receipt_Done
 517  00a5 5b04          	addw	sp,#4
 518  00a7               L111:
 519                     ; 130 			rev_anaylze();
 521  00a7 cd0000        	call	_rev_anaylze
 523  00aa               L701:
 524                     ; 137 		if(f_1s){
 526  00aa c60000        	ld	a,_Flag1_
 527  00ad a508          	bcp	a,#8
 528  00af 2799          	jreq	L101
 529                     ; 138 			f_1s = 0;
 531  00b1 72170000      	bres	_Flag1_,#3
 532                     ; 139 			tick_5s++;
 534  00b5 725c0000      	inc	_tick_5s
 535                     ; 140 			check_send_repeatedly();
 537  00b9 cd0000        	call	_check_send_repeatedly
 539                     ; 141 			report_energy_consum();
 541  00bc cd0000        	call	_report_energy_consum
 543                     ; 142 			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
 545  00bf c60000        	ld	a,_tick_5s
 546  00c2 a105          	cp	a,#5
 547  00c4 2507          	jrult	L121
 550  00c6 725f0000      	clr	_tick_5s
 553  00ca cd0000        	call	_i2c_heartbeat
 555  00cd               L121:
 556                     ; 143 			send_malfunction();
 558  00cd cd0000        	call	_send_malfunction
 560                     ; 144 			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
 562  00d0 4b08          	push	#8
 563  00d2 ae5005        	ldw	x,#20485
 564  00d5 cd0000        	call	_GPIO_WriteReverse
 566  00d8 84            	pop	a
 567  00d9 ac4a004a      	jpf	L101
 602                     ; 158 void assert_failed(uint8_t* file, uint32_t line)
 602                     ; 159 { 
 603                     .text:	section	.text,new
 604  0000               _assert_failed:
 608  0000               L141:
 609  0000 20fe          	jra	L141
 679                     	xdef	_main
 680                     	switch	.bss
 681  0000               _tick_5s:
 682  0000 00            	ds.b	1
 683                     	xdef	_tick_5s
 684  0001               _read_buffer:
 685  0001 000000000000  	ds.b	10
 686                     	xdef	_read_buffer
 687  000b               _write_buffer:
 688  000b 000000000000  	ds.b	10
 689                     	xdef	_write_buffer
 690                     	xdef	_IIC_ErrorStr
 691                     	xdef	_DUMMY_INIT
 692                     	xref	_i2c_single_action_dimmer_result
 693                     	xref	_i2c_heartbeat
 694                     	xref	_i2c_device_info
 695                     	xref	_scan_device
 696                     	xref	_action_dimmer_ext
 697                     	xref	_action_dimmer_MDID
 698  0015               _init_slc_spc_done:
 699  0015 00            	ds.b	1
 700                     	xdef	_init_slc_spc_done
 701                     	xdef	_sys_init
 702                     	xref	_check_send_repeatedly
 703                     	xref	_send_malfunction
 704                     	xref	_send_device_info
 705                     	xref	_report_energy_consum
 706                     	xref	_sicp_receipt_Done
 707                     	xref	_rev_anaylze
 708                     	xref	_Init_uart2
 709                     	xref	_rev_ad_mdid
 710                     	xref	_rev_ad_message_id
 711                     	xref	_ns_host_meshid_L
 712                     	xref	_ns_host_meshid_H
 713                     	xref	_ns_own_meshid_L
 714                     	xref	_ns_own_meshid_H
 715                     	xref	_sc
 716                     	xref	_Init_Time4
 717                     	xref	_Flag1_
 718                     	xref	_I2C_Config
 719                     	xref	_delay
 720                     	xdef	_assert_failed
 721                     	xref	_GPIO_WriteReverse
 722                     	xref	_GPIO_WriteHigh
 723                     	xref	_GPIO_Init
 724                     	switch	.const
 725  000a               L11:
 726  000a 4949435f4552  	dc.b	"IIC_ERROR_NOT_ACK",0
 727  001c               L7:
 728  001c 4949435f4552  	dc.b	"IIC_ERROR_BUSY",0
 729  002b               L5:
 730  002b 4949435f4552  	dc.b	"IIC_ERROR_TIME_OUT",0
 731  003e               L3:
 732  003e 4949435f5355  	dc.b	"IIC_SUCCESS",0
 752                     	end
