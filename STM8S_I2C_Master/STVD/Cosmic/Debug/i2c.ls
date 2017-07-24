   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 202                     ; 8 u8 i2c_send_message(u8 type,I2C_Message *tx,u8 payload_len,u8 mdid,u8 nreadbytes)
 202                     ; 9 {
 204                     .text:	section	.text,new
 205  0000               _i2c_send_message:
 207  0000 88            	push	a
 208       00000000      OFST:	set	0
 211                     ; 10 	i2c_tx_buf[0] = tx->frame_h1;
 213  0001 1e04          	ldw	x,(OFST+4,sp)
 214  0003 f6            	ld	a,(x)
 215  0004 c70033        	ld	_i2c_tx_buf,a
 216                     ; 11 	i2c_tx_buf[1] = tx->frame_h2;
 218  0007 1e04          	ldw	x,(OFST+4,sp)
 219  0009 e601          	ld	a,(1,x)
 220  000b c70034        	ld	_i2c_tx_buf+1,a
 221                     ; 12 	i2c_tx_buf[2] = tx->message_id;
 223  000e 1e04          	ldw	x,(OFST+4,sp)
 224  0010 e602          	ld	a,(2,x)
 225  0012 c70035        	ld	_i2c_tx_buf+2,a
 226                     ; 13 	i2c_tx_buf[3] = 2+payload_len;
 228  0015 7b06          	ld	a,(OFST+6,sp)
 229  0017 ab02          	add	a,#2
 230  0019 c70036        	ld	_i2c_tx_buf+3,a
 231                     ; 14 	mymemcpy(&i2c_tx_buf[4],tx->payload,payload_len);
 233  001c 7b06          	ld	a,(OFST+6,sp)
 234  001e b703          	ld	c_lreg+3,a
 235  0020 3f02          	clr	c_lreg+2
 236  0022 3f01          	clr	c_lreg+1
 237  0024 3f00          	clr	c_lreg
 238  0026 be02          	ldw	x,c_lreg+2
 239  0028 89            	pushw	x
 240  0029 be00          	ldw	x,c_lreg
 241  002b 89            	pushw	x
 242  002c 1e08          	ldw	x,(OFST+8,sp)
 243  002e 1c0003        	addw	x,#3
 244  0031 89            	pushw	x
 245  0032 ae0037        	ldw	x,#_i2c_tx_buf+4
 246  0035 cd0000        	call	_mymemcpy
 248  0038 5b06          	addw	sp,#6
 249                     ; 15 	i2c_tx_buf[4+payload_len] = Check_Sum(&i2c_tx_buf[2],i2c_tx_buf[3]);
 251  003a 7b06          	ld	a,(OFST+6,sp)
 252  003c 5f            	clrw	x
 253  003d 97            	ld	xl,a
 254  003e 89            	pushw	x
 255  003f 3b0036        	push	_i2c_tx_buf+3
 256  0042 ae0035        	ldw	x,#_i2c_tx_buf+2
 257  0045 cd0000        	call	_Check_Sum
 259  0048 5b01          	addw	sp,#1
 260  004a 85            	popw	x
 261  004b d70037        	ld	(_i2c_tx_buf+4,x),a
 262                     ; 17 	if(type == 0x00)	return(I2C_WriteBytes(mdid,i2c_tx_buf,5+payload_len,50));
 264  004e 0d01          	tnz	(OFST+1,sp)
 265  0050 2617          	jrne	L511
 268  0052 4b32          	push	#50
 269  0054 7b07          	ld	a,(OFST+7,sp)
 270  0056 ab05          	add	a,#5
 271  0058 88            	push	a
 272  0059 ae0033        	ldw	x,#_i2c_tx_buf
 273  005c 89            	pushw	x
 274  005d 7b0b          	ld	a,(OFST+11,sp)
 275  005f 5f            	clrw	x
 276  0060 97            	ld	xl,a
 277  0061 cd0000        	call	_I2C_WriteBytes
 279  0064 5b04          	addw	sp,#4
 282  0066 5b01          	addw	sp,#1
 283  0068 81            	ret
 284  0069               L511:
 285                     ; 18 	else							return(I2C_WriteReadBytes(mdid,i2c_tx_buf,5+payload_len,i2c_rx_buf,nreadbytes,50));
 287  0069 4b32          	push	#50
 288  006b 7b09          	ld	a,(OFST+9,sp)
 289  006d 88            	push	a
 290  006e ae0014        	ldw	x,#_i2c_rx_buf
 291  0071 89            	pushw	x
 292  0072 7b0a          	ld	a,(OFST+10,sp)
 293  0074 ab05          	add	a,#5
 294  0076 88            	push	a
 295  0077 ae0033        	ldw	x,#_i2c_tx_buf
 296  007a 89            	pushw	x
 297  007b 7b0e          	ld	a,(OFST+14,sp)
 298  007d 5f            	clrw	x
 299  007e 97            	ld	xl,a
 300  007f cd0000        	call	_I2C_WriteReadBytes
 302  0082 5b07          	addw	sp,#7
 305  0084 5b01          	addw	sp,#1
 306  0086 81            	ret
 347                     ; 22 void scan_device(void)
 347                     ; 23 {
 348                     .text:	section	.text,new
 349  0000               _scan_device:
 351  0000 5203          	subw	sp,#3
 352       00000003      OFST:	set	3
 355                     ; 26 	device_flag = 0x00;
 357  0002 5f            	clrw	x
 358  0003 cf0011        	ldw	_device_flag,x
 359                     ; 27 	for(i=1;i <= 0x0F;i++){
 361  0006 a601          	ld	a,#1
 362  0008 6b03          	ld	(OFST+0,sp),a
 363  000a               L731:
 364                     ; 28 		ret = I2C_WriteBytes(i,NULL,0,10);
 366  000a 4b0a          	push	#10
 367  000c 4b00          	push	#0
 368  000e 5f            	clrw	x
 369  000f 89            	pushw	x
 370  0010 7b07          	ld	a,(OFST+4,sp)
 371  0012 5f            	clrw	x
 372  0013 97            	ld	xl,a
 373  0014 cd0000        	call	_I2C_WriteBytes
 375  0017 5b04          	addw	sp,#4
 376  0019 5f            	clrw	x
 377  001a 97            	ld	xl,a
 378  001b 1f01          	ldw	(OFST-2,sp),x
 379                     ; 29 		if(ret == IIC_SUCCESS){
 381  001d 1e01          	ldw	x,(OFST-2,sp)
 382  001f 2619          	jrne	L541
 383                     ; 30 			device_flag |= (1<<(i-1));
 385  0021 ae0001        	ldw	x,#1
 386  0024 7b03          	ld	a,(OFST+0,sp)
 387  0026 4a            	dec	a
 388  0027 4d            	tnz	a
 389  0028 2704          	jreq	L01
 390  002a               L21:
 391  002a 58            	sllw	x
 392  002b 4a            	dec	a
 393  002c 26fc          	jrne	L21
 394  002e               L01:
 395  002e 01            	rrwa	x,a
 396  002f ca0012        	or	a,_device_flag+1
 397  0032 01            	rrwa	x,a
 398  0033 ca0011        	or	a,_device_flag
 399  0036 01            	rrwa	x,a
 400  0037 cf0011        	ldw	_device_flag,x
 401  003a               L541:
 402                     ; 27 	for(i=1;i <= 0x0F;i++){
 404  003a 0c03          	inc	(OFST+0,sp)
 407  003c 7b03          	ld	a,(OFST+0,sp)
 408  003e a110          	cp	a,#16
 409  0040 25c8          	jrult	L731
 410                     ; 33 }
 413  0042 5b03          	addw	sp,#3
 414  0044 81            	ret
 482                     ; 36 void i2c_device_info(void)
 482                     ; 37 {
 483                     .text:	section	.text,new
 484  0000               _i2c_device_info:
 486  0000 5226          	subw	sp,#38
 487       00000026      OFST:	set	38
 490                     ; 39 	u8 mdid = 0;
 492  0002 0f26          	clr	(OFST+0,sp)
 493                     ; 41 	u16 temp = device_flag;
 495  0004 ce0011        	ldw	x,_device_flag
 496  0007 1f03          	ldw	(OFST-35,sp),x
 497                     ; 42 	for(i = 1;i <= 15;i++){
 499  0009 a601          	ld	a,#1
 500  000b 6b02          	ld	(OFST-36,sp),a
 501  000d               L571:
 502                     ; 43 		mdid++;
 504  000d 0c26          	inc	(OFST+0,sp)
 505                     ; 44 		if((temp & 0x0001) == 0x0001){
 507  000f 7b03          	ld	a,(OFST-35,sp)
 508  0011 97            	ld	xl,a
 509  0012 7b04          	ld	a,(OFST-34,sp)
 510  0014 a401          	and	a,#1
 511  0016 5f            	clrw	x
 512  0017 02            	rlwa	x,a
 513  0018 a30001        	cpw	x,#1
 514  001b 2703          	jreq	L61
 515  001d cc016d        	jp	L302
 516  0020               L61:
 517                     ; 45 			di.frame_h1 = 0x7E;
 519  0020 a67e          	ld	a,#126
 520  0022 6b05          	ld	(OFST-33,sp),a
 521                     ; 46 			di.frame_h2 = 0x7E;
 523  0024 a67e          	ld	a,#126
 524  0026 6b06          	ld	(OFST-32,sp),a
 525                     ; 47 			di.message_id = mdid;
 527  0028 7b26          	ld	a,(OFST+0,sp)
 528  002a 6b07          	ld	(OFST-31,sp),a
 529                     ; 48 			di.payload[0] = 0xFE;//自己定义
 531  002c a6fe          	ld	a,#254
 532  002e 6b08          	ld	(OFST-30,sp),a
 533                     ; 49 			di.payload[1] = 0x01;//自己定义
 535  0030 a601          	ld	a,#1
 536  0032 6b09          	ld	(OFST-29,sp),a
 537                     ; 50 			ret = i2c_send_message(0x01,&di,2,mdid,14);
 539  0034 4b0e          	push	#14
 540  0036 7b27          	ld	a,(OFST+1,sp)
 541  0038 88            	push	a
 542  0039 4b02          	push	#2
 543  003b 96            	ldw	x,sp
 544  003c 1c0008        	addw	x,#OFST-30
 545  003f 89            	pushw	x
 546  0040 a601          	ld	a,#1
 547  0042 cd0000        	call	_i2c_send_message
 549  0045 5b05          	addw	sp,#5
 550  0047 6b01          	ld	(OFST-37,sp),a
 551                     ; 51 			if (ret == IIC_SUCCESS){
 553  0049 0d01          	tnz	(OFST-37,sp)
 554  004b 2703          	jreq	L02
 555  004d cc016d        	jp	L302
 556  0050               L02:
 557                     ; 52 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[13]){//校验正确
 559  0050 3b0017        	push	_i2c_rx_buf+3
 560  0053 ae0016        	ldw	x,#_i2c_rx_buf+2
 561  0056 cd0000        	call	_Check_Sum
 563  0059 5b01          	addw	sp,#1
 564  005b c10021        	cp	a,_i2c_rx_buf+13
 565  005e 2703          	jreq	L22
 566  0060 cc016d        	jp	L302
 567  0063               L22:
 568                     ; 53 					if(i2c_rx_buf[4] == 0xB2){//此为SLC
 570  0063 c60018        	ld	a,_i2c_rx_buf+4
 571  0066 a1b2          	cp	a,#178
 572  0068 2703cc00eb    	jrne	L112
 573                     ; 54 						sc.slc[mdid-1].MDID = mdid;
 575  006d 7b26          	ld	a,(OFST+0,sp)
 576  006f 97            	ld	xl,a
 577  0070 a61a          	ld	a,#26
 578  0072 42            	mul	x,a
 579  0073 1d001a        	subw	x,#26
 580  0076 7b26          	ld	a,(OFST+0,sp)
 581  0078 905f          	clrw	y
 582  007a 9097          	ld	yl,a
 583  007c df01d0        	ldw	(_sc+464,x),y
 584                     ; 55 						sc.slc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 586  007f 7b26          	ld	a,(OFST+0,sp)
 587  0081 97            	ld	xl,a
 588  0082 a61a          	ld	a,#26
 589  0084 42            	mul	x,a
 590  0085 1d001a        	subw	x,#26
 591  0088 c60019        	ld	a,_i2c_rx_buf+5
 592  008b d701bf        	ld	(_sc+447,x),a
 593                     ; 56 						sc.slc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 595  008e 7b26          	ld	a,(OFST+0,sp)
 596  0090 97            	ld	xl,a
 597  0091 a61a          	ld	a,#26
 598  0093 42            	mul	x,a
 599  0094 1d001a        	subw	x,#26
 600  0097 c6001a        	ld	a,_i2c_rx_buf+6
 601  009a d701c0        	ld	(_sc+448,x),a
 602                     ; 57 						sc.slc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 604  009d 7b26          	ld	a,(OFST+0,sp)
 605  009f 97            	ld	xl,a
 606  00a0 a61a          	ld	a,#26
 607  00a2 42            	mul	x,a
 608  00a3 1d001a        	subw	x,#26
 609  00a6 c6001b        	ld	a,_i2c_rx_buf+7
 610  00a9 d701c1        	ld	(_sc+449,x),a
 611                     ; 58 						sc.slc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 613  00ac 7b26          	ld	a,(OFST+0,sp)
 614  00ae 97            	ld	xl,a
 615  00af a61a          	ld	a,#26
 616  00b1 42            	mul	x,a
 617  00b2 1d001a        	subw	x,#26
 618  00b5 c6001c        	ld	a,_i2c_rx_buf+8
 619  00b8 d701c2        	ld	(_sc+450,x),a
 620                     ; 59 						sc.slc[mdid-1].model = i2c_rx_buf[9];
 622  00bb 7b26          	ld	a,(OFST+0,sp)
 623  00bd 97            	ld	xl,a
 624  00be a61a          	ld	a,#26
 625  00c0 42            	mul	x,a
 626  00c1 1d001a        	subw	x,#26
 627  00c4 c6001d        	ld	a,_i2c_rx_buf+9
 628  00c7 d701c5        	ld	(_sc+453,x),a
 629                     ; 60 						sc.slc[mdid-1].firmware = i2c_rx_buf[10];
 631  00ca 7b26          	ld	a,(OFST+0,sp)
 632  00cc 97            	ld	xl,a
 633  00cd a61a          	ld	a,#26
 634  00cf 42            	mul	x,a
 635  00d0 1d001a        	subw	x,#26
 636  00d3 c6001e        	ld	a,_i2c_rx_buf+10
 637  00d6 d701c3        	ld	(_sc+451,x),a
 638                     ; 61 						sc.slc[mdid-1].HWTtest = i2c_rx_buf[11];
 640  00d9 7b26          	ld	a,(OFST+0,sp)
 641  00db 97            	ld	xl,a
 642  00dc a61a          	ld	a,#26
 643  00de 42            	mul	x,a
 644  00df 1d001a        	subw	x,#26
 645  00e2 c6001f        	ld	a,_i2c_rx_buf+11
 646  00e5 d701c4        	ld	(_sc+452,x),a
 648  00e8 cc016d        	jra	L302
 649  00eb               L112:
 650                     ; 63 					else if(i2c_rx_buf[4] == 0xB3){//此为SPC
 652  00eb c60018        	ld	a,_i2c_rx_buf+4
 653  00ee a1b3          	cp	a,#179
 654  00f0 267b          	jrne	L302
 655                     ; 64 						sc.spc[mdid-1].MDID = mdid;
 657  00f2 7b26          	ld	a,(OFST+0,sp)
 658  00f4 97            	ld	xl,a
 659  00f5 a61c          	ld	a,#28
 660  00f7 42            	mul	x,a
 661  00f8 1d001c        	subw	x,#28
 662  00fb 7b26          	ld	a,(OFST+0,sp)
 663  00fd 905f          	clrw	y
 664  00ff 9097          	ld	yl,a
 665  0101 df002c        	ldw	(_sc+44,x),y
 666                     ; 65 						sc.spc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 668  0104 7b26          	ld	a,(OFST+0,sp)
 669  0106 97            	ld	xl,a
 670  0107 a61c          	ld	a,#28
 671  0109 42            	mul	x,a
 672  010a 1d001c        	subw	x,#28
 673  010d c60019        	ld	a,_i2c_rx_buf+5
 674  0110 d7001b        	ld	(_sc+27,x),a
 675                     ; 66 						sc.spc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 677  0113 7b26          	ld	a,(OFST+0,sp)
 678  0115 97            	ld	xl,a
 679  0116 a61c          	ld	a,#28
 680  0118 42            	mul	x,a
 681  0119 1d001c        	subw	x,#28
 682  011c c6001a        	ld	a,_i2c_rx_buf+6
 683  011f d7001c        	ld	(_sc+28,x),a
 684                     ; 67 						sc.spc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 686  0122 7b26          	ld	a,(OFST+0,sp)
 687  0124 97            	ld	xl,a
 688  0125 a61c          	ld	a,#28
 689  0127 42            	mul	x,a
 690  0128 1d001c        	subw	x,#28
 691  012b c6001b        	ld	a,_i2c_rx_buf+7
 692  012e d7001d        	ld	(_sc+29,x),a
 693                     ; 68 						sc.spc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 695  0131 7b26          	ld	a,(OFST+0,sp)
 696  0133 97            	ld	xl,a
 697  0134 a61c          	ld	a,#28
 698  0136 42            	mul	x,a
 699  0137 1d001c        	subw	x,#28
 700  013a c6001c        	ld	a,_i2c_rx_buf+8
 701  013d d7001e        	ld	(_sc+30,x),a
 702                     ; 69 						sc.spc[mdid-1].model = i2c_rx_buf[9];
 704  0140 7b26          	ld	a,(OFST+0,sp)
 705  0142 97            	ld	xl,a
 706  0143 a61c          	ld	a,#28
 707  0145 42            	mul	x,a
 708  0146 1d001c        	subw	x,#28
 709  0149 c6001d        	ld	a,_i2c_rx_buf+9
 710  014c d70021        	ld	(_sc+33,x),a
 711                     ; 70 						sc.spc[mdid-1].firmware = i2c_rx_buf[10];
 713  014f 7b26          	ld	a,(OFST+0,sp)
 714  0151 97            	ld	xl,a
 715  0152 a61c          	ld	a,#28
 716  0154 42            	mul	x,a
 717  0155 1d001c        	subw	x,#28
 718  0158 c6001e        	ld	a,_i2c_rx_buf+10
 719  015b d7001f        	ld	(_sc+31,x),a
 720                     ; 71 						sc.spc[mdid-1].HWTtest = i2c_rx_buf[11];
 722  015e 7b26          	ld	a,(OFST+0,sp)
 723  0160 97            	ld	xl,a
 724  0161 a61c          	ld	a,#28
 725  0163 42            	mul	x,a
 726  0164 1d001c        	subw	x,#28
 727  0167 c6001f        	ld	a,_i2c_rx_buf+11
 728  016a d70020        	ld	(_sc+32,x),a
 729  016d               L302:
 730                     ; 77 		temp = temp>>1;
 732  016d 0403          	srl	(OFST-35,sp)
 733  016f 0604          	rrc	(OFST-34,sp)
 734                     ; 42 	for(i = 1;i <= 15;i++){
 736  0171 0c02          	inc	(OFST-36,sp)
 739  0173 7b02          	ld	a,(OFST-36,sp)
 740  0175 a110          	cp	a,#16
 741  0177 2403          	jruge	L42
 742  0179 cc000d        	jp	L571
 743  017c               L42:
 744                     ; 79 }
 747  017c 5b26          	addw	sp,#38
 748  017e 81            	ret
 817                     ; 82 void i2c_heartbeat(void)
 817                     ; 83 {
 818                     .text:	section	.text,new
 819  0000               _i2c_heartbeat:
 821  0000 5224          	subw	sp,#36
 822       00000024      OFST:	set	36
 825                     ; 85 	u8 mdid = 0;
 827  0002 0f01          	clr	(OFST-35,sp)
 828                     ; 87 	for(i = 1;i <= 15;i++){
 830  0004 a601          	ld	a,#1
 831  0006 6b23          	ld	(OFST-1,sp),a
 832  0008               L542:
 833                     ; 88 		mdid++;
 835  0008 0c01          	inc	(OFST-35,sp)
 836                     ; 89 		if(device_flag & 0x01){
 838  000a c60012        	ld	a,_device_flag+1
 839  000d a501          	bcp	a,#1
 840  000f 2603          	jrne	L03
 841  0011 cc012a        	jp	L352
 842  0014               L03:
 843                     ; 90 			hb.frame_h1 = 0x7E;
 845  0014 a67e          	ld	a,#126
 846  0016 6b02          	ld	(OFST-34,sp),a
 847                     ; 91 			hb.frame_h2 = 0x7E;
 849  0018 a67e          	ld	a,#126
 850  001a 6b03          	ld	(OFST-33,sp),a
 851                     ; 92 			hb.message_id = mdid+15;
 853  001c 7b01          	ld	a,(OFST-35,sp)
 854  001e ab0f          	add	a,#15
 855  0020 6b04          	ld	(OFST-32,sp),a
 856                     ; 93 			hb.payload[0] = 0x03;
 858  0022 a603          	ld	a,#3
 859  0024 6b05          	ld	(OFST-31,sp),a
 860                     ; 94 			hb.payload[1] = 0x03;
 862  0026 a603          	ld	a,#3
 863  0028 6b06          	ld	(OFST-30,sp),a
 864                     ; 95 			hb.payload[2] = mdid;
 866  002a 7b01          	ld	a,(OFST-35,sp)
 867  002c 6b07          	ld	(OFST-29,sp),a
 868                     ; 96 			ret = i2c_send_message(0x01,&hb,3,mdid,11);
 870  002e 4b0b          	push	#11
 871  0030 7b02          	ld	a,(OFST-34,sp)
 872  0032 88            	push	a
 873  0033 4b03          	push	#3
 874  0035 96            	ldw	x,sp
 875  0036 1c0005        	addw	x,#OFST-31
 876  0039 89            	pushw	x
 877  003a a601          	ld	a,#1
 878  003c cd0000        	call	_i2c_send_message
 880  003f 5b05          	addw	sp,#5
 881  0041 6b24          	ld	(OFST+0,sp),a
 882                     ; 97 			if (ret == IIC_SUCCESS){
 884  0043 0d24          	tnz	(OFST+0,sp)
 885  0045 2703          	jreq	L23
 886  0047 cc0119        	jp	L552
 887  004a               L23:
 888                     ; 98 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[10]){//校验正确
 890  004a 3b0017        	push	_i2c_rx_buf+3
 891  004d ae0016        	ldw	x,#_i2c_rx_buf+2
 892  0050 cd0000        	call	_Check_Sum
 894  0053 5b01          	addw	sp,#1
 895  0055 c1001e        	cp	a,_i2c_rx_buf+10
 896  0058 2703          	jreq	L43
 897  005a cc010e        	jp	L752
 898  005d               L43:
 899                     ; 99 					if(i2c_rx_buf[4] == 0x06){
 901  005d c60018        	ld	a,_i2c_rx_buf+4
 902  0060 a106          	cp	a,#6
 903  0062 2703          	jreq	L63
 904  0064 cc010e        	jp	L752
 905  0067               L63:
 906                     ; 100 						for(j = 0;j < 15;j++){
 908  0067 0f24          	clr	(OFST+0,sp)
 909  0069               L362:
 910                     ; 101 							if(sc.slc[j].MDID == i2c_rx_buf[5]){
 912  0069 7b24          	ld	a,(OFST+0,sp)
 913  006b 97            	ld	xl,a
 914  006c a61a          	ld	a,#26
 915  006e 42            	mul	x,a
 916  006f c60019        	ld	a,_i2c_rx_buf+5
 917  0072 905f          	clrw	y
 918  0074 9097          	ld	yl,a
 919  0076 90bf00        	ldw	c_y,y
 920  0079 9093          	ldw	y,x
 921  007b 90de01d0      	ldw	y,(_sc+464,y)
 922  007f 90b300        	cpw	y,c_y
 923  0082 2632          	jrne	L172
 924                     ; 102 								sc.slc[j].ch1_status = i2c_rx_buf[6];
 926  0084 7b24          	ld	a,(OFST+0,sp)
 927  0086 97            	ld	xl,a
 928  0087 a61a          	ld	a,#26
 929  0089 42            	mul	x,a
 930  008a c6001a        	ld	a,_i2c_rx_buf+6
 931  008d d701d2        	ld	(_sc+466,x),a
 932                     ; 103 								sc.slc[j].ch2_status = i2c_rx_buf[7];
 934  0090 7b24          	ld	a,(OFST+0,sp)
 935  0092 97            	ld	xl,a
 936  0093 a61a          	ld	a,#26
 937  0095 42            	mul	x,a
 938  0096 c6001b        	ld	a,_i2c_rx_buf+7
 939  0099 d701d3        	ld	(_sc+467,x),a
 940                     ; 104 								sc.slc[j].ch3_status = i2c_rx_buf[8];
 942  009c 7b24          	ld	a,(OFST+0,sp)
 943  009e 97            	ld	xl,a
 944  009f a61a          	ld	a,#26
 945  00a1 42            	mul	x,a
 946  00a2 c6001c        	ld	a,_i2c_rx_buf+8
 947  00a5 d701d4        	ld	(_sc+468,x),a
 948                     ; 105 								sc.slc[j].ch4_status = i2c_rx_buf[9];
 950  00a8 7b24          	ld	a,(OFST+0,sp)
 951  00aa 97            	ld	xl,a
 952  00ab a61a          	ld	a,#26
 953  00ad 42            	mul	x,a
 954  00ae c6001d        	ld	a,_i2c_rx_buf+9
 955  00b1 d701d5        	ld	(_sc+469,x),a
 956                     ; 106 								break;
 958  00b4 2058          	jra	L752
 959  00b6               L172:
 960                     ; 108 							else if(sc.spc[j].MDID == i2c_rx_buf[5]){
 962  00b6 7b24          	ld	a,(OFST+0,sp)
 963  00b8 97            	ld	xl,a
 964  00b9 a61c          	ld	a,#28
 965  00bb 42            	mul	x,a
 966  00bc c60019        	ld	a,_i2c_rx_buf+5
 967  00bf 905f          	clrw	y
 968  00c1 9097          	ld	yl,a
 969  00c3 90bf00        	ldw	c_y,y
 970  00c6 9093          	ldw	y,x
 971  00c8 90de002c      	ldw	y,(_sc+44,y)
 972  00cc 90b300        	cpw	y,c_y
 973  00cf 2632          	jrne	L372
 974                     ; 109 								sc.spc[j].ch1_status = i2c_rx_buf[6];
 976  00d1 7b24          	ld	a,(OFST+0,sp)
 977  00d3 97            	ld	xl,a
 978  00d4 a61c          	ld	a,#28
 979  00d6 42            	mul	x,a
 980  00d7 c6001a        	ld	a,_i2c_rx_buf+6
 981  00da d7002e        	ld	(_sc+46,x),a
 982                     ; 110 								sc.spc[j].ch2_status = i2c_rx_buf[7];
 984  00dd 7b24          	ld	a,(OFST+0,sp)
 985  00df 97            	ld	xl,a
 986  00e0 a61c          	ld	a,#28
 987  00e2 42            	mul	x,a
 988  00e3 c6001b        	ld	a,_i2c_rx_buf+7
 989  00e6 d7002f        	ld	(_sc+47,x),a
 990                     ; 111 								sc.spc[j].ch3_status = i2c_rx_buf[8];
 992  00e9 7b24          	ld	a,(OFST+0,sp)
 993  00eb 97            	ld	xl,a
 994  00ec a61c          	ld	a,#28
 995  00ee 42            	mul	x,a
 996  00ef c6001c        	ld	a,_i2c_rx_buf+8
 997  00f2 d70030        	ld	(_sc+48,x),a
 998                     ; 112 								sc.spc[j].ch4_status = i2c_rx_buf[9];
1000  00f5 7b24          	ld	a,(OFST+0,sp)
1001  00f7 97            	ld	xl,a
1002  00f8 a61c          	ld	a,#28
1003  00fa 42            	mul	x,a
1004  00fb c6001d        	ld	a,_i2c_rx_buf+9
1005  00fe d70031        	ld	(_sc+49,x),a
1006                     ; 113 								break;
1008  0101 200b          	jra	L752
1009  0103               L372:
1010                     ; 100 						for(j = 0;j < 15;j++){
1012  0103 0c24          	inc	(OFST+0,sp)
1015  0105 7b24          	ld	a,(OFST+0,sp)
1016  0107 a10f          	cp	a,#15
1017  0109 2403          	jruge	L04
1018  010b cc0069        	jp	L362
1019  010e               L04:
1020  010e               L752:
1021                     ; 118 				hb_fail_mdid_cnt[mdid-1]=0;//有1次读取到回复，则清零相应的mdid失败的次数
1023  010e 7b01          	ld	a,(OFST-35,sp)
1024  0110 5f            	clrw	x
1025  0111 97            	ld	xl,a
1026  0112 5a            	decw	x
1027  0113 724f0002      	clr	(_hb_fail_mdid_cnt,x)
1029  0117 2009          	jra	L772
1030  0119               L552:
1031                     ; 121 				hb_fail_mdid_cnt[mdid-1]++;
1033  0119 7b01          	ld	a,(OFST-35,sp)
1034  011b 5f            	clrw	x
1035  011c 97            	ld	xl,a
1036  011d 5a            	decw	x
1037  011e 724c0002      	inc	(_hb_fail_mdid_cnt,x)
1038  0122               L772:
1039                     ; 123 			device_flag = device_flag>>1;
1041  0122 72540011      	srl	_device_flag
1042  0126 72560012      	rrc	_device_flag+1
1043  012a               L352:
1044                     ; 87 	for(i = 1;i <= 15;i++){
1046  012a 0c23          	inc	(OFST-1,sp)
1049  012c 7b23          	ld	a,(OFST-1,sp)
1050  012e a110          	cp	a,#16
1051  0130 2403          	jruge	L24
1052  0132 cc0008        	jp	L542
1053  0135               L24:
1054                     ; 126 	for(i = 0; i < 15;i++){
1056  0135 0f23          	clr	(OFST-1,sp)
1057  0137               L103:
1058                     ; 127 		if(hb_fail_mdid_cnt[i] >= 20){
1060  0137 7b23          	ld	a,(OFST-1,sp)
1061  0139 5f            	clrw	x
1062  013a 97            	ld	xl,a
1063  013b d60002        	ld	a,(_hb_fail_mdid_cnt,x)
1064  013e a114          	cp	a,#20
1065  0140 255e          	jrult	L703
1066                     ; 128 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1068  0142 0f24          	clr	(OFST+0,sp)
1069  0144               L113:
1070                     ; 129 				if(sc.slc[j].MDID == i){
1072  0144 7b24          	ld	a,(OFST+0,sp)
1073  0146 97            	ld	xl,a
1074  0147 a61a          	ld	a,#26
1075  0149 42            	mul	x,a
1076  014a 7b23          	ld	a,(OFST-1,sp)
1077  014c 905f          	clrw	y
1078  014e 9097          	ld	yl,a
1079  0150 90bf00        	ldw	c_y,y
1080  0153 9093          	ldw	y,x
1081  0155 90de01d0      	ldw	y,(_sc+464,y)
1082  0159 90b300        	cpw	y,c_y
1083  015c 2610          	jrne	L713
1084                     ; 130 					sc.slc[j].HWTtest &= 0x7F;//SLC STM8S故障
1086  015e 7b24          	ld	a,(OFST+0,sp)
1087  0160 97            	ld	xl,a
1088  0161 a61a          	ld	a,#26
1089  0163 42            	mul	x,a
1090  0164 d601c4        	ld	a,(_sc+452,x)
1091  0167 a47f          	and	a,#127
1092  0169 d701c4        	ld	(_sc+452,x),a
1093                     ; 131 					break;
1095  016c 2032          	jra	L703
1096  016e               L713:
1097                     ; 133 				else if(sc.spc[j].MDID == i){
1099  016e 7b24          	ld	a,(OFST+0,sp)
1100  0170 97            	ld	xl,a
1101  0171 a61c          	ld	a,#28
1102  0173 42            	mul	x,a
1103  0174 7b23          	ld	a,(OFST-1,sp)
1104  0176 905f          	clrw	y
1105  0178 9097          	ld	yl,a
1106  017a 90bf00        	ldw	c_y,y
1107  017d 9093          	ldw	y,x
1108  017f 90de002c      	ldw	y,(_sc+44,y)
1109  0183 90b300        	cpw	y,c_y
1110  0186 2610          	jrne	L123
1111                     ; 134 					sc.spc[j].HWTtest &= 0x7F;//SPC STM8S故障
1113  0188 7b24          	ld	a,(OFST+0,sp)
1114  018a 97            	ld	xl,a
1115  018b a61c          	ld	a,#28
1116  018d 42            	mul	x,a
1117  018e d60020        	ld	a,(_sc+32,x)
1118  0191 a47f          	and	a,#127
1119  0193 d70020        	ld	(_sc+32,x),a
1120                     ; 135 					break;
1122  0196 2008          	jra	L703
1123  0198               L123:
1124                     ; 128 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1126  0198 0c24          	inc	(OFST+0,sp)
1129  019a 7b24          	ld	a,(OFST+0,sp)
1130  019c a10f          	cp	a,#15
1131  019e 25a4          	jrult	L113
1132  01a0               L703:
1133                     ; 126 	for(i = 0; i < 15;i++){
1135  01a0 0c23          	inc	(OFST-1,sp)
1138  01a2 7b23          	ld	a,(OFST-1,sp)
1139  01a4 a10f          	cp	a,#15
1140  01a6 258f          	jrult	L103
1141                     ; 140 }
1144  01a8 5b24          	addw	sp,#36
1145  01aa 81            	ret
1199                     ; 143 void i2c_get_energy_consum(void)
1199                     ; 144 {
1200                     .text:	section	.text,new
1201  0000               _i2c_get_energy_consum:
1203  0000 5223          	subw	sp,#35
1204       00000023      OFST:	set	35
1207                     ; 147 	for(i = 0; i < 15;i++){
1209  0002 0f23          	clr	(OFST+0,sp)
1210  0004               L743:
1211                     ; 148 		if(sc.spc[i].MDID){
1213  0004 7b23          	ld	a,(OFST+0,sp)
1214  0006 97            	ld	xl,a
1215  0007 a61c          	ld	a,#28
1216  0009 42            	mul	x,a
1217  000a d6002d        	ld	a,(_sc+45,x)
1218  000d da002c        	or	a,(_sc+44,x)
1219  0010 2603cc00a1    	jreq	L553
1220                     ; 149 			eg.frame_h1 = 0x7E;
1222  0015 a67e          	ld	a,#126
1223  0017 6b02          	ld	(OFST-33,sp),a
1224                     ; 150 			eg.frame_h2 = 0x7E;
1226  0019 a67e          	ld	a,#126
1227  001b 6b03          	ld	(OFST-32,sp),a
1228                     ; 151 			eg.message_id = sc.spc[i].MDID+30;
1230  001d 7b23          	ld	a,(OFST+0,sp)
1231  001f 97            	ld	xl,a
1232  0020 a61c          	ld	a,#28
1233  0022 42            	mul	x,a
1234  0023 d6002d        	ld	a,(_sc+45,x)
1235  0026 ab1e          	add	a,#30
1236  0028 6b04          	ld	(OFST-31,sp),a
1237                     ; 152 			eg.payload[0] = 0xFE;//自己定义
1239  002a a6fe          	ld	a,#254
1240  002c 6b05          	ld	(OFST-30,sp),a
1241                     ; 153 			eg.payload[1] = 0x02;//自己定义
1243  002e a602          	ld	a,#2
1244  0030 6b06          	ld	(OFST-29,sp),a
1245                     ; 154 			ret = i2c_send_message(0x01,&eg,2,sc.spc[i].MDID,9);
1247  0032 4b09          	push	#9
1248  0034 7b24          	ld	a,(OFST+1,sp)
1249  0036 97            	ld	xl,a
1250  0037 a61c          	ld	a,#28
1251  0039 42            	mul	x,a
1252  003a d6002d        	ld	a,(_sc+45,x)
1253  003d 88            	push	a
1254  003e 4b02          	push	#2
1255  0040 96            	ldw	x,sp
1256  0041 1c0005        	addw	x,#OFST-30
1257  0044 89            	pushw	x
1258  0045 a601          	ld	a,#1
1259  0047 cd0000        	call	_i2c_send_message
1261  004a 5b05          	addw	sp,#5
1262  004c 6b01          	ld	(OFST-34,sp),a
1263                     ; 155 			if (ret == IIC_SUCCESS){
1265  004e 0d01          	tnz	(OFST-34,sp)
1266  0050 264f          	jrne	L553
1267                     ; 156 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[8]){//校验正确
1269  0052 3b0017        	push	_i2c_rx_buf+3
1270  0055 ae0016        	ldw	x,#_i2c_rx_buf+2
1271  0058 cd0000        	call	_Check_Sum
1273  005b 5b01          	addw	sp,#1
1274  005d c1001c        	cp	a,_i2c_rx_buf+8
1275  0060 263f          	jrne	L553
1276                     ; 157 					if(i2c_rx_buf[4] == 0x2A){
1278  0062 c60018        	ld	a,_i2c_rx_buf+4
1279  0065 a12a          	cp	a,#42
1280  0067 2638          	jrne	L553
1281                     ; 158 						if(sc.spc[i].MDID == i2c_rx_buf[7])
1283  0069 7b23          	ld	a,(OFST+0,sp)
1284  006b 97            	ld	xl,a
1285  006c a61c          	ld	a,#28
1286  006e 42            	mul	x,a
1287  006f c6001b        	ld	a,_i2c_rx_buf+7
1288  0072 905f          	clrw	y
1289  0074 9097          	ld	yl,a
1290  0076 90bf00        	ldw	c_y,y
1291  0079 9093          	ldw	y,x
1292  007b 90de002c      	ldw	y,(_sc+44,y)
1293  007f 90b300        	cpw	y,c_y
1294  0082 261d          	jrne	L553
1295                     ; 159 							sc.spc[i].energy_consum = ((u16)i2c_rx_buf[5])<<8 + (u16)i2c_rx_buf[6];
1297  0084 7b23          	ld	a,(OFST+0,sp)
1298  0086 97            	ld	xl,a
1299  0087 a61c          	ld	a,#28
1300  0089 42            	mul	x,a
1301  008a c60019        	ld	a,_i2c_rx_buf+5
1302  008d 905f          	clrw	y
1303  008f 9097          	ld	yl,a
1304  0091 c6001a        	ld	a,_i2c_rx_buf+6
1305  0094 ab08          	add	a,#8
1306  0096 4d            	tnz	a
1307  0097 2705          	jreq	L64
1308  0099               L05:
1309  0099 9058          	sllw	y
1310  009b 4a            	dec	a
1311  009c 26fb          	jrne	L05
1312  009e               L64:
1313  009e df0032        	ldw	(_sc+50,x),y
1314  00a1               L553:
1315                     ; 147 	for(i = 0; i < 15;i++){
1317  00a1 0c23          	inc	(OFST+0,sp)
1320  00a3 7b23          	ld	a,(OFST+0,sp)
1321  00a5 a10f          	cp	a,#15
1322  00a7 2403          	jruge	L25
1323  00a9 cc0004        	jp	L743
1324  00ac               L25:
1325                     ; 165 }
1328  00ac 5b23          	addw	sp,#35
1329  00ae 81            	ret
1410                     ; 168 u8 i2c_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext)
1410                     ; 169 {
1411                     .text:	section	.text,new
1412  0000               _i2c_single_action_dimmer:
1414  0000 89            	pushw	x
1415  0001 5222          	subw	sp,#34
1416       00000022      OFST:	set	34
1419                     ; 172 	u8 mdid = (mdid_channel&0xf0)>>4;
1421  0003 9f            	ld	a,xl
1422  0004 a4f0          	and	a,#240
1423  0006 4e            	swap	a
1424  0007 a40f          	and	a,#15
1425  0009 6b01          	ld	(OFST-33,sp),a
1426                     ; 173 	sad.frame_h1 = 0x7E;
1428  000b a67e          	ld	a,#126
1429  000d 6b02          	ld	(OFST-32,sp),a
1430                     ; 174 	sad.frame_h2 = 0x7E;
1432  000f a67e          	ld	a,#126
1433  0011 6b03          	ld	(OFST-31,sp),a
1434                     ; 175 	sad.message_id = mdid+45;
1436  0013 7b01          	ld	a,(OFST-33,sp)
1437  0015 ab2d          	add	a,#45
1438  0017 6b04          	ld	(OFST-30,sp),a
1439                     ; 176 	sad.payload[0] = action;
1441  0019 7b23          	ld	a,(OFST+1,sp)
1442  001b 6b05          	ld	(OFST-29,sp),a
1443                     ; 177 	sad.payload[1] = mdid_channel;
1445  001d 7b24          	ld	a,(OFST+2,sp)
1446  001f 6b06          	ld	(OFST-28,sp),a
1447                     ; 178 	sad.payload[2] = value;
1449  0021 7b27          	ld	a,(OFST+5,sp)
1450  0023 6b07          	ld	(OFST-27,sp),a
1451                     ; 179 	sad.payload[3] = ext;
1453  0025 7b28          	ld	a,(OFST+6,sp)
1454  0027 6b08          	ld	(OFST-26,sp),a
1455                     ; 192 	ret = i2c_send_message(0x01,&sad,4,mdid,8);
1457  0029 4b08          	push	#8
1458  002b 7b02          	ld	a,(OFST-32,sp)
1459  002d 88            	push	a
1460  002e 4b04          	push	#4
1461  0030 96            	ldw	x,sp
1462  0031 1c0005        	addw	x,#OFST-29
1463  0034 89            	pushw	x
1464  0035 a601          	ld	a,#1
1465  0037 cd0000        	call	_i2c_send_message
1467  003a 5b05          	addw	sp,#5
1468  003c 6b01          	ld	(OFST-33,sp),a
1469                     ; 194 		if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x02)){
1471  003e c60018        	ld	a,_i2c_rx_buf+4
1472  0041 a1aa          	cp	a,#170
1473  0043 260c          	jrne	L124
1475  0045 c60019        	ld	a,_i2c_rx_buf+5
1476  0048 a102          	cp	a,#2
1477  004a 2605          	jrne	L124
1478                     ; 195 			action_dimmer_MDID = i2c_rx_buf[6];
1480  004c 55001a0001    	mov	_action_dimmer_MDID,_i2c_rx_buf+6
1481  0051               L124:
1482                     ; 198 	return ret;
1484  0051 7b01          	ld	a,(OFST-33,sp)
1487  0053 5b24          	addw	sp,#36
1488  0055 81            	ret
1543                     ; 201 u8 i2c_single_action_dimmer_result(u8 mdid)
1543                     ; 202 {
1544                     .text:	section	.text,new
1545  0000               _i2c_single_action_dimmer_result:
1547  0000 88            	push	a
1548  0001 5222          	subw	sp,#34
1549       00000022      OFST:	set	34
1552                     ; 205 	sad.frame_h1 = 0x7E;
1554  0003 a67e          	ld	a,#126
1555  0005 6b02          	ld	(OFST-32,sp),a
1556                     ; 206 	sad.frame_h2 = 0x7E;
1558  0007 a67e          	ld	a,#126
1559  0009 6b03          	ld	(OFST-31,sp),a
1560                     ; 207 	sad.message_id = 66;
1562  000b a642          	ld	a,#66
1563  000d 6b04          	ld	(OFST-30,sp),a
1564                     ; 208 	sad.payload[0] = 0x59;
1566  000f a659          	ld	a,#89
1567  0011 6b05          	ld	(OFST-29,sp),a
1568                     ; 209 	sad.payload[1] = (mdid&0x0f);
1570  0013 7b23          	ld	a,(OFST+1,sp)
1571  0015 a40f          	and	a,#15
1572  0017 6b06          	ld	(OFST-28,sp),a
1573                     ; 210 	ret = i2c_send_message(0x01,&sad,2,mdid,12);
1575  0019 4b0c          	push	#12
1576  001b 7b24          	ld	a,(OFST+2,sp)
1577  001d 88            	push	a
1578  001e 4b02          	push	#2
1579  0020 96            	ldw	x,sp
1580  0021 1c0005        	addw	x,#OFST-29
1581  0024 89            	pushw	x
1582  0025 a601          	ld	a,#1
1583  0027 cd0000        	call	_i2c_send_message
1585  002a 5b05          	addw	sp,#5
1586  002c 6b01          	ld	(OFST-33,sp),a
1587                     ; 211 	if (ret == IIC_SUCCESS){
1589  002e 0d01          	tnz	(OFST-33,sp)
1590  0030 265e          	jrne	L544
1591                     ; 212 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1593  0032 3b0017        	push	_i2c_rx_buf+3
1594  0035 ae0016        	ldw	x,#_i2c_rx_buf+2
1595  0038 cd0000        	call	_Check_Sum
1597  003b 5b01          	addw	sp,#1
1598  003d c1001f        	cp	a,_i2c_rx_buf+11
1599  0040 264e          	jrne	L544
1600                     ; 213 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1602  0042 c60018        	ld	a,_i2c_rx_buf+4
1603  0045 a1aa          	cp	a,#170
1604  0047 2647          	jrne	L544
1606  0049 c60019        	ld	a,_i2c_rx_buf+5
1607  004c a105          	cp	a,#5
1608  004e 2640          	jrne	L544
1609                     ; 214 				sc.slc[i2c_rx_buf[6]-1].ch1_status = i2c_rx_buf[7];
1611  0050 c6001a        	ld	a,_i2c_rx_buf+6
1612  0053 97            	ld	xl,a
1613  0054 a61a          	ld	a,#26
1614  0056 42            	mul	x,a
1615  0057 1d001a        	subw	x,#26
1616  005a c6001b        	ld	a,_i2c_rx_buf+7
1617  005d d701d2        	ld	(_sc+466,x),a
1618                     ; 215 				sc.slc[i2c_rx_buf[6]-1].ch2_status = i2c_rx_buf[8];
1620  0060 c6001a        	ld	a,_i2c_rx_buf+6
1621  0063 97            	ld	xl,a
1622  0064 a61a          	ld	a,#26
1623  0066 42            	mul	x,a
1624  0067 1d001a        	subw	x,#26
1625  006a c6001c        	ld	a,_i2c_rx_buf+8
1626  006d d701d3        	ld	(_sc+467,x),a
1627                     ; 216 				sc.slc[i2c_rx_buf[6]-1].ch3_status = i2c_rx_buf[9];
1629  0070 c6001a        	ld	a,_i2c_rx_buf+6
1630  0073 97            	ld	xl,a
1631  0074 a61a          	ld	a,#26
1632  0076 42            	mul	x,a
1633  0077 1d001a        	subw	x,#26
1634  007a c6001d        	ld	a,_i2c_rx_buf+9
1635  007d d701d4        	ld	(_sc+468,x),a
1636                     ; 217 				sc.slc[i2c_rx_buf[6]-1].ch4_status = i2c_rx_buf[10];
1638  0080 c6001a        	ld	a,_i2c_rx_buf+6
1639  0083 97            	ld	xl,a
1640  0084 a61a          	ld	a,#26
1641  0086 42            	mul	x,a
1642  0087 1d001a        	subw	x,#26
1643  008a c6001e        	ld	a,_i2c_rx_buf+10
1644  008d d701d5        	ld	(_sc+469,x),a
1645  0090               L544:
1646                     ; 221 	delay(10);
1648  0090 ae000a        	ldw	x,#10
1649  0093 cd0000        	call	_delay
1651                     ; 222 	return ret;
1653  0096 7b01          	ld	a,(OFST-33,sp)
1656  0098 5b23          	addw	sp,#35
1657  009a 81            	ret
1739                     ; 227 u8 i2c_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext)
1739                     ; 228 {
1740                     .text:	section	.text,new
1741  0000               _i2c_action_plug:
1743  0000 89            	pushw	x
1744  0001 5222          	subw	sp,#34
1745       00000022      OFST:	set	34
1748                     ; 231 	u8 mdid = (mdid_channel&0xf0)>>4;
1750  0003 9f            	ld	a,xl
1751  0004 a4f0          	and	a,#240
1752  0006 4e            	swap	a
1753  0007 a40f          	and	a,#15
1754  0009 6b01          	ld	(OFST-33,sp),a
1755                     ; 232 	ap.frame_h1 = 0x7E;
1757  000b a67e          	ld	a,#126
1758  000d 6b02          	ld	(OFST-32,sp),a
1759                     ; 233 	ap.frame_h2 = 0x7E;
1761  000f a67e          	ld	a,#126
1762  0011 6b03          	ld	(OFST-31,sp),a
1763                     ; 234 	ap.message_id = mdid+60;
1765  0013 7b01          	ld	a,(OFST-33,sp)
1766  0015 ab3c          	add	a,#60
1767  0017 6b04          	ld	(OFST-30,sp),a
1768                     ; 235 	ap.payload[0] = action;
1770  0019 7b23          	ld	a,(OFST+1,sp)
1771  001b 6b05          	ld	(OFST-29,sp),a
1772                     ; 236 	ap.payload[1] = mdid_channel;
1774  001d 7b24          	ld	a,(OFST+2,sp)
1775  001f 6b06          	ld	(OFST-28,sp),a
1776                     ; 237 	ap.payload[2] = value;
1778  0021 7b27          	ld	a,(OFST+5,sp)
1779  0023 6b07          	ld	(OFST-27,sp),a
1780                     ; 238 	ap.payload[3] = ext;
1782  0025 7b28          	ld	a,(OFST+6,sp)
1783  0027 6b08          	ld	(OFST-26,sp),a
1784                     ; 239 	ret = i2c_send_message(0x01,&ap,4,mdid,12);
1786  0029 4b0c          	push	#12
1787  002b 7b02          	ld	a,(OFST-32,sp)
1788  002d 88            	push	a
1789  002e 4b04          	push	#4
1790  0030 96            	ldw	x,sp
1791  0031 1c0005        	addw	x,#OFST-29
1792  0034 89            	pushw	x
1793  0035 a601          	ld	a,#1
1794  0037 cd0000        	call	_i2c_send_message
1796  003a 5b05          	addw	sp,#5
1797  003c 6b01          	ld	(OFST-33,sp),a
1798                     ; 240 	if (ret == IIC_SUCCESS){
1800  003e 0d01          	tnz	(OFST-33,sp)
1801  0040 265e          	jrne	L505
1802                     ; 241 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1804  0042 3b0017        	push	_i2c_rx_buf+3
1805  0045 ae0016        	ldw	x,#_i2c_rx_buf+2
1806  0048 cd0000        	call	_Check_Sum
1808  004b 5b01          	addw	sp,#1
1809  004d c1001f        	cp	a,_i2c_rx_buf+11
1810  0050 264e          	jrne	L505
1811                     ; 242 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1813  0052 c60018        	ld	a,_i2c_rx_buf+4
1814  0055 a1aa          	cp	a,#170
1815  0057 2647          	jrne	L505
1817  0059 c60019        	ld	a,_i2c_rx_buf+5
1818  005c a105          	cp	a,#5
1819  005e 2640          	jrne	L505
1820                     ; 243 				sc.spc[i2c_rx_buf[6]-1].ch1_status = i2c_rx_buf[7];
1822  0060 c6001a        	ld	a,_i2c_rx_buf+6
1823  0063 97            	ld	xl,a
1824  0064 a61c          	ld	a,#28
1825  0066 42            	mul	x,a
1826  0067 1d001c        	subw	x,#28
1827  006a c6001b        	ld	a,_i2c_rx_buf+7
1828  006d d7002e        	ld	(_sc+46,x),a
1829                     ; 244 				sc.spc[i2c_rx_buf[6]-1].ch2_status = i2c_rx_buf[8];
1831  0070 c6001a        	ld	a,_i2c_rx_buf+6
1832  0073 97            	ld	xl,a
1833  0074 a61c          	ld	a,#28
1834  0076 42            	mul	x,a
1835  0077 1d001c        	subw	x,#28
1836  007a c6001c        	ld	a,_i2c_rx_buf+8
1837  007d d7002f        	ld	(_sc+47,x),a
1838                     ; 245 				sc.spc[i2c_rx_buf[6]-1].ch3_status = i2c_rx_buf[9];
1840  0080 c6001a        	ld	a,_i2c_rx_buf+6
1841  0083 97            	ld	xl,a
1842  0084 a61c          	ld	a,#28
1843  0086 42            	mul	x,a
1844  0087 1d001c        	subw	x,#28
1845  008a c6001d        	ld	a,_i2c_rx_buf+9
1846  008d d70030        	ld	(_sc+48,x),a
1847                     ; 246 				sc.spc[i2c_rx_buf[6]-1].ch4_status = i2c_rx_buf[10];
1849  0090 c6001a        	ld	a,_i2c_rx_buf+6
1850  0093 97            	ld	xl,a
1851  0094 a61c          	ld	a,#28
1852  0096 42            	mul	x,a
1853  0097 1d001c        	subw	x,#28
1854  009a c6001e        	ld	a,_i2c_rx_buf+10
1855  009d d70031        	ld	(_sc+49,x),a
1856  00a0               L505:
1857                     ; 250 	delay(10);
1859  00a0 ae000a        	ldw	x,#10
1860  00a3 cd0000        	call	_delay
1862                     ; 251 	return ret;
1864  00a6 7b01          	ld	a,(OFST-33,sp)
1867  00a8 5b24          	addw	sp,#36
1868  00aa 81            	ret
1935                     ; 256 u8 i2c_multiple_action_dimmer(u8 action_dimmer_num)
1935                     ; 257 {
1936                     .text:	section	.text,new
1937  0000               _i2c_multiple_action_dimmer:
1939  0000 88            	push	a
1940  0001 5224          	subw	sp,#36
1941       00000024      OFST:	set	36
1944                     ; 258 	u8 temp,i=0;
1946  0003 0f24          	clr	(OFST+0,sp)
1947                     ; 261 	temp = action_dimmer_num;
1949  0005 6b22          	ld	(OFST-2,sp),a
1951  0007 2040          	jra	L545
1952  0009               L145:
1953                     ; 263 		mad.payload[2+i] = sicp_buf[8+i];
1955  0009 96            	ldw	x,sp
1956  000a 1c0006        	addw	x,#OFST-30
1957  000d 9f            	ld	a,xl
1958  000e 5e            	swapw	x
1959  000f 1b24          	add	a,(OFST+0,sp)
1960  0011 2401          	jrnc	L46
1961  0013 5c            	incw	x
1962  0014               L46:
1963  0014 02            	rlwa	x,a
1964  0015 7b24          	ld	a,(OFST+0,sp)
1965  0017 905f          	clrw	y
1966  0019 9097          	ld	yl,a
1967  001b 90d60008      	ld	a,(_sicp_buf+8,y)
1968  001f f7            	ld	(x),a
1969                     ; 264 		ret = i2c_single_action_dimmer(0x51,sicp_buf[8+i],sicp_buf[8+action_dimmer_num],sicp_buf[9+action_dimmer_num]);
1971  0020 7b25          	ld	a,(OFST+1,sp)
1972  0022 5f            	clrw	x
1973  0023 97            	ld	xl,a
1974  0024 d60009        	ld	a,(_sicp_buf+9,x)
1975  0027 88            	push	a
1976  0028 7b26          	ld	a,(OFST+2,sp)
1977  002a 5f            	clrw	x
1978  002b 97            	ld	xl,a
1979  002c d60008        	ld	a,(_sicp_buf+8,x)
1980  002f 88            	push	a
1981  0030 7b26          	ld	a,(OFST+2,sp)
1982  0032 5f            	clrw	x
1983  0033 97            	ld	xl,a
1984  0034 d60008        	ld	a,(_sicp_buf+8,x)
1985  0037 97            	ld	xl,a
1986  0038 a651          	ld	a,#81
1987  003a 95            	ld	xh,a
1988  003b cd0000        	call	_i2c_single_action_dimmer
1990  003e 85            	popw	x
1991  003f 6b23          	ld	(OFST-1,sp),a
1992                     ; 265 		i++;
1994  0041 0c24          	inc	(OFST+0,sp)
1995                     ; 266 		delay(30);
1997  0043 ae001e        	ldw	x,#30
1998  0046 cd0000        	call	_delay
2000  0049               L545:
2001                     ; 262 	while(temp--){
2003  0049 7b22          	ld	a,(OFST-2,sp)
2004  004b 0a22          	dec	(OFST-2,sp)
2005  004d 4d            	tnz	a
2006  004e 26b9          	jrne	L145
2007                     ; 268 	return ret;
2009  0050 7b23          	ld	a,(OFST-1,sp)
2012  0052 5b25          	addw	sp,#37
2013  0054 81            	ret
2080                     ; 293 u8 i2c_multiple_action_plug(u8 action_plug_num)
2080                     ; 294 {
2081                     .text:	section	.text,new
2082  0000               _i2c_multiple_action_plug:
2084  0000 88            	push	a
2085  0001 5224          	subw	sp,#36
2086       00000024      OFST:	set	36
2089                     ; 295 	u8 temp,i=0;
2091  0003 0f24          	clr	(OFST+0,sp)
2092                     ; 298 	temp = action_plug_num;
2094  0005 6b22          	ld	(OFST-2,sp),a
2096  0007 2040          	jra	L306
2097  0009               L775:
2098                     ; 300 		map.payload[2+i] = sicp_buf[8+i];
2100  0009 96            	ldw	x,sp
2101  000a 1c0006        	addw	x,#OFST-30
2102  000d 9f            	ld	a,xl
2103  000e 5e            	swapw	x
2104  000f 1b24          	add	a,(OFST+0,sp)
2105  0011 2401          	jrnc	L07
2106  0013 5c            	incw	x
2107  0014               L07:
2108  0014 02            	rlwa	x,a
2109  0015 7b24          	ld	a,(OFST+0,sp)
2110  0017 905f          	clrw	y
2111  0019 9097          	ld	yl,a
2112  001b 90d60008      	ld	a,(_sicp_buf+8,y)
2113  001f f7            	ld	(x),a
2114                     ; 301 		ret = i2c_action_plug(0x55,sicp_buf[8+i],sicp_buf[8+action_plug_num],sicp_buf[9+action_plug_num]);
2116  0020 7b25          	ld	a,(OFST+1,sp)
2117  0022 5f            	clrw	x
2118  0023 97            	ld	xl,a
2119  0024 d60009        	ld	a,(_sicp_buf+9,x)
2120  0027 88            	push	a
2121  0028 7b26          	ld	a,(OFST+2,sp)
2122  002a 5f            	clrw	x
2123  002b 97            	ld	xl,a
2124  002c d60008        	ld	a,(_sicp_buf+8,x)
2125  002f 88            	push	a
2126  0030 7b26          	ld	a,(OFST+2,sp)
2127  0032 5f            	clrw	x
2128  0033 97            	ld	xl,a
2129  0034 d60008        	ld	a,(_sicp_buf+8,x)
2130  0037 97            	ld	xl,a
2131  0038 a655          	ld	a,#85
2132  003a 95            	ld	xh,a
2133  003b cd0000        	call	_i2c_action_plug
2135  003e 85            	popw	x
2136  003f 6b23          	ld	(OFST-1,sp),a
2137                     ; 302 		i++;
2139  0041 0c24          	inc	(OFST+0,sp)
2140                     ; 303 		delay(30);
2142  0043 ae001e        	ldw	x,#30
2143  0046 cd0000        	call	_delay
2145  0049               L306:
2146                     ; 299 	while(temp--){
2148  0049 7b22          	ld	a,(OFST-2,sp)
2149  004b 0a22          	dec	(OFST-2,sp)
2150  004d 4d            	tnz	a
2151  004e 26b9          	jrne	L775
2152                     ; 305 	return ret;
2154  0050 7b23          	ld	a,(OFST-1,sp)
2157  0052 5b25          	addw	sp,#37
2158  0054 81            	ret
2171                     	xdef	_i2c_send_message
2172                     	xref	_I2C_WriteReadBytes
2173                     	xref	_I2C_WriteBytes
2174                     	xref	_delay
2175                     	xref	_Check_Sum
2176                     	xref	_mymemcpy
2177                     	xref	_sicp_buf
2178                     	xref	_sc
2179                     	xdef	_i2c_single_action_dimmer_result
2180                     	xdef	_i2c_multiple_action_plug
2181                     	xdef	_i2c_multiple_action_dimmer
2182                     	xdef	_i2c_action_plug
2183                     	xdef	_i2c_single_action_dimmer
2184                     	xdef	_i2c_get_energy_consum
2185                     	xdef	_i2c_heartbeat
2186                     	xdef	_i2c_device_info
2187                     	xdef	_scan_device
2188                     	switch	.bss
2189  0000               _action_dimmer_ext:
2190  0000 00            	ds.b	1
2191                     	xdef	_action_dimmer_ext
2192  0001               _action_dimmer_MDID:
2193  0001 00            	ds.b	1
2194                     	xdef	_action_dimmer_MDID
2195  0002               _hb_fail_mdid_cnt:
2196  0002 000000000000  	ds.b	15
2197                     	xdef	_hb_fail_mdid_cnt
2198  0011               _device_flag:
2199  0011 0000          	ds.b	2
2200                     	xdef	_device_flag
2201  0013               _i2c_rx_len:
2202  0013 00            	ds.b	1
2203                     	xdef	_i2c_rx_len
2204  0014               _i2c_rx_buf:
2205  0014 000000000000  	ds.b	30
2206                     	xdef	_i2c_rx_buf
2207  0032               _i2c_tx_len:
2208  0032 00            	ds.b	1
2209                     	xdef	_i2c_tx_len
2210  0033               _i2c_tx_buf:
2211  0033 000000000000  	ds.b	30
2212                     	xdef	_i2c_tx_buf
2213                     	xref.b	c_lreg
2214                     	xref.b	c_y
2234                     	end
