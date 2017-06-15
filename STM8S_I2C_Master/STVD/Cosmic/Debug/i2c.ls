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
 215  0004 c70034        	ld	_i2c_tx_buf,a
 216                     ; 11 	i2c_tx_buf[1] = tx->frame_h2;
 218  0007 1e04          	ldw	x,(OFST+4,sp)
 219  0009 e601          	ld	a,(1,x)
 220  000b c70035        	ld	_i2c_tx_buf+1,a
 221                     ; 12 	i2c_tx_buf[2] = tx->message_id;
 223  000e 1e04          	ldw	x,(OFST+4,sp)
 224  0010 e602          	ld	a,(2,x)
 225  0012 c70036        	ld	_i2c_tx_buf+2,a
 226                     ; 13 	i2c_tx_buf[3] = 2+payload_len;
 228  0015 7b06          	ld	a,(OFST+6,sp)
 229  0017 ab02          	add	a,#2
 230  0019 c70037        	ld	_i2c_tx_buf+3,a
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
 245  0032 ae0038        	ldw	x,#_i2c_tx_buf+4
 246  0035 cd0000        	call	_mymemcpy
 248  0038 5b06          	addw	sp,#6
 249                     ; 15 	i2c_tx_buf[4+payload_len] = Check_Sum(&i2c_tx_buf[2],i2c_tx_buf[3]);
 251  003a 7b06          	ld	a,(OFST+6,sp)
 252  003c 5f            	clrw	x
 253  003d 97            	ld	xl,a
 254  003e 89            	pushw	x
 255  003f 3b0037        	push	_i2c_tx_buf+3
 256  0042 ae0036        	ldw	x,#_i2c_tx_buf+2
 257  0045 cd0000        	call	_Check_Sum
 259  0048 5b01          	addw	sp,#1
 260  004a 85            	popw	x
 261  004b d70038        	ld	(_i2c_tx_buf+4,x),a
 262                     ; 17 	if(type == 0x00)	return(I2C_WriteBytes(mdid,i2c_tx_buf,5+payload_len,50));
 264  004e 0d01          	tnz	(OFST+1,sp)
 265  0050 2617          	jrne	L511
 268  0052 4b32          	push	#50
 269  0054 7b07          	ld	a,(OFST+7,sp)
 270  0056 ab05          	add	a,#5
 271  0058 88            	push	a
 272  0059 ae0034        	ldw	x,#_i2c_tx_buf
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
 290  006e ae0015        	ldw	x,#_i2c_rx_buf
 291  0071 89            	pushw	x
 292  0072 7b0a          	ld	a,(OFST+10,sp)
 293  0074 ab05          	add	a,#5
 294  0076 88            	push	a
 295  0077 ae0034        	ldw	x,#_i2c_tx_buf
 296  007a 89            	pushw	x
 297  007b 7b0e          	ld	a,(OFST+14,sp)
 298  007d 5f            	clrw	x
 299  007e 97            	ld	xl,a
 300  007f cd0000        	call	_I2C_WriteReadBytes
 302  0082 5b07          	addw	sp,#7
 305  0084 5b01          	addw	sp,#1
 306  0086 81            	ret
 348                     ; 22 void scan_device(void)
 348                     ; 23 {
 349                     .text:	section	.text,new
 350  0000               _scan_device:
 352  0000 5203          	subw	sp,#3
 353       00000003      OFST:	set	3
 356                     ; 26 	device_flag = 0x00;
 358  0002 5f            	clrw	x
 359  0003 cf0012        	ldw	_device_flag,x
 360                     ; 27 	for(i=1;i <= 0x0F;i++){
 362  0006 a601          	ld	a,#1
 363  0008 6b03          	ld	(OFST+0,sp),a
 364  000a               L731:
 365                     ; 28 		ret = I2C_WriteBytes(i,NULL,0,10);
 367  000a 4b0a          	push	#10
 368  000c 4b00          	push	#0
 369  000e 5f            	clrw	x
 370  000f 89            	pushw	x
 371  0010 7b07          	ld	a,(OFST+4,sp)
 372  0012 5f            	clrw	x
 373  0013 97            	ld	xl,a
 374  0014 cd0000        	call	_I2C_WriteBytes
 376  0017 5b04          	addw	sp,#4
 377  0019 5f            	clrw	x
 378  001a 97            	ld	xl,a
 379  001b 1f01          	ldw	(OFST-2,sp),x
 380                     ; 29 		if(ret == IIC_SUCCESS){
 382  001d 1e01          	ldw	x,(OFST-2,sp)
 383  001f 261e          	jrne	L541
 384                     ; 30 			test = i;
 386  0021 7b03          	ld	a,(OFST+0,sp)
 387  0023 c70000        	ld	_test,a
 388                     ; 31 			device_flag |= (1<<(i-1));
 390  0026 ae0001        	ldw	x,#1
 391  0029 7b03          	ld	a,(OFST+0,sp)
 392  002b 4a            	dec	a
 393  002c 4d            	tnz	a
 394  002d 2704          	jreq	L01
 395  002f               L21:
 396  002f 58            	sllw	x
 397  0030 4a            	dec	a
 398  0031 26fc          	jrne	L21
 399  0033               L01:
 400  0033 01            	rrwa	x,a
 401  0034 ca0013        	or	a,_device_flag+1
 402  0037 01            	rrwa	x,a
 403  0038 ca0012        	or	a,_device_flag
 404  003b 01            	rrwa	x,a
 405  003c cf0012        	ldw	_device_flag,x
 406  003f               L541:
 407                     ; 27 	for(i=1;i <= 0x0F;i++){
 409  003f 0c03          	inc	(OFST+0,sp)
 412  0041 7b03          	ld	a,(OFST+0,sp)
 413  0043 a110          	cp	a,#16
 414  0045 25c3          	jrult	L731
 415                     ; 34 }
 418  0047 5b03          	addw	sp,#3
 419  0049 81            	ret
 487                     ; 37 void i2c_device_info(void)
 487                     ; 38 {
 488                     .text:	section	.text,new
 489  0000               _i2c_device_info:
 491  0000 5226          	subw	sp,#38
 492       00000026      OFST:	set	38
 495                     ; 40 	u8 mdid = 0;
 497  0002 0f26          	clr	(OFST+0,sp)
 498                     ; 42 	u16 temp = device_flag;
 500  0004 ce0012        	ldw	x,_device_flag
 501  0007 1f03          	ldw	(OFST-35,sp),x
 502                     ; 43 	for(i = 1;i <= 15;i++){
 504  0009 a601          	ld	a,#1
 505  000b 6b02          	ld	(OFST-36,sp),a
 506  000d               L571:
 507                     ; 44 		mdid++;
 509  000d 0c26          	inc	(OFST+0,sp)
 510                     ; 45 		if((temp & 0x0001) == 0x0001){
 512  000f 7b03          	ld	a,(OFST-35,sp)
 513  0011 97            	ld	xl,a
 514  0012 7b04          	ld	a,(OFST-34,sp)
 515  0014 a401          	and	a,#1
 516  0016 5f            	clrw	x
 517  0017 02            	rlwa	x,a
 518  0018 a30001        	cpw	x,#1
 519  001b 2703          	jreq	L61
 520  001d cc016d        	jp	L302
 521  0020               L61:
 522                     ; 46 			di.frame_h1 = 0x7E;
 524  0020 a67e          	ld	a,#126
 525  0022 6b05          	ld	(OFST-33,sp),a
 526                     ; 47 			di.frame_h2 = 0x7E;
 528  0024 a67e          	ld	a,#126
 529  0026 6b06          	ld	(OFST-32,sp),a
 530                     ; 48 			di.message_id = mdid;
 532  0028 7b26          	ld	a,(OFST+0,sp)
 533  002a 6b07          	ld	(OFST-31,sp),a
 534                     ; 49 			di.payload[0] = 0xFE;//自己定义
 536  002c a6fe          	ld	a,#254
 537  002e 6b08          	ld	(OFST-30,sp),a
 538                     ; 50 			di.payload[1] = 0x01;//自己定义
 540  0030 a601          	ld	a,#1
 541  0032 6b09          	ld	(OFST-29,sp),a
 542                     ; 51 			ret = i2c_send_message(0x01,&di,2,mdid,14);
 544  0034 4b0e          	push	#14
 545  0036 7b27          	ld	a,(OFST+1,sp)
 546  0038 88            	push	a
 547  0039 4b02          	push	#2
 548  003b 96            	ldw	x,sp
 549  003c 1c0008        	addw	x,#OFST-30
 550  003f 89            	pushw	x
 551  0040 a601          	ld	a,#1
 552  0042 cd0000        	call	_i2c_send_message
 554  0045 5b05          	addw	sp,#5
 555  0047 6b01          	ld	(OFST-37,sp),a
 556                     ; 52 			if (ret == IIC_SUCCESS){
 558  0049 0d01          	tnz	(OFST-37,sp)
 559  004b 2703          	jreq	L02
 560  004d cc016d        	jp	L302
 561  0050               L02:
 562                     ; 53 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[13]){//校验正确
 564  0050 3b0018        	push	_i2c_rx_buf+3
 565  0053 ae0017        	ldw	x,#_i2c_rx_buf+2
 566  0056 cd0000        	call	_Check_Sum
 568  0059 5b01          	addw	sp,#1
 569  005b c10022        	cp	a,_i2c_rx_buf+13
 570  005e 2703          	jreq	L22
 571  0060 cc016d        	jp	L302
 572  0063               L22:
 573                     ; 54 					if(i2c_rx_buf[4] == 0xB2){//此为SLC
 575  0063 c60019        	ld	a,_i2c_rx_buf+4
 576  0066 a1b2          	cp	a,#178
 577  0068 2703cc00eb    	jrne	L112
 578                     ; 55 						sc.slc[mdid-1].MDID = mdid;
 580  006d 7b26          	ld	a,(OFST+0,sp)
 581  006f 97            	ld	xl,a
 582  0070 a61a          	ld	a,#26
 583  0072 42            	mul	x,a
 584  0073 1d001a        	subw	x,#26
 585  0076 7b26          	ld	a,(OFST+0,sp)
 586  0078 905f          	clrw	y
 587  007a 9097          	ld	yl,a
 588  007c df01d0        	ldw	(_sc+464,x),y
 589                     ; 56 						sc.slc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 591  007f 7b26          	ld	a,(OFST+0,sp)
 592  0081 97            	ld	xl,a
 593  0082 a61a          	ld	a,#26
 594  0084 42            	mul	x,a
 595  0085 1d001a        	subw	x,#26
 596  0088 c6001a        	ld	a,_i2c_rx_buf+5
 597  008b d701bf        	ld	(_sc+447,x),a
 598                     ; 57 						sc.slc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 600  008e 7b26          	ld	a,(OFST+0,sp)
 601  0090 97            	ld	xl,a
 602  0091 a61a          	ld	a,#26
 603  0093 42            	mul	x,a
 604  0094 1d001a        	subw	x,#26
 605  0097 c6001b        	ld	a,_i2c_rx_buf+6
 606  009a d701c0        	ld	(_sc+448,x),a
 607                     ; 58 						sc.slc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 609  009d 7b26          	ld	a,(OFST+0,sp)
 610  009f 97            	ld	xl,a
 611  00a0 a61a          	ld	a,#26
 612  00a2 42            	mul	x,a
 613  00a3 1d001a        	subw	x,#26
 614  00a6 c6001c        	ld	a,_i2c_rx_buf+7
 615  00a9 d701c1        	ld	(_sc+449,x),a
 616                     ; 59 						sc.slc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 618  00ac 7b26          	ld	a,(OFST+0,sp)
 619  00ae 97            	ld	xl,a
 620  00af a61a          	ld	a,#26
 621  00b1 42            	mul	x,a
 622  00b2 1d001a        	subw	x,#26
 623  00b5 c6001d        	ld	a,_i2c_rx_buf+8
 624  00b8 d701c2        	ld	(_sc+450,x),a
 625                     ; 60 						sc.slc[mdid-1].model = i2c_rx_buf[9];
 627  00bb 7b26          	ld	a,(OFST+0,sp)
 628  00bd 97            	ld	xl,a
 629  00be a61a          	ld	a,#26
 630  00c0 42            	mul	x,a
 631  00c1 1d001a        	subw	x,#26
 632  00c4 c6001e        	ld	a,_i2c_rx_buf+9
 633  00c7 d701c5        	ld	(_sc+453,x),a
 634                     ; 61 						sc.slc[mdid-1].firmware = i2c_rx_buf[10];
 636  00ca 7b26          	ld	a,(OFST+0,sp)
 637  00cc 97            	ld	xl,a
 638  00cd a61a          	ld	a,#26
 639  00cf 42            	mul	x,a
 640  00d0 1d001a        	subw	x,#26
 641  00d3 c6001f        	ld	a,_i2c_rx_buf+10
 642  00d6 d701c3        	ld	(_sc+451,x),a
 643                     ; 62 						sc.slc[mdid-1].HWTtest = i2c_rx_buf[11];
 645  00d9 7b26          	ld	a,(OFST+0,sp)
 646  00db 97            	ld	xl,a
 647  00dc a61a          	ld	a,#26
 648  00de 42            	mul	x,a
 649  00df 1d001a        	subw	x,#26
 650  00e2 c60020        	ld	a,_i2c_rx_buf+11
 651  00e5 d701c4        	ld	(_sc+452,x),a
 653  00e8 cc016d        	jra	L302
 654  00eb               L112:
 655                     ; 64 					else if(i2c_rx_buf[4] == 0xB3){//此为SPC
 657  00eb c60019        	ld	a,_i2c_rx_buf+4
 658  00ee a1b3          	cp	a,#179
 659  00f0 267b          	jrne	L302
 660                     ; 65 						sc.spc[mdid-1].MDID = mdid;
 662  00f2 7b26          	ld	a,(OFST+0,sp)
 663  00f4 97            	ld	xl,a
 664  00f5 a61c          	ld	a,#28
 665  00f7 42            	mul	x,a
 666  00f8 1d001c        	subw	x,#28
 667  00fb 7b26          	ld	a,(OFST+0,sp)
 668  00fd 905f          	clrw	y
 669  00ff 9097          	ld	yl,a
 670  0101 df002c        	ldw	(_sc+44,x),y
 671                     ; 66 						sc.spc[mdid-1].deviceid[0] = i2c_rx_buf[5];
 673  0104 7b26          	ld	a,(OFST+0,sp)
 674  0106 97            	ld	xl,a
 675  0107 a61c          	ld	a,#28
 676  0109 42            	mul	x,a
 677  010a 1d001c        	subw	x,#28
 678  010d c6001a        	ld	a,_i2c_rx_buf+5
 679  0110 d7001b        	ld	(_sc+27,x),a
 680                     ; 67 						sc.spc[mdid-1].deviceid[1] = i2c_rx_buf[6];
 682  0113 7b26          	ld	a,(OFST+0,sp)
 683  0115 97            	ld	xl,a
 684  0116 a61c          	ld	a,#28
 685  0118 42            	mul	x,a
 686  0119 1d001c        	subw	x,#28
 687  011c c6001b        	ld	a,_i2c_rx_buf+6
 688  011f d7001c        	ld	(_sc+28,x),a
 689                     ; 68 						sc.spc[mdid-1].deviceid[2] = i2c_rx_buf[7];
 691  0122 7b26          	ld	a,(OFST+0,sp)
 692  0124 97            	ld	xl,a
 693  0125 a61c          	ld	a,#28
 694  0127 42            	mul	x,a
 695  0128 1d001c        	subw	x,#28
 696  012b c6001c        	ld	a,_i2c_rx_buf+7
 697  012e d7001d        	ld	(_sc+29,x),a
 698                     ; 69 						sc.spc[mdid-1].deviceid[3] = i2c_rx_buf[8];
 700  0131 7b26          	ld	a,(OFST+0,sp)
 701  0133 97            	ld	xl,a
 702  0134 a61c          	ld	a,#28
 703  0136 42            	mul	x,a
 704  0137 1d001c        	subw	x,#28
 705  013a c6001d        	ld	a,_i2c_rx_buf+8
 706  013d d7001e        	ld	(_sc+30,x),a
 707                     ; 70 						sc.spc[mdid-1].model = i2c_rx_buf[9];
 709  0140 7b26          	ld	a,(OFST+0,sp)
 710  0142 97            	ld	xl,a
 711  0143 a61c          	ld	a,#28
 712  0145 42            	mul	x,a
 713  0146 1d001c        	subw	x,#28
 714  0149 c6001e        	ld	a,_i2c_rx_buf+9
 715  014c d70021        	ld	(_sc+33,x),a
 716                     ; 71 						sc.spc[mdid-1].firmware = i2c_rx_buf[10];
 718  014f 7b26          	ld	a,(OFST+0,sp)
 719  0151 97            	ld	xl,a
 720  0152 a61c          	ld	a,#28
 721  0154 42            	mul	x,a
 722  0155 1d001c        	subw	x,#28
 723  0158 c6001f        	ld	a,_i2c_rx_buf+10
 724  015b d7001f        	ld	(_sc+31,x),a
 725                     ; 72 						sc.spc[mdid-1].HWTtest = i2c_rx_buf[11];
 727  015e 7b26          	ld	a,(OFST+0,sp)
 728  0160 97            	ld	xl,a
 729  0161 a61c          	ld	a,#28
 730  0163 42            	mul	x,a
 731  0164 1d001c        	subw	x,#28
 732  0167 c60020        	ld	a,_i2c_rx_buf+11
 733  016a d70020        	ld	(_sc+32,x),a
 734  016d               L302:
 735                     ; 78 		temp = temp>>1;
 737  016d 0403          	srl	(OFST-35,sp)
 738  016f 0604          	rrc	(OFST-34,sp)
 739                     ; 43 	for(i = 1;i <= 15;i++){
 741  0171 0c02          	inc	(OFST-36,sp)
 744  0173 7b02          	ld	a,(OFST-36,sp)
 745  0175 a110          	cp	a,#16
 746  0177 2403          	jruge	L42
 747  0179 cc000d        	jp	L571
 748  017c               L42:
 749                     ; 80 }
 752  017c 5b26          	addw	sp,#38
 753  017e 81            	ret
 822                     ; 83 void i2c_heartbeat(void)
 822                     ; 84 {
 823                     .text:	section	.text,new
 824  0000               _i2c_heartbeat:
 826  0000 5224          	subw	sp,#36
 827       00000024      OFST:	set	36
 830                     ; 86 	u8 mdid = 0;
 832  0002 0f01          	clr	(OFST-35,sp)
 833                     ; 88 	for(i = 1;i <= 15;i++){
 835  0004 a601          	ld	a,#1
 836  0006 6b23          	ld	(OFST-1,sp),a
 837  0008               L542:
 838                     ; 89 		mdid++;
 840  0008 0c01          	inc	(OFST-35,sp)
 841                     ; 90 		if(device_flag & 0x01){
 843  000a c60013        	ld	a,_device_flag+1
 844  000d a501          	bcp	a,#1
 845  000f 2603          	jrne	L03
 846  0011 cc012a        	jp	L352
 847  0014               L03:
 848                     ; 91 			hb.frame_h1 = 0x7E;
 850  0014 a67e          	ld	a,#126
 851  0016 6b02          	ld	(OFST-34,sp),a
 852                     ; 92 			hb.frame_h2 = 0x7E;
 854  0018 a67e          	ld	a,#126
 855  001a 6b03          	ld	(OFST-33,sp),a
 856                     ; 93 			hb.message_id = mdid+15;
 858  001c 7b01          	ld	a,(OFST-35,sp)
 859  001e ab0f          	add	a,#15
 860  0020 6b04          	ld	(OFST-32,sp),a
 861                     ; 94 			hb.payload[0] = 0x03;
 863  0022 a603          	ld	a,#3
 864  0024 6b05          	ld	(OFST-31,sp),a
 865                     ; 95 			hb.payload[1] = 0x03;
 867  0026 a603          	ld	a,#3
 868  0028 6b06          	ld	(OFST-30,sp),a
 869                     ; 96 			hb.payload[2] = mdid;
 871  002a 7b01          	ld	a,(OFST-35,sp)
 872  002c 6b07          	ld	(OFST-29,sp),a
 873                     ; 97 			ret = i2c_send_message(0x01,&hb,3,mdid,11);
 875  002e 4b0b          	push	#11
 876  0030 7b02          	ld	a,(OFST-34,sp)
 877  0032 88            	push	a
 878  0033 4b03          	push	#3
 879  0035 96            	ldw	x,sp
 880  0036 1c0005        	addw	x,#OFST-31
 881  0039 89            	pushw	x
 882  003a a601          	ld	a,#1
 883  003c cd0000        	call	_i2c_send_message
 885  003f 5b05          	addw	sp,#5
 886  0041 6b24          	ld	(OFST+0,sp),a
 887                     ; 98 			if (ret == IIC_SUCCESS){
 889  0043 0d24          	tnz	(OFST+0,sp)
 890  0045 2703          	jreq	L23
 891  0047 cc0119        	jp	L552
 892  004a               L23:
 893                     ; 99 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[10]){//校验正确
 895  004a 3b0018        	push	_i2c_rx_buf+3
 896  004d ae0017        	ldw	x,#_i2c_rx_buf+2
 897  0050 cd0000        	call	_Check_Sum
 899  0053 5b01          	addw	sp,#1
 900  0055 c1001f        	cp	a,_i2c_rx_buf+10
 901  0058 2703          	jreq	L43
 902  005a cc010e        	jp	L752
 903  005d               L43:
 904                     ; 100 					if(i2c_rx_buf[4] == 0x06){
 906  005d c60019        	ld	a,_i2c_rx_buf+4
 907  0060 a106          	cp	a,#6
 908  0062 2703          	jreq	L63
 909  0064 cc010e        	jp	L752
 910  0067               L63:
 911                     ; 101 						for(j = 0;j < 15;j++){
 913  0067 0f24          	clr	(OFST+0,sp)
 914  0069               L362:
 915                     ; 102 							if(sc.slc[j].MDID == i2c_rx_buf[5]){
 917  0069 7b24          	ld	a,(OFST+0,sp)
 918  006b 97            	ld	xl,a
 919  006c a61a          	ld	a,#26
 920  006e 42            	mul	x,a
 921  006f c6001a        	ld	a,_i2c_rx_buf+5
 922  0072 905f          	clrw	y
 923  0074 9097          	ld	yl,a
 924  0076 90bf00        	ldw	c_y,y
 925  0079 9093          	ldw	y,x
 926  007b 90de01d0      	ldw	y,(_sc+464,y)
 927  007f 90b300        	cpw	y,c_y
 928  0082 2632          	jrne	L172
 929                     ; 103 								sc.slc[j].ch1_status = i2c_rx_buf[6];
 931  0084 7b24          	ld	a,(OFST+0,sp)
 932  0086 97            	ld	xl,a
 933  0087 a61a          	ld	a,#26
 934  0089 42            	mul	x,a
 935  008a c6001b        	ld	a,_i2c_rx_buf+6
 936  008d d701d2        	ld	(_sc+466,x),a
 937                     ; 104 								sc.slc[j].ch2_status = i2c_rx_buf[7];
 939  0090 7b24          	ld	a,(OFST+0,sp)
 940  0092 97            	ld	xl,a
 941  0093 a61a          	ld	a,#26
 942  0095 42            	mul	x,a
 943  0096 c6001c        	ld	a,_i2c_rx_buf+7
 944  0099 d701d3        	ld	(_sc+467,x),a
 945                     ; 105 								sc.slc[j].ch3_status = i2c_rx_buf[8];
 947  009c 7b24          	ld	a,(OFST+0,sp)
 948  009e 97            	ld	xl,a
 949  009f a61a          	ld	a,#26
 950  00a1 42            	mul	x,a
 951  00a2 c6001d        	ld	a,_i2c_rx_buf+8
 952  00a5 d701d4        	ld	(_sc+468,x),a
 953                     ; 106 								sc.slc[j].ch4_status = i2c_rx_buf[9];
 955  00a8 7b24          	ld	a,(OFST+0,sp)
 956  00aa 97            	ld	xl,a
 957  00ab a61a          	ld	a,#26
 958  00ad 42            	mul	x,a
 959  00ae c6001e        	ld	a,_i2c_rx_buf+9
 960  00b1 d701d5        	ld	(_sc+469,x),a
 961                     ; 107 								break;
 963  00b4 2058          	jra	L752
 964  00b6               L172:
 965                     ; 109 							else if(sc.spc[j].MDID == i2c_rx_buf[5]){
 967  00b6 7b24          	ld	a,(OFST+0,sp)
 968  00b8 97            	ld	xl,a
 969  00b9 a61c          	ld	a,#28
 970  00bb 42            	mul	x,a
 971  00bc c6001a        	ld	a,_i2c_rx_buf+5
 972  00bf 905f          	clrw	y
 973  00c1 9097          	ld	yl,a
 974  00c3 90bf00        	ldw	c_y,y
 975  00c6 9093          	ldw	y,x
 976  00c8 90de002c      	ldw	y,(_sc+44,y)
 977  00cc 90b300        	cpw	y,c_y
 978  00cf 2632          	jrne	L372
 979                     ; 110 								sc.spc[j].ch1_status = i2c_rx_buf[6];
 981  00d1 7b24          	ld	a,(OFST+0,sp)
 982  00d3 97            	ld	xl,a
 983  00d4 a61c          	ld	a,#28
 984  00d6 42            	mul	x,a
 985  00d7 c6001b        	ld	a,_i2c_rx_buf+6
 986  00da d7002e        	ld	(_sc+46,x),a
 987                     ; 111 								sc.spc[j].ch2_status = i2c_rx_buf[7];
 989  00dd 7b24          	ld	a,(OFST+0,sp)
 990  00df 97            	ld	xl,a
 991  00e0 a61c          	ld	a,#28
 992  00e2 42            	mul	x,a
 993  00e3 c6001c        	ld	a,_i2c_rx_buf+7
 994  00e6 d7002f        	ld	(_sc+47,x),a
 995                     ; 112 								sc.spc[j].ch3_status = i2c_rx_buf[8];
 997  00e9 7b24          	ld	a,(OFST+0,sp)
 998  00eb 97            	ld	xl,a
 999  00ec a61c          	ld	a,#28
1000  00ee 42            	mul	x,a
1001  00ef c6001d        	ld	a,_i2c_rx_buf+8
1002  00f2 d70030        	ld	(_sc+48,x),a
1003                     ; 113 								sc.spc[j].ch4_status = i2c_rx_buf[9];
1005  00f5 7b24          	ld	a,(OFST+0,sp)
1006  00f7 97            	ld	xl,a
1007  00f8 a61c          	ld	a,#28
1008  00fa 42            	mul	x,a
1009  00fb c6001e        	ld	a,_i2c_rx_buf+9
1010  00fe d70031        	ld	(_sc+49,x),a
1011                     ; 114 								break;
1013  0101 200b          	jra	L752
1014  0103               L372:
1015                     ; 101 						for(j = 0;j < 15;j++){
1017  0103 0c24          	inc	(OFST+0,sp)
1020  0105 7b24          	ld	a,(OFST+0,sp)
1021  0107 a10f          	cp	a,#15
1022  0109 2403          	jruge	L04
1023  010b cc0069        	jp	L362
1024  010e               L04:
1025  010e               L752:
1026                     ; 119 				hb_fail_mdid_cnt[mdid-1]=0;//有1次读取到回复，则清零相应的mdid失败的次数
1028  010e 7b01          	ld	a,(OFST-35,sp)
1029  0110 5f            	clrw	x
1030  0111 97            	ld	xl,a
1031  0112 5a            	decw	x
1032  0113 724f0003      	clr	(_hb_fail_mdid_cnt,x)
1034  0117 2009          	jra	L772
1035  0119               L552:
1036                     ; 122 				hb_fail_mdid_cnt[mdid-1]++;
1038  0119 7b01          	ld	a,(OFST-35,sp)
1039  011b 5f            	clrw	x
1040  011c 97            	ld	xl,a
1041  011d 5a            	decw	x
1042  011e 724c0003      	inc	(_hb_fail_mdid_cnt,x)
1043  0122               L772:
1044                     ; 124 			device_flag = device_flag>>1;
1046  0122 72540012      	srl	_device_flag
1047  0126 72560013      	rrc	_device_flag+1
1048  012a               L352:
1049                     ; 88 	for(i = 1;i <= 15;i++){
1051  012a 0c23          	inc	(OFST-1,sp)
1054  012c 7b23          	ld	a,(OFST-1,sp)
1055  012e a110          	cp	a,#16
1056  0130 2403          	jruge	L24
1057  0132 cc0008        	jp	L542
1058  0135               L24:
1059                     ; 127 	for(i = 0; i < 15;i++){
1061  0135 0f23          	clr	(OFST-1,sp)
1062  0137               L103:
1063                     ; 128 		if(hb_fail_mdid_cnt[i] >= 20){
1065  0137 7b23          	ld	a,(OFST-1,sp)
1066  0139 5f            	clrw	x
1067  013a 97            	ld	xl,a
1068  013b d60003        	ld	a,(_hb_fail_mdid_cnt,x)
1069  013e a114          	cp	a,#20
1070  0140 255e          	jrult	L703
1071                     ; 129 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1073  0142 0f24          	clr	(OFST+0,sp)
1074  0144               L113:
1075                     ; 130 				if(sc.slc[j].MDID == i){
1077  0144 7b24          	ld	a,(OFST+0,sp)
1078  0146 97            	ld	xl,a
1079  0147 a61a          	ld	a,#26
1080  0149 42            	mul	x,a
1081  014a 7b23          	ld	a,(OFST-1,sp)
1082  014c 905f          	clrw	y
1083  014e 9097          	ld	yl,a
1084  0150 90bf00        	ldw	c_y,y
1085  0153 9093          	ldw	y,x
1086  0155 90de01d0      	ldw	y,(_sc+464,y)
1087  0159 90b300        	cpw	y,c_y
1088  015c 2610          	jrne	L713
1089                     ; 131 					sc.slc[j].HWTtest &= 0x7F;//SLC STM8S故障
1091  015e 7b24          	ld	a,(OFST+0,sp)
1092  0160 97            	ld	xl,a
1093  0161 a61a          	ld	a,#26
1094  0163 42            	mul	x,a
1095  0164 d601c4        	ld	a,(_sc+452,x)
1096  0167 a47f          	and	a,#127
1097  0169 d701c4        	ld	(_sc+452,x),a
1098                     ; 132 					break;
1100  016c 2032          	jra	L703
1101  016e               L713:
1102                     ; 134 				else if(sc.spc[j].MDID == i){
1104  016e 7b24          	ld	a,(OFST+0,sp)
1105  0170 97            	ld	xl,a
1106  0171 a61c          	ld	a,#28
1107  0173 42            	mul	x,a
1108  0174 7b23          	ld	a,(OFST-1,sp)
1109  0176 905f          	clrw	y
1110  0178 9097          	ld	yl,a
1111  017a 90bf00        	ldw	c_y,y
1112  017d 9093          	ldw	y,x
1113  017f 90de002c      	ldw	y,(_sc+44,y)
1114  0183 90b300        	cpw	y,c_y
1115  0186 2610          	jrne	L123
1116                     ; 135 					sc.spc[j].HWTtest &= 0x7F;//SPC STM8S故障
1118  0188 7b24          	ld	a,(OFST+0,sp)
1119  018a 97            	ld	xl,a
1120  018b a61c          	ld	a,#28
1121  018d 42            	mul	x,a
1122  018e d60020        	ld	a,(_sc+32,x)
1123  0191 a47f          	and	a,#127
1124  0193 d70020        	ld	(_sc+32,x),a
1125                     ; 136 					break;
1127  0196 2008          	jra	L703
1128  0198               L123:
1129                     ; 129 			for(j = 0; j < 15;j++){//寻找故障的SLC或者SPC
1131  0198 0c24          	inc	(OFST+0,sp)
1134  019a 7b24          	ld	a,(OFST+0,sp)
1135  019c a10f          	cp	a,#15
1136  019e 25a4          	jrult	L113
1137  01a0               L703:
1138                     ; 127 	for(i = 0; i < 15;i++){
1140  01a0 0c23          	inc	(OFST-1,sp)
1143  01a2 7b23          	ld	a,(OFST-1,sp)
1144  01a4 a10f          	cp	a,#15
1145  01a6 258f          	jrult	L103
1146                     ; 141 }
1149  01a8 5b24          	addw	sp,#36
1150  01aa 81            	ret
1204                     ; 144 void i2c_get_energy_consum(void)
1204                     ; 145 {
1205                     .text:	section	.text,new
1206  0000               _i2c_get_energy_consum:
1208  0000 5223          	subw	sp,#35
1209       00000023      OFST:	set	35
1212                     ; 148 	for(i = 0; i < 15;i++){
1214  0002 0f23          	clr	(OFST+0,sp)
1215  0004               L743:
1216                     ; 149 		if(sc.spc[i].MDID){
1218  0004 7b23          	ld	a,(OFST+0,sp)
1219  0006 97            	ld	xl,a
1220  0007 a61c          	ld	a,#28
1221  0009 42            	mul	x,a
1222  000a d6002d        	ld	a,(_sc+45,x)
1223  000d da002c        	or	a,(_sc+44,x)
1224  0010 2603cc00a1    	jreq	L553
1225                     ; 150 			eg.frame_h1 = 0x7E;
1227  0015 a67e          	ld	a,#126
1228  0017 6b02          	ld	(OFST-33,sp),a
1229                     ; 151 			eg.frame_h2 = 0x7E;
1231  0019 a67e          	ld	a,#126
1232  001b 6b03          	ld	(OFST-32,sp),a
1233                     ; 152 			eg.message_id = sc.spc[i].MDID+30;
1235  001d 7b23          	ld	a,(OFST+0,sp)
1236  001f 97            	ld	xl,a
1237  0020 a61c          	ld	a,#28
1238  0022 42            	mul	x,a
1239  0023 d6002d        	ld	a,(_sc+45,x)
1240  0026 ab1e          	add	a,#30
1241  0028 6b04          	ld	(OFST-31,sp),a
1242                     ; 153 			eg.payload[0] = 0xFE;//自己定义
1244  002a a6fe          	ld	a,#254
1245  002c 6b05          	ld	(OFST-30,sp),a
1246                     ; 154 			eg.payload[1] = 0x02;//自己定义
1248  002e a602          	ld	a,#2
1249  0030 6b06          	ld	(OFST-29,sp),a
1250                     ; 155 			ret = i2c_send_message(0x01,&eg,2,sc.spc[i].MDID,9);
1252  0032 4b09          	push	#9
1253  0034 7b24          	ld	a,(OFST+1,sp)
1254  0036 97            	ld	xl,a
1255  0037 a61c          	ld	a,#28
1256  0039 42            	mul	x,a
1257  003a d6002d        	ld	a,(_sc+45,x)
1258  003d 88            	push	a
1259  003e 4b02          	push	#2
1260  0040 96            	ldw	x,sp
1261  0041 1c0005        	addw	x,#OFST-30
1262  0044 89            	pushw	x
1263  0045 a601          	ld	a,#1
1264  0047 cd0000        	call	_i2c_send_message
1266  004a 5b05          	addw	sp,#5
1267  004c 6b01          	ld	(OFST-34,sp),a
1268                     ; 156 			if (ret == IIC_SUCCESS){
1270  004e 0d01          	tnz	(OFST-34,sp)
1271  0050 264f          	jrne	L553
1272                     ; 157 				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[8]){//校验正确
1274  0052 3b0018        	push	_i2c_rx_buf+3
1275  0055 ae0017        	ldw	x,#_i2c_rx_buf+2
1276  0058 cd0000        	call	_Check_Sum
1278  005b 5b01          	addw	sp,#1
1279  005d c1001d        	cp	a,_i2c_rx_buf+8
1280  0060 263f          	jrne	L553
1281                     ; 158 					if(i2c_rx_buf[4] == 0x2A){
1283  0062 c60019        	ld	a,_i2c_rx_buf+4
1284  0065 a12a          	cp	a,#42
1285  0067 2638          	jrne	L553
1286                     ; 159 						if(sc.spc[i].MDID == i2c_rx_buf[7])
1288  0069 7b23          	ld	a,(OFST+0,sp)
1289  006b 97            	ld	xl,a
1290  006c a61c          	ld	a,#28
1291  006e 42            	mul	x,a
1292  006f c6001c        	ld	a,_i2c_rx_buf+7
1293  0072 905f          	clrw	y
1294  0074 9097          	ld	yl,a
1295  0076 90bf00        	ldw	c_y,y
1296  0079 9093          	ldw	y,x
1297  007b 90de002c      	ldw	y,(_sc+44,y)
1298  007f 90b300        	cpw	y,c_y
1299  0082 261d          	jrne	L553
1300                     ; 160 							sc.spc[i].energy_consum = ((u16)i2c_rx_buf[5])<<8 + (u16)i2c_rx_buf[6];
1302  0084 7b23          	ld	a,(OFST+0,sp)
1303  0086 97            	ld	xl,a
1304  0087 a61c          	ld	a,#28
1305  0089 42            	mul	x,a
1306  008a c6001a        	ld	a,_i2c_rx_buf+5
1307  008d 905f          	clrw	y
1308  008f 9097          	ld	yl,a
1309  0091 c6001b        	ld	a,_i2c_rx_buf+6
1310  0094 ab08          	add	a,#8
1311  0096 4d            	tnz	a
1312  0097 2705          	jreq	L64
1313  0099               L05:
1314  0099 9058          	sllw	y
1315  009b 4a            	dec	a
1316  009c 26fb          	jrne	L05
1317  009e               L64:
1318  009e df0032        	ldw	(_sc+50,x),y
1319  00a1               L553:
1320                     ; 148 	for(i = 0; i < 15;i++){
1322  00a1 0c23          	inc	(OFST+0,sp)
1325  00a3 7b23          	ld	a,(OFST+0,sp)
1326  00a5 a10f          	cp	a,#15
1327  00a7 2403          	jruge	L25
1328  00a9 cc0004        	jp	L743
1329  00ac               L25:
1330                     ; 166 }
1333  00ac 5b23          	addw	sp,#35
1334  00ae 81            	ret
1416                     ; 169 u8 i2c_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext)
1416                     ; 170 {
1417                     .text:	section	.text,new
1418  0000               _i2c_single_action_dimmer:
1420  0000 89            	pushw	x
1421  0001 5222          	subw	sp,#34
1422       00000022      OFST:	set	34
1425                     ; 173 	u8 mdid = (mdid_channel&0xf0)>>4;
1427  0003 9f            	ld	a,xl
1428  0004 a4f0          	and	a,#240
1429  0006 4e            	swap	a
1430  0007 a40f          	and	a,#15
1431  0009 6b01          	ld	(OFST-33,sp),a
1432                     ; 174 	sad.frame_h1 = 0x7E;
1434  000b a67e          	ld	a,#126
1435  000d 6b02          	ld	(OFST-32,sp),a
1436                     ; 175 	sad.frame_h2 = 0x7E;
1438  000f a67e          	ld	a,#126
1439  0011 6b03          	ld	(OFST-31,sp),a
1440                     ; 176 	sad.message_id = mdid+45;
1442  0013 7b01          	ld	a,(OFST-33,sp)
1443  0015 ab2d          	add	a,#45
1444  0017 6b04          	ld	(OFST-30,sp),a
1445                     ; 177 	sad.payload[0] = action;
1447  0019 7b23          	ld	a,(OFST+1,sp)
1448  001b 6b05          	ld	(OFST-29,sp),a
1449                     ; 178 	sad.payload[1] = mdid_channel;
1451  001d 7b24          	ld	a,(OFST+2,sp)
1452  001f 6b06          	ld	(OFST-28,sp),a
1453                     ; 179 	sad.payload[2] = value;
1455  0021 7b27          	ld	a,(OFST+5,sp)
1456  0023 6b07          	ld	(OFST-27,sp),a
1457                     ; 180 	sad.payload[3] = ext;
1459  0025 7b28          	ld	a,(OFST+6,sp)
1460  0027 6b08          	ld	(OFST-26,sp),a
1461                     ; 193 	ret = i2c_send_message(0x01,&sad,4,mdid,8);
1463  0029 4b08          	push	#8
1464  002b 7b02          	ld	a,(OFST-32,sp)
1465  002d 88            	push	a
1466  002e 4b04          	push	#4
1467  0030 96            	ldw	x,sp
1468  0031 1c0005        	addw	x,#OFST-29
1469  0034 89            	pushw	x
1470  0035 a601          	ld	a,#1
1471  0037 cd0000        	call	_i2c_send_message
1473  003a 5b05          	addw	sp,#5
1474  003c 6b01          	ld	(OFST-33,sp),a
1475                     ; 194 	if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[7]){//校验正确
1477  003e 3b0018        	push	_i2c_rx_buf+3
1478  0041 ae0017        	ldw	x,#_i2c_rx_buf+2
1479  0044 cd0000        	call	_Check_Sum
1481  0047 5b01          	addw	sp,#1
1482  0049 c1001c        	cp	a,_i2c_rx_buf+7
1483  004c 2613          	jrne	L124
1484                     ; 195 		if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x02)){
1486  004e c60019        	ld	a,_i2c_rx_buf+4
1487  0051 a1aa          	cp	a,#170
1488  0053 260c          	jrne	L124
1490  0055 c6001a        	ld	a,_i2c_rx_buf+5
1491  0058 a102          	cp	a,#2
1492  005a 2605          	jrne	L124
1493                     ; 196 			action_dimmer_MDID = i2c_rx_buf[6];
1495  005c 55001b0002    	mov	_action_dimmer_MDID,_i2c_rx_buf+6
1496  0061               L124:
1497                     ; 199 	return ret;
1499  0061 7b01          	ld	a,(OFST-33,sp)
1502  0063 5b24          	addw	sp,#36
1503  0065 81            	ret
1557                     ; 202 u8 i2c_single_action_dimmer_result(u8 mdid)
1557                     ; 203 {
1558                     .text:	section	.text,new
1559  0000               _i2c_single_action_dimmer_result:
1561  0000 88            	push	a
1562  0001 5222          	subw	sp,#34
1563       00000022      OFST:	set	34
1566                     ; 206 	sad.frame_h1 = 0x7E;
1568  0003 a67e          	ld	a,#126
1569  0005 6b02          	ld	(OFST-32,sp),a
1570                     ; 207 	sad.frame_h2 = 0x7E;
1572  0007 a67e          	ld	a,#126
1573  0009 6b03          	ld	(OFST-31,sp),a
1574                     ; 208 	sad.message_id = 66;
1576  000b a642          	ld	a,#66
1577  000d 6b04          	ld	(OFST-30,sp),a
1578                     ; 209 	sad.payload[0] = 0x59;
1580  000f a659          	ld	a,#89
1581  0011 6b05          	ld	(OFST-29,sp),a
1582                     ; 210 	sad.payload[1] = mdid;
1584  0013 7b23          	ld	a,(OFST+1,sp)
1585  0015 6b06          	ld	(OFST-28,sp),a
1586                     ; 211 	ret = i2c_send_message(0x01,&sad,2,mdid,12);
1588  0017 4b0c          	push	#12
1589  0019 7b24          	ld	a,(OFST+2,sp)
1590  001b 88            	push	a
1591  001c 4b02          	push	#2
1592  001e 96            	ldw	x,sp
1593  001f 1c0005        	addw	x,#OFST-29
1594  0022 89            	pushw	x
1595  0023 a601          	ld	a,#1
1596  0025 cd0000        	call	_i2c_send_message
1598  0028 5b05          	addw	sp,#5
1599  002a 6b01          	ld	(OFST-33,sp),a
1600                     ; 212 	if (ret == IIC_SUCCESS){
1602  002c 0d01          	tnz	(OFST-33,sp)
1603  002e 265e          	jrne	L744
1604                     ; 213 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1606  0030 3b0018        	push	_i2c_rx_buf+3
1607  0033 ae0017        	ldw	x,#_i2c_rx_buf+2
1608  0036 cd0000        	call	_Check_Sum
1610  0039 5b01          	addw	sp,#1
1611  003b c10020        	cp	a,_i2c_rx_buf+11
1612  003e 264e          	jrne	L744
1613                     ; 214 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1615  0040 c60019        	ld	a,_i2c_rx_buf+4
1616  0043 a1aa          	cp	a,#170
1617  0045 2647          	jrne	L744
1619  0047 c6001a        	ld	a,_i2c_rx_buf+5
1620  004a a105          	cp	a,#5
1621  004c 2640          	jrne	L744
1622                     ; 215 				sc.slc[i2c_rx_buf[6]-1].ch1_status = i2c_rx_buf[7];
1624  004e c6001b        	ld	a,_i2c_rx_buf+6
1625  0051 97            	ld	xl,a
1626  0052 a61a          	ld	a,#26
1627  0054 42            	mul	x,a
1628  0055 1d001a        	subw	x,#26
1629  0058 c6001c        	ld	a,_i2c_rx_buf+7
1630  005b d701d2        	ld	(_sc+466,x),a
1631                     ; 216 				sc.slc[i2c_rx_buf[6]-1].ch2_status = i2c_rx_buf[8];
1633  005e c6001b        	ld	a,_i2c_rx_buf+6
1634  0061 97            	ld	xl,a
1635  0062 a61a          	ld	a,#26
1636  0064 42            	mul	x,a
1637  0065 1d001a        	subw	x,#26
1638  0068 c6001d        	ld	a,_i2c_rx_buf+8
1639  006b d701d3        	ld	(_sc+467,x),a
1640                     ; 217 				sc.slc[i2c_rx_buf[6]-1].ch3_status = i2c_rx_buf[9];
1642  006e c6001b        	ld	a,_i2c_rx_buf+6
1643  0071 97            	ld	xl,a
1644  0072 a61a          	ld	a,#26
1645  0074 42            	mul	x,a
1646  0075 1d001a        	subw	x,#26
1647  0078 c6001e        	ld	a,_i2c_rx_buf+9
1648  007b d701d4        	ld	(_sc+468,x),a
1649                     ; 218 				sc.slc[i2c_rx_buf[6]-1].ch4_status = i2c_rx_buf[10];
1651  007e c6001b        	ld	a,_i2c_rx_buf+6
1652  0081 97            	ld	xl,a
1653  0082 a61a          	ld	a,#26
1654  0084 42            	mul	x,a
1655  0085 1d001a        	subw	x,#26
1656  0088 c6001f        	ld	a,_i2c_rx_buf+10
1657  008b d701d5        	ld	(_sc+469,x),a
1658  008e               L744:
1659                     ; 222 	return ret;
1661  008e 7b01          	ld	a,(OFST-33,sp)
1664  0090 5b23          	addw	sp,#35
1665  0092 81            	ret
1746                     ; 227 u8 i2c_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext)
1746                     ; 228 {
1747                     .text:	section	.text,new
1748  0000               _i2c_action_plug:
1750  0000 89            	pushw	x
1751  0001 5222          	subw	sp,#34
1752       00000022      OFST:	set	34
1755                     ; 231 	u8 mdid = (mdid_channel&0xf0)>>4;
1757  0003 9f            	ld	a,xl
1758  0004 a4f0          	and	a,#240
1759  0006 4e            	swap	a
1760  0007 a40f          	and	a,#15
1761  0009 6b01          	ld	(OFST-33,sp),a
1762                     ; 232 	ap.frame_h1 = 0x7E;
1764  000b a67e          	ld	a,#126
1765  000d 6b02          	ld	(OFST-32,sp),a
1766                     ; 233 	ap.frame_h2 = 0x7E;
1768  000f a67e          	ld	a,#126
1769  0011 6b03          	ld	(OFST-31,sp),a
1770                     ; 234 	ap.message_id = mdid+60;
1772  0013 7b01          	ld	a,(OFST-33,sp)
1773  0015 ab3c          	add	a,#60
1774  0017 6b04          	ld	(OFST-30,sp),a
1775                     ; 235 	ap.payload[0] = action;
1777  0019 7b23          	ld	a,(OFST+1,sp)
1778  001b 6b05          	ld	(OFST-29,sp),a
1779                     ; 236 	ap.payload[1] = mdid_channel;
1781  001d 7b24          	ld	a,(OFST+2,sp)
1782  001f 6b06          	ld	(OFST-28,sp),a
1783                     ; 237 	ap.payload[2] = value;
1785  0021 7b27          	ld	a,(OFST+5,sp)
1786  0023 6b07          	ld	(OFST-27,sp),a
1787                     ; 238 	ap.payload[3] = ext;
1789  0025 7b28          	ld	a,(OFST+6,sp)
1790  0027 6b08          	ld	(OFST-26,sp),a
1791                     ; 239 	ret = i2c_send_message(0x01,&ap,4,mdid,12);
1793  0029 4b0c          	push	#12
1794  002b 7b02          	ld	a,(OFST-32,sp)
1795  002d 88            	push	a
1796  002e 4b04          	push	#4
1797  0030 96            	ldw	x,sp
1798  0031 1c0005        	addw	x,#OFST-29
1799  0034 89            	pushw	x
1800  0035 a601          	ld	a,#1
1801  0037 cd0000        	call	_i2c_send_message
1803  003a 5b05          	addw	sp,#5
1804  003c 6b01          	ld	(OFST-33,sp),a
1805                     ; 240 	if (ret == IIC_SUCCESS){
1807  003e 0d01          	tnz	(OFST-33,sp)
1808  0040 2652          	jrne	L705
1809                     ; 241 		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//校验正确
1811  0042 3b0018        	push	_i2c_rx_buf+3
1812  0045 ae0017        	ldw	x,#_i2c_rx_buf+2
1813  0048 cd0000        	call	_Check_Sum
1815  004b 5b01          	addw	sp,#1
1816  004d c10020        	cp	a,_i2c_rx_buf+11
1817  0050 2642          	jrne	L705
1818                     ; 242 			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
1820  0052 c60019        	ld	a,_i2c_rx_buf+4
1821  0055 a1aa          	cp	a,#170
1822  0057 263b          	jrne	L705
1824  0059 c6001a        	ld	a,_i2c_rx_buf+5
1825  005c a105          	cp	a,#5
1826  005e 2634          	jrne	L705
1827                     ; 243 				sc.spc[i2c_rx_buf[6]].ch1_status = i2c_rx_buf[7];
1829  0060 c6001b        	ld	a,_i2c_rx_buf+6
1830  0063 97            	ld	xl,a
1831  0064 a61c          	ld	a,#28
1832  0066 42            	mul	x,a
1833  0067 c6001c        	ld	a,_i2c_rx_buf+7
1834  006a d7002e        	ld	(_sc+46,x),a
1835                     ; 244 				sc.spc[i2c_rx_buf[6]].ch2_status = i2c_rx_buf[8];
1837  006d c6001b        	ld	a,_i2c_rx_buf+6
1838  0070 97            	ld	xl,a
1839  0071 a61c          	ld	a,#28
1840  0073 42            	mul	x,a
1841  0074 c6001d        	ld	a,_i2c_rx_buf+8
1842  0077 d7002f        	ld	(_sc+47,x),a
1843                     ; 245 				sc.spc[i2c_rx_buf[6]].ch3_status = i2c_rx_buf[9];
1845  007a c6001b        	ld	a,_i2c_rx_buf+6
1846  007d 97            	ld	xl,a
1847  007e a61c          	ld	a,#28
1848  0080 42            	mul	x,a
1849  0081 c6001e        	ld	a,_i2c_rx_buf+9
1850  0084 d70030        	ld	(_sc+48,x),a
1851                     ; 246 				sc.spc[i2c_rx_buf[6]].ch4_status = i2c_rx_buf[10];
1853  0087 c6001b        	ld	a,_i2c_rx_buf+6
1854  008a 97            	ld	xl,a
1855  008b a61c          	ld	a,#28
1856  008d 42            	mul	x,a
1857  008e c6001f        	ld	a,_i2c_rx_buf+10
1858  0091 d70031        	ld	(_sc+49,x),a
1859  0094               L705:
1860                     ; 250 	return ret;
1862  0094 7b01          	ld	a,(OFST-33,sp)
1865  0096 5b24          	addw	sp,#36
1866  0098 81            	ret
1932                     ; 255 u8 i2c_multiple_action_dimmer(u8 action_dimmer_num)
1932                     ; 256 {
1933                     .text:	section	.text,new
1934  0000               _i2c_multiple_action_dimmer:
1936  0000 5224          	subw	sp,#36
1937       00000024      OFST:	set	36
1940                     ; 257 	u8 temp,i=0;
1942  0002 0f24          	clr	(OFST+0,sp)
1943                     ; 260 	temp = action_dimmer_num;
1945  0004 6b23          	ld	(OFST-1,sp),a
1947  0006 203a          	jra	L745
1948  0008               L345:
1949                     ; 262 		mad.payload[2+i] = sicp_buf[8+i];
1951  0008 96            	ldw	x,sp
1952  0009 1c0006        	addw	x,#OFST-30
1953  000c 9f            	ld	a,xl
1954  000d 5e            	swapw	x
1955  000e 1b24          	add	a,(OFST+0,sp)
1956  0010 2401          	jrnc	L46
1957  0012 5c            	incw	x
1958  0013               L46:
1959  0013 02            	rlwa	x,a
1960  0014 7b24          	ld	a,(OFST+0,sp)
1961  0016 905f          	clrw	y
1962  0018 9097          	ld	yl,a
1963  001a 90d60008      	ld	a,(_sicp_buf+8,y)
1964  001e f7            	ld	(x),a
1965                     ; 263 		ret = i2c_single_action_dimmer(0x51,sicp_buf[8+i],sicp_buf[8+temp],sicp_buf[9+temp]);
1967  001f 7b23          	ld	a,(OFST-1,sp)
1968  0021 5f            	clrw	x
1969  0022 97            	ld	xl,a
1970  0023 d60009        	ld	a,(_sicp_buf+9,x)
1971  0026 88            	push	a
1972  0027 7b24          	ld	a,(OFST+0,sp)
1973  0029 5f            	clrw	x
1974  002a 97            	ld	xl,a
1975  002b d60008        	ld	a,(_sicp_buf+8,x)
1976  002e 88            	push	a
1977  002f 7b26          	ld	a,(OFST+2,sp)
1978  0031 5f            	clrw	x
1979  0032 97            	ld	xl,a
1980  0033 d60008        	ld	a,(_sicp_buf+8,x)
1981  0036 97            	ld	xl,a
1982  0037 a651          	ld	a,#81
1983  0039 95            	ld	xh,a
1984  003a cd0000        	call	_i2c_single_action_dimmer
1986  003d 85            	popw	x
1987  003e 6b22          	ld	(OFST-2,sp),a
1988                     ; 264 		i++;
1990  0040 0c24          	inc	(OFST+0,sp)
1991  0042               L745:
1992                     ; 261 	while(temp--){
1994  0042 7b23          	ld	a,(OFST-1,sp)
1995  0044 0a23          	dec	(OFST-1,sp)
1996  0046 4d            	tnz	a
1997  0047 26bf          	jrne	L345
1998                     ; 266 	return ret;
2000  0049 7b22          	ld	a,(OFST-2,sp)
2003  004b 5b24          	addw	sp,#36
2004  004d 81            	ret
2026                     	xdef	_i2c_send_message
2027                     	switch	.bss
2028  0000               _test:
2029  0000 00            	ds.b	1
2030                     	xdef	_test
2031                     	xref	_I2C_WriteReadBytes
2032                     	xref	_I2C_WriteBytes
2033                     	xref	_Check_Sum
2034                     	xref	_mymemcpy
2035                     	xref	_sicp_buf
2036                     	xref	_sc
2037                     	xdef	_i2c_single_action_dimmer_result
2038                     	xdef	_i2c_multiple_action_dimmer
2039                     	xdef	_i2c_action_plug
2040                     	xdef	_i2c_single_action_dimmer
2041                     	xdef	_i2c_get_energy_consum
2042                     	xdef	_i2c_heartbeat
2043                     	xdef	_i2c_device_info
2044                     	xdef	_scan_device
2045  0001               _action_dimmer_ext:
2046  0001 00            	ds.b	1
2047                     	xdef	_action_dimmer_ext
2048  0002               _action_dimmer_MDID:
2049  0002 00            	ds.b	1
2050                     	xdef	_action_dimmer_MDID
2051  0003               _hb_fail_mdid_cnt:
2052  0003 000000000000  	ds.b	15
2053                     	xdef	_hb_fail_mdid_cnt
2054  0012               _device_flag:
2055  0012 0000          	ds.b	2
2056                     	xdef	_device_flag
2057  0014               _i2c_rx_len:
2058  0014 00            	ds.b	1
2059                     	xdef	_i2c_rx_len
2060  0015               _i2c_rx_buf:
2061  0015 000000000000  	ds.b	30
2062                     	xdef	_i2c_rx_buf
2063  0033               _i2c_tx_len:
2064  0033 00            	ds.b	1
2065                     	xdef	_i2c_tx_len
2066  0034               _i2c_tx_buf:
2067  0034 000000000000  	ds.b	30
2068                     	xdef	_i2c_tx_buf
2069                     	xref.b	c_lreg
2070                     	xref.b	c_y
2090                     	end
