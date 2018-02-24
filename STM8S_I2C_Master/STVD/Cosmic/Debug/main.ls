   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	switch	.data
   5  0000               _slcspc_heartbeat_counts:
   6  0000 00            	dc.b	0
   7  0001               _cmd_led_flag:
   8  0001 00            	dc.b	0
  57                     .const:	section	.text
  58  0000               L6:
  59  0000 00004000      	dc.l	16384
  60                     ; 38 void MEEPROM_WriteByte(u16 dLocal_Addr, u8 dLocal_Data)
  60                     ; 39 {
  61                     	scross	off
  62                     .text:	section	.text,new
  63  0000               _MEEPROM_WriteByte:
  65  0000 89            	pushw	x
  66       00000000      OFST:	set	0
  69                     ; 40    FLASH_Unlock(FLASH_MEMTYPE_DATA);
  71  0001 a6f7          	ld	a,#247
  72  0003 cd0000        	call	_FLASH_Unlock
  75  0006               L13:
  76                     ; 41    while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
  78  0006 a608          	ld	a,#8
  79  0008 cd0000        	call	_FLASH_GetFlagStatus
  81  000b 4d            	tnz	a
  82  000c 27f8          	jreq	L13
  83                     ; 43    FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr, dLocal_Data);
  85  000e 7b05          	ld	a,(OFST+5,sp)
  86  0010 88            	push	a
  87  0011 1e02          	ldw	x,(OFST+2,sp)
  88  0013 cd0000        	call	c_uitolx
  90  0016 ae0000        	ldw	x,#L6
  91  0019 cd0000        	call	c_ladd
  93  001c be02          	ldw	x,c_lreg+2
  94  001e 89            	pushw	x
  95  001f be00          	ldw	x,c_lreg
  96  0021 89            	pushw	x
  97  0022 cd0000        	call	_FLASH_ProgramByte
  99  0025 5b05          	addw	sp,#5
 100                     ; 44    FLASH_Lock(FLASH_MEMTYPE_DATA);
 102  0027 a6f7          	ld	a,#247
 103  0029 cd0000        	call	_FLASH_Lock
 105                     ; 46 }
 108  002c 85            	popw	x
 109  002d 81            	ret
 149                     ; 52  u8 MEEPROM_ReadByte(u16 dLocal_Addr)
 149                     ; 53  {
 150                     .text:	section	.text,new
 151  0000               _MEEPROM_ReadByte:
 153  0000 88            	push	a
 154       00000001      OFST:	set	1
 157                     ; 55 	 dLocal_1 = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
 159  0001 cd0000        	call	c_uitolx
 161  0004 ae0000        	ldw	x,#L6
 162  0007 cd0000        	call	c_ladd
 164  000a be02          	ldw	x,c_lreg+2
 165  000c 89            	pushw	x
 166  000d be00          	ldw	x,c_lreg
 167  000f 89            	pushw	x
 168  0010 cd0000        	call	_FLASH_ReadByte
 170  0013 5b04          	addw	sp,#4
 171  0015 6b01          	ld	(OFST+0,sp),a
 172                     ; 56 	 return dLocal_1;
 174  0017 7b01          	ld	a,(OFST+0,sp)
 177  0019 5b01          	addw	sp,#1
 178  001b 81            	ret
 202                     ; 63  void default_info_set(void)
 202                     ; 64  {	 
 203                     .text:	section	.text,new
 204  0000               _default_info_set:
 208                     ; 66 	 MEEPROM_WriteByte(EEPROM_MESHID_H_ADDRESS, 0);
 210  0000 4b00          	push	#0
 211  0002 ae0031        	ldw	x,#49
 212  0005 cd0000        	call	_MEEPROM_WriteByte
 214  0008 84            	pop	a
 215                     ; 67 	 MEEPROM_WriteByte(EEPROM_MESHID_L_ADDRESS, 0);
 217  0009 4b00          	push	#0
 218  000b ae0032        	ldw	x,#50
 219  000e cd0000        	call	_MEEPROM_WriteByte
 221  0011 84            	pop	a
 222                     ; 69  }
 225  0012 81            	ret
 261                     ; 76 void device_info_read(void)
 261                     ; 77 {
 262                     .text:	section	.text,new
 263  0000               _device_info_read:
 265  0000 88            	push	a
 266       00000001      OFST:	set	1
 269                     ; 78 	u8 temp = 0;
 271  0001 0f01          	clr	(OFST+0,sp)
 272                     ; 80 	sc.model = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MODEL_ADDRESS);
 274  0003 ae400b        	ldw	x,#16395
 275  0006 89            	pushw	x
 276  0007 ae0000        	ldw	x,#0
 277  000a 89            	pushw	x
 278  000b cd0000        	call	_FLASH_ReadByte
 280  000e 5b04          	addw	sp,#4
 281  0010 c70005        	ld	_sc+5,a
 282                     ; 81 	sc.firmware_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_FW_VERSION_ADDRESS);   
 284  0013 ae400d        	ldw	x,#16397
 285  0016 89            	pushw	x
 286  0017 ae0000        	ldw	x,#0
 287  001a 89            	pushw	x
 288  001b cd0000        	call	_FLASH_ReadByte
 290  001e 5b04          	addw	sp,#4
 291  0020 c70006        	ld	_sc+6,a
 292                     ; 82 	if(sc.firmware_version == 1){	   /* 第一版本，device ID 4个字节  */	   
 294  0023 c60006        	ld	a,_sc+6
 295  0026 a101          	cp	a,#1
 296  0028 2640          	jrne	L77
 297                     ; 83 		   sc.deviceID[0] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 3);
 299  002a ae4004        	ldw	x,#16388
 300  002d 89            	pushw	x
 301  002e ae0000        	ldw	x,#0
 302  0031 89            	pushw	x
 303  0032 cd0000        	call	_FLASH_ReadByte
 305  0035 5b04          	addw	sp,#4
 306  0037 c70000        	ld	_sc,a
 307                     ; 84 		   sc.deviceID[1] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 2);
 309  003a ae4003        	ldw	x,#16387
 310  003d 89            	pushw	x
 311  003e ae0000        	ldw	x,#0
 312  0041 89            	pushw	x
 313  0042 cd0000        	call	_FLASH_ReadByte
 315  0045 5b04          	addw	sp,#4
 316  0047 c70001        	ld	_sc+1,a
 317                     ; 85 		   sc.deviceID[2] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 1);
 319  004a ae4002        	ldw	x,#16386
 320  004d 89            	pushw	x
 321  004e ae0000        	ldw	x,#0
 322  0051 89            	pushw	x
 323  0052 cd0000        	call	_FLASH_ReadByte
 325  0055 5b04          	addw	sp,#4
 326  0057 c70002        	ld	_sc+2,a
 327                     ; 86 		   sc.deviceID[3] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 0);
 329  005a ae4001        	ldw	x,#16385
 330  005d 89            	pushw	x
 331  005e ae0000        	ldw	x,#0
 332  0061 89            	pushw	x
 333  0062 cd0000        	call	_FLASH_ReadByte
 335  0065 5b04          	addw	sp,#4
 336  0067 c70003        	ld	_sc+3,a
 337  006a               L77:
 338                     ; 88 	sc.HW_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_HW_VERSION_ADDRESS);
 340  006a ae400f        	ldw	x,#16399
 341  006d 89            	pushw	x
 342  006e ae0000        	ldw	x,#0
 343  0071 89            	pushw	x
 344  0072 cd0000        	call	_FLASH_ReadByte
 346  0075 5b04          	addw	sp,#4
 347  0077 c70007        	ld	_sc+7,a
 348                     ; 90 	temp = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 0);
 350  007a ae4011        	ldw	x,#16401
 351  007d 89            	pushw	x
 352  007e ae0000        	ldw	x,#0
 353  0081 89            	pushw	x
 354  0082 cd0000        	call	_FLASH_ReadByte
 356  0085 5b04          	addw	sp,#4
 357  0087 6b01          	ld	(OFST+0,sp),a
 358                     ; 91 	sc.bash = temp + 256 * FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 1);
 360  0089 ae4012        	ldw	x,#16402
 361  008c 89            	pushw	x
 362  008d ae0000        	ldw	x,#0
 363  0090 89            	pushw	x
 364  0091 cd0000        	call	_FLASH_ReadByte
 366  0094 5b04          	addw	sp,#4
 367  0096 5f            	clrw	x
 368  0097 97            	ld	xl,a
 369  0098 4f            	clr	a
 370  0099 02            	rlwa	x,a
 371  009a 01            	rrwa	x,a
 372  009b 1b01          	add	a,(OFST+0,sp)
 373  009d 2401          	jrnc	L61
 374  009f 5c            	incw	x
 375  00a0               L61:
 376  00a0 c7000c        	ld	_sc+12,a
 377  00a3 9f            	ld	a,xl
 378  00a4 c7000b        	ld	_sc+11,a
 379                     ; 93 	sc.manaYear = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_YEAR_ADDRESS);
 381  00a7 ae4013        	ldw	x,#16403
 382  00aa 89            	pushw	x
 383  00ab ae0000        	ldw	x,#0
 384  00ae 89            	pushw	x
 385  00af cd0000        	call	_FLASH_ReadByte
 387  00b2 5b04          	addw	sp,#4
 388  00b4 c70008        	ld	_sc+8,a
 389                     ; 94 	sc.manaMonth = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_MONTH_ADDRESS);
 391  00b7 ae4014        	ldw	x,#16404
 392  00ba 89            	pushw	x
 393  00bb ae0000        	ldw	x,#0
 394  00be 89            	pushw	x
 395  00bf cd0000        	call	_FLASH_ReadByte
 397  00c2 5b04          	addw	sp,#4
 398  00c4 c70009        	ld	_sc+9,a
 399                     ; 95 	sc.manaDay = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_DAY_ADDRESS);
 401  00c7 ae4015        	ldw	x,#16405
 402  00ca 89            	pushw	x
 403  00cb ae0000        	ldw	x,#0
 404  00ce 89            	pushw	x
 405  00cf cd0000        	call	_FLASH_ReadByte
 407  00d2 5b04          	addw	sp,#4
 408  00d4 c7000a        	ld	_sc+10,a
 409                     ; 97 	ns_host_meshid_H = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MESHID_H_ADDRESS);
 411  00d7 ae4031        	ldw	x,#16433
 412  00da 89            	pushw	x
 413  00db ae0000        	ldw	x,#0
 414  00de 89            	pushw	x
 415  00df cd0000        	call	_FLASH_ReadByte
 417  00e2 5b04          	addw	sp,#4
 418  00e4 c70000        	ld	_ns_host_meshid_H,a
 419                     ; 98 	ns_host_meshid_L = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MESHID_L_ADDRESS);
 421  00e7 ae4032        	ldw	x,#16434
 422  00ea 89            	pushw	x
 423  00eb ae0000        	ldw	x,#0
 424  00ee 89            	pushw	x
 425  00ef cd0000        	call	_FLASH_ReadByte
 427  00f2 5b04          	addw	sp,#4
 428  00f4 c70000        	ld	_ns_host_meshid_L,a
 429                     ; 101 }
 432  00f7 84            	pop	a
 433  00f8 81            	ret
 470                     ; 107 void MEEPROM_Init(void)
 470                     ; 108 {
 471                     .text:	section	.text,new
 472  0000               _MEEPROM_Init:
 474  0000 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 109 	u8 temp = 0;
 480  0001 0f01          	clr	(OFST+0,sp)
 481                     ; 111 	FLASH_DeInit();
 483  0003 cd0000        	call	_FLASH_DeInit
 485                     ; 112 	temp = MEEPROM_ReadByte(EEPROM_INIT_ADDRESS);
 487  0006 5f            	clrw	x
 488  0007 cd0000        	call	_MEEPROM_ReadByte
 490  000a 6b01          	ld	(OFST+0,sp),a
 491                     ; 117 	if(temp != EEPROM_INIT_FLAG) {	   
 493  000c 0d01          	tnz	(OFST+0,sp)
 494  000e 270a          	jreq	L511
 495                     ; 118 		   MEEPROM_WriteByte(EEPROM_INIT_ADDRESS, EEPROM_INIT_FLAG);
 497  0010 4b00          	push	#0
 498  0012 5f            	clrw	x
 499  0013 cd0000        	call	_MEEPROM_WriteByte
 501  0016 84            	pop	a
 502                     ; 119 		   default_info_set();
 504  0017 cd0000        	call	_default_info_set
 506  001a               L511:
 507                     ; 122 	device_info_read();
 509  001a cd0000        	call	_device_info_read
 511                     ; 124 }
 514  001d 84            	pop	a
 515  001e 81            	ret
 542                     ; 131 void sys_init(void)
 542                     ; 132 {
 543                     .text:	section	.text,new
 544  0000               _sys_init:
 548                     ; 135 	memset(&sc, 0, sizeof(sc));
 550  0000 ae048b        	ldw	x,#1163
 551  0003               L42:
 552  0003 724fffff      	clr	(_sc-1,x)
 553  0007 5a            	decw	x
 554  0008 26f9          	jrne	L42
 555                     ; 137 	sc.scanDevFlag = 1;		/* 上电扫描设备是否存在 */
 557  000a 35010004      	mov	_sc+4,#1
 558                     ; 139 	ns_own_meshid_H = 0;
 560  000e 725f0000      	clr	_ns_own_meshid_H
 561                     ; 140 	ns_own_meshid_L = 0;
 563  0012 725f0000      	clr	_ns_own_meshid_L
 564                     ; 142 }
 567  0016 81            	ret
 590                     ; 149 void system_clock_set(void)
 590                     ; 150 {
 591                     .text:	section	.text,new
 592  0000               _system_clock_set:
 596                     ; 153 	CLK->SWCR |= 0x02; //开启切换
 598  0000 721250c5      	bset	20677,#1
 599                     ; 155 	CLK->SWR   = 0xb4;		 //选择时钟为外部16M
 601  0004 35b450c4      	mov	20676,#180
 603  0008               L341:
 604                     ; 156 	while((CLK->SWCR & 0x01) == 0x01);
 606  0008 c650c5        	ld	a,20677
 607  000b a401          	and	a,#1
 608  000d a101          	cp	a,#1
 609  000f 27f7          	jreq	L341
 610                     ; 157 	CLK->CKDIVR = 0x80;    //不分频
 612  0011 358050c6      	mov	20678,#128
 613                     ; 159 	CLK->SWCR  &= ~0x02; //关闭切换
 615  0015 721350c5      	bres	20677,#1
 616                     ; 161 }
 619  0019 81            	ret
 645                     ; 166 void system_led_init(void)
 645                     ; 167 {
 646                     .text:	section	.text,new
 647  0000               _system_led_init:
 651                     ; 170   	GPIO_Init(SYSTEM_LED_PORT, (GPIO_Pin_TypeDef)SYSTEM_LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST); 
 653  0000 4be0          	push	#224
 654  0002 4b08          	push	#8
 655  0004 ae5005        	ldw	x,#20485
 656  0007 cd0000        	call	_GPIO_Init
 658  000a 85            	popw	x
 659                     ; 171 	GPIO_Init(COMM_LED_PORT, (GPIO_Pin_TypeDef)COMM_LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST); 
 661  000b 4be0          	push	#224
 662  000d 4b04          	push	#4
 663  000f ae5005        	ldw	x,#20485
 664  0012 cd0000        	call	_GPIO_Init
 666  0015 85            	popw	x
 667                     ; 173 	SYSTEM_LED_ON;
 669  0016 4b08          	push	#8
 670  0018 ae5005        	ldw	x,#20485
 671  001b cd0000        	call	_GPIO_WriteLow
 673  001e 84            	pop	a
 674                     ; 174 	COMM_LED_OFF;
 676  001f 4b04          	push	#4
 677  0021 ae5005        	ldw	x,#20485
 678  0024 cd0000        	call	_GPIO_WriteHigh
 680  0027 84            	pop	a
 681                     ; 175 }
 684  0028 81            	ret
 709                     ; 181 void interrupt_priority_set(void)
 709                     ; 182 {
 710                     .text:	section	.text,new
 711  0000               _interrupt_priority_set:
 715                     ; 197 		enableInterrupts();
 718  0000 9a            rim
 720                     ; 199 }
 724  0001 81            	ret
 766                     ; 210 void slc_dimmer_finish_and_search(void)
 766                     ; 211 {
 767                     .text:	section	.text,new
 768  0000               _slc_dimmer_finish_and_search:
 770  0000 88            	push	a
 771       00000001      OFST:	set	1
 774                     ; 214 	if(sc.slcMultipleDimmer){
 776  0001 725d0023      	tnz	_sc+35
 777  0005 2716          	jreq	L302
 778                     ; 216 		sc.slcMultipleDimmer--;
 780  0007 725a0023      	dec	_sc+35
 781                     ; 217 		if(sc.slcMultipleDimmer == 0){
 783  000b 725d0023      	tnz	_sc+35
 784  000f 260c          	jrne	L302
 785                     ; 218 			slcspc_heartbeat();			//心跳查询所有设备	
 787  0011 cd0000        	call	_slcspc_heartbeat
 789                     ; 219 			slcspc_heartbeat_counts = 0;
 791  0014 725f0000      	clr	_slcspc_heartbeat_counts
 792                     ; 220 			sicp_heart_beat(SICP_SEND);		//心跳包 发送给ss		
 794  0018 a601          	ld	a,#1
 795  001a cd0000        	call	_sicp_heart_beat
 797  001d               L302:
 798                     ; 224 	if(sc.spcMultipleSync){
 800  001d 725d0024      	tnz	_sc+36
 801  0021 2716          	jreq	L702
 802                     ; 226 		sc.spcMultipleSync--;
 804  0023 725a0024      	dec	_sc+36
 805                     ; 227 		if(sc.spcMultipleSync == 0){
 807  0027 725d0024      	tnz	_sc+36
 808  002b 260c          	jrne	L702
 809                     ; 228 			slcspc_heartbeat();			//心跳查询所有设备	
 811  002d cd0000        	call	_slcspc_heartbeat
 813                     ; 229 			slcspc_heartbeat_counts = 0;
 815  0030 725f0000      	clr	_slcspc_heartbeat_counts
 816                     ; 230 			sicp_heart_beat(SICP_SEND);		//心跳包 发送给ss		
 818  0034 a601          	ld	a,#1
 819  0036 cd0000        	call	_sicp_heart_beat
 821  0039               L702:
 822                     ; 234 	for(i = 0; i < 15; i++){
 824  0039 0f01          	clr	(OFST+0,sp)
 825  003b               L312:
 826                     ; 236 		if(sc.slc[i].MDID && sc.slc[i].singleDimmer){
 828  003b 7b01          	ld	a,(OFST+0,sp)
 829  003d 97            	ld	xl,a
 830  003e a624          	ld	a,#36
 831  0040 42            	mul	x,a
 832  0041 724d0288      	tnz	(_sc+648,x)
 833  0045 2740          	jreq	L122
 835  0047 7b01          	ld	a,(OFST+0,sp)
 836  0049 97            	ld	xl,a
 837  004a a624          	ld	a,#36
 838  004c 42            	mul	x,a
 839  004d 724d028e      	tnz	(_sc+654,x)
 840  0051 2734          	jreq	L122
 841                     ; 237 			sc.slc[i].singleDimmer--;
 843  0053 7b01          	ld	a,(OFST+0,sp)
 844  0055 97            	ld	xl,a
 845  0056 a624          	ld	a,#36
 846  0058 42            	mul	x,a
 847  0059 724a028e      	dec	(_sc+654,x)
 848                     ; 238 			if(sc.slc[i].singleDimmer == 0){
 850  005d 7b01          	ld	a,(OFST+0,sp)
 851  005f 97            	ld	xl,a
 852  0060 a624          	ld	a,#36
 853  0062 42            	mul	x,a
 854  0063 724d028e      	tnz	(_sc+654,x)
 855  0067 261e          	jrne	L122
 856                     ; 239 				slcspc_single_action_dimmer_result(i + 1);
 858  0069 7b01          	ld	a,(OFST+0,sp)
 859  006b 4c            	inc	a
 860  006c cd0000        	call	_slcspc_single_action_dimmer_result
 862                     ; 240 				sicp_receipt_Done(0x05, sicp_get_message_id(), ns_host_meshid_H, ns_host_meshid_L, 0x01, i + 1);
 864  006f 7b01          	ld	a,(OFST+0,sp)
 865  0071 4c            	inc	a
 866  0072 88            	push	a
 867  0073 4b01          	push	#1
 868  0075 3b0000        	push	_ns_host_meshid_L
 869  0078 3b0000        	push	_ns_host_meshid_H
 870  007b cd0000        	call	_sicp_get_message_id
 872  007e 97            	ld	xl,a
 873  007f a605          	ld	a,#5
 874  0081 95            	ld	xh,a
 875  0082 cd0000        	call	_sicp_receipt_Done
 877  0085 5b04          	addw	sp,#4
 878  0087               L122:
 879                     ; 245 		if(sc.spc[i].MDID && sc.spc[i].syncTimes){
 881  0087 7b01          	ld	a,(OFST+0,sp)
 882  0089 97            	ld	xl,a
 883  008a a627          	ld	a,#39
 884  008c 42            	mul	x,a
 885  008d 724d003f      	tnz	(_sc+63,x)
 886  0091 273a          	jreq	L522
 888  0093 7b01          	ld	a,(OFST+0,sp)
 889  0095 97            	ld	xl,a
 890  0096 a627          	ld	a,#39
 891  0098 42            	mul	x,a
 892  0099 724d0048      	tnz	(_sc+72,x)
 893  009d 272e          	jreq	L522
 894                     ; 247 			sc.spc[i].syncTimes--;
 896  009f 7b01          	ld	a,(OFST+0,sp)
 897  00a1 97            	ld	xl,a
 898  00a2 a627          	ld	a,#39
 899  00a4 42            	mul	x,a
 900  00a5 724a0048      	dec	(_sc+72,x)
 901                     ; 248 			if(sc.spc[i].syncTimes == 0){
 903  00a9 7b01          	ld	a,(OFST+0,sp)
 904  00ab 97            	ld	xl,a
 905  00ac a627          	ld	a,#39
 906  00ae 42            	mul	x,a
 907  00af 724d0048      	tnz	(_sc+72,x)
 908  00b3 2618          	jrne	L522
 909                     ; 249 				sicp_receipt_Done(0x05, sicp_get_message_id(), ns_host_meshid_H, ns_host_meshid_L, 0x02, i + 1);
 911  00b5 7b01          	ld	a,(OFST+0,sp)
 912  00b7 4c            	inc	a
 913  00b8 88            	push	a
 914  00b9 4b02          	push	#2
 915  00bb 3b0000        	push	_ns_host_meshid_L
 916  00be 3b0000        	push	_ns_host_meshid_H
 917  00c1 cd0000        	call	_sicp_get_message_id
 919  00c4 97            	ld	xl,a
 920  00c5 a605          	ld	a,#5
 921  00c7 95            	ld	xh,a
 922  00c8 cd0000        	call	_sicp_receipt_Done
 924  00cb 5b04          	addw	sp,#4
 925  00cd               L522:
 926                     ; 234 	for(i = 0; i < 15; i++){
 928  00cd 0c01          	inc	(OFST+0,sp)
 931  00cf 7b01          	ld	a,(OFST+0,sp)
 932  00d1 a10f          	cp	a,#15
 933  00d3 2403          	jruge	L63
 934  00d5 cc003b        	jp	L312
 935  00d8               L63:
 936                     ; 259 }
 939  00d8 84            	pop	a
 940  00d9 81            	ret
 943                     	switch	.data
 944  0002               L132_cnt:
 945  0002 00            	dc.b	0
 977                     ; 264 void led_show(void)
 977                     ; 265 {
 978                     .text:	section	.text,new
 979  0000               _led_show:
 983                     ; 268 	if(cmd_led_flag == 1){		//接收到控制
 985  0000 c60001        	ld	a,_cmd_led_flag
 986  0003 a101          	cp	a,#1
 987  0005 261c          	jrne	L742
 988                     ; 270 		SYSTEM_LED_REVERSE;
 990  0007 4b08          	push	#8
 991  0009 ae5005        	ldw	x,#20485
 992  000c cd0000        	call	_GPIO_WriteReverse
 994  000f 84            	pop	a
 995                     ; 272 		cnt++;
 997  0010 725c0002      	inc	L132_cnt
 998                     ; 273 		if(cnt > 5){			
1000  0014 c60002        	ld	a,L132_cnt
1001  0017 a106          	cp	a,#6
1002  0019 2508          	jrult	L742
1003                     ; 274 			cnt = 0;
1005  001b 725f0002      	clr	L132_cnt
1006                     ; 275 			cmd_led_flag = 0;			
1008  001f 725f0001      	clr	_cmd_led_flag
1009  0023               L742:
1010                     ; 279 }
1013  0023 81            	ret
1071                     ; 293 void main (void) 
1071                     ; 294 { 
1072                     .text:	section	.text,new
1073  0000               _main:
1075  0000 89            	pushw	x
1076       00000002      OFST:	set	2
1079                     ; 295 	int ret = 0;
1081  0001 5f            	clrw	x
1082  0002 1f01          	ldw	(OFST-1,sp),x
1083                     ; 297 	system_clock_set();
1085  0004 cd0000        	call	_system_clock_set
1087                     ; 299 	system_led_init();
1089  0007 cd0000        	call	_system_led_init
1091                     ; 301 	slcspc_select_channel_init();
1093  000a cd0000        	call	_slcspc_select_channel_init
1095                     ; 303 	timer4_init();
1097  000d cd0000        	call	_timer4_init
1099                     ; 304 	timer2_init();
1101  0010 cd0000        	call	_timer2_init
1103                     ; 307 	uart1_init();
1105  0013 cd0000        	call	_uart1_init
1107                     ; 308 	uart3_init();
1109  0016 cd0000        	call	_uart3_init
1111                     ; 310 	sys_init();
1113  0019 cd0000        	call	_sys_init
1115                     ; 313 	interrupt_priority_set();
1117  001c cd0000        	call	_interrupt_priority_set
1119                     ; 315 	MEEPROM_Init();
1121  001f cd0000        	call	_MEEPROM_Init
1123                     ; 318 	delay(1000);		//等待SLC SPC上电完成初始化。
1125  0022 ae03e8        	ldw	x,#1000
1126  0025 cd0000        	call	_delay
1128                     ; 321 	rev_ssbroadcast = 0;
1130  0028 72150000      	bres	_UART1Flag2_,#2
1131  002c               L762:
1132                     ; 325 		if(sc.scanDevFlag){
1134  002c 725d0004      	tnz	_sc+4
1135  0030 2707          	jreq	L372
1136                     ; 326 			slcspc_device_info();
1138  0032 cd0000        	call	_slcspc_device_info
1140                     ; 327 			sc.scanDevFlag = 0;
1142  0035 725f0004      	clr	_sc+4
1143  0039               L372:
1144                     ; 330 		if(sicp_rev_success){
1146  0039 c60000        	ld	a,_UART1Flag1_
1147  003c a501          	bcp	a,#1
1148  003e 2707          	jreq	L572
1149                     ; 331 			sicp_rev_anaylze();			
1151  0040 cd0000        	call	_sicp_rev_anaylze
1153                     ; 332 			sicp_rev_success = 0;			
1155  0043 72110000      	bres	_UART1Flag1_,#0
1156  0047               L572:
1157                     ; 336 		if(f_100ms){
1159  0047 c60000        	ld	a,_Flag1_
1160  004a a502          	bcp	a,#2
1161  004c 2710          	jreq	L772
1162                     ; 337 			f_100ms = 0;
1164  004e 72130000      	bres	_Flag1_,#1
1165                     ; 338 			slc_dimmer_finish_and_search();	
1167  0052 cd0000        	call	_slc_dimmer_finish_and_search
1169                     ; 340 			if(cmd_led_flag){			//有数据接收,闪烁LED
1171  0055 725d0001      	tnz	_cmd_led_flag
1172  0059 2703          	jreq	L772
1173                     ; 341 				led_show();
1175  005b cd0000        	call	_led_show
1177  005e               L772:
1178                     ; 345 		if(f_1s){
1180  005e c60000        	ld	a,_Flag1_
1181  0061 a508          	bcp	a,#8
1182  0063 27c7          	jreq	L762
1183                     ; 346 			f_1s = 0;
1185  0065 72170000      	bres	_Flag1_,#3
1186                     ; 348 			if(rev_ssbroadcast == 0){		/* 还没发送deviceinfo */
1188  0069 c60000        	ld	a,_UART1Flag2_
1189  006c a504          	bcp	a,#4
1190  006e 260a          	jrne	L503
1191                     ; 349 				if(send_device_info_active()){
1193  0070 cd0000        	call	_send_device_info_active
1195  0073 4d            	tnz	a
1196  0074 2704          	jreq	L503
1197                     ; 350 					rev_ssbroadcast = 1;
1199  0076 72140000      	bset	_UART1Flag2_,#2
1200  007a               L503:
1201                     ; 354 			report_energy_consum();
1203  007a cd0000        	call	_report_energy_consum
1205                     ; 356 			slcspc_heartbeat_counts++;
1207  007d 725c0000      	inc	_slcspc_heartbeat_counts
1208                     ; 357 			if(slcspc_heartbeat_counts >= 5){
1210  0081 c60000        	ld	a,_slcspc_heartbeat_counts
1211  0084 a105          	cp	a,#5
1212  0086 2507          	jrult	L113
1213                     ; 358 				slcspc_heartbeat_counts = 0;
1215  0088 725f0000      	clr	_slcspc_heartbeat_counts
1216                     ; 359 				slcspc_heartbeat();
1218  008c cd0000        	call	_slcspc_heartbeat
1220  008f               L113:
1221                     ; 362 			malfunction_detect();
1223  008f cd0000        	call	_malfunction_detect
1225                     ; 364 			if(cmd_led_flag == 0){	//没有数据接收，正常翻转LED
1227  0092 725d0001      	tnz	_cmd_led_flag
1228  0096 2694          	jrne	L762
1229                     ; 365 				SYSTEM_LED_REVERSE;
1231  0098 4b08          	push	#8
1232  009a ae5005        	ldw	x,#20485
1233  009d cd0000        	call	_GPIO_WriteReverse
1235  00a0 84            	pop	a
1236  00a1 2089          	jra	L762
1271                     ; 384 void assert_failed(uint8_t* file, uint32_t line)
1271                     ; 385 { 
1272                     .text:	section	.text,new
1273  0000               _assert_failed:
1277  0000               L333:
1278  0000 20fe          	jra	L333
1308                     	xdef	_main
1309                     	xdef	_led_show
1310                     	xdef	_slc_dimmer_finish_and_search
1311                     	xdef	_interrupt_priority_set
1312                     	xdef	_system_led_init
1313                     	xdef	_system_clock_set
1314                     	xdef	_MEEPROM_Init
1315                     	xdef	_device_info_read
1316                     	xdef	_default_info_set
1317                     	xdef	_slcspc_heartbeat_counts
1318                     	xref	_memset
1319                     	xdef	_MEEPROM_ReadByte
1320                     	xdef	_MEEPROM_WriteByte
1321                     	xdef	_sys_init
1322                     	xdef	_cmd_led_flag
1323                     	xref	_slcspc_single_action_dimmer_result
1324                     	xref	_slcspc_heartbeat
1325                     	xref	_slcspc_device_info
1326                     	xref	_slcspc_select_channel_init
1327                     	xref	_sicp_get_message_id
1328                     	xref	_uart3_init
1329                     	xref	_delay
1330                     	xref	_sicp_heart_beat
1331                     	xref	_send_device_info_active
1332                     	xref	_malfunction_detect
1333                     	xref	_report_energy_consum
1334                     	xref	_sicp_receipt_Done
1335                     	xref	_sicp_rev_anaylze
1336                     	xref	_uart1_init
1337                     	xref	_ns_host_meshid_L
1338                     	xref	_ns_host_meshid_H
1339                     	xref	_ns_own_meshid_L
1340                     	xref	_ns_own_meshid_H
1341                     	xref	_sc
1342                     	xref	_UART1Flag2_
1343                     	xref	_UART1Flag1_
1344                     	xref	_timer2_init
1345                     	xref	_timer4_init
1346                     	xref	_Flag1_
1347                     	xdef	_assert_failed
1348                     	xref	_GPIO_WriteReverse
1349                     	xref	_GPIO_WriteLow
1350                     	xref	_GPIO_WriteHigh
1351                     	xref	_GPIO_Init
1352                     	xref	_FLASH_GetFlagStatus
1353                     	xref	_FLASH_ReadByte
1354                     	xref	_FLASH_ProgramByte
1355                     	xref	_FLASH_DeInit
1356                     	xref	_FLASH_Lock
1357                     	xref	_FLASH_Unlock
1358                     	xref.b	c_lreg
1377                     	xref	c_ladd
1378                     	xref	c_uitolx
1379                     	end
