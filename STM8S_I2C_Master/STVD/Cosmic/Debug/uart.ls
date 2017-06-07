   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 807                     ; 24 void mymemcpy(void *des,void *src,u32 n)  
 807                     ; 25 {  
 809                     .text:	section	.text,new
 810  0000               _mymemcpy:
 812  0000 89            	pushw	x
 813  0001 5204          	subw	sp,#4
 814       00000004      OFST:	set	4
 817                     ; 26   u8 *xdes=des;
 819  0003 1f01          	ldw	(OFST-3,sp),x
 820                     ; 27 	u8 *xsrc=src; 
 822  0005 1e09          	ldw	x,(OFST+5,sp)
 823  0007 1f03          	ldw	(OFST-1,sp),x
 825  0009 2016          	jra	L554
 826  000b               L154:
 827                     ; 28   while(n--)*xdes++=*xsrc++;  
 829  000b 1e03          	ldw	x,(OFST-1,sp)
 830  000d 1c0001        	addw	x,#1
 831  0010 1f03          	ldw	(OFST-1,sp),x
 832  0012 1d0001        	subw	x,#1
 833  0015 f6            	ld	a,(x)
 834  0016 1e01          	ldw	x,(OFST-3,sp)
 835  0018 1c0001        	addw	x,#1
 836  001b 1f01          	ldw	(OFST-3,sp),x
 837  001d 1d0001        	subw	x,#1
 838  0020 f7            	ld	(x),a
 839  0021               L554:
 842  0021 96            	ldw	x,sp
 843  0022 1c000b        	addw	x,#OFST+7
 844  0025 cd0000        	call	c_ltor
 846  0028 96            	ldw	x,sp
 847  0029 1c000b        	addw	x,#OFST+7
 848  002c a601          	ld	a,#1
 849  002e cd0000        	call	c_lgsbc
 851  0031 cd0000        	call	c_lrzmp
 853  0034 26d5          	jrne	L154
 854                     ; 29 }  
 857  0036 5b06          	addw	sp,#6
 858  0038 81            	ret
 904                     ; 34 void delay(u16 Count)
 904                     ; 35 {
 905                     .text:	section	.text,new
 906  0000               _delay:
 908  0000 89            	pushw	x
 909  0001 89            	pushw	x
 910       00000002      OFST:	set	2
 913  0002 2014          	jra	L305
 914  0004               L105:
 915                     ; 39     for(i=0;i<100;i++)
 917  0004 0f01          	clr	(OFST-1,sp)
 918  0006               L705:
 919                     ; 40     for(j=0;j<50;j++);
 921  0006 0f02          	clr	(OFST+0,sp)
 922  0008               L515:
 926  0008 0c02          	inc	(OFST+0,sp)
 929  000a 7b02          	ld	a,(OFST+0,sp)
 930  000c a132          	cp	a,#50
 931  000e 25f8          	jrult	L515
 932                     ; 39     for(i=0;i<100;i++)
 934  0010 0c01          	inc	(OFST-1,sp)
 937  0012 7b01          	ld	a,(OFST-1,sp)
 938  0014 a164          	cp	a,#100
 939  0016 25ee          	jrult	L705
 940  0018               L305:
 941                     ; 37   while (Count--)//Count形参控制延时次数
 943  0018 1e03          	ldw	x,(OFST+1,sp)
 944  001a 1d0001        	subw	x,#1
 945  001d 1f03          	ldw	(OFST+1,sp),x
 946  001f 1c0001        	addw	x,#1
 947  0022 a30000        	cpw	x,#0
 948  0025 26dd          	jrne	L105
 949                     ; 42 }
 952  0027 5b04          	addw	sp,#4
 953  0029 81            	ret
