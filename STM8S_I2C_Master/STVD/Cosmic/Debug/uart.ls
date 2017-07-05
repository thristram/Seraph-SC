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
1909                     ; 235 void rev_anaylze(void)
1909                     ; 236 {
1910                     .text:	section	.text,new
1911  0000               _rev_anaylze:
1913  0000 523b          	subw	sp,#59
1914       0000003b      OFST:	set	59
1917                     ; 239 	if(rev_success){
1919  0002 c603d8        	ld	a,_UART1Flag1_
1920  0005 a501          	bcp	a,#1
1921  0007 2603          	jrne	L25
1922  0009 cc03b1        	jp	L7011
1923  000c               L25:
1924                     ; 240 		rev_success = 0;
1926  000c 721103d8      	bres	_UART1Flag1_,#0
1927                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1929  0010 c60006        	ld	a,_sicp_buf
1930  0013 a1ee          	cp	a,#238
1931  0015 2614          	jrne	L1111
1933  0017 c60007        	ld	a,_sicp_buf+1
1934  001a a1ee          	cp	a,#238
1935  001c 2707          	jreq	L3111
1937  001e c60007        	ld	a,_sicp_buf+1
1938  0021 a1aa          	cp	a,#170
1939  0023 2606          	jrne	L1111
1940  0025               L3111:
1941                     ; 242 			ble_data_frame = 1;
1943  0025 721203d8      	bset	_UART1Flag1_,#1
1945  0029 2012          	jra	L5111
1946  002b               L1111:
1947                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1949  002b c60006        	ld	a,_sicp_buf
1950  002e a1dd          	cp	a,#221
1951  0030 260b          	jrne	L5111
1953  0032 c60007        	ld	a,_sicp_buf+1
1954  0035 a1dd          	cp	a,#221
1955  0037 2604          	jrne	L5111
1956                     ; 245 			ble_ctrl_frame = 1;
1958  0039 721403d8      	bset	_UART1Flag1_,#2
1959  003d               L5111:
1960                     ; 248 		if (ble_data_frame){
1962  003d c603d8        	ld	a,_UART1Flag1_
1963  0040 a502          	bcp	a,#2
1964  0042 2603          	jrne	L45
1965  0044 cc0347        	jp	L1211
1966  0047               L45:
1967                     ; 249 			ble_data_frame = 0;
1969  0047 721303d8      	bres	_UART1Flag1_,#1
1970                     ; 250 			rev_message_id = sicp_buf[2];
1972  004b 5500080087    	mov	_rev_message_id,_sicp_buf+2
1973                     ; 251 			rev_mesh_id_H	= sicp_buf[3];
1975  0050 5500090086    	mov	_rev_mesh_id_H,_sicp_buf+3
1976                     ; 252 			rev_mesh_id_L = sicp_buf[4];
1978  0055 55000a0085    	mov	_rev_mesh_id_L,_sicp_buf+4
1979                     ; 253 			switch(sicp_buf[6]){
1981  005a c6000c        	ld	a,_sicp_buf+6
1983                     ; 327 				break;
1984  005d a003          	sub	a,#3
1985  005f 272c          	jreq	L5101
1986  0061 a04e          	sub	a,#78
1987  0063 273c          	jreq	L7101
1988  0065 4a            	dec	a
1989  0066 2739          	jreq	L7101
1990  0068 4a            	dec	a
1991  0069 2736          	jreq	L7101
1992  006b 4a            	dec	a
1993  006c 2733          	jreq	L7101
1994  006e 4a            	dec	a
1995  006f 2603cc00f1    	jreq	L1201
1996  0074 a002          	sub	a,#2
1997  0076 2603          	jrne	L65
1998  0078 cc013a        	jp	L3201
1999  007b               L65:
2000  007b a053          	sub	a,#83
2001  007d 2603          	jrne	L06
2002  007f cc0239        	jp	L5201
2003  0082               L06:
2004  0082 a006          	sub	a,#6
2005  0084 2603          	jrne	L26
2006  0086 cc031e        	jp	L1301
2007  0089               L26:
2008  0089 acb103b1      	jpf	L7011
2009  008d               L5101:
2010                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2010                     ; 255 					if(sicp_buf[7] == 0x03){
2012  008d c6000d        	ld	a,_sicp_buf+7
2013  0090 a103          	cp	a,#3
2014  0092 2703          	jreq	L46
2015  0094 cc03b1        	jp	L7011
2016  0097               L46:
2017                     ; 256 						rev_cmd_data(sicp_buf[8]);
2019  0097 c6000e        	ld	a,_sicp_buf+8
2020  009a cd0000        	call	_rev_cmd_data
2022  009d acb103b1      	jpf	L7011
2023  00a1               L7101:
2024                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2024                     ; 260 				case 0x52:
2024                     ; 261 				case 0x53:
2024                     ; 262 				case 0x54:
2024                     ; 263 					rev_ad_message_id = sicp_buf[2];
2026  00a1 5500080084    	mov	_rev_ad_message_id,_sicp_buf+2
2027                     ; 264 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2029  00a6 c6000d        	ld	a,_sicp_buf+7
2030  00a9 a4f0          	and	a,#240
2031  00ab 4e            	swap	a
2032  00ac a40f          	and	a,#15
2033  00ae c70083        	ld	_rev_ad_mdid,a
2034                     ; 265 					rev_ad_channel = (sicp_buf[7]&0x0f);
2036  00b1 c6000d        	ld	a,_sicp_buf+7
2037  00b4 a40f          	and	a,#15
2038  00b6 c70082        	ld	_rev_ad_channel,a
2039                     ; 266 					action_dimmer_ext = sicp_buf[9]+2;
2041  00b9 c6000f        	ld	a,_sicp_buf+9
2042  00bc ab02          	add	a,#2
2043  00be c70000        	ld	_action_dimmer_ext,a
2044                     ; 268 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2046  00c1 3b000f        	push	_sicp_buf+9
2047  00c4 3b000e        	push	_sicp_buf+8
2048  00c7 c6000d        	ld	a,_sicp_buf+7
2049  00ca 97            	ld	xl,a
2050  00cb c6000c        	ld	a,_sicp_buf+6
2051  00ce 95            	ld	xh,a
2052  00cf cd0000        	call	_i2c_single_action_dimmer
2054  00d2 85            	popw	x
2055  00d3 6b04          	ld	(OFST-55,sp),a
2056                     ; 269 					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2058  00d5 0d04          	tnz	(OFST-55,sp)
2059  00d7 2703          	jreq	L66
2060  00d9 cc03b1        	jp	L7011
2061  00dc               L66:
2064  00dc 3b008a        	push	_ns_own_meshid_L
2065  00df 3b008b        	push	_ns_own_meshid_H
2066  00e2 c60087        	ld	a,_rev_message_id
2067  00e5 97            	ld	xl,a
2068  00e6 a602          	ld	a,#2
2069  00e8 95            	ld	xh,a
2070  00e9 cd0000        	call	_sicp_receipt_OK
2072  00ec 85            	popw	x
2073  00ed acb103b1      	jpf	L7011
2074  00f1               L1201:
2075                     ; 272 				case 0x55://打开或关闭开关
2075                     ; 273 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2077  00f1 c6000d        	ld	a,_sicp_buf+7
2078  00f4 a4f0          	and	a,#240
2079  00f6 4e            	swap	a
2080  00f7 a40f          	and	a,#15
2081  00f9 c70083        	ld	_rev_ad_mdid,a
2082                     ; 274 					rev_ad_channel = (sicp_buf[7]&0x0f);
2084  00fc c6000d        	ld	a,_sicp_buf+7
2085  00ff a40f          	and	a,#15
2086  0101 c70082        	ld	_rev_ad_channel,a
2087                     ; 276 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2089  0104 3b000f        	push	_sicp_buf+9
2090  0107 3b000e        	push	_sicp_buf+8
2091  010a c6000d        	ld	a,_sicp_buf+7
2092  010d 97            	ld	xl,a
2093  010e c6000c        	ld	a,_sicp_buf+6
2094  0111 95            	ld	xh,a
2095  0112 cd0000        	call	_i2c_action_plug
2097  0115 85            	popw	x
2098  0116 6b04          	ld	(OFST-55,sp),a
2099                     ; 277 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
2101  0118 0d04          	tnz	(OFST-55,sp)
2102  011a 2703          	jreq	L07
2103  011c cc03b1        	jp	L7011
2104  011f               L07:
2107  011f 3b0083        	push	_rev_ad_mdid
2108  0122 4b02          	push	#2
2109  0124 3b0088        	push	_ns_host_meshid_L
2110  0127 3b0089        	push	_ns_host_meshid_H
2111  012a c60087        	ld	a,_rev_message_id
2112  012d 97            	ld	xl,a
2113  012e a605          	ld	a,#5
2114  0130 95            	ld	xh,a
2115  0131 cd0000        	call	_sicp_receipt_Done
2117  0134 5b04          	addw	sp,#4
2118  0136 acb103b1      	jpf	L7011
2119  013a               L3201:
2120                     ; 279 				case 0x57://一个SC下多个SLC多个通道调光
2120                     ; 280 					action_dimmer_num = sicp_buf[7];
2122  013a c6000d        	ld	a,_sicp_buf+7
2123  013d 6b03          	ld	(OFST-56,sp),a
2124                     ; 281 					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2126  013f 3b008a        	push	_ns_own_meshid_L
2127  0142 3b008b        	push	_ns_own_meshid_H
2128  0145 c60087        	ld	a,_rev_message_id
2129  0148 97            	ld	xl,a
2130  0149 a602          	ld	a,#2
2131  014b 95            	ld	xh,a
2132  014c cd0000        	call	_sicp_receipt_OK
2134  014f 85            	popw	x
2135                     ; 283 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2137  0150 7b03          	ld	a,(OFST-56,sp)
2138  0152 cd0000        	call	_i2c_multiple_action_dimmer
2140  0155 6b04          	ld	(OFST-55,sp),a
2141                     ; 284 					if(ret == IIC_SUCCESS){
2143  0157 0d04          	tnz	(OFST-55,sp)
2144  0159 2703          	jreq	L27
2145  015b cc03b1        	jp	L7011
2146  015e               L27:
2147                     ; 285 						receipt.frame_h1 = 0xEE;
2149  015e a6ee          	ld	a,#238
2150  0160 6b05          	ld	(OFST-54,sp),a
2151                     ; 286 						receipt.frame_h2 = 0xAA;
2153  0162 a6aa          	ld	a,#170
2154  0164 6b06          	ld	(OFST-53,sp),a
2155                     ; 287 						receipt.message_id = rev_message_id;
2157  0166 c60087        	ld	a,_rev_message_id
2158  0169 6b07          	ld	(OFST-52,sp),a
2159                     ; 288 						receipt.mesh_id_H = ns_own_meshid_H;
2161  016b c6008b        	ld	a,_ns_own_meshid_H
2162  016e 6b08          	ld	(OFST-51,sp),a
2163                     ; 289 						receipt.mesh_id_L = ns_own_meshid_L;
2165  0170 c6008a        	ld	a,_ns_own_meshid_L
2166  0173 6b09          	ld	(OFST-50,sp),a
2167                     ; 290 						receipt.payload[0] = 0xAA;
2169  0175 a6aa          	ld	a,#170
2170  0177 6b0a          	ld	(OFST-49,sp),a
2171                     ; 291 						receipt.payload[1] = 0x05;
2173  0179 a605          	ld	a,#5
2174  017b 6b0b          	ld	(OFST-48,sp),a
2175                     ; 292 						i = 0;
2177  017d 0f04          	clr	(OFST-55,sp)
2179  017f ac190219      	jpf	L3411
2180  0183               L7311:
2181                     ; 294 							rev_ad_mdid = (sicp_buf[8]&0xf0)>>4;
2183  0183 c6000e        	ld	a,_sicp_buf+8
2184  0186 a4f0          	and	a,#240
2185  0188 4e            	swap	a
2186  0189 a40f          	and	a,#15
2187  018b c70083        	ld	_rev_ad_mdid,a
2188                     ; 295 							rev_ad_channel = (sicp_buf[8]&0x0f);
2190  018e c6000e        	ld	a,_sicp_buf+8
2191  0191 a40f          	and	a,#15
2192  0193 c70082        	ld	_rev_ad_channel,a
2193                     ; 296 							receipt.payload[2+i*5] = rev_ad_mdid;
2195  0196 96            	ldw	x,sp
2196  0197 1c000c        	addw	x,#OFST-47
2197  019a 1f01          	ldw	(OFST-58,sp),x
2198  019c 7b04          	ld	a,(OFST-55,sp)
2199  019e 97            	ld	xl,a
2200  019f a605          	ld	a,#5
2201  01a1 42            	mul	x,a
2202  01a2 72fb01        	addw	x,(OFST-58,sp)
2203  01a5 c60083        	ld	a,_rev_ad_mdid
2204  01a8 f7            	ld	(x),a
2205                     ; 297 							receipt.payload[3+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2207  01a9 96            	ldw	x,sp
2208  01aa 1c000d        	addw	x,#OFST-46
2209  01ad 1f01          	ldw	(OFST-58,sp),x
2210  01af 7b04          	ld	a,(OFST-55,sp)
2211  01b1 97            	ld	xl,a
2212  01b2 a605          	ld	a,#5
2213  01b4 42            	mul	x,a
2214  01b5 72fb01        	addw	x,(OFST-58,sp)
2215  01b8 89            	pushw	x
2216  01b9 c60083        	ld	a,_rev_ad_mdid
2217  01bc 97            	ld	xl,a
2218  01bd a61a          	ld	a,#26
2219  01bf 42            	mul	x,a
2220  01c0 d60261        	ld	a,(_sc+466,x)
2221  01c3 85            	popw	x
2222  01c4 f7            	ld	(x),a
2223                     ; 298 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2225  01c5 96            	ldw	x,sp
2226  01c6 1c000e        	addw	x,#OFST-45
2227  01c9 1f01          	ldw	(OFST-58,sp),x
2228  01cb 7b04          	ld	a,(OFST-55,sp)
2229  01cd 97            	ld	xl,a
2230  01ce a605          	ld	a,#5
2231  01d0 42            	mul	x,a
2232  01d1 72fb01        	addw	x,(OFST-58,sp)
2233  01d4 89            	pushw	x
2234  01d5 c60083        	ld	a,_rev_ad_mdid
2235  01d8 97            	ld	xl,a
2236  01d9 a61a          	ld	a,#26
2237  01db 42            	mul	x,a
2238  01dc d60262        	ld	a,(_sc+467,x)
2239  01df 85            	popw	x
2240  01e0 f7            	ld	(x),a
2241                     ; 299 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2243  01e1 96            	ldw	x,sp
2244  01e2 1c000f        	addw	x,#OFST-44
2245  01e5 1f01          	ldw	(OFST-58,sp),x
2246  01e7 7b04          	ld	a,(OFST-55,sp)
2247  01e9 97            	ld	xl,a
2248  01ea a605          	ld	a,#5
2249  01ec 42            	mul	x,a
2250  01ed 72fb01        	addw	x,(OFST-58,sp)
2251  01f0 89            	pushw	x
2252  01f1 c60083        	ld	a,_rev_ad_mdid
2253  01f4 97            	ld	xl,a
2254  01f5 a61a          	ld	a,#26
2255  01f7 42            	mul	x,a
2256  01f8 d60263        	ld	a,(_sc+468,x)
2257  01fb 85            	popw	x
2258  01fc f7            	ld	(x),a
2259                     ; 300 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2261  01fd 96            	ldw	x,sp
2262  01fe 1c0010        	addw	x,#OFST-43
2263  0201 1f01          	ldw	(OFST-58,sp),x
2264  0203 7b04          	ld	a,(OFST-55,sp)
2265  0205 97            	ld	xl,a
2266  0206 a605          	ld	a,#5
2267  0208 42            	mul	x,a
2268  0209 72fb01        	addw	x,(OFST-58,sp)
2269  020c 89            	pushw	x
2270  020d c60083        	ld	a,_rev_ad_mdid
2271  0210 97            	ld	xl,a
2272  0211 a61a          	ld	a,#26
2273  0213 42            	mul	x,a
2274  0214 d60264        	ld	a,(_sc+469,x)
2275  0217 85            	popw	x
2276  0218 f7            	ld	(x),a
2277  0219               L3411:
2278                     ; 293 						while(action_dimmer_num--){
2280  0219 7b03          	ld	a,(OFST-56,sp)
2281  021b 0a03          	dec	(OFST-56,sp)
2282  021d 4d            	tnz	a
2283  021e 2703          	jreq	L47
2284  0220 cc0183        	jp	L7311
2285  0223               L47:
2286                     ; 302 						sicp_send_message(&receipt,7+i*5);
2288  0223 7b04          	ld	a,(OFST-55,sp)
2289  0225 97            	ld	xl,a
2290  0226 a605          	ld	a,#5
2291  0228 42            	mul	x,a
2292  0229 9f            	ld	a,xl
2293  022a ab07          	add	a,#7
2294  022c 88            	push	a
2295  022d 96            	ldw	x,sp
2296  022e 1c0006        	addw	x,#OFST-53
2297  0231 cd0000        	call	_sicp_send_message
2299  0234 84            	pop	a
2300  0235 acb103b1      	jpf	L7011
2301  0239               L5201:
2302                     ; 305 				case 0xAA:
2302                     ; 306 					if(sicp_buf[7] == 0x02){
2304  0239 c6000d        	ld	a,_sicp_buf+7
2305  023c a102          	cp	a,#2
2306  023e 2703          	jreq	L67
2307  0240 cc03b1        	jp	L7011
2308  0243               L67:
2309                     ; 308 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2311  0243 725d0087      	tnz	_rev_message_id
2312  0247 271d          	jreq	L1511
2314  0249 c60087        	ld	a,_rev_message_id
2315  024c a110          	cp	a,#16
2316  024e 2416          	jruge	L1511
2319  0250 c60087        	ld	a,_rev_message_id
2320  0253 97            	ld	xl,a
2321  0254 a61c          	ld	a,#28
2322  0256 42            	mul	x,a
2323  0257 1d001c        	subw	x,#28
2324  025a d600c3        	ld	a,(_sc+52,x)
2325  025d aa01          	or	a,#1
2326  025f d700c3        	ld	(_sc+52,x),a
2328  0262 acb103b1      	jpf	L7011
2329  0266               L1511:
2330                     ; 310 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2332  0266 c60087        	ld	a,_rev_message_id
2333  0269 a110          	cp	a,#16
2334  026b 2608          	jrne	L5511
2337  026d 721203d2      	bset	_sc+835,#1
2339  0271 acb103b1      	jpf	L7011
2340  0275               L5511:
2341                     ; 311 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2343  0275 c60087        	ld	a,_rev_message_id
2344  0278 a115          	cp	a,#21
2345  027a 251d          	jrult	L1611
2347  027c c60087        	ld	a,_rev_message_id
2348  027f a124          	cp	a,#36
2349  0281 2416          	jruge	L1611
2352  0283 c60087        	ld	a,_rev_message_id
2353  0286 97            	ld	xl,a
2354  0287 a61a          	ld	a,#26
2355  0289 42            	mul	x,a
2356  028a 1d0222        	subw	x,#546
2357  028d d60265        	ld	a,(_sc+470,x)
2358  0290 aa02          	or	a,#2
2359  0292 d70265        	ld	(_sc+470,x),a
2361  0295 acb103b1      	jpf	L7011
2362  0299               L1611:
2363                     ; 312 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2365  0299 c60087        	ld	a,_rev_message_id
2366  029c a124          	cp	a,#36
2367  029e 251d          	jrult	L5611
2369  02a0 c60087        	ld	a,_rev_message_id
2370  02a3 a133          	cp	a,#51
2371  02a5 2416          	jruge	L5611
2374  02a7 c60087        	ld	a,_rev_message_id
2375  02aa 97            	ld	xl,a
2376  02ab a61c          	ld	a,#28
2377  02ad 42            	mul	x,a
2378  02ae 1d03f0        	subw	x,#1008
2379  02b1 d600c3        	ld	a,(_sc+52,x)
2380  02b4 aa02          	or	a,#2
2381  02b6 d700c3        	ld	(_sc+52,x),a
2383  02b9 acb103b1      	jpf	L7011
2384  02bd               L5611:
2385                     ; 314 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2387  02bd c60087        	ld	a,_rev_message_id
2388  02c0 a111          	cp	a,#17
2389  02c2 2608          	jrne	L1711
2392  02c4 721403d2      	bset	_sc+835,#2
2394  02c8 acb103b1      	jpf	L7011
2395  02cc               L1711:
2396                     ; 315 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2398  02cc c60087        	ld	a,_rev_message_id
2399  02cf a133          	cp	a,#51
2400  02d1 251d          	jrult	L5711
2402  02d3 c60087        	ld	a,_rev_message_id
2403  02d6 a142          	cp	a,#66
2404  02d8 2416          	jruge	L5711
2407  02da c60087        	ld	a,_rev_message_id
2408  02dd 97            	ld	xl,a
2409  02de a61a          	ld	a,#26
2410  02e0 42            	mul	x,a
2411  02e1 1d052e        	subw	x,#1326
2412  02e4 d60265        	ld	a,(_sc+470,x)
2413  02e7 aa04          	or	a,#4
2414  02e9 d70265        	ld	(_sc+470,x),a
2416  02ec acb103b1      	jpf	L7011
2417  02f0               L5711:
2418                     ; 316 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2420  02f0 c60087        	ld	a,_rev_message_id
2421  02f3 a142          	cp	a,#66
2422  02f5 2403          	jruge	L001
2423  02f7 cc03b1        	jp	L7011
2424  02fa               L001:
2426  02fa c60087        	ld	a,_rev_message_id
2427  02fd a151          	cp	a,#81
2428  02ff 2503          	jrult	L201
2429  0301 cc03b1        	jp	L7011
2430  0304               L201:
2433  0304 c60087        	ld	a,_rev_message_id
2434  0307 97            	ld	xl,a
2435  0308 a61c          	ld	a,#28
2436  030a 42            	mul	x,a
2437  030b 1d0738        	subw	x,#1848
2438  030e d600c3        	ld	a,(_sc+52,x)
2439  0311 aa04          	or	a,#4
2440  0313 d700c3        	ld	(_sc+52,x),a
2441  0316 acb103b1      	jpf	L7011
2442  031a               L7201:
2443                     ; 319 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2443                     ; 320 				break;
2445  031a acb103b1      	jpf	L7011
2446  031e               L1301:
2447                     ; 321 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2447                     ; 322 					if(rev_message_id == 0x9E){
2449  031e c60087        	ld	a,_rev_message_id
2450  0321 a19e          	cp	a,#158
2451  0323 2703          	jreq	L401
2452  0325 cc03b1        	jp	L7011
2453  0328               L401:
2454                     ; 323 						ns_host_meshid_H = rev_mesh_id_H;
2456  0328 5500860089    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2457                     ; 324 						ns_host_meshid_L = rev_mesh_id_L;
2459  032d 5500850088    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2460                     ; 325 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2462  0332 3b0088        	push	_ns_host_meshid_L
2463  0335 3b0089        	push	_ns_host_meshid_H
2464  0338 c60087        	ld	a,_rev_message_id
2465  033b 97            	ld	xl,a
2466  033c a602          	ld	a,#2
2467  033e 95            	ld	xh,a
2468  033f cd0000        	call	_sicp_receipt_OK
2470  0342 85            	popw	x
2471  0343 206c          	jra	L7011
2472  0345               L5211:
2473                     ; 327 				break;
2474  0345 206a          	jra	L7011
2475  0347               L1211:
2476                     ; 330 		else if (ble_ctrl_frame){
2478  0347 c603d8        	ld	a,_UART1Flag1_
2479  034a a504          	bcp	a,#4
2480  034c 2763          	jreq	L7011
2481                     ; 331 			ble_ctrl_frame = 0;
2483  034e 721503d8      	bres	_UART1Flag1_,#2
2484                     ; 332 			switch(sicp_buf[4]){
2486  0352 c6000a        	ld	a,_sicp_buf+4
2488                     ; 363 				break;
2489  0355 4a            	dec	a
2490  0356 2708          	jreq	L3301
2491  0358 4a            	dec	a
2492  0359 2724          	jreq	L5301
2493  035b 4a            	dec	a
2494  035c 272d          	jreq	L7301
2495  035e 2051          	jra	L7011
2496  0360               L3301:
2497                     ; 333 				case 0x01://网络状态帧
2497                     ; 334 				rev_bleheartbeat = 1;
2499  0360 721203d7      	bset	_UART1Flag2_,#1
2500                     ; 335 				ns_signal = sicp_buf[5];
2502  0364 55000b008e    	mov	_ns_signal,_sicp_buf+5
2503                     ; 336 				ns_status = sicp_buf[6];
2505  0369 55000c008d    	mov	_ns_status,_sicp_buf+6
2506                     ; 337 				ns_phonenum = sicp_buf[7];
2508  036e 55000d008c    	mov	_ns_phonenum,_sicp_buf+7
2509                     ; 338 				ns_own_meshid_H = sicp_buf[8];
2511  0373 55000e008b    	mov	_ns_own_meshid_H,_sicp_buf+8
2512                     ; 339 				ns_own_meshid_L = sicp_buf[9];
2514  0378 55000f008a    	mov	_ns_own_meshid_L,_sicp_buf+9
2515                     ; 346 				break;
2517  037d 2032          	jra	L7011
2518  037f               L5301:
2519                     ; 347 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2519                     ; 348 				sys_init();
2521  037f cd0000        	call	_sys_init
2523                     ; 349 				clear_uart_buf();
2525  0382 cd0000        	call	_clear_uart_buf
2527                     ; 350 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2529  0385 725f0000      	clr	_init_slc_spc_done
2530                     ; 351 				break;
2532  0389 2026          	jra	L7011
2533  038b               L7301:
2534                     ; 352 			case 0x03://重置芯片和网络，退出mesh连接
2534                     ; 353 				sys_init();
2536  038b cd0000        	call	_sys_init
2538                     ; 354 				clear_uart_buf();
2540  038e cd0000        	call	_clear_uart_buf
2542                     ; 355 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2544  0391 725f0000      	clr	_init_slc_spc_done
2545                     ; 356 				ns_signal = 0x00;
2547  0395 725f008e      	clr	_ns_signal
2548                     ; 357 				ns_status = 0x00;
2550  0399 725f008d      	clr	_ns_status
2551                     ; 358 				ns_phonenum = 0x00;
2553  039d 725f008c      	clr	_ns_phonenum
2554                     ; 359 				ns_own_meshid_H = 0x00;
2556  03a1 725f008b      	clr	_ns_own_meshid_H
2557                     ; 360 				ns_own_meshid_L = 0x00;
2559  03a5 725f008a      	clr	_ns_own_meshid_L
2560                     ; 361 				ns_host_meshid_H = 0x80;
2562  03a9 35800089      	mov	_ns_host_meshid_H,#128
2563                     ; 362 				ns_host_meshid_L = 0xFF;
2565  03ad 35ff0088      	mov	_ns_host_meshid_L,#255
2566                     ; 363 				break;
2568  03b1               L3121:
2569  03b1               L7011:
2570                     ; 367 }
2573  03b1 5b3b          	addw	sp,#59
2574  03b3 81            	ret
2623                     ; 370 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2623                     ; 371 {
2624                     .text:	section	.text,new
2625  0000               _sicp_send_message:
2627  0000 89            	pushw	x
2628       00000000      OFST:	set	0
2631                     ; 374 	UART2_Send_Buf[0] = tx->frame_h1;
2633  0001 f6            	ld	a,(x)
2634  0002 c7005a        	ld	_UART2_Send_Buf,a
2635                     ; 375 	UART2_Send_Buf[1] = tx->frame_h2;
2637  0005 e601          	ld	a,(1,x)
2638  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2639                     ; 376 	UART2_Send_Buf[2] = tx->message_id;
2641  000a e602          	ld	a,(2,x)
2642  000c c7005c        	ld	_UART2_Send_Buf+2,a
2643                     ; 377 	UART2_Send_Buf[3] = tx->mesh_id_H;
2645  000f e603          	ld	a,(3,x)
2646  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2647                     ; 378 	UART2_Send_Buf[4] = tx->mesh_id_L;
2649  0014 e604          	ld	a,(4,x)
2650  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2651                     ; 379 	UART2_Send_Buf[5] = 4+payload_len;
2653  0019 7b05          	ld	a,(OFST+5,sp)
2654  001b ab04          	add	a,#4
2655  001d c7005f        	ld	_UART2_Send_Buf+5,a
2656                     ; 380 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2658  0020 7b05          	ld	a,(OFST+5,sp)
2659  0022 b703          	ld	c_lreg+3,a
2660  0024 3f02          	clr	c_lreg+2
2661  0026 3f01          	clr	c_lreg+1
2662  0028 3f00          	clr	c_lreg
2663  002a be02          	ldw	x,c_lreg+2
2664  002c 89            	pushw	x
2665  002d be00          	ldw	x,c_lreg
2666  002f 89            	pushw	x
2667  0030 1e05          	ldw	x,(OFST+5,sp)
2668  0032 1c0005        	addw	x,#5
2669  0035 89            	pushw	x
2670  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2671  0039 cd0000        	call	_mymemcpy
2673  003c 5b06          	addw	sp,#6
2674                     ; 381 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2676  003e 7b05          	ld	a,(OFST+5,sp)
2677  0040 5f            	clrw	x
2678  0041 97            	ld	xl,a
2679  0042 89            	pushw	x
2680  0043 3b005f        	push	_UART2_Send_Buf+5
2681  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2682  0049 cd0000        	call	_Check_Sum
2684  004c 5b01          	addw	sp,#1
2685  004e 85            	popw	x
2686  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2687                     ; 382 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2689  0052 7b05          	ld	a,(OFST+5,sp)
2690  0054 5f            	clrw	x
2691  0055 97            	ld	xl,a
2692  0056 1c0007        	addw	x,#7
2693  0059 89            	pushw	x
2694  005a ae005a        	ldw	x,#_UART2_Send_Buf
2695  005d cd0000        	call	_Uart2_Send
2697  0060 85            	popw	x
2699  0061               L1421:
2700                     ; 383 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2702  0061 725d0057      	tnz	_Uart2_Send_Done
2703  0065 27fa          	jreq	L1421
2706  0067 725f0057      	clr	_Uart2_Send_Done
2707                     ; 384 }
2710  006b 85            	popw	x
2711  006c 81            	ret
2763                     ; 390 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
2763                     ; 391 {
2764                     .text:	section	.text,new
2765  0000               _sicp_receipt_OK:
2767  0000 5237          	subw	sp,#55
2768       00000037      OFST:	set	55
2771                     ; 393 	receipt.frame_h1 = 0xEE;
2773  0002 a6ee          	ld	a,#238
2774  0004 6b01          	ld	(OFST-54,sp),a
2775                     ; 394 	receipt.frame_h2 = 0xAA;
2777  0006 a6aa          	ld	a,#170
2778  0008 6b02          	ld	(OFST-53,sp),a
2779                     ; 395 	receipt.message_id = send_message_id;
2781  000a 9f            	ld	a,xl
2782  000b 6b03          	ld	(OFST-52,sp),a
2783                     ; 396 	receipt.mesh_id_H = ns_host_meshid_H;
2785  000d c60089        	ld	a,_ns_host_meshid_H
2786  0010 6b04          	ld	(OFST-51,sp),a
2787                     ; 397 	receipt.mesh_id_L = ns_host_meshid_L;
2789  0012 c60088        	ld	a,_ns_host_meshid_L
2790  0015 6b05          	ld	(OFST-50,sp),a
2791                     ; 398 	receipt.payload[0] = 0xAA;
2793  0017 a6aa          	ld	a,#170
2794  0019 6b06          	ld	(OFST-49,sp),a
2795                     ; 399 	receipt.payload[1] = type;
2797  001b 9e            	ld	a,xh
2798  001c 6b07          	ld	(OFST-48,sp),a
2799                     ; 400 	sicp_send_message(&receipt,2);
2801  001e 4b02          	push	#2
2802  0020 96            	ldw	x,sp
2803  0021 1c0002        	addw	x,#OFST-53
2804  0024 cd0000        	call	_sicp_send_message
2806  0027 84            	pop	a
2807                     ; 401 }
2810  0028 5b37          	addw	sp,#55
2811  002a 81            	ret
2885                     ; 403 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
2885                     ; 404 {
2886                     .text:	section	.text,new
2887  0000               _sicp_receipt_Done:
2889  0000 89            	pushw	x
2890  0001 5238          	subw	sp,#56
2891       00000038      OFST:	set	56
2894                     ; 405 	u8 i = 0;
2896  0003 0f38          	clr	(OFST+0,sp)
2897                     ; 407 	receipt.frame_h1 = 0xEE;
2899  0005 a6ee          	ld	a,#238
2900  0007 6b01          	ld	(OFST-55,sp),a
2901                     ; 408 	receipt.frame_h2 = 0xAA;
2903  0009 a6aa          	ld	a,#170
2904  000b 6b02          	ld	(OFST-54,sp),a
2905                     ; 409 	receipt.message_id = send_message_id;
2907  000d 9f            	ld	a,xl
2908  000e 6b03          	ld	(OFST-53,sp),a
2909                     ; 410 	receipt.mesh_id_H = ns_host_meshid_H;
2911  0010 c60089        	ld	a,_ns_host_meshid_H
2912  0013 6b04          	ld	(OFST-52,sp),a
2913                     ; 411 	receipt.mesh_id_L = ns_host_meshid_L;
2915  0015 c60088        	ld	a,_ns_host_meshid_L
2916  0018 6b05          	ld	(OFST-51,sp),a
2917                     ; 412 	receipt.payload[0] = 0xAA;
2919  001a a6aa          	ld	a,#170
2920  001c 6b06          	ld	(OFST-50,sp),a
2921                     ; 413 	receipt.payload[1] = type;
2923  001e 9e            	ld	a,xh
2924  001f 6b07          	ld	(OFST-49,sp),a
2925                     ; 414 	switch(method){
2927  0021 7b3f          	ld	a,(OFST+7,sp)
2929                     ; 441 		default:
2929                     ; 442 		break;
2930  0023 4a            	dec	a
2931  0024 2707          	jreq	L7621
2932  0026 4a            	dec	a
2933  0027 2766          	jreq	L1721
2934  0029 acef00ef      	jpf	L7231
2935  002d               L7621:
2936                     ; 415 		case 0x01://action Dimmer调光的执行回执
2936                     ; 416 		receipt.payload[2] = mdid;
2938  002d 7b40          	ld	a,(OFST+8,sp)
2939  002f 6b08          	ld	(OFST-48,sp),a
2940                     ; 417 		for(i = 0;i < 15;i++){
2942  0031 0f38          	clr	(OFST+0,sp)
2943  0033               L1331:
2944                     ; 418 			if(sc.slc[i].MDID == mdid){
2946  0033 7b38          	ld	a,(OFST+0,sp)
2947  0035 97            	ld	xl,a
2948  0036 a61a          	ld	a,#26
2949  0038 42            	mul	x,a
2950  0039 7b40          	ld	a,(OFST+8,sp)
2951  003b 905f          	clrw	y
2952  003d 9097          	ld	yl,a
2953  003f 90bf00        	ldw	c_y,y
2954  0042 9093          	ldw	y,x
2955  0044 90de025f      	ldw	y,(_sc+464,y)
2956  0048 90b300        	cpw	y,c_y
2957  004b 2638          	jrne	L7331
2958                     ; 419 				receipt.payload[3] = sc.slc[i].ch1_status;
2960  004d 7b38          	ld	a,(OFST+0,sp)
2961  004f 97            	ld	xl,a
2962  0050 a61a          	ld	a,#26
2963  0052 42            	mul	x,a
2964  0053 d60261        	ld	a,(_sc+466,x)
2965  0056 6b09          	ld	(OFST-47,sp),a
2966                     ; 420 				receipt.payload[4] = sc.slc[i].ch2_status;
2968  0058 7b38          	ld	a,(OFST+0,sp)
2969  005a 97            	ld	xl,a
2970  005b a61a          	ld	a,#26
2971  005d 42            	mul	x,a
2972  005e d60262        	ld	a,(_sc+467,x)
2973  0061 6b0a          	ld	(OFST-46,sp),a
2974                     ; 421 				receipt.payload[5] = sc.slc[i].ch3_status;
2976  0063 7b38          	ld	a,(OFST+0,sp)
2977  0065 97            	ld	xl,a
2978  0066 a61a          	ld	a,#26
2979  0068 42            	mul	x,a
2980  0069 d60263        	ld	a,(_sc+468,x)
2981  006c 6b0b          	ld	(OFST-45,sp),a
2982                     ; 422 				receipt.payload[6] = sc.slc[i].ch4_status;
2984  006e 7b38          	ld	a,(OFST+0,sp)
2985  0070 97            	ld	xl,a
2986  0071 a61a          	ld	a,#26
2987  0073 42            	mul	x,a
2988  0074 d60264        	ld	a,(_sc+469,x)
2989  0077 6b0c          	ld	(OFST-44,sp),a
2990                     ; 423 				sicp_send_message(&receipt,7);
2992  0079 4b07          	push	#7
2993  007b 96            	ldw	x,sp
2994  007c 1c0002        	addw	x,#OFST-54
2995  007f cd0000        	call	_sicp_send_message
2997  0082 84            	pop	a
2998                     ; 424 				break;
3000  0083 206a          	jra	L7231
3001  0085               L7331:
3002                     ; 417 		for(i = 0;i < 15;i++){
3004  0085 0c38          	inc	(OFST+0,sp)
3007  0087 7b38          	ld	a,(OFST+0,sp)
3008  0089 a10f          	cp	a,#15
3009  008b 25a6          	jrult	L1331
3010  008d 2060          	jra	L7231
3011  008f               L1721:
3012                     ; 428 		case 0x02://action plug switch打开或关闭开关的执行回执
3012                     ; 429 		receipt.payload[2] = mdid;
3014  008f 7b40          	ld	a,(OFST+8,sp)
3015  0091 6b08          	ld	(OFST-48,sp),a
3016                     ; 430 		for(i = 0;i < 15;i++){
3018  0093 0f38          	clr	(OFST+0,sp)
3019  0095               L1431:
3020                     ; 431 			if(sc.spc[i].MDID == mdid){
3022  0095 7b38          	ld	a,(OFST+0,sp)
3023  0097 97            	ld	xl,a
3024  0098 a61c          	ld	a,#28
3025  009a 42            	mul	x,a
3026  009b 7b40          	ld	a,(OFST+8,sp)
3027  009d 905f          	clrw	y
3028  009f 9097          	ld	yl,a
3029  00a1 90bf00        	ldw	c_y,y
3030  00a4 9093          	ldw	y,x
3031  00a6 90de00bb      	ldw	y,(_sc+44,y)
3032  00aa 90b300        	cpw	y,c_y
3033  00ad 2638          	jrne	L7431
3034                     ; 432 				receipt.payload[3] = sc.spc[i].ch1_status;
3036  00af 7b38          	ld	a,(OFST+0,sp)
3037  00b1 97            	ld	xl,a
3038  00b2 a61c          	ld	a,#28
3039  00b4 42            	mul	x,a
3040  00b5 d600bd        	ld	a,(_sc+46,x)
3041  00b8 6b09          	ld	(OFST-47,sp),a
3042                     ; 433 				receipt.payload[4] = sc.spc[i].ch2_status;
3044  00ba 7b38          	ld	a,(OFST+0,sp)
3045  00bc 97            	ld	xl,a
3046  00bd a61c          	ld	a,#28
3047  00bf 42            	mul	x,a
3048  00c0 d600be        	ld	a,(_sc+47,x)
3049  00c3 6b0a          	ld	(OFST-46,sp),a
3050                     ; 434 				receipt.payload[5] = sc.spc[i].ch3_status;
3052  00c5 7b38          	ld	a,(OFST+0,sp)
3053  00c7 97            	ld	xl,a
3054  00c8 a61c          	ld	a,#28
3055  00ca 42            	mul	x,a
3056  00cb d600bf        	ld	a,(_sc+48,x)
3057  00ce 6b0b          	ld	(OFST-45,sp),a
3058                     ; 435 				receipt.payload[6] = sc.spc[i].ch4_status;
3060  00d0 7b38          	ld	a,(OFST+0,sp)
3061  00d2 97            	ld	xl,a
3062  00d3 a61c          	ld	a,#28
3063  00d5 42            	mul	x,a
3064  00d6 d600c0        	ld	a,(_sc+49,x)
3065  00d9 6b0c          	ld	(OFST-44,sp),a
3066                     ; 436 				sicp_send_message(&receipt,7);
3068  00db 4b07          	push	#7
3069  00dd 96            	ldw	x,sp
3070  00de 1c0002        	addw	x,#OFST-54
3071  00e1 cd0000        	call	_sicp_send_message
3073  00e4 84            	pop	a
3074                     ; 437 				break;
3076  00e5 2008          	jra	L7231
3077  00e7               L7431:
3078                     ; 430 		for(i = 0;i < 15;i++){
3080  00e7 0c38          	inc	(OFST+0,sp)
3083  00e9 7b38          	ld	a,(OFST+0,sp)
3084  00eb a10f          	cp	a,#15
3085  00ed 25a6          	jrult	L1431
3086  00ef               L3721:
3087                     ; 441 		default:
3087                     ; 442 		break;
3089  00ef               L7231:
3090                     ; 444 }
3093  00ef 5b3a          	addw	sp,#58
3094  00f1 81            	ret
3148                     ; 447 void rev_cmd_data(u8 moduleid){
3149                     .text:	section	.text,new
3150  0000               _rev_cmd_data:
3152  0000 88            	push	a
3153  0001 5238          	subw	sp,#56
3154       00000038      OFST:	set	56
3157                     ; 450 	for(i = 0;i < 15;i++){
3159  0003 0f01          	clr	(OFST-55,sp)
3160  0005               L3731:
3161                     ; 451 		if(sc.slc[i].MDID == moduleid){
3163  0005 7b01          	ld	a,(OFST-55,sp)
3164  0007 97            	ld	xl,a
3165  0008 a61a          	ld	a,#26
3166  000a 42            	mul	x,a
3167  000b 7b39          	ld	a,(OFST+1,sp)
3168  000d 905f          	clrw	y
3169  000f 9097          	ld	yl,a
3170  0011 90bf00        	ldw	c_y,y
3171  0014 9093          	ldw	y,x
3172  0016 90de025f      	ldw	y,(_sc+464,y)
3173  001a 90b300        	cpw	y,c_y
3174  001d 2657          	jrne	L1041
3175                     ; 452 			cmd_data.frame_h1 = 0xEE;
3177  001f a6ee          	ld	a,#238
3178  0021 6b02          	ld	(OFST-54,sp),a
3179                     ; 453 			cmd_data.frame_h2 = 0xAA;
3181  0023 a6aa          	ld	a,#170
3182  0025 6b03          	ld	(OFST-53,sp),a
3183                     ; 454 			cmd_data.message_id = rev_message_id;
3185  0027 c60087        	ld	a,_rev_message_id
3186  002a 6b04          	ld	(OFST-52,sp),a
3187                     ; 455 			cmd_data.mesh_id_H = ns_host_meshid_H;
3189  002c c60089        	ld	a,_ns_host_meshid_H
3190  002f 6b05          	ld	(OFST-51,sp),a
3191                     ; 456 			cmd_data.mesh_id_L = ns_host_meshid_L;
3193  0031 c60088        	ld	a,_ns_host_meshid_L
3194  0034 6b06          	ld	(OFST-50,sp),a
3195                     ; 457 			cmd_data.payload[0] = 0x06;
3197  0036 a606          	ld	a,#6
3198  0038 6b07          	ld	(OFST-49,sp),a
3199                     ; 458 			cmd_data.payload[1] = moduleid;
3201  003a 7b39          	ld	a,(OFST+1,sp)
3202  003c 6b08          	ld	(OFST-48,sp),a
3203                     ; 459 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3205  003e 7b01          	ld	a,(OFST-55,sp)
3206  0040 97            	ld	xl,a
3207  0041 a61a          	ld	a,#26
3208  0043 42            	mul	x,a
3209  0044 d60261        	ld	a,(_sc+466,x)
3210  0047 6b09          	ld	(OFST-47,sp),a
3211                     ; 460 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3213  0049 7b01          	ld	a,(OFST-55,sp)
3214  004b 97            	ld	xl,a
3215  004c a61a          	ld	a,#26
3216  004e 42            	mul	x,a
3217  004f d60262        	ld	a,(_sc+467,x)
3218  0052 6b0a          	ld	(OFST-46,sp),a
3219                     ; 461 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3221  0054 7b01          	ld	a,(OFST-55,sp)
3222  0056 97            	ld	xl,a
3223  0057 a61a          	ld	a,#26
3224  0059 42            	mul	x,a
3225  005a d60263        	ld	a,(_sc+468,x)
3226  005d 6b0b          	ld	(OFST-45,sp),a
3227                     ; 462 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3229  005f 7b01          	ld	a,(OFST-55,sp)
3230  0061 97            	ld	xl,a
3231  0062 a61a          	ld	a,#26
3232  0064 42            	mul	x,a
3233  0065 d60264        	ld	a,(_sc+469,x)
3234  0068 6b0c          	ld	(OFST-44,sp),a
3235                     ; 463 			sicp_send_message(&cmd_data,6);
3237  006a 4b06          	push	#6
3238  006c 96            	ldw	x,sp
3239  006d 1c0003        	addw	x,#OFST-53
3240  0070 cd0000        	call	_sicp_send_message
3242  0073 84            	pop	a
3243                     ; 464 			break;
3245  0074 207c          	jra	L7731
3246  0076               L1041:
3247                     ; 466 		if(sc.spc[i].MDID == moduleid){
3249  0076 7b01          	ld	a,(OFST-55,sp)
3250  0078 97            	ld	xl,a
3251  0079 a61c          	ld	a,#28
3252  007b 42            	mul	x,a
3253  007c 7b39          	ld	a,(OFST+1,sp)
3254  007e 905f          	clrw	y
3255  0080 9097          	ld	yl,a
3256  0082 90bf00        	ldw	c_y,y
3257  0085 9093          	ldw	y,x
3258  0087 90de00bb      	ldw	y,(_sc+44,y)
3259  008b 90b300        	cpw	y,c_y
3260  008e 2657          	jrne	L3041
3261                     ; 467 			cmd_data.frame_h1 = 0xEE;
3263  0090 a6ee          	ld	a,#238
3264  0092 6b02          	ld	(OFST-54,sp),a
3265                     ; 468 			cmd_data.frame_h2 = 0xAA;
3267  0094 a6aa          	ld	a,#170
3268  0096 6b03          	ld	(OFST-53,sp),a
3269                     ; 469 			cmd_data.message_id = rev_message_id;
3271  0098 c60087        	ld	a,_rev_message_id
3272  009b 6b04          	ld	(OFST-52,sp),a
3273                     ; 470 			cmd_data.mesh_id_H = ns_host_meshid_H;
3275  009d c60089        	ld	a,_ns_host_meshid_H
3276  00a0 6b05          	ld	(OFST-51,sp),a
3277                     ; 471 			cmd_data.mesh_id_L = ns_host_meshid_L;
3279  00a2 c60088        	ld	a,_ns_host_meshid_L
3280  00a5 6b06          	ld	(OFST-50,sp),a
3281                     ; 472 			cmd_data.payload[0] = 0x06;
3283  00a7 a606          	ld	a,#6
3284  00a9 6b07          	ld	(OFST-49,sp),a
3285                     ; 473 			cmd_data.payload[1] = moduleid;
3287  00ab 7b39          	ld	a,(OFST+1,sp)
3288  00ad 6b08          	ld	(OFST-48,sp),a
3289                     ; 474 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3291  00af 7b01          	ld	a,(OFST-55,sp)
3292  00b1 97            	ld	xl,a
3293  00b2 a61c          	ld	a,#28
3294  00b4 42            	mul	x,a
3295  00b5 d600bd        	ld	a,(_sc+46,x)
3296  00b8 6b09          	ld	(OFST-47,sp),a
3297                     ; 475 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3299  00ba 7b01          	ld	a,(OFST-55,sp)
3300  00bc 97            	ld	xl,a
3301  00bd a61c          	ld	a,#28
3302  00bf 42            	mul	x,a
3303  00c0 d600be        	ld	a,(_sc+47,x)
3304  00c3 6b0a          	ld	(OFST-46,sp),a
3305                     ; 476 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3307  00c5 7b01          	ld	a,(OFST-55,sp)
3308  00c7 97            	ld	xl,a
3309  00c8 a61c          	ld	a,#28
3310  00ca 42            	mul	x,a
3311  00cb d600bf        	ld	a,(_sc+48,x)
3312  00ce 6b0b          	ld	(OFST-45,sp),a
3313                     ; 477 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3315  00d0 7b01          	ld	a,(OFST-55,sp)
3316  00d2 97            	ld	xl,a
3317  00d3 a61c          	ld	a,#28
3318  00d5 42            	mul	x,a
3319  00d6 d600c0        	ld	a,(_sc+49,x)
3320  00d9 6b0c          	ld	(OFST-44,sp),a
3321                     ; 478 			sicp_send_message(&cmd_data,6);
3323  00db 4b06          	push	#6
3324  00dd 96            	ldw	x,sp
3325  00de 1c0003        	addw	x,#OFST-53
3326  00e1 cd0000        	call	_sicp_send_message
3328  00e4 84            	pop	a
3329                     ; 479 			break;
3331  00e5 200b          	jra	L7731
3332  00e7               L3041:
3333                     ; 450 	for(i = 0;i < 15;i++){
3335  00e7 0c01          	inc	(OFST-55,sp)
3338  00e9 7b01          	ld	a,(OFST-55,sp)
3339  00eb a10f          	cp	a,#15
3340  00ed 2403          	jruge	L611
3341  00ef cc0005        	jp	L3731
3342  00f2               L611:
3343  00f2               L7731:
3344                     ; 482 }
3347  00f2 5b39          	addw	sp,#57
3348  00f4 81            	ret
3351                     	switch	.data
3352  0000               L5041_eg_timeout:
3353  0000 0000          	dc.w	0
3408                     ; 485 void report_energy_consum(void){
3409                     .text:	section	.text,new
3410  0000               _report_energy_consum:
3412  0000 5238          	subw	sp,#56
3413       00000038      OFST:	set	56
3416                     ; 489 	systime_count[3]++;
3418  0002 ce0006        	ldw	x,_systime_count+6
3419  0005 1c0001        	addw	x,#1
3420  0008 cf0006        	ldw	_systime_count+6,x
3421                     ; 490 	if(systime_count[3] >= 60){
3423  000b ce0006        	ldw	x,_systime_count+6
3424  000e a3003c        	cpw	x,#60
3425  0011 2403          	jruge	L221
3426  0013 cc00a2        	jp	L1341
3427  0016               L221:
3428                     ; 491 		systime_count[3] = 0;
3430  0016 5f            	clrw	x
3431  0017 cf0006        	ldw	_systime_count+6,x
3432                     ; 492 		systime_count[4]++;
3434  001a ce0008        	ldw	x,_systime_count+8
3435  001d 1c0001        	addw	x,#1
3436  0020 cf0008        	ldw	_systime_count+8,x
3437                     ; 493 		if(systime_count[4] >= 30){
3439  0023 ce0008        	ldw	x,_systime_count+8
3440  0026 a3001e        	cpw	x,#30
3441  0029 2577          	jrult	L1341
3442                     ; 494 			systime_count[4] = 0;
3444  002b 5f            	clrw	x
3445  002c cf0008        	ldw	_systime_count+8,x
3446                     ; 495 			i2c_get_energy_consum();
3448  002f cd0000        	call	_i2c_get_energy_consum
3450                     ; 496 			for(i = 0; i < 15; i++){
3452  0032 0f01          	clr	(OFST-55,sp)
3453  0034               L5341:
3454                     ; 497 				if(sc.spc[i].MDID){//有ID说明SPC存在
3456  0034 7b01          	ld	a,(OFST-55,sp)
3457  0036 97            	ld	xl,a
3458  0037 a61c          	ld	a,#28
3459  0039 42            	mul	x,a
3460  003a d600bc        	ld	a,(_sc+45,x)
3461  003d da00bb        	or	a,(_sc+44,x)
3462  0040 2758          	jreq	L3441
3463                     ; 498 				ec.frame_h1 = 0xEE;
3465  0042 a6ee          	ld	a,#238
3466  0044 6b02          	ld	(OFST-54,sp),a
3467                     ; 499 				ec.frame_h2 = 0xEE;
3469  0046 a6ee          	ld	a,#238
3470  0048 6b03          	ld	(OFST-53,sp),a
3471                     ; 500 				ec.message_id = i+1;
3473  004a 7b01          	ld	a,(OFST-55,sp)
3474  004c 4c            	inc	a
3475  004d 6b04          	ld	(OFST-52,sp),a
3476                     ; 501 				ec.mesh_id_H = ns_host_meshid_H;
3478  004f c60089        	ld	a,_ns_host_meshid_H
3479  0052 6b05          	ld	(OFST-51,sp),a
3480                     ; 502 				ec.mesh_id_L = ns_host_meshid_L;
3482  0054 c60088        	ld	a,_ns_host_meshid_L
3483  0057 6b06          	ld	(OFST-50,sp),a
3484                     ; 503 				ec.payload[0] = 0x2A;
3486  0059 a62a          	ld	a,#42
3487  005b 6b07          	ld	(OFST-49,sp),a
3488                     ; 504 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3490  005d 7b01          	ld	a,(OFST-55,sp)
3491  005f 97            	ld	xl,a
3492  0060 a61c          	ld	a,#28
3493  0062 42            	mul	x,a
3494  0063 de00c1        	ldw	x,(_sc+50,x)
3495  0066 01            	rrwa	x,a
3496  0067 9f            	ld	a,xl
3497  0068 a4ff          	and	a,#255
3498  006a 97            	ld	xl,a
3499  006b 4f            	clr	a
3500  006c 02            	rlwa	x,a
3501  006d 4f            	clr	a
3502  006e 01            	rrwa	x,a
3503  006f 9f            	ld	a,xl
3504  0070 6b08          	ld	(OFST-48,sp),a
3505                     ; 505 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3507  0072 7b01          	ld	a,(OFST-55,sp)
3508  0074 97            	ld	xl,a
3509  0075 a61c          	ld	a,#28
3510  0077 42            	mul	x,a
3511  0078 d600c2        	ld	a,(_sc+51,x)
3512  007b a4ff          	and	a,#255
3513  007d 6b09          	ld	(OFST-47,sp),a
3514                     ; 506 				ec.payload[3] =	sc.spc[i].MDID;
3516  007f 7b01          	ld	a,(OFST-55,sp)
3517  0081 97            	ld	xl,a
3518  0082 a61c          	ld	a,#28
3519  0084 42            	mul	x,a
3520  0085 d600bc        	ld	a,(_sc+45,x)
3521  0088 6b0a          	ld	(OFST-46,sp),a
3522                     ; 507 				sicp_send_message(&ec,4);
3524  008a 4b04          	push	#4
3525  008c 96            	ldw	x,sp
3526  008d 1c0003        	addw	x,#OFST-53
3527  0090 cd0000        	call	_sicp_send_message
3529  0093 84            	pop	a
3530                     ; 508 				eg_timeout = 5;
3532  0094 ae0005        	ldw	x,#5
3533  0097 cf0000        	ldw	L5041_eg_timeout,x
3534  009a               L3441:
3535                     ; 496 			for(i = 0; i < 15; i++){
3537  009a 0c01          	inc	(OFST-55,sp)
3540  009c 7b01          	ld	a,(OFST-55,sp)
3541  009e a10f          	cp	a,#15
3542  00a0 2592          	jrult	L5341
3543  00a2               L1341:
3544                     ; 514 	if(eg_timeout){
3546  00a2 ce0000        	ldw	x,L5041_eg_timeout
3547  00a5 2603          	jrne	L421
3548  00a7 cc0135        	jp	L5441
3549  00aa               L421:
3550                     ; 515 		if(--eg_timeout == 0){
3552  00aa ce0000        	ldw	x,L5041_eg_timeout
3553  00ad 1d0001        	subw	x,#1
3554  00b0 cf0000        	ldw	L5041_eg_timeout,x
3555  00b3 26f2          	jrne	L5441
3556                     ; 516 			for(i = 0;i < 15;i++){
3558  00b5 0f01          	clr	(OFST-55,sp)
3559  00b7               L1541:
3560                     ; 517 			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3562  00b7 7b01          	ld	a,(OFST-55,sp)
3563  00b9 97            	ld	xl,a
3564  00ba a61c          	ld	a,#28
3565  00bc 42            	mul	x,a
3566  00bd d600bc        	ld	a,(_sc+45,x)
3567  00c0 da00bb        	or	a,(_sc+44,x)
3568  00c3 2768          	jreq	L7541
3570  00c5 7b01          	ld	a,(OFST-55,sp)
3571  00c7 97            	ld	xl,a
3572  00c8 a61c          	ld	a,#28
3573  00ca 42            	mul	x,a
3574  00cb d600c3        	ld	a,(_sc+52,x)
3575  00ce a501          	bcp	a,#1
3576  00d0 265b          	jrne	L7541
3577                     ; 518 				ec.frame_h1 = 0xEE;
3579  00d2 a6ee          	ld	a,#238
3580  00d4 6b02          	ld	(OFST-54,sp),a
3581                     ; 519 				ec.frame_h2 = 0xEE;
3583  00d6 a6ee          	ld	a,#238
3584  00d8 6b03          	ld	(OFST-53,sp),a
3585                     ; 520 				ec.message_id = random(TIM4->CNTR);
3587  00da c65344        	ld	a,21316
3588  00dd cd0000        	call	_random
3590  00e0 6b04          	ld	(OFST-52,sp),a
3591                     ; 521 				ec.mesh_id_H = ns_host_meshid_H;
3593  00e2 c60089        	ld	a,_ns_host_meshid_H
3594  00e5 6b05          	ld	(OFST-51,sp),a
3595                     ; 522 				ec.mesh_id_L = ns_host_meshid_L;
3597  00e7 c60088        	ld	a,_ns_host_meshid_L
3598  00ea 6b06          	ld	(OFST-50,sp),a
3599                     ; 523 				ec.payload[0] = 0x2A;
3601  00ec a62a          	ld	a,#42
3602  00ee 6b07          	ld	(OFST-49,sp),a
3603                     ; 524 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3605  00f0 7b01          	ld	a,(OFST-55,sp)
3606  00f2 97            	ld	xl,a
3607  00f3 a61c          	ld	a,#28
3608  00f5 42            	mul	x,a
3609  00f6 de00c1        	ldw	x,(_sc+50,x)
3610  00f9 01            	rrwa	x,a
3611  00fa 9f            	ld	a,xl
3612  00fb a4ff          	and	a,#255
3613  00fd 97            	ld	xl,a
3614  00fe 4f            	clr	a
3615  00ff 02            	rlwa	x,a
3616  0100 4f            	clr	a
3617  0101 01            	rrwa	x,a
3618  0102 9f            	ld	a,xl
3619  0103 6b08          	ld	(OFST-48,sp),a
3620                     ; 525 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3622  0105 7b01          	ld	a,(OFST-55,sp)
3623  0107 97            	ld	xl,a
3624  0108 a61c          	ld	a,#28
3625  010a 42            	mul	x,a
3626  010b d600c2        	ld	a,(_sc+51,x)
3627  010e a4ff          	and	a,#255
3628  0110 6b09          	ld	(OFST-47,sp),a
3629                     ; 526 				ec.payload[3] =	sc.spc[i].MDID;
3631  0112 7b01          	ld	a,(OFST-55,sp)
3632  0114 97            	ld	xl,a
3633  0115 a61c          	ld	a,#28
3634  0117 42            	mul	x,a
3635  0118 d600bc        	ld	a,(_sc+45,x)
3636  011b 6b0a          	ld	(OFST-46,sp),a
3637                     ; 527 				sicp_send_message(&ec,4);
3639  011d 4b04          	push	#4
3640  011f 96            	ldw	x,sp
3641  0120 1c0003        	addw	x,#OFST-53
3642  0123 cd0000        	call	_sicp_send_message
3644  0126 84            	pop	a
3645                     ; 528 				eg_timeout = 5;//每5s重发1次直到接收到回执为止
3647  0127 ae0005        	ldw	x,#5
3648  012a cf0000        	ldw	L5041_eg_timeout,x
3649  012d               L7541:
3650                     ; 516 			for(i = 0;i < 15;i++){
3652  012d 0c01          	inc	(OFST-55,sp)
3655  012f 7b01          	ld	a,(OFST-55,sp)
3656  0131 a10f          	cp	a,#15
3657  0133 2582          	jrult	L1541
3658  0135               L5441:
3659                     ; 533 }
3662  0135 5b38          	addw	sp,#56
3663  0137 81            	ret
3703                     ; 536 void send_sc_device_info(void)
3703                     ; 537 {
3704                     .text:	section	.text,new
3705  0000               _send_sc_device_info:
3707  0000 5237          	subw	sp,#55
3708       00000037      OFST:	set	55
3711                     ; 540 	di.frame_h1 = 0xEE;
3713  0002 a6ee          	ld	a,#238
3714  0004 6b01          	ld	(OFST-54,sp),a
3715                     ; 541 	di.frame_h2 = 0xEE;
3717  0006 a6ee          	ld	a,#238
3718  0008 6b02          	ld	(OFST-53,sp),a
3719                     ; 542 	di.message_id = 16;
3721  000a a610          	ld	a,#16
3722  000c 6b03          	ld	(OFST-52,sp),a
3723                     ; 543 	di.mesh_id_H = ns_host_meshid_H;
3725  000e c60089        	ld	a,_ns_host_meshid_H
3726  0011 6b04          	ld	(OFST-51,sp),a
3727                     ; 544 	di.mesh_id_L = ns_host_meshid_L;
3729  0013 c60088        	ld	a,_ns_host_meshid_L
3730  0016 6b05          	ld	(OFST-50,sp),a
3731                     ; 545 	di.payload[0] = 0xB1;
3733  0018 a6b1          	ld	a,#177
3734  001a 6b06          	ld	(OFST-49,sp),a
3735                     ; 546 	di.payload[1] =	sc.deviceid[0];
3737  001c c60091        	ld	a,_sc+2
3738  001f 6b07          	ld	(OFST-48,sp),a
3739                     ; 547 	di.payload[2] =	sc.deviceid[1];
3741  0021 c60092        	ld	a,_sc+3
3742  0024 6b08          	ld	(OFST-47,sp),a
3743                     ; 548 	di.payload[3] =	sc.deviceid[2];
3745  0026 c60093        	ld	a,_sc+4
3746  0029 6b09          	ld	(OFST-46,sp),a
3747                     ; 549 	di.payload[4] =	sc.deviceid[3];
3749  002b c60094        	ld	a,_sc+5
3750  002e 6b0a          	ld	(OFST-45,sp),a
3751                     ; 550 	di.payload[5] =	sc.model;
3753  0030 c60097        	ld	a,_sc+8
3754  0033 6b0b          	ld	(OFST-44,sp),a
3755                     ; 551 	di.payload[6] = sc.firmware;
3757  0035 c60095        	ld	a,_sc+6
3758  0038 6b0c          	ld	(OFST-43,sp),a
3759                     ; 552 	di.payload[7] = sc.HWTtest;
3761  003a c60096        	ld	a,_sc+7
3762  003d 6b0d          	ld	(OFST-42,sp),a
3763                     ; 553 	di.payload[8] = sc.Ndevice;
3765  003f c600a2        	ld	a,_sc+19
3766  0042 6b0e          	ld	(OFST-41,sp),a
3767                     ; 554 	sicp_send_message(&di,9);
3769  0044 4b09          	push	#9
3770  0046 96            	ldw	x,sp
3771  0047 1c0002        	addw	x,#OFST-53
3772  004a cd0000        	call	_sicp_send_message
3774  004d 84            	pop	a
3775                     ; 555 }
3778  004e 5b37          	addw	sp,#55
3779  0050 81            	ret
3826                     ; 557 void send_slc_device_info(u8 i)
3826                     ; 558 {
3827                     .text:	section	.text,new
3828  0000               _send_slc_device_info:
3830  0000 88            	push	a
3831  0001 5237          	subw	sp,#55
3832       00000037      OFST:	set	55
3835                     ; 560 	di.frame_h1 = 0xEE;
3837  0003 a6ee          	ld	a,#238
3838  0005 6b01          	ld	(OFST-54,sp),a
3839                     ; 561 	di.frame_h2 = 0xEE;
3841  0007 a6ee          	ld	a,#238
3842  0009 6b02          	ld	(OFST-53,sp),a
3843                     ; 562 	di.message_id = 21+i;
3845  000b 7b38          	ld	a,(OFST+1,sp)
3846  000d ab15          	add	a,#21
3847  000f 6b03          	ld	(OFST-52,sp),a
3848                     ; 563 	di.mesh_id_H = ns_host_meshid_H;
3850  0011 c60089        	ld	a,_ns_host_meshid_H
3851  0014 6b04          	ld	(OFST-51,sp),a
3852                     ; 564 	di.mesh_id_L = ns_host_meshid_L;
3854  0016 c60088        	ld	a,_ns_host_meshid_L
3855  0019 6b05          	ld	(OFST-50,sp),a
3856                     ; 565 	di.payload[0] = 0xB2;
3858  001b a6b2          	ld	a,#178
3859  001d 6b06          	ld	(OFST-49,sp),a
3860                     ; 566 	di.payload[1] =	sc.slc[i].deviceid[0];
3862  001f 7b38          	ld	a,(OFST+1,sp)
3863  0021 97            	ld	xl,a
3864  0022 a61a          	ld	a,#26
3865  0024 42            	mul	x,a
3866  0025 d6024e        	ld	a,(_sc+447,x)
3867  0028 6b07          	ld	(OFST-48,sp),a
3868                     ; 567 	di.payload[2] =	sc.slc[i].deviceid[1];
3870  002a 7b38          	ld	a,(OFST+1,sp)
3871  002c 97            	ld	xl,a
3872  002d a61a          	ld	a,#26
3873  002f 42            	mul	x,a
3874  0030 d6024f        	ld	a,(_sc+448,x)
3875  0033 6b08          	ld	(OFST-47,sp),a
3876                     ; 568 	di.payload[3] =	sc.slc[i].deviceid[2];
3878  0035 7b38          	ld	a,(OFST+1,sp)
3879  0037 97            	ld	xl,a
3880  0038 a61a          	ld	a,#26
3881  003a 42            	mul	x,a
3882  003b d60250        	ld	a,(_sc+449,x)
3883  003e 6b09          	ld	(OFST-46,sp),a
3884                     ; 569 	di.payload[4] =	sc.slc[i].deviceid[3];
3886  0040 7b38          	ld	a,(OFST+1,sp)
3887  0042 97            	ld	xl,a
3888  0043 a61a          	ld	a,#26
3889  0045 42            	mul	x,a
3890  0046 d60251        	ld	a,(_sc+450,x)
3891  0049 6b0a          	ld	(OFST-45,sp),a
3892                     ; 570 	di.payload[5] =	sc.slc[i].model;
3894  004b 7b38          	ld	a,(OFST+1,sp)
3895  004d 97            	ld	xl,a
3896  004e a61a          	ld	a,#26
3897  0050 42            	mul	x,a
3898  0051 d60254        	ld	a,(_sc+453,x)
3899  0054 6b0b          	ld	(OFST-44,sp),a
3900                     ; 571 	di.payload[6] = sc.slc[i].firmware;
3902  0056 7b38          	ld	a,(OFST+1,sp)
3903  0058 97            	ld	xl,a
3904  0059 a61a          	ld	a,#26
3905  005b 42            	mul	x,a
3906  005c d60252        	ld	a,(_sc+451,x)
3907  005f 6b0c          	ld	(OFST-43,sp),a
3908                     ; 572 	di.payload[7] = sc.slc[i].HWTtest;
3910  0061 7b38          	ld	a,(OFST+1,sp)
3911  0063 97            	ld	xl,a
3912  0064 a61a          	ld	a,#26
3913  0066 42            	mul	x,a
3914  0067 d60253        	ld	a,(_sc+452,x)
3915  006a 6b0d          	ld	(OFST-42,sp),a
3916                     ; 573 	di.payload[8] = sc.slc[i].MDID;
3918  006c 7b38          	ld	a,(OFST+1,sp)
3919  006e 97            	ld	xl,a
3920  006f a61a          	ld	a,#26
3921  0071 42            	mul	x,a
3922  0072 d60260        	ld	a,(_sc+465,x)
3923  0075 6b0e          	ld	(OFST-41,sp),a
3924                     ; 574 	sicp_send_message(&di,9);
3926  0077 4b09          	push	#9
3927  0079 96            	ldw	x,sp
3928  007a 1c0002        	addw	x,#OFST-53
3929  007d cd0000        	call	_sicp_send_message
3931  0080 84            	pop	a
3932                     ; 575 }
3935  0081 5b38          	addw	sp,#56
3936  0083 81            	ret
3983                     ; 577 void send_spc_device_info(u8 i)
3983                     ; 578 {
3984                     .text:	section	.text,new
3985  0000               _send_spc_device_info:
3987  0000 88            	push	a
3988  0001 5237          	subw	sp,#55
3989       00000037      OFST:	set	55
3992                     ; 580 	di.frame_h1 = 0xEE;
3994  0003 a6ee          	ld	a,#238
3995  0005 6b01          	ld	(OFST-54,sp),a
3996                     ; 581 	di.frame_h2 = 0xEE;
3998  0007 a6ee          	ld	a,#238
3999  0009 6b02          	ld	(OFST-53,sp),a
4000                     ; 582 	di.message_id = 36+i;
4002  000b 7b38          	ld	a,(OFST+1,sp)
4003  000d ab24          	add	a,#36
4004  000f 6b03          	ld	(OFST-52,sp),a
4005                     ; 583 	di.mesh_id_H = ns_host_meshid_H;
4007  0011 c60089        	ld	a,_ns_host_meshid_H
4008  0014 6b04          	ld	(OFST-51,sp),a
4009                     ; 584 	di.mesh_id_L = ns_host_meshid_L;
4011  0016 c60088        	ld	a,_ns_host_meshid_L
4012  0019 6b05          	ld	(OFST-50,sp),a
4013                     ; 585 	di.payload[0] = 0xB3;
4015  001b a6b3          	ld	a,#179
4016  001d 6b06          	ld	(OFST-49,sp),a
4017                     ; 586 	di.payload[1] =	sc.spc[i].deviceid[0];
4019  001f 7b38          	ld	a,(OFST+1,sp)
4020  0021 97            	ld	xl,a
4021  0022 a61c          	ld	a,#28
4022  0024 42            	mul	x,a
4023  0025 d600aa        	ld	a,(_sc+27,x)
4024  0028 6b07          	ld	(OFST-48,sp),a
4025                     ; 587 	di.payload[2] =	sc.spc[i].deviceid[1];
4027  002a 7b38          	ld	a,(OFST+1,sp)
4028  002c 97            	ld	xl,a
4029  002d a61c          	ld	a,#28
4030  002f 42            	mul	x,a
4031  0030 d600ab        	ld	a,(_sc+28,x)
4032  0033 6b08          	ld	(OFST-47,sp),a
4033                     ; 588 	di.payload[3] =	sc.spc[i].deviceid[2];
4035  0035 7b38          	ld	a,(OFST+1,sp)
4036  0037 97            	ld	xl,a
4037  0038 a61c          	ld	a,#28
4038  003a 42            	mul	x,a
4039  003b d600ac        	ld	a,(_sc+29,x)
4040  003e 6b09          	ld	(OFST-46,sp),a
4041                     ; 589 	di.payload[4] =	sc.spc[i].deviceid[3];
4043  0040 7b38          	ld	a,(OFST+1,sp)
4044  0042 97            	ld	xl,a
4045  0043 a61c          	ld	a,#28
4046  0045 42            	mul	x,a
4047  0046 d600ad        	ld	a,(_sc+30,x)
4048  0049 6b0a          	ld	(OFST-45,sp),a
4049                     ; 590 	di.payload[5] =	sc.spc[i].model;
4051  004b 7b38          	ld	a,(OFST+1,sp)
4052  004d 97            	ld	xl,a
4053  004e a61c          	ld	a,#28
4054  0050 42            	mul	x,a
4055  0051 d600b0        	ld	a,(_sc+33,x)
4056  0054 6b0b          	ld	(OFST-44,sp),a
4057                     ; 591 	di.payload[6] = sc.spc[i].firmware;
4059  0056 7b38          	ld	a,(OFST+1,sp)
4060  0058 97            	ld	xl,a
4061  0059 a61c          	ld	a,#28
4062  005b 42            	mul	x,a
4063  005c d600ae        	ld	a,(_sc+31,x)
4064  005f 6b0c          	ld	(OFST-43,sp),a
4065                     ; 592 	di.payload[7] = sc.spc[i].HWTtest;
4067  0061 7b38          	ld	a,(OFST+1,sp)
4068  0063 97            	ld	xl,a
4069  0064 a61c          	ld	a,#28
4070  0066 42            	mul	x,a
4071  0067 d600af        	ld	a,(_sc+32,x)
4072  006a 6b0d          	ld	(OFST-42,sp),a
4073                     ; 593 	di.payload[8] = sc.spc[i].MDID;
4075  006c 7b38          	ld	a,(OFST+1,sp)
4076  006e 97            	ld	xl,a
4077  006f a61c          	ld	a,#28
4078  0071 42            	mul	x,a
4079  0072 d600bc        	ld	a,(_sc+45,x)
4080  0075 6b0e          	ld	(OFST-41,sp),a
4081                     ; 594 	sicp_send_message(&di,9);
4083  0077 4b09          	push	#9
4084  0079 96            	ldw	x,sp
4085  007a 1c0002        	addw	x,#OFST-53
4086  007d cd0000        	call	_sicp_send_message
4088  0080 84            	pop	a
4089                     ; 595 }
4092  0081 5b38          	addw	sp,#56
4093  0083 81            	ret
4130                     ; 597 void send_device_info(void)
4130                     ; 598 {
4131                     .text:	section	.text,new
4132  0000               _send_device_info:
4134  0000 88            	push	a
4135       00000001      OFST:	set	1
4138                     ; 601 	send_sc_device_info();
4140  0001 cd0000        	call	_send_sc_device_info
4142                     ; 603 	for(i = 0; i < 15;i++){
4144  0004 0f01          	clr	(OFST+0,sp)
4145  0006               L3551:
4146                     ; 604 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4148  0006 7b01          	ld	a,(OFST+0,sp)
4149  0008 97            	ld	xl,a
4150  0009 a61a          	ld	a,#26
4151  000b 42            	mul	x,a
4152  000c d60260        	ld	a,(_sc+465,x)
4153  000f da025f        	or	a,(_sc+464,x)
4154  0012 2705          	jreq	L1651
4155                     ; 605 			send_slc_device_info(i);
4157  0014 7b01          	ld	a,(OFST+0,sp)
4158  0016 cd0000        	call	_send_slc_device_info
4160  0019               L1651:
4161                     ; 603 	for(i = 0; i < 15;i++){
4163  0019 0c01          	inc	(OFST+0,sp)
4166  001b 7b01          	ld	a,(OFST+0,sp)
4167  001d a10f          	cp	a,#15
4168  001f 25e5          	jrult	L3551
4169                     ; 609 	for(i = 0; i < 15;i++){
4171  0021 0f01          	clr	(OFST+0,sp)
4172  0023               L3651:
4173                     ; 610 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4175  0023 7b01          	ld	a,(OFST+0,sp)
4176  0025 97            	ld	xl,a
4177  0026 a61c          	ld	a,#28
4178  0028 42            	mul	x,a
4179  0029 d600bc        	ld	a,(_sc+45,x)
4180  002c da00bb        	or	a,(_sc+44,x)
4181  002f 2705          	jreq	L1751
4182                     ; 611 			send_spc_device_info(i);
4184  0031 7b01          	ld	a,(OFST+0,sp)
4185  0033 cd0000        	call	_send_spc_device_info
4187  0036               L1751:
4188                     ; 609 	for(i = 0; i < 15;i++){
4190  0036 0c01          	inc	(OFST+0,sp)
4193  0038 7b01          	ld	a,(OFST+0,sp)
4194  003a a10f          	cp	a,#15
4195  003c 25e5          	jrult	L3651
4196                     ; 614 	di_timeout = 5;
4198  003e 35050001      	mov	_di_timeout,#5
4199                     ; 615 }
4202  0042 84            	pop	a
4203  0043 81            	ret
4249                     ; 618 void send_malfunction(void)
4249                     ; 619 {
4250                     .text:	section	.text,new
4251  0000               _send_malfunction:
4253  0000 5238          	subw	sp,#56
4254       00000038      OFST:	set	56
4257                     ; 623 	if((sc.HWTtest & 0xC0)!=0xC0){
4259  0002 c60096        	ld	a,_sc+7
4260  0005 a4c0          	and	a,#192
4261  0007 a1c0          	cp	a,#192
4262  0009 272f          	jreq	L3161
4263                     ; 624 		mal.frame_h1 = 0xEE;
4265  000b a6ee          	ld	a,#238
4266  000d 6b02          	ld	(OFST-54,sp),a
4267                     ; 625 		mal.frame_h2 = 0xEE;
4269  000f a6ee          	ld	a,#238
4270  0011 6b03          	ld	(OFST-53,sp),a
4271                     ; 626 		mal.message_id = 17;
4273  0013 a611          	ld	a,#17
4274  0015 6b04          	ld	(OFST-52,sp),a
4275                     ; 627 		mal.mesh_id_H = ns_host_meshid_H;
4277  0017 c60089        	ld	a,_ns_host_meshid_H
4278  001a 6b05          	ld	(OFST-51,sp),a
4279                     ; 628 		mal.mesh_id_L = ns_host_meshid_L;
4281  001c c60088        	ld	a,_ns_host_meshid_L
4282  001f 6b06          	ld	(OFST-50,sp),a
4283                     ; 629 		mal.payload[0] = 0x0A;
4285  0021 a60a          	ld	a,#10
4286  0023 6b07          	ld	(OFST-49,sp),a
4287                     ; 630 		mal.payload[1] = 0xB1;
4289  0025 a6b1          	ld	a,#177
4290  0027 6b08          	ld	(OFST-48,sp),a
4291                     ; 631 		mal.payload[2] =	0x00;
4293  0029 0f09          	clr	(OFST-47,sp)
4294                     ; 632 		mal.payload[3] =	sc.HWTtest;
4296  002b c60096        	ld	a,_sc+7
4297  002e 6b0a          	ld	(OFST-46,sp),a
4298                     ; 633 		sicp_send_message(&mal,4);
4300  0030 4b04          	push	#4
4301  0032 96            	ldw	x,sp
4302  0033 1c0003        	addw	x,#OFST-53
4303  0036 cd0000        	call	_sicp_send_message
4305  0039 84            	pop	a
4306  003a               L3161:
4307                     ; 636 	for(i = 0; i < 15;i++){
4309  003a 0f01          	clr	(OFST-55,sp)
4310  003c               L5161:
4311                     ; 637 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4313  003c 7b01          	ld	a,(OFST-55,sp)
4314  003e 97            	ld	xl,a
4315  003f a61a          	ld	a,#26
4316  0041 42            	mul	x,a
4317  0042 d60260        	ld	a,(_sc+465,x)
4318  0045 da025f        	or	a,(_sc+464,x)
4319  0048 274f          	jreq	L3261
4321  004a 7b01          	ld	a,(OFST-55,sp)
4322  004c 97            	ld	xl,a
4323  004d a61a          	ld	a,#26
4324  004f 42            	mul	x,a
4325  0050 d60253        	ld	a,(_sc+452,x)
4326  0053 a4c0          	and	a,#192
4327  0055 a1c0          	cp	a,#192
4328  0057 2740          	jreq	L3261
4329                     ; 638 			mal.frame_h1 = 0xEE;
4331  0059 a6ee          	ld	a,#238
4332  005b 6b02          	ld	(OFST-54,sp),a
4333                     ; 639 			mal.frame_h2 = 0xEE;
4335  005d a6ee          	ld	a,#238
4336  005f 6b03          	ld	(OFST-53,sp),a
4337                     ; 640 			mal.message_id = 51+i;
4339  0061 7b01          	ld	a,(OFST-55,sp)
4340  0063 ab33          	add	a,#51
4341  0065 6b04          	ld	(OFST-52,sp),a
4342                     ; 641 			mal.mesh_id_H = ns_host_meshid_H;
4344  0067 c60089        	ld	a,_ns_host_meshid_H
4345  006a 6b05          	ld	(OFST-51,sp),a
4346                     ; 642 			mal.mesh_id_L = ns_host_meshid_L;
4348  006c c60088        	ld	a,_ns_host_meshid_L
4349  006f 6b06          	ld	(OFST-50,sp),a
4350                     ; 643 			mal.payload[0] = 0x0A;
4352  0071 a60a          	ld	a,#10
4353  0073 6b07          	ld	(OFST-49,sp),a
4354                     ; 644 			mal.payload[1] = 0xB2;
4356  0075 a6b2          	ld	a,#178
4357  0077 6b08          	ld	(OFST-48,sp),a
4358                     ; 645 			mal.payload[2] =	sc.slc[i].MDID;
4360  0079 7b01          	ld	a,(OFST-55,sp)
4361  007b 97            	ld	xl,a
4362  007c a61a          	ld	a,#26
4363  007e 42            	mul	x,a
4364  007f d60260        	ld	a,(_sc+465,x)
4365  0082 6b09          	ld	(OFST-47,sp),a
4366                     ; 646 			mal.payload[3] =	sc.slc[i].HWTtest;
4368  0084 7b01          	ld	a,(OFST-55,sp)
4369  0086 97            	ld	xl,a
4370  0087 a61a          	ld	a,#26
4371  0089 42            	mul	x,a
4372  008a d60253        	ld	a,(_sc+452,x)
4373  008d 6b0a          	ld	(OFST-46,sp),a
4374                     ; 647 			sicp_send_message(&mal,4);
4376  008f 4b04          	push	#4
4377  0091 96            	ldw	x,sp
4378  0092 1c0003        	addw	x,#OFST-53
4379  0095 cd0000        	call	_sicp_send_message
4381  0098 84            	pop	a
4382  0099               L3261:
4383                     ; 636 	for(i = 0; i < 15;i++){
4385  0099 0c01          	inc	(OFST-55,sp)
4388  009b 7b01          	ld	a,(OFST-55,sp)
4389  009d a10f          	cp	a,#15
4390  009f 259b          	jrult	L5161
4391                     ; 651 	for(i = 0; i < 15;i++){
4393  00a1 0f01          	clr	(OFST-55,sp)
4394  00a3               L5261:
4395                     ; 652 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4397  00a3 7b01          	ld	a,(OFST-55,sp)
4398  00a5 97            	ld	xl,a
4399  00a6 a61c          	ld	a,#28
4400  00a8 42            	mul	x,a
4401  00a9 d600bc        	ld	a,(_sc+45,x)
4402  00ac da00bb        	or	a,(_sc+44,x)
4403  00af 274f          	jreq	L3361
4405  00b1 7b01          	ld	a,(OFST-55,sp)
4406  00b3 97            	ld	xl,a
4407  00b4 a61c          	ld	a,#28
4408  00b6 42            	mul	x,a
4409  00b7 d600af        	ld	a,(_sc+32,x)
4410  00ba a4c0          	and	a,#192
4411  00bc a1c0          	cp	a,#192
4412  00be 2740          	jreq	L3361
4413                     ; 653 			mal.frame_h1 = 0xEE;
4415  00c0 a6ee          	ld	a,#238
4416  00c2 6b02          	ld	(OFST-54,sp),a
4417                     ; 654 			mal.frame_h2 = 0xEE;
4419  00c4 a6ee          	ld	a,#238
4420  00c6 6b03          	ld	(OFST-53,sp),a
4421                     ; 655 			mal.message_id = 66+i;
4423  00c8 7b01          	ld	a,(OFST-55,sp)
4424  00ca ab42          	add	a,#66
4425  00cc 6b04          	ld	(OFST-52,sp),a
4426                     ; 656 			mal.mesh_id_H = ns_host_meshid_H;
4428  00ce c60089        	ld	a,_ns_host_meshid_H
4429  00d1 6b05          	ld	(OFST-51,sp),a
4430                     ; 657 			mal.mesh_id_L = ns_host_meshid_L;
4432  00d3 c60088        	ld	a,_ns_host_meshid_L
4433  00d6 6b06          	ld	(OFST-50,sp),a
4434                     ; 658 			mal.payload[0] = 0x0A;
4436  00d8 a60a          	ld	a,#10
4437  00da 6b07          	ld	(OFST-49,sp),a
4438                     ; 659 			mal.payload[1] = 0xB2;
4440  00dc a6b2          	ld	a,#178
4441  00de 6b08          	ld	(OFST-48,sp),a
4442                     ; 660 			mal.payload[2] =	sc.spc[i].MDID;
4444  00e0 7b01          	ld	a,(OFST-55,sp)
4445  00e2 97            	ld	xl,a
4446  00e3 a61c          	ld	a,#28
4447  00e5 42            	mul	x,a
4448  00e6 d600bc        	ld	a,(_sc+45,x)
4449  00e9 6b09          	ld	(OFST-47,sp),a
4450                     ; 661 			mal.payload[3] =	sc.spc[i].HWTtest;
4452  00eb 7b01          	ld	a,(OFST-55,sp)
4453  00ed 97            	ld	xl,a
4454  00ee a61c          	ld	a,#28
4455  00f0 42            	mul	x,a
4456  00f1 d600af        	ld	a,(_sc+32,x)
4457  00f4 6b0a          	ld	(OFST-46,sp),a
4458                     ; 662 			sicp_send_message(&mal,4);
4460  00f6 4b04          	push	#4
4461  00f8 96            	ldw	x,sp
4462  00f9 1c0003        	addw	x,#OFST-53
4463  00fc cd0000        	call	_sicp_send_message
4465  00ff 84            	pop	a
4466  0100               L3361:
4467                     ; 651 	for(i = 0; i < 15;i++){
4469  0100 0c01          	inc	(OFST-55,sp)
4472  0102 7b01          	ld	a,(OFST-55,sp)
4473  0104 a10f          	cp	a,#15
4474  0106 259b          	jrult	L5261
4475                     ; 665 }
4478  0108 5b38          	addw	sp,#56
4479  010a 81            	ret
4517                     ; 668 void check_send_repeatedly(void){
4518                     .text:	section	.text,new
4519  0000               _check_send_repeatedly:
4521  0000 88            	push	a
4522       00000001      OFST:	set	1
4525                     ; 671 	if(di_timeout){
4527  0001 725d0001      	tnz	_di_timeout
4528  0005 2766          	jreq	L1561
4529                     ; 672 		if(--di_timeout == 0){
4531  0007 725a0001      	dec	_di_timeout
4532  000b 2660          	jrne	L1561
4533                     ; 673 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4535  000d c603d2        	ld	a,_sc+835
4536  0010 a502          	bcp	a,#2
4537  0012 2607          	jrne	L5561
4540  0014 cd0000        	call	_send_sc_device_info
4544  0017 35050001      	mov	_di_timeout,#5
4545  001b               L5561:
4546                     ; 674 			for(i = 0; i < 15; i++){
4548  001b 0f01          	clr	(OFST+0,sp)
4549  001d               L7561:
4550                     ; 675 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4552  001d 7b01          	ld	a,(OFST+0,sp)
4553  001f 97            	ld	xl,a
4554  0020 a61a          	ld	a,#26
4555  0022 42            	mul	x,a
4556  0023 d60260        	ld	a,(_sc+465,x)
4557  0026 da025f        	or	a,(_sc+464,x)
4558  0029 2716          	jreq	L5661
4560  002b 7b01          	ld	a,(OFST+0,sp)
4561  002d 97            	ld	xl,a
4562  002e a61a          	ld	a,#26
4563  0030 42            	mul	x,a
4564  0031 d60265        	ld	a,(_sc+470,x)
4565  0034 a502          	bcp	a,#2
4566  0036 2609          	jrne	L5661
4569  0038 7b01          	ld	a,(OFST+0,sp)
4570  003a cd0000        	call	_send_slc_device_info
4574  003d 35050001      	mov	_di_timeout,#5
4575  0041               L5661:
4576                     ; 676 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4578  0041 7b01          	ld	a,(OFST+0,sp)
4579  0043 97            	ld	xl,a
4580  0044 a61c          	ld	a,#28
4581  0046 42            	mul	x,a
4582  0047 d600bc        	ld	a,(_sc+45,x)
4583  004a da00bb        	or	a,(_sc+44,x)
4584  004d 2716          	jreq	L7661
4586  004f 7b01          	ld	a,(OFST+0,sp)
4587  0051 97            	ld	xl,a
4588  0052 a61c          	ld	a,#28
4589  0054 42            	mul	x,a
4590  0055 d600c3        	ld	a,(_sc+52,x)
4591  0058 a502          	bcp	a,#2
4592  005a 2609          	jrne	L7661
4595  005c 7b01          	ld	a,(OFST+0,sp)
4596  005e cd0000        	call	_send_spc_device_info
4600  0061 35050001      	mov	_di_timeout,#5
4601  0065               L7661:
4602                     ; 674 			for(i = 0; i < 15; i++){
4604  0065 0c01          	inc	(OFST+0,sp)
4607  0067 7b01          	ld	a,(OFST+0,sp)
4608  0069 a10f          	cp	a,#15
4609  006b 25b0          	jrult	L7561
4610  006d               L1561:
4611                     ; 680 }
4614  006d 84            	pop	a
4615  006e 81            	ret
4628                     	xdef	_send_spc_device_info
4629                     	xdef	_send_slc_device_info
4630                     	xdef	_send_sc_device_info
4631                     	xdef	_clear_uart_buf
4632                     	xdef	_Uart2_Send
4633                     	xref	_rand
4634                     	xref	_i2c_multiple_action_dimmer
4635                     	xref	_i2c_action_plug
4636                     	xref	_i2c_single_action_dimmer
4637                     	xref	_i2c_get_energy_consum
4638                     	xref	_action_dimmer_ext
4639                     	xdef	_delay
4640                     	xref	_systime_count
4641                     	xref	_init_slc_spc_done
4642                     	xref	_sys_init
4643                     	xdef	_check_send_repeatedly
4644                     	xdef	_send_malfunction
4645                     	xdef	_send_device_info
4646                     	xdef	_report_energy_consum
4647                     	xdef	_rev_cmd_data
4648                     	xdef	_sicp_receipt_Done
4649                     	xdef	_sicp_receipt_OK
4650                     	xdef	_sicp_send_message
4651                     	xdef	_random
4652                     	xdef	_rev_deal
4653                     	xdef	_Check_Sum
4654                     	xdef	_rev_anaylze
4655                     	xdef	_UART2_RX_ISR
4656                     	xdef	_UART2_TX_ISR
4657                     	xdef	_Init_uart2
4658                     	xdef	_mymemcpy
4659                     	switch	.bss
4660  0000               _mal_timeout:
4661  0000 00            	ds.b	1
4662                     	xdef	_mal_timeout
4663  0001               _di_timeout:
4664  0001 00            	ds.b	1
4665                     	xdef	_di_timeout
4666  0002               _send_failed_count:
4667  0002 0000          	ds.b	2
4668                     	xdef	_send_failed_count
4669  0004               _send_fault_count:
4670  0004 0000          	ds.b	2
4671                     	xdef	_send_fault_count
4672  0006               _sicp_buf:
4673  0006 000000000000  	ds.b	40
4674                     	xdef	_sicp_buf
4675  002e               _Uart2_Rec_Cnt:
4676  002e 00            	ds.b	1
4677                     	xdef	_Uart2_Rec_Cnt
4678  002f               _Uart2_Rece_Buf:
4679  002f 000000000000  	ds.b	40
4680                     	xdef	_Uart2_Rece_Buf
4681  0057               _Uart2_Send_Done:
4682  0057 00            	ds.b	1
4683                     	xdef	_Uart2_Send_Done
4684  0058               _Uart2_Send_Cnt:
4685  0058 00            	ds.b	1
4686                     	xdef	_Uart2_Send_Cnt
4687  0059               _Uart2_Send_Length:
4688  0059 00            	ds.b	1
4689                     	xdef	_Uart2_Send_Length
4690  005a               _UART2_Send_Buf:
4691  005a 000000000000  	ds.b	40
4692                     	xdef	_UART2_Send_Buf
4693  0082               _rev_ad_channel:
4694  0082 00            	ds.b	1
4695                     	xdef	_rev_ad_channel
4696  0083               _rev_ad_mdid:
4697  0083 00            	ds.b	1
4698                     	xdef	_rev_ad_mdid
4699  0084               _rev_ad_message_id:
4700  0084 00            	ds.b	1
4701                     	xdef	_rev_ad_message_id
4702  0085               _rev_mesh_id_L:
4703  0085 00            	ds.b	1
4704                     	xdef	_rev_mesh_id_L
4705  0086               _rev_mesh_id_H:
4706  0086 00            	ds.b	1
4707                     	xdef	_rev_mesh_id_H
4708  0087               _rev_message_id:
4709  0087 00            	ds.b	1
4710                     	xdef	_rev_message_id
4711  0088               _ns_host_meshid_L:
4712  0088 00            	ds.b	1
4713                     	xdef	_ns_host_meshid_L
4714  0089               _ns_host_meshid_H:
4715  0089 00            	ds.b	1
4716                     	xdef	_ns_host_meshid_H
4717  008a               _ns_own_meshid_L:
4718  008a 00            	ds.b	1
4719                     	xdef	_ns_own_meshid_L
4720  008b               _ns_own_meshid_H:
4721  008b 00            	ds.b	1
4722                     	xdef	_ns_own_meshid_H
4723  008c               _ns_phonenum:
4724  008c 00            	ds.b	1
4725                     	xdef	_ns_phonenum
4726  008d               _ns_status:
4727  008d 00            	ds.b	1
4728                     	xdef	_ns_status
4729  008e               _ns_signal:
4730  008e 00            	ds.b	1
4731                     	xdef	_ns_signal
4732  008f               _sc:
4733  008f 000000000000  	ds.b	836
4734                     	xdef	_sc
4735  03d3               _UART1Flag6_:
4736  03d3 00            	ds.b	1
4737                     	xdef	_UART1Flag6_
4738  03d4               _UART1Flag5_:
4739  03d4 00            	ds.b	1
4740                     	xdef	_UART1Flag5_
4741  03d5               _UART1Flag4_:
4742  03d5 00            	ds.b	1
4743                     	xdef	_UART1Flag4_
4744  03d6               _UART1Flag3_:
4745  03d6 00            	ds.b	1
4746                     	xdef	_UART1Flag3_
4747  03d7               _UART1Flag2_:
4748  03d7 00            	ds.b	1
4749                     	xdef	_UART1Flag2_
4750  03d8               _UART1Flag1_:
4751  03d8 00            	ds.b	1
4752                     	xdef	_UART1Flag1_
4753                     	xref	_UART2_ITConfig
4754                     	xref	_UART2_Cmd
4755                     	xref	_UART2_Init
4756                     	xref	_UART2_DeInit
4757                     	xref.b	c_lreg
4758                     	xref.b	c_x
4759                     	xref.b	c_y
4779                     	xref	c_idiv
4780                     	xref	c_lrzmp
4781                     	xref	c_lgsbc
4782                     	xref	c_ltor
4783                     	end
