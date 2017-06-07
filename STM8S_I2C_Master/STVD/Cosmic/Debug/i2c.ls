   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 188                     ; 8 u8 i2c_send_message(u8 type,I2C_Message *tx,u8 payload_len,u8 mdid,u8 nreadbytes)
 188                     ; 9 {
 190                     .text:	section	.text,new
 191  0000               _i2c_send_message:
 193  0000 88            	push	a
 194       00000000      OFST:	set	0
 197                     ; 10 	i2c_tx_buf[0] = tx->frame_h1;
 199  0001 1e04          	ldw	x,(OFST+4,sp)
 200  0003 f6            	ld	a,(x)
 201  0004 c70031        	ld	_i2c_tx_buf,a
 202                     ; 11 	i2c_tx_buf[1] = tx->frame_h2;
 204  0007 1e04          	ldw	x,(OFST+4,sp)
 205  0009 e601          	ld	a,(1,x)
 206  000b c70032        	ld	_i2c_tx_buf+1,a
 207                     ; 12 	i2c_tx_buf[2] = tx->message_id;
 209  000e 1e04          	ldw	x,(OFST+4,sp)
 210  0010 e602          	ld	a,(2,x)
 211  0012 c70033        	ld	_i2c_tx_buf+2,a
 212                     ; 13 	i2c_tx_buf[3] = 2+payload_len;
 214  0015 7b06          	ld	a,(OFST+6,sp)
 215  0017 ab02          	add	a,#2
 216  0019 c70034        	ld	_i2c_tx_buf+3,a
 217                     ; 14 	mymemcpy(&i2c_tx_buf[4],tx->payload,payload_len);
 219  001c 7b06          	ld	a,(OFST+6,sp)
 220  001e b703          	ld	c_lreg+3,a
 221  0020 3f02          	clr	c_lreg+2
 222  0022 3f01          	clr	c_lreg+1
 223  0024 3f00          	clr	c_lreg
 224  0026 be02          	ldw	x,c_lreg+2
 225  0028 89            	pushw	x
 226  0029 be00          	ldw	x,c_lreg
 227  002b 89            	pushw	x
 228  002c 1e08          	ldw	x,(OFST+8,sp)
 229  002e 1c0003        	addw	x,#3
 230  0031 89            	pushw	x
 231  0032 ae0035        	ldw	x,#_i2c_tx_buf+4
 232  0035 cd0000        	call	_mymemcpy
 234  0038 5b06          	addw	sp,#6
 235                     ; 15 	i2c_tx_buf[4+payload_len] = Check_Sum(&i2c_tx_buf[2],i2c_tx_buf[3]);
 237  003a 7b06          	ld	a,(OFST+6,sp)
 238  003c 5f            	clrw	x
 239  003d 97            	ld	xl,a
 240  003e 89            	pushw	x
 241  003f 3b0034        	push	_i2c_tx_buf+3
 242  0042 ae0033        	ldw	x,#_i2c_tx_buf+2
 243  0045 cd0000        	call	_Check_Sum
 245  0048 5b01          	addw	sp,#1
 246  004a 85            	popw	x
 247  004b d70035        	ld	(_i2c_tx_buf+4,x),a
 248                     ; 17 	if(type == 0x00)	return(I2C_WriteBytes(mdid,i2c_tx_buf,5+payload_len,50));
 250  004e 0d01          	tnz	(OFST+1,sp)
 251  0050 2617          	jrne	L111
 254  0052 4b32          	push	#50
 255  0054 7b07          	ld	a,(OFST+7,sp)
 256  0056 ab05          	add	a,#5
 257  0058 88            	push	a
 258  0059 ae0031        	ldw	x,#_i2c_tx_buf
 259  005c 89            	pushw	x
 260  005d 7b0b          	ld	a,(OFST+11,sp)
 261  005f 5f            	clrw	x
 262  0060 97            	ld	xl,a
 263  0061 cd0000        	call	_I2C_WriteBytes
 265  0064 5b04          	addw	sp,#4
 268  0066 5b01          	addw	sp,#1
 269  0068 81            	ret
 270  0069               L111:
 271                     ; 18 	else							return(I2C_WriteReadBytes(mdid,i2c_tx_buf,5+payload_len,i2c_rx_buf,nreadbytes,50));
 273  0069 4b32          	push	#50
 274  006b 7b09          	ld	a,(OFST+9,sp)
 275  006d 88            	push	a
 276  006e ae0012        	ldw	x,#_i2c_rx_buf
 277  0071 89            	pushw	x
 278  0072 7b0a          	ld	a,(OFST+10,sp)
 279  0074 ab05          	add	a,#5
 280  0076 88            	push	a
 281  0077 ae0031        	ldw	x,#_i2c_tx_buf
 282  007a 89            	pushw	x
 283  007b 7b0e          	ld	a,(OFST+14,sp)
 284  007d 5f            	clrw	x
 285  007e 97            	ld	xl,a
 286  007f cd0000        	call	_I2C_WriteReadBytes
 288  0082 5b07          	addw	sp,#7
 291  0084 5b01          	addw	sp,#1
 292  0086 81            	ret
 333                     ; 22 void scan_device(void)
 333                     ; 23 {
 334                     .text:	section	.text,new
 335  0000               _scan_device:
 337  0000 5203          	subw	sp,#3
 338       00000003      OFST:	set	3
 341                     ; 26 	device_flag = 0x00;
 343  0002 5f            	clrw	x
 344  0003 cf000f        	ldw	_device_flag,x
 345                     ; 27 	for(i=1;i <= 0x0F;i++){
 347  0006 a601          	ld	a,#1
 348  0008 6b03          	ld	(OFST+0,sp),a
 349  000a               L331:
 350                     ; 28 		ret = I2C_WriteBytes(i,NULL,0,10);
 352  000a 4b0a          	push	#10
 353  000c 4b00          	push	#0
 354  000e 5f            	clrw	x
 355  000f 89            	pushw	x
 356  0010 7b07          	ld	a,(OFST+4,sp)
 357  0012 5f            	clrw	x
 358  0013 97            	ld	xl,a
 359  0014 cd0000        	call	_I2C_WriteBytes
 361  0017 5b04          	addw	sp,#4
 362  0019 5f            	clrw	x
 363  001a 97            	ld	xl,a
 364  001b 1f01          	ldw	(OFST-2,sp),x
 365                     ; 29 		if(ret == IIC_SUCCESS){
 367  001d 1e01          	ldw	x,(OFST-2,sp)
 368  001f 2610          	jrne	L141
 369                     ; 30 			device_flag |= i;
 371  0021 7b03          	ld	a,(OFST+0,sp)
 372  0023 5f            	clrw	x
 373  0024 97            	ld	xl,a
 374  0025 01            	rrwa	x,a
 375  0026 ca0010        	or	a,_device_flag+1
 376  0029 01            	rrwa	x,a
 377  002a ca000f        	or	a,_device_flag
 378  002d 01            	rrwa	x,a
 379  002e cf000f        	ldw	_device_flag,x
 380  0031               L141:
 381                     ; 27 	for(i=1;i <= 0x0F;i++){
 383  0031 0c03          	inc	(OFST+0,sp)
 386  0033 7b03          	ld	a,(OFST+0,sp)
 387  0035 a110          	cp	a,#16
 388  0037 25d1          	jrult	L331
 389                     ; 33 }
 392  0039 5b03          	addw	sp,#3
 393  003b 81            	ret
 454                     ; 36 void i2c_device_info(void)
 454                     ; 37 {
 455                     .text:	section	.text,new
 456  0000               _i2c_device_info:
 458  0000 5224          	subw	sp,#36
 459       00000024      OFST:	set	36
 462                     ; 39 	u8 mdid = 0;
 464  0002 0f24          	clr	(OFST+0,sp)
 465                     ; 41 	for(i = 1;i <= 15;i++){
 467  0004 a601          	ld	a,#1
 468  0006 6b02          	ld	(OFST-34,sp),a
 469  0008               L761:
 470                     ; 42 		mdid++;
 472  0008 0c24          	inc	(OFST+0,sp)
 473                     ; 43 		if(device_flag & 0x01){
 475  000a c60010        	ld	a,_device_flag+1
 476  000d a501          	bcp	a,#1
 477  000f 2603          	jrne	L21
 478  0011 cc0169        	jp	L571
 479  0014               L21:
 480                     ; 44 			di.frame_h1 = 0x7E;
 482  0014 a67e          	ld	a,#126
 483  0016 6b03          	ld	(OFST-33,sp),a
 484                     ; 45 			di.frame_h2 = 0x7E;
 486  0018 a67e          	ld	a,#126
 487  001a 6b04          	ld	(OFST-32,sp),a
 488                     ; 46 			di.message_id = mdid;
 490  001c 7b24          	ld	a,(OFST+0,sp)
 491  001e 6b05          	ld	(OFST-31,sp),a
 492                     ; 47 			di.payload[0] = 0xFE;//自己定义
 494  0020 a6fe          	ld	a,#254
 495  0022 6b06          	ld	(OFST-30,sp),a
 496                     ; 48 			di.payload[1] = 0x01;//自己定义
 498  0024 a601          	ld	a,#1
 499  0026 6b07          	ld	(OFST-29,sp),a
 500                     ; 49 			ret = i2c_send_message(0x01,&di,2,mdid,13);
 502  0028 4b0d          	push	#13
 503  002a 7b25          	ld	a,(OFST+1,sp)
 504  002c 88            	push	a
 505  002d 4b02          	push	#2
 506  002f 96            	ldw	x,sp
 507  0030 1c0006        	addw	x,#OFST-30
 508  0033 89            	pushw	x
 509  0034 a601          	ld	a,#1
 510  0036 cd0000        	call	_i2c_send_message
 512  0039 5b05          	addw	sp,#5
 513  003b 6b01          	ld	(OFST-35,sp),a
 514                     ; 50 			if (ret == IIC_SUCCESS){
 516  003d 0d01          	tnz	(OFST-35,sp)
 517  003f 2703          	jreq	L41
 518  0041 cc0161        	jp	L771
 519  0044               L41:
 520                     ; 51 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[12]){//校验正确
 522  0044 3b0015        	push	_i2c_rx_buf+3
 523  0047 ae0014        	ldw	x,#_i2c_rx_buf+2
 524  004a cd0000        	call	_Check_Sum
 526  004d 5b01          	addw	sp,#1
 527  004f c1001e        	cp	a,_i2c_rx_buf+12
 528  0052 2703          	jreq	L61
 529  0054 cc0161        	jp	L771
 530  0057               L61:
 531                     ; 52 					if(i2c_rx_buf[4] == 0xB2){//此为SLC
 533  0057 c60016        	ld	a,_i2c_rx_buf+4
 534  005a a1b2          	cp	a,#178
 535  005c 2703cc00df    	jrne	L302
 536                     ; 53 						sc.slc[mdid-1].MDID = mdid;
 538  0061 7b24          	ld	a,(OFST+0,sp)
 539  0063 97            	ld	xl,a
 540  0064 a61a          	ld	a,#26
 541  0066 42            	mul	x,a
 542  0067 1d001a        	subw	x,#26
 543  006a 7b24          	ld	a,(OFST+0,sp)
 544  006c 905f          	clrw	y
 545  006e 9097          	ld	yl,a
 546  0070 df01d0        	ldw	(_sc+464,x),y
 547                     ; 54 						sc.slc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 549  0073 7b24          	ld	a,(OFST+0,sp)
 550  0075 97            	ld	xl,a
 551  0076 a61a          	ld	a,#26
 552  0078 42            	mul	x,a
 553  0079 1d001a        	subw	x,#26
 554  007c c60017        	ld	a,_i2c_rx_buf+5
 555  007f d701bf        	ld	(_sc+447,x),a
 556                     ; 55 						sc.slc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 558  0082 7b24          	ld	a,(OFST+0,sp)
 559  0084 97            	ld	xl,a
 560  0085 a61a          	ld	a,#26
 561  0087 42            	mul	x,a
 562  0088 1d001a        	subw	x,#26
 563  008b c60018        	ld	a,_i2c_rx_buf+6
 564  008e d701c0        	ld	(_sc+448,x),a
 565                     ; 56 						sc.slc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 567  0091 7b24          	ld	a,(OFST+0,sp)
 568  0093 97            	ld	xl,a
 569  0094 a61a          	ld	a,#26
 570  0096 42            	mul	x,a
 571  0097 1d001a        	subw	x,#26
 572  009a c60019        	ld	a,_i2c_rx_buf+7
 573  009d d701c1        	ld	(_sc+449,x),a
 574                     ; 57 						sc.slc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 576  00a0 7b24          	ld	a,(OFST+0,sp)
 577  00a2 97            	ld	xl,a
 578  00a3 a61a          	ld	a,#26
 579  00a5 42            	mul	x,a
 580  00a6 1d001a        	subw	x,#26
 581  00a9 c6001a        	ld	a,_i2c_rx_buf+8
 582  00ac d701c2        	ld	(_sc+450,x),a
 583                     ; 58 						sc.slc[mdid-1].model = i2c_rx_buf[9];
 585  00af 7b24          	ld	a,(OFST+0,sp)
 586  00b1 97            	ld	xl,a
 587  00b2 a61a          	ld	a,#26
 588  00b4 42            	mul	x,a
 589  00b5 1d001a        	subw	x,#26
 590  00b8 c6001b        	ld	a,_i2c_rx_buf+9
 591  00bb d701c5        	ld	(_sc+453,x),a
 592                     ; 59 						sc.slc[mdid-1].firmware = i2c_rx_buf[10];
 594  00be 7b24          	ld	a,(OFST+0,sp)
 595  00c0 97            	ld	xl,a
 596  00c1 a61a          	ld	a,#26
 597  00c3 42            	mul	x,a
 598  00c4 1d001a        	subw	x,#26
 599  00c7 c6001c        	ld	a,_i2c_rx_buf+10
 600  00ca d701c3        	ld	(_sc+451,x),a
 601                     ; 60 						sc.slc[mdid-1].HWTtest = i2c_rx_buf[11];
 603  00cd 7b24          	ld	a,(OFST+0,sp)
 604  00cf 97            	ld	xl,a
 605  00d0 a61a          	ld	a,#26
 606  00d2 42            	mul	x,a
 607  00d3 1d001a        	subw	x,#26
 608  00d6 c6001d        	ld	a,_i2c_rx_buf+11
 609  00d9 d701c4        	ld	(_sc+452,x),a
 611  00dc cc0161        	jra	L771
 612  00df               L302:
 613                     ; 62 					else if(i2c_rx_buf[4] == 0xB3){//此为SPC
 615  00df c60016        	ld	a,_i2c_rx_buf+4
 616  00e2 a1b3          	cp	a,#179
 617  00e4 267b          	jrne	L771
 618                     ; 63 						sc.spc[mdid-1].MDID = mdid;
 620  00e6 7b24          	ld	a,(OFST+0,sp)
 621  00e8 97            	ld	xl,a
 622  00e9 a61c          	ld	a,#28
 623  00eb 42            	mul	x,a
 624  00ec 1d001c        	subw	x,#28
 625  00ef 7b24          	ld	a,(OFST+0,sp)
 626  00f1 905f          	clrw	y
 627  00f3 9097          	ld	yl,a
 628  00f5 df002c        	ldw	(_sc+44,x),y
 629                     ; 64 						sc.spc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 631  00f8 7b24          	ld	a,(OFST+0,sp)
 632  00fa 97            	ld	xl,a
 633  00fb a61c          	ld	a,#28
 634  00fd 42            	mul	x,a
 635  00fe 1d001c        	subw	x,#28
 636  0101 c60017        	ld	a,_i2c_rx_buf+5
 637  0104 d7001b        	ld	(_sc+27,x),a
 638                     ; 65 						sc.spc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 640  0107 7b24          	ld	a,(OFST+0,sp)
 641  0109 97            	ld	xl,a
 642  010a a61c          	ld	a,#28
 643  010c 42            	mul	x,a
 644  010d 1d001c        	subw	x,#28
 645  0110 c60018        	ld	a,_i2c_rx_buf+6
 646  0113 d7001c        	ld	(_sc+28,x),a
 647                     ; 66 						sc.spc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 649  0116 7b24          	ld	a,(OFST+0,sp)
 650  0118 97            	ld	xl,a
 651  0119 a61c          	ld	a,#28
 652  011b 42            	mul	x,a
 653  011c 1d001c        	subw	x,#28
 654  011f c60019        	ld	a,_i2c_rx_buf+7
 655  0122 d7001d        	ld	(_sc+29,x),a
 656                     ; 67 						sc.spc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 658  0125 7b24          	ld	a,(OFST+0,sp)
 659  0127 97            	ld	xl,a
 660  0128 a61c          	ld	a,#28
 661  012a 42            	mul	x,a
 662  012b 1d001c        	subw	x,#28
 663  012e c6001a        	ld	a,_i2c_rx_buf+8
 664  0131 d7001e        	ld	(_sc+30,x),a
 665                     ; 68 						sc.spc[mdid-1].model = i2c_rx_buf[9];
 667  0134 7b24          	ld	a,(OFST+0,sp)
 668  0136 97            	ld	xl,a
 669  0137 a61c          	ld	a,#28
 670  0139 42            	mul	x,a
 671  013a 1d001c        	subw	x,#28
 672  013d c6001b        	ld	a,_i2c_rx_buf+9
 673  0140 d70021        	ld	(_sc+33,x),a
 674                     ; 69 						sc.spc[mdid-1].firmware = i2c_rx_buf[10];
 676  0143 7b24          	ld	a,(OFST+0,sp)
 677  0145 97            	ld	xl,a
 678  0146 a61c          	ld	a,#28
 679  0148 42            	mul	x,a
 680  0149 1d001c        	subw	x,#28
 681  014c c6001c        	ld	a,_i2c_rx_buf+10
 682  014f d7001f        	ld	(_sc+31,x),a
 683                     ; 70 						sc.spc[mdid-1].HWTtest = i2c_rx_buf[11];
 685  0152 7b24          	ld	a,(OFST+0,sp)
 686  0154 97            	ld	xl,a
 687  0155 a61c          	ld	a,#28
 688  0157 42            	mul	x,a
 689  0158 1d001c        	subw	x,#28
 690  015b c6001d        	ld	a,_i2c_rx_buf+11
 691  015e d70020        	ld	(_sc+32,x),a
 692  0161               L771:
 693                     ; 74 			device_flag = device_flag>>1;
 695  0161 7254000f      	srl	_device_flag
 696  0165 72560010      	rrc	_device_flag+1
 697  0169               L571:
 698                     ; 41 	for(i = 1;i <= 15;i++){
 700  0169 0c02          	inc	(OFST-34,sp)
 703  016b 7b02          	ld	a,(OFST-34,sp)
 704  016d a110          	cp	a,#16
 705  016f 2403          	jruge	L02
 706  0171 cc0008        	jp	L761
 707  0174               L02:
 708                     ; 77 }
 711  0174 5b24          	addw	sp,#36
 712  0176 81            	ret
 781                     ; 80 void i2c_heartbeat(void)
 781                     ; 81 {
 782                     .text:	section	.text,new
 783  0000               _i2c_heartbeat:
 785  0000 5224          	subw	sp,#36
 786       00000024      OFST:	set	36
 789                     ; 83 	u8 mdid = 0;
 791  0002 0f01          	clr	(OFST-35,sp)
 792                     ; 85 	for(i = 1;i <= 15;i++){
 794  0004 a601          	ld	a,#1
 795  0006 6b23          	ld	(OFST-1,sp),a
 796  0008               L732:
 797                     ; 86 		mdid++;
 799  0008 0c01          	inc	(OFST-35,sp)
 800                     ; 87 		if(device_flag & 0x01){
 802  000a c60010        	ld	a,_device_flag+1
 803  000d a501          	bcp	a,#1
 804  000f 2603          	jrne	L42
 805  0011 cc012a        	jp	L542
 806  0014               L42:
 807                     ; 88 			hb.frame_h1 = 0x7E;
 809  0014 a67e          	ld	a,#126
 810  0016 6b02          	ld	(OFST-34,sp),a
 811                     ; 89 			hb.frame_h2 = 0x7E;
 813  0018 a67e          	ld	a,#126
 814  001a 6b03          	ld	(OFST-33,sp),a
 815                     ; 90 			hb.message_id = mdid+15;
 817  001c 7b01          	ld	a,(OFST-35,sp)
 818  001e ab0f          	add	a,#15
 819  0020 6b04          	ld	(OFST-32,sp),a
 820                     ; 91 			hb.payload[0] = 0x03;
 822  0022 a603          	ld	a,#3
 823  0024 6b05          	ld	(OFST-31,sp),a
 824                     ; 92 			hb.payload[1] = 0x03;
 826  0026 a603          	ld	a,#3
 827  0028 6b06          	ld	(OFST-30,sp),a
 828                     ; 93 			hb.payload[2] = mdid;
 830  002a 7b01          	ld	a,(OFST-35,sp)
 831  002c 6b07          	ld	(OFST-29,sp),a
 832                     ; 94 			ret = i2c_send_message(0x01,&hb,3,mdid,11);
 834  002e 4b0b          	push	#11
 835  0030 7b02          	ld	a,(OFST-34,sp)
 836  0032 88            	push	a
 837  0033 4b03          	push	#3
 838  0035 96            	ldw	x,sp
 839  0036 1c0005        	addw	x,#OFST-31
 840  0039 89            	pushw	x
 841  003a a601          	ld	a,#1
 842  003c cd0000        	call	_i2c_send_message
 844  003f 5b05          	addw	sp,#5
 845  0041 6b24          	ld	(OFST+0,sp),a
 846                     ; 95 			if (ret == IIC_SUCCESS){
 848  0043 0d24          	tnz	(OFST+0,sp)
 849  0045 2703          	jreq	L62
 850  0047 cc0119        	jp	L742
 851  004a               L62:
 852                     ; 96 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[10]){//校验正确
 854  004a 3b0015        	push	_i2c_rx_buf+3
 855  004d ae0014        	ldw	x,#_i2c_rx_buf+2
 856  0050 cd0000        	call	_Check_Sum
 858  0053 5b01          	addw	sp,#1
 859  0055 c1001c        	cp	a,_i2c_rx_buf+10
 860  0058 2703          	jreq	L03
 861  005a cc010e        	jp	L152
 862  005d               L03:
 863                     ; 97 					if(i2c_rx_buf[4] == 0x06){
 865  005d c60016        	ld	a,_i2c_rx_buf+4
 866  0060 a106          	cp	a,#6
 867  0062 2703          	jreq	L23
 868  0064 cc010e        	jp	L152
 869  0067               L23:
 870                     ; 98 						for(j = 0;j < 15;j++){
 872  0067 0f24          	clr	(OFST+0,sp)
 873  0069               L552:
 874                     ; 99 							if(sc.slc[j].MDID == i2c_rx_buf[5]){
 876  0069 7b24          	ld	a,(OFST+0,sp)
 877  006b 97            	ld	xl,a
 878  006c a61a          	ld	a,#26
 879  006e 42            	mul	x,a
 880  006f c60017        	ld	a,_i2c_rx_buf+5
 881  0072 905f          	clrw	y
 882  0074 9097          	ld	yl,a
 883  0076 90bf00        	ldw	c_y,y
 884  0079 9093          	ldw	y,x
 885  007b 90de01d0      	ldw	y,(_sc+464,y)
 886  007f 90b300        	cpw	y,c_y
 887  0082 2632          	jrne	L362
 888                     ; 100 								sc.slc[j].ch1_status = i2c_rx_buf[6];
 890  0084 7b24          	ld	a,(OFST+0,sp)
 891  0086 97            	ld	xl,a
 892  0087 a61a          	ld	a,#26
 893  0089 42            	mul	x,a
 894  008a c60018        	ld	a,_i2c_rx_buf+6
 895  008d d701d2        	ld	(_sc+466,x),a
 896                     ; 101 								sc.slc[j].ch2_status = i2c_rx_buf[7];
 898  0090 7b24          	ld	a,(OFST+0,sp)
 899  0092 97            	ld	xl,a
 900  0093 a61a          	ld	a,#26
 901  0095 42            	mul	x,a
 902  0096 c60019        	ld	a,_i2c_rx_buf+7
 903  0099 d701d3        	ld	(_sc+467,x),a
 904                     ; 102 								sc.slc[j].ch3_status = i2c_rx_buf[8];
 906  009c 7b24          	ld	a,(OFST+0,sp)
 907  009e 97            	ld	xl,a
 908  009f a61a          	ld	a,#26
 909  00a1 42            	mul	x,a
 910  00a2 c6001a        	ld	a,_i2c_rx_buf+8
 911  00a5 d701d4        	ld	(_sc+468,x),a
 912                     ; 103 								sc.slc[j].ch4_status = i2c_rx_buf[9];
 914  00a8 7b24          	ld	a,(OFST+0,sp)
 915  00aa 97            	ld	xl,a
 916  00ab a61a          	ld	a,#26
 917  00ad 42            	mul	x,a
 918  00ae c6001b        	ld	a,_i2c_rx_buf+9
 919  00b1 d701d5        	ld	(_sc+469,x),a
 920                     ; 104 								break;
 922  00b4 2058          	jra	L152
 923  00b6               L362:
 924                     ; 106 							else if(sc.spc[j].MDID == i2c_rx_buf[5]){
 926  00b6 7b24          	ld	a,(OFST+0,sp)
 927  00b8 97            	ld	xl,a
 928  00b9 a61c          	ld	a,#28
 929  00bb 42            	mul	x,a
 930  00bc c60017        	ld	a,_i2c_rx_buf+5
 931  00bf 905f          	clrw	y
 932  00c1 9097          	ld	yl,a
 933  00c3 90bf00        	ldw	c_y,y
 934  00c6 9093          	ldw	y,x
 935  00c8 90de002c      	ldw	y,(_sc+44,y)
 936  00cc 90b300        	cpw	y,c_y
 937  00cf 2632          	jrne	L562
 938                     ; 107 								sc.spc[j].ch1_status = i2c_rx_buf[6];
 940  00d1 7b24          	ld	a,(OFST+0,sp)
 941  00d3 97            	ld	xl,a
 942  00d4 a61c          	ld	a,#28
 943  00d6 42            	mul	x,a
 944  00d7 c60018        	ld	a,_i2c_rx_buf+6
 945  00da d7002e        	ld	(_sc+46,x),a
 946                     ; 108 								sc.spc[j].ch2_status = i2c_rx_buf[7];
 948  00dd 7b24          	ld	a,(OFST+0,sp)
 949  00df 97            	ld	xl,a
 950  00e0 a61c          	ld	a,#28
 951  00e2 42            	mul	x,a
 952  00e3 c60019        	ld	a,_i2c_rx_buf+7
 953  00e6 d7002f        	ld	(_sc+47,x),a
 954                     ; 109 								sc.spc[j].ch3_status = i2c_rx_buf[8];
 956  00e9 7b24          	ld	a,(OFST+0,sp)
 957  00eb 97            	ld	xl,a
 958  00ec a61c          	ld	a,#28
 959  00ee 42            	mul	x,a
 960  00ef c6001a        	ld	a,_i2c_rx_buf+8
 961  00f2 d70030        	ld	(_sc+48,x),a
 962                     ; 110 								sc.spc[j].ch4_status = i2c_rx_buf[9];
 964  00f5 7b24          	ld	a,(OFST+0,sp)
 965  00f7 97            	ld	xl,a
 966  00f8 a61c          	ld	a,#28
 967  00fa 42            	mul	x,a
 968  00fb c6001b        	ld	a,_i2c_rx_buf+9
 969  00fe d70031        	ld	(_sc+49,x),a
 970                     ; 111 								break;
 972  0101 200b          	jra	L152
 973  0103               L562:
 974                     ; 98 						for(j = 0;j < 15;j++){
 976  0103 0c24          	inc	(OFST+0,sp)
 979  0105 7b24          	ld	a,(OFST+0,sp)
 980  0107 a10f          	cp	a,#15
 981  0109 2403          	jruge	L43
 982  010b cc0069        	jp	L552
 983  010e               L43:
 984  010e               L152:
 985                     ; 116 				hb_fail_mdid_cnt[mdid-1]=0;//有1次读取到回复，则清零相应的mdid失败的次数
 987  010e 7b01          	ld	a,(OFST-35,sp)
 988  0110 5f            	clrw	x
 989  0111 97            	ld	xl,a
 990  0112 5a            	decw	x
 991  0113 724f0000      	clr	(_hb_fail_mdid_cnt,x)
 993  0117 2009          	jra	L172
 994  0119               L742:
 995                     ; 119 				hb_fail_mdid_cnt[mdid-1]++;
 997  0119 7b01          	ld	a,(OFST-35,sp)
 998  011b 5f            	clrw	x
 999  011c 97            	ld	xl,a
1000  011d 5a            	decw	x
1001  011e 724c0000      	inc	(_hb_fail_mdid_cnt,x)
1002  0122               L172:
1003                     ; 121 			device_flag = device_flag>>1;
1005  0122 7254000f      	srl	_device_flag
1006  0126 72560010      	rrc	_device_flag+1
1007  012a               L542:
1008                     ; 85 	for(i = 1;i <= 15;i++){
1010  012a 0c23          	inc	(OFST-1,sp)
1013  012c 7b23          	ld	a,(OFST-1,sp)
1014  012e a110          	cp	a,#16
1015  0130 2403          	jruge	L63
1016  0132 cc0008        	jp	L732
1017  0135               L63:
1018                     ; 124 	for(i = 0; i < 15;i++){
1020  0135 0f23          	clr	(OFST-1,sp)
1021  0137               L372:
1022                     ; 125 		if(hb_fail_mdid_cnt[i] >= 20){
1024  0137 7b23          	ld	a,(OFST-1,sp)
1025  0139 5f            	clrw	x
1026  013a 97            	ld	xl,a
1027  013b d60000        	ld	a,(_hb_fail_mdid_cnt,x)
1028  013e a114          	cp	a,#20
1029  0140 255e          	jrult	L103
1030                     ; 126 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1032  0142 0f24          	clr	(OFST+0,sp)
1033  0144               L303:
1034                     ; 127 				if(sc.slc[j].MDID == i){
1036  0144 7b24          	ld	a,(OFST+0,sp)
1037  0146 97            	ld	xl,a
1038  0147 a61a          	ld	a,#26
1039  0149 42            	mul	x,a
1040  014a 7b23          	ld	a,(OFST-1,sp)
1041  014c 905f          	clrw	y
1042  014e 9097          	ld	yl,a
1043  0150 90bf00        	ldw	c_y,y
1044  0153 9093          	ldw	y,x
1045  0155 90de01d0      	ldw	y,(_sc+464,y)
1046  0159 90b300        	cpw	y,c_y
1047  015c 2610          	jrne	L113
1048                     ; 128 					sc.slc[j].HWTtest &= 0x7F;//SLC STM8S故障
1050  015e 7b24          	ld	a,(OFST+0,sp)
1051  0160 97            	ld	xl,a
1052  0161 a61a          	ld	a,#26
1053  0163 42            	mul	x,a
1054  0164 d601c4        	ld	a,(_sc+452,x)
1055  0167 a47f          	and	a,#127
1056  0169 d701c4        	ld	(_sc+452,x),a
1057                     ; 129 					break;
1059  016c 2032          	jra	L103
1060  016e               L113:
1061                     ; 131 				else if(sc.spc[j].MDID == i){
1063  016e 7b24          	ld	a,(OFST+0,sp)
1064  0170 97            	ld	xl,a
1065  0171 a61c          	ld	a,#28
1066  0173 42            	mul	x,a
1067  0174 7b23          	ld	a,(OFST-1,sp)
1068  0176 905f          	clrw	y
1069  0178 9097          	ld	yl,a
1070  017a 90bf00        	ldw	c_y,y
1071  017d 9093          	ldw	y,x
1072  017f 90de002c      	ldw	y,(_sc+44,y)
1073  0183 90b300        	cpw	y,c_y
1074  0186 2610          	jrne	L313
1075                     ; 132 					sc.spc[j].HWTtest &= 0x7F;//SPC STM8S故障
1077  0188 7b24          	ld	a,(OFST+0,sp)
1078  018a 97            	ld	xl,a
1079  018b a61c          	ld	a,#28
1080  018d 42            	mul	x,a
1081  018e d60020        	ld	a,(_sc+32,x)
1082  0191 a47f          	and	a,#127
1083  0193 d70020        	ld	(_sc+32,x),a
1084                     ; 133 					break;
1086  0196 2008          	jra	L103
1087  0198               L313:
1088                     ; 126 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1090  0198 0c24          	inc	(OFST+0,sp)
1093  019a 7b24          	ld	a,(OFST+0,sp)
1094  019c a10f          	cp	a,#15
1095  019e 25a4          	jrult	L303
1096  01a0               L103:
1097                     ; 124 	for(i = 0; i < 15;i++){
1099  01a0 0c23          	inc	(OFST-1,sp)
1102  01a2 7b23          	ld	a,(OFST-1,sp)
1103  01a4 a10f          	cp	a,#15
1104  01a6 258f          	jrult	L372
1105                     ; 138 }
1108  01a8 5b24          	addw	sp,#36
1109  01aa 81            	ret
1163                     ; 141 void i2c_get_energy_consum(void)
1163                     ; 142 {
1164                     .text:	section	.text,new
1165  0000               _i2c_get_energy_consum:
1167  0000 5223          	subw	sp,#35
1168       00000023      OFST:	set	35
1171                     ; 145 	for(i = 0; i < 15;i++){
1173  0002 0f23          	clr	(OFST+0,sp)
1174  0004               L143:
1175                     ; 146 		if(sc.spc[i].MDID){
1177  0004 7b23          	ld	a,(OFST+0,sp)
1178  0006 97            	ld	xl,a
1179  0007 a61c          	ld	a,#28
1180  0009 42            	mul	x,a
1181  000a d6002d        	ld	a,(_sc+45,x)
1182  000d da002c        	or	a,(_sc+44,x)
1183  0010 2603cc00a1    	jreq	L743
1184                     ; 147 			eg.frame_h1 = 0x7E;
1186  0015 a67e          	ld	a,#126
1187  0017 6b02          	ld	(OFST-33,sp),a
1188                     ; 148 			eg.frame_h2 = 0x7E;
1190  0019 a67e          	ld	a,#126
1191  001b 6b03          	ld	(OFST-32,sp),a
1192                     ; 149 			eg.message_id = sc.spc[i].MDID+30;
1194  001d 7b23          	ld	a,(OFST+0,sp)
1195  001f 97            	ld	xl,a
1196  0020 a61c          	ld	a,#28
1197  0022 42            	mul	x,a
1198  0023 d6002d        	ld	a,(_sc+45,x)
1199  0026 ab1e          	add	a,#30
1200  0028 6b04          	ld	(OFST-31,sp),a
1201                     ; 150 			eg.payload[0] = 0xFE;//自己定义
1203  002a a6fe          	ld	a,#254
1204  002c 6b05          	ld	(OFST-30,sp),a
1205                     ; 151 			eg.payload[1] = 0x02;//自己定义
1207  002e a602          	ld	a,#2
1208  0030 6b06          	ld	(OFST-29,sp),a
1209                     ; 152 			ret = i2c_send_message(0x01,&eg,2,sc.spc[i].MDID,9);
1211  0032 4b09          	push	#9
1212  0034 7b24          	ld	a,(OFST+1,sp)
1213  0036 97            	ld	xl,a
1214  0037 a61c          	ld	a,#28
1215  0039 42            	mul	x,a
1216  003a d6002d        	ld	a,(_sc+45,x)
1217  003d 88            	push	a
1218  003e 4b02          	push	#2
1219  0040 96            	ldw	x,sp
1220  0041 1c0005        	addw	x,#OFST-30
1221  0044 89            	pushw	x
1222  0045 a601          	ld	a,#1
1223  0047 cd0000        	call	_i2c_send_message
1225  004a 5b05          	addw	sp,#5
1226  004c 6b01          	ld	(OFST-34,sp),a
1227                     ; 153 			if (ret == IIC_SUCCESS){
1229  004e 0d01          	tnz	(OFST-34,sp)
1230  0050 264f          	jrne	L743
1231                     ; 154 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[8]){//校验正确
1233  0052 3b0015        	push	_i2c_rx_buf+3
1234  0055 ae0014        	ldw	x,#_i2c_rx_buf+2
1235  0058 cd0000        	call	_Check_Sum
1237  005b 5b01          	addw	sp,#1
1238  005d c1001a        	cp	a,_i2c_rx_buf+8
1239  0060 263f          	jrne	L743
1240                     ; 155 					if(i2c_rx_buf[4] == 0x2A){
1242  0062 c60016        	ld	a,_i2c_rx_buf+4
1243  0065 a12a          	cp	a,#42
1244  0067 2638          	jrne	L743
1245                     ; 156 						if(sc.spc[i].MDID == i2c_rx_buf[7])
1247  0069 7b23          	ld	a,(OFST+0,sp)
1248  006b 97            	ld	xl,a
1249  006c a61c          	ld	a,#28
1250  006e 42            	mul	x,a
1251  006f c60019        	ld	a,_i2c_rx_buf+7
1252  0072 905f          	clrw	y
1253  0074 9097          	ld	yl,a
1254  0076 90bf00        	ldw	c_y,y
1255  0079 9093          	ldw	y,x
1256  007b 90de002c      	ldw	y,(_sc+44,y)
1257  007f 90b300        	cpw	y,c_y
1258  0082 261d          	jrne	L743
1259                     ; 157 							sc.spc[i].energy_consum = ((u16)i2c_rx_buf[5])<<8 + (u16)i2c_rx_buf[6];
1261  0084 7b23          	ld	a,(OFST+0,sp)
1262  0086 97            	ld	xl,a
1263  0087 a61c          	ld	a,#28
1264  0089 42            	mul	x,a
1265  008a c60017        	ld	a,_i2c_rx_buf+5
1266  008d 905f          	clrw	y
1267  008f 9097          	ld	yl,a
1268  0091 c60018        	ld	a,_i2c_rx_buf+6
1269  0094 ab08          	add	a,#8
1270  0096 4d            	tnz	a
1271  0097 2705          	jreq	L24
1272  0099               L44:
1273  0099 9058          	sllw	y
1274  009b 4a            	dec	a
1275  009c 26fb          	jrne	L44
1276  009e               L24:
1277  009e df0032        	ldw	(_sc+50,x),y
1278  00a1               L743:
1279                     ; 145 	for(i = 0; i < 15;i++){
1281  00a1 0c23          	inc	(OFST+0,sp)
1284  00a3 7b23          	ld	a,(OFST+0,sp)
1285  00a5 a10f          	cp	a,#15
1286  00a7 2403          	jruge	L64
1287  00a9 cc0004        	jp	L143
1288  00ac               L64:
1289                     ; 163 }
1292  00ac 5b23          	addw	sp,#35
1293  00ae 81            	ret
1375                     ; 166 u8 i2c_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext)
1375                     ; 167 {
1376                     .text:	section	.text,new
1377  0000               _i2c_single_action_dimmer:
1379  0000 89            	pushw	x
1380  0001 5222          	subw	sp,#34
1381       00000022      OFST:	set	34
1384                     ; 170 	u8 mdid = (mdid_channel&0xf0)>>4;
1386  0003 9f            	ld	a,xl
1387  0004 a4f0          	and	a,#240
1388  0006 4e            	swap	a
1389  0007 a40f          	and	a,#15
1390  0009 6b01          	ld	(OFST-33,sp),a
1391                     ; 171 	sad.frame_h1 = 0x7E;
1393  000b a67e          	ld	a,#126
1394  000d 6b02          	ld	(OFST-32,sp),a
1395                     ; 172 	sad.frame_h2 = 0x7E;
1397  000f a67e          	ld	a,#126
1398  0011 6b03          	ld	(OFST-31,sp),a
1399                     ; 173 	sad.message_id = mdid+45;
1401  0013 7b01          	ld	a,(OFST-33,sp)
1402  0015 ab2d          	add	a,#45
1403  0017 6b04          	ld	(OFST-30,sp),a
1404                     ; 174 	sad.payload[0] = action;
1406  0019 7b23          	ld	a,(OFST+1,sp)
1407  001b 6b05          	ld	(OFST-29,sp),a
1408                     ; 175 	sad.payload[1] = mdid_channel;
1410  001d 7b24          	ld	a,(OFST+2,sp)
1411  001f 6b06          	ld	(OFST-28,sp),a
1412                     ; 176 	sad.payload[2] = value;
1414  0021 7b27          	ld	a,(OFST+5,sp)
1415  0023 6b07          	ld	(OFST-27,sp),a
1416                     ; 177 	sad.payload[3] = ext;
1418  0025 7b28          	ld	a,(OFST+6,sp)
1419  0027 6b08          	ld	(OFST-26,sp),a
1420                     ; 178 	ret = i2c_send_message(0x01,&sad,4,mdid,12);
1422  0029 4b0c          	push	#12
1423  002b 7b02          	ld	a,(OFST-32,sp)
1424  002d 88            	push	a
1425  002e 4b04          	push	#4
1426  0030 96            	ldw	x,sp
1427  0031 1c0005        	addw	x,#OFST-29
1428  0034 89            	pushw	x
1429  0035 a601          	ld	a,#1
1430  0037 cd0000        	call	_i2c_send_message
1432  003a 5b05          	addw	sp,#5
1433  003c 6b01          	ld	(OFST-33,sp),a
1434                     ; 179 	if (ret == IIC_SUCCESS){
1436  003e 0d01          	tnz	(OFST-33,sp)
1437  0040 2652          	jrne	L314
1438                     ; 180 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1440  0042 3b0015        	push	_i2c_rx_buf+3
1441  0045 ae0014        	ldw	x,#_i2c_rx_buf+2
1442  0048 cd0000        	call	_Check_Sum
1444  004b 5b01          	addw	sp,#1
1445  004d c1001d        	cp	a,_i2c_rx_buf+11
1446  0050 2642          	jrne	L314
1447                     ; 181 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1449  0052 c60016        	ld	a,_i2c_rx_buf+4
1450  0055 a1aa          	cp	a,#170
1451  0057 263b          	jrne	L314
1453  0059 c60017        	ld	a,_i2c_rx_buf+5
1454  005c a105          	cp	a,#5
1455  005e 2634          	jrne	L314
1456                     ; 182 				sc.slc[i2c_rx_buf[6]].ch1_status = i2c_rx_buf[7];
1458  0060 c60018        	ld	a,_i2c_rx_buf+6
1459  0063 97            	ld	xl,a
1460  0064 a61a          	ld	a,#26
1461  0066 42            	mul	x,a
1462  0067 c60019        	ld	a,_i2c_rx_buf+7
1463  006a d701d2        	ld	(_sc+466,x),a
1464                     ; 183 				sc.slc[i2c_rx_buf[6]].ch2_status = i2c_rx_buf[8];
1466  006d c60018        	ld	a,_i2c_rx_buf+6
1467  0070 97            	ld	xl,a
1468  0071 a61a          	ld	a,#26
1469  0073 42            	mul	x,a
1470  0074 c6001a        	ld	a,_i2c_rx_buf+8
1471  0077 d701d3        	ld	(_sc+467,x),a
1472                     ; 184 				sc.slc[i2c_rx_buf[6]].ch3_status = i2c_rx_buf[9];
1474  007a c60018        	ld	a,_i2c_rx_buf+6
1475  007d 97            	ld	xl,a
1476  007e a61a          	ld	a,#26
1477  0080 42            	mul	x,a
1478  0081 c6001b        	ld	a,_i2c_rx_buf+9
1479  0084 d701d4        	ld	(_sc+468,x),a
1480                     ; 185 				sc.slc[i2c_rx_buf[6]].ch4_status = i2c_rx_buf[10];
1482  0087 c60018        	ld	a,_i2c_rx_buf+6
1483  008a 97            	ld	xl,a
1484  008b a61a          	ld	a,#26
1485  008d 42            	mul	x,a
1486  008e c6001c        	ld	a,_i2c_rx_buf+10
1487  0091 d701d5        	ld	(_sc+469,x),a
1488  0094               L314:
1489                     ; 189 	return ret;
1491  0094 7b01          	ld	a,(OFST-33,sp)
1494  0096 5b24          	addw	sp,#36
1495  0098 81            	ret
1576                     ; 193 u8 i2c_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext)
1576                     ; 194 {
1577                     .text:	section	.text,new
1578  0000               _i2c_action_plug:
1580  0000 89            	pushw	x
1581  0001 5222          	subw	sp,#34
1582       00000022      OFST:	set	34
1585                     ; 197 	u8 mdid = (mdid_channel&0xf0)>>4;
1587  0003 9f            	ld	a,xl
1588  0004 a4f0          	and	a,#240
1589  0006 4e            	swap	a
1590  0007 a40f          	and	a,#15
1591  0009 6b01          	ld	(OFST-33,sp),a
1592                     ; 198 	ap.frame_h1 = 0x7E;
1594  000b a67e          	ld	a,#126
1595  000d 6b02          	ld	(OFST-32,sp),a
1596                     ; 199 	ap.frame_h2 = 0x7E;
1598  000f a67e          	ld	a,#126
1599  0011 6b03          	ld	(OFST-31,sp),a
1600                     ; 200 	ap.message_id = mdid+60;
1602  0013 7b01          	ld	a,(OFST-33,sp)
1603  0015 ab3c          	add	a,#60
1604  0017 6b04          	ld	(OFST-30,sp),a
1605                     ; 201 	ap.payload[0] = action;
1607  0019 7b23          	ld	a,(OFST+1,sp)
1608  001b 6b05          	ld	(OFST-29,sp),a
1609                     ; 202 	ap.payload[1] = mdid_channel;
1611  001d 7b24          	ld	a,(OFST+2,sp)
1612  001f 6b06          	ld	(OFST-28,sp),a
1613                     ; 203 	ap.payload[2] = value;
1615  0021 7b27          	ld	a,(OFST+5,sp)
1616  0023 6b07          	ld	(OFST-27,sp),a
1617                     ; 204 	ap.payload[3] = ext;
1619  0025 7b28          	ld	a,(OFST+6,sp)
1620  0027 6b08          	ld	(OFST-26,sp),a
1621                     ; 205 	ret = i2c_send_message(0x01,&ap,4,mdid,12);
1623  0029 4b0c          	push	#12
1624  002b 7b02          	ld	a,(OFST-32,sp)
1625  002d 88            	push	a
1626  002e 4b04          	push	#4
1627  0030 96            	ldw	x,sp
1628  0031 1c0005        	addw	x,#OFST-29
1629  0034 89            	pushw	x
1630  0035 a601          	ld	a,#1
1631  0037 cd0000        	call	_i2c_send_message
1633  003a 5b05          	addw	sp,#5
1634  003c 6b01          	ld	(OFST-33,sp),a
1635                     ; 206 	if (ret == IIC_SUCCESS){
1637  003e 0d01          	tnz	(OFST-33,sp)
1638  0040 2652          	jrne	L354
1639                     ; 207 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1641  0042 3b0015        	push	_i2c_rx_buf+3
1642  0045 ae0014        	ldw	x,#_i2c_rx_buf+2
1643  0048 cd0000        	call	_Check_Sum
1645  004b 5b01          	addw	sp,#1
1646  004d c1001d        	cp	a,_i2c_rx_buf+11
1647  0050 2642          	jrne	L354
1648                     ; 208 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1650  0052 c60016        	ld	a,_i2c_rx_buf+4
1651  0055 a1aa          	cp	a,#170
1652  0057 263b          	jrne	L354
1654  0059 c60017        	ld	a,_i2c_rx_buf+5
1655  005c a105          	cp	a,#5
1656  005e 2634          	jrne	L354
1657                     ; 209 				sc.spc[i2c_rx_buf[6]].ch1_status = i2c_rx_buf[7];
1659  0060 c60018        	ld	a,_i2c_rx_buf+6
1660  0063 97            	ld	xl,a
1661  0064 a61c          	ld	a,#28
1662  0066 42            	mul	x,a
1663  0067 c60019        	ld	a,_i2c_rx_buf+7
1664  006a d7002e        	ld	(_sc+46,x),a
1665                     ; 210 				sc.spc[i2c_rx_buf[6]].ch2_status = i2c_rx_buf[8];
1667  006d c60018        	ld	a,_i2c_rx_buf+6
1668  0070 97            	ld	xl,a
1669  0071 a61c          	ld	a,#28
1670  0073 42            	mul	x,a
1671  0074 c6001a        	ld	a,_i2c_rx_buf+8
1672  0077 d7002f        	ld	(_sc+47,x),a
1673                     ; 211 				sc.spc[i2c_rx_buf[6]].ch3_status = i2c_rx_buf[9];
1675  007a c60018        	ld	a,_i2c_rx_buf+6
1676  007d 97            	ld	xl,a
1677  007e a61c          	ld	a,#28
1678  0080 42            	mul	x,a
1679  0081 c6001b        	ld	a,_i2c_rx_buf+9
1680  0084 d70030        	ld	(_sc+48,x),a
1681                     ; 212 				sc.spc[i2c_rx_buf[6]].ch4_status = i2c_rx_buf[10];
1683  0087 c60018        	ld	a,_i2c_rx_buf+6
1684  008a 97            	ld	xl,a
1685  008b a61c          	ld	a,#28
1686  008d 42            	mul	x,a
1687  008e c6001c        	ld	a,_i2c_rx_buf+10
1688  0091 d70031        	ld	(_sc+49,x),a
1689  0094               L354:
1690                     ; 216 	return ret;
1692  0094 7b01          	ld	a,(OFST-33,sp)
1695  0096 5b24          	addw	sp,#36
1696  0098 81            	ret
1762                     ; 221 u8 i2c_multiple_action_dimmer(u8 action_dimmer_num)
1762                     ; 222 {
1763                     .text:	section	.text,new
1764  0000               _i2c_multiple_action_dimmer:
1766  0000 5224          	subw	sp,#36
1767       00000024      OFST:	set	36
1770                     ; 223 	u8 temp,i=0;
1772  0002 0f24          	clr	(OFST+0,sp)
1773                     ; 226 	temp = action_dimmer_num;
1775  0004 6b23          	ld	(OFST-1,sp),a
1777  0006 203a          	jra	L315
1778  0008               L705:
1779                     ; 228 		mad.payload[2+i] = sicp_buf[8+i];
1781  0008 96            	ldw	x,sp
1782  0009 1c0006        	addw	x,#OFST-30
1783  000c 9f            	ld	a,xl
1784  000d 5e            	swapw	x
1785  000e 1b24          	add	a,(OFST+0,sp)
1786  0010 2401          	jrnc	L65
1787  0012 5c            	incw	x
1788  0013               L65:
1789  0013 02            	rlwa	x,a
1790  0014 7b24          	ld	a,(OFST+0,sp)
1791  0016 905f          	clrw	y
1792  0018 9097          	ld	yl,a
1793  001a 90d60008      	ld	a,(_sicp_buf+8,y)
1794  001e f7            	ld	(x),a
1795                     ; 229 		ret = i2c_single_action_dimmer(0x51,sicp_buf[8+i],sicp_buf[8+temp],sicp_buf[9+temp]);
1797  001f 7b23          	ld	a,(OFST-1,sp)
1798  0021 5f            	clrw	x
1799  0022 97            	ld	xl,a
1800  0023 d60009        	ld	a,(_sicp_buf+9,x)
1801  0026 88            	push	a
1802  0027 7b24          	ld	a,(OFST+0,sp)
1803  0029 5f            	clrw	x
1804  002a 97            	ld	xl,a
1805  002b d60008        	ld	a,(_sicp_buf+8,x)
1806  002e 88            	push	a
1807  002f 7b26          	ld	a,(OFST+2,sp)
1808  0031 5f            	clrw	x
1809  0032 97            	ld	xl,a
1810  0033 d60008        	ld	a,(_sicp_buf+8,x)
1811  0036 97            	ld	xl,a
1812  0037 a651          	ld	a,#81
1813  0039 95            	ld	xh,a
1814  003a cd0000        	call	_i2c_single_action_dimmer
1816  003d 85            	popw	x
1817  003e 6b22          	ld	(OFST-2,sp),a
1818                     ; 230 		i++;
1820  0040 0c24          	inc	(OFST+0,sp)
1821  0042               L315:
1822                     ; 227 	while(temp--){
1824  0042 7b23          	ld	a,(OFST-1,sp)
1825  0044 0a23          	dec	(OFST-1,sp)
1826  0046 4d            	tnz	a
1827  0047 26bf          	jrne	L705
1828                     ; 232 	return ret;
1830  0049 7b22          	ld	a,(OFST-2,sp)
1833  004b 5b24          	addw	sp,#36
1834  004d 81            	ret
1847                     	xdef	_i2c_send_message
1848                     	xref	_I2C_WriteReadBytes
1849                     	xref	_I2C_WriteBytes
1850                     	xref	_Check_Sum
1851                     	xref	_mymemcpy
1852                     	xref	_sicp_buf
1853                     	xref	_sc
1854                     	xdef	_i2c_multiple_action_dimmer
1855                     	xdef	_i2c_action_plug
1856                     	xdef	_i2c_single_action_dimmer
1857                     	xdef	_i2c_get_energy_consum
1858                     	xdef	_i2c_heartbeat
1859                     	xdef	_i2c_device_info
1860                     	xdef	_scan_device
1861                     	switch	.bss
1862  0000               _hb_fail_mdid_cnt:
1863  0000 000000000000  	ds.b	15
1864                     	xdef	_hb_fail_mdid_cnt
1865  000f               _device_flag:
1866  000f 0000          	ds.b	2
1867                     	xdef	_device_flag
1868  0011               _i2c_rx_len:
1869  0011 00            	ds.b	1
1870                     	xdef	_i2c_rx_len
1871  0012               _i2c_rx_buf:
1872  0012 000000000000  	ds.b	30
1873                     	xdef	_i2c_rx_buf
1874  0030               _i2c_tx_len:
1875  0030 00            	ds.b	1
1876                     	xdef	_i2c_tx_len
1877  0031               _i2c_tx_buf:
1878  0031 000000000000  	ds.b	30
1879                     	xdef	_i2c_tx_buf
1880                     	xref.b	c_lreg
1881                     	xref.b	c_y
1901                     	end