1000                     ; 50 u8 random(u8 xxx)  
1000                     ; 51 {  
1001                     .text:	section	.text,new
1002  0000               _random:
1004  0000 88            	push	a
1005  0001 89            	pushw	x
1006       00000002      OFST:	set	2
1009                     ; 53   for(iii=0;iii<xxx;iii++)  
1011  0002 0f02          	clr	(OFST+0,sp)
1013  0004 2011          	jra	L745
1014  0006               L345:
1015                     ; 55     value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
1017  0006 cd0000        	call	_rand
1019  0009 90ae00ff      	ldw	y,#255
1020  000d cd0000        	call	c_idiv
1022  0010 51            	exgw	x,y
1023  0011 9f            	ld	a,xl
1024  0012 4c            	inc	a
1025  0013 6b01          	ld	(OFST-1,sp),a
1026                     ; 53   for(iii=0;iii<xxx;iii++)  
1028  0015 0c02          	inc	(OFST+0,sp)
1029  0017               L745:
1032  0017 7b02          	ld	a,(OFST+0,sp)
1033  0019 1103          	cp	a,(OFST+1,sp)
1034  001b 25e9          	jrult	L345
1035                     ; 57   return value;  
1037  001d 7b01          	ld	a,(OFST-1,sp)
1040  001f 5b03          	addw	sp,#3
1041  0021 81            	ret
1068                     ; 66 void Init_uart2(void)
1068                     ; 67 {
1069                     .text:	section	.text,new
1070  0000               _Init_uart2:
1074                     ; 68 	UART2_DeInit();
1076  0000 cd0000        	call	_UART2_DeInit
1078                     ; 70 	UART2_Init((u32)57600,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,	UART2_MODE_TXRX_ENABLE);
1080  0003 4b0c          	push	#12
1081  0005 4b80          	push	#128
1082  0007 4b00          	push	#0
1083  0009 4b00          	push	#0
1084  000b 4b00          	push	#0
1085  000d aee100        	ldw	x,#57600
1086  0010 89            	pushw	x
1087  0011 ae0000        	ldw	x,#0
1088  0014 89            	pushw	x
1089  0015 cd0000        	call	_UART2_Init
1091  0018 5b09          	addw	sp,#9
1092                     ; 71 	UART2_ITConfig(UART2_IT_TC,ENABLE);//发送完成中断
1094  001a 4b01          	push	#1
1095  001c ae0266        	ldw	x,#614
1096  001f cd0000        	call	_UART2_ITConfig
1098  0022 84            	pop	a
1099                     ; 72 	UART2_ITConfig(UART2_IT_RXNE_OR,ENABLE);//接收非空中断
1101  0023 4b01          	push	#1
1102  0025 ae0205        	ldw	x,#517
1103  0028 cd0000        	call	_UART2_ITConfig
1105  002b 84            	pop	a
1106                     ; 73 	UART2_Cmd(ENABLE);//启用uart1接口
1108  002c a601          	ld	a,#1
1109  002e cd0000        	call	_UART2_Cmd
1111                     ; 74 }
1114  0031 81            	ret
1159                     ; 83 void Uart2_Send(u8 *buf,u16 len)
1159                     ; 84 {
1160                     .text:	section	.text,new
1161  0000               _Uart2_Send:
1163  0000 89            	pushw	x
1164       00000000      OFST:	set	0
1167                     ; 85 	if(len >= Uart2_Send_Len)	len = Uart2_Send_Len;
1169  0001 1e05          	ldw	x,(OFST+5,sp)
1170  0003 a30028        	cpw	x,#40
1171  0006 2505          	jrult	L306
1174  0008 ae0028        	ldw	x,#40
1175  000b 1f05          	ldw	(OFST+5,sp),x
1176  000d               L306:
1177                     ; 87 	Uart2_Send_Length = len;
1179  000d 7b06          	ld	a,(OFST+6,sp)
1180  000f c70059        	ld	_Uart2_Send_Length,a
1181                     ; 88 	Uart2_Send_Cnt = 1;
1183  0012 35010058      	mov	_Uart2_Send_Cnt,#1
1184                     ; 89 	UART2->DR = UART2_Send_Buf[0];
1186  0016 55005a5241    	mov	21057,_UART2_Send_Buf
1187                     ; 91 }
1190  001b 85            	popw	x
1191  001c 81            	ret
1218                     ; 98 @interrupt void UART2_TX_ISR(void)
1218                     ; 99 {
1219                     .text:	section	.text,new
1220  0000               _UART2_TX_ISR:
1225                     ; 103 	UART2->SR &= ~0x40;//清除发送完成标志位
1227  0000 721d5240      	bres	21056,#6
1228                     ; 105 	if (Uart2_Send_Cnt < Uart2_Send_Length)
1230  0004 c60058        	ld	a,_Uart2_Send_Cnt
1231  0007 c10059        	cp	a,_Uart2_Send_Length
1232  000a 2411          	jruge	L516
1233                     ; 107 		UART2->DR = UART2_Send_Buf[Uart2_Send_Cnt];
1235  000c c60058        	ld	a,_Uart2_Send_Cnt
1236  000f 5f            	clrw	x
1237  0010 97            	ld	xl,a
1238  0011 d6005a        	ld	a,(_UART2_Send_Buf,x)
1239  0014 c75241        	ld	21057,a
1240                     ; 108 		Uart2_Send_Cnt++;
1242  0017 725c0058      	inc	_Uart2_Send_Cnt
1244  001b 2008          	jra	L716
1245  001d               L516:
1246                     ; 112 		Uart2_Send_Done = 1;
1248  001d 35010057      	mov	_Uart2_Send_Done,#1
1249                     ; 113 		Uart2_Send_Cnt = 0;
1251  0021 725f0058      	clr	_Uart2_Send_Cnt
1252  0025               L716:
1253                     ; 115 }
1256  0025 80            	iret
1280                     ; 123 @interrupt void UART2_RX_ISR(void)
1280                     ; 124 {
1281                     .text:	section	.text,new
1282  0000               _UART2_RX_ISR:
1285  0000 3b0002        	push	c_x+2
1286  0003 be00          	ldw	x,c_x
1287  0005 89            	pushw	x
1288  0006 3b0002        	push	c_y+2
1289  0009 be00          	ldw	x,c_y
1290  000b 89            	pushw	x
1293                     ; 125 	rev_deal();
1295  000c cd0000        	call	_rev_deal
1297                     ; 126 }
1300  000f 85            	popw	x
1301  0010 bf00          	ldw	c_y,x
1302  0012 320002        	pop	c_y+2
1303  0015 85            	popw	x
1304  0016 bf00          	ldw	c_x,x
1305  0018 320002        	pop	c_x+2
1306  001b 80            	iret
1362                     ; 134 u8 Check_Sum(u8 *buf,u8 length)
1362                     ; 135 {
1363                     .text:	section	.text,new
1364  0000               _Check_Sum:
1366  0000 89            	pushw	x
1367  0001 89            	pushw	x
1368       00000002      OFST:	set	2
1371                     ; 137 	u8 result = *buf++;
1373  0002 1e03          	ldw	x,(OFST+1,sp)
1374  0004 1c0001        	addw	x,#1
1375  0007 1f03          	ldw	(OFST+1,sp),x
1376  0009 1d0001        	subw	x,#1
1377  000c f6            	ld	a,(x)
1378  000d 6b01          	ld	(OFST-1,sp),a
1379                     ; 138 	for(i = 1;i < length;i++)
1381  000f a601          	ld	a,#1
1382  0011 6b02          	ld	(OFST+0,sp),a
1384  0013 2011          	jra	L166
1385  0015               L556:
1386                     ; 140 		result ^= *buf++;
1388  0015 1e03          	ldw	x,(OFST+1,sp)
1389  0017 1c0001        	addw	x,#1
1390  001a 1f03          	ldw	(OFST+1,sp),x
1391  001c 1d0001        	subw	x,#1
1392  001f 7b01          	ld	a,(OFST-1,sp)
1393  0021 f8            	xor	a,	(x)
1394  0022 6b01          	ld	(OFST-1,sp),a
1395                     ; 138 	for(i = 1;i < length;i++)
1397  0024 0c02          	inc	(OFST+0,sp)
1398  0026               L166:
1401  0026 7b02          	ld	a,(OFST+0,sp)
1402  0028 1107          	cp	a,(OFST+5,sp)
1403  002a 25e9          	jrult	L556
1404                     ; 142 	return result;
1406  002c 7b01          	ld	a,(OFST-1,sp)
1409  002e 5b04          	addw	sp,#4
1410  0030 81            	ret
1468                     ; 150 void rev_deal(void)
1468                     ; 151 {
1469                     .text:	section	.text,new
1470  0000               _rev_deal:
1472  0000 89            	pushw	x
1473       00000002      OFST:	set	2
1476                     ; 154 	temp = (u8)UART2->DR;
1478  0001 c65241        	ld	a,21057
1479  0004 6b02          	ld	(OFST+0,sp),a
1480                     ; 155 	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
1482  0006 c6002e        	ld	a,_Uart2_Rec_Cnt
1483  0009 5f            	clrw	x
1484  000a 97            	ld	xl,a
1485  000b 7b02          	ld	a,(OFST+0,sp)
1486  000d d7002f        	ld	(_Uart2_Rece_Buf,x),a
1487                     ; 156 	Uart2_Rec_Cnt++;
1489  0010 725c002e      	inc	_Uart2_Rec_Cnt
1490                     ; 157 	switch(Uart2_Rec_Cnt)
1492  0014 c6002e        	ld	a,_Uart2_Rec_Cnt
1494                     ; 216 			break;
1495  0017 4a            	dec	a
1496  0018 2722          	jreq	L566
1497  001a 4a            	dec	a
1498  001b 2739          	jreq	L766
1499  001d 4a            	dec	a
1500  001e 2603          	jrne	L62
1501  0020 cc012c        	jp	L527
1502  0023               L62:
1503  0023 4a            	dec	a
1504  0024 2603          	jrne	L03
1505  0026 cc012c        	jp	L527
1506  0029               L03:
1507  0029 4a            	dec	a
1508  002a 2603          	jrne	L23
1509  002c cc012c        	jp	L527
1510  002f               L23:
1511  002f               L776:
1512                     ; 174 		default:
1512                     ; 175 			if (Uart2_Rec_Cnt > Uart2_Rec_Len)//防止接收错误后溢出
1514  002f c6002e        	ld	a,_Uart2_Rec_Cnt
1515  0032 a129          	cp	a,#41
1516  0034 2543          	jrult	L337
1517                     ; 177 				Uart2_Rec_Cnt = 0;
1519  0036 725f002e      	clr	_Uart2_Rec_Cnt
1520  003a 203d          	jra	L337
1521  003c               L566:
1522                     ; 159 		case 1:
1522                     ; 160 			if ((temp != 0xEE) && (temp != 0xDD))	Uart2_Rec_Cnt = 0;
1524  003c 7b02          	ld	a,(OFST+0,sp)
1525  003e a1ee          	cp	a,#238
1526  0040 2603          	jrne	L43
1527  0042 cc012c        	jp	L527
1528  0045               L43:
1530  0045 7b02          	ld	a,(OFST+0,sp)
1531  0047 a1dd          	cp	a,#221
1532  0049 2603          	jrne	L63
1533  004b cc012c        	jp	L527
1534  004e               L63:
1537  004e 725f002e      	clr	_Uart2_Rec_Cnt
1538  0052 ac2c012c      	jpf	L527
1539  0056               L766:
1540                     ; 162 		case 2:
1540                     ; 163 			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1542  0056 7b02          	ld	a,(OFST+0,sp)
1543  0058 a1ee          	cp	a,#238
1544  005a 2603          	jrne	L04
1545  005c cc012c        	jp	L527
1546  005f               L04:
1548  005f 7b02          	ld	a,(OFST+0,sp)
1549  0061 a1aa          	cp	a,#170
1550  0063 2603          	jrne	L24
1551  0065 cc012c        	jp	L527
1552  0068               L24:
1554  0068 7b02          	ld	a,(OFST+0,sp)
1555  006a a1dd          	cp	a,#221
1556  006c 2603          	jrne	L44
1557  006e cc012c        	jp	L527
1558  0071               L44:
1561  0071 725f002e      	clr	_Uart2_Rec_Cnt
1562  0075 ac2c012c      	jpf	L527
1563  0079               L337:
1564                     ; 179 			if ((Uart2_Rece_Buf[0] == 0xEE)&&((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA)))
1566  0079 c6002f        	ld	a,_Uart2_Rece_Buf
1567  007c a1ee          	cp	a,#238
1568  007e 2666          	jrne	L537
1570  0080 c60030        	ld	a,_Uart2_Rece_Buf+1
1571  0083 a1ee          	cp	a,#238
1572  0085 2707          	jreq	L737
1574  0087 c60030        	ld	a,_Uart2_Rece_Buf+1
1575  008a a1aa          	cp	a,#170
1576  008c 2658          	jrne	L537
1577  008e               L737:
1578                     ; 181 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2)//接收数据完成
1580  008e 9c            	rvf
1581  008f c6002e        	ld	a,_Uart2_Rec_Cnt
1582  0092 5f            	clrw	x
1583  0093 97            	ld	xl,a
1584  0094 c60034        	ld	a,_Uart2_Rece_Buf+5
1585  0097 905f          	clrw	y
1586  0099 9097          	ld	yl,a
1587  009b 905c          	incw	y
1588  009d 905c          	incw	y
1589  009f bf01          	ldw	c_x+1,x
1590  00a1 90b301        	cpw	y,c_x+1
1591  00a4 2ec8          	jrsge	L527
1592                     ; 183 					Uart2_Rec_Cnt = 0;
1594  00a6 725f002e      	clr	_Uart2_Rec_Cnt
1595                     ; 184 					check_sum = Check_Sum(Uart2_Rece_Buf,Uart2_Rece_Buf[5] + 2);
1597  00aa c60034        	ld	a,_Uart2_Rece_Buf+5
1598  00ad ab02          	add	a,#2
1599  00af 88            	push	a
1600  00b0 ae002f        	ldw	x,#_Uart2_Rece_Buf
1601  00b3 cd0000        	call	_Check_Sum
1603  00b6 5b01          	addw	sp,#1
1604  00b8 6b02          	ld	(OFST+0,sp),a
1605                     ; 186 					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2])//校验正确	
1607  00ba c60034        	ld	a,_Uart2_Rece_Buf+5
1608  00bd 5f            	clrw	x
1609  00be 97            	ld	xl,a
1610  00bf d60031        	ld	a,(_Uart2_Rece_Buf+2,x)
1611  00c2 1102          	cp	a,(OFST+0,sp)
1612  00c4 261a          	jrne	L347
1613                     ; 188 						rev_success = 1;
1615  00c6 721003d9      	bset	_UART1Flag1_,#0
1616                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1618  00ca 0f02          	clr	(OFST+0,sp)
1619  00cc               L547:
1620                     ; 191 							sicp_buf[i] = Uart2_Rece_Buf[i];
1622  00cc 7b02          	ld	a,(OFST+0,sp)
1623  00ce 5f            	clrw	x
1624  00cf 97            	ld	xl,a
1625  00d0 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1626  00d3 d70006        	ld	(_sicp_buf,x),a
1627                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1629  00d6 0c02          	inc	(OFST+0,sp)
1632  00d8 7b02          	ld	a,(OFST+0,sp)
1633  00da a128          	cp	a,#40
1634  00dc 25ee          	jrult	L547
1636  00de 204c          	jra	L527
1637  00e0               L347:
1638                     ; 196 						Uart2_Rec_Cnt = 0;
1640  00e0 725f002e      	clr	_Uart2_Rec_Cnt
1641  00e4 2046          	jra	L527
1642  00e6               L537:
1643                     ; 200 			else if((Uart2_Rece_Buf[0] == 0xDD)&&(Uart2_Rece_Buf[1] == 0xDD))
1645  00e6 c6002f        	ld	a,_Uart2_Rece_Buf
1646  00e9 a1dd          	cp	a,#221
1647  00eb 263b          	jrne	L757
1649  00ed c60030        	ld	a,_Uart2_Rece_Buf+1
1650  00f0 a1dd          	cp	a,#221
1651  00f2 2634          	jrne	L757
1652                     ; 202 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 1)//接收数据完成
1654  00f4 9c            	rvf
1655  00f5 c6002e        	ld	a,_Uart2_Rec_Cnt
1656  00f8 5f            	clrw	x
1657  00f9 97            	ld	xl,a
1658  00fa c60032        	ld	a,_Uart2_Rece_Buf+3
1659  00fd 905f          	clrw	y
1660  00ff 9097          	ld	yl,a
1661  0101 905c          	incw	y
1662  0103 bf01          	ldw	c_x+1,x
1663  0105 90b301        	cpw	y,c_x+1
1664  0108 2e22          	jrsge	L527
1665                     ; 204 					Uart2_Rec_Cnt = 0;
1667  010a 725f002e      	clr	_Uart2_Rec_Cnt
1668                     ; 205 					rev_success = 1;
1670  010e 721003d9      	bset	_UART1Flag1_,#0
1671                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1673  0112 0f02          	clr	(OFST+0,sp)
1674  0114               L367:
1675                     ; 208 						sicp_buf[i] = Uart2_Rece_Buf[i];
1677  0114 7b02          	ld	a,(OFST+0,sp)
1678  0116 5f            	clrw	x
1679  0117 97            	ld	xl,a
1680  0118 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1681  011b d70006        	ld	(_sicp_buf,x),a
1682                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1684  011e 0c02          	inc	(OFST+0,sp)
1687  0120 7b02          	ld	a,(OFST+0,sp)
1688  0122 a128          	cp	a,#40
1689  0124 25ee          	jrult	L367
1690  0126 2004          	jra	L527
1691  0128               L757:
1692                     ; 214 				Uart2_Rec_Cnt = 0;
1694  0128 725f002e      	clr	_Uart2_Rec_Cnt
1695  012c               L527:
1696                     ; 218 	if (UART2->SR & 0x20) //|| (UART2->SR & UART2_SR_OR))
1698  012c c65240        	ld	a,21056
1699  012f a520          	bcp	a,#32
1700  0131 2707          	jreq	L377
1701                     ; 220 		temp2 = UART2->DR;
1703  0133 7b01          	ld	a,(OFST-1,sp)
1704  0135 97            	ld	xl,a
1705  0136 c65241        	ld	a,21057
1706  0139 97            	ld	xl,a
1707  013a               L377:
1708                     ; 223 }
1711  013a 85            	popw	x
1712  013b 81            	ret
1746                     ; 225 void clear_uart_buf(void)
1746                     ; 226 {
1747                     .text:	section	.text,new
1748  0000               _clear_uart_buf:
1750  0000 88            	push	a
1751       00000001      OFST:	set	1
1754                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1756  0001 0f01          	clr	(OFST+0,sp)
1757  0003               L1101:
1758                     ; 230 		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
1760  0003 7b01          	ld	a,(OFST+0,sp)
1761  0005 5f            	clrw	x
1762  0006 97            	ld	xl,a
1763  0007 724f002f      	clr	(_Uart2_Rece_Buf,x)
1764  000b 7b01          	ld	a,(OFST+0,sp)
1765  000d 5f            	clrw	x
1766  000e 97            	ld	xl,a
1767  000f 724f0006      	clr	(_sicp_buf,x)
1768                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1770  0013 0c01          	inc	(OFST+0,sp)
1773  0015 7b01          	ld	a,(OFST+0,sp)
1774  0017 a128          	cp	a,#40
1775  0019 25e8          	jrult	L1101
1776                     ; 232 }
1779  001b 84            	pop	a
1780  001c 81            	ret
1913                     ; 235 void rev_anaylze(void)
1913                     ; 236 {
1914                     .text:	section	.text,new
1915  0000               _rev_anaylze:
1917  0000 523b          	subw	sp,#59
1918       0000003b      OFST:	set	59
1921                     ; 239 	if(rev_success){
1923  0002 c603d9        	ld	a,_UART1Flag1_
1924  0005 a501          	bcp	a,#1
1925  0007 2603          	jrne	L25
1926  0009 cc038c        	jp	L7011
1927  000c               L25:
1928                     ; 240 		rev_success = 0;
1930  000c 721103d9      	bres	_UART1Flag1_,#0
1931                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1933  0010 c60006        	ld	a,_sicp_buf
1934  0013 a1ee          	cp	a,#238
1935  0015 2614          	jrne	L1111
1937  0017 c60007        	ld	a,_sicp_buf+1
1938  001a a1ee          	cp	a,#238
1939  001c 2707          	jreq	L3111
1941  001e c60007        	ld	a,_sicp_buf+1
1942  0021 a1aa          	cp	a,#170
1943  0023 2606          	jrne	L1111
1944  0025               L3111:
1945                     ; 242 			ble_data_frame = 1;
1947  0025 721203d9      	bset	_UART1Flag1_,#1
1949  0029 2012          	jra	L5111
1950  002b               L1111:
1951                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1953  002b c60006        	ld	a,_sicp_buf
1954  002e a1dd          	cp	a,#221
1955  0030 260b          	jrne	L5111
1957  0032 c60007        	ld	a,_sicp_buf+1
1958  0035 a1dd          	cp	a,#221
1959  0037 2604          	jrne	L5111
1960                     ; 245 			ble_ctrl_frame = 1;
1962  0039 721403d9      	bset	_UART1Flag1_,#2
1963  003d               L5111:
1964                     ; 248 		if (ble_data_frame){
1966  003d c603d9        	ld	a,_UART1Flag1_
1967  0040 a502          	bcp	a,#2
1968  0042 2603          	jrne	L45
1969  0044 cc031c        	jp	L1211
1970  0047               L45:
1971                     ; 249 			ble_data_frame = 0;
1973  0047 721303d9      	bres	_UART1Flag1_,#1
1974                     ; 250 			rev_message_id = sicp_buf[2];
1976  004b 5500080088    	mov	_rev_message_id,_sicp_buf+2
1977                     ; 251 			rev_mesh_id_H	= sicp_buf[3];
1979  0050 5500090087    	mov	_rev_mesh_id_H,_sicp_buf+3
1980                     ; 252 			rev_mesh_id_L = sicp_buf[4];
1982  0055 55000a0086    	mov	_rev_mesh_id_L,_sicp_buf+4
1983                     ; 253 			switch(sicp_buf[6]){
1985  005a c6000c        	ld	a,_sicp_buf+6
1987                     ; 317 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
1987                     ; 318 				break;
1988  005d a003          	sub	a,#3
1989  005f 2725          	jreq	L7101
1990  0061 a04e          	sub	a,#78
1991  0063 2735          	jreq	L1201
1992  0065 4a            	dec	a
1993  0066 2732          	jreq	L1201
1994  0068 4a            	dec	a
1995  0069 272f          	jreq	L1201
1996  006b 4a            	dec	a
1997  006c 272c          	jreq	L1201
1998  006e 4a            	dec	a
1999  006f 2603cc00f4    	jreq	L3201
2000  0074 a002          	sub	a,#2
2001  0076 2603          	jrne	L65
2002  0078 cc013d        	jp	L5201
2003  007b               L65:
2004  007b a053          	sub	a,#83
2005  007d 2603          	jrne	L06
2006  007f cc023c        	jp	L7201
2007  0082               L06:
2008  0082 ac8c038c      	jpf	L7011
2009  0086               L7101:
2010                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2010                     ; 255 					if(sicp_buf[7] == 0x03){
2012  0086 c6000d        	ld	a,_sicp_buf+7
2013  0089 a103          	cp	a,#3
2014  008b 2703          	jreq	L26
2015  008d cc038c        	jp	L7011
2016  0090               L26:
2017                     ; 256 						rev_cmd_data(sicp_buf[8]);
2019  0090 c6000e        	ld	a,_sicp_buf+8
2020  0093 cd0000        	call	_rev_cmd_data
2022  0096 ac8c038c      	jpf	L7011
2023  009a               L1201:
2024                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2024                     ; 260 				case 0x52:
2024                     ; 261 				case 0x53:
2024                     ; 262 				case 0x54:
2024                     ; 263 					rev_mdid = (sicp_buf[7]&0xf0)>>4;
2026  009a c6000d        	ld	a,_sicp_buf+7
2027  009d a4f0          	and	a,#240
2028  009f 4e            	swap	a
2029  00a0 a40f          	and	a,#15
2030  00a2 c70085        	ld	_rev_mdid,a
2031                     ; 264 					rev_channel = (sicp_buf[7]&0x0f);
2033  00a5 c6000d        	ld	a,_sicp_buf+7
2034  00a8 a40f          	and	a,#15
2035  00aa c70084        	ld	_rev_channel,a
2036                     ; 265 					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2038  00ad 3b008b        	push	_ns_own_meshid_L
2039  00b0 3b008c        	push	_ns_own_meshid_H
2040  00b3 c60088        	ld	a,_rev_message_id
2041  00b6 97            	ld	xl,a
2042  00b7 a602          	ld	a,#2
2043  00b9 95            	ld	xh,a
2044  00ba cd0000        	call	_sicp_receipt_OK
2046  00bd 85            	popw	x
2047                     ; 267 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2049  00be 3b000f        	push	_sicp_buf+9
2050  00c1 3b000e        	push	_sicp_buf+8
2051  00c4 c6000d        	ld	a,_sicp_buf+7
2052  00c7 97            	ld	xl,a
2053  00c8 c6000c        	ld	a,_sicp_buf+6
2054  00cb 95            	ld	xh,a
2055  00cc cd0000        	call	_i2c_single_action_dimmer
2057  00cf 85            	popw	x
2058  00d0 6b04          	ld	(OFST-55,sp),a
2059                     ; 268 					if(ret == IIC_SUCCESS)	sicp_receipt_Done(0x05,rev_message_id,ns_own_meshid_H,ns_own_meshid_L,0x01,rev_mdid);
2061  00d2 0d04          	tnz	(OFST-55,sp)
2062  00d4 2703          	jreq	L46
2063  00d6 cc038c        	jp	L7011
2064  00d9               L46:
2067  00d9 3b0085        	push	_rev_mdid
2068  00dc 4b01          	push	#1
2069  00de 3b008b        	push	_ns_own_meshid_L
2070  00e1 3b008c        	push	_ns_own_meshid_H
2071  00e4 c60088        	ld	a,_rev_message_id
2072  00e7 97            	ld	xl,a
2073  00e8 a605          	ld	a,#5
2074  00ea 95            	ld	xh,a
2075  00eb cd0000        	call	_sicp_receipt_Done
2077  00ee 5b04          	addw	sp,#4
2078  00f0 ac8c038c      	jpf	L7011
2079  00f4               L3201:
2080                     ; 270 				case 0x55://打开或关闭开关
2080                     ; 271 					rev_mdid = (sicp_buf[7]&0xf0)>>4;
2082  00f4 c6000d        	ld	a,_sicp_buf+7
2083  00f7 a4f0          	and	a,#240
2084  00f9 4e            	swap	a
2085  00fa a40f          	and	a,#15
2086  00fc c70085        	ld	_rev_mdid,a
2087                     ; 272 					rev_channel = (sicp_buf[7]&0x0f);
2089  00ff c6000d        	ld	a,_sicp_buf+7
2090  0102 a40f          	and	a,#15
2091  0104 c70084        	ld	_rev_channel,a
2092                     ; 274 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2094  0107 3b000f        	push	_sicp_buf+9
2095  010a 3b000e        	push	_sicp_buf+8
2096  010d c6000d        	ld	a,_sicp_buf+7
2097  0110 97            	ld	xl,a
2098  0111 c6000c        	ld	a,_sicp_buf+6
2099  0114 95            	ld	xh,a
2100  0115 cd0000        	call	_i2c_action_plug
2102  0118 85            	popw	x
2103  0119 6b04          	ld	(OFST-55,sp),a
2104                     ; 275 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_own_meshid_H,ns_own_meshid_L,0x02,rev_mdid);
2106  011b 0d04          	tnz	(OFST-55,sp)
2107  011d 2703          	jreq	L66
2108  011f cc038c        	jp	L7011
2109  0122               L66:
2112  0122 3b0085        	push	_rev_mdid
2113  0125 4b02          	push	#2
2114  0127 3b008b        	push	_ns_own_meshid_L
2115  012a 3b008c        	push	_ns_own_meshid_H
2116  012d c60088        	ld	a,_rev_message_id
2117  0130 97            	ld	xl,a
2118  0131 a605          	ld	a,#5
2119  0133 95            	ld	xh,a
2120  0134 cd0000        	call	_sicp_receipt_Done
2122  0137 5b04          	addw	sp,#4
2123  0139 ac8c038c      	jpf	L7011
2124  013d               L5201:
2125                     ; 277 				case 0x57://一个SC下多个SLC多个通道调光
2125                     ; 278 					action_dimmer_num = sicp_buf[7];
2127  013d c6000d        	ld	a,_sicp_buf+7
2128  0140 6b03          	ld	(OFST-56,sp),a
2129                     ; 279 					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
2131  0142 3b008b        	push	_ns_own_meshid_L
2132  0145 3b008c        	push	_ns_own_meshid_H
2133  0148 c60088        	ld	a,_rev_message_id
2134  014b 97            	ld	xl,a
2135  014c a602          	ld	a,#2
2136  014e 95            	ld	xh,a
2137  014f cd0000        	call	_sicp_receipt_OK
2139  0152 85            	popw	x
2140                     ; 281 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2142  0153 7b03          	ld	a,(OFST-56,sp)
2143  0155 cd0000        	call	_i2c_multiple_action_dimmer
2145  0158 6b04          	ld	(OFST-55,sp),a
2146                     ; 282 					if(ret == IIC_SUCCESS){
2148  015a 0d04          	tnz	(OFST-55,sp)
2149  015c 2703          	jreq	L07
2150  015e cc038c        	jp	L7011
2151  0161               L07:
2152                     ; 283 						receipt.frame_h1 = 0xEE;
2154  0161 a6ee          	ld	a,#238
2155  0163 6b05          	ld	(OFST-54,sp),a
2156                     ; 284 						receipt.frame_h2 = 0xAA;
2158  0165 a6aa          	ld	a,#170
2159  0167 6b06          	ld	(OFST-53,sp),a
2160                     ; 285 						receipt.message_id = rev_message_id;
2162  0169 c60088        	ld	a,_rev_message_id
2163  016c 6b07          	ld	(OFST-52,sp),a
2164                     ; 286 						receipt.mesh_id_H = ns_own_meshid_H;
2166  016e c6008c        	ld	a,_ns_own_meshid_H
2167  0171 6b08          	ld	(OFST-51,sp),a
2168                     ; 287 						receipt.mesh_id_L = ns_own_meshid_L;
2170  0173 c6008b        	ld	a,_ns_own_meshid_L
2171  0176 6b09          	ld	(OFST-50,sp),a
2172                     ; 288 						receipt.payload[0] = 0xAA;
2174  0178 a6aa          	ld	a,#170
2175  017a 6b0a          	ld	(OFST-49,sp),a
2176                     ; 289 						receipt.payload[1] = 0x05;
2178  017c a605          	ld	a,#5
2179  017e 6b0b          	ld	(OFST-48,sp),a
2180                     ; 290 						i = 0;
2182  0180 0f04          	clr	(OFST-55,sp)
2184  0182 ac1c021c      	jpf	L3411
2185  0186               L7311:
2186                     ; 292 							rev_mdid = (sicp_buf[8]&0xf0)>>4;
2188  0186 c6000e        	ld	a,_sicp_buf+8
2189  0189 a4f0          	and	a,#240
2190  018b 4e            	swap	a
2191  018c a40f          	and	a,#15
2192  018e c70085        	ld	_rev_mdid,a
2193                     ; 293 							rev_channel = (sicp_buf[8]&0x0f);
2195  0191 c6000e        	ld	a,_sicp_buf+8
2196  0194 a40f          	and	a,#15
2197  0196 c70084        	ld	_rev_channel,a
2198                     ; 294 							receipt.payload[2+i*5] = rev_mdid;
2200  0199 96            	ldw	x,sp
2201  019a 1c000c        	addw	x,#OFST-47
2202  019d 1f01          	ldw	(OFST-58,sp),x
2203  019f 7b04          	ld	a,(OFST-55,sp)
2204  01a1 97            	ld	xl,a
2205  01a2 a605          	ld	a,#5
2206  01a4 42            	mul	x,a
2207  01a5 72fb01        	addw	x,(OFST-58,sp)
2208  01a8 c60085        	ld	a,_rev_mdid
2209  01ab f7            	ld	(x),a
2210                     ; 295 							receipt.payload[3+i*5] = sc.slc[rev_mdid].ch1_status;
2212  01ac 96            	ldw	x,sp
2213  01ad 1c000d        	addw	x,#OFST-46
2214  01b0 1f01          	ldw	(OFST-58,sp),x
2215  01b2 7b04          	ld	a,(OFST-55,sp)
2216  01b4 97            	ld	xl,a
2217  01b5 a605          	ld	a,#5
2218  01b7 42            	mul	x,a
2219  01b8 72fb01        	addw	x,(OFST-58,sp)
2220  01bb 89            	pushw	x
2221  01bc c60085        	ld	a,_rev_mdid
2222  01bf 97            	ld	xl,a
2223  01c0 a61a          	ld	a,#26
2224  01c2 42            	mul	x,a
2225  01c3 d60262        	ld	a,(_sc+466,x)
2226  01c6 85            	popw	x
2227  01c7 f7            	ld	(x),a
2228                     ; 296 							receipt.payload[4+i*5] = sc.slc[rev_mdid].ch2_status;
2230  01c8 96            	ldw	x,sp
2231  01c9 1c000e        	addw	x,#OFST-45
2232  01cc 1f01          	ldw	(OFST-58,sp),x
2233  01ce 7b04          	ld	a,(OFST-55,sp)
2234  01d0 97            	ld	xl,a
2235  01d1 a605          	ld	a,#5
2236  01d3 42            	mul	x,a
2237  01d4 72fb01        	addw	x,(OFST-58,sp)
2238  01d7 89            	pushw	x
2239  01d8 c60085        	ld	a,_rev_mdid
2240  01db 97            	ld	xl,a
2241  01dc a61a          	ld	a,#26
2242  01de 42            	mul	x,a
2243  01df d60263        	ld	a,(_sc+467,x)
2244  01e2 85            	popw	x
2245  01e3 f7            	ld	(x),a
2246                     ; 297 							receipt.payload[5+i*5] = sc.slc[rev_mdid].ch3_status;
2248  01e4 96            	ldw	x,sp
2249  01e5 1c000f        	addw	x,#OFST-44
2250  01e8 1f01          	ldw	(OFST-58,sp),x
2251  01ea 7b04          	ld	a,(OFST-55,sp)
2252  01ec 97            	ld	xl,a
2253  01ed a605          	ld	a,#5
2254  01ef 42            	mul	x,a
2255  01f0 72fb01        	addw	x,(OFST-58,sp)
2256  01f3 89            	pushw	x
2257  01f4 c60085        	ld	a,_rev_mdid
2258  01f7 97            	ld	xl,a
2259  01f8 a61a          	ld	a,#26
2260  01fa 42            	mul	x,a
2261  01fb d60264        	ld	a,(_sc+468,x)
2262  01fe 85            	popw	x
2263  01ff f7            	ld	(x),a
2264                     ; 298 							receipt.payload[6+i*5] = sc.slc[rev_mdid].ch4_status;
2266  0200 96            	ldw	x,sp
2267  0201 1c0010        	addw	x,#OFST-43
2268  0204 1f01          	ldw	(OFST-58,sp),x
2269  0206 7b04          	ld	a,(OFST-55,sp)
2270  0208 97            	ld	xl,a
2271  0209 a605          	ld	a,#5
2272  020b 42            	mul	x,a
2273  020c 72fb01        	addw	x,(OFST-58,sp)
2274  020f 89            	pushw	x
2275  0210 c60085        	ld	a,_rev_mdid
2276  0213 97            	ld	xl,a
2277  0214 a61a          	ld	a,#26
2278  0216 42            	mul	x,a
2279  0217 d60265        	ld	a,(_sc+469,x)
2280  021a 85            	popw	x
2281  021b f7            	ld	(x),a
2282  021c               L3411:
2283                     ; 291 						while(action_dimmer_num--){
2285  021c 7b03          	ld	a,(OFST-56,sp)
2286  021e 0a03          	dec	(OFST-56,sp)
2287  0220 4d            	tnz	a
2288  0221 2703          	jreq	L27
2289  0223 cc0186        	jp	L7311
2290  0226               L27:
2291                     ; 300 						sicp_send_message(&receipt,7+i*5);
2293  0226 7b04          	ld	a,(OFST-55,sp)
2294  0228 97            	ld	xl,a
2295  0229 a605          	ld	a,#5
2296  022b 42            	mul	x,a
2297  022c 9f            	ld	a,xl
2298  022d ab07          	add	a,#7
2299  022f 88            	push	a
2300  0230 96            	ldw	x,sp
2301  0231 1c0006        	addw	x,#OFST-53
2302  0234 cd0000        	call	_sicp_send_message
2304  0237 84            	pop	a
2305  0238 ac8c038c      	jpf	L7011
2306  023c               L7201:
2307                     ; 303 				case 0xAA:
2307                     ; 304 					if(sicp_buf[7] == 0x02){
2309  023c c6000d        	ld	a,_sicp_buf+7
2310  023f a102          	cp	a,#2
2311  0241 2703          	jreq	L47
2312  0243 cc038c        	jp	L7011
2313  0246               L47:
2314                     ; 306 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2316  0246 725d0088      	tnz	_rev_message_id
2317  024a 271d          	jreq	L1511
2319  024c c60088        	ld	a,_rev_message_id
2320  024f a110          	cp	a,#16
2321  0251 2416          	jruge	L1511
2324  0253 c60088        	ld	a,_rev_message_id
2325  0256 97            	ld	xl,a
2326  0257 a61c          	ld	a,#28
2327  0259 42            	mul	x,a
2328  025a 1d001c        	subw	x,#28
2329  025d d600c4        	ld	a,(_sc+52,x)
2330  0260 aa01          	or	a,#1
2331  0262 d700c4        	ld	(_sc+52,x),a
2333  0265 ac8c038c      	jpf	L7011
2334  0269               L1511:
2335                     ; 308 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2337  0269 c60088        	ld	a,_rev_message_id
2338  026c a110          	cp	a,#16
2339  026e 2608          	jrne	L5511
2342  0270 721203d3      	bset	_sc+835,#1
2344  0274 ac8c038c      	jpf	L7011
2345  0278               L5511:
2346                     ; 309 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2348  0278 c60088        	ld	a,_rev_message_id
2349  027b a115          	cp	a,#21
2350  027d 251d          	jrult	L1611
2352  027f c60088        	ld	a,_rev_message_id
2353  0282 a124          	cp	a,#36
2354  0284 2416          	jruge	L1611
2357  0286 c60088        	ld	a,_rev_message_id
2358  0289 97            	ld	xl,a
2359  028a a61a          	ld	a,#26
2360  028c 42            	mul	x,a
2361  028d 1d0222        	subw	x,#546
2362  0290 d60266        	ld	a,(_sc+470,x)
2363  0293 aa02          	or	a,#2
2364  0295 d70266        	ld	(_sc+470,x),a
2366  0298 ac8c038c      	jpf	L7011
2367  029c               L1611:
2368                     ; 310 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2370  029c c60088        	ld	a,_rev_message_id
2371  029f a124          	cp	a,#36
2372  02a1 251d          	jrult	L5611
2374  02a3 c60088        	ld	a,_rev_message_id
2375  02a6 a133          	cp	a,#51
2376  02a8 2416          	jruge	L5611
2379  02aa c60088        	ld	a,_rev_message_id
2380  02ad 97            	ld	xl,a
2381  02ae a61c          	ld	a,#28
2382  02b0 42            	mul	x,a
2383  02b1 1d03f0        	subw	x,#1008
2384  02b4 d600c4        	ld	a,(_sc+52,x)
2385  02b7 aa02          	or	a,#2
2386  02b9 d700c4        	ld	(_sc+52,x),a
2388  02bc ac8c038c      	jpf	L7011
2389  02c0               L5611:
2390                     ; 312 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2392  02c0 c60088        	ld	a,_rev_message_id
2393  02c3 a111          	cp	a,#17
2394  02c5 2608          	jrne	L1711
2397  02c7 721403d3      	bset	_sc+835,#2
2399  02cb ac8c038c      	jpf	L7011
2400  02cf               L1711:
2401                     ; 313 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2403  02cf c60088        	ld	a,_rev_message_id
2404  02d2 a133          	cp	a,#51
2405  02d4 251d          	jrult	L5711
2407  02d6 c60088        	ld	a,_rev_message_id
2408  02d9 a142          	cp	a,#66
2409  02db 2416          	jruge	L5711
2412  02dd c60088        	ld	a,_rev_message_id
2413  02e0 97            	ld	xl,a
2414  02e1 a61a          	ld	a,#26
2415  02e3 42            	mul	x,a
2416  02e4 1d052e        	subw	x,#1326
2417  02e7 d60266        	ld	a,(_sc+470,x)
2418  02ea aa04          	or	a,#4
2419  02ec d70266        	ld	(_sc+470,x),a
2421  02ef ac8c038c      	jpf	L7011
2422  02f3               L5711:
2423                     ; 314 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2425  02f3 c60088        	ld	a,_rev_message_id
2426  02f6 a142          	cp	a,#66
2427  02f8 2403          	jruge	L67
2428  02fa cc038c        	jp	L7011
2429  02fd               L67:
2431  02fd c60088        	ld	a,_rev_message_id
2432  0300 a151          	cp	a,#81
2433  0302 24f6          	jruge	L7011
2436  0304 c60088        	ld	a,_rev_message_id
2437  0307 97            	ld	xl,a
2438  0308 a61c          	ld	a,#28
2439  030a 42            	mul	x,a
2440  030b 1d0738        	subw	x,#1848
2441  030e d600c4        	ld	a,(_sc+52,x)
2442  0311 aa04          	or	a,#4
2443  0313 d700c4        	ld	(_sc+52,x),a
2444  0316 2074          	jra	L7011
2445  0318               L1301:
2446                     ; 317 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2446                     ; 318 				break;
2448  0318 2072          	jra	L7011
2449  031a               L5211:
2451  031a 2070          	jra	L7011
2452  031c               L1211:
2453                     ; 321 		else if (ble_ctrl_frame){
2455  031c c603d9        	ld	a,_UART1Flag1_
2456  031f a504          	bcp	a,#4
2457  0321 2769          	jreq	L7011
2458                     ; 322 			ble_ctrl_frame = 0;
2460  0323 721503d9      	bres	_UART1Flag1_,#2
2461                     ; 323 			switch(sicp_buf[4]){
2463  0327 c6000a        	ld	a,_sicp_buf+4
2465                     ; 349 				break;
2466  032a 4a            	dec	a
2467  032b 2708          	jreq	L3301
2468  032d 4a            	dec	a
2469  032e 272a          	jreq	L5301
2470  0330 4a            	dec	a
2471  0331 2733          	jreq	L7301
2472  0333 2057          	jra	L7011
2473  0335               L3301:
2474                     ; 324 				case 0x01://网络状态帧
2474                     ; 325 				ns_signal = sicp_buf[5];
2476  0335 55000b008f    	mov	_ns_signal,_sicp_buf+5
2477                     ; 326 				ns_status = sicp_buf[6];
2479  033a 55000c008e    	mov	_ns_status,_sicp_buf+6
2480                     ; 327 				ns_phonenum = sicp_buf[7];
2482  033f 55000d008d    	mov	_ns_phonenum,_sicp_buf+7
2483                     ; 328 				ns_own_meshid_H = sicp_buf[8];
2485  0344 55000e008c    	mov	_ns_own_meshid_H,_sicp_buf+8
2486                     ; 329 				ns_own_meshid_L = sicp_buf[9];
2488  0349 55000f008b    	mov	_ns_own_meshid_L,_sicp_buf+9
2489                     ; 330 				ns_host_meshid_H = sicp_buf[10];
2491  034e 550010008a    	mov	_ns_host_meshid_H,_sicp_buf+10
2492                     ; 331 				ns_host_meshid_L = sicp_buf[11];
2494  0353 5500110089    	mov	_ns_host_meshid_L,_sicp_buf+11
2495                     ; 332 				break;
2497  0358 2032          	jra	L7011
2498  035a               L5301:
2499                     ; 333 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2499                     ; 334 				sys_init();
2501  035a cd0000        	call	_sys_init
2503                     ; 335 				clear_uart_buf();
2505  035d cd0000        	call	_clear_uart_buf
2507                     ; 336 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2509  0360 725f0000      	clr	_init_slc_spc_done
2510                     ; 337 				break;
2512  0364 2026          	jra	L7011
2513  0366               L7301:
2514                     ; 338 			case 0x03://重置芯片和网络，退出mesh连接
2514                     ; 339 				sys_init();
2516  0366 cd0000        	call	_sys_init
2518                     ; 340 				clear_uart_buf();
2520  0369 cd0000        	call	_clear_uart_buf
2522                     ; 341 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2524  036c 725f0000      	clr	_init_slc_spc_done
2525                     ; 342 				ns_signal = 0x00;
2527  0370 725f008f      	clr	_ns_signal
2528                     ; 343 				ns_status = 0x00;
2530  0374 725f008e      	clr	_ns_status
2531                     ; 344 				ns_phonenum = 0x00;
2533  0378 725f008d      	clr	_ns_phonenum
2534                     ; 345 				ns_own_meshid_H = 0x00;
2536  037c 725f008c      	clr	_ns_own_meshid_H
2537                     ; 346 				ns_own_meshid_L = 0x00;
2539  0380 725f008b      	clr	_ns_own_meshid_L
2540                     ; 347 				ns_host_meshid_H = 0x00;
2542  0384 725f008a      	clr	_ns_host_meshid_H
2543                     ; 348 				ns_host_meshid_L = 0x00;
2545  0388 725f0089      	clr	_ns_host_meshid_L
2546                     ; 349 				break;
2548  038c               L1121:
2549  038c               L7011:
2550                     ; 353 }
2553  038c 5b3b          	addw	sp,#59
2554  038e 81            	ret
2603                     ; 356 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2603                     ; 357 {
2604                     .text:	section	.text,new
2605  0000               _sicp_send_message:
2607  0000 89            	pushw	x
2608       00000000      OFST:	set	0
2611                     ; 360 	UART2_Send_Buf[0] = tx->frame_h1;
2613  0001 f6            	ld	a,(x)
2614  0002 c7005a        	ld	_UART2_Send_Buf,a
2615                     ; 361 	UART2_Send_Buf[1] = tx->frame_h2;
2617  0005 e601          	ld	a,(1,x)
2618  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2619                     ; 362 	UART2_Send_Buf[2] = tx->message_id;
2621  000a e602          	ld	a,(2,x)
2622  000c c7005c        	ld	_UART2_Send_Buf+2,a
2623                     ; 363 	UART2_Send_Buf[3] = tx->mesh_id_H;
2625  000f e603          	ld	a,(3,x)
2626  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2627                     ; 364 	UART2_Send_Buf[4] = tx->mesh_id_L;
2629  0014 e604          	ld	a,(4,x)
2630  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2631                     ; 365 	UART2_Send_Buf[5] = 4+payload_len;
2633  0019 7b05          	ld	a,(OFST+5,sp)
2634  001b ab04          	add	a,#4
2635  001d c7005f        	ld	_UART2_Send_Buf+5,a
2636                     ; 366 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2638  0020 7b05          	ld	a,(OFST+5,sp)
2639  0022 b703          	ld	c_lreg+3,a
2640  0024 3f02          	clr	c_lreg+2
2641  0026 3f01          	clr	c_lreg+1
2642  0028 3f00          	clr	c_lreg
2643  002a be02          	ldw	x,c_lreg+2
2644  002c 89            	pushw	x
2645  002d be00          	ldw	x,c_lreg
2646  002f 89            	pushw	x
2647  0030 1e05          	ldw	x,(OFST+5,sp)
2648  0032 1c0005        	addw	x,#5
2649  0035 89            	pushw	x
2650  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2651  0039 cd0000        	call	_mymemcpy
2653  003c 5b06          	addw	sp,#6
2654                     ; 367 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2656  003e 7b05          	ld	a,(OFST+5,sp)
2657  0040 5f            	clrw	x
2658  0041 97            	ld	xl,a
2659  0042 89            	pushw	x
2660  0043 3b005f        	push	_UART2_Send_Buf+5
2661  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2662  0049 cd0000        	call	_Check_Sum
2664  004c 5b01          	addw	sp,#1
2665  004e 85            	popw	x
2666  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2667                     ; 368 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2669  0052 7b05          	ld	a,(OFST+5,sp)
2670  0054 5f            	clrw	x
2671  0055 97            	ld	xl,a
2672  0056 1c0007        	addw	x,#7
2673  0059 89            	pushw	x
2674  005a ae005a        	ldw	x,#_UART2_Send_Buf
2675  005d cd0000        	call	_Uart2_Send
2677  0060 85            	popw	x
2679  0061               L7321:
2680                     ; 369 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2682  0061 725d0057      	tnz	_Uart2_Send_Done
2683  0065 27fa          	jreq	L7321
2686  0067 725f0057      	clr	_Uart2_Send_Done
2687                     ; 370 }
2690  006b 85            	popw	x
2691  006c 81            	ret
2755                     ; 376 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
2755                     ; 377 {
2756                     .text:	section	.text,new
2757  0000               _sicp_receipt_OK:
2759  0000 89            	pushw	x
2760  0001 5237          	subw	sp,#55
2761       00000037      OFST:	set	55
2764                     ; 379 	receipt.frame_h1 = 0xEE;
2766  0003 a6ee          	ld	a,#238
2767  0005 6b01          	ld	(OFST-54,sp),a
2768                     ; 380 	receipt.frame_h2 = 0xAA;
2770  0007 a6aa          	ld	a,#170
2771  0009 6b02          	ld	(OFST-53,sp),a
2772                     ; 381 	receipt.message_id = send_message_id;
2774  000b 9f            	ld	a,xl
2775  000c 6b03          	ld	(OFST-52,sp),a
2776                     ; 382 	receipt.mesh_id_H = send_mesh_id_H;
2778  000e 7b3c          	ld	a,(OFST+5,sp)
2779  0010 6b04          	ld	(OFST-51,sp),a
2780                     ; 383 	receipt.mesh_id_L = send_mesh_id_L;
2782  0012 7b3d          	ld	a,(OFST+6,sp)
2783  0014 6b05          	ld	(OFST-50,sp),a
2784                     ; 384 	receipt.payload[0] = 0xAA;
2786  0016 a6aa          	ld	a,#170
2787  0018 6b06          	ld	(OFST-49,sp),a
2788                     ; 385 	receipt.payload[1] = type;
2790  001a 9e            	ld	a,xh
2791  001b 6b07          	ld	(OFST-48,sp),a
2792                     ; 386 	sicp_send_message(&receipt,2);
2794  001d 4b02          	push	#2
2795  001f 96            	ldw	x,sp
2796  0020 1c0002        	addw	x,#OFST-53
2797  0023 cd0000        	call	_sicp_send_message
2799  0026 84            	pop	a
2800                     ; 387 }
2803  0027 5b39          	addw	sp,#57
2804  0029 81            	ret
2890                     ; 389 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
2890                     ; 390 {
2891                     .text:	section	.text,new
2892  0000               _sicp_receipt_Done:
2894  0000 89            	pushw	x
2895  0001 5238          	subw	sp,#56
2896       00000038      OFST:	set	56
2899                     ; 393 	receipt.frame_h1 = 0xEE;
2901  0003 a6ee          	ld	a,#238
2902  0005 6b01          	ld	(OFST-55,sp),a
2903                     ; 394 	receipt.frame_h2 = 0xAA;
2905  0007 a6aa          	ld	a,#170
2906  0009 6b02          	ld	(OFST-54,sp),a
2907                     ; 395 	receipt.message_id = send_message_id;
2909  000b 9f            	ld	a,xl
2910  000c 6b03          	ld	(OFST-53,sp),a
2911                     ; 396 	receipt.mesh_id_H = send_mesh_id_H;
2913  000e 7b3d          	ld	a,(OFST+5,sp)
2914  0010 6b04          	ld	(OFST-52,sp),a
2915                     ; 397 	receipt.mesh_id_L = send_mesh_id_L;
2917  0012 7b3e          	ld	a,(OFST+6,sp)
2918  0014 6b05          	ld	(OFST-51,sp),a
2919                     ; 398 	receipt.payload[0] = 0xAA;
2921  0016 a6aa          	ld	a,#170
2922  0018 6b06          	ld	(OFST-50,sp),a
2923                     ; 399 	receipt.payload[1] = type;
2925  001a 9e            	ld	a,xh
2926  001b 6b07          	ld	(OFST-49,sp),a
2927                     ; 400 	switch(method){
2929  001d 7b3f          	ld	a,(OFST+7,sp)
2931                     ; 416 		for(i = 0;i < 15;i++){
2932  001f 4a            	dec	a
2933  0020 2707          	jreq	L1721
2934  0022 4a            	dec	a
2935  0023 2766          	jreq	L3721
2936  0025 aceb00eb      	jpf	L3331
2937  0029               L1721:
2938                     ; 401 		case 0x01://action Dimmer调光的执行回执
2938                     ; 402 		receipt.payload[2] = mdid;
2940  0029 7b40          	ld	a,(OFST+8,sp)
2941  002b 6b08          	ld	(OFST-48,sp),a
2942                     ; 403 		for(i = 0;i < 15;i++){
2944  002d 0f38          	clr	(OFST+0,sp)
2945  002f               L5331:
2946                     ; 404 			if(sc.slc[i].MDID == mdid){
2948  002f 7b38          	ld	a,(OFST+0,sp)
2949  0031 97            	ld	xl,a
2950  0032 a61a          	ld	a,#26
2951  0034 42            	mul	x,a
2952  0035 7b40          	ld	a,(OFST+8,sp)
2953  0037 905f          	clrw	y
2954  0039 9097          	ld	yl,a
2955  003b 90bf00        	ldw	c_y,y
2956  003e 9093          	ldw	y,x
2957  0040 90de0260      	ldw	y,(_sc+464,y)
2958  0044 90b300        	cpw	y,c_y
2959  0047 2638          	jrne	L3431
2960                     ; 405 				receipt.payload[3] = sc.slc[i].ch1_status;
2962  0049 7b38          	ld	a,(OFST+0,sp)
2963  004b 97            	ld	xl,a
2964  004c a61a          	ld	a,#26
2965  004e 42            	mul	x,a
2966  004f d60262        	ld	a,(_sc+466,x)
2967  0052 6b09          	ld	(OFST-47,sp),a
2968                     ; 406 				receipt.payload[4] = sc.slc[i].ch1_status;
2970  0054 7b38          	ld	a,(OFST+0,sp)
2971  0056 97            	ld	xl,a
2972  0057 a61a          	ld	a,#26
2973  0059 42            	mul	x,a
2974  005a d60262        	ld	a,(_sc+466,x)
2975  005d 6b0a          	ld	(OFST-46,sp),a
2976                     ; 407 				receipt.payload[5] = sc.slc[i].ch1_status;
2978  005f 7b38          	ld	a,(OFST+0,sp)
2979  0061 97            	ld	xl,a
2980  0062 a61a          	ld	a,#26
2981  0064 42            	mul	x,a
2982  0065 d60262        	ld	a,(_sc+466,x)
2983  0068 6b0b          	ld	(OFST-45,sp),a
2984                     ; 408 				receipt.payload[6] = sc.slc[i].ch1_status;
2986  006a 7b38          	ld	a,(OFST+0,sp)
2987  006c 97            	ld	xl,a
2988  006d a61a          	ld	a,#26
2989  006f 42            	mul	x,a
2990  0070 d60262        	ld	a,(_sc+466,x)
2991  0073 6b0c          	ld	(OFST-44,sp),a
2992                     ; 409 				sicp_send_message(&receipt,7);
2994  0075 4b07          	push	#7
2995  0077 96            	ldw	x,sp
2996  0078 1c0002        	addw	x,#OFST-54
2997  007b cd0000        	call	_sicp_send_message
2999  007e 84            	pop	a
3000                     ; 410 				break;
3002  007f 206a          	jra	L3331
3003  0081               L3431:
3004                     ; 403 		for(i = 0;i < 15;i++){
3006  0081 0c38          	inc	(OFST+0,sp)
3009  0083 7b38          	ld	a,(OFST+0,sp)
3010  0085 a10f          	cp	a,#15
3011  0087 25a6          	jrult	L5331
3012  0089 2060          	jra	L3331
3013  008b               L3721:
3014                     ; 414 		case 0x02://action plug switch打开或关闭开关的执行回执
3014                     ; 415 		receipt.payload[2] = mdid;
3016  008b 7b40          	ld	a,(OFST+8,sp)
3017  008d 6b08          	ld	(OFST-48,sp),a
3018                     ; 416 		for(i = 0;i < 15;i++){
3020  008f 0f38          	clr	(OFST+0,sp)
3021  0091               L5431:
3022                     ; 417 			if(sc.spc[i].MDID == mdid){
3024  0091 7b38          	ld	a,(OFST+0,sp)
3025  0093 97            	ld	xl,a
3026  0094 a61c          	ld	a,#28
3027  0096 42            	mul	x,a
3028  0097 7b40          	ld	a,(OFST+8,sp)
3029  0099 905f          	clrw	y
3030  009b 9097          	ld	yl,a
3031  009d 90bf00        	ldw	c_y,y
3032  00a0 9093          	ldw	y,x
3033  00a2 90de00bc      	ldw	y,(_sc+44,y)
3034  00a6 90b300        	cpw	y,c_y
3035  00a9 2638          	jrne	L3531
3036                     ; 418 				receipt.payload[3] = sc.spc[i].ch1_status;
3038  00ab 7b38          	ld	a,(OFST+0,sp)
3039  00ad 97            	ld	xl,a
3040  00ae a61c          	ld	a,#28
3041  00b0 42            	mul	x,a
3042  00b1 d600be        	ld	a,(_sc+46,x)
3043  00b4 6b09          	ld	(OFST-47,sp),a
3044                     ; 419 				receipt.payload[4] = sc.spc[i].ch1_status;
3046  00b6 7b38          	ld	a,(OFST+0,sp)
3047  00b8 97            	ld	xl,a
3048  00b9 a61c          	ld	a,#28
3049  00bb 42            	mul	x,a
3050  00bc d600be        	ld	a,(_sc+46,x)
3051  00bf 6b0a          	ld	(OFST-46,sp),a
3052                     ; 420 				receipt.payload[5] = sc.spc[i].ch1_status;
3054  00c1 7b38          	ld	a,(OFST+0,sp)
3055  00c3 97            	ld	xl,a
3056  00c4 a61c          	ld	a,#28
3057  00c6 42            	mul	x,a
3058  00c7 d600be        	ld	a,(_sc+46,x)
3059  00ca 6b0b          	ld	(OFST-45,sp),a
3060                     ; 421 				receipt.payload[6] = sc.spc[i].ch1_status;
3062  00cc 7b38          	ld	a,(OFST+0,sp)
3063  00ce 97            	ld	xl,a
3064  00cf a61c          	ld	a,#28
3065  00d1 42            	mul	x,a
3066  00d2 d600be        	ld	a,(_sc+46,x)
3067  00d5 6b0c          	ld	(OFST-44,sp),a
3068                     ; 422 				sicp_send_message(&receipt,7);
3070  00d7 4b07          	push	#7
3071  00d9 96            	ldw	x,sp
3072  00da 1c0002        	addw	x,#OFST-54
3073  00dd cd0000        	call	_sicp_send_message
3075  00e0 84            	pop	a
3076                     ; 423 				break;
3078  00e1 2008          	jra	L3331
3079  00e3               L3531:
3080                     ; 416 		for(i = 0;i < 15;i++){
3082  00e3 0c38          	inc	(OFST+0,sp)
3085  00e5 7b38          	ld	a,(OFST+0,sp)
3086  00e7 a10f          	cp	a,#15
3087  00e9 25a6          	jrult	L5431
3088  00eb               L3331:
3089                     ; 427 }
3092  00eb 5b3a          	addw	sp,#58
3093  00ed 81            	ret
3147                     ; 430 void rev_cmd_data(u8 moduleid){
3148                     .text:	section	.text,new
3149  0000               _rev_cmd_data:
3151  0000 88            	push	a
3152  0001 5238          	subw	sp,#56
3153       00000038      OFST:	set	56
3156                     ; 433 	for(i = 0;i < 15;i++){
3158  0003 0f01          	clr	(OFST-55,sp)
3159  0005               L7731:
3160                     ; 434 		if(sc.slc[i].MDID == moduleid){
3162  0005 7b01          	ld	a,(OFST-55,sp)
3163  0007 97            	ld	xl,a
3164  0008 a61a          	ld	a,#26
3165  000a 42            	mul	x,a
3166  000b 7b39          	ld	a,(OFST+1,sp)
3167  000d 905f          	clrw	y
3168  000f 9097          	ld	yl,a
3169  0011 90bf00        	ldw	c_y,y
3170  0014 9093          	ldw	y,x
3171  0016 90de0260      	ldw	y,(_sc+464,y)
3172  001a 90b300        	cpw	y,c_y
3173  001d 2657          	jrne	L5041
3174                     ; 435 			cmd_data.frame_h1 = 0xEE;
3176  001f a6ee          	ld	a,#238
3177  0021 6b02          	ld	(OFST-54,sp),a
3178                     ; 436 			cmd_data.frame_h2 = 0xAA;
3180  0023 a6aa          	ld	a,#170
3181  0025 6b03          	ld	(OFST-53,sp),a
3182                     ; 437 			cmd_data.message_id = rev_message_id;
3184  0027 c60088        	ld	a,_rev_message_id
3185  002a 6b04          	ld	(OFST-52,sp),a
3186                     ; 438 			cmd_data.mesh_id_H = ns_own_meshid_H;
3188  002c c6008c        	ld	a,_ns_own_meshid_H
3189  002f 6b05          	ld	(OFST-51,sp),a
3190                     ; 439 			cmd_data.mesh_id_L = ns_own_meshid_L;
3192  0031 c6008b        	ld	a,_ns_own_meshid_L
3193  0034 6b06          	ld	(OFST-50,sp),a
3194                     ; 440 			cmd_data.payload[0] = 0x06;
3196  0036 a606          	ld	a,#6
3197  0038 6b07          	ld	(OFST-49,sp),a
3198                     ; 441 			cmd_data.payload[1] = moduleid;
3200  003a 7b39          	ld	a,(OFST+1,sp)
3201  003c 6b08          	ld	(OFST-48,sp),a
3202                     ; 442 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3204  003e 7b01          	ld	a,(OFST-55,sp)
3205  0040 97            	ld	xl,a
3206  0041 a61a          	ld	a,#26
3207  0043 42            	mul	x,a
3208  0044 d60262        	ld	a,(_sc+466,x)
3209  0047 6b09          	ld	(OFST-47,sp),a
3210                     ; 443 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3212  0049 7b01          	ld	a,(OFST-55,sp)
3213  004b 97            	ld	xl,a
3214  004c a61a          	ld	a,#26
3215  004e 42            	mul	x,a
3216  004f d60263        	ld	a,(_sc+467,x)
3217  0052 6b0a          	ld	(OFST-46,sp),a
3218                     ; 444 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3220  0054 7b01          	ld	a,(OFST-55,sp)
3221  0056 97            	ld	xl,a
3222  0057 a61a          	ld	a,#26
3223  0059 42            	mul	x,a
3224  005a d60264        	ld	a,(_sc+468,x)
3225  005d 6b0b          	ld	(OFST-45,sp),a
3226                     ; 445 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3228  005f 7b01          	ld	a,(OFST-55,sp)
3229  0061 97            	ld	xl,a
3230  0062 a61a          	ld	a,#26
3231  0064 42            	mul	x,a
3232  0065 d60265        	ld	a,(_sc+469,x)
3233  0068 6b0c          	ld	(OFST-44,sp),a
3234                     ; 446 			sicp_send_message(&cmd_data,6);
3236  006a 4b06          	push	#6
3237  006c 96            	ldw	x,sp
3238  006d 1c0003        	addw	x,#OFST-53
3239  0070 cd0000        	call	_sicp_send_message
3241  0073 84            	pop	a
3242                     ; 447 			break;
3244  0074 207c          	jra	L3041
3245  0076               L5041:
3246                     ; 449 		if(sc.spc[i].MDID == moduleid){
3248  0076 7b01          	ld	a,(OFST-55,sp)
3249  0078 97            	ld	xl,a
3250  0079 a61c          	ld	a,#28
3251  007b 42            	mul	x,a
3252  007c 7b39          	ld	a,(OFST+1,sp)
3253  007e 905f          	clrw	y
3254  0080 9097          	ld	yl,a
3255  0082 90bf00        	ldw	c_y,y
3256  0085 9093          	ldw	y,x
3257  0087 90de00bc      	ldw	y,(_sc+44,y)
3258  008b 90b300        	cpw	y,c_y
3259  008e 2657          	jrne	L7041
3260                     ; 450 			cmd_data.frame_h1 = 0xEE;
3262  0090 a6ee          	ld	a,#238
3263  0092 6b02          	ld	(OFST-54,sp),a
3264                     ; 451 			cmd_data.frame_h2 = 0xAA;
3266  0094 a6aa          	ld	a,#170
3267  0096 6b03          	ld	(OFST-53,sp),a
3268                     ; 452 			cmd_data.message_id = rev_message_id;
3270  0098 c60088        	ld	a,_rev_message_id
3271  009b 6b04          	ld	(OFST-52,sp),a
3272                     ; 453 			cmd_data.mesh_id_H = ns_own_meshid_H;
3274  009d c6008c        	ld	a,_ns_own_meshid_H
3275  00a0 6b05          	ld	(OFST-51,sp),a
3276                     ; 454 			cmd_data.mesh_id_L = ns_own_meshid_L;
3278  00a2 c6008b        	ld	a,_ns_own_meshid_L
3279  00a5 6b06          	ld	(OFST-50,sp),a
3280                     ; 455 			cmd_data.payload[0] = 0x06;
3282  00a7 a606          	ld	a,#6
3283  00a9 6b07          	ld	(OFST-49,sp),a
3284                     ; 456 			cmd_data.payload[1] = moduleid;
3286  00ab 7b39          	ld	a,(OFST+1,sp)
3287  00ad 6b08          	ld	(OFST-48,sp),a
3288                     ; 457 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3290  00af 7b01          	ld	a,(OFST-55,sp)
3291  00b1 97            	ld	xl,a
3292  00b2 a61c          	ld	a,#28
3293  00b4 42            	mul	x,a
3294  00b5 d600be        	ld	a,(_sc+46,x)
3295  00b8 6b09          	ld	(OFST-47,sp),a
3296                     ; 458 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3298  00ba 7b01          	ld	a,(OFST-55,sp)
3299  00bc 97            	ld	xl,a
3300  00bd a61c          	ld	a,#28
3301  00bf 42            	mul	x,a
3302  00c0 d600bf        	ld	a,(_sc+47,x)
3303  00c3 6b0a          	ld	(OFST-46,sp),a
3304                     ; 459 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3306  00c5 7b01          	ld	a,(OFST-55,sp)
3307  00c7 97            	ld	xl,a
3308  00c8 a61c          	ld	a,#28
3309  00ca 42            	mul	x,a
3310  00cb d600c0        	ld	a,(_sc+48,x)
3311  00ce 6b0b          	ld	(OFST-45,sp),a
3312                     ; 460 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3314  00d0 7b01          	ld	a,(OFST-55,sp)
3315  00d2 97            	ld	xl,a
3316  00d3 a61c          	ld	a,#28
3317  00d5 42            	mul	x,a
3318  00d6 d600c1        	ld	a,(_sc+49,x)
3319  00d9 6b0c          	ld	(OFST-44,sp),a
3320                     ; 461 			sicp_send_message(&cmd_data,6);
3322  00db 4b06          	push	#6
3323  00dd 96            	ldw	x,sp
3324  00de 1c0003        	addw	x,#OFST-53
3325  00e1 cd0000        	call	_sicp_send_message
3327  00e4 84            	pop	a
3328                     ; 462 			break;
3330  00e5 200b          	jra	L3041
3331  00e7               L7041:
3332                     ; 433 	for(i = 0;i < 15;i++){
3334  00e7 0c01          	inc	(OFST-55,sp)
3337  00e9 7b01          	ld	a,(OFST-55,sp)
3338  00eb a10f          	cp	a,#15
3339  00ed 2403          	jruge	L211
3340  00ef cc0005        	jp	L7731
3341  00f2               L211:
3342  00f2               L3041:
3343                     ; 465 }
3346  00f2 5b39          	addw	sp,#57
3347  00f4 81            	ret
3350                     	switch	.data
3351  0000               L1141_eg_timeout:
3352  0000 0000          	dc.w	0
3407                     ; 468 void report_energy_consum(void){
3408                     .text:	section	.text,new
3409  0000               _report_energy_consum:
3411  0000 5238          	subw	sp,#56
3412       00000038      OFST:	set	56
3415                     ; 472 	systime_count[3]++;
3417  0002 ce0006        	ldw	x,_systime_count+6
3418  0005 1c0001        	addw	x,#1
3419  0008 cf0006        	ldw	_systime_count+6,x
3420                     ; 473 	if(systime_count[3] >= 60){
3422  000b ce0006        	ldw	x,_systime_count+6
3423  000e a3003c        	cpw	x,#60
3424  0011 2403          	jruge	L611
3425  0013 cc00a2        	jp	L5341
3426  0016               L611:
3427                     ; 474 		systime_count[3] = 0;
3429  0016 5f            	clrw	x
3430  0017 cf0006        	ldw	_systime_count+6,x
3431                     ; 475 		systime_count[4]++;
3433  001a ce0008        	ldw	x,_systime_count+8
3434  001d 1c0001        	addw	x,#1
3435  0020 cf0008        	ldw	_systime_count+8,x
3436                     ; 476 		if(systime_count[4] >= 30){
3438  0023 ce0008        	ldw	x,_systime_count+8
3439  0026 a3001e        	cpw	x,#30
3440  0029 2577          	jrult	L5341
3441                     ; 477 			systime_count[4] = 0;
3443  002b 5f            	clrw	x
3444  002c cf0008        	ldw	_systime_count+8,x
3445                     ; 478 			i2c_get_energy_consum();
3447  002f cd0000        	call	_i2c_get_energy_consum
3449                     ; 479 			for(i = 0; i < 15; i++){
3451  0032 0f01          	clr	(OFST-55,sp)
3452  0034               L1441:
3453                     ; 480 				if(sc.spc[i].MDID){//有ID说明SPC存在
3455  0034 7b01          	ld	a,(OFST-55,sp)
3456  0036 97            	ld	xl,a
3457  0037 a61c          	ld	a,#28
3458  0039 42            	mul	x,a
3459  003a d600bd        	ld	a,(_sc+45,x)
3460  003d da00bc        	or	a,(_sc+44,x)
3461  0040 2758          	jreq	L7441
3462                     ; 481 				ec.frame_h1 = 0xEE;
3464  0042 a6ee          	ld	a,#238
3465  0044 6b02          	ld	(OFST-54,sp),a
3466                     ; 482 				ec.frame_h2 = 0xEE;
3468  0046 a6ee          	ld	a,#238
3469  0048 6b03          	ld	(OFST-53,sp),a
3470                     ; 483 				ec.message_id = i+1;
3472  004a 7b01          	ld	a,(OFST-55,sp)
3473  004c 4c            	inc	a
3474  004d 6b04          	ld	(OFST-52,sp),a
3475                     ; 484 				ec.mesh_id_H = ns_own_meshid_H;
3477  004f c6008c        	ld	a,_ns_own_meshid_H
3478  0052 6b05          	ld	(OFST-51,sp),a
3479                     ; 485 				ec.mesh_id_L = ns_own_meshid_L;
3481  0054 c6008b        	ld	a,_ns_own_meshid_L
3482  0057 6b06          	ld	(OFST-50,sp),a
3483                     ; 486 				ec.payload[0] = 0x2A;
3485  0059 a62a          	ld	a,#42
3486  005b 6b07          	ld	(OFST-49,sp),a
3487                     ; 487 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3489  005d 7b01          	ld	a,(OFST-55,sp)
3490  005f 97            	ld	xl,a
3491  0060 a61c          	ld	a,#28
3492  0062 42            	mul	x,a
3493  0063 de00c2        	ldw	x,(_sc+50,x)
3494  0066 01            	rrwa	x,a
3495  0067 9f            	ld	a,xl
3496  0068 a4ff          	and	a,#255
3497  006a 97            	ld	xl,a
3498  006b 4f            	clr	a
3499  006c 02            	rlwa	x,a
3500  006d 4f            	clr	a
3501  006e 01            	rrwa	x,a
3502  006f 9f            	ld	a,xl
3503  0070 6b08          	ld	(OFST-48,sp),a
3504                     ; 488 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3506  0072 7b01          	ld	a,(OFST-55,sp)
3507  0074 97            	ld	xl,a
3508  0075 a61c          	ld	a,#28
3509  0077 42            	mul	x,a
3510  0078 d600c3        	ld	a,(_sc+51,x)
3511  007b a4ff          	and	a,#255
3512  007d 6b09          	ld	(OFST-47,sp),a
3513                     ; 489 				ec.payload[3] =	sc.spc[i].MDID;
3515  007f 7b01          	ld	a,(OFST-55,sp)
3516  0081 97            	ld	xl,a
3517  0082 a61c          	ld	a,#28
3518  0084 42            	mul	x,a
3519  0085 d600bd        	ld	a,(_sc+45,x)
3520  0088 6b0a          	ld	(OFST-46,sp),a
3521                     ; 490 				sicp_send_message(&ec,4);
3523  008a 4b04          	push	#4
3524  008c 96            	ldw	x,sp
3525  008d 1c0003        	addw	x,#OFST-53
3526  0090 cd0000        	call	_sicp_send_message
3528  0093 84            	pop	a
3529                     ; 491 				eg_timeout = 5;
3531  0094 ae0005        	ldw	x,#5
3532  0097 cf0000        	ldw	L1141_eg_timeout,x
3533  009a               L7441:
3534                     ; 479 			for(i = 0; i < 15; i++){
3536  009a 0c01          	inc	(OFST-55,sp)
3539  009c 7b01          	ld	a,(OFST-55,sp)
3540  009e a10f          	cp	a,#15
3541  00a0 2592          	jrult	L1441
3542  00a2               L5341:
3543                     ; 497 	if(eg_timeout){
3545  00a2 ce0000        	ldw	x,L1141_eg_timeout
3546  00a5 2603          	jrne	L021
3547  00a7 cc0135        	jp	L1541
3548  00aa               L021:
3549                     ; 498 		if(--eg_timeout == 0){
3551  00aa ce0000        	ldw	x,L1141_eg_timeout
3552  00ad 1d0001        	subw	x,#1
3553  00b0 cf0000        	ldw	L1141_eg_timeout,x
3554  00b3 26f2          	jrne	L1541
3555                     ; 499 			for(i = 0;i < 15;i++){
3557  00b5 0f01          	clr	(OFST-55,sp)
3558  00b7               L5541:
3559                     ; 500 			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3561  00b7 7b01          	ld	a,(OFST-55,sp)
3562  00b9 97            	ld	xl,a
3563  00ba a61c          	ld	a,#28
3564  00bc 42            	mul	x,a
3565  00bd d600bd        	ld	a,(_sc+45,x)
3566  00c0 da00bc        	or	a,(_sc+44,x)
3567  00c3 2768          	jreq	L3641
3569  00c5 7b01          	ld	a,(OFST-55,sp)
3570  00c7 97            	ld	xl,a
3571  00c8 a61c          	ld	a,#28
3572  00ca 42            	mul	x,a
3573  00cb d600c4        	ld	a,(_sc+52,x)
3574  00ce a501          	bcp	a,#1
3575  00d0 265b          	jrne	L3641
3576                     ; 501 				ec.frame_h1 = 0xEE;
3578  00d2 a6ee          	ld	a,#238
3579  00d4 6b02          	ld	(OFST-54,sp),a
3580                     ; 502 				ec.frame_h2 = 0xEE;
3582  00d6 a6ee          	ld	a,#238
3583  00d8 6b03          	ld	(OFST-53,sp),a
3584                     ; 503 				ec.message_id = random(TIM4->CNTR);
3586  00da c65344        	ld	a,21316
3587  00dd cd0000        	call	_random
3589  00e0 6b04          	ld	(OFST-52,sp),a
3590                     ; 504 				ec.mesh_id_H = ns_own_meshid_H;
3592  00e2 c6008c        	ld	a,_ns_own_meshid_H
3593  00e5 6b05          	ld	(OFST-51,sp),a
3594                     ; 505 				ec.mesh_id_L = ns_own_meshid_L;
3596  00e7 c6008b        	ld	a,_ns_own_meshid_L
3597  00ea 6b06          	ld	(OFST-50,sp),a
3598                     ; 506 				ec.payload[0] = 0x2A;
3600  00ec a62a          	ld	a,#42
3601  00ee 6b07          	ld	(OFST-49,sp),a
3602                     ; 507 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3604  00f0 7b01          	ld	a,(OFST-55,sp)
3605  00f2 97            	ld	xl,a
3606  00f3 a61c          	ld	a,#28
3607  00f5 42            	mul	x,a
3608  00f6 de00c2        	ldw	x,(_sc+50,x)
3609  00f9 01            	rrwa	x,a
3610  00fa 9f            	ld	a,xl
3611  00fb a4ff          	and	a,#255
3612  00fd 97            	ld	xl,a
3613  00fe 4f            	clr	a
3614  00ff 02            	rlwa	x,a
3615  0100 4f            	clr	a
3616  0101 01            	rrwa	x,a
3617  0102 9f            	ld	a,xl
3618  0103 6b08          	ld	(OFST-48,sp),a
3619                     ; 508 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3621  0105 7b01          	ld	a,(OFST-55,sp)
3622  0107 97            	ld	xl,a
3623  0108 a61c          	ld	a,#28
3624  010a 42            	mul	x,a
3625  010b d600c3        	ld	a,(_sc+51,x)
3626  010e a4ff          	and	a,#255
3627  0110 6b09          	ld	(OFST-47,sp),a
3628                     ; 509 				ec.payload[3] =	sc.spc[i].MDID;
3630  0112 7b01          	ld	a,(OFST-55,sp)
3631  0114 97            	ld	xl,a
3632  0115 a61c          	ld	a,#28
3633  0117 42            	mul	x,a
3634  0118 d600bd        	ld	a,(_sc+45,x)
3635  011b 6b0a          	ld	(OFST-46,sp),a
3636                     ; 510 				sicp_send_message(&ec,4);
3638  011d 4b04          	push	#4
3639  011f 96            	ldw	x,sp
3640  0120 1c0003        	addw	x,#OFST-53
3641  0123 cd0000        	call	_sicp_send_message
3643  0126 84            	pop	a
3644                     ; 511 				eg_timeout = 5;//每5s重发1次直到接收到回执为止
3646  0127 ae0005        	ldw	x,#5
3647  012a cf0000        	ldw	L1141_eg_timeout,x
3648  012d               L3641:
3649                     ; 499 			for(i = 0;i < 15;i++){
3651  012d 0c01          	inc	(OFST-55,sp)
3654  012f 7b01          	ld	a,(OFST-55,sp)
3655  0131 a10f          	cp	a,#15
3656  0133 2582          	jrult	L5541
3657  0135               L1541:
3658                     ; 516 }
3661  0135 5b38          	addw	sp,#56
3662  0137 81            	ret
3702                     ; 519 void send_sc_device_info(void)
3702                     ; 520 {
3703                     .text:	section	.text,new
3704  0000               _send_sc_device_info:
3706  0000 5237          	subw	sp,#55
3707       00000037      OFST:	set	55
3710                     ; 523 	di.frame_h1 = 0xEE;
3712  0002 a6ee          	ld	a,#238
3713  0004 6b01          	ld	(OFST-54,sp),a
3714                     ; 524 	di.frame_h2 = 0xEE;
3716  0006 a6ee          	ld	a,#238
3717  0008 6b02          	ld	(OFST-53,sp),a
3718                     ; 525 	di.message_id = 16;
3720  000a a610          	ld	a,#16
3721  000c 6b03          	ld	(OFST-52,sp),a
3722                     ; 526 	di.mesh_id_H = ns_own_meshid_H;
3724  000e c6008c        	ld	a,_ns_own_meshid_H
3725  0011 6b04          	ld	(OFST-51,sp),a
3726                     ; 527 	di.mesh_id_L = ns_own_meshid_L;
3728  0013 c6008b        	ld	a,_ns_own_meshid_L
3729  0016 6b05          	ld	(OFST-50,sp),a
3730                     ; 528 	di.payload[0] = 0xB1;
3732  0018 a6b1          	ld	a,#177
3733  001a 6b06          	ld	(OFST-49,sp),a
3734                     ; 529 	di.payload[1] =	sc.deviceid[0];
3736  001c c60092        	ld	a,_sc+2
3737  001f 6b07          	ld	(OFST-48,sp),a
3738                     ; 530 	di.payload[2] =	sc.deviceid[0];
3740  0021 c60092        	ld	a,_sc+2
3741  0024 6b08          	ld	(OFST-47,sp),a
3742                     ; 531 	di.payload[3] =	sc.deviceid[0];
3744  0026 c60092        	ld	a,_sc+2
3745  0029 6b09          	ld	(OFST-46,sp),a
3746                     ; 532 	di.payload[4] =	sc.deviceid[0];
3748  002b c60092        	ld	a,_sc+2
3749  002e 6b0a          	ld	(OFST-45,sp),a
3750                     ; 533 	di.payload[5] =	sc.model;
3752  0030 c60098        	ld	a,_sc+8
3753  0033 6b0b          	ld	(OFST-44,sp),a
3754                     ; 534 	di.payload[6] = sc.firmware;
3756  0035 c60096        	ld	a,_sc+6
3757  0038 6b0c          	ld	(OFST-43,sp),a
3758                     ; 535 	di.payload[7] = sc.HWTtest;
3760  003a c60097        	ld	a,_sc+7
3761  003d 6b0d          	ld	(OFST-42,sp),a
3762                     ; 536 	di.payload[8] = sc.Ndevice;
3764  003f c600a3        	ld	a,_sc+19
3765  0042 6b0e          	ld	(OFST-41,sp),a
3766                     ; 537 	sicp_send_message(&di,9);
3768  0044 4b09          	push	#9
3769  0046 96            	ldw	x,sp
3770  0047 1c0002        	addw	x,#OFST-53
3771  004a cd0000        	call	_sicp_send_message
3773  004d 84            	pop	a
3774                     ; 538 }
3777  004e 5b37          	addw	sp,#55
3778  0050 81            	ret
3825                     ; 540 void send_slc_device_info(u8 i)
3825                     ; 541 {
3826                     .text:	section	.text,new
3827  0000               _send_slc_device_info:
3829  0000 88            	push	a
3830  0001 5237          	subw	sp,#55
3831       00000037      OFST:	set	55
3834                     ; 543 	di.frame_h1 = 0xEE;
3836  0003 a6ee          	ld	a,#238
3837  0005 6b01          	ld	(OFST-54,sp),a
3838                     ; 544 	di.frame_h2 = 0xEE;
3840  0007 a6ee          	ld	a,#238
3841  0009 6b02          	ld	(OFST-53,sp),a
3842                     ; 545 	di.message_id = 21+i;
3844  000b 7b38          	ld	a,(OFST+1,sp)
3845  000d ab15          	add	a,#21
3846  000f 6b03          	ld	(OFST-52,sp),a
3847                     ; 546 	di.mesh_id_H = ns_own_meshid_H;
3849  0011 c6008c        	ld	a,_ns_own_meshid_H
3850  0014 6b04          	ld	(OFST-51,sp),a
3851                     ; 547 	di.mesh_id_L = ns_own_meshid_L;
3853  0016 c6008b        	ld	a,_ns_own_meshid_L
3854  0019 6b05          	ld	(OFST-50,sp),a
3855                     ; 548 	di.payload[0] = 0xB2;
3857  001b a6b2          	ld	a,#178
3858  001d 6b06          	ld	(OFST-49,sp),a
3859                     ; 549 	di.payload[1] =	sc.slc[i].deviceid[0];
3861  001f 7b38          	ld	a,(OFST+1,sp)
3862  0021 97            	ld	xl,a
3863  0022 a61a          	ld	a,#26
3864  0024 42            	mul	x,a
3865  0025 d6024f        	ld	a,(_sc+447,x)
3866  0028 6b07          	ld	(OFST-48,sp),a
3867                     ; 550 	di.payload[2] =	sc.slc[i].deviceid[0];
3869  002a 7b38          	ld	a,(OFST+1,sp)
3870  002c 97            	ld	xl,a
3871  002d a61a          	ld	a,#26
3872  002f 42            	mul	x,a
3873  0030 d6024f        	ld	a,(_sc+447,x)
3874  0033 6b08          	ld	(OFST-47,sp),a
3875                     ; 551 	di.payload[3] =	sc.slc[i].deviceid[0];
3877  0035 7b38          	ld	a,(OFST+1,sp)
3878  0037 97            	ld	xl,a
3879  0038 a61a          	ld	a,#26
3880  003a 42            	mul	x,a
3881  003b d6024f        	ld	a,(_sc+447,x)
3882  003e 6b09          	ld	(OFST-46,sp),a
3883                     ; 552 	di.payload[4] =	sc.slc[i].deviceid[0];
3885  0040 7b38          	ld	a,(OFST+1,sp)
3886  0042 97            	ld	xl,a
3887  0043 a61a          	ld	a,#26
3888  0045 42            	mul	x,a
3889  0046 d6024f        	ld	a,(_sc+447,x)
3890  0049 6b0a          	ld	(OFST-45,sp),a
3891                     ; 553 	di.payload[5] =	sc.slc[i].model;
3893  004b 7b38          	ld	a,(OFST+1,sp)
3894  004d 97            	ld	xl,a
3895  004e a61a          	ld	a,#26
3896  0050 42            	mul	x,a
3897  0051 d60255        	ld	a,(_sc+453,x)
3898  0054 6b0b          	ld	(OFST-44,sp),a
3899                     ; 554 	di.payload[6] = sc.slc[i].firmware;
3901  0056 7b38          	ld	a,(OFST+1,sp)
3902  0058 97            	ld	xl,a
3903  0059 a61a          	ld	a,#26
3904  005b 42            	mul	x,a
3905  005c d60253        	ld	a,(_sc+451,x)
3906  005f 6b0c          	ld	(OFST-43,sp),a
3907                     ; 555 	di.payload[7] = sc.slc[i].HWTtest;
3909  0061 7b38          	ld	a,(OFST+1,sp)
3910  0063 97            	ld	xl,a
3911  0064 a61a          	ld	a,#26
3912  0066 42            	mul	x,a
3913  0067 d60254        	ld	a,(_sc+452,x)
3914  006a 6b0d          	ld	(OFST-42,sp),a
3915                     ; 556 	di.payload[8] = 0x00;
3917  006c 0f0e          	clr	(OFST-41,sp)
3918                     ; 557 	sicp_send_message(&di,9);
3920  006e 4b09          	push	#9
3921  0070 96            	ldw	x,sp
3922  0071 1c0002        	addw	x,#OFST-53
3923  0074 cd0000        	call	_sicp_send_message
3925  0077 84            	pop	a
3926                     ; 558 }
3929  0078 5b38          	addw	sp,#56
3930  007a 81            	ret
3977                     ; 560 void send_spc_device_info(u8 i)
3977                     ; 561 {
3978                     .text:	section	.text,new
3979  0000               _send_spc_device_info:
3981  0000 88            	push	a
3982  0001 5237          	subw	sp,#55
3983       00000037      OFST:	set	55
3986                     ; 563 	di.frame_h1 = 0xEE;
3988  0003 a6ee          	ld	a,#238
3989  0005 6b01          	ld	(OFST-54,sp),a
3990                     ; 564 	di.frame_h2 = 0xEE;
3992  0007 a6ee          	ld	a,#238
3993  0009 6b02          	ld	(OFST-53,sp),a
3994                     ; 565 	di.message_id = 36+i;
3996  000b 7b38          	ld	a,(OFST+1,sp)
3997  000d ab24          	add	a,#36
3998  000f 6b03          	ld	(OFST-52,sp),a
3999                     ; 566 	di.mesh_id_H = ns_own_meshid_H;
4001  0011 c6008c        	ld	a,_ns_own_meshid_H
4002  0014 6b04          	ld	(OFST-51,sp),a
4003                     ; 567 	di.mesh_id_L = ns_own_meshid_L;
4005  0016 c6008b        	ld	a,_ns_own_meshid_L
4006  0019 6b05          	ld	(OFST-50,sp),a
4007                     ; 568 	di.payload[0] = 0xB3;
4009  001b a6b3          	ld	a,#179
4010  001d 6b06          	ld	(OFST-49,sp),a
4011                     ; 569 	di.payload[1] =	sc.spc[i].deviceid[0];
4013  001f 7b38          	ld	a,(OFST+1,sp)
4014  0021 97            	ld	xl,a
4015  0022 a61c          	ld	a,#28
4016  0024 42            	mul	x,a
4017  0025 d600ab        	ld	a,(_sc+27,x)
4018  0028 6b07          	ld	(OFST-48,sp),a
4019                     ; 570 	di.payload[2] =	sc.spc[i].deviceid[0];
4021  002a 7b38          	ld	a,(OFST+1,sp)
4022  002c 97            	ld	xl,a
4023  002d a61c          	ld	a,#28
4024  002f 42            	mul	x,a
4025  0030 d600ab        	ld	a,(_sc+27,x)
4026  0033 6b08          	ld	(OFST-47,sp),a
4027                     ; 571 	di.payload[3] =	sc.spc[i].deviceid[0];
4029  0035 7b38          	ld	a,(OFST+1,sp)
4030  0037 97            	ld	xl,a
4031  0038 a61c          	ld	a,#28
4032  003a 42            	mul	x,a
4033  003b d600ab        	ld	a,(_sc+27,x)
4034  003e 6b09          	ld	(OFST-46,sp),a
4035                     ; 572 	di.payload[4] =	sc.spc[i].deviceid[0];
4037  0040 7b38          	ld	a,(OFST+1,sp)
4038  0042 97            	ld	xl,a
4039  0043 a61c          	ld	a,#28
4040  0045 42            	mul	x,a
4041  0046 d600ab        	ld	a,(_sc+27,x)
4042  0049 6b0a          	ld	(OFST-45,sp),a
4043                     ; 573 	di.payload[5] =	sc.spc[i].model;
4045  004b 7b38          	ld	a,(OFST+1,sp)
4046  004d 97            	ld	xl,a
4047  004e a61c          	ld	a,#28
4048  0050 42            	mul	x,a
4049  0051 d600b1        	ld	a,(_sc+33,x)
4050  0054 6b0b          	ld	(OFST-44,sp),a
4051                     ; 574 	di.payload[6] = sc.spc[i].firmware;
4053  0056 7b38          	ld	a,(OFST+1,sp)
4054  0058 97            	ld	xl,a
4055  0059 a61c          	ld	a,#28
4056  005b 42            	mul	x,a
4057  005c d600af        	ld	a,(_sc+31,x)
4058  005f 6b0c          	ld	(OFST-43,sp),a
4059                     ; 575 	di.payload[7] = sc.spc[i].HWTtest;
4061  0061 7b38          	ld	a,(OFST+1,sp)
4062  0063 97            	ld	xl,a
4063  0064 a61c          	ld	a,#28
4064  0066 42            	mul	x,a
4065  0067 d600b0        	ld	a,(_sc+32,x)
4066  006a 6b0d          	ld	(OFST-42,sp),a
4067                     ; 576 	di.payload[8] = 0x00;
4069  006c 0f0e          	clr	(OFST-41,sp)
4070                     ; 577 	sicp_send_message(&di,9);
4072  006e 4b09          	push	#9
4073  0070 96            	ldw	x,sp
4074  0071 1c0002        	addw	x,#OFST-53
4075  0074 cd0000        	call	_sicp_send_message
4077  0077 84            	pop	a
4078                     ; 578 }
4081  0078 5b38          	addw	sp,#56
4082  007a 81            	ret
4119                     ; 580 void send_device_info(void)
4119                     ; 581 {
4120                     .text:	section	.text,new
4121  0000               _send_device_info:
4123  0000 88            	push	a
4124       00000001      OFST:	set	1
4127                     ; 584 	send_sc_device_info();
4129  0001 cd0000        	call	_send_sc_device_info
4131                     ; 586 	for(i = 0; i < 15;i++){
4133  0004 0f01          	clr	(OFST+0,sp)
4134  0006               L7551:
4135                     ; 587 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4137  0006 7b01          	ld	a,(OFST+0,sp)
4138  0008 97            	ld	xl,a
4139  0009 a61a          	ld	a,#26
4140  000b 42            	mul	x,a
4141  000c d60261        	ld	a,(_sc+465,x)
4142  000f da0260        	or	a,(_sc+464,x)
4143  0012 2705          	jreq	L5651
4144                     ; 588 			send_slc_device_info(i);
4146  0014 7b01          	ld	a,(OFST+0,sp)
4147  0016 cd0000        	call	_send_slc_device_info
4149  0019               L5651:
4150                     ; 586 	for(i = 0; i < 15;i++){
4152  0019 0c01          	inc	(OFST+0,sp)
4155  001b 7b01          	ld	a,(OFST+0,sp)
4156  001d a10f          	cp	a,#15
4157  001f 25e5          	jrult	L7551
4158                     ; 592 	for(i = 0; i < 15;i++){
4160  0021 0f01          	clr	(OFST+0,sp)
4161  0023               L7651:
4162                     ; 593 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4164  0023 7b01          	ld	a,(OFST+0,sp)
4165  0025 97            	ld	xl,a
4166  0026 a61c          	ld	a,#28
4167  0028 42            	mul	x,a
4168  0029 d600bd        	ld	a,(_sc+45,x)
4169  002c da00bc        	or	a,(_sc+44,x)
4170  002f 2705          	jreq	L5751
4171                     ; 594 			send_spc_device_info(i);
4173  0031 7b01          	ld	a,(OFST+0,sp)
4174  0033 cd0000        	call	_send_spc_device_info
4176  0036               L5751:
4177                     ; 592 	for(i = 0; i < 15;i++){
4179  0036 0c01          	inc	(OFST+0,sp)
4182  0038 7b01          	ld	a,(OFST+0,sp)
4183  003a a10f          	cp	a,#15
4184  003c 25e5          	jrult	L7651
4185                     ; 597 	di_timeout = 5;
4187  003e 35050001      	mov	_di_timeout,#5
4188                     ; 598 }
4191  0042 84            	pop	a
4192  0043 81            	ret
4238                     ; 601 void send_malfunction(void)
4238                     ; 602 {
4239                     .text:	section	.text,new
4240  0000               _send_malfunction:
4242  0000 5238          	subw	sp,#56
4243       00000038      OFST:	set	56
4246                     ; 606 	if(sc.HWTtest){
4248  0002 725d0097      	tnz	_sc+7
4249  0006 272f          	jreq	L7161
4250                     ; 607 		mal.frame_h1 = 0xEE;
4252  0008 a6ee          	ld	a,#238
4253  000a 6b02          	ld	(OFST-54,sp),a
4254                     ; 608 		mal.frame_h2 = 0xEE;
4256  000c a6ee          	ld	a,#238
4257  000e 6b03          	ld	(OFST-53,sp),a
4258                     ; 609 		mal.message_id = 17;
4260  0010 a611          	ld	a,#17
4261  0012 6b04          	ld	(OFST-52,sp),a
4262                     ; 610 		mal.mesh_id_H = ns_own_meshid_H;
4264  0014 c6008c        	ld	a,_ns_own_meshid_H
4265  0017 6b05          	ld	(OFST-51,sp),a
4266                     ; 611 		mal.mesh_id_L = ns_own_meshid_L;
4268  0019 c6008b        	ld	a,_ns_own_meshid_L
4269  001c 6b06          	ld	(OFST-50,sp),a
4270                     ; 612 		mal.payload[0] = 0x0A;
4272  001e a60a          	ld	a,#10
4273  0020 6b07          	ld	(OFST-49,sp),a
4274                     ; 613 		mal.payload[1] = 0xB1;
4276  0022 a6b1          	ld	a,#177
4277  0024 6b08          	ld	(OFST-48,sp),a
4278                     ; 614 		mal.payload[2] =	0x00;
4280  0026 0f09          	clr	(OFST-47,sp)
4281                     ; 615 		mal.payload[3] =	sc.HWTtest;
4283  0028 c60097        	ld	a,_sc+7
4284  002b 6b0a          	ld	(OFST-46,sp),a
4285                     ; 616 		sicp_send_message(&mal,4);
4287  002d 4b04          	push	#4
4288  002f 96            	ldw	x,sp
4289  0030 1c0003        	addw	x,#OFST-53
4290  0033 cd0000        	call	_sicp_send_message
4292  0036 84            	pop	a
4293  0037               L7161:
4294                     ; 619 	for(i = 0; i < 15;i++){
4296  0037 0f01          	clr	(OFST-55,sp)
4297  0039               L1261:
4298                     ; 620 		if((sc.slc[i].MDID)&&(sc.slc[i].HWTtest)){	//send_slc_malfunction(i);
4300  0039 7b01          	ld	a,(OFST-55,sp)
4301  003b 97            	ld	xl,a
4302  003c a61a          	ld	a,#26
4303  003e 42            	mul	x,a
4304  003f d60261        	ld	a,(_sc+465,x)
4305  0042 da0260        	or	a,(_sc+464,x)
4306  0045 274c          	jreq	L7261
4308  0047 7b01          	ld	a,(OFST-55,sp)
4309  0049 97            	ld	xl,a
4310  004a a61a          	ld	a,#26
4311  004c 42            	mul	x,a
4312  004d 724d0254      	tnz	(_sc+452,x)
4313  0051 2740          	jreq	L7261
4314                     ; 621 			mal.frame_h1 = 0xEE;
4316  0053 a6ee          	ld	a,#238
4317  0055 6b02          	ld	(OFST-54,sp),a
4318                     ; 622 			mal.frame_h2 = 0xEE;
4320  0057 a6ee          	ld	a,#238
4321  0059 6b03          	ld	(OFST-53,sp),a
4322                     ; 623 			mal.message_id = 51+i;
4324  005b 7b01          	ld	a,(OFST-55,sp)
4325  005d ab33          	add	a,#51
4326  005f 6b04          	ld	(OFST-52,sp),a
4327                     ; 624 			mal.mesh_id_H = ns_own_meshid_H;
4329  0061 c6008c        	ld	a,_ns_own_meshid_H
4330  0064 6b05          	ld	(OFST-51,sp),a
4331                     ; 625 			mal.mesh_id_L = ns_own_meshid_L;
4333  0066 c6008b        	ld	a,_ns_own_meshid_L
4334  0069 6b06          	ld	(OFST-50,sp),a
4335                     ; 626 			mal.payload[0] = 0x0A;
4337  006b a60a          	ld	a,#10
4338  006d 6b07          	ld	(OFST-49,sp),a
4339                     ; 627 			mal.payload[1] = 0xB2;
4341  006f a6b2          	ld	a,#178
4342  0071 6b08          	ld	(OFST-48,sp),a
4343                     ; 628 			mal.payload[2] =	sc.slc[i].MDID;
4345  0073 7b01          	ld	a,(OFST-55,sp)
4346  0075 97            	ld	xl,a
4347  0076 a61a          	ld	a,#26
4348  0078 42            	mul	x,a
4349  0079 d60261        	ld	a,(_sc+465,x)
4350  007c 6b09          	ld	(OFST-47,sp),a
4351                     ; 629 			mal.payload[3] =	sc.slc[i].HWTtest;
4353  007e 7b01          	ld	a,(OFST-55,sp)
4354  0080 97            	ld	xl,a
4355  0081 a61a          	ld	a,#26
4356  0083 42            	mul	x,a
4357  0084 d60254        	ld	a,(_sc+452,x)
4358  0087 6b0a          	ld	(OFST-46,sp),a
4359                     ; 630 			sicp_send_message(&mal,4);
4361  0089 4b04          	push	#4
4362  008b 96            	ldw	x,sp
4363  008c 1c0003        	addw	x,#OFST-53
4364  008f cd0000        	call	_sicp_send_message
4366  0092 84            	pop	a
4367  0093               L7261:
4368                     ; 619 	for(i = 0; i < 15;i++){
4370  0093 0c01          	inc	(OFST-55,sp)
4373  0095 7b01          	ld	a,(OFST-55,sp)
4374  0097 a10f          	cp	a,#15
4375  0099 259e          	jrult	L1261
4376                     ; 634 	for(i = 0; i < 15;i++){
4378  009b 0f01          	clr	(OFST-55,sp)
4379  009d               L1361:
4380                     ; 635 		if((sc.spc[i].MDID)&&(sc.spc[i].HWTtest)){	//send_spc_malfunction(i);
4382  009d 7b01          	ld	a,(OFST-55,sp)
4383  009f 97            	ld	xl,a
4384  00a0 a61c          	ld	a,#28
4385  00a2 42            	mul	x,a
4386  00a3 d600bd        	ld	a,(_sc+45,x)
4387  00a6 da00bc        	or	a,(_sc+44,x)
4388  00a9 274c          	jreq	L7361
4390  00ab 7b01          	ld	a,(OFST-55,sp)
4391  00ad 97            	ld	xl,a
4392  00ae a61c          	ld	a,#28
4393  00b0 42            	mul	x,a
4394  00b1 724d00b0      	tnz	(_sc+32,x)
4395  00b5 2740          	jreq	L7361
4396                     ; 636 			mal.frame_h1 = 0xEE;
4398  00b7 a6ee          	ld	a,#238
4399  00b9 6b02          	ld	(OFST-54,sp),a
4400                     ; 637 			mal.frame_h2 = 0xEE;
4402  00bb a6ee          	ld	a,#238
4403  00bd 6b03          	ld	(OFST-53,sp),a
4404                     ; 638 			mal.message_id = 66+i;
4406  00bf 7b01          	ld	a,(OFST-55,sp)
4407  00c1 ab42          	add	a,#66
4408  00c3 6b04          	ld	(OFST-52,sp),a
4409                     ; 639 			mal.mesh_id_H = ns_own_meshid_H;
4411  00c5 c6008c        	ld	a,_ns_own_meshid_H
4412  00c8 6b05          	ld	(OFST-51,sp),a
4413                     ; 640 			mal.mesh_id_L = ns_own_meshid_L;
4415  00ca c6008b        	ld	a,_ns_own_meshid_L
4416  00cd 6b06          	ld	(OFST-50,sp),a
4417                     ; 641 			mal.payload[0] = 0x0A;
4419  00cf a60a          	ld	a,#10
4420  00d1 6b07          	ld	(OFST-49,sp),a
4421                     ; 642 			mal.payload[1] = 0xB2;
4423  00d3 a6b2          	ld	a,#178
4424  00d5 6b08          	ld	(OFST-48,sp),a
4425                     ; 643 			mal.payload[2] =	sc.spc[i].MDID;
4427  00d7 7b01          	ld	a,(OFST-55,sp)
4428  00d9 97            	ld	xl,a
4429  00da a61c          	ld	a,#28
4430  00dc 42            	mul	x,a
4431  00dd d600bd        	ld	a,(_sc+45,x)
4432  00e0 6b09          	ld	(OFST-47,sp),a
4433                     ; 644 			mal.payload[3] =	sc.spc[i].HWTtest;
4435  00e2 7b01          	ld	a,(OFST-55,sp)
4436  00e4 97            	ld	xl,a
4437  00e5 a61c          	ld	a,#28
4438  00e7 42            	mul	x,a
4439  00e8 d600b0        	ld	a,(_sc+32,x)
4440  00eb 6b0a          	ld	(OFST-46,sp),a
4441                     ; 645 			sicp_send_message(&mal,4);
4443  00ed 4b04          	push	#4
4444  00ef 96            	ldw	x,sp
4445  00f0 1c0003        	addw	x,#OFST-53
4446  00f3 cd0000        	call	_sicp_send_message
4448  00f6 84            	pop	a
4449  00f7               L7361:
4450                     ; 634 	for(i = 0; i < 15;i++){
4452  00f7 0c01          	inc	(OFST-55,sp)
4455  00f9 7b01          	ld	a,(OFST-55,sp)
4456  00fb a10f          	cp	a,#15
4457  00fd 259e          	jrult	L1361
4458                     ; 648 }
4461  00ff 5b38          	addw	sp,#56
4462  0101 81            	ret
4500                     ; 651 void check_send_repeatedly(void){
4501                     .text:	section	.text,new
4502  0000               _check_send_repeatedly:
4504  0000 88            	push	a
4505       00000001      OFST:	set	1
4508                     ; 654 	if(di_timeout){
4510  0001 725d0001      	tnz	_di_timeout
4511  0005 2766          	jreq	L5561
4512                     ; 655 		if(--di_timeout == 0){
4514  0007 725a0001      	dec	_di_timeout
4515  000b 2660          	jrne	L5561
4516                     ; 656 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4518  000d c603d3        	ld	a,_sc+835
4519  0010 a502          	bcp	a,#2
4520  0012 2607          	jrne	L1661
4523  0014 cd0000        	call	_send_sc_device_info
4527  0017 35050001      	mov	_di_timeout,#5
4528  001b               L1661:
4529                     ; 657 			for(i = 0; i < 15; i++){
4531  001b 0f01          	clr	(OFST+0,sp)
4532  001d               L3661:
4533                     ; 658 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4535  001d 7b01          	ld	a,(OFST+0,sp)
4536  001f 97            	ld	xl,a
4537  0020 a61a          	ld	a,#26
4538  0022 42            	mul	x,a
4539  0023 d60261        	ld	a,(_sc+465,x)
4540  0026 da0260        	or	a,(_sc+464,x)
4541  0029 2716          	jreq	L1761
4543  002b 7b01          	ld	a,(OFST+0,sp)
4544  002d 97            	ld	xl,a
4545  002e a61a          	ld	a,#26
4546  0030 42            	mul	x,a
4547  0031 d60266        	ld	a,(_sc+470,x)
4548  0034 a502          	bcp	a,#2
4549  0036 2609          	jrne	L1761
4552  0038 7b01          	ld	a,(OFST+0,sp)
4553  003a cd0000        	call	_send_slc_device_info
4557  003d 35050001      	mov	_di_timeout,#5
4558  0041               L1761:
4559                     ; 659 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4561  0041 7b01          	ld	a,(OFST+0,sp)
4562  0043 97            	ld	xl,a
4563  0044 a61c          	ld	a,#28
4564  0046 42            	mul	x,a
4565  0047 d600bd        	ld	a,(_sc+45,x)
4566  004a da00bc        	or	a,(_sc+44,x)
4567  004d 2716          	jreq	L3761
4569  004f 7b01          	ld	a,(OFST+0,sp)
4570  0051 97            	ld	xl,a
4571  0052 a61c          	ld	a,#28
4572  0054 42            	mul	x,a
4573  0055 d600c4        	ld	a,(_sc+52,x)
4574  0058 a502          	bcp	a,#2
4575  005a 2609          	jrne	L3761
4578  005c 7b01          	ld	a,(OFST+0,sp)
4579  005e cd0000        	call	_send_spc_device_info
4583  0061 35050001      	mov	_di_timeout,#5
4584  0065               L3761:
4585                     ; 657 			for(i = 0; i < 15; i++){
4587  0065 0c01          	inc	(OFST+0,sp)
4590  0067 7b01          	ld	a,(OFST+0,sp)
4591  0069 a10f          	cp	a,#15
4592  006b 25b0          	jrult	L3661
4593  006d               L5561:
4594                     ; 663 }
4597  006d 84            	pop	a
4598  006e 81            	ret
4611                     	xdef	_send_spc_device_info
4612                     	xdef	_send_slc_device_info
4613                     	xdef	_send_sc_device_info
4614                     	xdef	_clear_uart_buf
4615                     	xdef	_Uart2_Send
4616                     	xdef	_delay
4617                     	xref	_rand
4618                     	xref	_i2c_multiple_action_dimmer
4619                     	xref	_i2c_action_plug
4620                     	xref	_i2c_single_action_dimmer
4621                     	xref	_i2c_get_energy_consum
4622                     	xref	_systime_count
4623                     	xref	_init_slc_spc_done
4624                     	xref	_sys_init
4625                     	xdef	_check_send_repeatedly
4626                     	xdef	_send_malfunction
4627                     	xdef	_send_device_info
4628                     	xdef	_report_energy_consum
4629                     	xdef	_rev_cmd_data
4630                     	xdef	_sicp_receipt_Done
4631                     	xdef	_sicp_receipt_OK
4632                     	xdef	_sicp_send_message
4633                     	xdef	_random
4634                     	xdef	_rev_deal
4635                     	xdef	_Check_Sum
4636                     	xdef	_rev_anaylze
4637                     	xdef	_UART2_RX_ISR
4638                     	xdef	_UART2_TX_ISR
4639                     	xdef	_Init_uart2
4640                     	xdef	_mymemcpy
4641                     	switch	.bss
4642  0000               _mal_timeout:
4643  0000 00            	ds.b	1
4644                     	xdef	_mal_timeout
4645  0001               _di_timeout:
4646  0001 00            	ds.b	1
4647                     	xdef	_di_timeout
4648  0002               _send_failed_count:
4649  0002 0000          	ds.b	2
4650                     	xdef	_send_failed_count
4651  0004               _send_fault_count:
4652  0004 0000          	ds.b	2
4653                     	xdef	_send_fault_count
4654  0006               _sicp_buf:
4655  0006 000000000000  	ds.b	40
4656                     	xdef	_sicp_buf
4657  002e               _Uart2_Rec_Cnt:
4658  002e 00            	ds.b	1
4659                     	xdef	_Uart2_Rec_Cnt
4660  002f               _Uart2_Rece_Buf:
4661  002f 000000000000  	ds.b	40
4662                     	xdef	_Uart2_Rece_Buf
4663  0057               _Uart2_Send_Done:
4664  0057 00            	ds.b	1
4665                     	xdef	_Uart2_Send_Done
4666  0058               _Uart2_Send_Cnt:
4667  0058 00            	ds.b	1
4668                     	xdef	_Uart2_Send_Cnt
4669  0059               _Uart2_Send_Length:
4670  0059 00            	ds.b	1
4671                     	xdef	_Uart2_Send_Length
4672  005a               _UART2_Send_Buf:
4673  005a 000000000000  	ds.b	40
4674                     	xdef	_UART2_Send_Buf
4675  0082               _rev_channel2:
4676  0082 00            	ds.b	1
4677                     	xdef	_rev_channel2
4678  0083               _rev_mdid2:
4679  0083 00            	ds.b	1
4680                     	xdef	_rev_mdid2
4681  0084               _rev_channel:
4682  0084 00            	ds.b	1
4683                     	xdef	_rev_channel
4684  0085               _rev_mdid:
4685  0085 00            	ds.b	1
4686                     	xdef	_rev_mdid
4687  0086               _rev_mesh_id_L:
4688  0086 00            	ds.b	1
4689                     	xdef	_rev_mesh_id_L
4690  0087               _rev_mesh_id_H:
4691  0087 00            	ds.b	1
4692                     	xdef	_rev_mesh_id_H
4693  0088               _rev_message_id:
4694  0088 00            	ds.b	1
4695                     	xdef	_rev_message_id
4696  0089               _ns_host_meshid_L:
4697  0089 00            	ds.b	1
4698                     	xdef	_ns_host_meshid_L
4699  008a               _ns_host_meshid_H:
4700  008a 00            	ds.b	1
4701                     	xdef	_ns_host_meshid_H
4702  008b               _ns_own_meshid_L:
4703  008b 00            	ds.b	1
4704                     	xdef	_ns_own_meshid_L
4705  008c               _ns_own_meshid_H:
4706  008c 00            	ds.b	1
4707                     	xdef	_ns_own_meshid_H
4708  008d               _ns_phonenum:
4709  008d 00            	ds.b	1
4710                     	xdef	_ns_phonenum
4711  008e               _ns_status:
4712  008e 00            	ds.b	1
4713                     	xdef	_ns_status
4714  008f               _ns_signal:
4715  008f 00            	ds.b	1
4716                     	xdef	_ns_signal
4717  0090               _sc:
4718  0090 000000000000  	ds.b	836
4719                     	xdef	_sc
4720  03d4               _UART1Flag6_:
4721  03d4 00            	ds.b	1
4722                     	xdef	_UART1Flag6_
4723  03d5               _UART1Flag5_:
4724  03d5 00            	ds.b	1
4725                     	xdef	_UART1Flag5_
4726  03d6               _UART1Flag4_:
4727  03d6 00            	ds.b	1
4728                     	xdef	_UART1Flag4_
4729  03d7               _UART1Flag3_:
4730  03d7 00            	ds.b	1
4731                     	xdef	_UART1Flag3_
4732  03d8               _UART1Flag2_:
4733  03d8 00            	ds.b	1
4734                     	xdef	_UART1Flag2_
4735  03d9               _UART1Flag1_:
4736  03d9 00            	ds.b	1
4737                     	xdef	_UART1Flag1_
4738                     	xref	_UART2_ITConfig
4739                     	xref	_UART2_Cmd
4740                     	xref	_UART2_Init
4741                     	xref	_UART2_DeInit
4742                     	xref.b	c_lreg
4743                     	xref.b	c_x
4744                     	xref.b	c_y
4764                     	xref	c_idiv
4765                     	xref	c_lrzmp
4766                     	xref	c_lgsbc
4767                     	xref	c_ltor
4768                     	end
