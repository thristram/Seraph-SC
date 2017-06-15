   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 800                     ; 24 void mymemcpy(void *des,void *src,u32 n)  
 800                     ; 25 {  
 802                     .text:	section	.text,new
 803  0000               _mymemcpy:
 805  0000 89            	pushw	x
 806  0001 5204          	subw	sp,#4
 807       00000004      OFST:	set	4
 810                     ; 26   u8 *xdes=des;
 812  0003 1f01          	ldw	(OFST-3,sp),x
 813                     ; 27 	u8 *xsrc=src; 
 815  0005 1e09          	ldw	x,(OFST+5,sp)
 816  0007 1f03          	ldw	(OFST-1,sp),x
 818  0009 2016          	jra	L354
 819  000b               L744:
 820                     ; 28   while(n--)*xdes++=*xsrc++;  
 822  000b 1e03          	ldw	x,(OFST-1,sp)
 823  000d 1c0001        	addw	x,#1
 824  0010 1f03          	ldw	(OFST-1,sp),x
 825  0012 1d0001        	subw	x,#1
 826  0015 f6            	ld	a,(x)
 827  0016 1e01          	ldw	x,(OFST-3,sp)
 828  0018 1c0001        	addw	x,#1
 829  001b 1f01          	ldw	(OFST-3,sp),x
 830  001d 1d0001        	subw	x,#1
 831  0020 f7            	ld	(x),a
 832  0021               L354:
 835  0021 96            	ldw	x,sp
 836  0022 1c000b        	addw	x,#OFST+7
 837  0025 cd0000        	call	c_ltor
 839  0028 96            	ldw	x,sp
 840  0029 1c000b        	addw	x,#OFST+7
 841  002c a601          	ld	a,#1
 842  002e cd0000        	call	c_lgsbc
 844  0031 cd0000        	call	c_lrzmp
 846  0034 26d5          	jrne	L744
 847                     ; 29 }  
 850  0036 5b06          	addw	sp,#6
 851  0038 81            	ret
 897                     ; 34 void delay(u16 Count)
 897                     ; 35 {
 898                     .text:	section	.text,new
 899  0000               _delay:
 901  0000 89            	pushw	x
 902  0001 89            	pushw	x
 903       00000002      OFST:	set	2
 906  0002 2014          	jra	L105
 907  0004               L774:
 908                     ; 39     for(i=0;i<100;i++)
 910  0004 0f01          	clr	(OFST-1,sp)
 911  0006               L505:
 912                     ; 40     for(j=0;j<50;j++);
 914  0006 0f02          	clr	(OFST+0,sp)
 915  0008               L315:
 919  0008 0c02          	inc	(OFST+0,sp)
 922  000a 7b02          	ld	a,(OFST+0,sp)
 923  000c a132          	cp	a,#50
 924  000e 25f8          	jrult	L315
 925                     ; 39     for(i=0;i<100;i++)
 927  0010 0c01          	inc	(OFST-1,sp)
 930  0012 7b01          	ld	a,(OFST-1,sp)
 931  0014 a164          	cp	a,#100
 932  0016 25ee          	jrult	L505
 933  0018               L105:
 934                     ; 37   while (Count--)//Count形参控制延时次数
 936  0018 1e03          	ldw	x,(OFST+1,sp)
 937  001a 1d0001        	subw	x,#1
 938  001d 1f03          	ldw	(OFST+1,sp),x
 939  001f 1c0001        	addw	x,#1
 940  0022 a30000        	cpw	x,#0
 941  0025 26dd          	jrne	L774
 942                     ; 42 }
 945  0027 5b04          	addw	sp,#4
 946  0029 81            	ret
 993                     ; 50 u8 random(u8 xxx)  
 993                     ; 51 {  
 994                     .text:	section	.text,new
 995  0000               _random:
 997  0000 88            	push	a
 998  0001 89            	pushw	x
 999       00000002      OFST:	set	2
1002                     ; 53   for(iii=0;iii<xxx;iii++)  
1004  0002 0f02          	clr	(OFST+0,sp)
1006  0004 2011          	jra	L545
1007  0006               L145:
1008                     ; 55     value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
1010  0006 cd0000        	call	_rand
1012  0009 90ae00ff      	ldw	y,#255
1013  000d cd0000        	call	c_idiv
1015  0010 51            	exgw	x,y
1016  0011 9f            	ld	a,xl
1017  0012 4c            	inc	a
1018  0013 6b01          	ld	(OFST-1,sp),a
1019                     ; 53   for(iii=0;iii<xxx;iii++)  
1021  0015 0c02          	inc	(OFST+0,sp)
1022  0017               L545:
1025  0017 7b02          	ld	a,(OFST+0,sp)
1026  0019 1103          	cp	a,(OFST+1,sp)
1027  001b 25e9          	jrult	L145
1028                     ; 57   return value;  
1030  001d 7b01          	ld	a,(OFST-1,sp)
1033  001f 5b03          	addw	sp,#3
1034  0021 81            	ret
1061                     ; 66 void Init_uart2(void)
1061                     ; 67 {
1062                     .text:	section	.text,new
1063  0000               _Init_uart2:
1067                     ; 68 	UART2_DeInit();
1069  0000 cd0000        	call	_UART2_DeInit
1071                     ; 70 	UART2_Init((u32)57600,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,	UART2_MODE_TXRX_ENABLE);
1073  0003 4b0c          	push	#12
1074  0005 4b80          	push	#128
1075  0007 4b00          	push	#0
1076  0009 4b00          	push	#0
1077  000b 4b00          	push	#0
1078  000d aee100        	ldw	x,#57600
1079  0010 89            	pushw	x
1080  0011 ae0000        	ldw	x,#0
1081  0014 89            	pushw	x
1082  0015 cd0000        	call	_UART2_Init
1084  0018 5b09          	addw	sp,#9
1085                     ; 71 	UART2_ITConfig(UART2_IT_TC,ENABLE);//发送完成中断
1087  001a 4b01          	push	#1
1088  001c ae0266        	ldw	x,#614
1089  001f cd0000        	call	_UART2_ITConfig
1091  0022 84            	pop	a
1092                     ; 72 	UART2_ITConfig(UART2_IT_RXNE_OR,ENABLE);//接收非空中断
1094  0023 4b01          	push	#1
1095  0025 ae0205        	ldw	x,#517
1096  0028 cd0000        	call	_UART2_ITConfig
1098  002b 84            	pop	a
1099                     ; 73 	UART2_Cmd(ENABLE);//启用uart1接口
1101  002c a601          	ld	a,#1
1102  002e cd0000        	call	_UART2_Cmd
1104                     ; 74 }
1107  0031 81            	ret
1152                     ; 83 void Uart2_Send(u8 *buf,u16 len)
1152                     ; 84 {
1153                     .text:	section	.text,new
1154  0000               _Uart2_Send:
1156  0000 89            	pushw	x
1157       00000000      OFST:	set	0
1160                     ; 85 	if(len >= Uart2_Send_Len)	len = Uart2_Send_Len;
1162  0001 1e05          	ldw	x,(OFST+5,sp)
1163  0003 a30028        	cpw	x,#40
1164  0006 2505          	jrult	L106
1167  0008 ae0028        	ldw	x,#40
1168  000b 1f05          	ldw	(OFST+5,sp),x
1169  000d               L106:
1170                     ; 87 	Uart2_Send_Length = len;
1172  000d 7b06          	ld	a,(OFST+6,sp)
1173  000f c70059        	ld	_Uart2_Send_Length,a
1174                     ; 88 	Uart2_Send_Cnt = 1;
1176  0012 35010058      	mov	_Uart2_Send_Cnt,#1
1177                     ; 89 	UART2->DR = UART2_Send_Buf[0];
1179  0016 55005a5241    	mov	21057,_UART2_Send_Buf
1180                     ; 91 }
1183  001b 85            	popw	x
1184  001c 81            	ret
1211                     ; 98 @interrupt void UART2_TX_ISR(void)
1211                     ; 99 {
1212                     .text:	section	.text,new
1213  0000               _UART2_TX_ISR:
1218                     ; 103 	UART2->SR &= ~0x40;//清除发送完成标志位
1220  0000 721d5240      	bres	21056,#6
1221                     ; 105 	if (Uart2_Send_Cnt < Uart2_Send_Length)
1223  0004 c60058        	ld	a,_Uart2_Send_Cnt
1224  0007 c10059        	cp	a,_Uart2_Send_Length
1225  000a 2411          	jruge	L316
1226                     ; 107 		UART2->DR = UART2_Send_Buf[Uart2_Send_Cnt];
1228  000c c60058        	ld	a,_Uart2_Send_Cnt
1229  000f 5f            	clrw	x
1230  0010 97            	ld	xl,a
1231  0011 d6005a        	ld	a,(_UART2_Send_Buf,x)
1232  0014 c75241        	ld	21057,a
1233                     ; 108 		Uart2_Send_Cnt++;
1235  0017 725c0058      	inc	_Uart2_Send_Cnt
1237  001b 2008          	jra	L516
1238  001d               L316:
1239                     ; 112 		Uart2_Send_Done = 1;
1241  001d 35010057      	mov	_Uart2_Send_Done,#1
1242                     ; 113 		Uart2_Send_Cnt = 0;
1244  0021 725f0058      	clr	_Uart2_Send_Cnt
1245  0025               L516:
1246                     ; 115 }
1249  0025 80            	iret
1273                     ; 123 @interrupt void UART2_RX_ISR(void)
1273                     ; 124 {
1274                     .text:	section	.text,new
1275  0000               _UART2_RX_ISR:
1278  0000 3b0002        	push	c_x+2
1279  0003 be00          	ldw	x,c_x
1280  0005 89            	pushw	x
1281  0006 3b0002        	push	c_y+2
1282  0009 be00          	ldw	x,c_y
1283  000b 89            	pushw	x
1286                     ; 125 	rev_deal();
1288  000c cd0000        	call	_rev_deal
1290                     ; 126 }
1293  000f 85            	popw	x
1294  0010 bf00          	ldw	c_y,x
1295  0012 320002        	pop	c_y+2
1296  0015 85            	popw	x
1297  0016 bf00          	ldw	c_x,x
1298  0018 320002        	pop	c_x+2
1299  001b 80            	iret
1355                     ; 134 u8 Check_Sum(u8 *buf,u8 length)
1355                     ; 135 {
1356                     .text:	section	.text,new
1357  0000               _Check_Sum:
1359  0000 89            	pushw	x
1360  0001 89            	pushw	x
1361       00000002      OFST:	set	2
1364                     ; 137 	u8 result = *buf++;
1366  0002 1e03          	ldw	x,(OFST+1,sp)
1367  0004 1c0001        	addw	x,#1
1368  0007 1f03          	ldw	(OFST+1,sp),x
1369  0009 1d0001        	subw	x,#1
1370  000c f6            	ld	a,(x)
1371  000d 6b01          	ld	(OFST-1,sp),a
1372                     ; 138 	for(i = 1;i < length;i++)
1374  000f a601          	ld	a,#1
1375  0011 6b02          	ld	(OFST+0,sp),a
1377  0013 2011          	jra	L756
1378  0015               L356:
1379                     ; 140 		result ^= *buf++;
1381  0015 1e03          	ldw	x,(OFST+1,sp)
1382  0017 1c0001        	addw	x,#1
1383  001a 1f03          	ldw	(OFST+1,sp),x
1384  001c 1d0001        	subw	x,#1
1385  001f 7b01          	ld	a,(OFST-1,sp)
1386  0021 f8            	xor	a,	(x)
1387  0022 6b01          	ld	(OFST-1,sp),a
1388                     ; 138 	for(i = 1;i < length;i++)
1390  0024 0c02          	inc	(OFST+0,sp)
1391  0026               L756:
1394  0026 7b02          	ld	a,(OFST+0,sp)
1395  0028 1107          	cp	a,(OFST+5,sp)
1396  002a 25e9          	jrult	L356
1397                     ; 142 	return result;
1399  002c 7b01          	ld	a,(OFST-1,sp)
1402  002e 5b04          	addw	sp,#4
1403  0030 81            	ret
1461                     ; 150 void rev_deal(void)
1461                     ; 151 {
1462                     .text:	section	.text,new
1463  0000               _rev_deal:
1465  0000 89            	pushw	x
1466       00000002      OFST:	set	2
1469                     ; 154 	temp = (u8)UART2->DR;
1471  0001 c65241        	ld	a,21057
1472  0004 6b02          	ld	(OFST+0,sp),a
1473                     ; 155 	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
1475  0006 c6002e        	ld	a,_Uart2_Rec_Cnt
1476  0009 5f            	clrw	x
1477  000a 97            	ld	xl,a
1478  000b 7b02          	ld	a,(OFST+0,sp)
1479  000d d7002f        	ld	(_Uart2_Rece_Buf,x),a
1480                     ; 156 	Uart2_Rec_Cnt++;
1482  0010 725c002e      	inc	_Uart2_Rec_Cnt
1483                     ; 157 	switch(Uart2_Rec_Cnt)
1485  0014 c6002e        	ld	a,_Uart2_Rec_Cnt
1487                     ; 216 			break;
1488  0017 4a            	dec	a
1489  0018 2722          	jreq	L366
1490  001a 4a            	dec	a
1491  001b 2739          	jreq	L566
1492  001d 4a            	dec	a
1493  001e 2603          	jrne	L62
1494  0020 cc012c        	jp	L327
1495  0023               L62:
1496  0023 4a            	dec	a
1497  0024 2603          	jrne	L03
1498  0026 cc012c        	jp	L327
1499  0029               L03:
1500  0029 4a            	dec	a
1501  002a 2603          	jrne	L23
1502  002c cc012c        	jp	L327
1503  002f               L23:
1504  002f               L576:
1505                     ; 174 		default:
1505                     ; 175 			if (Uart2_Rec_Cnt > Uart2_Rec_Len)//防止接收错误后溢出
1507  002f c6002e        	ld	a,_Uart2_Rec_Cnt
1508  0032 a129          	cp	a,#41
1509  0034 2543          	jrult	L137
1510                     ; 177 				Uart2_Rec_Cnt = 0;
1512  0036 725f002e      	clr	_Uart2_Rec_Cnt
1513  003a 203d          	jra	L137
1514  003c               L366:
1515                     ; 159 		case 1:
1515                     ; 160 			if ((temp != 0xEE) && (temp != 0xDD))	Uart2_Rec_Cnt = 0;
1517  003c 7b02          	ld	a,(OFST+0,sp)
1518  003e a1ee          	cp	a,#238
1519  0040 2603          	jrne	L43
1520  0042 cc012c        	jp	L327
1521  0045               L43:
1523  0045 7b02          	ld	a,(OFST+0,sp)
1524  0047 a1dd          	cp	a,#221
1525  0049 2603          	jrne	L63
1526  004b cc012c        	jp	L327
1527  004e               L63:
1530  004e 725f002e      	clr	_Uart2_Rec_Cnt
1531  0052 ac2c012c      	jpf	L327
1532  0056               L566:
1533                     ; 162 		case 2:
1533                     ; 163 			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1535  0056 7b02          	ld	a,(OFST+0,sp)
1536  0058 a1ee          	cp	a,#238
1537  005a 2603          	jrne	L04
1538  005c cc012c        	jp	L327
1539  005f               L04:
1541  005f 7b02          	ld	a,(OFST+0,sp)
1542  0061 a1aa          	cp	a,#170
1543  0063 2603          	jrne	L24
1544  0065 cc012c        	jp	L327
1545  0068               L24:
1547  0068 7b02          	ld	a,(OFST+0,sp)
1548  006a a1dd          	cp	a,#221
1549  006c 2603          	jrne	L44
1550  006e cc012c        	jp	L327
1551  0071               L44:
1554  0071 725f002e      	clr	_Uart2_Rec_Cnt
1555  0075 ac2c012c      	jpf	L327
1556  0079               L137:
1557                     ; 179 			if ((Uart2_Rece_Buf[0] == 0xEE)&&((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA)))
1559  0079 c6002f        	ld	a,_Uart2_Rece_Buf
1560  007c a1ee          	cp	a,#238
1561  007e 2666          	jrne	L337
1563  0080 c60030        	ld	a,_Uart2_Rece_Buf+1
1564  0083 a1ee          	cp	a,#238
1565  0085 2707          	jreq	L537
1567  0087 c60030        	ld	a,_Uart2_Rece_Buf+1
1568  008a a1aa          	cp	a,#170
1569  008c 2658          	jrne	L337
1570  008e               L537:
1571                     ; 181 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2)//接收数据完成
1573  008e 9c            	rvf
1574  008f c6002e        	ld	a,_Uart2_Rec_Cnt
1575  0092 5f            	clrw	x
1576  0093 97            	ld	xl,a
1577  0094 c60034        	ld	a,_Uart2_Rece_Buf+5
1578  0097 905f          	clrw	y
1579  0099 9097          	ld	yl,a
1580  009b 905c          	incw	y
1581  009d 905c          	incw	y
1582  009f bf01          	ldw	c_x+1,x
1583  00a1 90b301        	cpw	y,c_x+1
1584  00a4 2ec8          	jrsge	L327
1585                     ; 183 					Uart2_Rec_Cnt = 0;
1587  00a6 725f002e      	clr	_Uart2_Rec_Cnt
1588                     ; 184 					check_sum = Check_Sum(Uart2_Rece_Buf,Uart2_Rece_Buf[5] + 2);
1590  00aa c60034        	ld	a,_Uart2_Rece_Buf+5
1591  00ad ab02          	add	a,#2
1592  00af 88            	push	a
1593  00b0 ae002f        	ldw	x,#_Uart2_Rece_Buf
1594  00b3 cd0000        	call	_Check_Sum
1596  00b6 5b01          	addw	sp,#1
1597  00b8 6b02          	ld	(OFST+0,sp),a
1598                     ; 186 					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2])//校验正确	
1600  00ba c60034        	ld	a,_Uart2_Rece_Buf+5
1601  00bd 5f            	clrw	x
1602  00be 97            	ld	xl,a
1603  00bf d60031        	ld	a,(_Uart2_Rece_Buf+2,x)
1604  00c2 1102          	cp	a,(OFST+0,sp)
1605  00c4 261a          	jrne	L147
1606                     ; 188 						rev_success = 1;
1608  00c6 721003d8      	bset	_UART1Flag1_,#0
1609                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1611  00ca 0f02          	clr	(OFST+0,sp)
1612  00cc               L347:
1613                     ; 191 							sicp_buf[i] = Uart2_Rece_Buf[i];
1615  00cc 7b02          	ld	a,(OFST+0,sp)
1616  00ce 5f            	clrw	x
1617  00cf 97            	ld	xl,a
1618  00d0 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1619  00d3 d70006        	ld	(_sicp_buf,x),a
1620                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1622  00d6 0c02          	inc	(OFST+0,sp)
1625  00d8 7b02          	ld	a,(OFST+0,sp)
1626  00da a128          	cp	a,#40
1627  00dc 25ee          	jrult	L347
1629  00de 204c          	jra	L327
1630  00e0               L147:
1631                     ; 196 						Uart2_Rec_Cnt = 0;
1633  00e0 725f002e      	clr	_Uart2_Rec_Cnt
1634  00e4 2046          	jra	L327
1635  00e6               L337:
1636                     ; 200 			else if((Uart2_Rece_Buf[0] == 0xDD)&&(Uart2_Rece_Buf[1] == 0xDD))
1638  00e6 c6002f        	ld	a,_Uart2_Rece_Buf
1639  00e9 a1dd          	cp	a,#221
1640  00eb 263b          	jrne	L557
1642  00ed c60030        	ld	a,_Uart2_Rece_Buf+1
1643  00f0 a1dd          	cp	a,#221
1644  00f2 2634          	jrne	L557
1645                     ; 202 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 1)//接收数据完成
1647  00f4 9c            	rvf
1648  00f5 c6002e        	ld	a,_Uart2_Rec_Cnt
1649  00f8 5f            	clrw	x
1650  00f9 97            	ld	xl,a
1651  00fa c60032        	ld	a,_Uart2_Rece_Buf+3
1652  00fd 905f          	clrw	y
1653  00ff 9097          	ld	yl,a
1654  0101 905c          	incw	y
1655  0103 bf01          	ldw	c_x+1,x
1656  0105 90b301        	cpw	y,c_x+1
1657  0108 2e22          	jrsge	L327
1658                     ; 204 					Uart2_Rec_Cnt = 0;
1660  010a 725f002e      	clr	_Uart2_Rec_Cnt
1661                     ; 205 					rev_success = 1;
1663  010e 721003d8      	bset	_UART1Flag1_,#0
1664                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1666  0112 0f02          	clr	(OFST+0,sp)
1667  0114               L167:
1668                     ; 208 						sicp_buf[i] = Uart2_Rece_Buf[i];
1670  0114 7b02          	ld	a,(OFST+0,sp)
1671  0116 5f            	clrw	x
1672  0117 97            	ld	xl,a
1673  0118 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1674  011b d70006        	ld	(_sicp_buf,x),a
1675                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1677  011e 0c02          	inc	(OFST+0,sp)
1680  0120 7b02          	ld	a,(OFST+0,sp)
1681  0122 a128          	cp	a,#40
1682  0124 25ee          	jrult	L167
1683  0126 2004          	jra	L327
1684  0128               L557:
1685                     ; 214 				Uart2_Rec_Cnt = 0;
1687  0128 725f002e      	clr	_Uart2_Rec_Cnt
1688  012c               L327:
1689                     ; 218 	if (UART2->SR & 0x20) //|| (UART2->SR & UART2_SR_OR))
1691  012c c65240        	ld	a,21056
1692  012f a520          	bcp	a,#32
1693  0131 2707          	jreq	L177
1694                     ; 220 		temp2 = UART2->DR;
1696  0133 7b01          	ld	a,(OFST-1,sp)
1697  0135 97            	ld	xl,a
1698  0136 c65241        	ld	a,21057
1699  0139 97            	ld	xl,a
1700  013a               L177:
1701                     ; 223 }
1704  013a 85            	popw	x
1705  013b 81            	ret
1739                     ; 225 void clear_uart_buf(void)
1739                     ; 226 {
1740                     .text:	section	.text,new
1741  0000               _clear_uart_buf:
1743  0000 88            	push	a
1744       00000001      OFST:	set	1
1747                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1749  0001 0f01          	clr	(OFST+0,sp)
1750  0003               L7001:
1751                     ; 230 		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
1753  0003 7b01          	ld	a,(OFST+0,sp)
1754  0005 5f            	clrw	x
1755  0006 97            	ld	xl,a
1756  0007 724f002f      	clr	(_Uart2_Rece_Buf,x)
1757  000b 7b01          	ld	a,(OFST+0,sp)
1758  000d 5f            	clrw	x
1759  000e 97            	ld	xl,a
1760  000f 724f0006      	clr	(_sicp_buf,x)
1761                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1763  0013 0c01          	inc	(OFST+0,sp)
1766  0015 7b01          	ld	a,(OFST+0,sp)
1767  0017 a128          	cp	a,#40
1768  0019 25e8          	jrult	L7001
1769                     ; 232 }
1772  001b 84            	pop	a
1773  001c 81            	ret
1908                     ; 235 void rev_anaylze(void)
1908                     ; 236 {
1909                     .text:	section	.text,new
1910  0000               _rev_anaylze:
1912  0000 523b          	subw	sp,#59
1913       0000003b      OFST:	set	59
1916                     ; 239 	if(rev_success){
1918  0002 c603d8        	ld	a,_UART1Flag1_
1919  0005 a501          	bcp	a,#1
1920  0007 2603          	jrne	L25
1921  0009 cc037f        	jp	L5011
1922  000c               L25:
1923                     ; 240 		rev_success = 0;
1925  000c 721103d8      	bres	_UART1Flag1_,#0
1926                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1928  0010 c60006        	ld	a,_sicp_buf
1929  0013 a1ee          	cp	a,#238
1930  0015 2614          	jrne	L7011
1932  0017 c60007        	ld	a,_sicp_buf+1
1933  001a a1ee          	cp	a,#238
1934  001c 2707          	jreq	L1111
1936  001e c60007        	ld	a,_sicp_buf+1
1937  0021 a1aa          	cp	a,#170
1938  0023 2606          	jrne	L7011
1939  0025               L1111:
1940                     ; 242 			ble_data_frame = 1;
1942  0025 721203d8      	bset	_UART1Flag1_,#1
1944  0029 2012          	jra	L3111
1945  002b               L7011:
1946                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1948  002b c60006        	ld	a,_sicp_buf
1949  002e a1dd          	cp	a,#221
1950  0030 260b          	jrne	L3111
1952  0032 c60007        	ld	a,_sicp_buf+1
1953  0035 a1dd          	cp	a,#221
1954  0037 2604          	jrne	L3111
1955                     ; 245 			ble_ctrl_frame = 1;
1957  0039 721403d8      	bset	_UART1Flag1_,#2
1958  003d               L3111:
1959                     ; 248 		if (ble_data_frame){
1961  003d c603d8        	ld	a,_UART1Flag1_
1962  0040 a502          	bcp	a,#2
1963  0042 2603          	jrne	L45
1964  0044 cc030f        	jp	L7111
1965  0047               L45:
1966                     ; 249 			ble_data_frame = 0;
1968  0047 721303d8      	bres	_UART1Flag1_,#1
1969                     ; 250 			rev_message_id = sicp_buf[2];
1971  004b 5500080087    	mov	_rev_message_id,_sicp_buf+2
1972                     ; 251 			rev_mesh_id_H	= sicp_buf[3];
1974  0050 5500090086    	mov	_rev_mesh_id_H,_sicp_buf+3
1975                     ; 252 			rev_mesh_id_L = sicp_buf[4];
1977  0055 55000a0085    	mov	_rev_mesh_id_L,_sicp_buf+4
1978                     ; 253 			switch(sicp_buf[6]){
1980  005a c6000c        	ld	a,_sicp_buf+6
1982                     ; 319 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
1982                     ; 320 				break;
1983  005d a003          	sub	a,#3
1984  005f 2722          	jreq	L5101
1985  0061 a04e          	sub	a,#78
1986  0063 2732          	jreq	L7101
1987  0065 4a            	dec	a
1988  0066 272f          	jreq	L7101
1989  0068 4a            	dec	a
1990  0069 272c          	jreq	L7101
1991  006b 4a            	dec	a
1992  006c 2729          	jreq	L7101
1993  006e 4a            	dec	a
1994  006f 2776          	jreq	L1201
1995  0071 a002          	sub	a,#2
1996  0073 2603          	jrne	L65
1997  0075 cc0130        	jp	L3201
1998  0078               L65:
1999  0078 a053          	sub	a,#83
2000  007a 2603          	jrne	L06
2001  007c cc022f        	jp	L5201
2002  007f               L06:
2003  007f ac7f037f      	jpf	L5011
2004  0083               L5101:
2005                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2005                     ; 255 					if(sicp_buf[7] == 0x03){
2007  0083 c6000d        	ld	a,_sicp_buf+7
2008  0086 a103          	cp	a,#3
2009  0088 2703          	jreq	L26
2010  008a cc037f        	jp	L5011
2011  008d               L26:
2012                     ; 256 						rev_cmd_data(sicp_buf[8]);
2014  008d c6000e        	ld	a,_sicp_buf+8
2015  0090 cd0000        	call	_rev_cmd_data
2017  0093 ac7f037f      	jpf	L5011
2018  0097               L7101:
2019                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2019                     ; 260 				case 0x52:
2019                     ; 261 				case 0x53:
2019                     ; 262 				case 0x54:
2019                     ; 263 					rev_ad_message_id = sicp_buf[2];
2021  0097 5500080084    	mov	_rev_ad_message_id,_sicp_buf+2
2022                     ; 264 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2024  009c c6000d        	ld	a,_sicp_buf+7
2025  009f a4f0          	and	a,#240
2026  00a1 4e            	swap	a
2027  00a2 a40f          	and	a,#15
2028  00a4 c70083        	ld	_rev_ad_mdid,a
2029                     ; 265 					rev_ad_channel = (sicp_buf[7]&0x0f);
2031  00a7 c6000d        	ld	a,_sicp_buf+7
2032  00aa a40f          	and	a,#15
2033  00ac c70082        	ld	_rev_ad_channel,a
2034                     ; 266 					action_dimmer_ext = sicp_buf[9]+2;
2036  00af c6000f        	ld	a,_sicp_buf+9
2037  00b2 ab02          	add	a,#2
2038  00b4 c70000        	ld	_action_dimmer_ext,a
2039                     ; 268 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2041  00b7 3b000f        	push	_sicp_buf+9
2042  00ba 3b000e        	push	_sicp_buf+8
2043  00bd c6000d        	ld	a,_sicp_buf+7
2044  00c0 97            	ld	xl,a
2045  00c1 c6000c        	ld	a,_sicp_buf+6
2046  00c4 95            	ld	xh,a
2047  00c5 cd0000        	call	_i2c_single_action_dimmer
2049  00c8 85            	popw	x
2050  00c9 6b04          	ld	(OFST-55,sp),a
2051                     ; 269 					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2053  00cb 0d04          	tnz	(OFST-55,sp)
2054  00cd 2703          	jreq	L46
2055  00cf cc037f        	jp	L5011
2056  00d2               L46:
2059  00d2 3b008a        	push	_ns_own_meshid_L
2060  00d5 3b008b        	push	_ns_own_meshid_H
2061  00d8 c60087        	ld	a,_rev_message_id
2062  00db 97            	ld	xl,a
2063  00dc a602          	ld	a,#2
2064  00de 95            	ld	xh,a
2065  00df cd0000        	call	_sicp_receipt_OK
2067  00e2 85            	popw	x
2068  00e3 ac7f037f      	jpf	L5011
2069  00e7               L1201:
2070                     ; 272 				case 0x55://打开或关闭开关
2070                     ; 273 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2072  00e7 c6000d        	ld	a,_sicp_buf+7
2073  00ea a4f0          	and	a,#240
2074  00ec 4e            	swap	a
2075  00ed a40f          	and	a,#15
2076  00ef c70083        	ld	_rev_ad_mdid,a
2077                     ; 274 					rev_ad_channel = (sicp_buf[7]&0x0f);
2079  00f2 c6000d        	ld	a,_sicp_buf+7
2080  00f5 a40f          	and	a,#15
2081  00f7 c70082        	ld	_rev_ad_channel,a
2082                     ; 276 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2084  00fa 3b000f        	push	_sicp_buf+9
2085  00fd 3b000e        	push	_sicp_buf+8
2086  0100 c6000d        	ld	a,_sicp_buf+7
2087  0103 97            	ld	xl,a
2088  0104 c6000c        	ld	a,_sicp_buf+6
2089  0107 95            	ld	xh,a
2090  0108 cd0000        	call	_i2c_action_plug
2092  010b 85            	popw	x
2093  010c 6b04          	ld	(OFST-55,sp),a
2094                     ; 277 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_own_meshid_H,ns_own_meshid_L,0x02,rev_ad_mdid);
2096  010e 0d04          	tnz	(OFST-55,sp)
2097  0110 2703          	jreq	L66
2098  0112 cc037f        	jp	L5011
2099  0115               L66:
2102  0115 3b0083        	push	_rev_ad_mdid
2103  0118 4b02          	push	#2
2104  011a 3b008a        	push	_ns_own_meshid_L
2105  011d 3b008b        	push	_ns_own_meshid_H
2106  0120 c60087        	ld	a,_rev_message_id
2107  0123 97            	ld	xl,a
2108  0124 a605          	ld	a,#5
2109  0126 95            	ld	xh,a
2110  0127 cd0000        	call	_sicp_receipt_Done
2112  012a 5b04          	addw	sp,#4
2113  012c ac7f037f      	jpf	L5011
2114  0130               L3201:
2115                     ; 279 				case 0x57://一个SC下多个SLC多个通道调光
2115                     ; 280 					action_dimmer_num = sicp_buf[7];
2117  0130 c6000d        	ld	a,_sicp_buf+7
2118  0133 6b03          	ld	(OFST-56,sp),a
2119                     ; 281 					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2121  0135 3b008a        	push	_ns_own_meshid_L
2122  0138 3b008b        	push	_ns_own_meshid_H
2123  013b c60087        	ld	a,_rev_message_id
2124  013e 97            	ld	xl,a
2125  013f a602          	ld	a,#2
2126  0141 95            	ld	xh,a
2127  0142 cd0000        	call	_sicp_receipt_OK
2129  0145 85            	popw	x
2130                     ; 283 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2132  0146 7b03          	ld	a,(OFST-56,sp)
2133  0148 cd0000        	call	_i2c_multiple_action_dimmer
2135  014b 6b04          	ld	(OFST-55,sp),a
2136                     ; 284 					if(ret == IIC_SUCCESS){
2138  014d 0d04          	tnz	(OFST-55,sp)
2139  014f 2703          	jreq	L07
2140  0151 cc037f        	jp	L5011
2141  0154               L07:
2142                     ; 285 						receipt.frame_h1 = 0xEE;
2144  0154 a6ee          	ld	a,#238
2145  0156 6b05          	ld	(OFST-54,sp),a
2146                     ; 286 						receipt.frame_h2 = 0xAA;
2148  0158 a6aa          	ld	a,#170
2149  015a 6b06          	ld	(OFST-53,sp),a
2150                     ; 287 						receipt.message_id = rev_message_id;
2152  015c c60087        	ld	a,_rev_message_id
2153  015f 6b07          	ld	(OFST-52,sp),a
2154                     ; 288 						receipt.mesh_id_H = ns_own_meshid_H;
2156  0161 c6008b        	ld	a,_ns_own_meshid_H
2157  0164 6b08          	ld	(OFST-51,sp),a
2158                     ; 289 						receipt.mesh_id_L = ns_own_meshid_L;
2160  0166 c6008a        	ld	a,_ns_own_meshid_L
2161  0169 6b09          	ld	(OFST-50,sp),a
2162                     ; 290 						receipt.payload[0] = 0xAA;
2164  016b a6aa          	ld	a,#170
2165  016d 6b0a          	ld	(OFST-49,sp),a
2166                     ; 291 						receipt.payload[1] = 0x05;
2168  016f a605          	ld	a,#5
2169  0171 6b0b          	ld	(OFST-48,sp),a
2170                     ; 292 						i = 0;
2172  0173 0f04          	clr	(OFST-55,sp)
2174  0175 ac0f020f      	jpf	L1411
2175  0179               L5311:
2176                     ; 294 							rev_ad_mdid = (sicp_buf[8]&0xf0)>>4;
2178  0179 c6000e        	ld	a,_sicp_buf+8
2179  017c a4f0          	and	a,#240
2180  017e 4e            	swap	a
2181  017f a40f          	and	a,#15
2182  0181 c70083        	ld	_rev_ad_mdid,a
2183                     ; 295 							rev_ad_channel = (sicp_buf[8]&0x0f);
2185  0184 c6000e        	ld	a,_sicp_buf+8
2186  0187 a40f          	and	a,#15
2187  0189 c70082        	ld	_rev_ad_channel,a
2188                     ; 296 							receipt.payload[2+i*5] = rev_ad_mdid;
2190  018c 96            	ldw	x,sp
2191  018d 1c000c        	addw	x,#OFST-47
2192  0190 1f01          	ldw	(OFST-58,sp),x
2193  0192 7b04          	ld	a,(OFST-55,sp)
2194  0194 97            	ld	xl,a
2195  0195 a605          	ld	a,#5
2196  0197 42            	mul	x,a
2197  0198 72fb01        	addw	x,(OFST-58,sp)
2198  019b c60083        	ld	a,_rev_ad_mdid
2199  019e f7            	ld	(x),a
2200                     ; 297 							receipt.payload[3+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2202  019f 96            	ldw	x,sp
2203  01a0 1c000d        	addw	x,#OFST-46
2204  01a3 1f01          	ldw	(OFST-58,sp),x
2205  01a5 7b04          	ld	a,(OFST-55,sp)
2206  01a7 97            	ld	xl,a
2207  01a8 a605          	ld	a,#5
2208  01aa 42            	mul	x,a
2209  01ab 72fb01        	addw	x,(OFST-58,sp)
2210  01ae 89            	pushw	x
2211  01af c60083        	ld	a,_rev_ad_mdid
2212  01b2 97            	ld	xl,a
2213  01b3 a61a          	ld	a,#26
2214  01b5 42            	mul	x,a
2215  01b6 d60261        	ld	a,(_sc+466,x)
2216  01b9 85            	popw	x
2217  01ba f7            	ld	(x),a
2218                     ; 298 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2220  01bb 96            	ldw	x,sp
2221  01bc 1c000e        	addw	x,#OFST-45
2222  01bf 1f01          	ldw	(OFST-58,sp),x
2223  01c1 7b04          	ld	a,(OFST-55,sp)
2224  01c3 97            	ld	xl,a
2225  01c4 a605          	ld	a,#5
2226  01c6 42            	mul	x,a
2227  01c7 72fb01        	addw	x,(OFST-58,sp)
2228  01ca 89            	pushw	x
2229  01cb c60083        	ld	a,_rev_ad_mdid
2230  01ce 97            	ld	xl,a
2231  01cf a61a          	ld	a,#26
2232  01d1 42            	mul	x,a
2233  01d2 d60262        	ld	a,(_sc+467,x)
2234  01d5 85            	popw	x
2235  01d6 f7            	ld	(x),a
2236                     ; 299 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2238  01d7 96            	ldw	x,sp
2239  01d8 1c000f        	addw	x,#OFST-44
2240  01db 1f01          	ldw	(OFST-58,sp),x
2241  01dd 7b04          	ld	a,(OFST-55,sp)
2242  01df 97            	ld	xl,a
2243  01e0 a605          	ld	a,#5
2244  01e2 42            	mul	x,a
2245  01e3 72fb01        	addw	x,(OFST-58,sp)
2246  01e6 89            	pushw	x
2247  01e7 c60083        	ld	a,_rev_ad_mdid
2248  01ea 97            	ld	xl,a
2249  01eb a61a          	ld	a,#26
2250  01ed 42            	mul	x,a
2251  01ee d60263        	ld	a,(_sc+468,x)
2252  01f1 85            	popw	x
2253  01f2 f7            	ld	(x),a
2254                     ; 300 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2256  01f3 96            	ldw	x,sp
2257  01f4 1c0010        	addw	x,#OFST-43
2258  01f7 1f01          	ldw	(OFST-58,sp),x
2259  01f9 7b04          	ld	a,(OFST-55,sp)
2260  01fb 97            	ld	xl,a
2261  01fc a605          	ld	a,#5
2262  01fe 42            	mul	x,a
2263  01ff 72fb01        	addw	x,(OFST-58,sp)
2264  0202 89            	pushw	x
2265  0203 c60083        	ld	a,_rev_ad_mdid
2266  0206 97            	ld	xl,a
2267  0207 a61a          	ld	a,#26
2268  0209 42            	mul	x,a
2269  020a d60264        	ld	a,(_sc+469,x)
2270  020d 85            	popw	x
2271  020e f7            	ld	(x),a
2272  020f               L1411:
2273                     ; 293 						while(action_dimmer_num--){
2275  020f 7b03          	ld	a,(OFST-56,sp)
2276  0211 0a03          	dec	(OFST-56,sp)
2277  0213 4d            	tnz	a
2278  0214 2703          	jreq	L27
2279  0216 cc0179        	jp	L5311
2280  0219               L27:
2281                     ; 302 						sicp_send_message(&receipt,7+i*5);
2283  0219 7b04          	ld	a,(OFST-55,sp)
2284  021b 97            	ld	xl,a
2285  021c a605          	ld	a,#5
2286  021e 42            	mul	x,a
2287  021f 9f            	ld	a,xl
2288  0220 ab07          	add	a,#7
2289  0222 88            	push	a
2290  0223 96            	ldw	x,sp
2291  0224 1c0006        	addw	x,#OFST-53
2292  0227 cd0000        	call	_sicp_send_message
2294  022a 84            	pop	a
2295  022b ac7f037f      	jpf	L5011
2296  022f               L5201:
2297                     ; 305 				case 0xAA:
2297                     ; 306 					if(sicp_buf[7] == 0x02){
2299  022f c6000d        	ld	a,_sicp_buf+7
2300  0232 a102          	cp	a,#2
2301  0234 2703          	jreq	L47
2302  0236 cc037f        	jp	L5011
2303  0239               L47:
2304                     ; 308 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2306  0239 725d0087      	tnz	_rev_message_id
2307  023d 271d          	jreq	L7411
2309  023f c60087        	ld	a,_rev_message_id
2310  0242 a110          	cp	a,#16
2311  0244 2416          	jruge	L7411
2314  0246 c60087        	ld	a,_rev_message_id
2315  0249 97            	ld	xl,a
2316  024a a61c          	ld	a,#28
2317  024c 42            	mul	x,a
2318  024d 1d001c        	subw	x,#28
2319  0250 d600c3        	ld	a,(_sc+52,x)
2320  0253 aa01          	or	a,#1
2321  0255 d700c3        	ld	(_sc+52,x),a
2323  0258 ac7f037f      	jpf	L5011
2324  025c               L7411:
2325                     ; 310 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2327  025c c60087        	ld	a,_rev_message_id
2328  025f a110          	cp	a,#16
2329  0261 2608          	jrne	L3511
2332  0263 721203d2      	bset	_sc+835,#1
2334  0267 ac7f037f      	jpf	L5011
2335  026b               L3511:
2336                     ; 311 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2338  026b c60087        	ld	a,_rev_message_id
2339  026e a115          	cp	a,#21
2340  0270 251d          	jrult	L7511
2342  0272 c60087        	ld	a,_rev_message_id
2343  0275 a124          	cp	a,#36
2344  0277 2416          	jruge	L7511
2347  0279 c60087        	ld	a,_rev_message_id
2348  027c 97            	ld	xl,a
2349  027d a61a          	ld	a,#26
2350  027f 42            	mul	x,a
2351  0280 1d0222        	subw	x,#546
2352  0283 d60265        	ld	a,(_sc+470,x)
2353  0286 aa02          	or	a,#2
2354  0288 d70265        	ld	(_sc+470,x),a
2356  028b ac7f037f      	jpf	L5011
2357  028f               L7511:
2358                     ; 312 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2360  028f c60087        	ld	a,_rev_message_id
2361  0292 a124          	cp	a,#36
2362  0294 251d          	jrult	L3611
2364  0296 c60087        	ld	a,_rev_message_id
2365  0299 a133          	cp	a,#51
2366  029b 2416          	jruge	L3611
2369  029d c60087        	ld	a,_rev_message_id
2370  02a0 97            	ld	xl,a
2371  02a1 a61c          	ld	a,#28
2372  02a3 42            	mul	x,a
2373  02a4 1d03f0        	subw	x,#1008
2374  02a7 d600c3        	ld	a,(_sc+52,x)
2375  02aa aa02          	or	a,#2
2376  02ac d700c3        	ld	(_sc+52,x),a
2378  02af ac7f037f      	jpf	L5011
2379  02b3               L3611:
2380                     ; 314 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2382  02b3 c60087        	ld	a,_rev_message_id
2383  02b6 a111          	cp	a,#17
2384  02b8 2608          	jrne	L7611
2387  02ba 721403d2      	bset	_sc+835,#2
2389  02be ac7f037f      	jpf	L5011
2390  02c2               L7611:
2391                     ; 315 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2393  02c2 c60087        	ld	a,_rev_message_id
2394  02c5 a133          	cp	a,#51
2395  02c7 251d          	jrult	L3711
2397  02c9 c60087        	ld	a,_rev_message_id
2398  02cc a142          	cp	a,#66
2399  02ce 2416          	jruge	L3711
2402  02d0 c60087        	ld	a,_rev_message_id
2403  02d3 97            	ld	xl,a
2404  02d4 a61a          	ld	a,#26
2405  02d6 42            	mul	x,a
2406  02d7 1d052e        	subw	x,#1326
2407  02da d60265        	ld	a,(_sc+470,x)
2408  02dd aa04          	or	a,#4
2409  02df d70265        	ld	(_sc+470,x),a
2411  02e2 ac7f037f      	jpf	L5011
2412  02e6               L3711:
2413                     ; 316 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2415  02e6 c60087        	ld	a,_rev_message_id
2416  02e9 a142          	cp	a,#66
2417  02eb 2403          	jruge	L67
2418  02ed cc037f        	jp	L5011
2419  02f0               L67:
2421  02f0 c60087        	ld	a,_rev_message_id
2422  02f3 a151          	cp	a,#81
2423  02f5 24f6          	jruge	L5011
2426  02f7 c60087        	ld	a,_rev_message_id
2427  02fa 97            	ld	xl,a
2428  02fb a61c          	ld	a,#28
2429  02fd 42            	mul	x,a
2430  02fe 1d0738        	subw	x,#1848
2431  0301 d600c3        	ld	a,(_sc+52,x)
2432  0304 aa04          	or	a,#4
2433  0306 d700c3        	ld	(_sc+52,x),a
2434  0309 2074          	jra	L5011
2435  030b               L7201:
2436                     ; 319 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2436                     ; 320 				break;
2438  030b 2072          	jra	L5011
2439  030d               L3211:
2441  030d 2070          	jra	L5011
2442  030f               L7111:
2443                     ; 323 		else if (ble_ctrl_frame){
2445  030f c603d8        	ld	a,_UART1Flag1_
2446  0312 a504          	bcp	a,#4
2447  0314 2769          	jreq	L5011
2448                     ; 324 			ble_ctrl_frame = 0;
2450  0316 721503d8      	bres	_UART1Flag1_,#2
2451                     ; 325 			switch(sicp_buf[4]){
2453  031a c6000a        	ld	a,_sicp_buf+4
2455                     ; 351 				break;
2456  031d 4a            	dec	a
2457  031e 2708          	jreq	L1301
2458  0320 4a            	dec	a
2459  0321 272a          	jreq	L3301
2460  0323 4a            	dec	a
2461  0324 2733          	jreq	L5301
2462  0326 2057          	jra	L5011
2463  0328               L1301:
2464                     ; 326 				case 0x01://网络状态帧
2464                     ; 327 				ns_signal = sicp_buf[5];
2466  0328 55000b008e    	mov	_ns_signal,_sicp_buf+5
2467                     ; 328 				ns_status = sicp_buf[6];
2469  032d 55000c008d    	mov	_ns_status,_sicp_buf+6
2470                     ; 329 				ns_phonenum = sicp_buf[7];
2472  0332 55000d008c    	mov	_ns_phonenum,_sicp_buf+7
2473                     ; 330 				ns_own_meshid_H = sicp_buf[8];
2475  0337 55000e008b    	mov	_ns_own_meshid_H,_sicp_buf+8
2476                     ; 331 				ns_own_meshid_L = sicp_buf[9];
2478  033c 55000f008a    	mov	_ns_own_meshid_L,_sicp_buf+9
2479                     ; 332 				ns_host_meshid_H = sicp_buf[10];
2481  0341 5500100089    	mov	_ns_host_meshid_H,_sicp_buf+10
2482                     ; 333 				ns_host_meshid_L = sicp_buf[11];
2484  0346 5500110088    	mov	_ns_host_meshid_L,_sicp_buf+11
2485                     ; 334 				break;
2487  034b 2032          	jra	L5011
2488  034d               L3301:
2489                     ; 335 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2489                     ; 336 				sys_init();
2491  034d cd0000        	call	_sys_init
2493                     ; 337 				clear_uart_buf();
2495  0350 cd0000        	call	_clear_uart_buf
2497                     ; 338 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2499  0353 725f0000      	clr	_init_slc_spc_done
2500                     ; 339 				break;
2502  0357 2026          	jra	L5011
2503  0359               L5301:
2504                     ; 340 			case 0x03://重置芯片和网络，退出mesh连接
2504                     ; 341 				sys_init();
2506  0359 cd0000        	call	_sys_init
2508                     ; 342 				clear_uart_buf();
2510  035c cd0000        	call	_clear_uart_buf
2512                     ; 343 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2514  035f 725f0000      	clr	_init_slc_spc_done
2515                     ; 344 				ns_signal = 0x00;
2517  0363 725f008e      	clr	_ns_signal
2518                     ; 345 				ns_status = 0x00;
2520  0367 725f008d      	clr	_ns_status
2521                     ; 346 				ns_phonenum = 0x00;
2523  036b 725f008c      	clr	_ns_phonenum
2524                     ; 347 				ns_own_meshid_H = 0x00;
2526  036f 725f008b      	clr	_ns_own_meshid_H
2527                     ; 348 				ns_own_meshid_L = 0x00;
2529  0373 725f008a      	clr	_ns_own_meshid_L
2530                     ; 349 				ns_host_meshid_H = 0x00;
2532  0377 725f0089      	clr	_ns_host_meshid_H
2533                     ; 350 				ns_host_meshid_L = 0x00;
2535  037b 725f0088      	clr	_ns_host_meshid_L
2536                     ; 351 				break;
2538  037f               L7021:
2539  037f               L5011:
2540                     ; 355 }
2543  037f 5b3b          	addw	sp,#59
2544  0381 81            	ret
2593                     ; 358 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2593                     ; 359 {
2594                     .text:	section	.text,new
2595  0000               _sicp_send_message:
2597  0000 89            	pushw	x
2598       00000000      OFST:	set	0
2601                     ; 362 	UART2_Send_Buf[0] = tx->frame_h1;
2603  0001 f6            	ld	a,(x)
2604  0002 c7005a        	ld	_UART2_Send_Buf,a
2605                     ; 363 	UART2_Send_Buf[1] = tx->frame_h2;
2607  0005 e601          	ld	a,(1,x)
2608  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2609                     ; 364 	UART2_Send_Buf[2] = tx->message_id;
2611  000a e602          	ld	a,(2,x)
2612  000c c7005c        	ld	_UART2_Send_Buf+2,a
2613                     ; 365 	UART2_Send_Buf[3] = tx->mesh_id_H;
2615  000f e603          	ld	a,(3,x)
2616  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2617                     ; 366 	UART2_Send_Buf[4] = tx->mesh_id_L;
2619  0014 e604          	ld	a,(4,x)
2620  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2621                     ; 367 	UART2_Send_Buf[5] = 4+payload_len;
2623  0019 7b05          	ld	a,(OFST+5,sp)
2624  001b ab04          	add	a,#4
2625  001d c7005f        	ld	_UART2_Send_Buf+5,a
2626                     ; 368 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2628  0020 7b05          	ld	a,(OFST+5,sp)
2629  0022 b703          	ld	c_lreg+3,a
2630  0024 3f02          	clr	c_lreg+2
2631  0026 3f01          	clr	c_lreg+1
2632  0028 3f00          	clr	c_lreg
2633  002a be02          	ldw	x,c_lreg+2
2634  002c 89            	pushw	x
2635  002d be00          	ldw	x,c_lreg
2636  002f 89            	pushw	x
2637  0030 1e05          	ldw	x,(OFST+5,sp)
2638  0032 1c0005        	addw	x,#5
2639  0035 89            	pushw	x
2640  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2641  0039 cd0000        	call	_mymemcpy
2643  003c 5b06          	addw	sp,#6
2644                     ; 369 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2646  003e 7b05          	ld	a,(OFST+5,sp)
2647  0040 5f            	clrw	x
2648  0041 97            	ld	xl,a
2649  0042 89            	pushw	x
2650  0043 3b005f        	push	_UART2_Send_Buf+5
2651  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2652  0049 cd0000        	call	_Check_Sum
2654  004c 5b01          	addw	sp,#1
2655  004e 85            	popw	x
2656  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2657                     ; 370 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2659  0052 7b05          	ld	a,(OFST+5,sp)
2660  0054 5f            	clrw	x
2661  0055 97            	ld	xl,a
2662  0056 1c0007        	addw	x,#7
2663  0059 89            	pushw	x
2664  005a ae005a        	ldw	x,#_UART2_Send_Buf
2665  005d cd0000        	call	_Uart2_Send
2667  0060 85            	popw	x
2669  0061               L5321:
2670                     ; 371 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2672  0061 725d0057      	tnz	_Uart2_Send_Done
2673  0065 27fa          	jreq	L5321
2676  0067 725f0057      	clr	_Uart2_Send_Done
2677                     ; 372 }
2680  006b 85            	popw	x
2681  006c 81            	ret
2745                     ; 378 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
2745                     ; 379 {
2746                     .text:	section	.text,new
2747  0000               _sicp_receipt_OK:
2749  0000 89            	pushw	x
2750  0001 5237          	subw	sp,#55
2751       00000037      OFST:	set	55
2754                     ; 381 	receipt.frame_h1 = 0xEE;
2756  0003 a6ee          	ld	a,#238
2757  0005 6b01          	ld	(OFST-54,sp),a
2758                     ; 382 	receipt.frame_h2 = 0xAA;
2760  0007 a6aa          	ld	a,#170
2761  0009 6b02          	ld	(OFST-53,sp),a
2762                     ; 383 	receipt.message_id = send_message_id;
2764  000b 9f            	ld	a,xl
2765  000c 6b03          	ld	(OFST-52,sp),a
2766                     ; 384 	receipt.mesh_id_H = send_mesh_id_H;
2768  000e 7b3c          	ld	a,(OFST+5,sp)
2769  0010 6b04          	ld	(OFST-51,sp),a
2770                     ; 385 	receipt.mesh_id_L = send_mesh_id_L;
2772  0012 7b3d          	ld	a,(OFST+6,sp)
2773  0014 6b05          	ld	(OFST-50,sp),a
2774                     ; 386 	receipt.payload[0] = 0xAA;
2776  0016 a6aa          	ld	a,#170
2777  0018 6b06          	ld	(OFST-49,sp),a
2778                     ; 387 	receipt.payload[1] = type;
2780  001a 9e            	ld	a,xh
2781  001b 6b07          	ld	(OFST-48,sp),a
2782                     ; 388 	sicp_send_message(&receipt,2);
2784  001d 4b02          	push	#2
2785  001f 96            	ldw	x,sp
2786  0020 1c0002        	addw	x,#OFST-53
2787  0023 cd0000        	call	_sicp_send_message
2789  0026 84            	pop	a
2790                     ; 389 }
2793  0027 5b39          	addw	sp,#57
2794  0029 81            	ret
2880                     ; 391 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
2880                     ; 392 {
2881                     .text:	section	.text,new
2882  0000               _sicp_receipt_Done:
2884  0000 89            	pushw	x
2885  0001 5238          	subw	sp,#56
2886       00000038      OFST:	set	56
2889                     ; 393 	u8 i = 0;
2891  0003 0f38          	clr	(OFST+0,sp)
2892                     ; 395 	receipt.frame_h1 = 0xEE;
2894  0005 a6ee          	ld	a,#238
2895  0007 6b01          	ld	(OFST-55,sp),a
2896                     ; 396 	receipt.frame_h2 = 0xAA;
2898  0009 a6aa          	ld	a,#170
2899  000b 6b02          	ld	(OFST-54,sp),a
2900                     ; 397 	receipt.message_id = send_message_id;
2902  000d 9f            	ld	a,xl
2903  000e 6b03          	ld	(OFST-53,sp),a
2904                     ; 398 	receipt.mesh_id_H = send_mesh_id_H;
2906  0010 7b3d          	ld	a,(OFST+5,sp)
2907  0012 6b04          	ld	(OFST-52,sp),a
2908                     ; 399 	receipt.mesh_id_L = send_mesh_id_L;
2910  0014 7b3e          	ld	a,(OFST+6,sp)
2911  0016 6b05          	ld	(OFST-51,sp),a
2912                     ; 400 	receipt.payload[0] = 0xAA;
2914  0018 a6aa          	ld	a,#170
2915  001a 6b06          	ld	(OFST-50,sp),a
2916                     ; 401 	receipt.payload[1] = type;
2918  001c 9e            	ld	a,xh
2919  001d 6b07          	ld	(OFST-49,sp),a
2920                     ; 402 	switch(method){
2922  001f 7b3f          	ld	a,(OFST+7,sp)
2924                     ; 429 		default:
2924                     ; 430 		break;
2925  0021 4a            	dec	a
2926  0022 2707          	jreq	L7621
2927  0024 4a            	dec	a
2928  0025 2766          	jreq	L1721
2929  0027 aced00ed      	jpf	L3331
2930  002b               L7621:
2931                     ; 403 		case 0x01://action Dimmer调光的执行回执
2931                     ; 404 		receipt.payload[2] = mdid;
2933  002b 7b40          	ld	a,(OFST+8,sp)
2934  002d 6b08          	ld	(OFST-48,sp),a
2935                     ; 405 		for(i = 0;i < 15;i++){
2937  002f 0f38          	clr	(OFST+0,sp)
2938  0031               L5331:
2939                     ; 406 			if(sc.slc[i].MDID == mdid){
2941  0031 7b38          	ld	a,(OFST+0,sp)
2942  0033 97            	ld	xl,a
2943  0034 a61a          	ld	a,#26
2944  0036 42            	mul	x,a
2945  0037 7b40          	ld	a,(OFST+8,sp)
2946  0039 905f          	clrw	y
2947  003b 9097          	ld	yl,a
2948  003d 90bf00        	ldw	c_y,y
2949  0040 9093          	ldw	y,x
2950  0042 90de025f      	ldw	y,(_sc+464,y)
2951  0046 90b300        	cpw	y,c_y
2952  0049 2638          	jrne	L3431
2953                     ; 407 				receipt.payload[3] = sc.slc[i].ch1_status;
2955  004b 7b38          	ld	a,(OFST+0,sp)
2956  004d 97            	ld	xl,a
2957  004e a61a          	ld	a,#26
2958  0050 42            	mul	x,a
2959  0051 d60261        	ld	a,(_sc+466,x)
2960  0054 6b09          	ld	(OFST-47,sp),a
2961                     ; 408 				receipt.payload[4] = sc.slc[i].ch2_status;
2963  0056 7b38          	ld	a,(OFST+0,sp)
2964  0058 97            	ld	xl,a
2965  0059 a61a          	ld	a,#26
2966  005b 42            	mul	x,a
2967  005c d60262        	ld	a,(_sc+467,x)
2968  005f 6b0a          	ld	(OFST-46,sp),a
2969                     ; 409 				receipt.payload[5] = sc.slc[i].ch3_status;
2971  0061 7b38          	ld	a,(OFST+0,sp)
2972  0063 97            	ld	xl,a
2973  0064 a61a          	ld	a,#26
2974  0066 42            	mul	x,a
2975  0067 d60263        	ld	a,(_sc+468,x)
2976  006a 6b0b          	ld	(OFST-45,sp),a
2977                     ; 410 				receipt.payload[6] = sc.slc[i].ch4_status;
2979  006c 7b38          	ld	a,(OFST+0,sp)
2980  006e 97            	ld	xl,a
2981  006f a61a          	ld	a,#26
2982  0071 42            	mul	x,a
2983  0072 d60264        	ld	a,(_sc+469,x)
2984  0075 6b0c          	ld	(OFST-44,sp),a
2985                     ; 411 				sicp_send_message(&receipt,7);
2987  0077 4b07          	push	#7
2988  0079 96            	ldw	x,sp
2989  007a 1c0002        	addw	x,#OFST-54
2990  007d cd0000        	call	_sicp_send_message
2992  0080 84            	pop	a
2993                     ; 412 				break;
2995  0081 206a          	jra	L3331
2996  0083               L3431:
2997                     ; 405 		for(i = 0;i < 15;i++){
2999  0083 0c38          	inc	(OFST+0,sp)
3002  0085 7b38          	ld	a,(OFST+0,sp)
3003  0087 a10f          	cp	a,#15
3004  0089 25a6          	jrult	L5331
3005  008b 2060          	jra	L3331
3006  008d               L1721:
3007                     ; 416 		case 0x02://action plug switch打开或关闭开关的执行回执
3007                     ; 417 		receipt.payload[2] = mdid;
3009  008d 7b40          	ld	a,(OFST+8,sp)
3010  008f 6b08          	ld	(OFST-48,sp),a
3011                     ; 418 		for(i = 0;i < 15;i++){
3013  0091 0f38          	clr	(OFST+0,sp)
3014  0093               L5431:
3015                     ; 419 			if(sc.spc[i].MDID == mdid){
3017  0093 7b38          	ld	a,(OFST+0,sp)
3018  0095 97            	ld	xl,a
3019  0096 a61c          	ld	a,#28
3020  0098 42            	mul	x,a
3021  0099 7b40          	ld	a,(OFST+8,sp)
3022  009b 905f          	clrw	y
3023  009d 9097          	ld	yl,a
3024  009f 90bf00        	ldw	c_y,y
3025  00a2 9093          	ldw	y,x
3026  00a4 90de00bb      	ldw	y,(_sc+44,y)
3027  00a8 90b300        	cpw	y,c_y
3028  00ab 2638          	jrne	L3531
3029                     ; 420 				receipt.payload[3] = sc.spc[i].ch1_status;
3031  00ad 7b38          	ld	a,(OFST+0,sp)
3032  00af 97            	ld	xl,a
3033  00b0 a61c          	ld	a,#28
3034  00b2 42            	mul	x,a
3035  00b3 d600bd        	ld	a,(_sc+46,x)
3036  00b6 6b09          	ld	(OFST-47,sp),a
3037                     ; 421 				receipt.payload[4] = sc.spc[i].ch2_status;
3039  00b8 7b38          	ld	a,(OFST+0,sp)
3040  00ba 97            	ld	xl,a
3041  00bb a61c          	ld	a,#28
3042  00bd 42            	mul	x,a
3043  00be d600be        	ld	a,(_sc+47,x)
3044  00c1 6b0a          	ld	(OFST-46,sp),a
3045                     ; 422 				receipt.payload[5] = sc.spc[i].ch3_status;
3047  00c3 7b38          	ld	a,(OFST+0,sp)
3048  00c5 97            	ld	xl,a
3049  00c6 a61c          	ld	a,#28
3050  00c8 42            	mul	x,a
3051  00c9 d600bf        	ld	a,(_sc+48,x)
3052  00cc 6b0b          	ld	(OFST-45,sp),a
3053                     ; 423 				receipt.payload[6] = sc.spc[i].ch4_status;
3055  00ce 7b38          	ld	a,(OFST+0,sp)
3056  00d0 97            	ld	xl,a
3057  00d1 a61c          	ld	a,#28
3058  00d3 42            	mul	x,a
3059  00d4 d600c0        	ld	a,(_sc+49,x)
3060  00d7 6b0c          	ld	(OFST-44,sp),a
3061                     ; 424 				sicp_send_message(&receipt,7);
3063  00d9 4b07          	push	#7
3064  00db 96            	ldw	x,sp
3065  00dc 1c0002        	addw	x,#OFST-54
3066  00df cd0000        	call	_sicp_send_message
3068  00e2 84            	pop	a
3069                     ; 425 				break;
3071  00e3 2008          	jra	L3331
3072  00e5               L3531:
3073                     ; 418 		for(i = 0;i < 15;i++){
3075  00e5 0c38          	inc	(OFST+0,sp)
3078  00e7 7b38          	ld	a,(OFST+0,sp)
3079  00e9 a10f          	cp	a,#15
3080  00eb 25a6          	jrult	L5431
3081  00ed               L3721:
3082                     ; 429 		default:
3082                     ; 430 		break;
3084  00ed               L3331:
3085                     ; 432 }
3088  00ed 5b3a          	addw	sp,#58
3089  00ef 81            	ret
3143                     ; 435 void rev_cmd_data(u8 moduleid){
3144                     .text:	section	.text,new
3145  0000               _rev_cmd_data:
3147  0000 88            	push	a
3148  0001 5238          	subw	sp,#56
3149       00000038      OFST:	set	56
3152                     ; 438 	for(i = 0;i < 15;i++){
3154  0003 0f01          	clr	(OFST-55,sp)
3155  0005               L7731:
3156                     ; 439 		if(sc.slc[i].MDID == moduleid){
3158  0005 7b01          	ld	a,(OFST-55,sp)
3159  0007 97            	ld	xl,a
3160  0008 a61a          	ld	a,#26
3161  000a 42            	mul	x,a
3162  000b 7b39          	ld	a,(OFST+1,sp)
3163  000d 905f          	clrw	y
3164  000f 9097          	ld	yl,a
3165  0011 90bf00        	ldw	c_y,y
3166  0014 9093          	ldw	y,x
3167  0016 90de025f      	ldw	y,(_sc+464,y)
3168  001a 90b300        	cpw	y,c_y
3169  001d 2657          	jrne	L5041
3170                     ; 440 			cmd_data.frame_h1 = 0xEE;
3172  001f a6ee          	ld	a,#238
3173  0021 6b02          	ld	(OFST-54,sp),a
3174                     ; 441 			cmd_data.frame_h2 = 0xAA;
3176  0023 a6aa          	ld	a,#170
3177  0025 6b03          	ld	(OFST-53,sp),a
3178                     ; 442 			cmd_data.message_id = rev_message_id;
3180  0027 c60087        	ld	a,_rev_message_id
3181  002a 6b04          	ld	(OFST-52,sp),a
3182                     ; 443 			cmd_data.mesh_id_H = ns_own_meshid_H;
3184  002c c6008b        	ld	a,_ns_own_meshid_H
3185  002f 6b05          	ld	(OFST-51,sp),a
3186                     ; 444 			cmd_data.mesh_id_L = ns_own_meshid_L;
3188  0031 c6008a        	ld	a,_ns_own_meshid_L
3189  0034 6b06          	ld	(OFST-50,sp),a
3190                     ; 445 			cmd_data.payload[0] = 0x06;
3192  0036 a606          	ld	a,#6
3193  0038 6b07          	ld	(OFST-49,sp),a
3194                     ; 446 			cmd_data.payload[1] = moduleid;
3196  003a 7b39          	ld	a,(OFST+1,sp)
3197  003c 6b08          	ld	(OFST-48,sp),a
3198                     ; 447 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3200  003e 7b01          	ld	a,(OFST-55,sp)
3201  0040 97            	ld	xl,a
3202  0041 a61a          	ld	a,#26
3203  0043 42            	mul	x,a
3204  0044 d60261        	ld	a,(_sc+466,x)
3205  0047 6b09          	ld	(OFST-47,sp),a
3206                     ; 448 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3208  0049 7b01          	ld	a,(OFST-55,sp)
3209  004b 97            	ld	xl,a
3210  004c a61a          	ld	a,#26
3211  004e 42            	mul	x,a
3212  004f d60262        	ld	a,(_sc+467,x)
3213  0052 6b0a          	ld	(OFST-46,sp),a
3214                     ; 449 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3216  0054 7b01          	ld	a,(OFST-55,sp)
3217  0056 97            	ld	xl,a
3218  0057 a61a          	ld	a,#26
3219  0059 42            	mul	x,a
3220  005a d60263        	ld	a,(_sc+468,x)
3221  005d 6b0b          	ld	(OFST-45,sp),a
3222                     ; 450 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3224  005f 7b01          	ld	a,(OFST-55,sp)
3225  0061 97            	ld	xl,a
3226  0062 a61a          	ld	a,#26
3227  0064 42            	mul	x,a
3228  0065 d60264        	ld	a,(_sc+469,x)
3229  0068 6b0c          	ld	(OFST-44,sp),a
3230                     ; 451 			sicp_send_message(&cmd_data,6);
3232  006a 4b06          	push	#6
3233  006c 96            	ldw	x,sp
3234  006d 1c0003        	addw	x,#OFST-53
3235  0070 cd0000        	call	_sicp_send_message
3237  0073 84            	pop	a
3238                     ; 452 			break;
3240  0074 207c          	jra	L3041
3241  0076               L5041:
3242                     ; 454 		if(sc.spc[i].MDID == moduleid){
3244  0076 7b01          	ld	a,(OFST-55,sp)
3245  0078 97            	ld	xl,a
3246  0079 a61c          	ld	a,#28
3247  007b 42            	mul	x,a
3248  007c 7b39          	ld	a,(OFST+1,sp)
3249  007e 905f          	clrw	y
3250  0080 9097          	ld	yl,a
3251  0082 90bf00        	ldw	c_y,y
3252  0085 9093          	ldw	y,x
3253  0087 90de00bb      	ldw	y,(_sc+44,y)
3254  008b 90b300        	cpw	y,c_y
3255  008e 2657          	jrne	L7041
3256                     ; 455 			cmd_data.frame_h1 = 0xEE;
3258  0090 a6ee          	ld	a,#238
3259  0092 6b02          	ld	(OFST-54,sp),a
3260                     ; 456 			cmd_data.frame_h2 = 0xAA;
3262  0094 a6aa          	ld	a,#170
3263  0096 6b03          	ld	(OFST-53,sp),a
3264                     ; 457 			cmd_data.message_id = rev_message_id;
3266  0098 c60087        	ld	a,_rev_message_id
3267  009b 6b04          	ld	(OFST-52,sp),a
3268                     ; 458 			cmd_data.mesh_id_H = ns_own_meshid_H;
3270  009d c6008b        	ld	a,_ns_own_meshid_H
3271  00a0 6b05          	ld	(OFST-51,sp),a
3272                     ; 459 			cmd_data.mesh_id_L = ns_own_meshid_L;
3274  00a2 c6008a        	ld	a,_ns_own_meshid_L
3275  00a5 6b06          	ld	(OFST-50,sp),a
3276                     ; 460 			cmd_data.payload[0] = 0x06;
3278  00a7 a606          	ld	a,#6
3279  00a9 6b07          	ld	(OFST-49,sp),a
3280                     ; 461 			cmd_data.payload[1] = moduleid;
3282  00ab 7b39          	ld	a,(OFST+1,sp)
3283  00ad 6b08          	ld	(OFST-48,sp),a
3284                     ; 462 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3286  00af 7b01          	ld	a,(OFST-55,sp)
3287  00b1 97            	ld	xl,a
3288  00b2 a61c          	ld	a,#28
3289  00b4 42            	mul	x,a
3290  00b5 d600bd        	ld	a,(_sc+46,x)
3291  00b8 6b09          	ld	(OFST-47,sp),a
3292                     ; 463 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3294  00ba 7b01          	ld	a,(OFST-55,sp)
3295  00bc 97            	ld	xl,a
3296  00bd a61c          	ld	a,#28
3297  00bf 42            	mul	x,a
3298  00c0 d600be        	ld	a,(_sc+47,x)
3299  00c3 6b0a          	ld	(OFST-46,sp),a
3300                     ; 464 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3302  00c5 7b01          	ld	a,(OFST-55,sp)
3303  00c7 97            	ld	xl,a
3304  00c8 a61c          	ld	a,#28
3305  00ca 42            	mul	x,a
3306  00cb d600bf        	ld	a,(_sc+48,x)
3307  00ce 6b0b          	ld	(OFST-45,sp),a
3308                     ; 465 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3310  00d0 7b01          	ld	a,(OFST-55,sp)
3311  00d2 97            	ld	xl,a
3312  00d3 a61c          	ld	a,#28
3313  00d5 42            	mul	x,a
3314  00d6 d600c0        	ld	a,(_sc+49,x)
3315  00d9 6b0c          	ld	(OFST-44,sp),a
3316                     ; 466 			sicp_send_message(&cmd_data,6);
3318  00db 4b06          	push	#6
3319  00dd 96            	ldw	x,sp
3320  00de 1c0003        	addw	x,#OFST-53
3321  00e1 cd0000        	call	_sicp_send_message
3323  00e4 84            	pop	a
3324                     ; 467 			break;
3326  00e5 200b          	jra	L3041
3327  00e7               L7041:
3328                     ; 438 	for(i = 0;i < 15;i++){
3330  00e7 0c01          	inc	(OFST-55,sp)
3333  00e9 7b01          	ld	a,(OFST-55,sp)
3334  00eb a10f          	cp	a,#15
3335  00ed 2403          	jruge	L011
3336  00ef cc0005        	jp	L7731
3337  00f2               L011:
3338  00f2               L3041:
3339                     ; 470 }
3342  00f2 5b39          	addw	sp,#57
3343  00f4 81            	ret
3346                     	switch	.data
3347  0000               L1141_eg_timeout:
3348  0000 0000          	dc.w	0
3403                     ; 473 void report_energy_consum(void){
3404                     .text:	section	.text,new
3405  0000               _report_energy_consum:
3407  0000 5238          	subw	sp,#56
3408       00000038      OFST:	set	56
3411                     ; 477 	systime_count[3]++;
3413  0002 ce0006        	ldw	x,_systime_count+6
3414  0005 1c0001        	addw	x,#1
3415  0008 cf0006        	ldw	_systime_count+6,x
3416                     ; 478 	if(systime_count[3] >= 60){
3418  000b ce0006        	ldw	x,_systime_count+6
3419  000e a3003c        	cpw	x,#60
3420  0011 2403          	jruge	L411
3421  0013 cc00a2        	jp	L5341
3422  0016               L411:
3423                     ; 479 		systime_count[3] = 0;
3425  0016 5f            	clrw	x
3426  0017 cf0006        	ldw	_systime_count+6,x
3427                     ; 480 		systime_count[4]++;
3429  001a ce0008        	ldw	x,_systime_count+8
3430  001d 1c0001        	addw	x,#1
3431  0020 cf0008        	ldw	_systime_count+8,x
3432                     ; 481 		if(systime_count[4] >= 30){
3434  0023 ce0008        	ldw	x,_systime_count+8
3435  0026 a3001e        	cpw	x,#30
3436  0029 2577          	jrult	L5341
3437                     ; 482 			systime_count[4] = 0;
3439  002b 5f            	clrw	x
3440  002c cf0008        	ldw	_systime_count+8,x
3441                     ; 483 			i2c_get_energy_consum();
3443  002f cd0000        	call	_i2c_get_energy_consum
3445                     ; 484 			for(i = 0; i < 15; i++){
3447  0032 0f01          	clr	(OFST-55,sp)
3448  0034               L1441:
3449                     ; 485 				if(sc.spc[i].MDID){//有ID说明SPC存在
3451  0034 7b01          	ld	a,(OFST-55,sp)
3452  0036 97            	ld	xl,a
3453  0037 a61c          	ld	a,#28
3454  0039 42            	mul	x,a
3455  003a d600bc        	ld	a,(_sc+45,x)
3456  003d da00bb        	or	a,(_sc+44,x)
3457  0040 2758          	jreq	L7441
3458                     ; 486 				ec.frame_h1 = 0xEE;
3460  0042 a6ee          	ld	a,#238
3461  0044 6b02          	ld	(OFST-54,sp),a
3462                     ; 487 				ec.frame_h2 = 0xEE;
3464  0046 a6ee          	ld	a,#238
3465  0048 6b03          	ld	(OFST-53,sp),a
3466                     ; 488 				ec.message_id = i+1;
3468  004a 7b01          	ld	a,(OFST-55,sp)
3469  004c 4c            	inc	a
3470  004d 6b04          	ld	(OFST-52,sp),a
3471                     ; 489 				ec.mesh_id_H = ns_own_meshid_H;
3473  004f c6008b        	ld	a,_ns_own_meshid_H
3474  0052 6b05          	ld	(OFST-51,sp),a
3475                     ; 490 				ec.mesh_id_L = ns_own_meshid_L;
3477  0054 c6008a        	ld	a,_ns_own_meshid_L
3478  0057 6b06          	ld	(OFST-50,sp),a
3479                     ; 491 				ec.payload[0] = 0x2A;
3481  0059 a62a          	ld	a,#42
3482  005b 6b07          	ld	(OFST-49,sp),a
3483                     ; 492 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3485  005d 7b01          	ld	a,(OFST-55,sp)
3486  005f 97            	ld	xl,a
3487  0060 a61c          	ld	a,#28
3488  0062 42            	mul	x,a
3489  0063 de00c1        	ldw	x,(_sc+50,x)
3490  0066 01            	rrwa	x,a
3491  0067 9f            	ld	a,xl
3492  0068 a4ff          	and	a,#255
3493  006a 97            	ld	xl,a
3494  006b 4f            	clr	a
3495  006c 02            	rlwa	x,a
3496  006d 4f            	clr	a
3497  006e 01            	rrwa	x,a
3498  006f 9f            	ld	a,xl
3499  0070 6b08          	ld	(OFST-48,sp),a
3500                     ; 493 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3502  0072 7b01          	ld	a,(OFST-55,sp)
3503  0074 97            	ld	xl,a
3504  0075 a61c          	ld	a,#28
3505  0077 42            	mul	x,a
3506  0078 d600c2        	ld	a,(_sc+51,x)
3507  007b a4ff          	and	a,#255
3508  007d 6b09          	ld	(OFST-47,sp),a
3509                     ; 494 				ec.payload[3] =	sc.spc[i].MDID;
3511  007f 7b01          	ld	a,(OFST-55,sp)
3512  0081 97            	ld	xl,a
3513  0082 a61c          	ld	a,#28
3514  0084 42            	mul	x,a
3515  0085 d600bc        	ld	a,(_sc+45,x)
3516  0088 6b0a          	ld	(OFST-46,sp),a
3517                     ; 495 				sicp_send_message(&ec,4);
3519  008a 4b04          	push	#4
3520  008c 96            	ldw	x,sp
3521  008d 1c0003        	addw	x,#OFST-53
3522  0090 cd0000        	call	_sicp_send_message
3524  0093 84            	pop	a
3525                     ; 496 				eg_timeout = 5;
3527  0094 ae0005        	ldw	x,#5
3528  0097 cf0000        	ldw	L1141_eg_timeout,x
3529  009a               L7441:
3530                     ; 484 			for(i = 0; i < 15; i++){
3532  009a 0c01          	inc	(OFST-55,sp)
3535  009c 7b01          	ld	a,(OFST-55,sp)
3536  009e a10f          	cp	a,#15
3537  00a0 2592          	jrult	L1441
3538  00a2               L5341:
3539                     ; 502 	if(eg_timeout){
3541  00a2 ce0000        	ldw	x,L1141_eg_timeout
3542  00a5 2603          	jrne	L611
3543  00a7 cc0135        	jp	L1541
3544  00aa               L611:
3545                     ; 503 		if(--eg_timeout == 0){
3547  00aa ce0000        	ldw	x,L1141_eg_timeout
3548  00ad 1d0001        	subw	x,#1
3549  00b0 cf0000        	ldw	L1141_eg_timeout,x
3550  00b3 26f2          	jrne	L1541
3551                     ; 504 			for(i = 0;i < 15;i++){
3553  00b5 0f01          	clr	(OFST-55,sp)
3554  00b7               L5541:
3555                     ; 505 			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3557  00b7 7b01          	ld	a,(OFST-55,sp)
3558  00b9 97            	ld	xl,a
3559  00ba a61c          	ld	a,#28
3560  00bc 42            	mul	x,a
3561  00bd d600bc        	ld	a,(_sc+45,x)
3562  00c0 da00bb        	or	a,(_sc+44,x)
3563  00c3 2768          	jreq	L3641
3565  00c5 7b01          	ld	a,(OFST-55,sp)
3566  00c7 97            	ld	xl,a
3567  00c8 a61c          	ld	a,#28
3568  00ca 42            	mul	x,a
3569  00cb d600c3        	ld	a,(_sc+52,x)
3570  00ce a501          	bcp	a,#1
3571  00d0 265b          	jrne	L3641
3572                     ; 506 				ec.frame_h1 = 0xEE;
3574  00d2 a6ee          	ld	a,#238
3575  00d4 6b02          	ld	(OFST-54,sp),a
3576                     ; 507 				ec.frame_h2 = 0xEE;
3578  00d6 a6ee          	ld	a,#238
3579  00d8 6b03          	ld	(OFST-53,sp),a
3580                     ; 508 				ec.message_id = random(TIM4->CNTR);
3582  00da c65344        	ld	a,21316
3583  00dd cd0000        	call	_random
3585  00e0 6b04          	ld	(OFST-52,sp),a
3586                     ; 509 				ec.mesh_id_H = ns_own_meshid_H;
3588  00e2 c6008b        	ld	a,_ns_own_meshid_H
3589  00e5 6b05          	ld	(OFST-51,sp),a
3590                     ; 510 				ec.mesh_id_L = ns_own_meshid_L;
3592  00e7 c6008a        	ld	a,_ns_own_meshid_L
3593  00ea 6b06          	ld	(OFST-50,sp),a
3594                     ; 511 				ec.payload[0] = 0x2A;
3596  00ec a62a          	ld	a,#42
3597  00ee 6b07          	ld	(OFST-49,sp),a
3598                     ; 512 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3600  00f0 7b01          	ld	a,(OFST-55,sp)
3601  00f2 97            	ld	xl,a
3602  00f3 a61c          	ld	a,#28
3603  00f5 42            	mul	x,a
3604  00f6 de00c1        	ldw	x,(_sc+50,x)
3605  00f9 01            	rrwa	x,a
3606  00fa 9f            	ld	a,xl
3607  00fb a4ff          	and	a,#255
3608  00fd 97            	ld	xl,a
3609  00fe 4f            	clr	a
3610  00ff 02            	rlwa	x,a
3611  0100 4f            	clr	a
3612  0101 01            	rrwa	x,a
3613  0102 9f            	ld	a,xl
3614  0103 6b08          	ld	(OFST-48,sp),a
3615                     ; 513 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3617  0105 7b01          	ld	a,(OFST-55,sp)
3618  0107 97            	ld	xl,a
3619  0108 a61c          	ld	a,#28
3620  010a 42            	mul	x,a
3621  010b d600c2        	ld	a,(_sc+51,x)
3622  010e a4ff          	and	a,#255
3623  0110 6b09          	ld	(OFST-47,sp),a
3624                     ; 514 				ec.payload[3] =	sc.spc[i].MDID;
3626  0112 7b01          	ld	a,(OFST-55,sp)
3627  0114 97            	ld	xl,a
3628  0115 a61c          	ld	a,#28
3629  0117 42            	mul	x,a
3630  0118 d600bc        	ld	a,(_sc+45,x)
3631  011b 6b0a          	ld	(OFST-46,sp),a
3632                     ; 515 				sicp_send_message(&ec,4);
3634  011d 4b04          	push	#4
3635  011f 96            	ldw	x,sp
3636  0120 1c0003        	addw	x,#OFST-53
3637  0123 cd0000        	call	_sicp_send_message
3639  0126 84            	pop	a
3640                     ; 516 				eg_timeout = 5;//每5s重发1次直到接收到回执为止
3642  0127 ae0005        	ldw	x,#5
3643  012a cf0000        	ldw	L1141_eg_timeout,x
3644  012d               L3641:
3645                     ; 504 			for(i = 0;i < 15;i++){
3647  012d 0c01          	inc	(OFST-55,sp)
3650  012f 7b01          	ld	a,(OFST-55,sp)
3651  0131 a10f          	cp	a,#15
3652  0133 2582          	jrult	L5541
3653  0135               L1541:
3654                     ; 521 }
3657  0135 5b38          	addw	sp,#56
3658  0137 81            	ret
3698                     ; 524 void send_sc_device_info(void)
3698                     ; 525 {
3699                     .text:	section	.text,new
3700  0000               _send_sc_device_info:
3702  0000 5237          	subw	sp,#55
3703       00000037      OFST:	set	55
3706                     ; 528 	di.frame_h1 = 0xEE;
3708  0002 a6ee          	ld	a,#238
3709  0004 6b01          	ld	(OFST-54,sp),a
3710                     ; 529 	di.frame_h2 = 0xEE;
3712  0006 a6ee          	ld	a,#238
3713  0008 6b02          	ld	(OFST-53,sp),a
3714                     ; 530 	di.message_id = 16;
3716  000a a610          	ld	a,#16
3717  000c 6b03          	ld	(OFST-52,sp),a
3718                     ; 531 	di.mesh_id_H = ns_own_meshid_H;
3720  000e c6008b        	ld	a,_ns_own_meshid_H
3721  0011 6b04          	ld	(OFST-51,sp),a
3722                     ; 532 	di.mesh_id_L = ns_own_meshid_L;
3724  0013 c6008a        	ld	a,_ns_own_meshid_L
3725  0016 6b05          	ld	(OFST-50,sp),a
3726                     ; 533 	di.payload[0] = 0xB1;
3728  0018 a6b1          	ld	a,#177
3729  001a 6b06          	ld	(OFST-49,sp),a
3730                     ; 534 	di.payload[1] =	sc.deviceid[0];
3732  001c c60091        	ld	a,_sc+2
3733  001f 6b07          	ld	(OFST-48,sp),a
3734                     ; 535 	di.payload[2] =	sc.deviceid[0];
3736  0021 c60091        	ld	a,_sc+2
3737  0024 6b08          	ld	(OFST-47,sp),a
3738                     ; 536 	di.payload[3] =	sc.deviceid[0];
3740  0026 c60091        	ld	a,_sc+2
3741  0029 6b09          	ld	(OFST-46,sp),a
3742                     ; 537 	di.payload[4] =	sc.deviceid[0];
3744  002b c60091        	ld	a,_sc+2
3745  002e 6b0a          	ld	(OFST-45,sp),a
3746                     ; 538 	di.payload[5] =	sc.model;
3748  0030 c60097        	ld	a,_sc+8
3749  0033 6b0b          	ld	(OFST-44,sp),a
3750                     ; 539 	di.payload[6] = sc.firmware;
3752  0035 c60095        	ld	a,_sc+6
3753  0038 6b0c          	ld	(OFST-43,sp),a
3754                     ; 540 	di.payload[7] = sc.HWTtest;
3756  003a c60096        	ld	a,_sc+7
3757  003d 6b0d          	ld	(OFST-42,sp),a
3758                     ; 541 	di.payload[8] = sc.Ndevice;
3760  003f c600a2        	ld	a,_sc+19
3761  0042 6b0e          	ld	(OFST-41,sp),a
3762                     ; 542 	sicp_send_message(&di,9);
3764  0044 4b09          	push	#9
3765  0046 96            	ldw	x,sp
3766  0047 1c0002        	addw	x,#OFST-53
3767  004a cd0000        	call	_sicp_send_message
3769  004d 84            	pop	a
3770                     ; 543 }
3773  004e 5b37          	addw	sp,#55
3774  0050 81            	ret
3821                     ; 545 void send_slc_device_info(u8 i)
3821                     ; 546 {
3822                     .text:	section	.text,new
3823  0000               _send_slc_device_info:
3825  0000 88            	push	a
3826  0001 5237          	subw	sp,#55
3827       00000037      OFST:	set	55
3830                     ; 548 	di.frame_h1 = 0xEE;
3832  0003 a6ee          	ld	a,#238
3833  0005 6b01          	ld	(OFST-54,sp),a
3834                     ; 549 	di.frame_h2 = 0xEE;
3836  0007 a6ee          	ld	a,#238
3837  0009 6b02          	ld	(OFST-53,sp),a
3838                     ; 550 	di.message_id = 21+i;
3840  000b 7b38          	ld	a,(OFST+1,sp)
3841  000d ab15          	add	a,#21
3842  000f 6b03          	ld	(OFST-52,sp),a
3843                     ; 551 	di.mesh_id_H = ns_own_meshid_H;
3845  0011 c6008b        	ld	a,_ns_own_meshid_H
3846  0014 6b04          	ld	(OFST-51,sp),a
3847                     ; 552 	di.mesh_id_L = ns_own_meshid_L;
3849  0016 c6008a        	ld	a,_ns_own_meshid_L
3850  0019 6b05          	ld	(OFST-50,sp),a
3851                     ; 553 	di.payload[0] = 0xB2;
3853  001b a6b2          	ld	a,#178
3854  001d 6b06          	ld	(OFST-49,sp),a
3855                     ; 554 	di.payload[1] =	sc.slc[i].deviceid[0];
3857  001f 7b38          	ld	a,(OFST+1,sp)
3858  0021 97            	ld	xl,a
3859  0022 a61a          	ld	a,#26
3860  0024 42            	mul	x,a
3861  0025 d6024e        	ld	a,(_sc+447,x)
3862  0028 6b07          	ld	(OFST-48,sp),a
3863                     ; 555 	di.payload[2] =	sc.slc[i].deviceid[0];
3865  002a 7b38          	ld	a,(OFST+1,sp)
3866  002c 97            	ld	xl,a
3867  002d a61a          	ld	a,#26
3868  002f 42            	mul	x,a
3869  0030 d6024e        	ld	a,(_sc+447,x)
3870  0033 6b08          	ld	(OFST-47,sp),a
3871                     ; 556 	di.payload[3] =	sc.slc[i].deviceid[0];
3873  0035 7b38          	ld	a,(OFST+1,sp)
3874  0037 97            	ld	xl,a
3875  0038 a61a          	ld	a,#26
3876  003a 42            	mul	x,a
3877  003b d6024e        	ld	a,(_sc+447,x)
3878  003e 6b09          	ld	(OFST-46,sp),a
3879                     ; 557 	di.payload[4] =	sc.slc[i].deviceid[0];
3881  0040 7b38          	ld	a,(OFST+1,sp)
3882  0042 97            	ld	xl,a
3883  0043 a61a          	ld	a,#26
3884  0045 42            	mul	x,a
3885  0046 d6024e        	ld	a,(_sc+447,x)
3886  0049 6b0a          	ld	(OFST-45,sp),a
3887                     ; 558 	di.payload[5] =	sc.slc[i].model;
3889  004b 7b38          	ld	a,(OFST+1,sp)
3890  004d 97            	ld	xl,a
3891  004e a61a          	ld	a,#26
3892  0050 42            	mul	x,a
3893  0051 d60254        	ld	a,(_sc+453,x)
3894  0054 6b0b          	ld	(OFST-44,sp),a
3895                     ; 559 	di.payload[6] = sc.slc[i].firmware;
3897  0056 7b38          	ld	a,(OFST+1,sp)
3898  0058 97            	ld	xl,a
3899  0059 a61a          	ld	a,#26
3900  005b 42            	mul	x,a
3901  005c d60252        	ld	a,(_sc+451,x)
3902  005f 6b0c          	ld	(OFST-43,sp),a
3903                     ; 560 	di.payload[7] = sc.slc[i].HWTtest;
3905  0061 7b38          	ld	a,(OFST+1,sp)
3906  0063 97            	ld	xl,a
3907  0064 a61a          	ld	a,#26
3908  0066 42            	mul	x,a
3909  0067 d60253        	ld	a,(_sc+452,x)
3910  006a 6b0d          	ld	(OFST-42,sp),a
3911                     ; 561 	di.payload[8] = sc.slc[i].MDID;
3913  006c 7b38          	ld	a,(OFST+1,sp)
3914  006e 97            	ld	xl,a
3915  006f a61a          	ld	a,#26
3916  0071 42            	mul	x,a
3917  0072 d60260        	ld	a,(_sc+465,x)
3918  0075 6b0e          	ld	(OFST-41,sp),a
3919                     ; 562 	sicp_send_message(&di,9);
3921  0077 4b09          	push	#9
3922  0079 96            	ldw	x,sp
3923  007a 1c0002        	addw	x,#OFST-53
3924  007d cd0000        	call	_sicp_send_message
3926  0080 84            	pop	a
3927                     ; 563 }
3930  0081 5b38          	addw	sp,#56
3931  0083 81            	ret
3978                     ; 565 void send_spc_device_info(u8 i)
3978                     ; 566 {
3979                     .text:	section	.text,new
3980  0000               _send_spc_device_info:
3982  0000 88            	push	a
3983  0001 5237          	subw	sp,#55
3984       00000037      OFST:	set	55
3987                     ; 568 	di.frame_h1 = 0xEE;
3989  0003 a6ee          	ld	a,#238
3990  0005 6b01          	ld	(OFST-54,sp),a
3991                     ; 569 	di.frame_h2 = 0xEE;
3993  0007 a6ee          	ld	a,#238
3994  0009 6b02          	ld	(OFST-53,sp),a
3995                     ; 570 	di.message_id = 36+i;
3997  000b 7b38          	ld	a,(OFST+1,sp)
3998  000d ab24          	add	a,#36
3999  000f 6b03          	ld	(OFST-52,sp),a
4000                     ; 571 	di.mesh_id_H = ns_own_meshid_H;
4002  0011 c6008b        	ld	a,_ns_own_meshid_H
4003  0014 6b04          	ld	(OFST-51,sp),a
4004                     ; 572 	di.mesh_id_L = ns_own_meshid_L;
4006  0016 c6008a        	ld	a,_ns_own_meshid_L
4007  0019 6b05          	ld	(OFST-50,sp),a
4008                     ; 573 	di.payload[0] = 0xB3;
4010  001b a6b3          	ld	a,#179
4011  001d 6b06          	ld	(OFST-49,sp),a
4012                     ; 574 	di.payload[1] =	sc.spc[i].deviceid[0];
4014  001f 7b38          	ld	a,(OFST+1,sp)
4015  0021 97            	ld	xl,a
4016  0022 a61c          	ld	a,#28
4017  0024 42            	mul	x,a
4018  0025 d600aa        	ld	a,(_sc+27,x)
4019  0028 6b07          	ld	(OFST-48,sp),a
4020                     ; 575 	di.payload[2] =	sc.spc[i].deviceid[0];
4022  002a 7b38          	ld	a,(OFST+1,sp)
4023  002c 97            	ld	xl,a
4024  002d a61c          	ld	a,#28
4025  002f 42            	mul	x,a
4026  0030 d600aa        	ld	a,(_sc+27,x)
4027  0033 6b08          	ld	(OFST-47,sp),a
4028                     ; 576 	di.payload[3] =	sc.spc[i].deviceid[0];
4030  0035 7b38          	ld	a,(OFST+1,sp)
4031  0037 97            	ld	xl,a
4032  0038 a61c          	ld	a,#28
4033  003a 42            	mul	x,a
4034  003b d600aa        	ld	a,(_sc+27,x)
4035  003e 6b09          	ld	(OFST-46,sp),a
4036                     ; 577 	di.payload[4] =	sc.spc[i].deviceid[0];
4038  0040 7b38          	ld	a,(OFST+1,sp)
4039  0042 97            	ld	xl,a
4040  0043 a61c          	ld	a,#28
4041  0045 42            	mul	x,a
4042  0046 d600aa        	ld	a,(_sc+27,x)
4043  0049 6b0a          	ld	(OFST-45,sp),a
4044                     ; 578 	di.payload[5] =	sc.spc[i].model;
4046  004b 7b38          	ld	a,(OFST+1,sp)
4047  004d 97            	ld	xl,a
4048  004e a61c          	ld	a,#28
4049  0050 42            	mul	x,a
4050  0051 d600b0        	ld	a,(_sc+33,x)
4051  0054 6b0b          	ld	(OFST-44,sp),a
4052                     ; 579 	di.payload[6] = sc.spc[i].firmware;
4054  0056 7b38          	ld	a,(OFST+1,sp)
4055  0058 97            	ld	xl,a
4056  0059 a61c          	ld	a,#28
4057  005b 42            	mul	x,a
4058  005c d600ae        	ld	a,(_sc+31,x)
4059  005f 6b0c          	ld	(OFST-43,sp),a
4060                     ; 580 	di.payload[7] = sc.spc[i].HWTtest;
4062  0061 7b38          	ld	a,(OFST+1,sp)
4063  0063 97            	ld	xl,a
4064  0064 a61c          	ld	a,#28
4065  0066 42            	mul	x,a
4066  0067 d600af        	ld	a,(_sc+32,x)
4067  006a 6b0d          	ld	(OFST-42,sp),a
4068                     ; 581 	di.payload[8] = sc.spc[i].MDID;
4070  006c 7b38          	ld	a,(OFST+1,sp)
4071  006e 97            	ld	xl,a
4072  006f a61c          	ld	a,#28
4073  0071 42            	mul	x,a
4074  0072 d600bc        	ld	a,(_sc+45,x)
4075  0075 6b0e          	ld	(OFST-41,sp),a
4076                     ; 582 	sicp_send_message(&di,9);
4078  0077 4b09          	push	#9
4079  0079 96            	ldw	x,sp
4080  007a 1c0002        	addw	x,#OFST-53
4081  007d cd0000        	call	_sicp_send_message
4083  0080 84            	pop	a
4084                     ; 583 }
4087  0081 5b38          	addw	sp,#56
4088  0083 81            	ret
4125                     ; 585 void send_device_info(void)
4125                     ; 586 {
4126                     .text:	section	.text,new
4127  0000               _send_device_info:
4129  0000 88            	push	a
4130       00000001      OFST:	set	1
4133                     ; 589 	send_sc_device_info();
4135  0001 cd0000        	call	_send_sc_device_info
4137                     ; 591 	for(i = 0; i < 15;i++){
4139  0004 0f01          	clr	(OFST+0,sp)
4140  0006               L7551:
4141                     ; 592 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4143  0006 7b01          	ld	a,(OFST+0,sp)
4144  0008 97            	ld	xl,a
4145  0009 a61a          	ld	a,#26
4146  000b 42            	mul	x,a
4147  000c d60260        	ld	a,(_sc+465,x)
4148  000f da025f        	or	a,(_sc+464,x)
4149  0012 2705          	jreq	L5651
4150                     ; 593 			send_slc_device_info(i);
4152  0014 7b01          	ld	a,(OFST+0,sp)
4153  0016 cd0000        	call	_send_slc_device_info
4155  0019               L5651:
4156                     ; 591 	for(i = 0; i < 15;i++){
4158  0019 0c01          	inc	(OFST+0,sp)
4161  001b 7b01          	ld	a,(OFST+0,sp)
4162  001d a10f          	cp	a,#15
4163  001f 25e5          	jrult	L7551
4164                     ; 597 	for(i = 0; i < 15;i++){
4166  0021 0f01          	clr	(OFST+0,sp)
4167  0023               L7651:
4168                     ; 598 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4170  0023 7b01          	ld	a,(OFST+0,sp)
4171  0025 97            	ld	xl,a
4172  0026 a61c          	ld	a,#28
4173  0028 42            	mul	x,a
4174  0029 d600bc        	ld	a,(_sc+45,x)
4175  002c da00bb        	or	a,(_sc+44,x)
4176  002f 2705          	jreq	L5751
4177                     ; 599 			send_spc_device_info(i);
4179  0031 7b01          	ld	a,(OFST+0,sp)
4180  0033 cd0000        	call	_send_spc_device_info
4182  0036               L5751:
4183                     ; 597 	for(i = 0; i < 15;i++){
4185  0036 0c01          	inc	(OFST+0,sp)
4188  0038 7b01          	ld	a,(OFST+0,sp)
4189  003a a10f          	cp	a,#15
4190  003c 25e5          	jrult	L7651
4191                     ; 602 	di_timeout = 5;
4193  003e 35050001      	mov	_di_timeout,#5
4194                     ; 603 }
4197  0042 84            	pop	a
4198  0043 81            	ret
4244                     ; 606 void send_malfunction(void)
4244                     ; 607 {
4245                     .text:	section	.text,new
4246  0000               _send_malfunction:
4248  0000 5238          	subw	sp,#56
4249       00000038      OFST:	set	56
4252                     ; 611 	if((sc.HWTtest & 0xC0)!=0xC0){
4254  0002 c60096        	ld	a,_sc+7
4255  0005 a4c0          	and	a,#192
4256  0007 a1c0          	cp	a,#192
4257  0009 272f          	jreq	L7161
4258                     ; 612 		mal.frame_h1 = 0xEE;
4260  000b a6ee          	ld	a,#238
4261  000d 6b02          	ld	(OFST-54,sp),a
4262                     ; 613 		mal.frame_h2 = 0xEE;
4264  000f a6ee          	ld	a,#238
4265  0011 6b03          	ld	(OFST-53,sp),a
4266                     ; 614 		mal.message_id = 17;
4268  0013 a611          	ld	a,#17
4269  0015 6b04          	ld	(OFST-52,sp),a
4270                     ; 615 		mal.mesh_id_H = ns_own_meshid_H;
4272  0017 c6008b        	ld	a,_ns_own_meshid_H
4273  001a 6b05          	ld	(OFST-51,sp),a
4274                     ; 616 		mal.mesh_id_L = ns_own_meshid_L;
4276  001c c6008a        	ld	a,_ns_own_meshid_L
4277  001f 6b06          	ld	(OFST-50,sp),a
4278                     ; 617 		mal.payload[0] = 0x0A;
4280  0021 a60a          	ld	a,#10
4281  0023 6b07          	ld	(OFST-49,sp),a
4282                     ; 618 		mal.payload[1] = 0xB1;
4284  0025 a6b1          	ld	a,#177
4285  0027 6b08          	ld	(OFST-48,sp),a
4286                     ; 619 		mal.payload[2] =	0x00;
4288  0029 0f09          	clr	(OFST-47,sp)
4289                     ; 620 		mal.payload[3] =	sc.HWTtest;
4291  002b c60096        	ld	a,_sc+7
4292  002e 6b0a          	ld	(OFST-46,sp),a
4293                     ; 621 		sicp_send_message(&mal,4);
4295  0030 4b04          	push	#4
4296  0032 96            	ldw	x,sp
4297  0033 1c0003        	addw	x,#OFST-53
4298  0036 cd0000        	call	_sicp_send_message
4300  0039 84            	pop	a
4301  003a               L7161:
4302                     ; 624 	for(i = 0; i < 15;i++){
4304  003a 0f01          	clr	(OFST-55,sp)
4305  003c               L1261:
4306                     ; 625 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4308  003c 7b01          	ld	a,(OFST-55,sp)
4309  003e 97            	ld	xl,a
4310  003f a61a          	ld	a,#26
4311  0041 42            	mul	x,a
4312  0042 d60260        	ld	a,(_sc+465,x)
4313  0045 da025f        	or	a,(_sc+464,x)
4314  0048 274f          	jreq	L7261
4316  004a 7b01          	ld	a,(OFST-55,sp)
4317  004c 97            	ld	xl,a
4318  004d a61a          	ld	a,#26
4319  004f 42            	mul	x,a
4320  0050 d60253        	ld	a,(_sc+452,x)
4321  0053 a4c0          	and	a,#192
4322  0055 a1c0          	cp	a,#192
4323  0057 2740          	jreq	L7261
4324                     ; 626 			mal.frame_h1 = 0xEE;
4326  0059 a6ee          	ld	a,#238
4327  005b 6b02          	ld	(OFST-54,sp),a
4328                     ; 627 			mal.frame_h2 = 0xEE;
4330  005d a6ee          	ld	a,#238
4331  005f 6b03          	ld	(OFST-53,sp),a
4332                     ; 628 			mal.message_id = 51+i;
4334  0061 7b01          	ld	a,(OFST-55,sp)
4335  0063 ab33          	add	a,#51
4336  0065 6b04          	ld	(OFST-52,sp),a
4337                     ; 629 			mal.mesh_id_H = ns_own_meshid_H;
4339  0067 c6008b        	ld	a,_ns_own_meshid_H
4340  006a 6b05          	ld	(OFST-51,sp),a
4341                     ; 630 			mal.mesh_id_L = ns_own_meshid_L;
4343  006c c6008a        	ld	a,_ns_own_meshid_L
4344  006f 6b06          	ld	(OFST-50,sp),a
4345                     ; 631 			mal.payload[0] = 0x0A;
4347  0071 a60a          	ld	a,#10
4348  0073 6b07          	ld	(OFST-49,sp),a
4349                     ; 632 			mal.payload[1] = 0xB2;
4351  0075 a6b2          	ld	a,#178
4352  0077 6b08          	ld	(OFST-48,sp),a
4353                     ; 633 			mal.payload[2] =	sc.slc[i].MDID;
4355  0079 7b01          	ld	a,(OFST-55,sp)
4356  007b 97            	ld	xl,a
4357  007c a61a          	ld	a,#26
4358  007e 42            	mul	x,a
4359  007f d60260        	ld	a,(_sc+465,x)
4360  0082 6b09          	ld	(OFST-47,sp),a
4361                     ; 634 			mal.payload[3] =	sc.slc[i].HWTtest;
4363  0084 7b01          	ld	a,(OFST-55,sp)
4364  0086 97            	ld	xl,a
4365  0087 a61a          	ld	a,#26
4366  0089 42            	mul	x,a
4367  008a d60253        	ld	a,(_sc+452,x)
4368  008d 6b0a          	ld	(OFST-46,sp),a
4369                     ; 635 			sicp_send_message(&mal,4);
4371  008f 4b04          	push	#4
4372  0091 96            	ldw	x,sp
4373  0092 1c0003        	addw	x,#OFST-53
4374  0095 cd0000        	call	_sicp_send_message
4376  0098 84            	pop	a
4377  0099               L7261:
4378                     ; 624 	for(i = 0; i < 15;i++){
4380  0099 0c01          	inc	(OFST-55,sp)
4383  009b 7b01          	ld	a,(OFST-55,sp)
4384  009d a10f          	cp	a,#15
4385  009f 259b          	jrult	L1261
4386                     ; 639 	for(i = 0; i < 15;i++){
4388  00a1 0f01          	clr	(OFST-55,sp)
4389  00a3               L1361:
4390                     ; 640 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4392  00a3 7b01          	ld	a,(OFST-55,sp)
4393  00a5 97            	ld	xl,a
4394  00a6 a61c          	ld	a,#28
4395  00a8 42            	mul	x,a
4396  00a9 d600bc        	ld	a,(_sc+45,x)
4397  00ac da00bb        	or	a,(_sc+44,x)
4398  00af 274f          	jreq	L7361
4400  00b1 7b01          	ld	a,(OFST-55,sp)
4401  00b3 97            	ld	xl,a
4402  00b4 a61c          	ld	a,#28
4403  00b6 42            	mul	x,a
4404  00b7 d600af        	ld	a,(_sc+32,x)
4405  00ba a4c0          	and	a,#192
4406  00bc a1c0          	cp	a,#192
4407  00be 2740          	jreq	L7361
4408                     ; 641 			mal.frame_h1 = 0xEE;
4410  00c0 a6ee          	ld	a,#238
4411  00c2 6b02          	ld	(OFST-54,sp),a
4412                     ; 642 			mal.frame_h2 = 0xEE;
4414  00c4 a6ee          	ld	a,#238
4415  00c6 6b03          	ld	(OFST-53,sp),a
4416                     ; 643 			mal.message_id = 66+i;
4418  00c8 7b01          	ld	a,(OFST-55,sp)
4419  00ca ab42          	add	a,#66
4420  00cc 6b04          	ld	(OFST-52,sp),a
4421                     ; 644 			mal.mesh_id_H = ns_own_meshid_H;
4423  00ce c6008b        	ld	a,_ns_own_meshid_H
4424  00d1 6b05          	ld	(OFST-51,sp),a
4425                     ; 645 			mal.mesh_id_L = ns_own_meshid_L;
4427  00d3 c6008a        	ld	a,_ns_own_meshid_L
4428  00d6 6b06          	ld	(OFST-50,sp),a
4429                     ; 646 			mal.payload[0] = 0x0A;
4431  00d8 a60a          	ld	a,#10
4432  00da 6b07          	ld	(OFST-49,sp),a
4433                     ; 647 			mal.payload[1] = 0xB2;
4435  00dc a6b2          	ld	a,#178
4436  00de 6b08          	ld	(OFST-48,sp),a
4437                     ; 648 			mal.payload[2] =	sc.spc[i].MDID;
4439  00e0 7b01          	ld	a,(OFST-55,sp)
4440  00e2 97            	ld	xl,a
4441  00e3 a61c          	ld	a,#28
4442  00e5 42            	mul	x,a
4443  00e6 d600bc        	ld	a,(_sc+45,x)
4444  00e9 6b09          	ld	(OFST-47,sp),a
4445                     ; 649 			mal.payload[3] =	sc.spc[i].HWTtest;
4447  00eb 7b01          	ld	a,(OFST-55,sp)
4448  00ed 97            	ld	xl,a
4449  00ee a61c          	ld	a,#28
4450  00f0 42            	mul	x,a
4451  00f1 d600af        	ld	a,(_sc+32,x)
4452  00f4 6b0a          	ld	(OFST-46,sp),a
4453                     ; 650 			sicp_send_message(&mal,4);
4455  00f6 4b04          	push	#4
4456  00f8 96            	ldw	x,sp
4457  00f9 1c0003        	addw	x,#OFST-53
4458  00fc cd0000        	call	_sicp_send_message
4460  00ff 84            	pop	a
4461  0100               L7361:
4462                     ; 639 	for(i = 0; i < 15;i++){
4464  0100 0c01          	inc	(OFST-55,sp)
4467  0102 7b01          	ld	a,(OFST-55,sp)
4468  0104 a10f          	cp	a,#15
4469  0106 259b          	jrult	L1361
4470                     ; 653 }
4473  0108 5b38          	addw	sp,#56
4474  010a 81            	ret
4512                     ; 656 void check_send_repeatedly(void){
4513                     .text:	section	.text,new
4514  0000               _check_send_repeatedly:
4516  0000 88            	push	a
4517       00000001      OFST:	set	1
4520                     ; 659 	if(di_timeout){
4522  0001 725d0001      	tnz	_di_timeout
4523  0005 2766          	jreq	L5561
4524                     ; 660 		if(--di_timeout == 0){
4526  0007 725a0001      	dec	_di_timeout
4527  000b 2660          	jrne	L5561
4528                     ; 661 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4530  000d c603d2        	ld	a,_sc+835
4531  0010 a502          	bcp	a,#2
4532  0012 2607          	jrne	L1661
4535  0014 cd0000        	call	_send_sc_device_info
4539  0017 35050001      	mov	_di_timeout,#5
4540  001b               L1661:
4541                     ; 662 			for(i = 0; i < 15; i++){
4543  001b 0f01          	clr	(OFST+0,sp)
4544  001d               L3661:
4545                     ; 663 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4547  001d 7b01          	ld	a,(OFST+0,sp)
4548  001f 97            	ld	xl,a
4549  0020 a61a          	ld	a,#26
4550  0022 42            	mul	x,a
4551  0023 d60260        	ld	a,(_sc+465,x)
4552  0026 da025f        	or	a,(_sc+464,x)
4553  0029 2716          	jreq	L1761
4555  002b 7b01          	ld	a,(OFST+0,sp)
4556  002d 97            	ld	xl,a
4557  002e a61a          	ld	a,#26
4558  0030 42            	mul	x,a
4559  0031 d60265        	ld	a,(_sc+470,x)
4560  0034 a502          	bcp	a,#2
4561  0036 2609          	jrne	L1761
4564  0038 7b01          	ld	a,(OFST+0,sp)
4565  003a cd0000        	call	_send_slc_device_info
4569  003d 35050001      	mov	_di_timeout,#5
4570  0041               L1761:
4571                     ; 664 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4573  0041 7b01          	ld	a,(OFST+0,sp)
4574  0043 97            	ld	xl,a
4575  0044 a61c          	ld	a,#28
4576  0046 42            	mul	x,a
4577  0047 d600bc        	ld	a,(_sc+45,x)
4578  004a da00bb        	or	a,(_sc+44,x)
4579  004d 2716          	jreq	L3761
4581  004f 7b01          	ld	a,(OFST+0,sp)
4582  0051 97            	ld	xl,a
4583  0052 a61c          	ld	a,#28
4584  0054 42            	mul	x,a
4585  0055 d600c3        	ld	a,(_sc+52,x)
4586  0058 a502          	bcp	a,#2
4587  005a 2609          	jrne	L3761
4590  005c 7b01          	ld	a,(OFST+0,sp)
4591  005e cd0000        	call	_send_spc_device_info
4595  0061 35050001      	mov	_di_timeout,#5
4596  0065               L3761:
4597                     ; 662 			for(i = 0; i < 15; i++){
4599  0065 0c01          	inc	(OFST+0,sp)
4602  0067 7b01          	ld	a,(OFST+0,sp)
4603  0069 a10f          	cp	a,#15
4604  006b 25b0          	jrult	L3661
4605  006d               L5561:
4606                     ; 668 }
4609  006d 84            	pop	a
4610  006e 81            	ret
4623                     	xdef	_send_spc_device_info
4624                     	xdef	_send_slc_device_info
4625                     	xdef	_send_sc_device_info
4626                     	xdef	_clear_uart_buf
4627                     	xdef	_Uart2_Send
4628                     	xdef	_delay
4629                     	xref	_rand
4630                     	xref	_i2c_multiple_action_dimmer
4631                     	xref	_i2c_action_plug
4632                     	xref	_i2c_single_action_dimmer
4633                     	xref	_i2c_get_energy_consum
4634                     	xref	_action_dimmer_ext
4635                     	xref	_systime_count
4636                     	xref	_init_slc_spc_done
4637                     	xref	_sys_init
4638                     	xdef	_check_send_repeatedly
4639                     	xdef	_send_malfunction
4640                     	xdef	_send_device_info
4641                     	xdef	_report_energy_consum
4642                     	xdef	_rev_cmd_data
4643                     	xdef	_sicp_receipt_Done
4644                     	xdef	_sicp_receipt_OK
4645                     	xdef	_sicp_send_message
4646                     	xdef	_random
4647                     	xdef	_rev_deal
4648                     	xdef	_Check_Sum
4649                     	xdef	_rev_anaylze
4650                     	xdef	_UART2_RX_ISR
4651                     	xdef	_UART2_TX_ISR
4652                     	xdef	_Init_uart2
4653                     	xdef	_mymemcpy
4654                     	switch	.bss
4655  0000               _mal_timeout:
4656  0000 00            	ds.b	1
4657                     	xdef	_mal_timeout
4658  0001               _di_timeout:
4659  0001 00            	ds.b	1
4660                     	xdef	_di_timeout
4661  0002               _send_failed_count:
4662  0002 0000          	ds.b	2
4663                     	xdef	_send_failed_count
4664  0004               _send_fault_count:
4665  0004 0000          	ds.b	2
4666                     	xdef	_send_fault_count
4667  0006               _sicp_buf:
4668  0006 000000000000  	ds.b	40
4669                     	xdef	_sicp_buf
4670  002e               _Uart2_Rec_Cnt:
4671  002e 00            	ds.b	1
4672                     	xdef	_Uart2_Rec_Cnt
4673  002f               _Uart2_Rece_Buf:
4674  002f 000000000000  	ds.b	40
4675                     	xdef	_Uart2_Rece_Buf
4676  0057               _Uart2_Send_Done:
4677  0057 00            	ds.b	1
4678                     	xdef	_Uart2_Send_Done
4679  0058               _Uart2_Send_Cnt:
4680  0058 00            	ds.b	1
4681                     	xdef	_Uart2_Send_Cnt
4682  0059               _Uart2_Send_Length:
4683  0059 00            	ds.b	1
4684                     	xdef	_Uart2_Send_Length
4685  005a               _UART2_Send_Buf:
4686  005a 000000000000  	ds.b	40
4687                     	xdef	_UART2_Send_Buf
4688  0082               _rev_ad_channel:
4689  0082 00            	ds.b	1
4690                     	xdef	_rev_ad_channel
4691  0083               _rev_ad_mdid:
4692  0083 00            	ds.b	1
4693                     	xdef	_rev_ad_mdid
4694  0084               _rev_ad_message_id:
4695  0084 00            	ds.b	1
4696                     	xdef	_rev_ad_message_id
4697  0085               _rev_mesh_id_L:
4698  0085 00            	ds.b	1
4699                     	xdef	_rev_mesh_id_L
4700  0086               _rev_mesh_id_H:
4701  0086 00            	ds.b	1
4702                     	xdef	_rev_mesh_id_H
4703  0087               _rev_message_id:
4704  0087 00            	ds.b	1
4705                     	xdef	_rev_message_id
4706  0088               _ns_host_meshid_L:
4707  0088 00            	ds.b	1
4708                     	xdef	_ns_host_meshid_L
4709  0089               _ns_host_meshid_H:
4710  0089 00            	ds.b	1
4711                     	xdef	_ns_host_meshid_H
4712  008a               _ns_own_meshid_L:
4713  008a 00            	ds.b	1
4714                     	xdef	_ns_own_meshid_L
4715  008b               _ns_own_meshid_H:
4716  008b 00            	ds.b	1
4717                     	xdef	_ns_own_meshid_H
4718  008c               _ns_phonenum:
4719  008c 00            	ds.b	1
4720                     	xdef	_ns_phonenum
4721  008d               _ns_status:
4722  008d 00            	ds.b	1
4723                     	xdef	_ns_status
4724  008e               _ns_signal:
4725  008e 00            	ds.b	1
4726                     	xdef	_ns_signal
4727  008f               _sc:
4728  008f 000000000000  	ds.b	836
4729                     	xdef	_sc
4730  03d3               _UART1Flag6_:
4731  03d3 00            	ds.b	1
4732                     	xdef	_UART1Flag6_
4733  03d4               _UART1Flag5_:
4734  03d4 00            	ds.b	1
4735                     	xdef	_UART1Flag5_
4736  03d5               _UART1Flag4_:
4737  03d5 00            	ds.b	1
4738                     	xdef	_UART1Flag4_
4739  03d6               _UART1Flag3_:
4740  03d6 00            	ds.b	1
4741                     	xdef	_UART1Flag3_
4742  03d7               _UART1Flag2_:
4743  03d7 00            	ds.b	1
4744                     	xdef	_UART1Flag2_
4745  03d8               _UART1Flag1_:
4746  03d8 00            	ds.b	1
4747                     	xdef	_UART1Flag1_
4748                     	xref	_UART2_ITConfig
4749                     	xref	_UART2_Cmd
4750                     	xref	_UART2_Init
4751                     	xref	_UART2_DeInit
4752                     	xref.b	c_lreg
4753                     	xref.b	c_x
4754                     	xref.b	c_y
4774                     	xref	c_idiv
4775                     	xref	c_lrzmp
4776                     	xref	c_lgsbc
4777                     	xref	c_ltor
4778                     	end
