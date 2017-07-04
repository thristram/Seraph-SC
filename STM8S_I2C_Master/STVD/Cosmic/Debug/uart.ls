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
1921  0009 cc03aa        	jp	L7011
1922  000c               L25:
1923                     ; 240 		rev_success = 0;
1925  000c 721103d8      	bres	_UART1Flag1_,#0
1926                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1928  0010 c60006        	ld	a,_sicp_buf
1929  0013 a1ee          	cp	a,#238
1930  0015 2614          	jrne	L1111
1932  0017 c60007        	ld	a,_sicp_buf+1
1933  001a a1ee          	cp	a,#238
1934  001c 2707          	jreq	L3111
1936  001e c60007        	ld	a,_sicp_buf+1
1937  0021 a1aa          	cp	a,#170
1938  0023 2606          	jrne	L1111
1939  0025               L3111:
1940                     ; 242 			ble_data_frame = 1;
1942  0025 721203d8      	bset	_UART1Flag1_,#1
1944  0029 2012          	jra	L5111
1945  002b               L1111:
1946                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1948  002b c60006        	ld	a,_sicp_buf
1949  002e a1dd          	cp	a,#221
1950  0030 260b          	jrne	L5111
1952  0032 c60007        	ld	a,_sicp_buf+1
1953  0035 a1dd          	cp	a,#221
1954  0037 2604          	jrne	L5111
1955                     ; 245 			ble_ctrl_frame = 1;
1957  0039 721403d8      	bset	_UART1Flag1_,#2
1958  003d               L5111:
1959                     ; 248 		if (ble_data_frame){
1961  003d c603d8        	ld	a,_UART1Flag1_
1962  0040 a502          	bcp	a,#2
1963  0042 2603          	jrne	L45
1964  0044 cc0344        	jp	L1211
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
1982                     ; 327 				break;
1983  005d a003          	sub	a,#3
1984  005f 272c          	jreq	L5101
1985  0061 a04e          	sub	a,#78
1986  0063 273c          	jreq	L7101
1987  0065 4a            	dec	a
1988  0066 2739          	jreq	L7101
1989  0068 4a            	dec	a
1990  0069 2736          	jreq	L7101
1991  006b 4a            	dec	a
1992  006c 2733          	jreq	L7101
1993  006e 4a            	dec	a
1994  006f 2603cc00f1    	jreq	L1201
1995  0074 a002          	sub	a,#2
1996  0076 2603          	jrne	L65
1997  0078 cc013a        	jp	L3201
1998  007b               L65:
1999  007b a053          	sub	a,#83
2000  007d 2603          	jrne	L06
2001  007f cc0239        	jp	L5201
2002  0082               L06:
2003  0082 a006          	sub	a,#6
2004  0084 2603          	jrne	L26
2005  0086 cc031e        	jp	L1301
2006  0089               L26:
2007  0089 acaa03aa      	jpf	L7011
2008  008d               L5101:
2009                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2009                     ; 255 					if(sicp_buf[7] == 0x03){
2011  008d c6000d        	ld	a,_sicp_buf+7
2012  0090 a103          	cp	a,#3
2013  0092 2703          	jreq	L46
2014  0094 cc03aa        	jp	L7011
2015  0097               L46:
2016                     ; 256 						rev_cmd_data(sicp_buf[8]);
2018  0097 c6000e        	ld	a,_sicp_buf+8
2019  009a cd0000        	call	_rev_cmd_data
2021  009d acaa03aa      	jpf	L7011
2022  00a1               L7101:
2023                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2023                     ; 260 				case 0x52:
2023                     ; 261 				case 0x53:
2023                     ; 262 				case 0x54:
2023                     ; 263 					rev_ad_message_id = sicp_buf[2];
2025  00a1 5500080084    	mov	_rev_ad_message_id,_sicp_buf+2
2026                     ; 264 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2028  00a6 c6000d        	ld	a,_sicp_buf+7
2029  00a9 a4f0          	and	a,#240
2030  00ab 4e            	swap	a
2031  00ac a40f          	and	a,#15
2032  00ae c70083        	ld	_rev_ad_mdid,a
2033                     ; 265 					rev_ad_channel = (sicp_buf[7]&0x0f);
2035  00b1 c6000d        	ld	a,_sicp_buf+7
2036  00b4 a40f          	and	a,#15
2037  00b6 c70082        	ld	_rev_ad_channel,a
2038                     ; 266 					action_dimmer_ext = sicp_buf[9]+2;
2040  00b9 c6000f        	ld	a,_sicp_buf+9
2041  00bc ab02          	add	a,#2
2042  00be c70000        	ld	_action_dimmer_ext,a
2043                     ; 268 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2045  00c1 3b000f        	push	_sicp_buf+9
2046  00c4 3b000e        	push	_sicp_buf+8
2047  00c7 c6000d        	ld	a,_sicp_buf+7
2048  00ca 97            	ld	xl,a
2049  00cb c6000c        	ld	a,_sicp_buf+6
2050  00ce 95            	ld	xh,a
2051  00cf cd0000        	call	_i2c_single_action_dimmer
2053  00d2 85            	popw	x
2054  00d3 6b04          	ld	(OFST-55,sp),a
2055                     ; 269 					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2057  00d5 0d04          	tnz	(OFST-55,sp)
2058  00d7 2703          	jreq	L66
2059  00d9 cc03aa        	jp	L7011
2060  00dc               L66:
2063  00dc 3b008a        	push	_ns_own_meshid_L
2064  00df 3b008b        	push	_ns_own_meshid_H
2065  00e2 c60087        	ld	a,_rev_message_id
2066  00e5 97            	ld	xl,a
2067  00e6 a602          	ld	a,#2
2068  00e8 95            	ld	xh,a
2069  00e9 cd0000        	call	_sicp_receipt_OK
2071  00ec 85            	popw	x
2072  00ed acaa03aa      	jpf	L7011
2073  00f1               L1201:
2074                     ; 272 				case 0x55://打开或关闭开关
2074                     ; 273 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2076  00f1 c6000d        	ld	a,_sicp_buf+7
2077  00f4 a4f0          	and	a,#240
2078  00f6 4e            	swap	a
2079  00f7 a40f          	and	a,#15
2080  00f9 c70083        	ld	_rev_ad_mdid,a
2081                     ; 274 					rev_ad_channel = (sicp_buf[7]&0x0f);
2083  00fc c6000d        	ld	a,_sicp_buf+7
2084  00ff a40f          	and	a,#15
2085  0101 c70082        	ld	_rev_ad_channel,a
2086                     ; 276 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2088  0104 3b000f        	push	_sicp_buf+9
2089  0107 3b000e        	push	_sicp_buf+8
2090  010a c6000d        	ld	a,_sicp_buf+7
2091  010d 97            	ld	xl,a
2092  010e c6000c        	ld	a,_sicp_buf+6
2093  0111 95            	ld	xh,a
2094  0112 cd0000        	call	_i2c_action_plug
2096  0115 85            	popw	x
2097  0116 6b04          	ld	(OFST-55,sp),a
2098                     ; 277 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_own_meshid_H,ns_own_meshid_L,0x02,rev_ad_mdid);
2100  0118 0d04          	tnz	(OFST-55,sp)
2101  011a 2703          	jreq	L07
2102  011c cc03aa        	jp	L7011
2103  011f               L07:
2106  011f 3b0083        	push	_rev_ad_mdid
2107  0122 4b02          	push	#2
2108  0124 3b008a        	push	_ns_own_meshid_L
2109  0127 3b008b        	push	_ns_own_meshid_H
2110  012a c60087        	ld	a,_rev_message_id
2111  012d 97            	ld	xl,a
2112  012e a605          	ld	a,#5
2113  0130 95            	ld	xh,a
2114  0131 cd0000        	call	_sicp_receipt_Done
2116  0134 5b04          	addw	sp,#4
2117  0136 acaa03aa      	jpf	L7011
2118  013a               L3201:
2119                     ; 279 				case 0x57://一个SC下多个SLC多个通道调光
2119                     ; 280 					action_dimmer_num = sicp_buf[7];
2121  013a c6000d        	ld	a,_sicp_buf+7
2122  013d 6b03          	ld	(OFST-56,sp),a
2123                     ; 281 					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2125  013f 3b008a        	push	_ns_own_meshid_L
2126  0142 3b008b        	push	_ns_own_meshid_H
2127  0145 c60087        	ld	a,_rev_message_id
2128  0148 97            	ld	xl,a
2129  0149 a602          	ld	a,#2
2130  014b 95            	ld	xh,a
2131  014c cd0000        	call	_sicp_receipt_OK
2133  014f 85            	popw	x
2134                     ; 283 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2136  0150 7b03          	ld	a,(OFST-56,sp)
2137  0152 cd0000        	call	_i2c_multiple_action_dimmer
2139  0155 6b04          	ld	(OFST-55,sp),a
2140                     ; 284 					if(ret == IIC_SUCCESS){
2142  0157 0d04          	tnz	(OFST-55,sp)
2143  0159 2703          	jreq	L27
2144  015b cc03aa        	jp	L7011
2145  015e               L27:
2146                     ; 285 						receipt.frame_h1 = 0xEE;
2148  015e a6ee          	ld	a,#238
2149  0160 6b05          	ld	(OFST-54,sp),a
2150                     ; 286 						receipt.frame_h2 = 0xAA;
2152  0162 a6aa          	ld	a,#170
2153  0164 6b06          	ld	(OFST-53,sp),a
2154                     ; 287 						receipt.message_id = rev_message_id;
2156  0166 c60087        	ld	a,_rev_message_id
2157  0169 6b07          	ld	(OFST-52,sp),a
2158                     ; 288 						receipt.mesh_id_H = ns_own_meshid_H;
2160  016b c6008b        	ld	a,_ns_own_meshid_H
2161  016e 6b08          	ld	(OFST-51,sp),a
2162                     ; 289 						receipt.mesh_id_L = ns_own_meshid_L;
2164  0170 c6008a        	ld	a,_ns_own_meshid_L
2165  0173 6b09          	ld	(OFST-50,sp),a
2166                     ; 290 						receipt.payload[0] = 0xAA;
2168  0175 a6aa          	ld	a,#170
2169  0177 6b0a          	ld	(OFST-49,sp),a
2170                     ; 291 						receipt.payload[1] = 0x05;
2172  0179 a605          	ld	a,#5
2173  017b 6b0b          	ld	(OFST-48,sp),a
2174                     ; 292 						i = 0;
2176  017d 0f04          	clr	(OFST-55,sp)
2178  017f ac190219      	jpf	L3411
2179  0183               L7311:
2180                     ; 294 							rev_ad_mdid = (sicp_buf[8]&0xf0)>>4;
2182  0183 c6000e        	ld	a,_sicp_buf+8
2183  0186 a4f0          	and	a,#240
2184  0188 4e            	swap	a
2185  0189 a40f          	and	a,#15
2186  018b c70083        	ld	_rev_ad_mdid,a
2187                     ; 295 							rev_ad_channel = (sicp_buf[8]&0x0f);
2189  018e c6000e        	ld	a,_sicp_buf+8
2190  0191 a40f          	and	a,#15
2191  0193 c70082        	ld	_rev_ad_channel,a
2192                     ; 296 							receipt.payload[2+i*5] = rev_ad_mdid;
2194  0196 96            	ldw	x,sp
2195  0197 1c000c        	addw	x,#OFST-47
2196  019a 1f01          	ldw	(OFST-58,sp),x
2197  019c 7b04          	ld	a,(OFST-55,sp)
2198  019e 97            	ld	xl,a
2199  019f a605          	ld	a,#5
2200  01a1 42            	mul	x,a
2201  01a2 72fb01        	addw	x,(OFST-58,sp)
2202  01a5 c60083        	ld	a,_rev_ad_mdid
2203  01a8 f7            	ld	(x),a
2204                     ; 297 							receipt.payload[3+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2206  01a9 96            	ldw	x,sp
2207  01aa 1c000d        	addw	x,#OFST-46
2208  01ad 1f01          	ldw	(OFST-58,sp),x
2209  01af 7b04          	ld	a,(OFST-55,sp)
2210  01b1 97            	ld	xl,a
2211  01b2 a605          	ld	a,#5
2212  01b4 42            	mul	x,a
2213  01b5 72fb01        	addw	x,(OFST-58,sp)
2214  01b8 89            	pushw	x
2215  01b9 c60083        	ld	a,_rev_ad_mdid
2216  01bc 97            	ld	xl,a
2217  01bd a61a          	ld	a,#26
2218  01bf 42            	mul	x,a
2219  01c0 d60261        	ld	a,(_sc+466,x)
2220  01c3 85            	popw	x
2221  01c4 f7            	ld	(x),a
2222                     ; 298 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2224  01c5 96            	ldw	x,sp
2225  01c6 1c000e        	addw	x,#OFST-45
2226  01c9 1f01          	ldw	(OFST-58,sp),x
2227  01cb 7b04          	ld	a,(OFST-55,sp)
2228  01cd 97            	ld	xl,a
2229  01ce a605          	ld	a,#5
2230  01d0 42            	mul	x,a
2231  01d1 72fb01        	addw	x,(OFST-58,sp)
2232  01d4 89            	pushw	x
2233  01d5 c60083        	ld	a,_rev_ad_mdid
2234  01d8 97            	ld	xl,a
2235  01d9 a61a          	ld	a,#26
2236  01db 42            	mul	x,a
2237  01dc d60262        	ld	a,(_sc+467,x)
2238  01df 85            	popw	x
2239  01e0 f7            	ld	(x),a
2240                     ; 299 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2242  01e1 96            	ldw	x,sp
2243  01e2 1c000f        	addw	x,#OFST-44
2244  01e5 1f01          	ldw	(OFST-58,sp),x
2245  01e7 7b04          	ld	a,(OFST-55,sp)
2246  01e9 97            	ld	xl,a
2247  01ea a605          	ld	a,#5
2248  01ec 42            	mul	x,a
2249  01ed 72fb01        	addw	x,(OFST-58,sp)
2250  01f0 89            	pushw	x
2251  01f1 c60083        	ld	a,_rev_ad_mdid
2252  01f4 97            	ld	xl,a
2253  01f5 a61a          	ld	a,#26
2254  01f7 42            	mul	x,a
2255  01f8 d60263        	ld	a,(_sc+468,x)
2256  01fb 85            	popw	x
2257  01fc f7            	ld	(x),a
2258                     ; 300 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2260  01fd 96            	ldw	x,sp
2261  01fe 1c0010        	addw	x,#OFST-43
2262  0201 1f01          	ldw	(OFST-58,sp),x
2263  0203 7b04          	ld	a,(OFST-55,sp)
2264  0205 97            	ld	xl,a
2265  0206 a605          	ld	a,#5
2266  0208 42            	mul	x,a
2267  0209 72fb01        	addw	x,(OFST-58,sp)
2268  020c 89            	pushw	x
2269  020d c60083        	ld	a,_rev_ad_mdid
2270  0210 97            	ld	xl,a
2271  0211 a61a          	ld	a,#26
2272  0213 42            	mul	x,a
2273  0214 d60264        	ld	a,(_sc+469,x)
2274  0217 85            	popw	x
2275  0218 f7            	ld	(x),a
2276  0219               L3411:
2277                     ; 293 						while(action_dimmer_num--){
2279  0219 7b03          	ld	a,(OFST-56,sp)
2280  021b 0a03          	dec	(OFST-56,sp)
2281  021d 4d            	tnz	a
2282  021e 2703          	jreq	L47
2283  0220 cc0183        	jp	L7311
2284  0223               L47:
2285                     ; 302 						sicp_send_message(&receipt,7+i*5);
2287  0223 7b04          	ld	a,(OFST-55,sp)
2288  0225 97            	ld	xl,a
2289  0226 a605          	ld	a,#5
2290  0228 42            	mul	x,a
2291  0229 9f            	ld	a,xl
2292  022a ab07          	add	a,#7
2293  022c 88            	push	a
2294  022d 96            	ldw	x,sp
2295  022e 1c0006        	addw	x,#OFST-53
2296  0231 cd0000        	call	_sicp_send_message
2298  0234 84            	pop	a
2299  0235 acaa03aa      	jpf	L7011
2300  0239               L5201:
2301                     ; 305 				case 0xAA:
2301                     ; 306 					if(sicp_buf[7] == 0x02){
2303  0239 c6000d        	ld	a,_sicp_buf+7
2304  023c a102          	cp	a,#2
2305  023e 2703          	jreq	L67
2306  0240 cc03aa        	jp	L7011
2307  0243               L67:
2308                     ; 308 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2310  0243 725d0087      	tnz	_rev_message_id
2311  0247 271d          	jreq	L1511
2313  0249 c60087        	ld	a,_rev_message_id
2314  024c a110          	cp	a,#16
2315  024e 2416          	jruge	L1511
2318  0250 c60087        	ld	a,_rev_message_id
2319  0253 97            	ld	xl,a
2320  0254 a61c          	ld	a,#28
2321  0256 42            	mul	x,a
2322  0257 1d001c        	subw	x,#28
2323  025a d600c3        	ld	a,(_sc+52,x)
2324  025d aa01          	or	a,#1
2325  025f d700c3        	ld	(_sc+52,x),a
2327  0262 acaa03aa      	jpf	L7011
2328  0266               L1511:
2329                     ; 310 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2331  0266 c60087        	ld	a,_rev_message_id
2332  0269 a110          	cp	a,#16
2333  026b 2608          	jrne	L5511
2336  026d 721203d2      	bset	_sc+835,#1
2338  0271 acaa03aa      	jpf	L7011
2339  0275               L5511:
2340                     ; 311 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2342  0275 c60087        	ld	a,_rev_message_id
2343  0278 a115          	cp	a,#21
2344  027a 251d          	jrult	L1611
2346  027c c60087        	ld	a,_rev_message_id
2347  027f a124          	cp	a,#36
2348  0281 2416          	jruge	L1611
2351  0283 c60087        	ld	a,_rev_message_id
2352  0286 97            	ld	xl,a
2353  0287 a61a          	ld	a,#26
2354  0289 42            	mul	x,a
2355  028a 1d0222        	subw	x,#546
2356  028d d60265        	ld	a,(_sc+470,x)
2357  0290 aa02          	or	a,#2
2358  0292 d70265        	ld	(_sc+470,x),a
2360  0295 acaa03aa      	jpf	L7011
2361  0299               L1611:
2362                     ; 312 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2364  0299 c60087        	ld	a,_rev_message_id
2365  029c a124          	cp	a,#36
2366  029e 251d          	jrult	L5611
2368  02a0 c60087        	ld	a,_rev_message_id
2369  02a3 a133          	cp	a,#51
2370  02a5 2416          	jruge	L5611
2373  02a7 c60087        	ld	a,_rev_message_id
2374  02aa 97            	ld	xl,a
2375  02ab a61c          	ld	a,#28
2376  02ad 42            	mul	x,a
2377  02ae 1d03f0        	subw	x,#1008
2378  02b1 d600c3        	ld	a,(_sc+52,x)
2379  02b4 aa02          	or	a,#2
2380  02b6 d700c3        	ld	(_sc+52,x),a
2382  02b9 acaa03aa      	jpf	L7011
2383  02bd               L5611:
2384                     ; 314 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2386  02bd c60087        	ld	a,_rev_message_id
2387  02c0 a111          	cp	a,#17
2388  02c2 2608          	jrne	L1711
2391  02c4 721403d2      	bset	_sc+835,#2
2393  02c8 acaa03aa      	jpf	L7011
2394  02cc               L1711:
2395                     ; 315 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2397  02cc c60087        	ld	a,_rev_message_id
2398  02cf a133          	cp	a,#51
2399  02d1 251d          	jrult	L5711
2401  02d3 c60087        	ld	a,_rev_message_id
2402  02d6 a142          	cp	a,#66
2403  02d8 2416          	jruge	L5711
2406  02da c60087        	ld	a,_rev_message_id
2407  02dd 97            	ld	xl,a
2408  02de a61a          	ld	a,#26
2409  02e0 42            	mul	x,a
2410  02e1 1d052e        	subw	x,#1326
2411  02e4 d60265        	ld	a,(_sc+470,x)
2412  02e7 aa04          	or	a,#4
2413  02e9 d70265        	ld	(_sc+470,x),a
2415  02ec acaa03aa      	jpf	L7011
2416  02f0               L5711:
2417                     ; 316 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2419  02f0 c60087        	ld	a,_rev_message_id
2420  02f3 a142          	cp	a,#66
2421  02f5 2403          	jruge	L001
2422  02f7 cc03aa        	jp	L7011
2423  02fa               L001:
2425  02fa c60087        	ld	a,_rev_message_id
2426  02fd a151          	cp	a,#81
2427  02ff 2503          	jrult	L201
2428  0301 cc03aa        	jp	L7011
2429  0304               L201:
2432  0304 c60087        	ld	a,_rev_message_id
2433  0307 97            	ld	xl,a
2434  0308 a61c          	ld	a,#28
2435  030a 42            	mul	x,a
2436  030b 1d0738        	subw	x,#1848
2437  030e d600c3        	ld	a,(_sc+52,x)
2438  0311 aa04          	or	a,#4
2439  0313 d700c3        	ld	(_sc+52,x),a
2440  0316 acaa03aa      	jpf	L7011
2441  031a               L7201:
2442                     ; 319 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2442                     ; 320 				break;
2444  031a acaa03aa      	jpf	L7011
2445  031e               L1301:
2446                     ; 321 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2446                     ; 322 					if(rev_message_id == 0x9E){
2448  031e c60087        	ld	a,_rev_message_id
2449  0321 a19e          	cp	a,#158
2450  0323 26dc          	jrne	L7011
2451                     ; 323 						ns_host_meshid_H = rev_mesh_id_H;
2453  0325 5500860089    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2454                     ; 324 						ns_host_meshid_L = rev_mesh_id_L;
2456  032a 5500850088    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2457                     ; 325 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2459  032f 3b0088        	push	_ns_host_meshid_L
2460  0332 3b0089        	push	_ns_host_meshid_H
2461  0335 c60087        	ld	a,_rev_message_id
2462  0338 97            	ld	xl,a
2463  0339 a602          	ld	a,#2
2464  033b 95            	ld	xh,a
2465  033c cd0000        	call	_sicp_receipt_OK
2467  033f 85            	popw	x
2468  0340 2068          	jra	L7011
2469  0342               L5211:
2470                     ; 327 				break;
2471  0342 2066          	jra	L7011
2472  0344               L1211:
2473                     ; 330 		else if (ble_ctrl_frame){
2475  0344 c603d8        	ld	a,_UART1Flag1_
2476  0347 a504          	bcp	a,#4
2477  0349 275f          	jreq	L7011
2478                     ; 331 			ble_ctrl_frame = 0;
2480  034b 721503d8      	bres	_UART1Flag1_,#2
2481                     ; 332 			switch(sicp_buf[4]){
2483  034f c6000a        	ld	a,_sicp_buf+4
2485                     ; 362 				break;
2486  0352 4a            	dec	a
2487  0353 2708          	jreq	L3301
2488  0355 4a            	dec	a
2489  0356 2720          	jreq	L5301
2490  0358 4a            	dec	a
2491  0359 2729          	jreq	L7301
2492  035b 204d          	jra	L7011
2493  035d               L3301:
2494                     ; 333 				case 0x01://网络状态帧
2494                     ; 334 				ns_signal = sicp_buf[5];
2496  035d 55000b008e    	mov	_ns_signal,_sicp_buf+5
2497                     ; 335 				ns_status = sicp_buf[6];
2499  0362 55000c008d    	mov	_ns_status,_sicp_buf+6
2500                     ; 336 				ns_phonenum = sicp_buf[7];
2502  0367 55000d008c    	mov	_ns_phonenum,_sicp_buf+7
2503                     ; 337 				ns_own_meshid_H = sicp_buf[8];
2505  036c 55000e008b    	mov	_ns_own_meshid_H,_sicp_buf+8
2506                     ; 338 				ns_own_meshid_L = sicp_buf[9];
2508  0371 55000f008a    	mov	_ns_own_meshid_L,_sicp_buf+9
2509                     ; 345 				break;
2511  0376 2032          	jra	L7011
2512  0378               L5301:
2513                     ; 346 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2513                     ; 347 				sys_init();
2515  0378 cd0000        	call	_sys_init
2517                     ; 348 				clear_uart_buf();
2519  037b cd0000        	call	_clear_uart_buf
2521                     ; 349 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2523  037e 725f0000      	clr	_init_slc_spc_done
2524                     ; 350 				break;
2526  0382 2026          	jra	L7011
2527  0384               L7301:
2528                     ; 351 			case 0x03://重置芯片和网络，退出mesh连接
2528                     ; 352 				sys_init();
2530  0384 cd0000        	call	_sys_init
2532                     ; 353 				clear_uart_buf();
2534  0387 cd0000        	call	_clear_uart_buf
2536                     ; 354 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2538  038a 725f0000      	clr	_init_slc_spc_done
2539                     ; 355 				ns_signal = 0x00;
2541  038e 725f008e      	clr	_ns_signal
2542                     ; 356 				ns_status = 0x00;
2544  0392 725f008d      	clr	_ns_status
2545                     ; 357 				ns_phonenum = 0x00;
2547  0396 725f008c      	clr	_ns_phonenum
2548                     ; 358 				ns_own_meshid_H = 0x00;
2550  039a 725f008b      	clr	_ns_own_meshid_H
2551                     ; 359 				ns_own_meshid_L = 0x00;
2553  039e 725f008a      	clr	_ns_own_meshid_L
2554                     ; 360 				ns_host_meshid_H = 0x00;
2556  03a2 725f0089      	clr	_ns_host_meshid_H
2557                     ; 361 				ns_host_meshid_L = 0x00;
2559  03a6 725f0088      	clr	_ns_host_meshid_L
2560                     ; 362 				break;
2562  03aa               L3121:
2563  03aa               L7011:
2564                     ; 366 }
2567  03aa 5b3b          	addw	sp,#59
2568  03ac 81            	ret
2617                     ; 369 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2617                     ; 370 {
2618                     .text:	section	.text,new
2619  0000               _sicp_send_message:
2621  0000 89            	pushw	x
2622       00000000      OFST:	set	0
2625                     ; 373 	UART2_Send_Buf[0] = tx->frame_h1;
2627  0001 f6            	ld	a,(x)
2628  0002 c7005a        	ld	_UART2_Send_Buf,a
2629                     ; 374 	UART2_Send_Buf[1] = tx->frame_h2;
2631  0005 e601          	ld	a,(1,x)
2632  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2633                     ; 375 	UART2_Send_Buf[2] = tx->message_id;
2635  000a e602          	ld	a,(2,x)
2636  000c c7005c        	ld	_UART2_Send_Buf+2,a
2637                     ; 376 	UART2_Send_Buf[3] = tx->mesh_id_H;
2639  000f e603          	ld	a,(3,x)
2640  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2641                     ; 377 	UART2_Send_Buf[4] = tx->mesh_id_L;
2643  0014 e604          	ld	a,(4,x)
2644  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2645                     ; 378 	UART2_Send_Buf[5] = 4+payload_len;
2647  0019 7b05          	ld	a,(OFST+5,sp)
2648  001b ab04          	add	a,#4
2649  001d c7005f        	ld	_UART2_Send_Buf+5,a
2650                     ; 379 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2652  0020 7b05          	ld	a,(OFST+5,sp)
2653  0022 b703          	ld	c_lreg+3,a
2654  0024 3f02          	clr	c_lreg+2
2655  0026 3f01          	clr	c_lreg+1
2656  0028 3f00          	clr	c_lreg
2657  002a be02          	ldw	x,c_lreg+2
2658  002c 89            	pushw	x
2659  002d be00          	ldw	x,c_lreg
2660  002f 89            	pushw	x
2661  0030 1e05          	ldw	x,(OFST+5,sp)
2662  0032 1c0005        	addw	x,#5
2663  0035 89            	pushw	x
2664  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2665  0039 cd0000        	call	_mymemcpy
2667  003c 5b06          	addw	sp,#6
2668                     ; 380 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2670  003e 7b05          	ld	a,(OFST+5,sp)
2671  0040 5f            	clrw	x
2672  0041 97            	ld	xl,a
2673  0042 89            	pushw	x
2674  0043 3b005f        	push	_UART2_Send_Buf+5
2675  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2676  0049 cd0000        	call	_Check_Sum
2678  004c 5b01          	addw	sp,#1
2679  004e 85            	popw	x
2680  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2681                     ; 381 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2683  0052 7b05          	ld	a,(OFST+5,sp)
2684  0054 5f            	clrw	x
2685  0055 97            	ld	xl,a
2686  0056 1c0007        	addw	x,#7
2687  0059 89            	pushw	x
2688  005a ae005a        	ldw	x,#_UART2_Send_Buf
2689  005d cd0000        	call	_Uart2_Send
2691  0060 85            	popw	x
2693  0061               L1421:
2694                     ; 382 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2696  0061 725d0057      	tnz	_Uart2_Send_Done
2697  0065 27fa          	jreq	L1421
2700  0067 725f0057      	clr	_Uart2_Send_Done
2701                     ; 383 }
2704  006b 85            	popw	x
2705  006c 81            	ret
2769                     ; 389 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
2769                     ; 390 {
2770                     .text:	section	.text,new
2771  0000               _sicp_receipt_OK:
2773  0000 89            	pushw	x
2774  0001 5237          	subw	sp,#55
2775       00000037      OFST:	set	55
2778                     ; 392 	receipt.frame_h1 = 0xEE;
2780  0003 a6ee          	ld	a,#238
2781  0005 6b01          	ld	(OFST-54,sp),a
2782                     ; 393 	receipt.frame_h2 = 0xAA;
2784  0007 a6aa          	ld	a,#170
2785  0009 6b02          	ld	(OFST-53,sp),a
2786                     ; 394 	receipt.message_id = send_message_id;
2788  000b 9f            	ld	a,xl
2789  000c 6b03          	ld	(OFST-52,sp),a
2790                     ; 395 	receipt.mesh_id_H = send_mesh_id_H;
2792  000e 7b3c          	ld	a,(OFST+5,sp)
2793  0010 6b04          	ld	(OFST-51,sp),a
2794                     ; 396 	receipt.mesh_id_L = send_mesh_id_L;
2796  0012 7b3d          	ld	a,(OFST+6,sp)
2797  0014 6b05          	ld	(OFST-50,sp),a
2798                     ; 397 	receipt.payload[0] = 0xAA;
2800  0016 a6aa          	ld	a,#170
2801  0018 6b06          	ld	(OFST-49,sp),a
2802                     ; 398 	receipt.payload[1] = type;
2804  001a 9e            	ld	a,xh
2805  001b 6b07          	ld	(OFST-48,sp),a
2806                     ; 399 	sicp_send_message(&receipt,2);
2808  001d 4b02          	push	#2
2809  001f 96            	ldw	x,sp
2810  0020 1c0002        	addw	x,#OFST-53
2811  0023 cd0000        	call	_sicp_send_message
2813  0026 84            	pop	a
2814                     ; 400 }
2817  0027 5b39          	addw	sp,#57
2818  0029 81            	ret
2904                     ; 402 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
2904                     ; 403 {
2905                     .text:	section	.text,new
2906  0000               _sicp_receipt_Done:
2908  0000 89            	pushw	x
2909  0001 5238          	subw	sp,#56
2910       00000038      OFST:	set	56
2913                     ; 404 	u8 i = 0;
2915  0003 0f38          	clr	(OFST+0,sp)
2916                     ; 406 	receipt.frame_h1 = 0xEE;
2918  0005 a6ee          	ld	a,#238
2919  0007 6b01          	ld	(OFST-55,sp),a
2920                     ; 407 	receipt.frame_h2 = 0xAA;
2922  0009 a6aa          	ld	a,#170
2923  000b 6b02          	ld	(OFST-54,sp),a
2924                     ; 408 	receipt.message_id = send_message_id;
2926  000d 9f            	ld	a,xl
2927  000e 6b03          	ld	(OFST-53,sp),a
2928                     ; 409 	receipt.mesh_id_H = send_mesh_id_H;
2930  0010 7b3d          	ld	a,(OFST+5,sp)
2931  0012 6b04          	ld	(OFST-52,sp),a
2932                     ; 410 	receipt.mesh_id_L = send_mesh_id_L;
2934  0014 7b3e          	ld	a,(OFST+6,sp)
2935  0016 6b05          	ld	(OFST-51,sp),a
2936                     ; 411 	receipt.payload[0] = 0xAA;
2938  0018 a6aa          	ld	a,#170
2939  001a 6b06          	ld	(OFST-50,sp),a
2940                     ; 412 	receipt.payload[1] = type;
2942  001c 9e            	ld	a,xh
2943  001d 6b07          	ld	(OFST-49,sp),a
2944                     ; 413 	switch(method){
2946  001f 7b3f          	ld	a,(OFST+7,sp)
2948                     ; 440 		default:
2948                     ; 441 		break;
2949  0021 4a            	dec	a
2950  0022 2707          	jreq	L3721
2951  0024 4a            	dec	a
2952  0025 2766          	jreq	L5721
2953  0027 aced00ed      	jpf	L7331
2954  002b               L3721:
2955                     ; 414 		case 0x01://action Dimmer调光的执行回执
2955                     ; 415 		receipt.payload[2] = mdid;
2957  002b 7b40          	ld	a,(OFST+8,sp)
2958  002d 6b08          	ld	(OFST-48,sp),a
2959                     ; 416 		for(i = 0;i < 15;i++){
2961  002f 0f38          	clr	(OFST+0,sp)
2962  0031               L1431:
2963                     ; 417 			if(sc.slc[i].MDID == mdid){
2965  0031 7b38          	ld	a,(OFST+0,sp)
2966  0033 97            	ld	xl,a
2967  0034 a61a          	ld	a,#26
2968  0036 42            	mul	x,a
2969  0037 7b40          	ld	a,(OFST+8,sp)
2970  0039 905f          	clrw	y
2971  003b 9097          	ld	yl,a
2972  003d 90bf00        	ldw	c_y,y
2973  0040 9093          	ldw	y,x
2974  0042 90de025f      	ldw	y,(_sc+464,y)
2975  0046 90b300        	cpw	y,c_y
2976  0049 2638          	jrne	L7431
2977                     ; 418 				receipt.payload[3] = sc.slc[i].ch1_status;
2979  004b 7b38          	ld	a,(OFST+0,sp)
2980  004d 97            	ld	xl,a
2981  004e a61a          	ld	a,#26
2982  0050 42            	mul	x,a
2983  0051 d60261        	ld	a,(_sc+466,x)
2984  0054 6b09          	ld	(OFST-47,sp),a
2985                     ; 419 				receipt.payload[4] = sc.slc[i].ch2_status;
2987  0056 7b38          	ld	a,(OFST+0,sp)
2988  0058 97            	ld	xl,a
2989  0059 a61a          	ld	a,#26
2990  005b 42            	mul	x,a
2991  005c d60262        	ld	a,(_sc+467,x)
2992  005f 6b0a          	ld	(OFST-46,sp),a
2993                     ; 420 				receipt.payload[5] = sc.slc[i].ch3_status;
2995  0061 7b38          	ld	a,(OFST+0,sp)
2996  0063 97            	ld	xl,a
2997  0064 a61a          	ld	a,#26
2998  0066 42            	mul	x,a
2999  0067 d60263        	ld	a,(_sc+468,x)
3000  006a 6b0b          	ld	(OFST-45,sp),a
3001                     ; 421 				receipt.payload[6] = sc.slc[i].ch4_status;
3003  006c 7b38          	ld	a,(OFST+0,sp)
3004  006e 97            	ld	xl,a
3005  006f a61a          	ld	a,#26
3006  0071 42            	mul	x,a
3007  0072 d60264        	ld	a,(_sc+469,x)
3008  0075 6b0c          	ld	(OFST-44,sp),a
3009                     ; 422 				sicp_send_message(&receipt,7);
3011  0077 4b07          	push	#7
3012  0079 96            	ldw	x,sp
3013  007a 1c0002        	addw	x,#OFST-54
3014  007d cd0000        	call	_sicp_send_message
3016  0080 84            	pop	a
3017                     ; 423 				break;
3019  0081 206a          	jra	L7331
3020  0083               L7431:
3021                     ; 416 		for(i = 0;i < 15;i++){
3023  0083 0c38          	inc	(OFST+0,sp)
3026  0085 7b38          	ld	a,(OFST+0,sp)
3027  0087 a10f          	cp	a,#15
3028  0089 25a6          	jrult	L1431
3029  008b 2060          	jra	L7331
3030  008d               L5721:
3031                     ; 427 		case 0x02://action plug switch打开或关闭开关的执行回执
3031                     ; 428 		receipt.payload[2] = mdid;
3033  008d 7b40          	ld	a,(OFST+8,sp)
3034  008f 6b08          	ld	(OFST-48,sp),a
3035                     ; 429 		for(i = 0;i < 15;i++){
3037  0091 0f38          	clr	(OFST+0,sp)
3038  0093               L1531:
3039                     ; 430 			if(sc.spc[i].MDID == mdid){
3041  0093 7b38          	ld	a,(OFST+0,sp)
3042  0095 97            	ld	xl,a
3043  0096 a61c          	ld	a,#28
3044  0098 42            	mul	x,a
3045  0099 7b40          	ld	a,(OFST+8,sp)
3046  009b 905f          	clrw	y
3047  009d 9097          	ld	yl,a
3048  009f 90bf00        	ldw	c_y,y
3049  00a2 9093          	ldw	y,x
3050  00a4 90de00bb      	ldw	y,(_sc+44,y)
3051  00a8 90b300        	cpw	y,c_y
3052  00ab 2638          	jrne	L7531
3053                     ; 431 				receipt.payload[3] = sc.spc[i].ch1_status;
3055  00ad 7b38          	ld	a,(OFST+0,sp)
3056  00af 97            	ld	xl,a
3057  00b0 a61c          	ld	a,#28
3058  00b2 42            	mul	x,a
3059  00b3 d600bd        	ld	a,(_sc+46,x)
3060  00b6 6b09          	ld	(OFST-47,sp),a
3061                     ; 432 				receipt.payload[4] = sc.spc[i].ch2_status;
3063  00b8 7b38          	ld	a,(OFST+0,sp)
3064  00ba 97            	ld	xl,a
3065  00bb a61c          	ld	a,#28
3066  00bd 42            	mul	x,a
3067  00be d600be        	ld	a,(_sc+47,x)
3068  00c1 6b0a          	ld	(OFST-46,sp),a
3069                     ; 433 				receipt.payload[5] = sc.spc[i].ch3_status;
3071  00c3 7b38          	ld	a,(OFST+0,sp)
3072  00c5 97            	ld	xl,a
3073  00c6 a61c          	ld	a,#28
3074  00c8 42            	mul	x,a
3075  00c9 d600bf        	ld	a,(_sc+48,x)
3076  00cc 6b0b          	ld	(OFST-45,sp),a
3077                     ; 434 				receipt.payload[6] = sc.spc[i].ch4_status;
3079  00ce 7b38          	ld	a,(OFST+0,sp)
3080  00d0 97            	ld	xl,a
3081  00d1 a61c          	ld	a,#28
3082  00d3 42            	mul	x,a
3083  00d4 d600c0        	ld	a,(_sc+49,x)
3084  00d7 6b0c          	ld	(OFST-44,sp),a
3085                     ; 435 				sicp_send_message(&receipt,7);
3087  00d9 4b07          	push	#7
3088  00db 96            	ldw	x,sp
3089  00dc 1c0002        	addw	x,#OFST-54
3090  00df cd0000        	call	_sicp_send_message
3092  00e2 84            	pop	a
3093                     ; 436 				break;
3095  00e3 2008          	jra	L7331
3096  00e5               L7531:
3097                     ; 429 		for(i = 0;i < 15;i++){
3099  00e5 0c38          	inc	(OFST+0,sp)
3102  00e7 7b38          	ld	a,(OFST+0,sp)
3103  00e9 a10f          	cp	a,#15
3104  00eb 25a6          	jrult	L1531
3105  00ed               L7721:
3106                     ; 440 		default:
3106                     ; 441 		break;
3108  00ed               L7331:
3109                     ; 443 }
3112  00ed 5b3a          	addw	sp,#58
3113  00ef 81            	ret
3167                     ; 446 void rev_cmd_data(u8 moduleid){
3168                     .text:	section	.text,new
3169  0000               _rev_cmd_data:
3171  0000 88            	push	a
3172  0001 5238          	subw	sp,#56
3173       00000038      OFST:	set	56
3176                     ; 449 	for(i = 0;i < 15;i++){
3178  0003 0f01          	clr	(OFST-55,sp)
3179  0005               L3041:
3180                     ; 450 		if(sc.slc[i].MDID == moduleid){
3182  0005 7b01          	ld	a,(OFST-55,sp)
3183  0007 97            	ld	xl,a
3184  0008 a61a          	ld	a,#26
3185  000a 42            	mul	x,a
3186  000b 7b39          	ld	a,(OFST+1,sp)
3187  000d 905f          	clrw	y
3188  000f 9097          	ld	yl,a
3189  0011 90bf00        	ldw	c_y,y
3190  0014 9093          	ldw	y,x
3191  0016 90de025f      	ldw	y,(_sc+464,y)
3192  001a 90b300        	cpw	y,c_y
3193  001d 2657          	jrne	L1141
3194                     ; 451 			cmd_data.frame_h1 = 0xEE;
3196  001f a6ee          	ld	a,#238
3197  0021 6b02          	ld	(OFST-54,sp),a
3198                     ; 452 			cmd_data.frame_h2 = 0xAA;
3200  0023 a6aa          	ld	a,#170
3201  0025 6b03          	ld	(OFST-53,sp),a
3202                     ; 453 			cmd_data.message_id = rev_message_id;
3204  0027 c60087        	ld	a,_rev_message_id
3205  002a 6b04          	ld	(OFST-52,sp),a
3206                     ; 454 			cmd_data.mesh_id_H = ns_own_meshid_H;
3208  002c c6008b        	ld	a,_ns_own_meshid_H
3209  002f 6b05          	ld	(OFST-51,sp),a
3210                     ; 455 			cmd_data.mesh_id_L = ns_own_meshid_L;
3212  0031 c6008a        	ld	a,_ns_own_meshid_L
3213  0034 6b06          	ld	(OFST-50,sp),a
3214                     ; 456 			cmd_data.payload[0] = 0x06;
3216  0036 a606          	ld	a,#6
3217  0038 6b07          	ld	(OFST-49,sp),a
3218                     ; 457 			cmd_data.payload[1] = moduleid;
3220  003a 7b39          	ld	a,(OFST+1,sp)
3221  003c 6b08          	ld	(OFST-48,sp),a
3222                     ; 458 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3224  003e 7b01          	ld	a,(OFST-55,sp)
3225  0040 97            	ld	xl,a
3226  0041 a61a          	ld	a,#26
3227  0043 42            	mul	x,a
3228  0044 d60261        	ld	a,(_sc+466,x)
3229  0047 6b09          	ld	(OFST-47,sp),a
3230                     ; 459 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3232  0049 7b01          	ld	a,(OFST-55,sp)
3233  004b 97            	ld	xl,a
3234  004c a61a          	ld	a,#26
3235  004e 42            	mul	x,a
3236  004f d60262        	ld	a,(_sc+467,x)
3237  0052 6b0a          	ld	(OFST-46,sp),a
3238                     ; 460 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3240  0054 7b01          	ld	a,(OFST-55,sp)
3241  0056 97            	ld	xl,a
3242  0057 a61a          	ld	a,#26
3243  0059 42            	mul	x,a
3244  005a d60263        	ld	a,(_sc+468,x)
3245  005d 6b0b          	ld	(OFST-45,sp),a
3246                     ; 461 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3248  005f 7b01          	ld	a,(OFST-55,sp)
3249  0061 97            	ld	xl,a
3250  0062 a61a          	ld	a,#26
3251  0064 42            	mul	x,a
3252  0065 d60264        	ld	a,(_sc+469,x)
3253  0068 6b0c          	ld	(OFST-44,sp),a
3254                     ; 462 			sicp_send_message(&cmd_data,6);
3256  006a 4b06          	push	#6
3257  006c 96            	ldw	x,sp
3258  006d 1c0003        	addw	x,#OFST-53
3259  0070 cd0000        	call	_sicp_send_message
3261  0073 84            	pop	a
3262                     ; 463 			break;
3264  0074 207c          	jra	L7041
3265  0076               L1141:
3266                     ; 465 		if(sc.spc[i].MDID == moduleid){
3268  0076 7b01          	ld	a,(OFST-55,sp)
3269  0078 97            	ld	xl,a
3270  0079 a61c          	ld	a,#28
3271  007b 42            	mul	x,a
3272  007c 7b39          	ld	a,(OFST+1,sp)
3273  007e 905f          	clrw	y
3274  0080 9097          	ld	yl,a
3275  0082 90bf00        	ldw	c_y,y
3276  0085 9093          	ldw	y,x
3277  0087 90de00bb      	ldw	y,(_sc+44,y)
3278  008b 90b300        	cpw	y,c_y
3279  008e 2657          	jrne	L3141
3280                     ; 466 			cmd_data.frame_h1 = 0xEE;
3282  0090 a6ee          	ld	a,#238
3283  0092 6b02          	ld	(OFST-54,sp),a
3284                     ; 467 			cmd_data.frame_h2 = 0xAA;
3286  0094 a6aa          	ld	a,#170
3287  0096 6b03          	ld	(OFST-53,sp),a
3288                     ; 468 			cmd_data.message_id = rev_message_id;
3290  0098 c60087        	ld	a,_rev_message_id
3291  009b 6b04          	ld	(OFST-52,sp),a
3292                     ; 469 			cmd_data.mesh_id_H = ns_own_meshid_H;
3294  009d c6008b        	ld	a,_ns_own_meshid_H
3295  00a0 6b05          	ld	(OFST-51,sp),a
3296                     ; 470 			cmd_data.mesh_id_L = ns_own_meshid_L;
3298  00a2 c6008a        	ld	a,_ns_own_meshid_L
3299  00a5 6b06          	ld	(OFST-50,sp),a
3300                     ; 471 			cmd_data.payload[0] = 0x06;
3302  00a7 a606          	ld	a,#6
3303  00a9 6b07          	ld	(OFST-49,sp),a
3304                     ; 472 			cmd_data.payload[1] = moduleid;
3306  00ab 7b39          	ld	a,(OFST+1,sp)
3307  00ad 6b08          	ld	(OFST-48,sp),a
3308                     ; 473 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3310  00af 7b01          	ld	a,(OFST-55,sp)
3311  00b1 97            	ld	xl,a
3312  00b2 a61c          	ld	a,#28
3313  00b4 42            	mul	x,a
3314  00b5 d600bd        	ld	a,(_sc+46,x)
3315  00b8 6b09          	ld	(OFST-47,sp),a
3316                     ; 474 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3318  00ba 7b01          	ld	a,(OFST-55,sp)
3319  00bc 97            	ld	xl,a
3320  00bd a61c          	ld	a,#28
3321  00bf 42            	mul	x,a
3322  00c0 d600be        	ld	a,(_sc+47,x)
3323  00c3 6b0a          	ld	(OFST-46,sp),a
3324                     ; 475 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3326  00c5 7b01          	ld	a,(OFST-55,sp)
3327  00c7 97            	ld	xl,a
3328  00c8 a61c          	ld	a,#28
3329  00ca 42            	mul	x,a
3330  00cb d600bf        	ld	a,(_sc+48,x)
3331  00ce 6b0b          	ld	(OFST-45,sp),a
3332                     ; 476 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3334  00d0 7b01          	ld	a,(OFST-55,sp)
3335  00d2 97            	ld	xl,a
3336  00d3 a61c          	ld	a,#28
3337  00d5 42            	mul	x,a
3338  00d6 d600c0        	ld	a,(_sc+49,x)
3339  00d9 6b0c          	ld	(OFST-44,sp),a
3340                     ; 477 			sicp_send_message(&cmd_data,6);
3342  00db 4b06          	push	#6
3343  00dd 96            	ldw	x,sp
3344  00de 1c0003        	addw	x,#OFST-53
3345  00e1 cd0000        	call	_sicp_send_message
3347  00e4 84            	pop	a
3348                     ; 478 			break;
3350  00e5 200b          	jra	L7041
3351  00e7               L3141:
3352                     ; 449 	for(i = 0;i < 15;i++){
3354  00e7 0c01          	inc	(OFST-55,sp)
3357  00e9 7b01          	ld	a,(OFST-55,sp)
3358  00eb a10f          	cp	a,#15
3359  00ed 2403          	jruge	L411
3360  00ef cc0005        	jp	L3041
3361  00f2               L411:
3362  00f2               L7041:
3363                     ; 481 }
3366  00f2 5b39          	addw	sp,#57
3367  00f4 81            	ret
3370                     	switch	.data
3371  0000               L5141_eg_timeout:
3372  0000 0000          	dc.w	0
3427                     ; 484 void report_energy_consum(void){
3428                     .text:	section	.text,new
3429  0000               _report_energy_consum:
3431  0000 5238          	subw	sp,#56
3432       00000038      OFST:	set	56
3435                     ; 488 	systime_count[3]++;
3437  0002 ce0006        	ldw	x,_systime_count+6
3438  0005 1c0001        	addw	x,#1
3439  0008 cf0006        	ldw	_systime_count+6,x
3440                     ; 489 	if(systime_count[3] >= 60){
3442  000b ce0006        	ldw	x,_systime_count+6
3443  000e a3003c        	cpw	x,#60
3444  0011 2403          	jruge	L021
3445  0013 cc00a2        	jp	L1441
3446  0016               L021:
3447                     ; 490 		systime_count[3] = 0;
3449  0016 5f            	clrw	x
3450  0017 cf0006        	ldw	_systime_count+6,x
3451                     ; 491 		systime_count[4]++;
3453  001a ce0008        	ldw	x,_systime_count+8
3454  001d 1c0001        	addw	x,#1
3455  0020 cf0008        	ldw	_systime_count+8,x
3456                     ; 492 		if(systime_count[4] >= 30){
3458  0023 ce0008        	ldw	x,_systime_count+8
3459  0026 a3001e        	cpw	x,#30
3460  0029 2577          	jrult	L1441
3461                     ; 493 			systime_count[4] = 0;
3463  002b 5f            	clrw	x
3464  002c cf0008        	ldw	_systime_count+8,x
3465                     ; 494 			i2c_get_energy_consum();
3467  002f cd0000        	call	_i2c_get_energy_consum
3469                     ; 495 			for(i = 0; i < 15; i++){
3471  0032 0f01          	clr	(OFST-55,sp)
3472  0034               L5441:
3473                     ; 496 				if(sc.spc[i].MDID){//有ID说明SPC存在
3475  0034 7b01          	ld	a,(OFST-55,sp)
3476  0036 97            	ld	xl,a
3477  0037 a61c          	ld	a,#28
3478  0039 42            	mul	x,a
3479  003a d600bc        	ld	a,(_sc+45,x)
3480  003d da00bb        	or	a,(_sc+44,x)
3481  0040 2758          	jreq	L3541
3482                     ; 497 				ec.frame_h1 = 0xEE;
3484  0042 a6ee          	ld	a,#238
3485  0044 6b02          	ld	(OFST-54,sp),a
3486                     ; 498 				ec.frame_h2 = 0xEE;
3488  0046 a6ee          	ld	a,#238
3489  0048 6b03          	ld	(OFST-53,sp),a
3490                     ; 499 				ec.message_id = i+1;
3492  004a 7b01          	ld	a,(OFST-55,sp)
3493  004c 4c            	inc	a
3494  004d 6b04          	ld	(OFST-52,sp),a
3495                     ; 500 				ec.mesh_id_H = ns_own_meshid_H;
3497  004f c6008b        	ld	a,_ns_own_meshid_H
3498  0052 6b05          	ld	(OFST-51,sp),a
3499                     ; 501 				ec.mesh_id_L = ns_own_meshid_L;
3501  0054 c6008a        	ld	a,_ns_own_meshid_L
3502  0057 6b06          	ld	(OFST-50,sp),a
3503                     ; 502 				ec.payload[0] = 0x2A;
3505  0059 a62a          	ld	a,#42
3506  005b 6b07          	ld	(OFST-49,sp),a
3507                     ; 503 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3509  005d 7b01          	ld	a,(OFST-55,sp)
3510  005f 97            	ld	xl,a
3511  0060 a61c          	ld	a,#28
3512  0062 42            	mul	x,a
3513  0063 de00c1        	ldw	x,(_sc+50,x)
3514  0066 01            	rrwa	x,a
3515  0067 9f            	ld	a,xl
3516  0068 a4ff          	and	a,#255
3517  006a 97            	ld	xl,a
3518  006b 4f            	clr	a
3519  006c 02            	rlwa	x,a
3520  006d 4f            	clr	a
3521  006e 01            	rrwa	x,a
3522  006f 9f            	ld	a,xl
3523  0070 6b08          	ld	(OFST-48,sp),a
3524                     ; 504 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3526  0072 7b01          	ld	a,(OFST-55,sp)
3527  0074 97            	ld	xl,a
3528  0075 a61c          	ld	a,#28
3529  0077 42            	mul	x,a
3530  0078 d600c2        	ld	a,(_sc+51,x)
3531  007b a4ff          	and	a,#255
3532  007d 6b09          	ld	(OFST-47,sp),a
3533                     ; 505 				ec.payload[3] =	sc.spc[i].MDID;
3535  007f 7b01          	ld	a,(OFST-55,sp)
3536  0081 97            	ld	xl,a
3537  0082 a61c          	ld	a,#28
3538  0084 42            	mul	x,a
3539  0085 d600bc        	ld	a,(_sc+45,x)
3540  0088 6b0a          	ld	(OFST-46,sp),a
3541                     ; 506 				sicp_send_message(&ec,4);
3543  008a 4b04          	push	#4
3544  008c 96            	ldw	x,sp
3545  008d 1c0003        	addw	x,#OFST-53
3546  0090 cd0000        	call	_sicp_send_message
3548  0093 84            	pop	a
3549                     ; 507 				eg_timeout = 5;
3551  0094 ae0005        	ldw	x,#5
3552  0097 cf0000        	ldw	L5141_eg_timeout,x
3553  009a               L3541:
3554                     ; 495 			for(i = 0; i < 15; i++){
3556  009a 0c01          	inc	(OFST-55,sp)
3559  009c 7b01          	ld	a,(OFST-55,sp)
3560  009e a10f          	cp	a,#15
3561  00a0 2592          	jrult	L5441
3562  00a2               L1441:
3563                     ; 513 	if(eg_timeout){
3565  00a2 ce0000        	ldw	x,L5141_eg_timeout
3566  00a5 2603          	jrne	L221
3567  00a7 cc0135        	jp	L5541
3568  00aa               L221:
3569                     ; 514 		if(--eg_timeout == 0){
3571  00aa ce0000        	ldw	x,L5141_eg_timeout
3572  00ad 1d0001        	subw	x,#1
3573  00b0 cf0000        	ldw	L5141_eg_timeout,x
3574  00b3 26f2          	jrne	L5541
3575                     ; 515 			for(i = 0;i < 15;i++){
3577  00b5 0f01          	clr	(OFST-55,sp)
3578  00b7               L1641:
3579                     ; 516 			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3581  00b7 7b01          	ld	a,(OFST-55,sp)
3582  00b9 97            	ld	xl,a
3583  00ba a61c          	ld	a,#28
3584  00bc 42            	mul	x,a
3585  00bd d600bc        	ld	a,(_sc+45,x)
3586  00c0 da00bb        	or	a,(_sc+44,x)
3587  00c3 2768          	jreq	L7641
3589  00c5 7b01          	ld	a,(OFST-55,sp)
3590  00c7 97            	ld	xl,a
3591  00c8 a61c          	ld	a,#28
3592  00ca 42            	mul	x,a
3593  00cb d600c3        	ld	a,(_sc+52,x)
3594  00ce a501          	bcp	a,#1
3595  00d0 265b          	jrne	L7641
3596                     ; 517 				ec.frame_h1 = 0xEE;
3598  00d2 a6ee          	ld	a,#238
3599  00d4 6b02          	ld	(OFST-54,sp),a
3600                     ; 518 				ec.frame_h2 = 0xEE;
3602  00d6 a6ee          	ld	a,#238
3603  00d8 6b03          	ld	(OFST-53,sp),a
3604                     ; 519 				ec.message_id = random(TIM4->CNTR);
3606  00da c65344        	ld	a,21316
3607  00dd cd0000        	call	_random
3609  00e0 6b04          	ld	(OFST-52,sp),a
3610                     ; 520 				ec.mesh_id_H = ns_own_meshid_H;
3612  00e2 c6008b        	ld	a,_ns_own_meshid_H
3613  00e5 6b05          	ld	(OFST-51,sp),a
3614                     ; 521 				ec.mesh_id_L = ns_own_meshid_L;
3616  00e7 c6008a        	ld	a,_ns_own_meshid_L
3617  00ea 6b06          	ld	(OFST-50,sp),a
3618                     ; 522 				ec.payload[0] = 0x2A;
3620  00ec a62a          	ld	a,#42
3621  00ee 6b07          	ld	(OFST-49,sp),a
3622                     ; 523 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3624  00f0 7b01          	ld	a,(OFST-55,sp)
3625  00f2 97            	ld	xl,a
3626  00f3 a61c          	ld	a,#28
3627  00f5 42            	mul	x,a
3628  00f6 de00c1        	ldw	x,(_sc+50,x)
3629  00f9 01            	rrwa	x,a
3630  00fa 9f            	ld	a,xl
3631  00fb a4ff          	and	a,#255
3632  00fd 97            	ld	xl,a
3633  00fe 4f            	clr	a
3634  00ff 02            	rlwa	x,a
3635  0100 4f            	clr	a
3636  0101 01            	rrwa	x,a
3637  0102 9f            	ld	a,xl
3638  0103 6b08          	ld	(OFST-48,sp),a
3639                     ; 524 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3641  0105 7b01          	ld	a,(OFST-55,sp)
3642  0107 97            	ld	xl,a
3643  0108 a61c          	ld	a,#28
3644  010a 42            	mul	x,a
3645  010b d600c2        	ld	a,(_sc+51,x)
3646  010e a4ff          	and	a,#255
3647  0110 6b09          	ld	(OFST-47,sp),a
3648                     ; 525 				ec.payload[3] =	sc.spc[i].MDID;
3650  0112 7b01          	ld	a,(OFST-55,sp)
3651  0114 97            	ld	xl,a
3652  0115 a61c          	ld	a,#28
3653  0117 42            	mul	x,a
3654  0118 d600bc        	ld	a,(_sc+45,x)
3655  011b 6b0a          	ld	(OFST-46,sp),a
3656                     ; 526 				sicp_send_message(&ec,4);
3658  011d 4b04          	push	#4
3659  011f 96            	ldw	x,sp
3660  0120 1c0003        	addw	x,#OFST-53
3661  0123 cd0000        	call	_sicp_send_message
3663  0126 84            	pop	a
3664                     ; 527 				eg_timeout = 5;//每5s重发1次直到接收到回执为止
3666  0127 ae0005        	ldw	x,#5
3667  012a cf0000        	ldw	L5141_eg_timeout,x
3668  012d               L7641:
3669                     ; 515 			for(i = 0;i < 15;i++){
3671  012d 0c01          	inc	(OFST-55,sp)
3674  012f 7b01          	ld	a,(OFST-55,sp)
3675  0131 a10f          	cp	a,#15
3676  0133 2582          	jrult	L1641
3677  0135               L5541:
3678                     ; 532 }
3681  0135 5b38          	addw	sp,#56
3682  0137 81            	ret
3722                     ; 535 void send_sc_device_info(void)
3722                     ; 536 {
3723                     .text:	section	.text,new
3724  0000               _send_sc_device_info:
3726  0000 5237          	subw	sp,#55
3727       00000037      OFST:	set	55
3730                     ; 539 	di.frame_h1 = 0xEE;
3732  0002 a6ee          	ld	a,#238
3733  0004 6b01          	ld	(OFST-54,sp),a
3734                     ; 540 	di.frame_h2 = 0xEE;
3736  0006 a6ee          	ld	a,#238
3737  0008 6b02          	ld	(OFST-53,sp),a
3738                     ; 541 	di.message_id = 16;
3740  000a a610          	ld	a,#16
3741  000c 6b03          	ld	(OFST-52,sp),a
3742                     ; 542 	di.mesh_id_H = ns_own_meshid_H;
3744  000e c6008b        	ld	a,_ns_own_meshid_H
3745  0011 6b04          	ld	(OFST-51,sp),a
3746                     ; 543 	di.mesh_id_L = ns_own_meshid_L;
3748  0013 c6008a        	ld	a,_ns_own_meshid_L
3749  0016 6b05          	ld	(OFST-50,sp),a
3750                     ; 544 	di.payload[0] = 0xB1;
3752  0018 a6b1          	ld	a,#177
3753  001a 6b06          	ld	(OFST-49,sp),a
3754                     ; 545 	di.payload[1] =	sc.deviceid[0];
3756  001c c60091        	ld	a,_sc+2
3757  001f 6b07          	ld	(OFST-48,sp),a
3758                     ; 546 	di.payload[2] =	sc.deviceid[0];
3760  0021 c60091        	ld	a,_sc+2
3761  0024 6b08          	ld	(OFST-47,sp),a
3762                     ; 547 	di.payload[3] =	sc.deviceid[0];
3764  0026 c60091        	ld	a,_sc+2
3765  0029 6b09          	ld	(OFST-46,sp),a
3766                     ; 548 	di.payload[4] =	sc.deviceid[0];
3768  002b c60091        	ld	a,_sc+2
3769  002e 6b0a          	ld	(OFST-45,sp),a
3770                     ; 549 	di.payload[5] =	sc.model;
3772  0030 c60097        	ld	a,_sc+8
3773  0033 6b0b          	ld	(OFST-44,sp),a
3774                     ; 550 	di.payload[6] = sc.firmware;
3776  0035 c60095        	ld	a,_sc+6
3777  0038 6b0c          	ld	(OFST-43,sp),a
3778                     ; 551 	di.payload[7] = sc.HWTtest;
3780  003a c60096        	ld	a,_sc+7
3781  003d 6b0d          	ld	(OFST-42,sp),a
3782                     ; 552 	di.payload[8] = sc.Ndevice;
3784  003f c600a2        	ld	a,_sc+19
3785  0042 6b0e          	ld	(OFST-41,sp),a
3786                     ; 553 	sicp_send_message(&di,9);
3788  0044 4b09          	push	#9
3789  0046 96            	ldw	x,sp
3790  0047 1c0002        	addw	x,#OFST-53
3791  004a cd0000        	call	_sicp_send_message
3793  004d 84            	pop	a
3794                     ; 554 }
3797  004e 5b37          	addw	sp,#55
3798  0050 81            	ret
3845                     ; 556 void send_slc_device_info(u8 i)
3845                     ; 557 {
3846                     .text:	section	.text,new
3847  0000               _send_slc_device_info:
3849  0000 88            	push	a
3850  0001 5237          	subw	sp,#55
3851       00000037      OFST:	set	55
3854                     ; 559 	di.frame_h1 = 0xEE;
3856  0003 a6ee          	ld	a,#238
3857  0005 6b01          	ld	(OFST-54,sp),a
3858                     ; 560 	di.frame_h2 = 0xEE;
3860  0007 a6ee          	ld	a,#238
3861  0009 6b02          	ld	(OFST-53,sp),a
3862                     ; 561 	di.message_id = 21+i;
3864  000b 7b38          	ld	a,(OFST+1,sp)
3865  000d ab15          	add	a,#21
3866  000f 6b03          	ld	(OFST-52,sp),a
3867                     ; 562 	di.mesh_id_H = ns_own_meshid_H;
3869  0011 c6008b        	ld	a,_ns_own_meshid_H
3870  0014 6b04          	ld	(OFST-51,sp),a
3871                     ; 563 	di.mesh_id_L = ns_own_meshid_L;
3873  0016 c6008a        	ld	a,_ns_own_meshid_L
3874  0019 6b05          	ld	(OFST-50,sp),a
3875                     ; 564 	di.payload[0] = 0xB2;
3877  001b a6b2          	ld	a,#178
3878  001d 6b06          	ld	(OFST-49,sp),a
3879                     ; 565 	di.payload[1] =	sc.slc[i].deviceid[0];
3881  001f 7b38          	ld	a,(OFST+1,sp)
3882  0021 97            	ld	xl,a
3883  0022 a61a          	ld	a,#26
3884  0024 42            	mul	x,a
3885  0025 d6024e        	ld	a,(_sc+447,x)
3886  0028 6b07          	ld	(OFST-48,sp),a
3887                     ; 566 	di.payload[2] =	sc.slc[i].deviceid[0];
3889  002a 7b38          	ld	a,(OFST+1,sp)
3890  002c 97            	ld	xl,a
3891  002d a61a          	ld	a,#26
3892  002f 42            	mul	x,a
3893  0030 d6024e        	ld	a,(_sc+447,x)
3894  0033 6b08          	ld	(OFST-47,sp),a
3895                     ; 567 	di.payload[3] =	sc.slc[i].deviceid[0];
3897  0035 7b38          	ld	a,(OFST+1,sp)
3898  0037 97            	ld	xl,a
3899  0038 a61a          	ld	a,#26
3900  003a 42            	mul	x,a
3901  003b d6024e        	ld	a,(_sc+447,x)
3902  003e 6b09          	ld	(OFST-46,sp),a
3903                     ; 568 	di.payload[4] =	sc.slc[i].deviceid[0];
3905  0040 7b38          	ld	a,(OFST+1,sp)
3906  0042 97            	ld	xl,a
3907  0043 a61a          	ld	a,#26
3908  0045 42            	mul	x,a
3909  0046 d6024e        	ld	a,(_sc+447,x)
3910  0049 6b0a          	ld	(OFST-45,sp),a
3911                     ; 569 	di.payload[5] =	sc.slc[i].model;
3913  004b 7b38          	ld	a,(OFST+1,sp)
3914  004d 97            	ld	xl,a
3915  004e a61a          	ld	a,#26
3916  0050 42            	mul	x,a
3917  0051 d60254        	ld	a,(_sc+453,x)
3918  0054 6b0b          	ld	(OFST-44,sp),a
3919                     ; 570 	di.payload[6] = sc.slc[i].firmware;
3921  0056 7b38          	ld	a,(OFST+1,sp)
3922  0058 97            	ld	xl,a
3923  0059 a61a          	ld	a,#26
3924  005b 42            	mul	x,a
3925  005c d60252        	ld	a,(_sc+451,x)
3926  005f 6b0c          	ld	(OFST-43,sp),a
3927                     ; 571 	di.payload[7] = sc.slc[i].HWTtest;
3929  0061 7b38          	ld	a,(OFST+1,sp)
3930  0063 97            	ld	xl,a
3931  0064 a61a          	ld	a,#26
3932  0066 42            	mul	x,a
3933  0067 d60253        	ld	a,(_sc+452,x)
3934  006a 6b0d          	ld	(OFST-42,sp),a
3935                     ; 572 	di.payload[8] = sc.slc[i].MDID;
3937  006c 7b38          	ld	a,(OFST+1,sp)
3938  006e 97            	ld	xl,a
3939  006f a61a          	ld	a,#26
3940  0071 42            	mul	x,a
3941  0072 d60260        	ld	a,(_sc+465,x)
3942  0075 6b0e          	ld	(OFST-41,sp),a
3943                     ; 573 	sicp_send_message(&di,9);
3945  0077 4b09          	push	#9
3946  0079 96            	ldw	x,sp
3947  007a 1c0002        	addw	x,#OFST-53
3948  007d cd0000        	call	_sicp_send_message
3950  0080 84            	pop	a
3951                     ; 574 }
3954  0081 5b38          	addw	sp,#56
3955  0083 81            	ret
4002                     ; 576 void send_spc_device_info(u8 i)
4002                     ; 577 {
4003                     .text:	section	.text,new
4004  0000               _send_spc_device_info:
4006  0000 88            	push	a
4007  0001 5237          	subw	sp,#55
4008       00000037      OFST:	set	55
4011                     ; 579 	di.frame_h1 = 0xEE;
4013  0003 a6ee          	ld	a,#238
4014  0005 6b01          	ld	(OFST-54,sp),a
4015                     ; 580 	di.frame_h2 = 0xEE;
4017  0007 a6ee          	ld	a,#238
4018  0009 6b02          	ld	(OFST-53,sp),a
4019                     ; 581 	di.message_id = 36+i;
4021  000b 7b38          	ld	a,(OFST+1,sp)
4022  000d ab24          	add	a,#36
4023  000f 6b03          	ld	(OFST-52,sp),a
4024                     ; 582 	di.mesh_id_H = ns_own_meshid_H;
4026  0011 c6008b        	ld	a,_ns_own_meshid_H
4027  0014 6b04          	ld	(OFST-51,sp),a
4028                     ; 583 	di.mesh_id_L = ns_own_meshid_L;
4030  0016 c6008a        	ld	a,_ns_own_meshid_L
4031  0019 6b05          	ld	(OFST-50,sp),a
4032                     ; 584 	di.payload[0] = 0xB3;
4034  001b a6b3          	ld	a,#179
4035  001d 6b06          	ld	(OFST-49,sp),a
4036                     ; 585 	di.payload[1] =	sc.spc[i].deviceid[0];
4038  001f 7b38          	ld	a,(OFST+1,sp)
4039  0021 97            	ld	xl,a
4040  0022 a61c          	ld	a,#28
4041  0024 42            	mul	x,a
4042  0025 d600aa        	ld	a,(_sc+27,x)
4043  0028 6b07          	ld	(OFST-48,sp),a
4044                     ; 586 	di.payload[2] =	sc.spc[i].deviceid[0];
4046  002a 7b38          	ld	a,(OFST+1,sp)
4047  002c 97            	ld	xl,a
4048  002d a61c          	ld	a,#28
4049  002f 42            	mul	x,a
4050  0030 d600aa        	ld	a,(_sc+27,x)
4051  0033 6b08          	ld	(OFST-47,sp),a
4052                     ; 587 	di.payload[3] =	sc.spc[i].deviceid[0];
4054  0035 7b38          	ld	a,(OFST+1,sp)
4055  0037 97            	ld	xl,a
4056  0038 a61c          	ld	a,#28
4057  003a 42            	mul	x,a
4058  003b d600aa        	ld	a,(_sc+27,x)
4059  003e 6b09          	ld	(OFST-46,sp),a
4060                     ; 588 	di.payload[4] =	sc.spc[i].deviceid[0];
4062  0040 7b38          	ld	a,(OFST+1,sp)
4063  0042 97            	ld	xl,a
4064  0043 a61c          	ld	a,#28
4065  0045 42            	mul	x,a
4066  0046 d600aa        	ld	a,(_sc+27,x)
4067  0049 6b0a          	ld	(OFST-45,sp),a
4068                     ; 589 	di.payload[5] =	sc.spc[i].model;
4070  004b 7b38          	ld	a,(OFST+1,sp)
4071  004d 97            	ld	xl,a
4072  004e a61c          	ld	a,#28
4073  0050 42            	mul	x,a
4074  0051 d600b0        	ld	a,(_sc+33,x)
4075  0054 6b0b          	ld	(OFST-44,sp),a
4076                     ; 590 	di.payload[6] = sc.spc[i].firmware;
4078  0056 7b38          	ld	a,(OFST+1,sp)
4079  0058 97            	ld	xl,a
4080  0059 a61c          	ld	a,#28
4081  005b 42            	mul	x,a
4082  005c d600ae        	ld	a,(_sc+31,x)
4083  005f 6b0c          	ld	(OFST-43,sp),a
4084                     ; 591 	di.payload[7] = sc.spc[i].HWTtest;
4086  0061 7b38          	ld	a,(OFST+1,sp)
4087  0063 97            	ld	xl,a
4088  0064 a61c          	ld	a,#28
4089  0066 42            	mul	x,a
4090  0067 d600af        	ld	a,(_sc+32,x)
4091  006a 6b0d          	ld	(OFST-42,sp),a
4092                     ; 592 	di.payload[8] = sc.spc[i].MDID;
4094  006c 7b38          	ld	a,(OFST+1,sp)
4095  006e 97            	ld	xl,a
4096  006f a61c          	ld	a,#28
4097  0071 42            	mul	x,a
4098  0072 d600bc        	ld	a,(_sc+45,x)
4099  0075 6b0e          	ld	(OFST-41,sp),a
4100                     ; 593 	sicp_send_message(&di,9);
4102  0077 4b09          	push	#9
4103  0079 96            	ldw	x,sp
4104  007a 1c0002        	addw	x,#OFST-53
4105  007d cd0000        	call	_sicp_send_message
4107  0080 84            	pop	a
4108                     ; 594 }
4111  0081 5b38          	addw	sp,#56
4112  0083 81            	ret
4149                     ; 596 void send_device_info(void)
4149                     ; 597 {
4150                     .text:	section	.text,new
4151  0000               _send_device_info:
4153  0000 88            	push	a
4154       00000001      OFST:	set	1
4157                     ; 600 	send_sc_device_info();
4159  0001 cd0000        	call	_send_sc_device_info
4161                     ; 602 	for(i = 0; i < 15;i++){
4163  0004 0f01          	clr	(OFST+0,sp)
4164  0006               L3651:
4165                     ; 603 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4167  0006 7b01          	ld	a,(OFST+0,sp)
4168  0008 97            	ld	xl,a
4169  0009 a61a          	ld	a,#26
4170  000b 42            	mul	x,a
4171  000c d60260        	ld	a,(_sc+465,x)
4172  000f da025f        	or	a,(_sc+464,x)
4173  0012 2705          	jreq	L1751
4174                     ; 604 			send_slc_device_info(i);
4176  0014 7b01          	ld	a,(OFST+0,sp)
4177  0016 cd0000        	call	_send_slc_device_info
4179  0019               L1751:
4180                     ; 602 	for(i = 0; i < 15;i++){
4182  0019 0c01          	inc	(OFST+0,sp)
4185  001b 7b01          	ld	a,(OFST+0,sp)
4186  001d a10f          	cp	a,#15
4187  001f 25e5          	jrult	L3651
4188                     ; 608 	for(i = 0; i < 15;i++){
4190  0021 0f01          	clr	(OFST+0,sp)
4191  0023               L3751:
4192                     ; 609 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4194  0023 7b01          	ld	a,(OFST+0,sp)
4195  0025 97            	ld	xl,a
4196  0026 a61c          	ld	a,#28
4197  0028 42            	mul	x,a
4198  0029 d600bc        	ld	a,(_sc+45,x)
4199  002c da00bb        	or	a,(_sc+44,x)
4200  002f 2705          	jreq	L1061
4201                     ; 610 			send_spc_device_info(i);
4203  0031 7b01          	ld	a,(OFST+0,sp)
4204  0033 cd0000        	call	_send_spc_device_info
4206  0036               L1061:
4207                     ; 608 	for(i = 0; i < 15;i++){
4209  0036 0c01          	inc	(OFST+0,sp)
4212  0038 7b01          	ld	a,(OFST+0,sp)
4213  003a a10f          	cp	a,#15
4214  003c 25e5          	jrult	L3751
4215                     ; 613 	di_timeout = 5;
4217  003e 35050001      	mov	_di_timeout,#5
4218                     ; 614 }
4221  0042 84            	pop	a
4222  0043 81            	ret
4268                     ; 617 void send_malfunction(void)
4268                     ; 618 {
4269                     .text:	section	.text,new
4270  0000               _send_malfunction:
4272  0000 5238          	subw	sp,#56
4273       00000038      OFST:	set	56
4276                     ; 622 	if((sc.HWTtest & 0xC0)!=0xC0){
4278  0002 c60096        	ld	a,_sc+7
4279  0005 a4c0          	and	a,#192
4280  0007 a1c0          	cp	a,#192
4281  0009 272f          	jreq	L3261
4282                     ; 623 		mal.frame_h1 = 0xEE;
4284  000b a6ee          	ld	a,#238
4285  000d 6b02          	ld	(OFST-54,sp),a
4286                     ; 624 		mal.frame_h2 = 0xEE;
4288  000f a6ee          	ld	a,#238
4289  0011 6b03          	ld	(OFST-53,sp),a
4290                     ; 625 		mal.message_id = 17;
4292  0013 a611          	ld	a,#17
4293  0015 6b04          	ld	(OFST-52,sp),a
4294                     ; 626 		mal.mesh_id_H = ns_own_meshid_H;
4296  0017 c6008b        	ld	a,_ns_own_meshid_H
4297  001a 6b05          	ld	(OFST-51,sp),a
4298                     ; 627 		mal.mesh_id_L = ns_own_meshid_L;
4300  001c c6008a        	ld	a,_ns_own_meshid_L
4301  001f 6b06          	ld	(OFST-50,sp),a
4302                     ; 628 		mal.payload[0] = 0x0A;
4304  0021 a60a          	ld	a,#10
4305  0023 6b07          	ld	(OFST-49,sp),a
4306                     ; 629 		mal.payload[1] = 0xB1;
4308  0025 a6b1          	ld	a,#177
4309  0027 6b08          	ld	(OFST-48,sp),a
4310                     ; 630 		mal.payload[2] =	0x00;
4312  0029 0f09          	clr	(OFST-47,sp)
4313                     ; 631 		mal.payload[3] =	sc.HWTtest;
4315  002b c60096        	ld	a,_sc+7
4316  002e 6b0a          	ld	(OFST-46,sp),a
4317                     ; 632 		sicp_send_message(&mal,4);
4319  0030 4b04          	push	#4
4320  0032 96            	ldw	x,sp
4321  0033 1c0003        	addw	x,#OFST-53
4322  0036 cd0000        	call	_sicp_send_message
4324  0039 84            	pop	a
4325  003a               L3261:
4326                     ; 635 	for(i = 0; i < 15;i++){
4328  003a 0f01          	clr	(OFST-55,sp)
4329  003c               L5261:
4330                     ; 636 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4332  003c 7b01          	ld	a,(OFST-55,sp)
4333  003e 97            	ld	xl,a
4334  003f a61a          	ld	a,#26
4335  0041 42            	mul	x,a
4336  0042 d60260        	ld	a,(_sc+465,x)
4337  0045 da025f        	or	a,(_sc+464,x)
4338  0048 274f          	jreq	L3361
4340  004a 7b01          	ld	a,(OFST-55,sp)
4341  004c 97            	ld	xl,a
4342  004d a61a          	ld	a,#26
4343  004f 42            	mul	x,a
4344  0050 d60253        	ld	a,(_sc+452,x)
4345  0053 a4c0          	and	a,#192
4346  0055 a1c0          	cp	a,#192
4347  0057 2740          	jreq	L3361
4348                     ; 637 			mal.frame_h1 = 0xEE;
4350  0059 a6ee          	ld	a,#238
4351  005b 6b02          	ld	(OFST-54,sp),a
4352                     ; 638 			mal.frame_h2 = 0xEE;
4354  005d a6ee          	ld	a,#238
4355  005f 6b03          	ld	(OFST-53,sp),a
4356                     ; 639 			mal.message_id = 51+i;
4358  0061 7b01          	ld	a,(OFST-55,sp)
4359  0063 ab33          	add	a,#51
4360  0065 6b04          	ld	(OFST-52,sp),a
4361                     ; 640 			mal.mesh_id_H = ns_own_meshid_H;
4363  0067 c6008b        	ld	a,_ns_own_meshid_H
4364  006a 6b05          	ld	(OFST-51,sp),a
4365                     ; 641 			mal.mesh_id_L = ns_own_meshid_L;
4367  006c c6008a        	ld	a,_ns_own_meshid_L
4368  006f 6b06          	ld	(OFST-50,sp),a
4369                     ; 642 			mal.payload[0] = 0x0A;
4371  0071 a60a          	ld	a,#10
4372  0073 6b07          	ld	(OFST-49,sp),a
4373                     ; 643 			mal.payload[1] = 0xB2;
4375  0075 a6b2          	ld	a,#178
4376  0077 6b08          	ld	(OFST-48,sp),a
4377                     ; 644 			mal.payload[2] =	sc.slc[i].MDID;
4379  0079 7b01          	ld	a,(OFST-55,sp)
4380  007b 97            	ld	xl,a
4381  007c a61a          	ld	a,#26
4382  007e 42            	mul	x,a
4383  007f d60260        	ld	a,(_sc+465,x)
4384  0082 6b09          	ld	(OFST-47,sp),a
4385                     ; 645 			mal.payload[3] =	sc.slc[i].HWTtest;
4387  0084 7b01          	ld	a,(OFST-55,sp)
4388  0086 97            	ld	xl,a
4389  0087 a61a          	ld	a,#26
4390  0089 42            	mul	x,a
4391  008a d60253        	ld	a,(_sc+452,x)
4392  008d 6b0a          	ld	(OFST-46,sp),a
4393                     ; 646 			sicp_send_message(&mal,4);
4395  008f 4b04          	push	#4
4396  0091 96            	ldw	x,sp
4397  0092 1c0003        	addw	x,#OFST-53
4398  0095 cd0000        	call	_sicp_send_message
4400  0098 84            	pop	a
4401  0099               L3361:
4402                     ; 635 	for(i = 0; i < 15;i++){
4404  0099 0c01          	inc	(OFST-55,sp)
4407  009b 7b01          	ld	a,(OFST-55,sp)
4408  009d a10f          	cp	a,#15
4409  009f 259b          	jrult	L5261
4410                     ; 650 	for(i = 0; i < 15;i++){
4412  00a1 0f01          	clr	(OFST-55,sp)
4413  00a3               L5361:
4414                     ; 651 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4416  00a3 7b01          	ld	a,(OFST-55,sp)
4417  00a5 97            	ld	xl,a
4418  00a6 a61c          	ld	a,#28
4419  00a8 42            	mul	x,a
4420  00a9 d600bc        	ld	a,(_sc+45,x)
4421  00ac da00bb        	or	a,(_sc+44,x)
4422  00af 274f          	jreq	L3461
4424  00b1 7b01          	ld	a,(OFST-55,sp)
4425  00b3 97            	ld	xl,a
4426  00b4 a61c          	ld	a,#28
4427  00b6 42            	mul	x,a
4428  00b7 d600af        	ld	a,(_sc+32,x)
4429  00ba a4c0          	and	a,#192
4430  00bc a1c0          	cp	a,#192
4431  00be 2740          	jreq	L3461
4432                     ; 652 			mal.frame_h1 = 0xEE;
4434  00c0 a6ee          	ld	a,#238
4435  00c2 6b02          	ld	(OFST-54,sp),a
4436                     ; 653 			mal.frame_h2 = 0xEE;
4438  00c4 a6ee          	ld	a,#238
4439  00c6 6b03          	ld	(OFST-53,sp),a
4440                     ; 654 			mal.message_id = 66+i;
4442  00c8 7b01          	ld	a,(OFST-55,sp)
4443  00ca ab42          	add	a,#66
4444  00cc 6b04          	ld	(OFST-52,sp),a
4445                     ; 655 			mal.mesh_id_H = ns_own_meshid_H;
4447  00ce c6008b        	ld	a,_ns_own_meshid_H
4448  00d1 6b05          	ld	(OFST-51,sp),a
4449                     ; 656 			mal.mesh_id_L = ns_own_meshid_L;
4451  00d3 c6008a        	ld	a,_ns_own_meshid_L
4452  00d6 6b06          	ld	(OFST-50,sp),a
4453                     ; 657 			mal.payload[0] = 0x0A;
4455  00d8 a60a          	ld	a,#10
4456  00da 6b07          	ld	(OFST-49,sp),a
4457                     ; 658 			mal.payload[1] = 0xB2;
4459  00dc a6b2          	ld	a,#178
4460  00de 6b08          	ld	(OFST-48,sp),a
4461                     ; 659 			mal.payload[2] =	sc.spc[i].MDID;
4463  00e0 7b01          	ld	a,(OFST-55,sp)
4464  00e2 97            	ld	xl,a
4465  00e3 a61c          	ld	a,#28
4466  00e5 42            	mul	x,a
4467  00e6 d600bc        	ld	a,(_sc+45,x)
4468  00e9 6b09          	ld	(OFST-47,sp),a
4469                     ; 660 			mal.payload[3] =	sc.spc[i].HWTtest;
4471  00eb 7b01          	ld	a,(OFST-55,sp)
4472  00ed 97            	ld	xl,a
4473  00ee a61c          	ld	a,#28
4474  00f0 42            	mul	x,a
4475  00f1 d600af        	ld	a,(_sc+32,x)
4476  00f4 6b0a          	ld	(OFST-46,sp),a
4477                     ; 661 			sicp_send_message(&mal,4);
4479  00f6 4b04          	push	#4
4480  00f8 96            	ldw	x,sp
4481  00f9 1c0003        	addw	x,#OFST-53
4482  00fc cd0000        	call	_sicp_send_message
4484  00ff 84            	pop	a
4485  0100               L3461:
4486                     ; 650 	for(i = 0; i < 15;i++){
4488  0100 0c01          	inc	(OFST-55,sp)
4491  0102 7b01          	ld	a,(OFST-55,sp)
4492  0104 a10f          	cp	a,#15
4493  0106 259b          	jrult	L5361
4494                     ; 664 }
4497  0108 5b38          	addw	sp,#56
4498  010a 81            	ret
4536                     ; 667 void check_send_repeatedly(void){
4537                     .text:	section	.text,new
4538  0000               _check_send_repeatedly:
4540  0000 88            	push	a
4541       00000001      OFST:	set	1
4544                     ; 670 	if(di_timeout){
4546  0001 725d0001      	tnz	_di_timeout
4547  0005 2766          	jreq	L1661
4548                     ; 671 		if(--di_timeout == 0){
4550  0007 725a0001      	dec	_di_timeout
4551  000b 2660          	jrne	L1661
4552                     ; 672 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4554  000d c603d2        	ld	a,_sc+835
4555  0010 a502          	bcp	a,#2
4556  0012 2607          	jrne	L5661
4559  0014 cd0000        	call	_send_sc_device_info
4563  0017 35050001      	mov	_di_timeout,#5
4564  001b               L5661:
4565                     ; 673 			for(i = 0; i < 15; i++){
4567  001b 0f01          	clr	(OFST+0,sp)
4568  001d               L7661:
4569                     ; 674 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4571  001d 7b01          	ld	a,(OFST+0,sp)
4572  001f 97            	ld	xl,a
4573  0020 a61a          	ld	a,#26
4574  0022 42            	mul	x,a
4575  0023 d60260        	ld	a,(_sc+465,x)
4576  0026 da025f        	or	a,(_sc+464,x)
4577  0029 2716          	jreq	L5761
4579  002b 7b01          	ld	a,(OFST+0,sp)
4580  002d 97            	ld	xl,a
4581  002e a61a          	ld	a,#26
4582  0030 42            	mul	x,a
4583  0031 d60265        	ld	a,(_sc+470,x)
4584  0034 a502          	bcp	a,#2
4585  0036 2609          	jrne	L5761
4588  0038 7b01          	ld	a,(OFST+0,sp)
4589  003a cd0000        	call	_send_slc_device_info
4593  003d 35050001      	mov	_di_timeout,#5
4594  0041               L5761:
4595                     ; 675 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4597  0041 7b01          	ld	a,(OFST+0,sp)
4598  0043 97            	ld	xl,a
4599  0044 a61c          	ld	a,#28
4600  0046 42            	mul	x,a
4601  0047 d600bc        	ld	a,(_sc+45,x)
4602  004a da00bb        	or	a,(_sc+44,x)
4603  004d 2716          	jreq	L7761
4605  004f 7b01          	ld	a,(OFST+0,sp)
4606  0051 97            	ld	xl,a
4607  0052 a61c          	ld	a,#28
4608  0054 42            	mul	x,a
4609  0055 d600c3        	ld	a,(_sc+52,x)
4610  0058 a502          	bcp	a,#2
4611  005a 2609          	jrne	L7761
4614  005c 7b01          	ld	a,(OFST+0,sp)
4615  005e cd0000        	call	_send_spc_device_info
4619  0061 35050001      	mov	_di_timeout,#5
4620  0065               L7761:
4621                     ; 673 			for(i = 0; i < 15; i++){
4623  0065 0c01          	inc	(OFST+0,sp)
4626  0067 7b01          	ld	a,(OFST+0,sp)
4627  0069 a10f          	cp	a,#15
4628  006b 25b0          	jrult	L7661
4629  006d               L1661:
4630                     ; 679 }
4633  006d 84            	pop	a
4634  006e 81            	ret
4647                     	xdef	_send_spc_device_info
4648                     	xdef	_send_slc_device_info
4649                     	xdef	_send_sc_device_info
4650                     	xdef	_clear_uart_buf
4651                     	xdef	_Uart2_Send
4652                     	xref	_rand
4653                     	xref	_i2c_multiple_action_dimmer
4654                     	xref	_i2c_action_plug
4655                     	xref	_i2c_single_action_dimmer
4656                     	xref	_i2c_get_energy_consum
4657                     	xref	_action_dimmer_ext
4658                     	xdef	_delay
4659                     	xref	_systime_count
4660                     	xref	_init_slc_spc_done
4661                     	xref	_sys_init
4662                     	xdef	_check_send_repeatedly
4663                     	xdef	_send_malfunction
4664                     	xdef	_send_device_info
4665                     	xdef	_report_energy_consum
4666                     	xdef	_rev_cmd_data
4667                     	xdef	_sicp_receipt_Done
4668                     	xdef	_sicp_receipt_OK
4669                     	xdef	_sicp_send_message
4670                     	xdef	_random
4671                     	xdef	_rev_deal
4672                     	xdef	_Check_Sum
4673                     	xdef	_rev_anaylze
4674                     	xdef	_UART2_RX_ISR
4675                     	xdef	_UART2_TX_ISR
4676                     	xdef	_Init_uart2
4677                     	xdef	_mymemcpy
4678                     	switch	.bss
4679  0000               _mal_timeout:
4680  0000 00            	ds.b	1
4681                     	xdef	_mal_timeout
4682  0001               _di_timeout:
4683  0001 00            	ds.b	1
4684                     	xdef	_di_timeout
4685  0002               _send_failed_count:
4686  0002 0000          	ds.b	2
4687                     	xdef	_send_failed_count
4688  0004               _send_fault_count:
4689  0004 0000          	ds.b	2
4690                     	xdef	_send_fault_count
4691  0006               _sicp_buf:
4692  0006 000000000000  	ds.b	40
4693                     	xdef	_sicp_buf
4694  002e               _Uart2_Rec_Cnt:
4695  002e 00            	ds.b	1
4696                     	xdef	_Uart2_Rec_Cnt
4697  002f               _Uart2_Rece_Buf:
4698  002f 000000000000  	ds.b	40
4699                     	xdef	_Uart2_Rece_Buf
4700  0057               _Uart2_Send_Done:
4701  0057 00            	ds.b	1
4702                     	xdef	_Uart2_Send_Done
4703  0058               _Uart2_Send_Cnt:
4704  0058 00            	ds.b	1
4705                     	xdef	_Uart2_Send_Cnt
4706  0059               _Uart2_Send_Length:
4707  0059 00            	ds.b	1
4708                     	xdef	_Uart2_Send_Length
4709  005a               _UART2_Send_Buf:
4710  005a 000000000000  	ds.b	40
4711                     	xdef	_UART2_Send_Buf
4712  0082               _rev_ad_channel:
4713  0082 00            	ds.b	1
4714                     	xdef	_rev_ad_channel
4715  0083               _rev_ad_mdid:
4716  0083 00            	ds.b	1
4717                     	xdef	_rev_ad_mdid
4718  0084               _rev_ad_message_id:
4719  0084 00            	ds.b	1
4720                     	xdef	_rev_ad_message_id
4721  0085               _rev_mesh_id_L:
4722  0085 00            	ds.b	1
4723                     	xdef	_rev_mesh_id_L
4724  0086               _rev_mesh_id_H:
4725  0086 00            	ds.b	1
4726                     	xdef	_rev_mesh_id_H
4727  0087               _rev_message_id:
4728  0087 00            	ds.b	1
4729                     	xdef	_rev_message_id
4730  0088               _ns_host_meshid_L:
4731  0088 00            	ds.b	1
4732                     	xdef	_ns_host_meshid_L
4733  0089               _ns_host_meshid_H:
4734  0089 00            	ds.b	1
4735                     	xdef	_ns_host_meshid_H
4736  008a               _ns_own_meshid_L:
4737  008a 00            	ds.b	1
4738                     	xdef	_ns_own_meshid_L
4739  008b               _ns_own_meshid_H:
4740  008b 00            	ds.b	1
4741                     	xdef	_ns_own_meshid_H
4742  008c               _ns_phonenum:
4743  008c 00            	ds.b	1
4744                     	xdef	_ns_phonenum
4745  008d               _ns_status:
4746  008d 00            	ds.b	1
4747                     	xdef	_ns_status
4748  008e               _ns_signal:
4749  008e 00            	ds.b	1
4750                     	xdef	_ns_signal
4751  008f               _sc:
4752  008f 000000000000  	ds.b	836
4753                     	xdef	_sc
4754  03d3               _UART1Flag6_:
4755  03d3 00            	ds.b	1
4756                     	xdef	_UART1Flag6_
4757  03d4               _UART1Flag5_:
4758  03d4 00            	ds.b	1
4759                     	xdef	_UART1Flag5_
4760  03d5               _UART1Flag4_:
4761  03d5 00            	ds.b	1
4762                     	xdef	_UART1Flag4_
4763  03d6               _UART1Flag3_:
4764  03d6 00            	ds.b	1
4765                     	xdef	_UART1Flag3_
4766  03d7               _UART1Flag2_:
4767  03d7 00            	ds.b	1
4768                     	xdef	_UART1Flag2_
4769  03d8               _UART1Flag1_:
4770  03d8 00            	ds.b	1
4771                     	xdef	_UART1Flag1_
4772                     	xref	_UART2_ITConfig
4773                     	xref	_UART2_Cmd
4774                     	xref	_UART2_Init
4775                     	xref	_UART2_DeInit
4776                     	xref.b	c_lreg
4777                     	xref.b	c_x
4778                     	xref.b	c_y
4798                     	xref	c_idiv
4799                     	xref	c_lrzmp
4800                     	xref	c_lgsbc
4801                     	xref	c_ltor
4802                     	end
