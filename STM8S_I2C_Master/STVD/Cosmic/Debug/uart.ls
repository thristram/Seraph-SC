   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
1123                     ; 19 void delay(u16 Count)
1123                     ; 20 {
1125                     .text:	section	.text,new
1126  0000               _delay:
1128  0000 89            	pushw	x
1129  0001 89            	pushw	x
1130       00000002      OFST:	set	2
1133  0002 2014          	jra	L316
1134  0004               L116:
1135                     ; 24     for(i=0;i<100;i++)
1137  0004 0f01          	clr	(OFST-1,sp)
1138  0006               L716:
1139                     ; 25     for(j=0;j<50;j++);
1141  0006 0f02          	clr	(OFST+0,sp)
1142  0008               L526:
1146  0008 0c02          	inc	(OFST+0,sp)
1149  000a 7b02          	ld	a,(OFST+0,sp)
1150  000c a132          	cp	a,#50
1151  000e 25f8          	jrult	L526
1152                     ; 24     for(i=0;i<100;i++)
1154  0010 0c01          	inc	(OFST-1,sp)
1157  0012 7b01          	ld	a,(OFST-1,sp)
1158  0014 a164          	cp	a,#100
1159  0016 25ee          	jrult	L716
1160  0018               L316:
1161                     ; 22   while (Count--)//Count形参控制延时次数
1163  0018 1e03          	ldw	x,(OFST+1,sp)
1164  001a 1d0001        	subw	x,#1
1165  001d 1f03          	ldw	(OFST+1,sp),x
1166  001f 1c0001        	addw	x,#1
1167  0022 a30000        	cpw	x,#0
1168  0025 26dd          	jrne	L116
1169                     ; 27 }
1172  0027 5b04          	addw	sp,#4
1173  0029 81            	ret
1226                     ; 34 u8 random(u8 xxx)  
1226                     ; 35 {  
1227                     .text:	section	.text,new
1228  0000               _random:
1230  0000 88            	push	a
1231  0001 89            	pushw	x
1232       00000002      OFST:	set	2
1235                     ; 37   for(iii=0;iii<xxx;iii++)  
1237  0002 0f02          	clr	(OFST+0,sp)
1239  0004 2011          	jra	L566
1240  0006               L166:
1241                     ; 39     value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
1243  0006 cd0000        	call	_rand
1245  0009 90ae00ff      	ldw	y,#255
1246  000d cd0000        	call	c_idiv
1248  0010 51            	exgw	x,y
1249  0011 9f            	ld	a,xl
1250  0012 4c            	inc	a
1251  0013 6b01          	ld	(OFST-1,sp),a
1252                     ; 37   for(iii=0;iii<xxx;iii++)  
1254  0015 0c02          	inc	(OFST+0,sp)
1255  0017               L566:
1258  0017 7b02          	ld	a,(OFST+0,sp)
1259  0019 1103          	cp	a,(OFST+1,sp)
1260  001b 25e9          	jrult	L166
1261                     ; 41   return value;  
1263  001d 7b01          	ld	a,(OFST-1,sp)
1266  001f 5b03          	addw	sp,#3
1267  0021 81            	ret
1294                     ; 50 void Init_UART1(void)
1294                     ; 51 {
1295                     .text:	section	.text,new
1296  0000               _Init_UART1:
1300                     ; 52 	UART1_DeInit();
1302  0000 cd0000        	call	_UART1_DeInit
1304                     ; 54 	UART1_Init((u32)57600,UART1_WORDLENGTH_8D,UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE,	UART1_MODE_TXRX_ENABLE);
1306  0003 4b0c          	push	#12
1307  0005 4b80          	push	#128
1308  0007 4b00          	push	#0
1309  0009 4b00          	push	#0
1310  000b 4b00          	push	#0
1311  000d aee100        	ldw	x,#57600
1312  0010 89            	pushw	x
1313  0011 ae0000        	ldw	x,#0
1314  0014 89            	pushw	x
1315  0015 cd0000        	call	_UART1_Init
1317  0018 5b09          	addw	sp,#9
1318                     ; 55 	UART1_ITConfig(UART1_IT_TC,ENABLE);//发送完成中断
1320  001a 4b01          	push	#1
1321  001c ae0266        	ldw	x,#614
1322  001f cd0000        	call	_UART1_ITConfig
1324  0022 84            	pop	a
1325                     ; 56 	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);//接收非空中断
1327  0023 4b01          	push	#1
1328  0025 ae0205        	ldw	x,#517
1329  0028 cd0000        	call	_UART1_ITConfig
1331  002b 84            	pop	a
1332                     ; 57 	UART1_Cmd(ENABLE);//启用uart1接口
1334  002c a601          	ld	a,#1
1335  002e cd0000        	call	_UART1_Cmd
1337                     ; 58 }
1340  0031 81            	ret
1366                     ; 66 void UART1_Send_Data_Init(void)
1366                     ; 67 {
1367                     .text:	section	.text,new
1368  0000               _UART1_Send_Data_Init:
1372                     ; 68 	send_buf[0] = 0xAA;
1374  0000 35aa003c      	mov	_send_buf,#170
1375                     ; 69 	send_buf[1] = 0xAA;
1377  0004 35aa003d      	mov	_send_buf+1,#170
1378                     ; 70 	send_buf[2] = 0x11;
1380  0008 3511003e      	mov	_send_buf+2,#17
1381                     ; 71 	send_buf[3] = 0x22;
1383  000c 3522003f      	mov	_send_buf+3,#34
1384                     ; 72 	send_buf[4] = 13;	//帧头及校验码不计入内
1386  0010 350d0040      	mov	_send_buf+4,#13
1387                     ; 73 	send_buf[5] = 0x01;
1389  0014 35010041      	mov	_send_buf+5,#1
1390                     ; 74 	send_buf[6] = 0x02;
1392  0018 35020042      	mov	_send_buf+6,#2
1393                     ; 75 	send_buf[7] = 0x03;
1395  001c 35030043      	mov	_send_buf+7,#3
1396                     ; 76 	send_buf[8] = 0x04;
1398  0020 35040044      	mov	_send_buf+8,#4
1399                     ; 77 	send_buf[9] = 0x05;
1401  0024 35050045      	mov	_send_buf+9,#5
1402                     ; 78 	send_buf[10] = 0x06;
1404  0028 35060046      	mov	_send_buf+10,#6
1405                     ; 79 	send_buf[11] = 0x07;
1407  002c 35070047      	mov	_send_buf+11,#7
1408                     ; 80 	send_buf[12] = 0x08;
1410  0030 35080048      	mov	_send_buf+12,#8
1411                     ; 81 	send_buf[13] = 0x09;
1413  0034 35090049      	mov	_send_buf+13,#9
1414                     ; 82 	send_buf[14] = 0x0A;
1416  0038 350a004a      	mov	_send_buf+14,#10
1417                     ; 83 	send_buf[15] = Check_Sum(send_buf,15);
1419  003c 4b0f          	push	#15
1420  003e ae003c        	ldw	x,#_send_buf
1421  0041 cd0000        	call	_Check_Sum
1423  0044 5b01          	addw	sp,#1
1424  0046 b74b          	ld	_send_buf+15,a
1425                     ; 85 }
1428  0048 81            	ret
1454                     ; 92 void UART1_Send_Data_Start(void)
1454                     ; 93 {
1455                     .text:	section	.text,new
1456  0000               _UART1_Send_Data_Start:
1460                     ; 94 	UART1->DR = send_buf[0];
1462  0000 55003c5231    	mov	21041,_send_buf
1463                     ; 95 	send_count = 1;
1465  0005 3501005f      	mov	_send_count,#1
1466                     ; 96 }
1469  0009 81            	ret
1504                     ; 99 void clear_sicp_buf(void)
1504                     ; 100 {
1505                     .text:	section	.text,new
1506  0000               _clear_sicp_buf:
1508  0000 88            	push	a
1509       00000001      OFST:	set	1
1512                     ; 102 	for (i=0;i<30;i++)
1514  0001 0f01          	clr	(OFST+0,sp)
1515  0003               L737:
1516                     ; 104 		sicp_buf[i] = 0;
1518  0003 7b01          	ld	a,(OFST+0,sp)
1519  0005 5f            	clrw	x
1520  0006 97            	ld	xl,a
1521  0007 6f00          	clr	(_sicp_buf,x)
1522                     ; 102 	for (i=0;i<30;i++)
1524  0009 0c01          	inc	(OFST+0,sp)
1527  000b 7b01          	ld	a,(OFST+0,sp)
1528  000d a11e          	cp	a,#30
1529  000f 25f2          	jrult	L737
1530                     ; 106 }
1533  0011 84            	pop	a
1534  0012 81            	ret
1569                     ; 109 void clear_send_buf(void)
1569                     ; 110 {
1570                     .text:	section	.text,new
1571  0000               _clear_send_buf:
1573  0000 88            	push	a
1574       00000001      OFST:	set	1
1577                     ; 112 	for (i=0;i<30;i++)
1579  0001 0f01          	clr	(OFST+0,sp)
1580  0003               L367:
1581                     ; 114 		send_buf[i] = 0;
1583  0003 7b01          	ld	a,(OFST+0,sp)
1584  0005 5f            	clrw	x
1585  0006 97            	ld	xl,a
1586  0007 6f3c          	clr	(_send_buf,x)
1587                     ; 112 	for (i=0;i<30;i++)
1589  0009 0c01          	inc	(OFST+0,sp)
1592  000b 7b01          	ld	a,(OFST+0,sp)
1593  000d a11e          	cp	a,#30
1594  000f 25f2          	jrult	L367
1595                     ; 116 }
1598  0011 84            	pop	a
1599  0012 81            	ret
1625                     ; 124 @interrupt void UART1_TX_ISR(void)
1625                     ; 125 {
1626                     .text:	section	.text,new
1627  0000               _UART1_TX_ISR:
1630  0000 be00          	ldw	x,c_x
1631  0002 89            	pushw	x
1634                     ; 129 	UART1->SR &= ~0x40;//清除发送完成标志位
1636  0003 721d5230      	bres	21040,#6
1637                     ; 130 	if (send_count < send_buf[4]+3)
1639  0007 9c            	rvf
1640  0008 b65f          	ld	a,_send_count
1641  000a 5f            	clrw	x
1642  000b 97            	ld	xl,a
1643  000c b640          	ld	a,_send_buf+4
1644  000e 905f          	clrw	y
1645  0010 9097          	ld	yl,a
1646  0012 72a90003      	addw	y,#3
1647  0016 bf01          	ldw	c_x+1,x
1648  0018 90b301        	cpw	y,c_x+1
1649  001b 2d0d          	jrsle	L1001
1650                     ; 132 		UART1->DR = send_buf[send_count];
1652  001d b65f          	ld	a,_send_count
1653  001f 5f            	clrw	x
1654  0020 97            	ld	xl,a
1655  0021 e63c          	ld	a,(_send_buf,x)
1656  0023 c75231        	ld	21041,a
1657                     ; 133 		send_count++;
1659  0026 3c5f          	inc	_send_count
1661  0028 2004          	jra	L3001
1662  002a               L1001:
1663                     ; 137 		send_count = 0;
1665  002a 3f5f          	clr	_send_count
1666                     ; 138 		rev_count = 0;
1668  002c 3f5e          	clr	_rev_count
1669  002e               L3001:
1670                     ; 140 }
1673  002e 85            	popw	x
1674  002f bf00          	ldw	c_x,x
1675  0031 80            	iret
1699                     ; 148 @interrupt void UART1_RX_ISR(void)
1699                     ; 149 {
1700                     .text:	section	.text,new
1701  0000               _UART1_RX_ISR:
1704  0000 3b0002        	push	c_x+2
1705  0003 be00          	ldw	x,c_x
1706  0005 89            	pushw	x
1707  0006 3b0002        	push	c_y+2
1708  0009 be00          	ldw	x,c_y
1709  000b 89            	pushw	x
1712                     ; 150 	rev_deal();
1714  000c cd0000        	call	_rev_deal
1716                     ; 151 }
1719  000f 85            	popw	x
1720  0010 bf00          	ldw	c_y,x
1721  0012 320002        	pop	c_y+2
1722  0015 85            	popw	x
1723  0016 bf00          	ldw	c_x,x
1724  0018 320002        	pop	c_x+2
1725  001b 80            	iret
1787                     ; 159 u8 Check_Sum(u8 *buf,u8 length)
1787                     ; 160 {
1788                     .text:	section	.text,new
1789  0000               _Check_Sum:
1791  0000 89            	pushw	x
1792  0001 89            	pushw	x
1793       00000002      OFST:	set	2
1796                     ; 162 	u8 result = *buf++;
1798  0002 1e03          	ldw	x,(OFST+1,sp)
1799  0004 1c0001        	addw	x,#1
1800  0007 1f03          	ldw	(OFST+1,sp),x
1801  0009 1d0001        	subw	x,#1
1802  000c f6            	ld	a,(x)
1803  000d 6b01          	ld	(OFST-1,sp),a
1804                     ; 163 	for(i = 1;i < length;i++)
1806  000f a601          	ld	a,#1
1807  0011 6b02          	ld	(OFST+0,sp),a
1809  0013 2011          	jra	L3501
1810  0015               L7401:
1811                     ; 165 		result ^= *buf++;
1813  0015 1e03          	ldw	x,(OFST+1,sp)
1814  0017 1c0001        	addw	x,#1
1815  001a 1f03          	ldw	(OFST+1,sp),x
1816  001c 1d0001        	subw	x,#1
1817  001f 7b01          	ld	a,(OFST-1,sp)
1818  0021 f8            	xor	a,	(x)
1819  0022 6b01          	ld	(OFST-1,sp),a
1820                     ; 163 	for(i = 1;i < length;i++)
1822  0024 0c02          	inc	(OFST+0,sp)
1823  0026               L3501:
1826  0026 7b02          	ld	a,(OFST+0,sp)
1827  0028 1107          	cp	a,(OFST+5,sp)
1828  002a 25e9          	jrult	L7401
1829                     ; 167 	return result;
1831  002c 7b01          	ld	a,(OFST-1,sp)
1834  002e 5b04          	addw	sp,#4
1835  0030 81            	ret
1901                     ; 175 void rev_deal(void)
1901                     ; 176 {
1902                     .text:	section	.text,new
1903  0000               _rev_deal:
1905  0000 89            	pushw	x
1906       00000002      OFST:	set	2
1909                     ; 179 	temp = (u8)UART1->DR;
1911  0001 c65231        	ld	a,21041
1912  0004 6b02          	ld	(OFST+0,sp),a
1913                     ; 180 	rev_buf[rev_count] = temp;
1915  0006 b65e          	ld	a,_rev_count
1916  0008 5f            	clrw	x
1917  0009 97            	ld	xl,a
1918  000a 7b02          	ld	a,(OFST+0,sp)
1919  000c e71e          	ld	(_rev_buf,x),a
1920                     ; 181 	rev_count++;
1922  000e 3c5e          	inc	_rev_count
1923                     ; 182 	switch(rev_count)
1925  0010 b65e          	ld	a,_rev_count
1927                     ; 241 			break;
1928  0012 4a            	dec	a
1929  0013 271f          	jreq	L7501
1930  0015 4a            	dec	a
1931  0016 2734          	jreq	L1601
1932  0018 4a            	dec	a
1933  0019 2603          	jrne	L23
1934  001b cc00f9        	jp	L7211
1935  001e               L23:
1936  001e 4a            	dec	a
1937  001f 2603          	jrne	L43
1938  0021 cc00f9        	jp	L7211
1939  0024               L43:
1940  0024 4a            	dec	a
1941  0025 2603          	jrne	L63
1942  0027 cc00f9        	jp	L7211
1943  002a               L63:
1944  002a               L1701:
1945                     ; 199 		default:
1945                     ; 200 			if (rev_count > 30)//防止接收错误后溢出
1947  002a b65e          	ld	a,_rev_count
1948  002c a11f          	cp	a,#31
1949  002e 2534          	jrult	L5311
1950                     ; 202 				rev_count = 0;
1952  0030 3f5e          	clr	_rev_count
1953  0032 2030          	jra	L5311
1954  0034               L7501:
1955                     ; 184 		case 1:
1955                     ; 185 			if ((temp != 0xEE) && (temp != 0xDD))	rev_count = 0;
1957  0034 7b02          	ld	a,(OFST+0,sp)
1958  0036 a1ee          	cp	a,#238
1959  0038 2603          	jrne	L04
1960  003a cc00f9        	jp	L7211
1961  003d               L04:
1963  003d 7b02          	ld	a,(OFST+0,sp)
1964  003f a1dd          	cp	a,#221
1965  0041 2603          	jrne	L24
1966  0043 cc00f9        	jp	L7211
1967  0046               L24:
1970  0046 3f5e          	clr	_rev_count
1971  0048 acf900f9      	jpf	L7211
1972  004c               L1601:
1973                     ; 187 		case 2:
1973                     ; 188 			if ((temp != 0xEE) && (temp != 0xDD)) rev_count = 0;
1975  004c 7b02          	ld	a,(OFST+0,sp)
1976  004e a1ee          	cp	a,#238
1977  0050 2603          	jrne	L44
1978  0052 cc00f9        	jp	L7211
1979  0055               L44:
1981  0055 7b02          	ld	a,(OFST+0,sp)
1982  0057 a1dd          	cp	a,#221
1983  0059 2603          	jrne	L64
1984  005b cc00f9        	jp	L7211
1985  005e               L64:
1988  005e 3f5e          	clr	_rev_count
1989  0060 acf900f9      	jpf	L7211
1990  0064               L5311:
1991                     ; 204 			if ((rev_buf[0] == 0xEE)&&(rev_buf[1] == 0xEE))
1993  0064 b61e          	ld	a,_rev_buf
1994  0066 a1ee          	cp	a,#238
1995  0068 2653          	jrne	L7311
1997  006a b61f          	ld	a,_rev_buf+1
1998  006c a1ee          	cp	a,#238
1999  006e 264d          	jrne	L7311
2000                     ; 206 				if (rev_count > rev_buf[5] + 2)//接收数据完成
2002  0070 9c            	rvf
2003  0071 b65e          	ld	a,_rev_count
2004  0073 5f            	clrw	x
2005  0074 97            	ld	xl,a
2006  0075 b623          	ld	a,_rev_buf+5
2007  0077 905f          	clrw	y
2008  0079 9097          	ld	yl,a
2009  007b 905c          	incw	y
2010  007d 905c          	incw	y
2011  007f bf01          	ldw	c_x+1,x
2012  0081 90b301        	cpw	y,c_x+1
2013  0084 2e73          	jrsge	L7211
2014                     ; 208 					rev_count = 0;
2016  0086 3f5e          	clr	_rev_count
2017                     ; 209 					check_sum = Check_Sum(rev_buf,rev_buf[5] + 2);
2019  0088 b623          	ld	a,_rev_buf+5
2020  008a ab02          	add	a,#2
2021  008c 88            	push	a
2022  008d ae001e        	ldw	x,#_rev_buf
2023  0090 cd0000        	call	_Check_Sum
2025  0093 5b01          	addw	sp,#1
2026  0095 6b02          	ld	(OFST+0,sp),a
2027                     ; 211 					if (check_sum == rev_buf[rev_buf[5] + 2])//校验正确	
2029  0097 b623          	ld	a,_rev_buf+5
2030  0099 5f            	clrw	x
2031  009a 97            	ld	xl,a
2032  009b e620          	ld	a,(_rev_buf+2,x)
2033  009d 1102          	cp	a,(OFST+0,sp)
2034  009f 2618          	jrne	L3411
2035                     ; 213 						rev_success = 1;
2037  00a1 721000c8      	bset	_UART1Flag1_,#0
2038                     ; 214 						for (i = 0;i < 30;i++)
2040  00a5 0f02          	clr	(OFST+0,sp)
2041  00a7               L5411:
2042                     ; 216 							sicp_buf[i] = rev_buf[i];
2044  00a7 7b02          	ld	a,(OFST+0,sp)
2045  00a9 5f            	clrw	x
2046  00aa 97            	ld	xl,a
2047  00ab e61e          	ld	a,(_rev_buf,x)
2048  00ad e700          	ld	(_sicp_buf,x),a
2049                     ; 214 						for (i = 0;i < 30;i++)
2051  00af 0c02          	inc	(OFST+0,sp)
2054  00b1 7b02          	ld	a,(OFST+0,sp)
2055  00b3 a11e          	cp	a,#30
2056  00b5 25f0          	jrult	L5411
2058  00b7 2040          	jra	L7211
2059  00b9               L3411:
2060                     ; 221 						rev_count = 0;
2062  00b9 3f5e          	clr	_rev_count
2063  00bb 203c          	jra	L7211
2064  00bd               L7311:
2065                     ; 225 			else if((rev_buf[0] == 0xDD)&&(rev_buf[1] == 0xDD))
2067  00bd b61e          	ld	a,_rev_buf
2068  00bf a1dd          	cp	a,#221
2069  00c1 2634          	jrne	L7511
2071  00c3 b61f          	ld	a,_rev_buf+1
2072  00c5 a1dd          	cp	a,#221
2073  00c7 262e          	jrne	L7511
2074                     ; 227 				if (rev_count > rev_buf[3] + 1)//接收数据完成
2076  00c9 9c            	rvf
2077  00ca b65e          	ld	a,_rev_count
2078  00cc 5f            	clrw	x
2079  00cd 97            	ld	xl,a
2080  00ce b621          	ld	a,_rev_buf+3
2081  00d0 905f          	clrw	y
2082  00d2 9097          	ld	yl,a
2083  00d4 905c          	incw	y
2084  00d6 bf01          	ldw	c_x+1,x
2085  00d8 90b301        	cpw	y,c_x+1
2086  00db 2e1c          	jrsge	L7211
2087                     ; 229 					rev_count = 0;
2089  00dd 3f5e          	clr	_rev_count
2090                     ; 230 					rev_success = 1;
2092  00df 721000c8      	bset	_UART1Flag1_,#0
2093                     ; 231 					for (i = 0;i < 30;i++)
2095  00e3 0f02          	clr	(OFST+0,sp)
2096  00e5               L3611:
2097                     ; 233 						sicp_buf[i] = rev_buf[i];
2099  00e5 7b02          	ld	a,(OFST+0,sp)
2100  00e7 5f            	clrw	x
2101  00e8 97            	ld	xl,a
2102  00e9 e61e          	ld	a,(_rev_buf,x)
2103  00eb e700          	ld	(_sicp_buf,x),a
2104                     ; 231 					for (i = 0;i < 30;i++)
2106  00ed 0c02          	inc	(OFST+0,sp)
2109  00ef 7b02          	ld	a,(OFST+0,sp)
2110  00f1 a11e          	cp	a,#30
2111  00f3 25f0          	jrult	L3611
2112  00f5 2002          	jra	L7211
2113  00f7               L7511:
2114                     ; 239 				rev_count = 0;
2116  00f7 3f5e          	clr	_rev_count
2117  00f9               L7211:
2118                     ; 243 	if (UART1->SR & 0x20) //|| (UART1->SR & UART1_SR_OR))
2120  00f9 c65230        	ld	a,21040
2121  00fc a520          	bcp	a,#32
2122  00fe 2707          	jreq	L3711
2123                     ; 245 		temp2 = UART1->DR;
2125  0100 7b01          	ld	a,(OFST-1,sp)
2126  0102 97            	ld	xl,a
2127  0103 c65231        	ld	a,21041
2128  0106 97            	ld	xl,a
2129  0107               L3711:
2130                     ; 258 }
2133  0107 85            	popw	x
2134  0108 81            	ret
2159                     ; 266 void gest_confirm(void)
2159                     ; 267 {
2160                     .text:	section	.text,new
2161  0000               _gest_confirm:
2165                     ; 268 	if ((st1.st_ges_H == st1.st_ges1_ctrl_H) && (st1.st_ges_L == st1.st_ges1_ctrl_L))
2167  0000 b676          	ld	a,_st1
2168  0002 b192          	cp	a,_st1+28
2169  0004 260c          	jrne	L5021
2171  0006 b677          	ld	a,_st1+1
2172  0008 b193          	cp	a,_st1+29
2173  000a 2606          	jrne	L5021
2174                     ; 270 		gest1_confirm = 1;
2176  000c 721400c7      	bset	_UART1Flag2_,#2
2178  0010 2004          	jra	L7021
2179  0012               L5021:
2180                     ; 274 		gest1_confirm = 0;
2182  0012 721500c7      	bres	_UART1Flag2_,#2
2183  0016               L7021:
2184                     ; 276 	if ((st1.st_ges_H == st1.st_ges2_ctrl_H) && (st1.st_ges_L == st1.st_ges2_ctrl_L))
2186  0016 b676          	ld	a,_st1
2187  0018 b197          	cp	a,_st1+33
2188  001a 260c          	jrne	L1121
2190  001c b677          	ld	a,_st1+1
2191  001e b198          	cp	a,_st1+34
2192  0020 2606          	jrne	L1121
2193                     ; 278 		gest2_confirm = 1;
2195  0022 721600c7      	bset	_UART1Flag2_,#3
2197  0026 2004          	jra	L3121
2198  0028               L1121:
2199                     ; 282 		gest2_confirm = 0;
2201  0028 721700c7      	bres	_UART1Flag2_,#3
2202  002c               L3121:
2203                     ; 284 	if ((st1.st_ges_H == st1.st_ges3_ctrl_H) && (st1.st_ges_L == st1.st_ges3_ctrl_L))
2205  002c b676          	ld	a,_st1
2206  002e b19c          	cp	a,_st1+38
2207  0030 260c          	jrne	L5121
2209  0032 b677          	ld	a,_st1+1
2210  0034 b19d          	cp	a,_st1+39
2211  0036 2606          	jrne	L5121
2212                     ; 286 		gest3_confirm = 1;
2214  0038 721800c7      	bset	_UART1Flag2_,#4
2216  003c 2004          	jra	L7121
2217  003e               L5121:
2218                     ; 290 		gest3_confirm = 0;
2220  003e 721900c7      	bres	_UART1Flag2_,#4
2221  0042               L7121:
2222                     ; 292 	if((st1.st_ges_H == st1.st_ges4_ctrl_H) && (st1.st_ges_L == st1.st_ges4_ctrl_L))
2224  0042 b676          	ld	a,_st1
2225  0044 b1a1          	cp	a,_st1+43
2226  0046 260c          	jrne	L1221
2228  0048 b677          	ld	a,_st1+1
2229  004a b1a2          	cp	a,_st1+44
2230  004c 2606          	jrne	L1221
2231                     ; 294 		gest4_confirm = 1;
2233  004e 721a00c7      	bset	_UART1Flag2_,#5
2235  0052 2004          	jra	L3221
2236  0054               L1221:
2237                     ; 298 		gest4_confirm = 0;
2239  0054 721b00c7      	bres	_UART1Flag2_,#5
2240  0058               L3221:
2241                     ; 300 }
2244  0058 81            	ret
2269                     ; 308 void pad_confirm(void)
2269                     ; 309 {
2270                     .text:	section	.text,new
2271  0000               _pad_confirm:
2275                     ; 310 	if(st_pad1_ctrl)
2277  0000 b6c6          	ld	a,_UART1Flag3_
2278  0002 a502          	bcp	a,#2
2279  0004 271c          	jreq	L5321
2280                     ; 312 		if ((st1.st_pad1_ctrl_meshid_H != 0x00) && (st1.st_pad1_ctrl_meshid_L != 0x00) && (st1.st_pad1_ctrl_boardid != 0x00))
2282  0006 3d83          	tnz	_st1+13
2283  0008 2712          	jreq	L7321
2285  000a 3d84          	tnz	_st1+14
2286  000c 270e          	jreq	L7321
2288  000e 3d85          	tnz	_st1+15
2289  0010 270a          	jreq	L7321
2290                     ; 314 			st_pad1_confirm = 1;
2292  0012 721800c6      	bset	_UART1Flag3_,#4
2293                     ; 315 			st1.st_ctrl_address = 0x01;
2295  0016 35010079      	mov	_st1+3,#1
2297  001a 2006          	jra	L5321
2298  001c               L7321:
2299                     ; 319 			st_pad1_confirm = 0;
2301  001c 721900c6      	bres	_UART1Flag3_,#4
2302                     ; 320 			st1.st_ctrl_address = 0x00;
2304  0020 3f79          	clr	_st1+3
2305  0022               L5321:
2306                     ; 324 	if(st_pad2_ctrl)
2308  0022 b6c6          	ld	a,_UART1Flag3_
2309  0024 a504          	bcp	a,#4
2310  0026 271c          	jreq	L3421
2311                     ; 326 		if ((st1.st_pad2_ctrl_meshid_H != 0x00) && (st1.st_pad2_ctrl_meshid_L != 0x00) && (st1.st_pad2_ctrl_boardid != 0x00))
2313  0028 3d88          	tnz	_st1+18
2314  002a 2712          	jreq	L5421
2316  002c 3d89          	tnz	_st1+19
2317  002e 270e          	jreq	L5421
2319  0030 3d8a          	tnz	_st1+20
2320  0032 270a          	jreq	L5421
2321                     ; 328 			st_pad2_confirm = 1;
2323  0034 721a00c6      	bset	_UART1Flag3_,#5
2324                     ; 329 			st1.st_ctrl_address = 0x02;
2326  0038 35020079      	mov	_st1+3,#2
2328  003c 2006          	jra	L3421
2329  003e               L5421:
2330                     ; 333 			st_pad2_confirm = 0;
2332  003e 721b00c6      	bres	_UART1Flag3_,#5
2333                     ; 334 			st1.st_ctrl_address = 0x00;
2335  0042 3f79          	clr	_st1+3
2336  0044               L3421:
2337                     ; 337 	if(st_pad3_ctrl)
2339  0044 b6c6          	ld	a,_UART1Flag3_
2340  0046 a508          	bcp	a,#8
2341  0048 271c          	jreq	L1521
2342                     ; 339 		if ((st1.st_pad3_ctrl_meshid_H != 0x00) && (st1.st_pad3_ctrl_meshid_L != 0x00) && (st1.st_pad3_ctrl_boardid != 0x00))
2344  004a 3d8d          	tnz	_st1+23
2345  004c 2712          	jreq	L3521
2347  004e 3d8e          	tnz	_st1+24
2348  0050 270e          	jreq	L3521
2350  0052 3d8f          	tnz	_st1+25
2351  0054 270a          	jreq	L3521
2352                     ; 341 			st_pad3_confirm = 1;
2354  0056 721c00c6      	bset	_UART1Flag3_,#6
2355                     ; 342 			st1.st_ctrl_address = 0x04;
2357  005a 35040079      	mov	_st1+3,#4
2359  005e 2006          	jra	L1521
2360  0060               L3521:
2361                     ; 346 			st_pad3_confirm = 0;
2363  0060 721d00c6      	bres	_UART1Flag3_,#6
2364                     ; 347 			st1.st_ctrl_address = 0x00;
2366  0064 3f79          	clr	_st1+3
2367  0066               L1521:
2368                     ; 350 }
2371  0066 81            	ret
2451                     ; 357 void send_header_payload_init(u8 id,u8 mesh_id_H,u8 mesh_id_L,u8 len ,u8 cmd)
2451                     ; 358 {
2452                     .text:	section	.text,new
2453  0000               _send_header_payload_init:
2455  0000 89            	pushw	x
2456       00000000      OFST:	set	0
2459                     ; 359 	send_buf[0] = 0xEE;
2461  0001 35ee003c      	mov	_send_buf,#238
2462                     ; 360 	send_buf[1] = 0xEE;
2464  0005 35ee003d      	mov	_send_buf+1,#238
2465                     ; 361 	send_buf[2] = id;
2467  0009 9e            	ld	a,xh
2468  000a b73e          	ld	_send_buf+2,a
2469                     ; 362 	send_buf[3] = mesh_id_H;
2471  000c 9f            	ld	a,xl
2472  000d b73f          	ld	_send_buf+3,a
2473                     ; 363 	send_buf[4] = mesh_id_L;
2475  000f 7b05          	ld	a,(OFST+5,sp)
2476  0011 b740          	ld	_send_buf+4,a
2477                     ; 364 	send_buf[5] = len;
2479  0013 7b06          	ld	a,(OFST+6,sp)
2480  0015 b741          	ld	_send_buf+5,a
2481                     ; 366 	switch(cmd)
2483  0017 7b07          	ld	a,(OFST+7,sp)
2485                     ; 621 			break;
2486  0019 a006          	sub	a,#6
2487  001b 274a          	jreq	L1621
2488  001d a002          	sub	a,#2
2489  001f 2603          	jrne	L65
2490  0021 cc0289        	jp	L7721
2491  0024               L65:
2492  0024 a002          	sub	a,#2
2493  0026 2603          	jrne	L06
2494  0028 cc01f8        	jp	L3721
2495  002b               L06:
2496  002b a016          	sub	a,#22
2497  002d 2724          	jreq	L7521
2498  002f a009          	sub	a,#9
2499  0031 2775          	jreq	L3621
2500  0033 a00c          	sub	a,#12
2501  0035 2603cc00b8    	jreq	L5621
2502  003a a01c          	sub	a,#28
2503  003c 2603          	jrne	L26
2504  003e cc0207        	jp	L5721
2505  0041               L26:
2506  0041 a059          	sub	a,#89
2507  0043 2603          	jrne	L46
2508  0045 cc00ef        	jp	L7621
2509  0048               L46:
2510  0048 a00a          	sub	a,#10
2511  004a 2603          	jrne	L66
2512  004c cc01d7        	jp	L1721
2513  004f               L66:
2514  004f ac830383      	jpf	L1431
2515  0053               L7521:
2516                     ; 368 		case 0x20://回复环境光和环境颜色
2516                     ; 369 			send_buf[6] = cmd;
2518  0053 7b07          	ld	a,(OFST+7,sp)
2519  0055 b742          	ld	_send_buf+6,a
2520                     ; 370 			send_buf[7] = st1.st_ambient_light;
2522  0057 457f43        	mov	_send_buf+7,_st1+9
2523                     ; 371 			send_buf[8] = st1.st_color_sense_L;
2525  005a 458244        	mov	_send_buf+8,_st1+12
2526                     ; 372 			send_buf[9] = st1.st_color_sense_M;
2528  005d 458145        	mov	_send_buf+9,_st1+11
2529                     ; 373 			send_buf[10] = st1.st_color_sense_H;
2531  0060 458046        	mov	_send_buf+10,_st1+10
2532                     ; 374 			break;
2534  0063 ac830383      	jpf	L1431
2535  0067               L1621:
2536                     ; 375 		case 0x06://回复心跳包，回复背光LED,及3个触控开关的状态
2536                     ; 376 			send_buf[6] = cmd;
2538  0067 7b07          	ld	a,(OFST+7,sp)
2539  0069 b742          	ld	_send_buf+6,a
2540                     ; 377 			send_buf[7] = 0x00;//ST Module ID发0x00
2542  006b 3f43          	clr	_send_buf+7
2543                     ; 378 			send_buf[8] = 0x00;
2545  006d 3f44          	clr	_send_buf+8
2546                     ; 379 			if ((st1.st_device_status & 0x08)==0x08)	send_buf[8] = st1.st_pad1_status;
2548  006f b678          	ld	a,_st1+2
2549  0071 a408          	and	a,#8
2550  0073 a108          	cp	a,#8
2551  0075 2603          	jrne	L3431
2554  0077 457c44        	mov	_send_buf+8,_st1+6
2555  007a               L3431:
2556                     ; 380 			send_buf[9] = 0x00;
2558  007a 3f45          	clr	_send_buf+9
2559                     ; 381 			if ((st1.st_device_status & 0x04)==0x04)	send_buf[9] = st1.st_pad2_status;
2561  007c b678          	ld	a,_st1+2
2562  007e a404          	and	a,#4
2563  0080 a104          	cp	a,#4
2564  0082 2603          	jrne	L5431
2567  0084 457d45        	mov	_send_buf+9,_st1+7
2568  0087               L5431:
2569                     ; 382 			send_buf[10] = 0x00;
2571  0087 3f46          	clr	_send_buf+10
2572                     ; 383 			if ((st1.st_device_status & 0x02)==0x02)	send_buf[10]= st1.st_pad3_status;
2574  0089 b678          	ld	a,_st1+2
2575  008b a402          	and	a,#2
2576  008d a102          	cp	a,#2
2577  008f 2603          	jrne	L7431
2580  0091 457e46        	mov	_send_buf+10,_st1+8
2581  0094               L7431:
2582                     ; 384 			send_buf[11] = 0x00;
2584  0094 3f47          	clr	_send_buf+11
2585                     ; 385 			if ((st1.st_device_status & 0x01)==0x01)	send_buf[11]= st1.st_led_status;
2587  0096 b678          	ld	a,_st1+2
2588  0098 a401          	and	a,#1
2589  009a a101          	cp	a,#1
2590  009c 2703          	jreq	L07
2591  009e cc0383        	jp	L1431
2592  00a1               L07:
2595  00a1 457b47        	mov	_send_buf+11,_st1+5
2596  00a4 ac830383      	jpf	L1431
2597  00a8               L3621:
2598                     ; 387 		case 0x29://ST上报手势信息
2598                     ; 388 			send_buf[6] = cmd;
2600  00a8 7b07          	ld	a,(OFST+7,sp)
2601  00aa b742          	ld	_send_buf+6,a
2602                     ; 389 			send_buf[7] = st1.st_ges_H;
2604  00ac 457643        	mov	_send_buf+7,_st1
2605                     ; 390 			send_buf[8] = st1.st_ges_L;
2607  00af 457744        	mov	_send_buf+8,_st1+1
2608                     ; 391 			send_buf[9] = 0x00;//ST Module ID 保留
2610  00b2 3f45          	clr	_send_buf+9
2611                     ; 392 			break;
2613  00b4 ac830383      	jpf	L1431
2614  00b8               L5621:
2615                     ; 393 		case 0x35:
2615                     ; 394 			send_buf[6] = cmd;
2617  00b8 7b07          	ld	a,(OFST+7,sp)
2618  00ba b742          	ld	_send_buf+6,a
2619                     ; 395 			if (st_pad1_ctrl)
2621  00bc b6c6          	ld	a,_UART1Flag3_
2622  00be a502          	bcp	a,#2
2623  00c0 270a          	jreq	L3531
2624                     ; 397 				send_buf[7] = st1.st_pad1_ctrl_boardid;
2626  00c2 458543        	mov	_send_buf+7,_st1+15
2627                     ; 398 				send_buf[8] = st1.st_pad1_status;
2629  00c5 457c44        	mov	_send_buf+8,_st1+6
2631  00c8 ac830383      	jpf	L1431
2632  00cc               L3531:
2633                     ; 400 			else if (st_pad2_ctrl)
2635  00cc b6c6          	ld	a,_UART1Flag3_
2636  00ce a504          	bcp	a,#4
2637  00d0 270a          	jreq	L7531
2638                     ; 402 				send_buf[7] = st1.st_pad2_ctrl_boardid;
2640  00d2 458a43        	mov	_send_buf+7,_st1+20
2641                     ; 403 				send_buf[8] = st1.st_pad2_status;
2643  00d5 457d44        	mov	_send_buf+8,_st1+7
2645  00d8 ac830383      	jpf	L1431
2646  00dc               L7531:
2647                     ; 405 			else if (st_pad3_ctrl)
2649  00dc b6c6          	ld	a,_UART1Flag3_
2650  00de a508          	bcp	a,#8
2651  00e0 2603          	jrne	L27
2652  00e2 cc0383        	jp	L1431
2653  00e5               L27:
2654                     ; 407 				send_buf[7] = st1.st_pad3_ctrl_boardid;
2656  00e5 458f43        	mov	_send_buf+7,_st1+25
2657                     ; 408 				send_buf[8] = st1.st_pad3_status;
2659  00e8 457e44        	mov	_send_buf+8,_st1+8
2660  00eb ac830383      	jpf	L1431
2661  00ef               L7621:
2662                     ; 411 		case 0xAA://发送回执
2662                     ; 412 		  if (action_ctrlpad_flag)
2664  00ef b6c8          	ld	a,_UART1Flag1_
2665  00f1 a510          	bcp	a,#16
2666  00f3 271c          	jreq	L5631
2667                     ; 414 				action_ctrlpad_flag = 0;
2669  00f5 721900c8      	bres	_UART1Flag1_,#4
2670                     ; 415 				send_buf[6] = cmd;
2672  00f9 7b07          	ld	a,(OFST+7,sp)
2673  00fb b742          	ld	_send_buf+6,a
2674                     ; 416 				send_buf[7] = 0x05;//代表成功执行并返回模块状态
2676  00fd 35050043      	mov	_send_buf+7,#5
2677                     ; 417 				send_buf[8] = st1.st_pad1_status;
2679  0101 457c44        	mov	_send_buf+8,_st1+6
2680                     ; 418 				send_buf[9] = st1.st_pad2_status;
2682  0104 457d45        	mov	_send_buf+9,_st1+7
2683                     ; 419 				send_buf[10] = st1.st_pad3_status;
2685  0107 457e46        	mov	_send_buf+10,_st1+8
2686                     ; 420 				send_buf[11] = st1.st_led_status;
2688  010a 457b47        	mov	_send_buf+11,_st1+5
2690  010d ac830383      	jpf	L1431
2691  0111               L5631:
2692                     ; 422 			else if(led_ctrl_flag)
2694  0111 b6c5          	ld	a,_UART1Flag4_
2695  0113 a504          	bcp	a,#4
2696  0115 2723          	jreq	L1731
2697                     ; 424 				led_ctrl_flag = 0;
2699  0117 721500c5      	bres	_UART1Flag4_,#2
2700                     ; 425 				send_buf[6] = cmd;
2702  011b 7b07          	ld	a,(OFST+7,sp)
2703  011d b742          	ld	_send_buf+6,a
2704                     ; 426 				send_buf[7] = 0x01;//代表指令执行成功
2706  011f 35010043      	mov	_send_buf+7,#1
2707                     ; 427 				if((st1.st_led_mode == 0x4F) ||	(st1.st_led_mode == 0x5F))
2709  0123 b6b2          	ld	a,_st1+60
2710  0125 a14f          	cp	a,#79
2711  0127 2709          	jreq	L5731
2713  0129 b6b2          	ld	a,_st1+60
2714  012b a15f          	cp	a,#95
2715  012d 2703          	jreq	L47
2716  012f cc0383        	jp	L1431
2717  0132               L47:
2718  0132               L5731:
2719                     ; 428 					send_buf[7] = 0x02;//代表成功接收数据
2721  0132 35020043      	mov	_send_buf+7,#2
2722  0136 ac830383      	jpf	L1431
2723  013a               L1731:
2724                     ; 430 			else if(load_alert_flag)
2726  013a b6c5          	ld	a,_UART1Flag4_
2727  013c a508          	bcp	a,#8
2728  013e 2710          	jreq	L1041
2729                     ; 432 				load_alert_flag = 0;
2731  0140 721700c5      	bres	_UART1Flag4_,#3
2732                     ; 433 				send_buf[6] = cmd;
2734  0144 7b07          	ld	a,(OFST+7,sp)
2735  0146 b742          	ld	_send_buf+6,a
2736                     ; 434 				send_buf[7] = 0x01;//代表指令执行成功
2738  0148 35010043      	mov	_send_buf+7,#1
2740  014c ac830383      	jpf	L1431
2741  0150               L1041:
2742                     ; 436 			else if (cmd_refresh_flag)
2744  0150 b6c8          	ld	a,_UART1Flag1_
2745  0152 a504          	bcp	a,#4
2746  0154 2710          	jreq	L5041
2747                     ; 438 				cmd_refresh_flag = 0;
2749  0156 721500c8      	bres	_UART1Flag1_,#2
2750                     ; 439 				send_buf[6] = cmd;
2752  015a 7b07          	ld	a,(OFST+7,sp)
2753  015c b742          	ld	_send_buf+6,a
2754                     ; 440 				send_buf[7] = 0x01;//代表指令执行成功
2756  015e 35010043      	mov	_send_buf+7,#1
2758  0162 ac830383      	jpf	L1431
2759  0166               L5041:
2760                     ; 442 			else if(receipt_conf_pad1)
2762  0166 b6c4          	ld	a,_UART1Flag5_
2763  0168 a520          	bcp	a,#32
2764  016a 2710          	jreq	L1141
2765                     ; 444 				receipt_conf_pad1 = 0;
2767  016c 721b00c4      	bres	_UART1Flag5_,#5
2768                     ; 445 				send_buf[6] = cmd;
2770  0170 7b07          	ld	a,(OFST+7,sp)
2771  0172 b742          	ld	_send_buf+6,a
2772                     ; 446 				send_buf[7] = 0x01;//代表指令执行成功
2774  0174 35010043      	mov	_send_buf+7,#1
2776  0178 ac830383      	jpf	L1431
2777  017c               L1141:
2778                     ; 448 			else if(receipt_conf_pad2)
2780  017c b6c4          	ld	a,_UART1Flag5_
2781  017e a540          	bcp	a,#64
2782  0180 2710          	jreq	L5141
2783                     ; 450 				receipt_conf_pad2 = 0;
2785  0182 721d00c4      	bres	_UART1Flag5_,#6
2786                     ; 451 				send_buf[6] = cmd;
2788  0186 7b07          	ld	a,(OFST+7,sp)
2789  0188 b742          	ld	_send_buf+6,a
2790                     ; 452 				send_buf[7] = 0x03;//代表指令执行失败
2792  018a 35030043      	mov	_send_buf+7,#3
2794  018e ac830383      	jpf	L1431
2795  0192               L5141:
2796                     ; 454 			else if(receipt_conf_gest1)
2798  0192 b6c3          	ld	a,_UART1Flag6_
2799  0194 a501          	bcp	a,#1
2800  0196 2710          	jreq	L1241
2801                     ; 456 				receipt_conf_gest1 = 0;
2803  0198 721100c3      	bres	_UART1Flag6_,#0
2804                     ; 457 				send_buf[6] = cmd;
2806  019c 7b07          	ld	a,(OFST+7,sp)
2807  019e b742          	ld	_send_buf+6,a
2808                     ; 458 				send_buf[7] = 0x01;//代表指令执行成功
2810  01a0 35010043      	mov	_send_buf+7,#1
2812  01a4 ac830383      	jpf	L1431
2813  01a8               L1241:
2814                     ; 460 			else if(receipt_conf_gest2)
2816  01a8 b6c3          	ld	a,_UART1Flag6_
2817  01aa a502          	bcp	a,#2
2818  01ac 2710          	jreq	L5241
2819                     ; 462 				receipt_conf_gest2 = 0;
2821  01ae 721300c3      	bres	_UART1Flag6_,#1
2822                     ; 463 				send_buf[6] = cmd;
2824  01b2 7b07          	ld	a,(OFST+7,sp)
2825  01b4 b742          	ld	_send_buf+6,a
2826                     ; 464 				send_buf[7] = 0x03;//代表指令执行失败
2828  01b6 35030043      	mov	_send_buf+7,#3
2830  01ba ac830383      	jpf	L1431
2831  01be               L5241:
2832                     ; 466 			else if(receipt_device_info2)
2834  01be b6c4          	ld	a,_UART1Flag5_
2835  01c0 a501          	bcp	a,#1
2836  01c2 2603          	jrne	L67
2837  01c4 cc0383        	jp	L1431
2838  01c7               L67:
2839                     ; 468 				receipt_device_info2 = 0;
2841  01c7 721100c4      	bres	_UART1Flag5_,#0
2842                     ; 469 				send_buf[6] = cmd;
2844  01cb 7b07          	ld	a,(OFST+7,sp)
2845  01cd b742          	ld	_send_buf+6,a
2846                     ; 470 				send_buf[7] = 0x03;//代表指令执行失败
2848  01cf 35030043      	mov	_send_buf+7,#3
2849  01d3 ac830383      	jpf	L1431
2850  01d7               L1721:
2851                     ; 473 		case 0xB4://ST回复设备信息
2851                     ; 474 			send_buf[6] = cmd;
2853  01d7 7b07          	ld	a,(OFST+7,sp)
2854  01d9 b742          	ld	_send_buf+6,a
2855                     ; 475 			send_buf[7] = 0x11;//UUID
2857  01db 35110043      	mov	_send_buf+7,#17
2858                     ; 476 			send_buf[8] = 0x11;
2860  01df 35110044      	mov	_send_buf+8,#17
2861                     ; 477 			send_buf[9] = 0x11;
2863  01e3 35110045      	mov	_send_buf+9,#17
2864                     ; 478 			send_buf[10] = 0x11;
2866  01e7 35110046      	mov	_send_buf+10,#17
2867                     ; 479 			send_buf[11] = 0x63;//设备型号
2869  01eb 35630047      	mov	_send_buf+11,#99
2870                     ; 480 			send_buf[12] = 0x00;//固件版本
2872  01ef 3f48          	clr	_send_buf+12
2873                     ; 481 			send_buf[13] = st1.st_device_status;
2875  01f1 457849        	mov	_send_buf+13,_st1+2
2876                     ; 482 			break;
2878  01f4 ac830383      	jpf	L1431
2879  01f8               L3721:
2880                     ; 483 		case 0x0A://汇报 Seraph相关设备故障 
2880                     ; 484 			send_buf[6] = cmd;
2882  01f8 7b07          	ld	a,(OFST+7,sp)
2883  01fa b742          	ld	_send_buf+6,a
2884                     ; 485 			send_buf[7] = 0xB4;
2886  01fc 35b40043      	mov	_send_buf+7,#180
2887                     ; 486 			send_buf[8] = st1.st_device_status;
2889  0200 457844        	mov	_send_buf+8,_st1+2
2890                     ; 487 			break;
2892  0203 ac830383      	jpf	L1431
2893  0207               L5721:
2894                     ; 488 		case 0x51://ST被触发判断需要向SC 发送指令	预设值指令手势
2894                     ; 489 			send_buf[6] = cmd;
2896  0207 7b07          	ld	a,(OFST+7,sp)
2897  0209 b742          	ld	_send_buf+6,a
2898                     ; 490 			if(gest1_confirm)
2900  020b b6c7          	ld	a,_UART1Flag2_
2901  020d a504          	bcp	a,#4
2902  020f 270c          	jreq	L3341
2903                     ; 492 				send_buf[7] = st1.st_ges1_ctrl_boardid;
2905  0211 459643        	mov	_send_buf+7,_st1+32
2906                     ; 493 				send_buf[8] = st1.st_ges1_ctrl_action_value;
2908  0214 45a744        	mov	_send_buf+8,_st1+49
2909                     ; 494 				send_buf[9] = 0x00;
2911  0217 3f45          	clr	_send_buf+9
2913  0219 ac830383      	jpf	L1431
2914  021d               L3341:
2915                     ; 496 			else if(gest2_confirm)
2917  021d b6c7          	ld	a,_UART1Flag2_
2918  021f a508          	bcp	a,#8
2919  0221 270c          	jreq	L7341
2920                     ; 498 				send_buf[7] = st1.st_ges2_ctrl_boardid;
2922  0223 459b43        	mov	_send_buf+7,_st1+37
2923                     ; 499 				send_buf[8] = st1.st_ges2_ctrl_action_value;
2925  0226 45aa44        	mov	_send_buf+8,_st1+52
2926                     ; 500 				send_buf[9] = 0x00;
2928  0229 3f45          	clr	_send_buf+9
2930  022b ac830383      	jpf	L1431
2931  022f               L7341:
2932                     ; 502 			else if(gest3_confirm)
2934  022f b6c7          	ld	a,_UART1Flag2_
2935  0231 a510          	bcp	a,#16
2936  0233 270c          	jreq	L3441
2937                     ; 504 				send_buf[7] = st1.st_ges3_ctrl_boardid;
2939  0235 45a043        	mov	_send_buf+7,_st1+42
2940                     ; 505 				send_buf[8] = st1.st_ges3_ctrl_action_value;
2942  0238 45ad44        	mov	_send_buf+8,_st1+55
2943                     ; 506 				send_buf[9] = 0x00;
2945  023b 3f45          	clr	_send_buf+9
2947  023d ac830383      	jpf	L1431
2948  0241               L3441:
2949                     ; 508 			else if(gest4_confirm)
2951  0241 b6c7          	ld	a,_UART1Flag2_
2952  0243 a520          	bcp	a,#32
2953  0245 270c          	jreq	L7441
2954                     ; 510 				send_buf[7] = st1.st_ges4_ctrl_boardid;
2956  0247 45a543        	mov	_send_buf+7,_st1+47
2957                     ; 511 				send_buf[8] = st1.st_ges4_ctrl_action_value;
2959  024a 45b044        	mov	_send_buf+8,_st1+58
2960                     ; 512 				send_buf[9] = 0x00;
2962  024d 3f45          	clr	_send_buf+9
2964  024f ac830383      	jpf	L1431
2965  0253               L7441:
2966                     ; 514 			else if(st_pad1_confirm)
2968  0253 b6c6          	ld	a,_UART1Flag3_
2969  0255 a510          	bcp	a,#16
2970  0257 270b          	jreq	L3541
2971                     ; 516 				send_buf[7] = st1.st_pad1_ctrl_boardid;
2973  0259 458543        	mov	_send_buf+7,_st1+15
2974                     ; 517 				send_buf[8] = 0x00;
2976  025c 3f44          	clr	_send_buf+8
2977                     ; 518 				send_buf[9] = 0x00;
2979  025e 3f45          	clr	_send_buf+9
2981  0260 ac830383      	jpf	L1431
2982  0264               L3541:
2983                     ; 520 			else if(st_pad2_confirm)
2985  0264 b6c6          	ld	a,_UART1Flag3_
2986  0266 a520          	bcp	a,#32
2987  0268 270b          	jreq	L7541
2988                     ; 522 				send_buf[7] = st1.st_pad2_ctrl_boardid;
2990  026a 458a43        	mov	_send_buf+7,_st1+20
2991                     ; 523 				send_buf[8] = 0x00;
2993  026d 3f44          	clr	_send_buf+8
2994                     ; 524 				send_buf[9] = 0x00;
2996  026f 3f45          	clr	_send_buf+9
2998  0271 ac830383      	jpf	L1431
2999  0275               L7541:
3000                     ; 526 			else if(st_pad3_confirm)
3002  0275 b6c6          	ld	a,_UART1Flag3_
3003  0277 a540          	bcp	a,#64
3004  0279 2603          	jrne	L001
3005  027b cc0383        	jp	L1431
3006  027e               L001:
3007                     ; 528 				send_buf[7] = st1.st_pad3_ctrl_boardid;
3009  027e 458f43        	mov	_send_buf+7,_st1+25
3010                     ; 529 				send_buf[8] = 0x00;
3012  0281 3f44          	clr	_send_buf+8
3013                     ; 530 				send_buf[9] = 0x00;
3015  0283 3f45          	clr	_send_buf+9
3016  0285 ac830383      	jpf	L1431
3017  0289               L7721:
3018                     ; 534 		case 0x08://ST被触发异步向 SS 推送触发器数值和判断结果
3018                     ; 535 			send_buf[6] = cmd;
3020  0289 7b07          	ld	a,(OFST+7,sp)
3021  028b b742          	ld	_send_buf+6,a
3022                     ; 537 			if(gest1_confirm)
3024  028d b6c7          	ld	a,_UART1Flag2_
3025  028f a504          	bcp	a,#4
3026  0291 2720          	jreq	L5641
3027                     ; 539 				send_buf[7] = 0x02;//触发器是手势
3029  0293 35020043      	mov	_send_buf+7,#2
3030                     ; 540 				send_buf[8] = st1.st_ges1_ctrl_H;
3032  0297 459244        	mov	_send_buf+8,_st1+28
3033                     ; 541 				send_buf[9] = st1.st_ges1_ctrl_L;
3035  029a 459345        	mov	_send_buf+9,_st1+29
3036                     ; 542 				send_buf[10] = st1.st_ges1_ctrl_meshid_H;
3038  029d 459446        	mov	_send_buf+10,_st1+30
3039                     ; 543 				send_buf[11] = st1.st_ges1_ctrl_meshid_L;
3041  02a0 459547        	mov	_send_buf+11,_st1+31
3042                     ; 544 				send_buf[12] = st1.st_ges1_ctrl_action;
3044  02a3 45a648        	mov	_send_buf+12,_st1+48
3045                     ; 545 				send_buf[13] = st1.st_ges1_ctrl_boardid;
3047  02a6 459649        	mov	_send_buf+13,_st1+32
3048                     ; 546 				send_buf[14] = st1.st_ges1_ctrl_action_value;
3050  02a9 45a74a        	mov	_send_buf+14,_st1+49
3051                     ; 547 				send_buf[15] = st1.st_ges1_ctrl_action_time;
3053  02ac 45a84b        	mov	_send_buf+15,_st1+50
3055  02af ac830383      	jpf	L1431
3056  02b3               L5641:
3057                     ; 549 			else if(gest2_confirm)
3059  02b3 b6c7          	ld	a,_UART1Flag2_
3060  02b5 a508          	bcp	a,#8
3061  02b7 2720          	jreq	L1741
3062                     ; 551 				send_buf[7] = 0x02;
3064  02b9 35020043      	mov	_send_buf+7,#2
3065                     ; 552 				send_buf[8] = st1.st_ges2_ctrl_H;
3067  02bd 459744        	mov	_send_buf+8,_st1+33
3068                     ; 553 				send_buf[9] = st1.st_ges2_ctrl_L;
3070  02c0 459845        	mov	_send_buf+9,_st1+34
3071                     ; 554 				send_buf[10] = st1.st_ges2_ctrl_meshid_H;
3073  02c3 459946        	mov	_send_buf+10,_st1+35
3074                     ; 555 				send_buf[11] = st1.st_ges2_ctrl_meshid_L;
3076  02c6 459a47        	mov	_send_buf+11,_st1+36
3077                     ; 556 				send_buf[12] = st1.st_ges2_ctrl_action;
3079  02c9 45a948        	mov	_send_buf+12,_st1+51
3080                     ; 557 				send_buf[13] = st1.st_ges2_ctrl_boardid;
3082  02cc 459b49        	mov	_send_buf+13,_st1+37
3083                     ; 558 				send_buf[14] = st1.st_ges2_ctrl_action_value;
3085  02cf 45aa4a        	mov	_send_buf+14,_st1+52
3086                     ; 559 				send_buf[15] = st1.st_ges2_ctrl_action_time;
3088  02d2 45ab4b        	mov	_send_buf+15,_st1+53
3090  02d5 ac830383      	jpf	L1431
3091  02d9               L1741:
3092                     ; 561 			else if(gest3_confirm)
3094  02d9 b6c7          	ld	a,_UART1Flag2_
3095  02db a510          	bcp	a,#16
3096  02dd 2720          	jreq	L5741
3097                     ; 563 				send_buf[7] = 0x02;
3099  02df 35020043      	mov	_send_buf+7,#2
3100                     ; 564 				send_buf[8] = st1.st_ges3_ctrl_H;
3102  02e3 459c44        	mov	_send_buf+8,_st1+38
3103                     ; 565 				send_buf[9] = st1.st_ges3_ctrl_L;
3105  02e6 459d45        	mov	_send_buf+9,_st1+39
3106                     ; 566 				send_buf[10] = st1.st_ges3_ctrl_meshid_H;
3108  02e9 459e46        	mov	_send_buf+10,_st1+40
3109                     ; 567 				send_buf[11] = st1.st_ges3_ctrl_meshid_L;
3111  02ec 459f47        	mov	_send_buf+11,_st1+41
3112                     ; 568 				send_buf[12] = st1.st_ges3_ctrl_action;
3114  02ef 45ac48        	mov	_send_buf+12,_st1+54
3115                     ; 569 				send_buf[13] = st1.st_ges3_ctrl_boardid;
3117  02f2 45a049        	mov	_send_buf+13,_st1+42
3118                     ; 570 				send_buf[14] = st1.st_ges3_ctrl_action_value;
3120  02f5 45ad4a        	mov	_send_buf+14,_st1+55
3121                     ; 571 				send_buf[15] = st1.st_ges3_ctrl_action_time;
3123  02f8 45ae4b        	mov	_send_buf+15,_st1+56
3125  02fb ac830383      	jpf	L1431
3126  02ff               L5741:
3127                     ; 573 			else if(gest4_confirm)
3129  02ff b6c7          	ld	a,_UART1Flag2_
3130  0301 a520          	bcp	a,#32
3131  0303 271d          	jreq	L1051
3132                     ; 575 				send_buf[7] = 0x02;
3134  0305 35020043      	mov	_send_buf+7,#2
3135                     ; 576 				send_buf[8] = st1.st_ges4_ctrl_H;
3137  0309 45a144        	mov	_send_buf+8,_st1+43
3138                     ; 577 				send_buf[9] = st1.st_ges4_ctrl_L;
3140  030c 45a245        	mov	_send_buf+9,_st1+44
3141                     ; 578 				send_buf[10] = st1.st_ges4_ctrl_meshid_H;
3143  030f 45a346        	mov	_send_buf+10,_st1+45
3144                     ; 579 				send_buf[11] = st1.st_ges4_ctrl_meshid_L;
3146  0312 45a447        	mov	_send_buf+11,_st1+46
3147                     ; 580 				send_buf[12] = st1.st_ges4_ctrl_action;
3149  0315 45af48        	mov	_send_buf+12,_st1+57
3150                     ; 581 				send_buf[13] = st1.st_ges4_ctrl_boardid;
3152  0318 45a549        	mov	_send_buf+13,_st1+47
3153                     ; 582 				send_buf[14] = st1.st_ges4_ctrl_action_value;
3155  031b 45b04a        	mov	_send_buf+14,_st1+58
3156                     ; 583 				send_buf[15] = 0x00;
3158  031e 3f4b          	clr	_send_buf+15
3160  0320 2061          	jra	L1431
3161  0322               L1051:
3162                     ; 585 			else if(st_pad1_confirm)
3164  0322 b6c6          	ld	a,_UART1Flag3_
3165  0324 a510          	bcp	a,#16
3166  0326 271b          	jreq	L5051
3167                     ; 587 				send_buf[7] = 0x01;//触发器是按键
3169  0328 35010043      	mov	_send_buf+7,#1
3170                     ; 588 				send_buf[8] = 0x00;
3172  032c 3f44          	clr	_send_buf+8
3173                     ; 589 				send_buf[9] = st1.st_ctrl_address;
3175  032e 457945        	mov	_send_buf+9,_st1+3
3176                     ; 590 				send_buf[10] = st1.st_pad1_ctrl_meshid_H;
3178  0331 458346        	mov	_send_buf+10,_st1+13
3179                     ; 591 				send_buf[11] = st1.st_pad1_ctrl_meshid_L;
3181  0334 458447        	mov	_send_buf+11,_st1+14
3182                     ; 592 				send_buf[12] = st1.st_pad1_ctrl_action;
3184  0337 458648        	mov	_send_buf+12,_st1+16
3185                     ; 593 				send_buf[13] = st1.st_pad1_ctrl_boardid;
3187  033a 458549        	mov	_send_buf+13,_st1+15
3188                     ; 594 				send_buf[14] = 0x00;
3190  033d 3f4a          	clr	_send_buf+14
3191                     ; 595 				send_buf[15] = 0x00;
3193  033f 3f4b          	clr	_send_buf+15
3195  0341 2040          	jra	L1431
3196  0343               L5051:
3197                     ; 597 			else if(st_pad2_confirm)
3199  0343 b6c6          	ld	a,_UART1Flag3_
3200  0345 a520          	bcp	a,#32
3201  0347 271b          	jreq	L1151
3202                     ; 599 				send_buf[7] = 0x01;//触发器是按键
3204  0349 35010043      	mov	_send_buf+7,#1
3205                     ; 600 				send_buf[8] = 0x00;
3207  034d 3f44          	clr	_send_buf+8
3208                     ; 601 				send_buf[9] = st1.st_ctrl_address;
3210  034f 457945        	mov	_send_buf+9,_st1+3
3211                     ; 602 				send_buf[10] = st1.st_pad2_ctrl_meshid_H;
3213  0352 458846        	mov	_send_buf+10,_st1+18
3214                     ; 603 				send_buf[11] = st1.st_pad2_ctrl_meshid_L;
3216  0355 458947        	mov	_send_buf+11,_st1+19
3217                     ; 604 				send_buf[12] = st1.st_pad2_ctrl_action;
3219  0358 458b48        	mov	_send_buf+12,_st1+21
3220                     ; 605 				send_buf[13] = st1.st_pad2_ctrl_boardid;
3222  035b 458a49        	mov	_send_buf+13,_st1+20
3223                     ; 606 				send_buf[14] = 0x00;
3225  035e 3f4a          	clr	_send_buf+14
3226                     ; 607 				send_buf[15] = 0x00;
3228  0360 3f4b          	clr	_send_buf+15
3230  0362 201f          	jra	L1431
3231  0364               L1151:
3232                     ; 609 			else if(st_pad3_confirm)
3234  0364 b6c6          	ld	a,_UART1Flag3_
3235  0366 a540          	bcp	a,#64
3236  0368 2719          	jreq	L1431
3237                     ; 611 				send_buf[7] = 0x01;//触发器是按键
3239  036a 35010043      	mov	_send_buf+7,#1
3240                     ; 612 				send_buf[8] = 0x00;
3242  036e 3f44          	clr	_send_buf+8
3243                     ; 613 				send_buf[9] = st1.st_ctrl_address;
3245  0370 457945        	mov	_send_buf+9,_st1+3
3246                     ; 614 				send_buf[10] = st1.st_pad3_ctrl_meshid_H;
3248  0373 458d46        	mov	_send_buf+10,_st1+23
3249                     ; 615 				send_buf[11] = st1.st_pad3_ctrl_meshid_L;
3251  0376 458e47        	mov	_send_buf+11,_st1+24
3252                     ; 616 				send_buf[12] = st1.st_pad3_ctrl_action;
3254  0379 459048        	mov	_send_buf+12,_st1+26
3255                     ; 617 				send_buf[13] = st1.st_pad3_ctrl_boardid;
3257  037c 458f49        	mov	_send_buf+13,_st1+25
3258                     ; 618 				send_buf[14] = 0x00;
3260  037f 3f4a          	clr	_send_buf+14
3261                     ; 619 				send_buf[15] = 0x00;
3263  0381 3f4b          	clr	_send_buf+15
3264  0383               L1431:
3265                     ; 623 	send_buf[len+2] = Check_Sum((send_buf+2),len);
3267  0383 7b06          	ld	a,(OFST+6,sp)
3268  0385 5f            	clrw	x
3269  0386 97            	ld	xl,a
3270  0387 89            	pushw	x
3271  0388 7b08          	ld	a,(OFST+8,sp)
3272  038a 88            	push	a
3273  038b ae003e        	ldw	x,#_send_buf+2
3274  038e cd0000        	call	_Check_Sum
3276  0391 5b01          	addw	sp,#1
3277  0393 85            	popw	x
3278  0394 e73e          	ld	(_send_buf+2,x),a
3279                     ; 624 }
3282  0396 85            	popw	x
3283  0397 81            	ret
3350                     ; 642 void rev_header_anaylze(u8 *message_id,u8 *mesh_id_H,u8 *mesh_id_L,u8 *message_length)
3350                     ; 643 {
3351                     .text:	section	.text,new
3352  0000               _rev_header_anaylze:
3354  0000 89            	pushw	x
3355       00000000      OFST:	set	0
3358                     ; 644 	if ((sicp_buf[0] == 0xEE) && (sicp_buf[1]== 0xEE))
3360  0001 b600          	ld	a,_sicp_buf
3361  0003 a1ee          	cp	a,#238
3362  0005 261e          	jrne	L1551
3364  0007 b601          	ld	a,_sicp_buf+1
3365  0009 a1ee          	cp	a,#238
3366  000b 2618          	jrne	L1551
3367                     ; 646 		ble_data_frame = 1;
3369  000d 721a00c8      	bset	_UART1Flag1_,#5
3370                     ; 647 		*message_id = sicp_buf[2];
3372  0011 b602          	ld	a,_sicp_buf+2
3373  0013 f7            	ld	(x),a
3374                     ; 648 		*mesh_id_H = sicp_buf[3];
3376  0014 1e05          	ldw	x,(OFST+5,sp)
3377  0016 b603          	ld	a,_sicp_buf+3
3378  0018 f7            	ld	(x),a
3379                     ; 649 		*mesh_id_L = sicp_buf[4];
3381  0019 1e07          	ldw	x,(OFST+7,sp)
3382  001b b604          	ld	a,_sicp_buf+4
3383  001d f7            	ld	(x),a
3384                     ; 650 		*message_length = sicp_buf[5];
3386  001e 1e09          	ldw	x,(OFST+9,sp)
3387  0020 b605          	ld	a,_sicp_buf+5
3388  0022 f7            	ld	(x),a
3390  0023 2015          	jra	L3551
3391  0025               L1551:
3392                     ; 653 	else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD))//Network	Status	Reporting	
3394  0025 b600          	ld	a,_sicp_buf
3395  0027 a1dd          	cp	a,#221
3396  0029 260f          	jrne	L3551
3398  002b b601          	ld	a,_sicp_buf+1
3399  002d a1dd          	cp	a,#221
3400  002f 2609          	jrne	L3551
3401                     ; 655 		ble_ctrl_frame = 1;
3403  0031 721c00c8      	bset	_UART1Flag1_,#6
3404                     ; 656 		*message_length = sicp_buf[3];
3406  0035 1e09          	ldw	x,(OFST+9,sp)
3407  0037 b603          	ld	a,_sicp_buf+3
3408  0039 f7            	ld	(x),a
3409  003a               L3551:
3410                     ; 663 }
3413  003a 85            	popw	x
3414  003b 81            	ret
3481                     ; 670 bool rev_payload_anaylze(void)
3481                     ; 671 {
3482                     .text:	section	.text,new
3483  0000               _rev_payload_anaylze:
3485  0000 89            	pushw	x
3486       00000002      OFST:	set	2
3489                     ; 673 	if (ble_data_frame)
3491  0001 b6c8          	ld	a,_UART1Flag1_
3492  0003 a520          	bcp	a,#32
3493  0005 2603          	jrne	L011
3494  0007 cc0518        	jp	L7361
3495  000a               L011:
3496                     ; 675 		ble_data_frame = 0;
3498  000a 721b00c8      	bres	_UART1Flag1_,#5
3499                     ; 676 		switch(sicp_buf[6])
3501  000e b606          	ld	a,_sicp_buf+6
3503                     ; 978 			default:
3503                     ; 979 				break;
3504  0010 a003          	sub	a,#3
3505  0012 2603          	jrne	L211
3506  0014 cc02e7        	jp	L5651
3507  0017               L211:
3508  0017 4a            	dec	a
3509  0018 2726          	jreq	L7551
3510  001a 4a            	dec	a
3511  001b 2603          	jrne	L411
3512  001d cc04f0        	jp	L5061
3513  0020               L411:
3514  0020 a004          	sub	a,#4
3515  0022 2603          	jrne	L611
3516  0024 cc03c6        	jp	L1751
3517  0027               L611:
3518  0027 a04d          	sub	a,#77
3519  0029 2603          	jrne	L021
3520  002b cc036b        	jp	L7651
3521  002e               L021:
3522  002e a054          	sub	a,#84
3523  0030 2603          	jrne	L221
3524  0032 cc02c5        	jp	L1651
3525  0035               L221:
3526  0035 a016          	sub	a,#22
3527  0037 2603          	jrne	L421
3528  0039 cc02d6        	jp	L3651
3529  003c               L421:
3530  003c ac140514      	jpf	L3461
3531  0040               L7551:
3532                     ; 678 			case 0x04://SS向ST发送配置信息
3532                     ; 679 				receipt_device_info1 = 1;
3534  0040 721000c4      	bset	_UART1Flag5_,#0
3535                     ; 682 					if (sicp_buf[7] == 0x01)//设置ST按键作用
3537  0044 b607          	ld	a,_sicp_buf+7
3538  0046 a101          	cp	a,#1
3539  0048 2703          	jreq	L621
3540  004a cc012e        	jp	L5461
3541  004d               L621:
3542                     ; 684 						kickout_flag = 0;
3544  004d 721100c5      	bres	_UART1Flag4_,#0
3545                     ; 685 						net_reset_flag = 0;
3547  0051 721300c5      	bres	_UART1Flag4_,#1
3548                     ; 686 						if ((sicp_buf[8] & 0x01) == 0x01)//设置通道1
3550  0055 b608          	ld	a,_sicp_buf+8
3551  0057 a401          	and	a,#1
3552  0059 a101          	cp	a,#1
3553  005b 2634          	jrne	L7461
3554                     ; 688 							st1.st_pad1_ctrl_meshid_H = sicp_buf[10];
3556  005d 450a83        	mov	_st1+13,_sicp_buf+10
3557                     ; 689 							st1.st_pad1_ctrl_meshid_L = sicp_buf[11];
3559  0060 450b84        	mov	_st1+14,_sicp_buf+11
3560                     ; 690 							st1.st_pad1_ctrl_boardid 	= sicp_buf[12];
3562  0063 450c85        	mov	_st1+15,_sicp_buf+12
3563                     ; 691 							st1.st_pad1_ctrl_action   = sicp_buf[13];
3565  0066 450d86        	mov	_st1+16,_sicp_buf+13
3566                     ; 692 							st1.st_pad1_ctrl_action_value = sicp_buf[14];
3568  0069 450e87        	mov	_st1+17,_sicp_buf+14
3569                     ; 693 							receipt_conf_pad1 = 1;
3571  006c 721a00c4      	bset	_UART1Flag5_,#5
3572                     ; 694 							send_message_length = 6;
3574  0070 35060064      	mov	_send_message_length,#6
3575                     ; 695 							send_cmd = 0xAA;
3577  0074 35aa0063      	mov	_send_cmd,#170
3578                     ; 696 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3580  0078 4baa          	push	#170
3581  007a 4b06          	push	#6
3582  007c 3b006c        	push	_ns_own_meshid_L
3583  007f b66d          	ld	a,_ns_own_meshid_H
3584  0081 97            	ld	xl,a
3585  0082 b669          	ld	a,_rev_message_id
3586  0084 95            	ld	xh,a
3587  0085 cd0000        	call	_send_header_payload_init
3589  0088 5b03          	addw	sp,#3
3590                     ; 697 							UART1_Send_Data_Start();
3592  008a cd0000        	call	_UART1_Send_Data_Start
3594                     ; 698 							break;
3596  008d ac140514      	jpf	L3461
3597  0091               L7461:
3598                     ; 700 						else if ((sicp_buf[8] & 0x02) == 0x02)//设置通道2
3600  0091 b608          	ld	a,_sicp_buf+8
3601  0093 a402          	and	a,#2
3602  0095 a102          	cp	a,#2
3603  0097 2634          	jrne	L3561
3604                     ; 702 							st1.st_pad2_ctrl_meshid_H = sicp_buf[10];
3606  0099 450a88        	mov	_st1+18,_sicp_buf+10
3607                     ; 703 							st1.st_pad2_ctrl_meshid_L = sicp_buf[11];
3609  009c 450b89        	mov	_st1+19,_sicp_buf+11
3610                     ; 704 							st1.st_pad2_ctrl_boardid 	= sicp_buf[12];
3612  009f 450c8a        	mov	_st1+20,_sicp_buf+12
3613                     ; 705 							st1.st_pad2_ctrl_action   = sicp_buf[13];
3615  00a2 450d8b        	mov	_st1+21,_sicp_buf+13
3616                     ; 706 							st1.st_pad2_ctrl_action_value = sicp_buf[14];
3618  00a5 450e8c        	mov	_st1+22,_sicp_buf+14
3619                     ; 707 							receipt_conf_pad1 = 1;
3621  00a8 721a00c4      	bset	_UART1Flag5_,#5
3622                     ; 708 							send_message_length = 6;
3624  00ac 35060064      	mov	_send_message_length,#6
3625                     ; 709 							send_cmd = 0xAA;
3627  00b0 35aa0063      	mov	_send_cmd,#170
3628                     ; 710 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3630  00b4 4baa          	push	#170
3631  00b6 4b06          	push	#6
3632  00b8 3b006c        	push	_ns_own_meshid_L
3633  00bb b66d          	ld	a,_ns_own_meshid_H
3634  00bd 97            	ld	xl,a
3635  00be b669          	ld	a,_rev_message_id
3636  00c0 95            	ld	xh,a
3637  00c1 cd0000        	call	_send_header_payload_init
3639  00c4 5b03          	addw	sp,#3
3640                     ; 711 							UART1_Send_Data_Start();
3642  00c6 cd0000        	call	_UART1_Send_Data_Start
3644                     ; 712 							break;
3646  00c9 ac140514      	jpf	L3461
3647  00cd               L3561:
3648                     ; 714 						else if ((sicp_buf[8] & 0x04) == 0x04)//设置通道3
3650  00cd b608          	ld	a,_sicp_buf+8
3651  00cf a404          	and	a,#4
3652  00d1 a104          	cp	a,#4
3653  00d3 2634          	jrne	L7561
3654                     ; 716 							st1.st_pad3_ctrl_meshid_H = sicp_buf[10];
3656  00d5 450a8d        	mov	_st1+23,_sicp_buf+10
3657                     ; 717 							st1.st_pad3_ctrl_meshid_L = sicp_buf[11];
3659  00d8 450b8e        	mov	_st1+24,_sicp_buf+11
3660                     ; 718 							st1.st_pad3_ctrl_boardid 	= sicp_buf[12];
3662  00db 450c8f        	mov	_st1+25,_sicp_buf+12
3663                     ; 719 							st1.st_pad3_ctrl_action   = sicp_buf[13];
3665  00de 450d90        	mov	_st1+26,_sicp_buf+13
3666                     ; 720 							st1.st_pad3_ctrl_action_value = sicp_buf[14];
3668  00e1 450e91        	mov	_st1+27,_sicp_buf+14
3669                     ; 721 							receipt_conf_pad1 = 1;
3671  00e4 721a00c4      	bset	_UART1Flag5_,#5
3672                     ; 722 							send_message_length = 6;
3674  00e8 35060064      	mov	_send_message_length,#6
3675                     ; 723 							send_cmd = 0xAA;
3677  00ec 35aa0063      	mov	_send_cmd,#170
3678                     ; 724 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3680  00f0 4baa          	push	#170
3681  00f2 4b06          	push	#6
3682  00f4 3b006c        	push	_ns_own_meshid_L
3683  00f7 b66d          	ld	a,_ns_own_meshid_H
3684  00f9 97            	ld	xl,a
3685  00fa b669          	ld	a,_rev_message_id
3686  00fc 95            	ld	xh,a
3687  00fd cd0000        	call	_send_header_payload_init
3689  0100 5b03          	addw	sp,#3
3690                     ; 725 							UART1_Send_Data_Start();
3692  0102 cd0000        	call	_UART1_Send_Data_Start
3694                     ; 726 							break;
3696  0105 ac140514      	jpf	L3461
3697  0109               L7561:
3698                     ; 730 							receipt_conf_pad2 = 1;
3700  0109 721c00c4      	bset	_UART1Flag5_,#6
3701                     ; 731 							send_message_length = 6;
3703  010d 35060064      	mov	_send_message_length,#6
3704                     ; 732 							send_cmd = 0xAA;
3706  0111 35aa0063      	mov	_send_cmd,#170
3707                     ; 733 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3709  0115 4baa          	push	#170
3710  0117 4b06          	push	#6
3711  0119 3b006c        	push	_ns_own_meshid_L
3712  011c b66d          	ld	a,_ns_own_meshid_H
3713  011e 97            	ld	xl,a
3714  011f b669          	ld	a,_rev_message_id
3715  0121 95            	ld	xh,a
3716  0122 cd0000        	call	_send_header_payload_init
3718  0125 5b03          	addw	sp,#3
3719                     ; 734 							UART1_Send_Data_Start();
3721  0127 cd0000        	call	_UART1_Send_Data_Start
3723                     ; 735 							break;
3725  012a ac140514      	jpf	L3461
3726  012e               L5461:
3727                     ; 739 					if (sicp_buf[7] == 0x02)//设置ST手势作用
3729  012e b607          	ld	a,_sicp_buf+7
3730  0130 a102          	cp	a,#2
3731  0132 2703          	jreq	L031
3732  0134 cc0514        	jp	L3461
3733  0137               L031:
3734                     ; 741 						kickout_flag = 0;
3736  0137 721100c5      	bres	_UART1Flag4_,#0
3737                     ; 742 						net_reset_flag = 0;
3739  013b 721300c5      	bres	_UART1Flag4_,#1
3740                     ; 744 						if((sicp_buf[8] != st1.st_ges1_ctrl_H) && (sicp_buf[9] != st1.st_ges1_ctrl_L))//第一个预设置手势
3742  013f b608          	ld	a,_sicp_buf+8
3743  0141 b192          	cp	a,_st1+28
3744  0143 2740          	jreq	L5661
3746  0145 b609          	ld	a,_sicp_buf+9
3747  0147 b193          	cp	a,_st1+29
3748  0149 273a          	jreq	L5661
3749                     ; 746 							st1.st_ges1_ctrl_H						= sicp_buf[8];
3751  014b 450892        	mov	_st1+28,_sicp_buf+8
3752                     ; 747 							st1.st_ges1_ctrl_L						= sicp_buf[9];
3754  014e 450993        	mov	_st1+29,_sicp_buf+9
3755                     ; 748 							st1.st_ges1_ctrl_meshid_H 		= sicp_buf[10];
3757  0151 450a94        	mov	_st1+30,_sicp_buf+10
3758                     ; 749 							st1.st_ges1_ctrl_meshid_L 		= sicp_buf[11];
3760  0154 450b95        	mov	_st1+31,_sicp_buf+11
3761                     ; 750 							st1.st_ges1_ctrl_boardid 			= sicp_buf[12];
3763  0157 450c96        	mov	_st1+32,_sicp_buf+12
3764                     ; 751 							st1.st_ges1_ctrl_action				= sicp_buf[13];
3766  015a 450da6        	mov	_st1+48,_sicp_buf+13
3767                     ; 752 							st1.st_ges1_ctrl_action_value = sicp_buf[14];
3769  015d 450ea7        	mov	_st1+49,_sicp_buf+14
3770                     ; 753 							receipt_conf_gest1 = 1;
3772  0160 721000c3      	bset	_UART1Flag6_,#0
3773                     ; 754 							send_message_length = 6;
3775  0164 35060064      	mov	_send_message_length,#6
3776                     ; 755 							send_cmd = 0xAA;
3778  0168 35aa0063      	mov	_send_cmd,#170
3779                     ; 756 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3781  016c 4baa          	push	#170
3782  016e 4b06          	push	#6
3783  0170 3b006c        	push	_ns_own_meshid_L
3784  0173 b66d          	ld	a,_ns_own_meshid_H
3785  0175 97            	ld	xl,a
3786  0176 b669          	ld	a,_rev_message_id
3787  0178 95            	ld	xh,a
3788  0179 cd0000        	call	_send_header_payload_init
3790  017c 5b03          	addw	sp,#3
3791                     ; 757 							UART1_Send_Data_Start();
3793  017e cd0000        	call	_UART1_Send_Data_Start
3795                     ; 758 							break;
3797  0181 ac140514      	jpf	L3461
3798  0185               L5661:
3799                     ; 760 						else if((sicp_buf[8] != st1.st_ges2_ctrl_H) && (sicp_buf[9] != st1.st_ges2_ctrl_L))//第二个预设置手势
3801  0185 b608          	ld	a,_sicp_buf+8
3802  0187 b197          	cp	a,_st1+33
3803  0189 2740          	jreq	L1761
3805  018b b609          	ld	a,_sicp_buf+9
3806  018d b198          	cp	a,_st1+34
3807  018f 273a          	jreq	L1761
3808                     ; 762 							st1.st_ges2_ctrl_H						= sicp_buf[8];
3810  0191 450897        	mov	_st1+33,_sicp_buf+8
3811                     ; 763 							st1.st_ges2_ctrl_L						= sicp_buf[9];
3813  0194 450998        	mov	_st1+34,_sicp_buf+9
3814                     ; 764 							st1.st_ges2_ctrl_meshid_H 		= sicp_buf[10];
3816  0197 450a99        	mov	_st1+35,_sicp_buf+10
3817                     ; 765 							st1.st_ges2_ctrl_meshid_L 		= sicp_buf[11];
3819  019a 450b9a        	mov	_st1+36,_sicp_buf+11
3820                     ; 766 							st1.st_ges2_ctrl_boardid 			= sicp_buf[12];
3822  019d 450c9b        	mov	_st1+37,_sicp_buf+12
3823                     ; 767 							st1.st_ges2_ctrl_action				= sicp_buf[13];
3825  01a0 450da9        	mov	_st1+51,_sicp_buf+13
3826                     ; 768 							st1.st_ges2_ctrl_action_value = sicp_buf[14];
3828  01a3 450eaa        	mov	_st1+52,_sicp_buf+14
3829                     ; 769 							receipt_conf_gest1 = 1;
3831  01a6 721000c3      	bset	_UART1Flag6_,#0
3832                     ; 770 							send_message_length = 6;
3834  01aa 35060064      	mov	_send_message_length,#6
3835                     ; 771 							send_cmd = 0xAA;
3837  01ae 35aa0063      	mov	_send_cmd,#170
3838                     ; 772 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3840  01b2 4baa          	push	#170
3841  01b4 4b06          	push	#6
3842  01b6 3b006c        	push	_ns_own_meshid_L
3843  01b9 b66d          	ld	a,_ns_own_meshid_H
3844  01bb 97            	ld	xl,a
3845  01bc b669          	ld	a,_rev_message_id
3846  01be 95            	ld	xh,a
3847  01bf cd0000        	call	_send_header_payload_init
3849  01c2 5b03          	addw	sp,#3
3850                     ; 773 							UART1_Send_Data_Start();
3852  01c4 cd0000        	call	_UART1_Send_Data_Start
3854                     ; 774 							break;
3856  01c7 ac140514      	jpf	L3461
3857  01cb               L1761:
3858                     ; 776 						else if((sicp_buf[8] != st1.st_ges3_ctrl_H) && (sicp_buf[9] != st1.st_ges3_ctrl_L))//第三个预设置手势
3860  01cb b608          	ld	a,_sicp_buf+8
3861  01cd b19c          	cp	a,_st1+38
3862  01cf 2740          	jreq	L5761
3864  01d1 b609          	ld	a,_sicp_buf+9
3865  01d3 b19d          	cp	a,_st1+39
3866  01d5 273a          	jreq	L5761
3867                     ; 778 							st1.st_ges3_ctrl_H						= sicp_buf[8];
3869  01d7 45089c        	mov	_st1+38,_sicp_buf+8
3870                     ; 779 							st1.st_ges3_ctrl_L						= sicp_buf[9];
3872  01da 45099d        	mov	_st1+39,_sicp_buf+9
3873                     ; 780 							st1.st_ges3_ctrl_meshid_H 		= sicp_buf[10];
3875  01dd 450a9e        	mov	_st1+40,_sicp_buf+10
3876                     ; 781 							st1.st_ges3_ctrl_meshid_L 		= sicp_buf[11];
3878  01e0 450b9f        	mov	_st1+41,_sicp_buf+11
3879                     ; 782 							st1.st_ges3_ctrl_boardid 			= sicp_buf[12];
3881  01e3 450ca0        	mov	_st1+42,_sicp_buf+12
3882                     ; 783 							st1.st_ges3_ctrl_action				= sicp_buf[13];
3884  01e6 450dac        	mov	_st1+54,_sicp_buf+13
3885                     ; 784 							st1.st_ges3_ctrl_action_value = sicp_buf[14];
3887  01e9 450ead        	mov	_st1+55,_sicp_buf+14
3888                     ; 785 							receipt_conf_gest1 = 1;
3890  01ec 721000c3      	bset	_UART1Flag6_,#0
3891                     ; 786 							send_message_length = 6;
3893  01f0 35060064      	mov	_send_message_length,#6
3894                     ; 787 							send_cmd = 0xAA;
3896  01f4 35aa0063      	mov	_send_cmd,#170
3897                     ; 788 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3899  01f8 4baa          	push	#170
3900  01fa 4b06          	push	#6
3901  01fc 3b006c        	push	_ns_own_meshid_L
3902  01ff b66d          	ld	a,_ns_own_meshid_H
3903  0201 97            	ld	xl,a
3904  0202 b669          	ld	a,_rev_message_id
3905  0204 95            	ld	xh,a
3906  0205 cd0000        	call	_send_header_payload_init
3908  0208 5b03          	addw	sp,#3
3909                     ; 789 							UART1_Send_Data_Start();
3911  020a cd0000        	call	_UART1_Send_Data_Start
3913                     ; 790 							break;
3915  020d ac140514      	jpf	L3461
3916  0211               L5761:
3917                     ; 792 						else if((sicp_buf[8] != st1.st_ges4_ctrl_H) && (sicp_buf[9] != st1.st_ges4_ctrl_L))//第三个预设置手势
3919  0211 b608          	ld	a,_sicp_buf+8
3920  0213 b1a1          	cp	a,_st1+43
3921  0215 2740          	jreq	L1071
3923  0217 b609          	ld	a,_sicp_buf+9
3924  0219 b1a2          	cp	a,_st1+44
3925  021b 273a          	jreq	L1071
3926                     ; 794 							st1.st_ges4_ctrl_H						= sicp_buf[8];
3928  021d 4508a1        	mov	_st1+43,_sicp_buf+8
3929                     ; 795 							st1.st_ges4_ctrl_L						= sicp_buf[9];
3931  0220 4509a2        	mov	_st1+44,_sicp_buf+9
3932                     ; 796 							st1.st_ges4_ctrl_meshid_H 		= sicp_buf[10];
3934  0223 450aa3        	mov	_st1+45,_sicp_buf+10
3935                     ; 797 							st1.st_ges4_ctrl_meshid_L 		= sicp_buf[11];
3937  0226 450ba4        	mov	_st1+46,_sicp_buf+11
3938                     ; 798 							st1.st_ges4_ctrl_boardid 			= sicp_buf[12];
3940  0229 450ca5        	mov	_st1+47,_sicp_buf+12
3941                     ; 799 							st1.st_ges4_ctrl_action				= sicp_buf[13];
3943  022c 450daf        	mov	_st1+57,_sicp_buf+13
3944                     ; 800 							st1.st_ges4_ctrl_action_value = sicp_buf[14];
3946  022f 450eb0        	mov	_st1+58,_sicp_buf+14
3947                     ; 801 							receipt_conf_gest1 = 1;
3949  0232 721000c3      	bset	_UART1Flag6_,#0
3950                     ; 802 							send_message_length = 6;
3952  0236 35060064      	mov	_send_message_length,#6
3953                     ; 803 							send_cmd = 0xAA;
3955  023a 35aa0063      	mov	_send_cmd,#170
3956                     ; 804 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
3958  023e 4baa          	push	#170
3959  0240 4b06          	push	#6
3960  0242 3b006c        	push	_ns_own_meshid_L
3961  0245 b66d          	ld	a,_ns_own_meshid_H
3962  0247 97            	ld	xl,a
3963  0248 b669          	ld	a,_rev_message_id
3964  024a 95            	ld	xh,a
3965  024b cd0000        	call	_send_header_payload_init
3967  024e 5b03          	addw	sp,#3
3968                     ; 805 							UART1_Send_Data_Start();
3970  0250 cd0000        	call	_UART1_Send_Data_Start
3972                     ; 806 							break;
3974  0253 ac140514      	jpf	L3461
3975  0257               L1071:
3976                     ; 808 						else if(((sicp_buf[8] == st1.st_ges1_ctrl_H) && (sicp_buf[9] == st1.st_ges1_ctrl_L))
3976                     ; 809 										|| ((sicp_buf[8] == st1.st_ges2_ctrl_H) && (sicp_buf[9] == st1.st_ges2_ctrl_L))
3976                     ; 810 										|| ((sicp_buf[8] == st1.st_ges3_ctrl_H) && (sicp_buf[9] == st1.st_ges3_ctrl_L))
3976                     ; 811 										|| ((sicp_buf[8] == st1.st_ges3_ctrl_H) && (sicp_buf[9] == st1.st_ges3_ctrl_L)))
3978  0257 b608          	ld	a,_sicp_buf+8
3979  0259 b192          	cp	a,_st1+28
3980  025b 2606          	jrne	L1171
3982  025d b609          	ld	a,_sicp_buf+9
3983  025f b193          	cp	a,_st1+29
3984  0261 2718          	jreq	L7071
3985  0263               L1171:
3987  0263 b608          	ld	a,_sicp_buf+8
3988  0265 b197          	cp	a,_st1+33
3989  0267 2606          	jrne	L5171
3991  0269 b609          	ld	a,_sicp_buf+9
3992  026b b198          	cp	a,_st1+34
3993  026d 270c          	jreq	L7071
3994  026f               L5171:
3996  026f b608          	ld	a,_sicp_buf+8
3997  0271 b19c          	cp	a,_st1+38
3998  0273 262b          	jrne	L5071
4000  0275 b609          	ld	a,_sicp_buf+9
4001  0277 b19d          	cp	a,_st1+39
4002  0279 2625          	jrne	L5071
4003  027b               L7071:
4004                     ; 813 							receipt_conf_gest1 = 1;
4006  027b 721000c3      	bset	_UART1Flag6_,#0
4007                     ; 814 							send_message_length = 6;
4009  027f 35060064      	mov	_send_message_length,#6
4010                     ; 815 							send_cmd = 0xAA;
4012  0283 35aa0063      	mov	_send_cmd,#170
4013                     ; 816 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4015  0287 4baa          	push	#170
4016  0289 4b06          	push	#6
4017  028b 3b006c        	push	_ns_own_meshid_L
4018  028e b66d          	ld	a,_ns_own_meshid_H
4019  0290 97            	ld	xl,a
4020  0291 b669          	ld	a,_rev_message_id
4021  0293 95            	ld	xh,a
4022  0294 cd0000        	call	_send_header_payload_init
4024  0297 5b03          	addw	sp,#3
4025                     ; 817 							UART1_Send_Data_Start();
4027  0299 cd0000        	call	_UART1_Send_Data_Start
4029                     ; 818 							break;
4031  029c ac140514      	jpf	L3461
4032  02a0               L5071:
4033                     ; 822 							receipt_conf_gest2 = 1;
4035  02a0 721200c3      	bset	_UART1Flag6_,#1
4036                     ; 823 							send_message_length = 6;
4038  02a4 35060064      	mov	_send_message_length,#6
4039                     ; 824 							send_cmd = 0xAA;
4041  02a8 35aa0063      	mov	_send_cmd,#170
4042                     ; 825 							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4044  02ac 4baa          	push	#170
4045  02ae 4b06          	push	#6
4046  02b0 3b006c        	push	_ns_own_meshid_L
4047  02b3 b66d          	ld	a,_ns_own_meshid_H
4048  02b5 97            	ld	xl,a
4049  02b6 b669          	ld	a,_rev_message_id
4050  02b8 95            	ld	xh,a
4051  02b9 cd0000        	call	_send_header_payload_init
4053  02bc 5b03          	addw	sp,#3
4054                     ; 826 							UART1_Send_Data_Start();
4056  02be cd0000        	call	_UART1_Send_Data_Start
4058                     ; 827 							break;
4060  02c1 ac140514      	jpf	L3461
4061  02c5               L1651:
4062                     ; 832 			case 0xAA://SS回复ST的Device Info，Kick Out踢出
4062                     ; 833 				if (sicp_buf[7] == 0x04)
4064  02c5 b607          	ld	a,_sicp_buf+7
4065  02c7 a104          	cp	a,#4
4066  02c9 2703          	jreq	L231
4067  02cb cc0514        	jp	L3461
4068  02ce               L231:
4069                     ; 835 					kickout_flag = 1;
4071  02ce 721000c5      	bset	_UART1Flag4_,#0
4072  02d2 ac140514      	jpf	L3461
4073  02d6               L3651:
4074                     ; 844 			case 0xC0://BLE 网络模块重置指令
4074                     ; 845 				if (sicp_buf[7] == 0x02)
4077  02d6 b607          	ld	a,_sicp_buf+7
4078  02d8 a102          	cp	a,#2
4079  02da 2703          	jreq	L431
4080  02dc cc0514        	jp	L3461
4081  02df               L431:
4082                     ; 847 					net_reset_flag = 1;
4084  02df 721200c5      	bset	_UART1Flag4_,#1
4085  02e3 ac140514      	jpf	L3461
4086  02e7               L5651:
4087                     ; 850 			case 0x03://CMD-Data 
4087                     ; 851 				if (sicp_buf[7] == 0x01)//获取ST传感器信息
4089  02e7 b607          	ld	a,_sicp_buf+7
4090  02e9 a101          	cp	a,#1
4091  02eb 2629          	jrne	L5271
4092                     ; 853 					if ((sicp_buf[8] == 0x30) && (sicp_buf[9] == 0x32))
4094  02ed b608          	ld	a,_sicp_buf+8
4095  02ef a130          	cp	a,#48
4096  02f1 2623          	jrne	L5271
4098  02f3 b609          	ld	a,_sicp_buf+9
4099  02f5 a132          	cp	a,#50
4100  02f7 261d          	jrne	L5271
4101                     ; 855 						send_message_length = 9;
4103  02f9 35090064      	mov	_send_message_length,#9
4104                     ; 856 						send_cmd = 0x20;
4106  02fd 35200063      	mov	_send_cmd,#32
4107                     ; 857 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4109  0301 4b20          	push	#32
4110  0303 4b09          	push	#9
4111  0305 3b006c        	push	_ns_own_meshid_L
4112  0308 b66d          	ld	a,_ns_own_meshid_H
4113  030a 97            	ld	xl,a
4114  030b b669          	ld	a,_rev_message_id
4115  030d 95            	ld	xh,a
4116  030e cd0000        	call	_send_header_payload_init
4118  0311 5b03          	addw	sp,#3
4119                     ; 858 						UART1_Send_Data_Start();
4121  0313 cd0000        	call	_UART1_Send_Data_Start
4123  0316               L5271:
4124                     ; 861 				if (sicp_buf[7] == 0x02)//刷新ST传感器数据
4126  0316 b607          	ld	a,_sicp_buf+7
4127  0318 a102          	cp	a,#2
4128  031a 2621          	jrne	L1371
4129                     ; 863 					cmd_refresh_flag = 1;
4131  031c 721400c8      	bset	_UART1Flag1_,#2
4132                     ; 864 					send_message_length = 6;
4134  0320 35060064      	mov	_send_message_length,#6
4135                     ; 865 					send_cmd = 0xAA;
4137  0324 35aa0063      	mov	_send_cmd,#170
4138                     ; 866 					send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4140  0328 4baa          	push	#170
4141  032a 4b06          	push	#6
4142  032c 3b006c        	push	_ns_own_meshid_L
4143  032f b66d          	ld	a,_ns_own_meshid_H
4144  0331 97            	ld	xl,a
4145  0332 b669          	ld	a,_rev_message_id
4146  0334 95            	ld	xh,a
4147  0335 cd0000        	call	_send_header_payload_init
4149  0338 5b03          	addw	sp,#3
4150                     ; 867 					UART1_Send_Data_Start();
4152  033a cd0000        	call	_UART1_Send_Data_Start
4154  033d               L1371:
4155                     ; 869 				if (sicp_buf[7] == 0x03)//获取ST当前设备的状态(灯亮度、开关)
4157  033d b607          	ld	a,_sicp_buf+7
4158  033f a103          	cp	a,#3
4159  0341 2703          	jreq	L631
4160  0343 cc0514        	jp	L3461
4161  0346               L631:
4162                     ; 871 					cmd_status_flag = 1;
4164  0346 721600c8      	bset	_UART1Flag1_,#3
4165                     ; 873 					send_message_length = 10;
4167  034a 350a0064      	mov	_send_message_length,#10
4168                     ; 874 					send_cmd = 0x06;
4170  034e 35060063      	mov	_send_cmd,#6
4171                     ; 875 					send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4173  0352 4b06          	push	#6
4174  0354 4b0a          	push	#10
4175  0356 3b006c        	push	_ns_own_meshid_L
4176  0359 b66d          	ld	a,_ns_own_meshid_H
4177  035b 97            	ld	xl,a
4178  035c b669          	ld	a,_rev_message_id
4179  035e 95            	ld	xh,a
4180  035f cd0000        	call	_send_header_payload_init
4182  0362 5b03          	addw	sp,#3
4183                     ; 876 					UART1_Send_Data_Start();
4185  0364 cd0000        	call	_UART1_Send_Data_Start
4187  0367 ac140514      	jpf	L3461
4188  036b               L7651:
4189                     ; 879 			case 0x56://打开或关闭ST开关
4189                     ; 880 				action_ctrlpad_flag = 1;
4191  036b 721800c8      	bset	_UART1Flag1_,#4
4192                     ; 881 				st1.st_ctrl_address = sicp_buf[7];
4194  036f 450779        	mov	_st1+3,_sicp_buf+7
4195                     ; 882 				if((sicp_buf[7] & 0x01) == 0x01)
4197  0372 b607          	ld	a,_sicp_buf+7
4198  0374 a401          	and	a,#1
4199  0376 a101          	cp	a,#1
4200  0378 2604          	jrne	L5371
4201                     ; 883 					st_pad1_ctrl = 1;
4203  037a 721200c6      	bset	_UART1Flag3_,#1
4204  037e               L5371:
4205                     ; 884 				if((sicp_buf[7] & 0x02) == 0x02)
4207  037e b607          	ld	a,_sicp_buf+7
4208  0380 a402          	and	a,#2
4209  0382 a102          	cp	a,#2
4210  0384 2604          	jrne	L7371
4211                     ; 885 					st_pad2_ctrl = 1;
4213  0386 721400c6      	bset	_UART1Flag3_,#2
4214  038a               L7371:
4215                     ; 886 				if((sicp_buf[7] & 0x04) == 0x04)
4217  038a b607          	ld	a,_sicp_buf+7
4218  038c a404          	and	a,#4
4219  038e a104          	cp	a,#4
4220  0390 2604          	jrne	L1471
4221                     ; 887 					st_pad3_ctrl = 1;
4223  0392 721600c6      	bset	_UART1Flag3_,#3
4224  0396               L1471:
4225                     ; 888 				if((sicp_buf[7] & 0x08) == 0x08)
4227  0396 b607          	ld	a,_sicp_buf+7
4228  0398 a408          	and	a,#8
4229  039a a108          	cp	a,#8
4230  039c 2604          	jrne	L3471
4231                     ; 889 					st_led_ctrl = 1;
4233  039e 721000c6      	bset	_UART1Flag3_,#0
4234  03a2               L3471:
4235                     ; 890 				st1.st_ctrl_value  = sicp_buf[8];
4237  03a2 45087a        	mov	_st1+4,_sicp_buf+8
4238                     ; 891 				send_message_length = 10;
4240  03a5 350a0064      	mov	_send_message_length,#10
4241                     ; 892 				send_cmd = 0xAA;
4243  03a9 35aa0063      	mov	_send_cmd,#170
4244                     ; 893 				send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4246  03ad 4baa          	push	#170
4247  03af 4b0a          	push	#10
4248  03b1 3b006c        	push	_ns_own_meshid_L
4249  03b4 b66d          	ld	a,_ns_own_meshid_H
4250  03b6 97            	ld	xl,a
4251  03b7 b669          	ld	a,_rev_message_id
4252  03b9 95            	ld	xh,a
4253  03ba cd0000        	call	_send_header_payload_init
4255  03bd 5b03          	addw	sp,#3
4256                     ; 895 				UART1_Send_Data_Start();
4258  03bf cd0000        	call	_UART1_Send_Data_Start
4260                     ; 896 				break;
4262  03c2 ac140514      	jpf	L3461
4263  03c6               L1751:
4264                     ; 897 			case 0x09://LED控制
4264                     ; 898 				led_ctrl_flag = 1;
4266  03c6 721400c5      	bset	_UART1Flag4_,#2
4267                     ; 899 				switch(sicp_buf[7])
4269  03ca b607          	ld	a,_sicp_buf+7
4271                     ; 966 						break;
4272  03cc a01f          	sub	a,#31
4273  03ce 271d          	jreq	L3751
4274  03d0 a010          	sub	a,#16
4275  03d2 2756          	jreq	L5751
4276  03d4 a010          	sub	a,#16
4277  03d6 2603          	jrne	L041
4278  03d8 cc046d        	jp	L7751
4279  03db               L041:
4280  03db a010          	sub	a,#16
4281  03dd 2603          	jrne	L241
4282  03df cc04a8        	jp	L1061
4283  03e2               L241:
4284  03e2 a010          	sub	a,#16
4285  03e4 2603          	jrne	L441
4286  03e6 cc04cb        	jp	L3061
4287  03e9               L441:
4288  03e9 ac140514      	jpf	L3461
4289  03ed               L3751:
4290                     ; 901 					case 0x1F://循环模式
4290                     ; 902 						st1.st_led_mode = 0x1F;
4292  03ed 351f00b2      	mov	_st1+60,#31
4293                     ; 903 						st1.st_led_density = sicp_buf[8];
4295  03f1 4508b3        	mov	_st1+61,_sicp_buf+8
4296                     ; 904 						st1.st_led_speed = sicp_buf[9];
4298  03f4 4509b4        	mov	_st1+62,_sicp_buf+9
4299                     ; 905 						st1.st_led_color1_H = sicp_buf[10];
4301  03f7 450ab5        	mov	_st1+63,_sicp_buf+10
4302                     ; 906 						st1.st_led_color1_M = sicp_buf[11];
4304  03fa 450bb6        	mov	_st1+64,_sicp_buf+11
4305                     ; 907 						st1.st_led_color1_L = sicp_buf[12];
4307  03fd 450cb7        	mov	_st1+65,_sicp_buf+12
4308                     ; 908 						st1.st_led_color2_H = sicp_buf[13];
4310  0400 450db8        	mov	_st1+66,_sicp_buf+13
4311                     ; 909 						st1.st_led_color2_M = sicp_buf[14];
4313  0403 450eb9        	mov	_st1+67,_sicp_buf+14
4314                     ; 910 						st1.st_led_color2_L = sicp_buf[15];
4316  0406 450fba        	mov	_st1+68,_sicp_buf+15
4317                     ; 911 						send_message_length = 6;
4319  0409 35060064      	mov	_send_message_length,#6
4320                     ; 912 						send_cmd = 0xAA;
4322  040d 35aa0063      	mov	_send_cmd,#170
4323                     ; 913 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4325  0411 4baa          	push	#170
4326  0413 4b06          	push	#6
4327  0415 3b006c        	push	_ns_own_meshid_L
4328  0418 b66d          	ld	a,_ns_own_meshid_H
4329  041a 97            	ld	xl,a
4330  041b b669          	ld	a,_rev_message_id
4331  041d 95            	ld	xh,a
4332  041e cd0000        	call	_send_header_payload_init
4334  0421 5b03          	addw	sp,#3
4335                     ; 915 						UART1_Send_Data_Start();
4337  0423 cd0000        	call	_UART1_Send_Data_Start
4339                     ; 916 						break;
4341  0426 ac140514      	jpf	L3461
4342  042a               L5751:
4343                     ; 917 					case 0x2F://呼吸灯模式
4343                     ; 918 						st1.st_led_mode = 0x2F;
4345  042a 352f00b2      	mov	_st1+60,#47
4346                     ; 919 						st1.st_led_in		= sicp_buf[8];
4348  042e 4508bb        	mov	_st1+69,_sicp_buf+8
4349                     ; 920 						st1.st_led_duration = sicp_buf[9];
4351  0431 4509bc        	mov	_st1+70,_sicp_buf+9
4352                     ; 921 						st1.st_led_out	= sicp_buf[10];
4354  0434 450abd        	mov	_st1+71,_sicp_buf+10
4355                     ; 922 						st1.st_led_blank = sicp_buf[11];
4357  0437 450bbe        	mov	_st1+72,_sicp_buf+11
4358                     ; 923 						st1.st_led_color1_H = sicp_buf[12];
4360  043a 450cb5        	mov	_st1+63,_sicp_buf+12
4361                     ; 924 						st1.st_led_color1_M = sicp_buf[13];
4363  043d 450db6        	mov	_st1+64,_sicp_buf+13
4364                     ; 925 						st1.st_led_color1_L = sicp_buf[14];
4366  0440 450eb7        	mov	_st1+65,_sicp_buf+14
4367                     ; 926 						st1.st_led_color2_H = sicp_buf[15];
4369  0443 450fb8        	mov	_st1+66,_sicp_buf+15
4370                     ; 927 						st1.st_led_color2_M = sicp_buf[16];
4372  0446 4510b9        	mov	_st1+67,_sicp_buf+16
4373                     ; 928 						st1.st_led_color2_L = sicp_buf[17];
4375  0449 4511ba        	mov	_st1+68,_sicp_buf+17
4376                     ; 929 						send_message_length = 6;
4378  044c 35060064      	mov	_send_message_length,#6
4379                     ; 930 						send_cmd = 0xAA;
4381  0450 35aa0063      	mov	_send_cmd,#170
4382                     ; 931 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4384  0454 4baa          	push	#170
4385  0456 4b06          	push	#6
4386  0458 3b006c        	push	_ns_own_meshid_L
4387  045b b66d          	ld	a,_ns_own_meshid_H
4388  045d 97            	ld	xl,a
4389  045e b669          	ld	a,_rev_message_id
4390  0460 95            	ld	xh,a
4391  0461 cd0000        	call	_send_header_payload_init
4393  0464 5b03          	addw	sp,#3
4394                     ; 933 						UART1_Send_Data_Start();
4396  0466 cd0000        	call	_UART1_Send_Data_Start
4398                     ; 934 						break;
4400  0469 ac140514      	jpf	L3461
4401  046d               L7751:
4402                     ; 935 					case 0x3F://颜色变化模式，从一个主颜色渐变黑色再变到另一个主颜色
4402                     ; 936 						st1.st_led_mode = 0x3F;
4404  046d 353f00b2      	mov	_st1+60,#63
4405                     ; 937 						st1.st_led_in		= sicp_buf[8];
4407  0471 4508bb        	mov	_st1+69,_sicp_buf+8
4408                     ; 938 						st1.st_led_duration = sicp_buf[9];
4410  0474 4509bc        	mov	_st1+70,_sicp_buf+9
4411                     ; 939 						st1.st_led_color1_H = sicp_buf[10];
4413  0477 450ab5        	mov	_st1+63,_sicp_buf+10
4414                     ; 940 						st1.st_led_color1_M = sicp_buf[11];
4416  047a 450bb6        	mov	_st1+64,_sicp_buf+11
4417                     ; 941 						st1.st_led_color1_L = sicp_buf[12];
4419  047d 450cb7        	mov	_st1+65,_sicp_buf+12
4420                     ; 942 						st1.st_led_color2_H = sicp_buf[13];
4422  0480 450db8        	mov	_st1+66,_sicp_buf+13
4423                     ; 943 						st1.st_led_color2_M = sicp_buf[14];
4425  0483 450eb9        	mov	_st1+67,_sicp_buf+14
4426                     ; 944 						st1.st_led_color2_L = sicp_buf[15];
4428  0486 450fba        	mov	_st1+68,_sicp_buf+15
4429                     ; 945 						send_message_length = 6;
4431  0489 35060064      	mov	_send_message_length,#6
4432                     ; 946 						send_cmd = 0xAA;
4434  048d 35aa0063      	mov	_send_cmd,#170
4435                     ; 947 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4437  0491 4baa          	push	#170
4438  0493 4b06          	push	#6
4439  0495 3b006c        	push	_ns_own_meshid_L
4440  0498 b66d          	ld	a,_ns_own_meshid_H
4441  049a 97            	ld	xl,a
4442  049b b669          	ld	a,_rev_message_id
4443  049d 95            	ld	xh,a
4444  049e cd0000        	call	_send_header_payload_init
4446  04a1 5b03          	addw	sp,#3
4447                     ; 949 						UART1_Send_Data_Start();
4449  04a3 cd0000        	call	_UART1_Send_Data_Start
4451                     ; 950 						break;
4453  04a6 206c          	jra	L3461
4454  04a8               L1061:
4455                     ; 951 					case 0x4F://指示灯模式，把LED的显示权交给设备
4455                     ; 952 						st1.st_led_mode = 0x4F;
4457  04a8 354f00b2      	mov	_st1+60,#79
4458                     ; 953 						send_message_length = 6;
4460  04ac 35060064      	mov	_send_message_length,#6
4461                     ; 954 						send_cmd = 0xAA;
4463  04b0 35aa0063      	mov	_send_cmd,#170
4464                     ; 955 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4466  04b4 4baa          	push	#170
4467  04b6 4b06          	push	#6
4468  04b8 3b006c        	push	_ns_own_meshid_L
4469  04bb b66d          	ld	a,_ns_own_meshid_H
4470  04bd 97            	ld	xl,a
4471  04be b669          	ld	a,_rev_message_id
4472  04c0 95            	ld	xh,a
4473  04c1 cd0000        	call	_send_header_payload_init
4475  04c4 5b03          	addw	sp,#3
4476                     ; 957 						UART1_Send_Data_Start();
4478  04c6 cd0000        	call	_UART1_Send_Data_Start
4480                     ; 958 						break;
4482  04c9 2049          	jra	L3461
4483  04cb               L3061:
4484                     ; 959 					case 0x5F://关闭模式。关闭所有LED显示 
4484                     ; 960 						st1.st_led_mode = 0x5F;
4486  04cb 355f00b2      	mov	_st1+60,#95
4487                     ; 961 						send_message_length = 6;
4489  04cf 35060064      	mov	_send_message_length,#6
4490                     ; 962 						send_cmd = 0xAA;
4492  04d3 35aa0063      	mov	_send_cmd,#170
4493                     ; 963 						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4495  04d7 4baa          	push	#170
4496  04d9 4b06          	push	#6
4497  04db 3b006c        	push	_ns_own_meshid_L
4498  04de b66d          	ld	a,_ns_own_meshid_H
4499  04e0 97            	ld	xl,a
4500  04e1 b669          	ld	a,_rev_message_id
4501  04e3 95            	ld	xh,a
4502  04e4 cd0000        	call	_send_header_payload_init
4504  04e7 5b03          	addw	sp,#3
4505                     ; 965 						UART1_Send_Data_Start();
4507  04e9 cd0000        	call	_UART1_Send_Data_Start
4509                     ; 966 						break;
4511  04ec 2026          	jra	L3461
4512  04ee               L7471:
4513                     ; 968 				break;
4515  04ee 2024          	jra	L3461
4516  04f0               L5061:
4517                     ; 969 			case 0x05://用于加载预装的报警信息，若此方法激活，则忽略所有 LED方法
4517                     ; 970 				load_alert_flag = 1;
4519  04f0 721600c5      	bset	_UART1Flag4_,#3
4520                     ; 971 				st1.st_load_alert = sicp_buf[7];
4522  04f4 4507bf        	mov	_st1+73,_sicp_buf+7
4523                     ; 972 				send_message_length = 6;
4525  04f7 35060064      	mov	_send_message_length,#6
4526                     ; 973 				send_cmd = 0xAA;
4528  04fb 35aa0063      	mov	_send_cmd,#170
4529                     ; 974 				send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4531  04ff 4baa          	push	#170
4532  0501 4b06          	push	#6
4533  0503 3b006c        	push	_ns_own_meshid_L
4534  0506 b66d          	ld	a,_ns_own_meshid_H
4535  0508 97            	ld	xl,a
4536  0509 b669          	ld	a,_rev_message_id
4537  050b 95            	ld	xh,a
4538  050c cd0000        	call	_send_header_payload_init
4540  050f 5b03          	addw	sp,#3
4541                     ; 976 				UART1_Send_Data_Start();
4543  0511 cd0000        	call	_UART1_Send_Data_Start
4545                     ; 977 				break;
4547  0514               L7061:
4548                     ; 978 			default:
4548                     ; 979 				break;
4550  0514               L3461:
4551                     ; 982 		return TRUE;
4553  0514 a601          	ld	a,#1
4556  0516 85            	popw	x
4557  0517 81            	ret
4558  0518               L7361:
4559                     ; 984 	else if (ble_ctrl_frame)
4561  0518 b6c8          	ld	a,_UART1Flag1_
4562  051a a540          	bcp	a,#64
4563  051c 2603          	jrne	L641
4564  051e cc05c0        	jp	L3571
4565  0521               L641:
4566                     ; 986 		ble_ctrl_frame = 0;
4568  0521 721d00c8      	bres	_UART1Flag1_,#6
4569                     ; 987 		switch(sicp_buf[4])
4571  0525 b604          	ld	a,_sicp_buf+4
4572  0527 a101          	cp	a,#1
4573  0529 2615          	jrne	L7571
4576  052b               L1161:
4577                     ; 989 			case 0x01://网络状态帧
4577                     ; 990 				ns_signal = sicp_buf[5];
4579  052b 450570        	mov	_ns_signal,_sicp_buf+5
4580                     ; 991 				ns_status = sicp_buf[6];
4582  052e 45066f        	mov	_ns_status,_sicp_buf+6
4583                     ; 992 				ns_phonenum = sicp_buf[7];
4585  0531 45076e        	mov	_ns_phonenum,_sicp_buf+7
4586                     ; 993 				ns_own_meshid_H = sicp_buf[8];
4588  0534 45086d        	mov	_ns_own_meshid_H,_sicp_buf+8
4589                     ; 994 				ns_own_meshid_L = sicp_buf[9];
4591  0537 45096c        	mov	_ns_own_meshid_L,_sicp_buf+9
4592                     ; 995 				ns_host_meshid_H = sicp_buf[10];
4594  053a 450a6b        	mov	_ns_host_meshid_H,_sicp_buf+10
4595                     ; 996 				ns_host_meshid_L = sicp_buf[11];
4597  053d 450b6a        	mov	_ns_host_meshid_L,_sicp_buf+11
4598                     ; 997 				break;
4600  0540               L3161:
4601                     ; 998 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
4601                     ; 999 				break;
4603  0540               L5161:
4604                     ; 1000 			case 0x03://重置芯片和网络，退出mesh连接
4604                     ; 1001 				break;
4606  0540               L7571:
4607                     ; 1003 		generate_messageid = 0x86;//for debug
4609  0540 35860060      	mov	_generate_messageid,#134
4610                     ; 1005 		device_info_message_id = generate_messageid;
4612  0544 35860075      	mov	_device_info_message_id,#134
4613                     ; 1007 		if ((((u16)(ns_own_meshid_H<<8) + (u16)ns_own_meshid_L) > 0)
4613                     ; 1008 			&& (((u16)(ns_host_meshid_H<<8) + (u16)ns_host_meshid_L) > 0))
4615  0548 b66c          	ld	a,_ns_own_meshid_L
4616  054a 5f            	clrw	x
4617  054b 97            	ld	xl,a
4618  054c 1f01          	ldw	(OFST-1,sp),x
4619  054e b66d          	ld	a,_ns_own_meshid_H
4620  0550 5f            	clrw	x
4621  0551 97            	ld	xl,a
4622  0552 4f            	clr	a
4623  0553 02            	rlwa	x,a
4624  0554 72fb01        	addw	x,(OFST-1,sp)
4625  0557 273c          	jreq	L1671
4627  0559 b66a          	ld	a,_ns_host_meshid_L
4628  055b 5f            	clrw	x
4629  055c 97            	ld	xl,a
4630  055d 1f01          	ldw	(OFST-1,sp),x
4631  055f b66b          	ld	a,_ns_host_meshid_H
4632  0561 5f            	clrw	x
4633  0562 97            	ld	xl,a
4634  0563 4f            	clr	a
4635  0564 02            	rlwa	x,a
4636  0565 72fb01        	addw	x,(OFST-1,sp)
4637  0568 272b          	jreq	L1671
4638                     ; 1010 			if (!receipt_device_info1)
4640  056a b6c4          	ld	a,_UART1Flag5_
4641  056c a501          	bcp	a,#1
4642  056e 264c          	jrne	L5671
4643                     ; 1014 				send_message_length = 12;
4645  0570 350c0064      	mov	_send_message_length,#12
4646                     ; 1015 				send_cmd = 0xB4;
4648  0574 35b40063      	mov	_send_cmd,#180
4649                     ; 1016 				send_header_payload_init(device_info_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4651  0578 4bb4          	push	#180
4652  057a 4b0c          	push	#12
4653  057c 3b006c        	push	_ns_own_meshid_L
4654  057f b66d          	ld	a,_ns_own_meshid_H
4655  0581 97            	ld	xl,a
4656  0582 a686          	ld	a,#134
4657  0584 95            	ld	xh,a
4658  0585 cd0000        	call	_send_header_payload_init
4660  0588 5b03          	addw	sp,#3
4661                     ; 1018 				UART1_Send_Data_Start();
4663  058a cd0000        	call	_UART1_Send_Data_Start
4665                     ; 1019 				delay(10);
4667  058d ae000a        	ldw	x,#10
4668  0590 cd0000        	call	_delay
4670  0593 2027          	jra	L5671
4671  0595               L1671:
4672                     ; 1024 			receipt_device_info2 = 1;
4674  0595 721000c4      	bset	_UART1Flag5_,#0
4675                     ; 1025 			send_message_length = 6;
4677  0599 35060064      	mov	_send_message_length,#6
4678                     ; 1026 			send_cmd = 0xAA;
4680  059d 35aa0063      	mov	_send_cmd,#170
4681                     ; 1027 			send_header_payload_init(device_info_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
4683  05a1 4baa          	push	#170
4684  05a3 4b06          	push	#6
4685  05a5 3b006c        	push	_ns_own_meshid_L
4686  05a8 b66d          	ld	a,_ns_own_meshid_H
4687  05aa 97            	ld	xl,a
4688  05ab a686          	ld	a,#134
4689  05ad 95            	ld	xh,a
4690  05ae cd0000        	call	_send_header_payload_init
4692  05b1 5b03          	addw	sp,#3
4693                     ; 1028 			UART1_Send_Data_Start();
4695  05b3 cd0000        	call	_UART1_Send_Data_Start
4697                     ; 1029 			delay(10);
4699  05b6 ae000a        	ldw	x,#10
4700  05b9 cd0000        	call	_delay
4702  05bc               L5671:
4703                     ; 1031 		return TRUE;
4705  05bc a601          	ld	a,#1
4707  05be 2001          	jra	L601
4708  05c0               L3571:
4709                     ; 1035 		return FALSE;
4711  05c0 4f            	clr	a
4713  05c1               L601:
4715  05c1 85            	popw	x
4716  05c2 81            	ret
4766                     ; 1044 void reve_analyze_reply(void)
4766                     ; 1045 {
4767                     .text:	section	.text,new
4768  0000               _reve_analyze_reply:
4770  0000 89            	pushw	x
4771       00000002      OFST:	set	2
4774                     ; 1046 	if (rev_success)
4776  0001 b6c8          	ld	a,_UART1Flag1_
4777  0003 a501          	bcp	a,#1
4778  0005 271b          	jreq	L1002
4779                     ; 1048 		rev_success = 0;
4781  0007 721100c8      	bres	_UART1Flag1_,#0
4782                     ; 1049 		rev_header_anaylze(&rev_message_id,&rev_meshid_H,&rev_meshid_L,&rev_message_length);
4784  000b ae0067        	ldw	x,#_rev_message_length
4785  000e 89            	pushw	x
4786  000f ae0065        	ldw	x,#_rev_meshid_L
4787  0012 89            	pushw	x
4788  0013 ae0066        	ldw	x,#_rev_meshid_H
4789  0016 89            	pushw	x
4790  0017 ae0069        	ldw	x,#_rev_message_id
4791  001a cd0000        	call	_rev_header_anaylze
4793  001d 5b06          	addw	sp,#6
4794                     ; 1050 		rev_payload_anaylze();
4796  001f cd0000        	call	_rev_payload_anaylze
4798  0022               L1002:
4799                     ; 1058 	if (receipt_send_failed)
4801  0022 b6c4          	ld	a,_UART1Flag5_
4802  0024 a510          	bcp	a,#16
4803  0026 273a          	jreq	L3002
4804                     ; 1060 		receipt_send_failed = 0;
4806  0028 721900c4      	bres	_UART1Flag5_,#4
4807                     ; 1061 		st_pad1_ctrl = st_pad_temp._flag_bit.bit0;
4809                     	btst		_st_pad_temp,#0
4810  0031 901300c6      	bccm	_UART1Flag3_,#1
4811                     ; 1062 		st_pad2_ctrl = st_pad_temp._flag_bit.bit1;
4813                     	btst		_st_pad_temp,#1
4814  003a 901500c6      	bccm	_UART1Flag3_,#2
4815                     ; 1063 		st_pad3_ctrl = st_pad_temp._flag_bit.bit2;
4817                     	btst		_st_pad_temp,#2
4818  0043 901700c6      	bccm	_UART1Flag3_,#3
4819                     ; 1064 		st_pad1_confirm = st_pad_temp._flag_bit.bit3;
4821                     	btst		_st_pad_temp,#3
4822  004c 901900c6      	bccm	_UART1Flag3_,#4
4823                     ; 1065 		st_pad2_confirm = st_pad_temp._flag_bit.bit4;
4825                     	btst		_st_pad_temp,#4
4826  0055 901b00c6      	bccm	_UART1Flag3_,#5
4827                     ; 1066 		st_pad3_confirm = st_pad_temp._flag_bit.bit5;
4829                     	btst		_st_pad_temp,#5
4830  005e 901d00c6      	bccm	_UART1Flag3_,#6
4831  0062               L3002:
4832                     ; 1069 	if (receipt_send_failed)
4834  0062 b6c4          	ld	a,_UART1Flag5_
4835  0064 a510          	bcp	a,#16
4836  0066 270a          	jreq	L5002
4837                     ; 1071 		receipt_send_failed = 0;
4839  0068 721900c4      	bres	_UART1Flag5_,#4
4840                     ; 1072 		st1.st_ges_H = st1_st_ges_H_temp;
4842  006c 45c276        	mov	_st1,_st1_st_ges_H_temp
4843                     ; 1073 		st1.st_ges_L = st1_st_ges_L_temp;
4845  006f 45c177        	mov	_st1+1,_st1_st_ges_L_temp
4846  0072               L5002:
4847                     ; 1076 	if (st_pad1_ctrl | st_pad2_ctrl | st_pad3_ctrl)
4849  0072 4f            	clr	a
4850                     	btst	_UART1Flag3_,#3
4851  0078 49            	rlc	a
4852  0079 6b02          	ld	(OFST+0,sp),a
4853  007b 4f            	clr	a
4854                     	btst	_UART1Flag3_,#2
4855  0081 49            	rlc	a
4856  0082 6b01          	ld	(OFST-1,sp),a
4857  0084 b6c6          	ld	a,_UART1Flag3_
4858  0086 44            	srl	a
4859  0087 a401          	and	a,#1
4860  0089 1a01          	or	a,(OFST-1,sp)
4861  008b 1a02          	or	a,(OFST+0,sp)
4862  008d 2603          	jrne	L251
4863  008f cc0232        	jp	L7002
4864  0092               L251:
4865                     ; 1079 		if(st_pad1_confirm | st_pad2_confirm | st_pad3_confirm)
4867  0092 4f            	clr	a
4868                     	btst	_UART1Flag3_,#6
4869  0098 49            	rlc	a
4870  0099 6b02          	ld	(OFST+0,sp),a
4871  009b 4f            	clr	a
4872                     	btst	_UART1Flag3_,#5
4873  00a1 49            	rlc	a
4874  00a2 6b01          	ld	(OFST-1,sp),a
4875  00a4 4f            	clr	a
4876                     	btst	_UART1Flag3_,#4
4877  00aa 49            	rlc	a
4878  00ab 1a01          	or	a,(OFST-1,sp)
4879  00ad 1a02          	or	a,(OFST+0,sp)
4880  00af 2603          	jrne	L451
4881  00b1 cc01c9        	jp	L1102
4882  00b4               L451:
4883                     ; 1081 			st_pad_temp._flag_bit.bit0 = st_pad1_ctrl;
4885                     	btst		_UART1Flag3_,#1
4886  00b9 901100c0      	bccm	_st_pad_temp,#0
4887                     ; 1082 			st_pad_temp._flag_bit.bit1 = st_pad2_ctrl;
4889                     	btst		_UART1Flag3_,#2
4890  00c2 901300c0      	bccm	_st_pad_temp,#1
4891                     ; 1083 			st_pad_temp._flag_bit.bit2 = st_pad3_ctrl;
4893                     	btst		_UART1Flag3_,#3
4894  00cb 901500c0      	bccm	_st_pad_temp,#2
4895                     ; 1084 			st_pad_temp._flag_bit.bit3 = st_pad1_confirm;
4897                     	btst		_UART1Flag3_,#4
4898  00d4 901700c0      	bccm	_st_pad_temp,#3
4899                     ; 1085 			st_pad_temp._flag_bit.bit4 = st_pad2_confirm;
4901                     	btst		_UART1Flag3_,#5
4902  00dd 901900c0      	bccm	_st_pad_temp,#4
4903                     ; 1086 			st_pad_temp._flag_bit.bit5 = st_pad3_confirm;
4905                     	btst		_UART1Flag3_,#6
4906  00e6 901b00c0      	bccm	_st_pad_temp,#5
4907                     ; 1088 				generate_messageid = random(TIM4->CNTR);
4909  00ea c65346        	ld	a,21318
4910  00ed cd0000        	call	_random
4912  00f0 b760          	ld	_generate_messageid,a
4913                     ; 1089 				send_message_length = 8;
4915  00f2 35080064      	mov	_send_message_length,#8
4916                     ; 1090 				send_cmd = 0x51;
4918  00f6 35510063      	mov	_send_cmd,#81
4919                     ; 1091 				if (st_pad1_confirm)//预设置按键1被触发
4921  00fa b6c6          	ld	a,_UART1Flag3_
4922  00fc a510          	bcp	a,#16
4923  00fe 2718          	jreq	L3102
4924                     ; 1093 					st_pad1_ctrl = 0;
4926  0100 721300c6      	bres	_UART1Flag3_,#1
4927                     ; 1094 					send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
4929  0104 4b51          	push	#81
4930  0106 4b08          	push	#8
4931  0108 3b0084        	push	_st1+14
4932  010b b683          	ld	a,_st1+13
4933  010d 97            	ld	xl,a
4934  010e b674          	ld	a,_gesture_noset_message_id
4935  0110 95            	ld	xh,a
4936  0111 cd0000        	call	_send_header_payload_init
4938  0114 5b03          	addw	sp,#3
4940  0116 203a          	jra	L5102
4941  0118               L3102:
4942                     ; 1096 				else if (st_pad2_confirm)
4944  0118 b6c6          	ld	a,_UART1Flag3_
4945  011a a520          	bcp	a,#32
4946  011c 2718          	jreq	L7102
4947                     ; 1098 					st_pad2_ctrl = 0;
4949  011e 721500c6      	bres	_UART1Flag3_,#2
4950                     ; 1099 					send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
4952  0122 4b51          	push	#81
4953  0124 4b08          	push	#8
4954  0126 3b0089        	push	_st1+19
4955  0129 b688          	ld	a,_st1+18
4956  012b 97            	ld	xl,a
4957  012c b674          	ld	a,_gesture_noset_message_id
4958  012e 95            	ld	xh,a
4959  012f cd0000        	call	_send_header_payload_init
4961  0132 5b03          	addw	sp,#3
4963  0134 201c          	jra	L5102
4964  0136               L7102:
4965                     ; 1101 				else if (st_pad3_confirm)
4967  0136 b6c6          	ld	a,_UART1Flag3_
4968  0138 a540          	bcp	a,#64
4969  013a 2716          	jreq	L5102
4970                     ; 1103 					st_pad3_ctrl = 0;
4972  013c 721700c6      	bres	_UART1Flag3_,#3
4973                     ; 1104 					send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
4975  0140 4b51          	push	#81
4976  0142 4b08          	push	#8
4977  0144 3b008e        	push	_st1+24
4978  0147 b68d          	ld	a,_st1+23
4979  0149 97            	ld	xl,a
4980  014a b674          	ld	a,_gesture_noset_message_id
4981  014c 95            	ld	xh,a
4982  014d cd0000        	call	_send_header_payload_init
4984  0150 5b03          	addw	sp,#3
4985  0152               L5102:
4986                     ; 1107 				UART1_Send_Data_Start();
4988  0152 cd0000        	call	_UART1_Send_Data_Start
4990                     ; 1108 				delay(10);
4992  0155 ae000a        	ldw	x,#10
4993  0158 cd0000        	call	_delay
4995                     ; 1111 				clear_send_buf();
4997  015b cd0000        	call	_clear_send_buf
4999                     ; 1112 				send_message_length = 14;
5001  015e 350e0064      	mov	_send_message_length,#14
5002                     ; 1113 				send_cmd = 0x08;
5004  0162 35080063      	mov	_send_cmd,#8
5005                     ; 1114 				if (st_pad1_confirm)//预设置按键1被触发
5007  0166 b6c6          	ld	a,_UART1Flag3_
5008  0168 a510          	bcp	a,#16
5009  016a 2718          	jreq	L5202
5010                     ; 1116 					st_pad1_confirm = 0;
5012  016c 721900c6      	bres	_UART1Flag3_,#4
5013                     ; 1117 					send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
5015  0170 4b08          	push	#8
5016  0172 4b0e          	push	#14
5017  0174 3b0084        	push	_st1+14
5018  0177 b683          	ld	a,_st1+13
5019  0179 97            	ld	xl,a
5020  017a b674          	ld	a,_gesture_noset_message_id
5021  017c 95            	ld	xh,a
5022  017d cd0000        	call	_send_header_payload_init
5024  0180 5b03          	addw	sp,#3
5026  0182 203a          	jra	L7202
5027  0184               L5202:
5028                     ; 1119 				else if (st_pad2_confirm)
5030  0184 b6c6          	ld	a,_UART1Flag3_
5031  0186 a520          	bcp	a,#32
5032  0188 2718          	jreq	L1302
5033                     ; 1121 					st_pad2_confirm = 0;
5035  018a 721b00c6      	bres	_UART1Flag3_,#5
5036                     ; 1122 					send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
5038  018e 4b08          	push	#8
5039  0190 4b0e          	push	#14
5040  0192 3b0089        	push	_st1+19
5041  0195 b688          	ld	a,_st1+18
5042  0197 97            	ld	xl,a
5043  0198 b674          	ld	a,_gesture_noset_message_id
5044  019a 95            	ld	xh,a
5045  019b cd0000        	call	_send_header_payload_init
5047  019e 5b03          	addw	sp,#3
5049  01a0 201c          	jra	L7202
5050  01a2               L1302:
5051                     ; 1124 				else if(st_pad3_confirm)
5053  01a2 b6c6          	ld	a,_UART1Flag3_
5054  01a4 a540          	bcp	a,#64
5055  01a6 2716          	jreq	L7202
5056                     ; 1126 					st_pad2_confirm = 0;
5058  01a8 721b00c6      	bres	_UART1Flag3_,#5
5059                     ; 1127 					send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
5061  01ac 4b08          	push	#8
5062  01ae 4b0e          	push	#14
5063  01b0 3b008e        	push	_st1+24
5064  01b3 b68d          	ld	a,_st1+23
5065  01b5 97            	ld	xl,a
5066  01b6 b674          	ld	a,_gesture_noset_message_id
5067  01b8 95            	ld	xh,a
5068  01b9 cd0000        	call	_send_header_payload_init
5070  01bc 5b03          	addw	sp,#3
5071  01be               L7202:
5072                     ; 1129 				UART1_Send_Data_Start();
5074  01be cd0000        	call	_UART1_Send_Data_Start
5076                     ; 1130 				delay(10);
5078  01c1 ae000a        	ldw	x,#10
5079  01c4 cd0000        	call	_delay
5082  01c7 2069          	jra	L7002
5083  01c9               L1102:
5084                     ; 1134 			send_message_length = 7;
5086  01c9 35070064      	mov	_send_message_length,#7
5087                     ; 1135 			send_cmd = 0x35;
5089  01cd 35350063      	mov	_send_cmd,#53
5090                     ; 1136 			if (st_pad1_ctrl)
5092  01d1 b6c6          	ld	a,_UART1Flag3_
5093  01d3 a502          	bcp	a,#2
5094  01d5 2718          	jreq	L1402
5095                     ; 1138 				st_pad1_ctrl = 0;
5097  01d7 721300c6      	bres	_UART1Flag3_,#1
5098                     ; 1139 				send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
5100  01db 4b35          	push	#53
5101  01dd 4b07          	push	#7
5102  01df 3b0084        	push	_st1+14
5103  01e2 b683          	ld	a,_st1+13
5104  01e4 97            	ld	xl,a
5105  01e5 b674          	ld	a,_gesture_noset_message_id
5106  01e7 95            	ld	xh,a
5107  01e8 cd0000        	call	_send_header_payload_init
5109  01eb 5b03          	addw	sp,#3
5111  01ed 203a          	jra	L3402
5112  01ef               L1402:
5113                     ; 1141 			else if (st_pad2_ctrl)
5115  01ef b6c6          	ld	a,_UART1Flag3_
5116  01f1 a504          	bcp	a,#4
5117  01f3 2718          	jreq	L5402
5118                     ; 1143 				st_pad2_ctrl = 0;
5120  01f5 721500c6      	bres	_UART1Flag3_,#2
5121                     ; 1144 				send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
5123  01f9 4b35          	push	#53
5124  01fb 4b07          	push	#7
5125  01fd 3b0089        	push	_st1+19
5126  0200 b688          	ld	a,_st1+18
5127  0202 97            	ld	xl,a
5128  0203 b674          	ld	a,_gesture_noset_message_id
5129  0205 95            	ld	xh,a
5130  0206 cd0000        	call	_send_header_payload_init
5132  0209 5b03          	addw	sp,#3
5134  020b 201c          	jra	L3402
5135  020d               L5402:
5136                     ; 1146 			else if (st_pad3_ctrl)
5138  020d b6c6          	ld	a,_UART1Flag3_
5139  020f a508          	bcp	a,#8
5140  0211 2716          	jreq	L3402
5141                     ; 1148 				st_pad3_ctrl = 0;
5143  0213 721700c6      	bres	_UART1Flag3_,#3
5144                     ; 1149 				send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
5146  0217 4b35          	push	#53
5147  0219 4b07          	push	#7
5148  021b 3b008e        	push	_st1+24
5149  021e b68d          	ld	a,_st1+23
5150  0220 97            	ld	xl,a
5151  0221 b674          	ld	a,_gesture_noset_message_id
5152  0223 95            	ld	xh,a
5153  0224 cd0000        	call	_send_header_payload_init
5155  0227 5b03          	addw	sp,#3
5156  0229               L3402:
5157                     ; 1151 			UART1_Send_Data_Start();
5159  0229 cd0000        	call	_UART1_Send_Data_Start
5161                     ; 1152 			delay(10);
5163  022c ae000a        	ldw	x,#10
5164  022f cd0000        	call	_delay
5166  0232               L7002:
5167                     ; 1159 	if ((st1.st_ges_H != 0x00) && (st1.st_ges_L != 0x00))
5169  0232 3d76          	tnz	_st1
5170  0234 2603          	jrne	L651
5171  0236 cc0398        	jp	L3502
5172  0239               L651:
5174  0239 3d77          	tnz	_st1+1
5175  023b 2603          	jrne	L061
5176  023d cc0398        	jp	L3502
5177  0240               L061:
5178                     ; 1161 		st1_st_ges_H_temp = st1.st_ges_H;
5180  0240 4576c2        	mov	_st1_st_ges_H_temp,_st1
5181                     ; 1162 		st1_st_ges_L_temp = st1.st_ges_L;
5183  0243 4577c1        	mov	_st1_st_ges_L_temp,_st1+1
5184                     ; 1163 		st1.st_ges_H = 0x00;
5186  0246 3f76          	clr	_st1
5187                     ; 1164 		st1.st_ges_L = 0x00;
5189  0248 3f77          	clr	_st1+1
5190                     ; 1166 		if((!gest1_confirm) && (!gest2_confirm) && (!gest3_confirm) && (!gest4_confirm))
5192  024a b6c7          	ld	a,_UART1Flag2_
5193  024c a504          	bcp	a,#4
5194  024e 2648          	jrne	L5502
5196  0250 b6c7          	ld	a,_UART1Flag2_
5197  0252 a508          	bcp	a,#8
5198  0254 2642          	jrne	L5502
5200  0256 b6c7          	ld	a,_UART1Flag2_
5201  0258 a510          	bcp	a,#16
5202  025a 263c          	jrne	L5502
5204  025c b6c7          	ld	a,_UART1Flag2_
5205  025e a520          	bcp	a,#32
5206  0260 2636          	jrne	L5502
5207                     ; 1168 			receipt_gesture1 = 0;//清除接收到该指令回执
5209  0262 721300c4      	bres	_UART1Flag5_,#1
5210                     ; 1169 			generate_messageid = random(TIM4->CNTR);
5212  0266 c65346        	ld	a,21318
5213  0269 cd0000        	call	_random
5215  026c b760          	ld	_generate_messageid,a
5216                     ; 1170 			gesture_noset_message_id = generate_messageid;
5218  026e 456074        	mov	_gesture_noset_message_id,_generate_messageid
5219                     ; 1172 			send_message_length = 8;
5221  0271 35080064      	mov	_send_message_length,#8
5222                     ; 1173 			send_cmd = 0x29;
5224  0275 35290063      	mov	_send_cmd,#41
5225                     ; 1174 			send_header_payload_init(gesture_noset_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
5227  0279 4b29          	push	#41
5228  027b 4b08          	push	#8
5229  027d 3b006c        	push	_ns_own_meshid_L
5230  0280 b66d          	ld	a,_ns_own_meshid_H
5231  0282 97            	ld	xl,a
5232  0283 b674          	ld	a,_gesture_noset_message_id
5233  0285 95            	ld	xh,a
5234  0286 cd0000        	call	_send_header_payload_init
5236  0289 5b03          	addw	sp,#3
5237                     ; 1176 			UART1_Send_Data_Start();
5239  028b cd0000        	call	_UART1_Send_Data_Start
5241                     ; 1177 			delay(10);
5243  028e ae000a        	ldw	x,#10
5244  0291 cd0000        	call	_delay
5247  0294 ac980398      	jpf	L3502
5248  0298               L5502:
5249                     ; 1181 			receipt_gesture2 = 0;//清除接收到该指令回执
5251  0298 721500c4      	bres	_UART1Flag5_,#2
5252                     ; 1182 			generate_messageid = random(TIM4->CNTR);
5254  029c c65346        	ld	a,21318
5255  029f cd0000        	call	_random
5257  02a2 b760          	ld	_generate_messageid,a
5258                     ; 1183 			gesture_set_message_id = generate_messageid;
5260  02a4 456073        	mov	_gesture_set_message_id,_generate_messageid
5261                     ; 1184 			send_message_length = 8;
5263  02a7 35080064      	mov	_send_message_length,#8
5264                     ; 1185 			send_cmd = 0x51;
5266  02ab 35510063      	mov	_send_cmd,#81
5267                     ; 1186 			if (gest1_confirm)
5269  02af b6c7          	ld	a,_UART1Flag2_
5270  02b1 a504          	bcp	a,#4
5271  02b3 2714          	jreq	L1602
5272                     ; 1188 				send_header_payload_init(gesture_set_message_id,st1.st_ges1_ctrl_meshid_H,st1.st_ges1_ctrl_meshid_L,send_message_length,send_cmd);
5274  02b5 4b51          	push	#81
5275  02b7 4b08          	push	#8
5276  02b9 3b0095        	push	_st1+31
5277  02bc b694          	ld	a,_st1+30
5278  02be 97            	ld	xl,a
5279  02bf b673          	ld	a,_gesture_set_message_id
5280  02c1 95            	ld	xh,a
5281  02c2 cd0000        	call	_send_header_payload_init
5283  02c5 5b03          	addw	sp,#3
5285  02c7 204c          	jra	L3602
5286  02c9               L1602:
5287                     ; 1190 			else if (gest2_confirm)
5289  02c9 b6c7          	ld	a,_UART1Flag2_
5290  02cb a508          	bcp	a,#8
5291  02cd 2714          	jreq	L5602
5292                     ; 1192 				send_header_payload_init(generate_messageid,st1.st_ges2_ctrl_meshid_H,st1.st_ges2_ctrl_meshid_L,send_message_length,send_cmd);
5294  02cf 4b51          	push	#81
5295  02d1 4b08          	push	#8
5296  02d3 3b009a        	push	_st1+36
5297  02d6 b699          	ld	a,_st1+35
5298  02d8 97            	ld	xl,a
5299  02d9 b660          	ld	a,_generate_messageid
5300  02db 95            	ld	xh,a
5301  02dc cd0000        	call	_send_header_payload_init
5303  02df 5b03          	addw	sp,#3
5305  02e1 2032          	jra	L3602
5306  02e3               L5602:
5307                     ; 1194 			else if (gest3_confirm)
5309  02e3 b6c7          	ld	a,_UART1Flag2_
5310  02e5 a510          	bcp	a,#16
5311  02e7 2714          	jreq	L1702
5312                     ; 1196 				send_header_payload_init(generate_messageid,st1.st_ges3_ctrl_meshid_H,st1.st_ges3_ctrl_meshid_L,send_message_length,send_cmd);
5314  02e9 4b51          	push	#81
5315  02eb 4b08          	push	#8
5316  02ed 3b009f        	push	_st1+41
5317  02f0 b69e          	ld	a,_st1+40
5318  02f2 97            	ld	xl,a
5319  02f3 b660          	ld	a,_generate_messageid
5320  02f5 95            	ld	xh,a
5321  02f6 cd0000        	call	_send_header_payload_init
5323  02f9 5b03          	addw	sp,#3
5325  02fb 2018          	jra	L3602
5326  02fd               L1702:
5327                     ; 1198 			else if (gest4_confirm)
5329  02fd b6c7          	ld	a,_UART1Flag2_
5330  02ff a520          	bcp	a,#32
5331  0301 2712          	jreq	L3602
5332                     ; 1200 				send_header_payload_init(generate_messageid,st1.st_ges4_ctrl_meshid_H,st1.st_ges4_ctrl_meshid_L,send_message_length,send_cmd);
5334  0303 4b51          	push	#81
5335  0305 4b08          	push	#8
5336  0307 3b00a4        	push	_st1+46
5337  030a b6a3          	ld	a,_st1+45
5338  030c 97            	ld	xl,a
5339  030d b660          	ld	a,_generate_messageid
5340  030f 95            	ld	xh,a
5341  0310 cd0000        	call	_send_header_payload_init
5343  0313 5b03          	addw	sp,#3
5344  0315               L3602:
5345                     ; 1203 			UART1_Send_Data_Start();
5347  0315 cd0000        	call	_UART1_Send_Data_Start
5349                     ; 1205 			delay(10);
5351  0318 ae000a        	ldw	x,#10
5352  031b cd0000        	call	_delay
5354                     ; 1206 			clear_send_buf();
5356  031e cd0000        	call	_clear_send_buf
5358                     ; 1207 			send_message_length = 14;
5360  0321 350e0064      	mov	_send_message_length,#14
5361                     ; 1208 			send_cmd = 0x08;
5363  0325 35080063      	mov	_send_cmd,#8
5364                     ; 1209 			if (gest1_confirm)
5366  0329 b6c7          	ld	a,_UART1Flag2_
5367  032b a504          	bcp	a,#4
5368  032d 2714          	jreq	L7702
5369                     ; 1211 				send_header_payload_init(gesture_set_message_id,st1.st_ges1_ctrl_meshid_H,st1.st_ges1_ctrl_meshid_L,send_message_length,send_cmd);
5371  032f 4b08          	push	#8
5372  0331 4b0e          	push	#14
5373  0333 3b0095        	push	_st1+31
5374  0336 b694          	ld	a,_st1+30
5375  0338 97            	ld	xl,a
5376  0339 b673          	ld	a,_gesture_set_message_id
5377  033b 95            	ld	xh,a
5378  033c cd0000        	call	_send_header_payload_init
5380  033f 5b03          	addw	sp,#3
5382  0341 204c          	jra	L1012
5383  0343               L7702:
5384                     ; 1213 			else if (gest2_confirm)
5386  0343 b6c7          	ld	a,_UART1Flag2_
5387  0345 a508          	bcp	a,#8
5388  0347 2714          	jreq	L3012
5389                     ; 1215 				send_header_payload_init(generate_messageid,st1.st_ges2_ctrl_meshid_H,st1.st_ges2_ctrl_meshid_L,send_message_length,send_cmd);
5391  0349 4b08          	push	#8
5392  034b 4b0e          	push	#14
5393  034d 3b009a        	push	_st1+36
5394  0350 b699          	ld	a,_st1+35
5395  0352 97            	ld	xl,a
5396  0353 b660          	ld	a,_generate_messageid
5397  0355 95            	ld	xh,a
5398  0356 cd0000        	call	_send_header_payload_init
5400  0359 5b03          	addw	sp,#3
5402  035b 2032          	jra	L1012
5403  035d               L3012:
5404                     ; 1217 			else if (gest3_confirm)
5406  035d b6c7          	ld	a,_UART1Flag2_
5407  035f a510          	bcp	a,#16
5408  0361 2714          	jreq	L7012
5409                     ; 1219 				send_header_payload_init(generate_messageid,st1.st_ges3_ctrl_meshid_H,st1.st_ges3_ctrl_meshid_L,send_message_length,send_cmd);
5411  0363 4b08          	push	#8
5412  0365 4b0e          	push	#14
5413  0367 3b009f        	push	_st1+41
5414  036a b69e          	ld	a,_st1+40
5415  036c 97            	ld	xl,a
5416  036d b660          	ld	a,_generate_messageid
5417  036f 95            	ld	xh,a
5418  0370 cd0000        	call	_send_header_payload_init
5420  0373 5b03          	addw	sp,#3
5422  0375 2018          	jra	L1012
5423  0377               L7012:
5424                     ; 1221 			else if (gest4_confirm)
5426  0377 b6c7          	ld	a,_UART1Flag2_
5427  0379 a520          	bcp	a,#32
5428  037b 2712          	jreq	L1012
5429                     ; 1223 				send_header_payload_init(generate_messageid,st1.st_ges4_ctrl_meshid_H,st1.st_ges4_ctrl_meshid_L,send_message_length,send_cmd);
5431  037d 4b08          	push	#8
5432  037f 4b0e          	push	#14
5433  0381 3b00a4        	push	_st1+46
5434  0384 b6a3          	ld	a,_st1+45
5435  0386 97            	ld	xl,a
5436  0387 b660          	ld	a,_generate_messageid
5437  0389 95            	ld	xh,a
5438  038a cd0000        	call	_send_header_payload_init
5440  038d 5b03          	addw	sp,#3
5441  038f               L1012:
5442                     ; 1226 			UART1_Send_Data_Start();
5444  038f cd0000        	call	_UART1_Send_Data_Start
5446                     ; 1227 			delay(10);
5448  0392 ae000a        	ldw	x,#10
5449  0395 cd0000        	call	_delay
5451  0398               L3502:
5452                     ; 1233 	if ((st1.st_device_status & 0xFF) < 0xFF)//ST有故障,有0无1
5454  0398 9c            	rvf
5455  0399 b678          	ld	a,_st1+2
5456  039b 5f            	clrw	x
5457  039c 97            	ld	xl,a
5458  039d a300ff        	cpw	x,#255
5459  03a0 2e36          	jrsge	L5112
5460                     ; 1235 		send_fault_count++;
5462  03a2 be5c          	ldw	x,_send_fault_count
5463  03a4 1c0001        	addw	x,#1
5464  03a7 bf5c          	ldw	_send_fault_count,x
5465                     ; 1236 		if (send_fault_count >= 500)
5467  03a9 be5c          	ldw	x,_send_fault_count
5468  03ab a301f4        	cpw	x,#500
5469  03ae 2528          	jrult	L5112
5470                     ; 1238 			send_fault_count = 0;
5472  03b0 5f            	clrw	x
5473  03b1 bf5c          	ldw	_send_fault_count,x
5474                     ; 1239 			generate_messageid = random(TIM4->CNTR);
5476  03b3 c65346        	ld	a,21318
5477  03b6 cd0000        	call	_random
5479  03b9 b760          	ld	_generate_messageid,a
5480                     ; 1240 			send_message_length = 7;
5482  03bb 35070064      	mov	_send_message_length,#7
5483                     ; 1241 			send_cmd = 0x0A;
5485  03bf 350a0063      	mov	_send_cmd,#10
5486                     ; 1242 			send_header_payload_init(generate_messageid,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
5488  03c3 4b0a          	push	#10
5489  03c5 4b07          	push	#7
5490  03c7 3b006c        	push	_ns_own_meshid_L
5491  03ca b66d          	ld	a,_ns_own_meshid_H
5492  03cc 97            	ld	xl,a
5493  03cd b660          	ld	a,_generate_messageid
5494  03cf 95            	ld	xh,a
5495  03d0 cd0000        	call	_send_header_payload_init
5497  03d3 5b03          	addw	sp,#3
5498                     ; 1244 			UART1_Send_Data_Start();
5500  03d5 cd0000        	call	_UART1_Send_Data_Start
5502  03d8               L5112:
5503                     ; 1247 }
5506  03d8 85            	popw	x
5507  03d9 81            	ret
5520                     	xref	_rand
5521                     	xdef	_gest_confirm
5522                     	xdef	_pad_confirm
5523                     	xdef	_rev_payload_anaylze
5524                     	xdef	_rev_header_anaylze
5525                     	xdef	_send_header_payload_init
5526                     	xdef	_reve_analyze_reply
5527                     	xdef	_random
5528                     	xdef	_rev_deal
5529                     	xdef	_Check_Sum
5530                     	xdef	_clear_send_buf
5531                     	xdef	_clear_sicp_buf
5532                     	xdef	_UART1_Send_Data_Start
5533                     	xdef	_UART1_Send_Data_Init
5534                     	xdef	_UART1_RX_ISR
5535                     	xdef	_UART1_TX_ISR
5536                     	xdef	_Init_UART1
5537                     	xdef	_delay
5538                     	switch	.ubsct
5539  0000               _sicp_buf:
5540  0000 000000000000  	ds.b	30
5541                     	xdef	_sicp_buf
5542  001e               _rev_buf:
5543  001e 000000000000  	ds.b	30
5544                     	xdef	_rev_buf
5545  003c               _send_buf:
5546  003c 000000000000  	ds.b	30
5547                     	xdef	_send_buf
5548  005a               _send_failed_count:
5549  005a 0000          	ds.b	2
5550                     	xdef	_send_failed_count
5551  005c               _send_fault_count:
5552  005c 0000          	ds.b	2
5553                     	xdef	_send_fault_count
5554  005e               _rev_count:
5555  005e 00            	ds.b	1
5556                     	xdef	_rev_count
5557  005f               _send_count:
5558  005f 00            	ds.b	1
5559                     	xdef	_send_count
5560  0060               _generate_messageid:
5561  0060 00            	ds.b	1
5562                     	xdef	_generate_messageid
5563  0061               _send_meshid_L:
5564  0061 00            	ds.b	1
5565                     	xdef	_send_meshid_L
5566  0062               _send_meshid_H:
5567  0062 00            	ds.b	1
5568                     	xdef	_send_meshid_H
5569  0063               _send_cmd:
5570  0063 00            	ds.b	1
5571                     	xdef	_send_cmd
5572  0064               _send_message_length:
5573  0064 00            	ds.b	1
5574                     	xdef	_send_message_length
5575  0065               _rev_meshid_L:
5576  0065 00            	ds.b	1
5577                     	xdef	_rev_meshid_L
5578  0066               _rev_meshid_H:
5579  0066 00            	ds.b	1
5580                     	xdef	_rev_meshid_H
5581  0067               _rev_message_length:
5582  0067 00            	ds.b	1
5583                     	xdef	_rev_message_length
5584  0068               _rev_module_id:
5585  0068 00            	ds.b	1
5586                     	xdef	_rev_module_id
5587  0069               _rev_message_id:
5588  0069 00            	ds.b	1
5589                     	xdef	_rev_message_id
5590  006a               _ns_host_meshid_L:
5591  006a 00            	ds.b	1
5592                     	xdef	_ns_host_meshid_L
5593  006b               _ns_host_meshid_H:
5594  006b 00            	ds.b	1
5595                     	xdef	_ns_host_meshid_H
5596  006c               _ns_own_meshid_L:
5597  006c 00            	ds.b	1
5598                     	xdef	_ns_own_meshid_L
5599  006d               _ns_own_meshid_H:
5600  006d 00            	ds.b	1
5601                     	xdef	_ns_own_meshid_H
5602  006e               _ns_phonenum:
5603  006e 00            	ds.b	1
5604                     	xdef	_ns_phonenum
5605  006f               _ns_status:
5606  006f 00            	ds.b	1
5607                     	xdef	_ns_status
5608  0070               _ns_signal:
5609  0070 00            	ds.b	1
5610                     	xdef	_ns_signal
5611  0071               _action_notify_message_id:
5612  0071 00            	ds.b	1
5613                     	xdef	_action_notify_message_id
5614  0072               _pad_noset_message_id:
5615  0072 00            	ds.b	1
5616                     	xdef	_pad_noset_message_id
5617  0073               _gesture_set_message_id:
5618  0073 00            	ds.b	1
5619                     	xdef	_gesture_set_message_id
5620  0074               _gesture_noset_message_id:
5621  0074 00            	ds.b	1
5622                     	xdef	_gesture_noset_message_id
5623  0075               _device_info_message_id:
5624  0075 00            	ds.b	1
5625                     	xdef	_device_info_message_id
5626  0076               _st1:
5627  0076 000000000000  	ds.b	74
5628                     	xdef	_st1
5629  00c0               _st_pad_temp:
5630  00c0 00            	ds.b	1
5631                     	xdef	_st_pad_temp
5632  00c1               _st1_st_ges_L_temp:
5633  00c1 00            	ds.b	1
5634                     	xdef	_st1_st_ges_L_temp
5635  00c2               _st1_st_ges_H_temp:
5636  00c2 00            	ds.b	1
5637                     	xdef	_st1_st_ges_H_temp
5638  00c3               _UART1Flag6_:
5639  00c3 00            	ds.b	1
5640                     	xdef	_UART1Flag6_
5641  00c4               _UART1Flag5_:
5642  00c4 00            	ds.b	1
5643                     	xdef	_UART1Flag5_
5644  00c5               _UART1Flag4_:
5645  00c5 00            	ds.b	1
5646                     	xdef	_UART1Flag4_
5647  00c6               _UART1Flag3_:
5648  00c6 00            	ds.b	1
5649                     	xdef	_UART1Flag3_
5650  00c7               _UART1Flag2_:
5651  00c7 00            	ds.b	1
5652                     	xdef	_UART1Flag2_
5653  00c8               _UART1Flag1_:
5654  00c8 00            	ds.b	1
5655                     	xdef	_UART1Flag1_
5656                     	xref	_UART1_ITConfig
5657                     	xref	_UART1_Cmd
5658                     	xref	_UART1_Init
5659                     	xref	_UART1_DeInit
5660                     	xref.b	c_x
5661                     	xref.b	c_y
5681                     	xref	c_idiv
5682                     	end
