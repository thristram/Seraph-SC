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
1494  0020 cc012b        	jp	L327
1495  0023               L62:
1496  0023 4a            	dec	a
1497  0024 2603          	jrne	L03
1498  0026 cc012b        	jp	L327
1499  0029               L03:
1500  0029 4a            	dec	a
1501  002a 2603          	jrne	L23
1502  002c cc012b        	jp	L327
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
1520  0042 cc012b        	jp	L327
1521  0045               L43:
1523  0045 7b02          	ld	a,(OFST+0,sp)
1524  0047 a1dd          	cp	a,#221
1525  0049 2603          	jrne	L63
1526  004b cc012b        	jp	L327
1527  004e               L63:
1530  004e 725f002e      	clr	_Uart2_Rec_Cnt
1531  0052 ac2b012b      	jpf	L327
1532  0056               L566:
1533                     ; 162 		case 2:
1533                     ; 163 			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1535  0056 7b02          	ld	a,(OFST+0,sp)
1536  0058 a1ee          	cp	a,#238
1537  005a 2603          	jrne	L04
1538  005c cc012b        	jp	L327
1539  005f               L04:
1541  005f 7b02          	ld	a,(OFST+0,sp)
1542  0061 a1aa          	cp	a,#170
1543  0063 2603          	jrne	L24
1544  0065 cc012b        	jp	L327
1545  0068               L24:
1547  0068 7b02          	ld	a,(OFST+0,sp)
1548  006a a1dd          	cp	a,#221
1549  006c 2603          	jrne	L44
1550  006e cc012b        	jp	L327
1551  0071               L44:
1554  0071 725f002e      	clr	_Uart2_Rec_Cnt
1555  0075 ac2b012b      	jpf	L327
1556  0079               L137:
1557                     ; 179 			if ((Uart2_Rece_Buf[0] == 0xEE)&&((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA)))
1559  0079 c6002f        	ld	a,_Uart2_Rece_Buf
1560  007c a1ee          	cp	a,#238
1561  007e 2663          	jrne	L337
1563  0080 c60030        	ld	a,_Uart2_Rece_Buf+1
1564  0083 a1ee          	cp	a,#238
1565  0085 2707          	jreq	L537
1567  0087 c60030        	ld	a,_Uart2_Rece_Buf+1
1568  008a a1aa          	cp	a,#170
1569  008c 2655          	jrne	L337
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
1588                     ; 184 					check_sum = Check_Sum(Uart2_Rece_Buf+2,Uart2_Rece_Buf[5]);
1590  00aa 3b0034        	push	_Uart2_Rece_Buf+5
1591  00ad ae0031        	ldw	x,#_Uart2_Rece_Buf+2
1592  00b0 cd0000        	call	_Check_Sum
1594  00b3 5b01          	addw	sp,#1
1595  00b5 6b02          	ld	(OFST+0,sp),a
1596                     ; 186 					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2])//校验正确	
1598  00b7 c60034        	ld	a,_Uart2_Rece_Buf+5
1599  00ba 5f            	clrw	x
1600  00bb 97            	ld	xl,a
1601  00bc d60031        	ld	a,(_Uart2_Rece_Buf+2,x)
1602  00bf 1102          	cp	a,(OFST+0,sp)
1603  00c1 261a          	jrne	L147
1604                     ; 188 						rev_success = 1;
1606  00c3 721003d8      	bset	_UART1Flag1_,#0
1607                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1609  00c7 0f02          	clr	(OFST+0,sp)
1610  00c9               L347:
1611                     ; 191 							sicp_buf[i] = Uart2_Rece_Buf[i];
1613  00c9 7b02          	ld	a,(OFST+0,sp)
1614  00cb 5f            	clrw	x
1615  00cc 97            	ld	xl,a
1616  00cd d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1617  00d0 d70006        	ld	(_sicp_buf,x),a
1618                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1620  00d3 0c02          	inc	(OFST+0,sp)
1623  00d5 7b02          	ld	a,(OFST+0,sp)
1624  00d7 a128          	cp	a,#40
1625  00d9 25ee          	jrult	L347
1627  00db 204e          	jra	L327
1628  00dd               L147:
1629                     ; 196 						Uart2_Rec_Cnt = 0;
1631  00dd 725f002e      	clr	_Uart2_Rec_Cnt
1632  00e1 2048          	jra	L327
1633  00e3               L337:
1634                     ; 200 			else if((Uart2_Rece_Buf[0] == 0xDD)&&(Uart2_Rece_Buf[1] == 0xDD))
1636  00e3 c6002f        	ld	a,_Uart2_Rece_Buf
1637  00e6 a1dd          	cp	a,#221
1638  00e8 263d          	jrne	L557
1640  00ea c60030        	ld	a,_Uart2_Rece_Buf+1
1641  00ed a1dd          	cp	a,#221
1642  00ef 2636          	jrne	L557
1643                     ; 202 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 2)//接收数据完成
1645  00f1 9c            	rvf
1646  00f2 c6002e        	ld	a,_Uart2_Rec_Cnt
1647  00f5 5f            	clrw	x
1648  00f6 97            	ld	xl,a
1649  00f7 c60032        	ld	a,_Uart2_Rece_Buf+3
1650  00fa 905f          	clrw	y
1651  00fc 9097          	ld	yl,a
1652  00fe 905c          	incw	y
1653  0100 905c          	incw	y
1654  0102 bf01          	ldw	c_x+1,x
1655  0104 90b301        	cpw	y,c_x+1
1656  0107 2e22          	jrsge	L327
1657                     ; 204 					Uart2_Rec_Cnt = 0;
1659  0109 725f002e      	clr	_Uart2_Rec_Cnt
1660                     ; 205 					rev_success = 1;
1662  010d 721003d8      	bset	_UART1Flag1_,#0
1663                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1665  0111 0f02          	clr	(OFST+0,sp)
1666  0113               L167:
1667                     ; 208 						sicp_buf[i] = Uart2_Rece_Buf[i];
1669  0113 7b02          	ld	a,(OFST+0,sp)
1670  0115 5f            	clrw	x
1671  0116 97            	ld	xl,a
1672  0117 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1673  011a d70006        	ld	(_sicp_buf,x),a
1674                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1676  011d 0c02          	inc	(OFST+0,sp)
1679  011f 7b02          	ld	a,(OFST+0,sp)
1680  0121 a128          	cp	a,#40
1681  0123 25ee          	jrult	L167
1682  0125 2004          	jra	L327
1683  0127               L557:
1684                     ; 214 				Uart2_Rec_Cnt = 0;
1686  0127 725f002e      	clr	_Uart2_Rec_Cnt
1687  012b               L327:
1688                     ; 218 	if (UART2->SR & 0x20) //|| (UART2->SR & UART2_SR_OR))
1690  012b c65240        	ld	a,21056
1691  012e a520          	bcp	a,#32
1692  0130 2707          	jreq	L177
1693                     ; 220 		temp2 = UART2->DR;
1695  0132 7b01          	ld	a,(OFST-1,sp)
1696  0134 97            	ld	xl,a
1697  0135 c65241        	ld	a,21057
1698  0138 97            	ld	xl,a
1699  0139               L177:
1700                     ; 223 }
1703  0139 85            	popw	x
1704  013a 81            	ret
1738                     ; 225 void clear_uart_buf(void)
1738                     ; 226 {
1739                     .text:	section	.text,new
1740  0000               _clear_uart_buf:
1742  0000 88            	push	a
1743       00000001      OFST:	set	1
1746                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1748  0001 0f01          	clr	(OFST+0,sp)
1749  0003               L7001:
1750                     ; 230 		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
1752  0003 7b01          	ld	a,(OFST+0,sp)
1753  0005 5f            	clrw	x
1754  0006 97            	ld	xl,a
1755  0007 724f002f      	clr	(_Uart2_Rece_Buf,x)
1756  000b 7b01          	ld	a,(OFST+0,sp)
1757  000d 5f            	clrw	x
1758  000e 97            	ld	xl,a
1759  000f 724f0006      	clr	(_sicp_buf,x)
1760                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1762  0013 0c01          	inc	(OFST+0,sp)
1765  0015 7b01          	ld	a,(OFST+0,sp)
1766  0017 a128          	cp	a,#40
1767  0019 25e8          	jrult	L7001
1768                     ; 232 }
1771  001b 84            	pop	a
1772  001c 81            	ret
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
1921  0009 cc03b1        	jp	L7011
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
1964  0044 cc0347        	jp	L1211
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
2007  0089 acb103b1      	jpf	L7011
2008  008d               L5101:
2009                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2009                     ; 255 					if(sicp_buf[7] == 0x03){
2011  008d c6000d        	ld	a,_sicp_buf+7
2012  0090 a103          	cp	a,#3
2013  0092 2703          	jreq	L46
2014  0094 cc03b1        	jp	L7011
2015  0097               L46:
2016                     ; 256 						rev_cmd_data(sicp_buf[8]);
2018  0097 c6000e        	ld	a,_sicp_buf+8
2019  009a cd0000        	call	_rev_cmd_data
2021  009d acb103b1      	jpf	L7011
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
2059  00d9 cc03b1        	jp	L7011
2060  00dc               L66:
2063  00dc 3b008a        	push	_ns_own_meshid_L
2064  00df 3b008b        	push	_ns_own_meshid_H
2065  00e2 c60087        	ld	a,_rev_message_id
2066  00e5 97            	ld	xl,a
2067  00e6 a602          	ld	a,#2
2068  00e8 95            	ld	xh,a
2069  00e9 cd0000        	call	_sicp_receipt_OK
2071  00ec 85            	popw	x
2072  00ed acb103b1      	jpf	L7011
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
2098                     ; 277 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
2100  0118 0d04          	tnz	(OFST-55,sp)
2101  011a 2703          	jreq	L07
2102  011c cc03b1        	jp	L7011
2103  011f               L07:
2106  011f 3b0083        	push	_rev_ad_mdid
2107  0122 4b02          	push	#2
2108  0124 3b0088        	push	_ns_host_meshid_L
2109  0127 3b0089        	push	_ns_host_meshid_H
2110  012a c60087        	ld	a,_rev_message_id
2111  012d 97            	ld	xl,a
2112  012e a605          	ld	a,#5
2113  0130 95            	ld	xh,a
2114  0131 cd0000        	call	_sicp_receipt_Done
2116  0134 5b04          	addw	sp,#4
2117  0136 acb103b1      	jpf	L7011
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
2144  015b cc03b1        	jp	L7011
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
2299  0235 acb103b1      	jpf	L7011
2300  0239               L5201:
2301                     ; 305 				case 0xAA:
2301                     ; 306 					if(sicp_buf[7] == 0x02){
2303  0239 c6000d        	ld	a,_sicp_buf+7
2304  023c a102          	cp	a,#2
2305  023e 2703          	jreq	L67
2306  0240 cc03b1        	jp	L7011
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
2327  0262 acb103b1      	jpf	L7011
2328  0266               L1511:
2329                     ; 310 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2331  0266 c60087        	ld	a,_rev_message_id
2332  0269 a110          	cp	a,#16
2333  026b 2608          	jrne	L5511
2336  026d 721203d2      	bset	_sc+835,#1
2338  0271 acb103b1      	jpf	L7011
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
2360  0295 acb103b1      	jpf	L7011
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
2382  02b9 acb103b1      	jpf	L7011
2383  02bd               L5611:
2384                     ; 314 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2386  02bd c60087        	ld	a,_rev_message_id
2387  02c0 a111          	cp	a,#17
2388  02c2 2608          	jrne	L1711
2391  02c4 721403d2      	bset	_sc+835,#2
2393  02c8 acb103b1      	jpf	L7011
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
2415  02ec acb103b1      	jpf	L7011
2416  02f0               L5711:
2417                     ; 316 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2419  02f0 c60087        	ld	a,_rev_message_id
2420  02f3 a142          	cp	a,#66
2421  02f5 2403          	jruge	L001
2422  02f7 cc03b1        	jp	L7011
2423  02fa               L001:
2425  02fa c60087        	ld	a,_rev_message_id
2426  02fd a151          	cp	a,#81
2427  02ff 2503          	jrult	L201
2428  0301 cc03b1        	jp	L7011
2429  0304               L201:
2432  0304 c60087        	ld	a,_rev_message_id
2433  0307 97            	ld	xl,a
2434  0308 a61c          	ld	a,#28
2435  030a 42            	mul	x,a
2436  030b 1d0738        	subw	x,#1848
2437  030e d600c3        	ld	a,(_sc+52,x)
2438  0311 aa04          	or	a,#4
2439  0313 d700c3        	ld	(_sc+52,x),a
2440  0316 acb103b1      	jpf	L7011
2441  031a               L7201:
2442                     ; 319 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2442                     ; 320 				break;
2444  031a acb103b1      	jpf	L7011
2445  031e               L1301:
2446                     ; 321 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2446                     ; 322 					if(rev_message_id == 0x9E){
2448  031e c60087        	ld	a,_rev_message_id
2449  0321 a19e          	cp	a,#158
2450  0323 2703          	jreq	L401
2451  0325 cc03b1        	jp	L7011
2452  0328               L401:
2453                     ; 323 						ns_host_meshid_H = rev_mesh_id_H;
2455  0328 5500860089    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2456                     ; 324 						ns_host_meshid_L = rev_mesh_id_L;
2458  032d 5500850088    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2459                     ; 325 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2461  0332 3b0088        	push	_ns_host_meshid_L
2462  0335 3b0089        	push	_ns_host_meshid_H
2463  0338 c60087        	ld	a,_rev_message_id
2464  033b 97            	ld	xl,a
2465  033c a602          	ld	a,#2
2466  033e 95            	ld	xh,a
2467  033f cd0000        	call	_sicp_receipt_OK
2469  0342 85            	popw	x
2470  0343 206c          	jra	L7011
2471  0345               L5211:
2472                     ; 327 				break;
2473  0345 206a          	jra	L7011
2474  0347               L1211:
2475                     ; 330 		else if (ble_ctrl_frame){
2477  0347 c603d8        	ld	a,_UART1Flag1_
2478  034a a504          	bcp	a,#4
2479  034c 2763          	jreq	L7011
2480                     ; 331 			ble_ctrl_frame = 0;
2482  034e 721503d8      	bres	_UART1Flag1_,#2
2483                     ; 332 			switch(sicp_buf[4]){
2485  0352 c6000a        	ld	a,_sicp_buf+4
2487                     ; 363 				break;
2488  0355 4a            	dec	a
2489  0356 2708          	jreq	L3301
2490  0358 4a            	dec	a
2491  0359 2724          	jreq	L5301
2492  035b 4a            	dec	a
2493  035c 272d          	jreq	L7301
2494  035e 2051          	jra	L7011
2495  0360               L3301:
2496                     ; 333 				case 0x01://网络状态帧
2496                     ; 334 				rev_bleheartbeat = 1;
2498  0360 721203d7      	bset	_UART1Flag2_,#1
2499                     ; 335 				ns_signal = sicp_buf[5];
2501  0364 55000b008e    	mov	_ns_signal,_sicp_buf+5
2502                     ; 336 				ns_status = sicp_buf[6];
2504  0369 55000c008d    	mov	_ns_status,_sicp_buf+6
2505                     ; 337 				ns_phonenum = sicp_buf[7];
2507  036e 55000d008c    	mov	_ns_phonenum,_sicp_buf+7
2508                     ; 338 				ns_own_meshid_H = sicp_buf[8];
2510  0373 55000e008b    	mov	_ns_own_meshid_H,_sicp_buf+8
2511                     ; 339 				ns_own_meshid_L = sicp_buf[9];
2513  0378 55000f008a    	mov	_ns_own_meshid_L,_sicp_buf+9
2514                     ; 346 				break;
2516  037d 2032          	jra	L7011
2517  037f               L5301:
2518                     ; 347 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2518                     ; 348 				sys_init();
2520  037f cd0000        	call	_sys_init
2522                     ; 349 				clear_uart_buf();
2524  0382 cd0000        	call	_clear_uart_buf
2526                     ; 350 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2528  0385 725f0000      	clr	_init_slc_spc_done
2529                     ; 351 				break;
2531  0389 2026          	jra	L7011
2532  038b               L7301:
2533                     ; 352 			case 0x03://重置芯片和网络，退出mesh连接
2533                     ; 353 				sys_init();
2535  038b cd0000        	call	_sys_init
2537                     ; 354 				clear_uart_buf();
2539  038e cd0000        	call	_clear_uart_buf
2541                     ; 355 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2543  0391 725f0000      	clr	_init_slc_spc_done
2544                     ; 356 				ns_signal = 0x00;
2546  0395 725f008e      	clr	_ns_signal
2547                     ; 357 				ns_status = 0x00;
2549  0399 725f008d      	clr	_ns_status
2550                     ; 358 				ns_phonenum = 0x00;
2552  039d 725f008c      	clr	_ns_phonenum
2553                     ; 359 				ns_own_meshid_H = 0x00;
2555  03a1 725f008b      	clr	_ns_own_meshid_H
2556                     ; 360 				ns_own_meshid_L = 0x00;
2558  03a5 725f008a      	clr	_ns_own_meshid_L
2559                     ; 361 				ns_host_meshid_H = 0x80;
2561  03a9 35800089      	mov	_ns_host_meshid_H,#128
2562                     ; 362 				ns_host_meshid_L = 0xFF;
2564  03ad 35ff0088      	mov	_ns_host_meshid_L,#255
2565                     ; 363 				break;
2567  03b1               L3121:
2568  03b1               L7011:
2569                     ; 367 }
2572  03b1 5b3b          	addw	sp,#59
2573  03b3 81            	ret
2622                     ; 370 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2622                     ; 371 {
2623                     .text:	section	.text,new
2624  0000               _sicp_send_message:
2626  0000 89            	pushw	x
2627       00000000      OFST:	set	0
2630                     ; 374 	UART2_Send_Buf[0] = tx->frame_h1;
2632  0001 f6            	ld	a,(x)
2633  0002 c7005a        	ld	_UART2_Send_Buf,a
2634                     ; 375 	UART2_Send_Buf[1] = tx->frame_h2;
2636  0005 e601          	ld	a,(1,x)
2637  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2638                     ; 376 	UART2_Send_Buf[2] = tx->message_id;
2640  000a e602          	ld	a,(2,x)
2641  000c c7005c        	ld	_UART2_Send_Buf+2,a
2642                     ; 377 	UART2_Send_Buf[3] = tx->mesh_id_H;
2644  000f e603          	ld	a,(3,x)
2645  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2646                     ; 378 	UART2_Send_Buf[4] = tx->mesh_id_L;
2648  0014 e604          	ld	a,(4,x)
2649  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2650                     ; 379 	UART2_Send_Buf[5] = 4+payload_len;
2652  0019 7b05          	ld	a,(OFST+5,sp)
2653  001b ab04          	add	a,#4
2654  001d c7005f        	ld	_UART2_Send_Buf+5,a
2655                     ; 380 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2657  0020 7b05          	ld	a,(OFST+5,sp)
2658  0022 b703          	ld	c_lreg+3,a
2659  0024 3f02          	clr	c_lreg+2
2660  0026 3f01          	clr	c_lreg+1
2661  0028 3f00          	clr	c_lreg
2662  002a be02          	ldw	x,c_lreg+2
2663  002c 89            	pushw	x
2664  002d be00          	ldw	x,c_lreg
2665  002f 89            	pushw	x
2666  0030 1e05          	ldw	x,(OFST+5,sp)
2667  0032 1c0005        	addw	x,#5
2668  0035 89            	pushw	x
2669  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2670  0039 cd0000        	call	_mymemcpy
2672  003c 5b06          	addw	sp,#6
2673                     ; 381 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2675  003e 7b05          	ld	a,(OFST+5,sp)
2676  0040 5f            	clrw	x
2677  0041 97            	ld	xl,a
2678  0042 89            	pushw	x
2679  0043 3b005f        	push	_UART2_Send_Buf+5
2680  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2681  0049 cd0000        	call	_Check_Sum
2683  004c 5b01          	addw	sp,#1
2684  004e 85            	popw	x
2685  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2686                     ; 382 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2688  0052 7b05          	ld	a,(OFST+5,sp)
2689  0054 5f            	clrw	x
2690  0055 97            	ld	xl,a
2691  0056 1c0007        	addw	x,#7
2692  0059 89            	pushw	x
2693  005a ae005a        	ldw	x,#_UART2_Send_Buf
2694  005d cd0000        	call	_Uart2_Send
2696  0060 85            	popw	x
2698  0061               L1421:
2699                     ; 383 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2701  0061 725d0057      	tnz	_Uart2_Send_Done
2702  0065 27fa          	jreq	L1421
2705  0067 725f0057      	clr	_Uart2_Send_Done
2706                     ; 384 }
2709  006b 85            	popw	x
2710  006c 81            	ret
2762                     ; 390 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
2762                     ; 391 {
2763                     .text:	section	.text,new
2764  0000               _sicp_receipt_OK:
2766  0000 5237          	subw	sp,#55
2767       00000037      OFST:	set	55
2770                     ; 393 	receipt.frame_h1 = 0xEE;
2772  0002 a6ee          	ld	a,#238
2773  0004 6b01          	ld	(OFST-54,sp),a
2774                     ; 394 	receipt.frame_h2 = 0xAA;
2776  0006 a6aa          	ld	a,#170
2777  0008 6b02          	ld	(OFST-53,sp),a
2778                     ; 395 	receipt.message_id = send_message_id;
2780  000a 9f            	ld	a,xl
2781  000b 6b03          	ld	(OFST-52,sp),a
2782                     ; 396 	receipt.mesh_id_H = ns_host_meshid_H;
2784  000d c60089        	ld	a,_ns_host_meshid_H
2785  0010 6b04          	ld	(OFST-51,sp),a
2786                     ; 397 	receipt.mesh_id_L = ns_host_meshid_L;
2788  0012 c60088        	ld	a,_ns_host_meshid_L
2789  0015 6b05          	ld	(OFST-50,sp),a
2790                     ; 398 	receipt.payload[0] = 0xAA;
2792  0017 a6aa          	ld	a,#170
2793  0019 6b06          	ld	(OFST-49,sp),a
2794                     ; 399 	receipt.payload[1] = type;
2796  001b 9e            	ld	a,xh
2797  001c 6b07          	ld	(OFST-48,sp),a
2798                     ; 400 	sicp_send_message(&receipt,2);
2800  001e 4b02          	push	#2
2801  0020 96            	ldw	x,sp
2802  0021 1c0002        	addw	x,#OFST-53
2803  0024 cd0000        	call	_sicp_send_message
2805  0027 84            	pop	a
2806                     ; 401 }
2809  0028 5b37          	addw	sp,#55
2810  002a 81            	ret
2884                     ; 403 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
2884                     ; 404 {
2885                     .text:	section	.text,new
2886  0000               _sicp_receipt_Done:
2888  0000 89            	pushw	x
2889  0001 5238          	subw	sp,#56
2890       00000038      OFST:	set	56
2893                     ; 405 	u8 i = 0;
2895  0003 0f38          	clr	(OFST+0,sp)
2896                     ; 407 	receipt.frame_h1 = 0xEE;
2898  0005 a6ee          	ld	a,#238
2899  0007 6b01          	ld	(OFST-55,sp),a
2900                     ; 408 	receipt.frame_h2 = 0xAA;
2902  0009 a6aa          	ld	a,#170
2903  000b 6b02          	ld	(OFST-54,sp),a
2904                     ; 409 	receipt.message_id = send_message_id;
2906  000d 9f            	ld	a,xl
2907  000e 6b03          	ld	(OFST-53,sp),a
2908                     ; 410 	receipt.mesh_id_H = ns_host_meshid_H;
2910  0010 c60089        	ld	a,_ns_host_meshid_H
2911  0013 6b04          	ld	(OFST-52,sp),a
2912                     ; 411 	receipt.mesh_id_L = ns_host_meshid_L;
2914  0015 c60088        	ld	a,_ns_host_meshid_L
2915  0018 6b05          	ld	(OFST-51,sp),a
2916                     ; 412 	receipt.payload[0] = 0xAA;
2918  001a a6aa          	ld	a,#170
2919  001c 6b06          	ld	(OFST-50,sp),a
2920                     ; 413 	receipt.payload[1] = type;
2922  001e 9e            	ld	a,xh
2923  001f 6b07          	ld	(OFST-49,sp),a
2924                     ; 414 	switch(method){
2926  0021 7b3f          	ld	a,(OFST+7,sp)
2928                     ; 441 		default:
2928                     ; 442 		break;
2929  0023 4a            	dec	a
2930  0024 2707          	jreq	L7621
2931  0026 4a            	dec	a
2932  0027 2766          	jreq	L1721
2933  0029 acef00ef      	jpf	L7231
2934  002d               L7621:
2935                     ; 415 		case 0x01://action Dimmer调光的执行回执
2935                     ; 416 		receipt.payload[2] = mdid;
2937  002d 7b40          	ld	a,(OFST+8,sp)
2938  002f 6b08          	ld	(OFST-48,sp),a
2939                     ; 417 		for(i = 0;i < 15;i++){
2941  0031 0f38          	clr	(OFST+0,sp)
2942  0033               L1331:
2943                     ; 418 			if(sc.slc[i].MDID == mdid){
2945  0033 7b38          	ld	a,(OFST+0,sp)
2946  0035 97            	ld	xl,a
2947  0036 a61a          	ld	a,#26
2948  0038 42            	mul	x,a
2949  0039 7b40          	ld	a,(OFST+8,sp)
2950  003b 905f          	clrw	y
2951  003d 9097          	ld	yl,a
2952  003f 90bf00        	ldw	c_y,y
2953  0042 9093          	ldw	y,x
2954  0044 90de025f      	ldw	y,(_sc+464,y)
2955  0048 90b300        	cpw	y,c_y
2956  004b 2638          	jrne	L7331
2957                     ; 419 				receipt.payload[3] = sc.slc[i].ch1_status;
2959  004d 7b38          	ld	a,(OFST+0,sp)
2960  004f 97            	ld	xl,a
2961  0050 a61a          	ld	a,#26
2962  0052 42            	mul	x,a
2963  0053 d60261        	ld	a,(_sc+466,x)
2964  0056 6b09          	ld	(OFST-47,sp),a
2965                     ; 420 				receipt.payload[4] = sc.slc[i].ch2_status;
2967  0058 7b38          	ld	a,(OFST+0,sp)
2968  005a 97            	ld	xl,a
2969  005b a61a          	ld	a,#26
2970  005d 42            	mul	x,a
2971  005e d60262        	ld	a,(_sc+467,x)
2972  0061 6b0a          	ld	(OFST-46,sp),a
2973                     ; 421 				receipt.payload[5] = sc.slc[i].ch3_status;
2975  0063 7b38          	ld	a,(OFST+0,sp)
2976  0065 97            	ld	xl,a
2977  0066 a61a          	ld	a,#26
2978  0068 42            	mul	x,a
2979  0069 d60263        	ld	a,(_sc+468,x)
2980  006c 6b0b          	ld	(OFST-45,sp),a
2981                     ; 422 				receipt.payload[6] = sc.slc[i].ch4_status;
2983  006e 7b38          	ld	a,(OFST+0,sp)
2984  0070 97            	ld	xl,a
2985  0071 a61a          	ld	a,#26
2986  0073 42            	mul	x,a
2987  0074 d60264        	ld	a,(_sc+469,x)
2988  0077 6b0c          	ld	(OFST-44,sp),a
2989                     ; 423 				sicp_send_message(&receipt,7);
2991  0079 4b07          	push	#7
2992  007b 96            	ldw	x,sp
2993  007c 1c0002        	addw	x,#OFST-54
2994  007f cd0000        	call	_sicp_send_message
2996  0082 84            	pop	a
2997                     ; 424 				break;
2999  0083 206a          	jra	L7231
3000  0085               L7331:
3001                     ; 417 		for(i = 0;i < 15;i++){
3003  0085 0c38          	inc	(OFST+0,sp)
3006  0087 7b38          	ld	a,(OFST+0,sp)
3007  0089 a10f          	cp	a,#15
3008  008b 25a6          	jrult	L1331
3009  008d 2060          	jra	L7231
3010  008f               L1721:
3011                     ; 428 		case 0x02://action plug switch打开或关闭开关的执行回执
3011                     ; 429 		receipt.payload[2] = mdid;
3013  008f 7b40          	ld	a,(OFST+8,sp)
3014  0091 6b08          	ld	(OFST-48,sp),a
3015                     ; 430 		for(i = 0;i < 15;i++){
3017  0093 0f38          	clr	(OFST+0,sp)
3018  0095               L1431:
3019                     ; 431 			if(sc.spc[i].MDID == mdid){
3021  0095 7b38          	ld	a,(OFST+0,sp)
3022  0097 97            	ld	xl,a
3023  0098 a61c          	ld	a,#28
3024  009a 42            	mul	x,a
3025  009b 7b40          	ld	a,(OFST+8,sp)
3026  009d 905f          	clrw	y
3027  009f 9097          	ld	yl,a
3028  00a1 90bf00        	ldw	c_y,y
3029  00a4 9093          	ldw	y,x
3030  00a6 90de00bb      	ldw	y,(_sc+44,y)
3031  00aa 90b300        	cpw	y,c_y
3032  00ad 2638          	jrne	L7431
3033                     ; 432 				receipt.payload[3] = sc.spc[i].ch1_status;
3035  00af 7b38          	ld	a,(OFST+0,sp)
3036  00b1 97            	ld	xl,a
3037  00b2 a61c          	ld	a,#28
3038  00b4 42            	mul	x,a
3039  00b5 d600bd        	ld	a,(_sc+46,x)
3040  00b8 6b09          	ld	(OFST-47,sp),a
3041                     ; 433 				receipt.payload[4] = sc.spc[i].ch2_status;
3043  00ba 7b38          	ld	a,(OFST+0,sp)
3044  00bc 97            	ld	xl,a
3045  00bd a61c          	ld	a,#28
3046  00bf 42            	mul	x,a
3047  00c0 d600be        	ld	a,(_sc+47,x)
3048  00c3 6b0a          	ld	(OFST-46,sp),a
3049                     ; 434 				receipt.payload[5] = sc.spc[i].ch3_status;
3051  00c5 7b38          	ld	a,(OFST+0,sp)
3052  00c7 97            	ld	xl,a
3053  00c8 a61c          	ld	a,#28
3054  00ca 42            	mul	x,a
3055  00cb d600bf        	ld	a,(_sc+48,x)
3056  00ce 6b0b          	ld	(OFST-45,sp),a
3057                     ; 435 				receipt.payload[6] = sc.spc[i].ch4_status;
3059  00d0 7b38          	ld	a,(OFST+0,sp)
3060  00d2 97            	ld	xl,a
3061  00d3 a61c          	ld	a,#28
3062  00d5 42            	mul	x,a
3063  00d6 d600c0        	ld	a,(_sc+49,x)
3064  00d9 6b0c          	ld	(OFST-44,sp),a
3065                     ; 436 				sicp_send_message(&receipt,7);
3067  00db 4b07          	push	#7
3068  00dd 96            	ldw	x,sp
3069  00de 1c0002        	addw	x,#OFST-54
3070  00e1 cd0000        	call	_sicp_send_message
3072  00e4 84            	pop	a
3073                     ; 437 				break;
3075  00e5 2008          	jra	L7231
3076  00e7               L7431:
3077                     ; 430 		for(i = 0;i < 15;i++){
3079  00e7 0c38          	inc	(OFST+0,sp)
3082  00e9 7b38          	ld	a,(OFST+0,sp)
3083  00eb a10f          	cp	a,#15
3084  00ed 25a6          	jrult	L1431
3085  00ef               L3721:
3086                     ; 441 		default:
3086                     ; 442 		break;
3088  00ef               L7231:
3089                     ; 444 }
3092  00ef 5b3a          	addw	sp,#58
3093  00f1 81            	ret
3147                     ; 447 void rev_cmd_data(u8 moduleid){
3148                     .text:	section	.text,new
3149  0000               _rev_cmd_data:
3151  0000 88            	push	a
3152  0001 5238          	subw	sp,#56
3153       00000038      OFST:	set	56
3156                     ; 450 	for(i = 0;i < 15;i++){
3158  0003 0f01          	clr	(OFST-55,sp)
3159  0005               L3731:
3160                     ; 451 		if(sc.slc[i].MDID == moduleid){
3162  0005 7b01          	ld	a,(OFST-55,sp)
3163  0007 97            	ld	xl,a
3164  0008 a61a          	ld	a,#26
3165  000a 42            	mul	x,a
3166  000b 7b39          	ld	a,(OFST+1,sp)
3167  000d 905f          	clrw	y
3168  000f 9097          	ld	yl,a
3169  0011 90bf00        	ldw	c_y,y
3170  0014 9093          	ldw	y,x
3171  0016 90de025f      	ldw	y,(_sc+464,y)
3172  001a 90b300        	cpw	y,c_y
3173  001d 2657          	jrne	L1041
3174                     ; 452 			cmd_data.frame_h1 = 0xEE;
3176  001f a6ee          	ld	a,#238
3177  0021 6b02          	ld	(OFST-54,sp),a
3178                     ; 453 			cmd_data.frame_h2 = 0xAA;
3180  0023 a6aa          	ld	a,#170
3181  0025 6b03          	ld	(OFST-53,sp),a
3182                     ; 454 			cmd_data.message_id = rev_message_id;
3184  0027 c60087        	ld	a,_rev_message_id
3185  002a 6b04          	ld	(OFST-52,sp),a
3186                     ; 455 			cmd_data.mesh_id_H = ns_host_meshid_H;
3188  002c c60089        	ld	a,_ns_host_meshid_H
3189  002f 6b05          	ld	(OFST-51,sp),a
3190                     ; 456 			cmd_data.mesh_id_L = ns_host_meshid_L;
3192  0031 c60088        	ld	a,_ns_host_meshid_L
3193  0034 6b06          	ld	(OFST-50,sp),a
3194                     ; 457 			cmd_data.payload[0] = 0x06;
3196  0036 a606          	ld	a,#6
3197  0038 6b07          	ld	(OFST-49,sp),a
3198                     ; 458 			cmd_data.payload[1] = moduleid;
3200  003a 7b39          	ld	a,(OFST+1,sp)
3201  003c 6b08          	ld	(OFST-48,sp),a
3202                     ; 459 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3204  003e 7b01          	ld	a,(OFST-55,sp)
3205  0040 97            	ld	xl,a
3206  0041 a61a          	ld	a,#26
3207  0043 42            	mul	x,a
3208  0044 d60261        	ld	a,(_sc+466,x)
3209  0047 6b09          	ld	(OFST-47,sp),a
3210                     ; 460 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3212  0049 7b01          	ld	a,(OFST-55,sp)
3213  004b 97            	ld	xl,a
3214  004c a61a          	ld	a,#26
3215  004e 42            	mul	x,a
3216  004f d60262        	ld	a,(_sc+467,x)
3217  0052 6b0a          	ld	(OFST-46,sp),a
3218                     ; 461 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3220  0054 7b01          	ld	a,(OFST-55,sp)
3221  0056 97            	ld	xl,a
3222  0057 a61a          	ld	a,#26
3223  0059 42            	mul	x,a
3224  005a d60263        	ld	a,(_sc+468,x)
3225  005d 6b0b          	ld	(OFST-45,sp),a
3226                     ; 462 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3228  005f 7b01          	ld	a,(OFST-55,sp)
3229  0061 97            	ld	xl,a
3230  0062 a61a          	ld	a,#26
3231  0064 42            	mul	x,a
3232  0065 d60264        	ld	a,(_sc+469,x)
3233  0068 6b0c          	ld	(OFST-44,sp),a
3234                     ; 463 			sicp_send_message(&cmd_data,6);
3236  006a 4b06          	push	#6
3237  006c 96            	ldw	x,sp
3238  006d 1c0003        	addw	x,#OFST-53
3239  0070 cd0000        	call	_sicp_send_message
3241  0073 84            	pop	a
3242                     ; 464 			break;
3244  0074 207c          	jra	L7731
3245  0076               L1041:
3246                     ; 466 		if(sc.spc[i].MDID == moduleid){
3248  0076 7b01          	ld	a,(OFST-55,sp)
3249  0078 97            	ld	xl,a
3250  0079 a61c          	ld	a,#28
3251  007b 42            	mul	x,a
3252  007c 7b39          	ld	a,(OFST+1,sp)
3253  007e 905f          	clrw	y
3254  0080 9097          	ld	yl,a
3255  0082 90bf00        	ldw	c_y,y
3256  0085 9093          	ldw	y,x
3257  0087 90de00bb      	ldw	y,(_sc+44,y)
3258  008b 90b300        	cpw	y,c_y
3259  008e 2657          	jrne	L3041
3260                     ; 467 			cmd_data.frame_h1 = 0xEE;
3262  0090 a6ee          	ld	a,#238
3263  0092 6b02          	ld	(OFST-54,sp),a
3264                     ; 468 			cmd_data.frame_h2 = 0xAA;
3266  0094 a6aa          	ld	a,#170
3267  0096 6b03          	ld	(OFST-53,sp),a
3268                     ; 469 			cmd_data.message_id = rev_message_id;
3270  0098 c60087        	ld	a,_rev_message_id
3271  009b 6b04          	ld	(OFST-52,sp),a
3272                     ; 470 			cmd_data.mesh_id_H = ns_host_meshid_H;
3274  009d c60089        	ld	a,_ns_host_meshid_H
3275  00a0 6b05          	ld	(OFST-51,sp),a
3276                     ; 471 			cmd_data.mesh_id_L = ns_host_meshid_L;
3278  00a2 c60088        	ld	a,_ns_host_meshid_L
3279  00a5 6b06          	ld	(OFST-50,sp),a
3280                     ; 472 			cmd_data.payload[0] = 0x06;
3282  00a7 a606          	ld	a,#6
3283  00a9 6b07          	ld	(OFST-49,sp),a
3284                     ; 473 			cmd_data.payload[1] = moduleid;
3286  00ab 7b39          	ld	a,(OFST+1,sp)
3287  00ad 6b08          	ld	(OFST-48,sp),a
3288                     ; 474 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3290  00af 7b01          	ld	a,(OFST-55,sp)
3291  00b1 97            	ld	xl,a
3292  00b2 a61c          	ld	a,#28
3293  00b4 42            	mul	x,a
3294  00b5 d600bd        	ld	a,(_sc+46,x)
3295  00b8 6b09          	ld	(OFST-47,sp),a
3296                     ; 475 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3298  00ba 7b01          	ld	a,(OFST-55,sp)
3299  00bc 97            	ld	xl,a
3300  00bd a61c          	ld	a,#28
3301  00bf 42            	mul	x,a
3302  00c0 d600be        	ld	a,(_sc+47,x)
3303  00c3 6b0a          	ld	(OFST-46,sp),a
3304                     ; 476 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3306  00c5 7b01          	ld	a,(OFST-55,sp)
3307  00c7 97            	ld	xl,a
3308  00c8 a61c          	ld	a,#28
3309  00ca 42            	mul	x,a
3310  00cb d600bf        	ld	a,(_sc+48,x)
3311  00ce 6b0b          	ld	(OFST-45,sp),a
3312                     ; 477 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3314  00d0 7b01          	ld	a,(OFST-55,sp)
3315  00d2 97            	ld	xl,a
3316  00d3 a61c          	ld	a,#28
3317  00d5 42            	mul	x,a
3318  00d6 d600c0        	ld	a,(_sc+49,x)
3319  00d9 6b0c          	ld	(OFST-44,sp),a
3320                     ; 478 			sicp_send_message(&cmd_data,6);
3322  00db 4b06          	push	#6
3323  00dd 96            	ldw	x,sp
3324  00de 1c0003        	addw	x,#OFST-53
3325  00e1 cd0000        	call	_sicp_send_message
3327  00e4 84            	pop	a
3328                     ; 479 			break;
3330  00e5 200b          	jra	L7731
3331  00e7               L3041:
3332                     ; 450 	for(i = 0;i < 15;i++){
3334  00e7 0c01          	inc	(OFST-55,sp)
3337  00e9 7b01          	ld	a,(OFST-55,sp)
3338  00eb a10f          	cp	a,#15
3339  00ed 2403          	jruge	L611
3340  00ef cc0005        	jp	L3731
3341  00f2               L611:
3342  00f2               L7731:
3343                     ; 482 }
3346  00f2 5b39          	addw	sp,#57
3347  00f4 81            	ret
3350                     	switch	.data
3351  0000               L5041_eg_timeout:
3352  0000 0000          	dc.w	0
3407                     ; 485 void report_energy_consum(void){
3408                     .text:	section	.text,new
3409  0000               _report_energy_consum:
3411  0000 5238          	subw	sp,#56
3412       00000038      OFST:	set	56
3415                     ; 489 	systime_count[3]++;
3417  0002 ce0006        	ldw	x,_systime_count+6
3418  0005 1c0001        	addw	x,#1
3419  0008 cf0006        	ldw	_systime_count+6,x
3420                     ; 490 	if(systime_count[3] >= 60){
3422  000b ce0006        	ldw	x,_systime_count+6
3423  000e a3003c        	cpw	x,#60
3424  0011 2403          	jruge	L221
3425  0013 cc00a2        	jp	L1341
3426  0016               L221:
3427                     ; 491 		systime_count[3] = 0;
3429  0016 5f            	clrw	x
3430  0017 cf0006        	ldw	_systime_count+6,x
3431                     ; 492 		systime_count[4]++;
3433  001a ce0008        	ldw	x,_systime_count+8
3434  001d 1c0001        	addw	x,#1
3435  0020 cf0008        	ldw	_systime_count+8,x
3436                     ; 493 		if(systime_count[4] >= 30){
3438  0023 ce0008        	ldw	x,_systime_count+8
3439  0026 a3001e        	cpw	x,#30
3440  0029 2577          	jrult	L1341
3441                     ; 494 			systime_count[4] = 0;
3443  002b 5f            	clrw	x
3444  002c cf0008        	ldw	_systime_count+8,x
3445                     ; 495 			i2c_get_energy_consum();
3447  002f cd0000        	call	_i2c_get_energy_consum
3449                     ; 496 			for(i = 0; i < 15; i++){
3451  0032 0f01          	clr	(OFST-55,sp)
3452  0034               L5341:
3453                     ; 497 				if(sc.spc[i].MDID){//有ID说明SPC存在
3455  0034 7b01          	ld	a,(OFST-55,sp)
3456  0036 97            	ld	xl,a
3457  0037 a61c          	ld	a,#28
3458  0039 42            	mul	x,a
3459  003a d600bc        	ld	a,(_sc+45,x)
3460  003d da00bb        	or	a,(_sc+44,x)
3461  0040 2758          	jreq	L3441
3462                     ; 498 				ec.frame_h1 = 0xEE;
3464  0042 a6ee          	ld	a,#238
3465  0044 6b02          	ld	(OFST-54,sp),a
3466                     ; 499 				ec.frame_h2 = 0xEE;
3468  0046 a6ee          	ld	a,#238
3469  0048 6b03          	ld	(OFST-53,sp),a
3470                     ; 500 				ec.message_id = i+1;
3472  004a 7b01          	ld	a,(OFST-55,sp)
3473  004c 4c            	inc	a
3474  004d 6b04          	ld	(OFST-52,sp),a
3475                     ; 501 				ec.mesh_id_H = ns_host_meshid_H;
3477  004f c60089        	ld	a,_ns_host_meshid_H
3478  0052 6b05          	ld	(OFST-51,sp),a
3479                     ; 502 				ec.mesh_id_L = ns_host_meshid_L;
3481  0054 c60088        	ld	a,_ns_host_meshid_L
3482  0057 6b06          	ld	(OFST-50,sp),a
3483                     ; 503 				ec.payload[0] = 0x2A;
3485  0059 a62a          	ld	a,#42
3486  005b 6b07          	ld	(OFST-49,sp),a
3487                     ; 504 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3489  005d 7b01          	ld	a,(OFST-55,sp)
3490  005f 97            	ld	xl,a
3491  0060 a61c          	ld	a,#28
3492  0062 42            	mul	x,a
3493  0063 de00c1        	ldw	x,(_sc+50,x)
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
3504                     ; 505 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3506  0072 7b01          	ld	a,(OFST-55,sp)
3507  0074 97            	ld	xl,a
3508  0075 a61c          	ld	a,#28
3509  0077 42            	mul	x,a
3510  0078 d600c2        	ld	a,(_sc+51,x)
3511  007b a4ff          	and	a,#255
3512  007d 6b09          	ld	(OFST-47,sp),a
3513                     ; 506 				ec.payload[3] =	sc.spc[i].MDID;
3515  007f 7b01          	ld	a,(OFST-55,sp)
3516  0081 97            	ld	xl,a
3517  0082 a61c          	ld	a,#28
3518  0084 42            	mul	x,a
3519  0085 d600bc        	ld	a,(_sc+45,x)
3520  0088 6b0a          	ld	(OFST-46,sp),a
3521                     ; 507 				sicp_send_message(&ec,4);
3523  008a 4b04          	push	#4
3524  008c 96            	ldw	x,sp
3525  008d 1c0003        	addw	x,#OFST-53
3526  0090 cd0000        	call	_sicp_send_message
3528  0093 84            	pop	a
3529                     ; 508 				eg_timeout = 5;
3531  0094 ae0005        	ldw	x,#5
3532  0097 cf0000        	ldw	L5041_eg_timeout,x
3533  009a               L3441:
3534                     ; 496 			for(i = 0; i < 15; i++){
3536  009a 0c01          	inc	(OFST-55,sp)
3539  009c 7b01          	ld	a,(OFST-55,sp)
3540  009e a10f          	cp	a,#15
3541  00a0 2592          	jrult	L5341
3542  00a2               L1341:
3543                     ; 514 	if(eg_timeout){
3545  00a2 ce0000        	ldw	x,L5041_eg_timeout
3546  00a5 2603          	jrne	L421
3547  00a7 cc0135        	jp	L5441
3548  00aa               L421:
3549                     ; 515 		if(--eg_timeout == 0){
3551  00aa ce0000        	ldw	x,L5041_eg_timeout
3552  00ad 1d0001        	subw	x,#1
3553  00b0 cf0000        	ldw	L5041_eg_timeout,x
3554  00b3 26f2          	jrne	L5441
3555                     ; 516 			for(i = 0;i < 15;i++){
3557  00b5 0f01          	clr	(OFST-55,sp)
3558  00b7               L1541:
3559                     ; 517 			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3561  00b7 7b01          	ld	a,(OFST-55,sp)
3562  00b9 97            	ld	xl,a
3563  00ba a61c          	ld	a,#28
3564  00bc 42            	mul	x,a
3565  00bd d600bc        	ld	a,(_sc+45,x)
3566  00c0 da00bb        	or	a,(_sc+44,x)
3567  00c3 2768          	jreq	L7541
3569  00c5 7b01          	ld	a,(OFST-55,sp)
3570  00c7 97            	ld	xl,a
3571  00c8 a61c          	ld	a,#28
3572  00ca 42            	mul	x,a
3573  00cb d600c3        	ld	a,(_sc+52,x)
3574  00ce a501          	bcp	a,#1
3575  00d0 265b          	jrne	L7541
3576                     ; 518 				ec.frame_h1 = 0xEE;
3578  00d2 a6ee          	ld	a,#238
3579  00d4 6b02          	ld	(OFST-54,sp),a
3580                     ; 519 				ec.frame_h2 = 0xEE;
3582  00d6 a6ee          	ld	a,#238
3583  00d8 6b03          	ld	(OFST-53,sp),a
3584                     ; 520 				ec.message_id = random(TIM4->CNTR);
3586  00da c65344        	ld	a,21316
3587  00dd cd0000        	call	_random
3589  00e0 6b04          	ld	(OFST-52,sp),a
3590                     ; 521 				ec.mesh_id_H = ns_host_meshid_H;
3592  00e2 c60089        	ld	a,_ns_host_meshid_H
3593  00e5 6b05          	ld	(OFST-51,sp),a
3594                     ; 522 				ec.mesh_id_L = ns_host_meshid_L;
3596  00e7 c60088        	ld	a,_ns_host_meshid_L
3597  00ea 6b06          	ld	(OFST-50,sp),a
3598                     ; 523 				ec.payload[0] = 0x2A;
3600  00ec a62a          	ld	a,#42
3601  00ee 6b07          	ld	(OFST-49,sp),a
3602                     ; 524 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3604  00f0 7b01          	ld	a,(OFST-55,sp)
3605  00f2 97            	ld	xl,a
3606  00f3 a61c          	ld	a,#28
3607  00f5 42            	mul	x,a
3608  00f6 de00c1        	ldw	x,(_sc+50,x)
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
3619                     ; 525 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3621  0105 7b01          	ld	a,(OFST-55,sp)
3622  0107 97            	ld	xl,a
3623  0108 a61c          	ld	a,#28
3624  010a 42            	mul	x,a
3625  010b d600c2        	ld	a,(_sc+51,x)
3626  010e a4ff          	and	a,#255
3627  0110 6b09          	ld	(OFST-47,sp),a
3628                     ; 526 				ec.payload[3] =	sc.spc[i].MDID;
3630  0112 7b01          	ld	a,(OFST-55,sp)
3631  0114 97            	ld	xl,a
3632  0115 a61c          	ld	a,#28
3633  0117 42            	mul	x,a
3634  0118 d600bc        	ld	a,(_sc+45,x)
3635  011b 6b0a          	ld	(OFST-46,sp),a
3636                     ; 527 				sicp_send_message(&ec,4);
3638  011d 4b04          	push	#4
3639  011f 96            	ldw	x,sp
3640  0120 1c0003        	addw	x,#OFST-53
3641  0123 cd0000        	call	_sicp_send_message
3643  0126 84            	pop	a
3644                     ; 528 				eg_timeout = 5;//每5s重发1次直到接收到回执为止
3646  0127 ae0005        	ldw	x,#5
3647  012a cf0000        	ldw	L5041_eg_timeout,x
3648  012d               L7541:
3649                     ; 516 			for(i = 0;i < 15;i++){
3651  012d 0c01          	inc	(OFST-55,sp)
3654  012f 7b01          	ld	a,(OFST-55,sp)
3655  0131 a10f          	cp	a,#15
3656  0133 2582          	jrult	L1541
3657  0135               L5441:
3658                     ; 533 }
3661  0135 5b38          	addw	sp,#56
3662  0137 81            	ret
3702                     ; 536 void send_sc_device_info(void)
3702                     ; 537 {
3703                     .text:	section	.text,new
3704  0000               _send_sc_device_info:
3706  0000 5237          	subw	sp,#55
3707       00000037      OFST:	set	55
3710                     ; 540 	di.frame_h1 = 0xEE;
3712  0002 a6ee          	ld	a,#238
3713  0004 6b01          	ld	(OFST-54,sp),a
3714                     ; 541 	di.frame_h2 = 0xEE;
3716  0006 a6ee          	ld	a,#238
3717  0008 6b02          	ld	(OFST-53,sp),a
3718                     ; 542 	di.message_id = 16;
3720  000a a610          	ld	a,#16
3721  000c 6b03          	ld	(OFST-52,sp),a
3722                     ; 543 	di.mesh_id_H = ns_host_meshid_H;
3724  000e c60089        	ld	a,_ns_host_meshid_H
3725  0011 6b04          	ld	(OFST-51,sp),a
3726                     ; 544 	di.mesh_id_L = ns_host_meshid_L;
3728  0013 c60088        	ld	a,_ns_host_meshid_L
3729  0016 6b05          	ld	(OFST-50,sp),a
3730                     ; 545 	di.payload[0] = 0xB1;
3732  0018 a6b1          	ld	a,#177
3733  001a 6b06          	ld	(OFST-49,sp),a
3734                     ; 546 	di.payload[1] =	sc.deviceid[0];
3736  001c c60091        	ld	a,_sc+2
3737  001f 6b07          	ld	(OFST-48,sp),a
3738                     ; 547 	di.payload[2] =	sc.deviceid[1];
3740  0021 c60092        	ld	a,_sc+3
3741  0024 6b08          	ld	(OFST-47,sp),a
3742                     ; 548 	di.payload[3] =	sc.deviceid[2];
3744  0026 c60093        	ld	a,_sc+4
3745  0029 6b09          	ld	(OFST-46,sp),a
3746                     ; 549 	di.payload[4] =	sc.deviceid[3];
3748  002b c60094        	ld	a,_sc+5
3749  002e 6b0a          	ld	(OFST-45,sp),a
3750                     ; 550 	di.payload[5] =	sc.model;
3752  0030 c60097        	ld	a,_sc+8
3753  0033 6b0b          	ld	(OFST-44,sp),a
3754                     ; 551 	di.payload[6] = sc.firmware;
3756  0035 c60095        	ld	a,_sc+6
3757  0038 6b0c          	ld	(OFST-43,sp),a
3758                     ; 552 	di.payload[7] = sc.HWTtest;
3760  003a c60096        	ld	a,_sc+7
3761  003d 6b0d          	ld	(OFST-42,sp),a
3762                     ; 553 	di.payload[8] = sc.Ndevice;
3764  003f c600a2        	ld	a,_sc+19
3765  0042 6b0e          	ld	(OFST-41,sp),a
3766                     ; 554 	sicp_send_message(&di,9);
3768  0044 4b09          	push	#9
3769  0046 96            	ldw	x,sp
3770  0047 1c0002        	addw	x,#OFST-53
3771  004a cd0000        	call	_sicp_send_message
3773  004d 84            	pop	a
3774                     ; 555 }
3777  004e 5b37          	addw	sp,#55
3778  0050 81            	ret
3825                     ; 557 void send_slc_device_info(u8 i)
3825                     ; 558 {
3826                     .text:	section	.text,new
3827  0000               _send_slc_device_info:
3829  0000 88            	push	a
3830  0001 5237          	subw	sp,#55
3831       00000037      OFST:	set	55
3834                     ; 560 	di.frame_h1 = 0xEE;
3836  0003 a6ee          	ld	a,#238
3837  0005 6b01          	ld	(OFST-54,sp),a
3838                     ; 561 	di.frame_h2 = 0xEE;
3840  0007 a6ee          	ld	a,#238
3841  0009 6b02          	ld	(OFST-53,sp),a
3842                     ; 562 	di.message_id = 21+i;
3844  000b 7b38          	ld	a,(OFST+1,sp)
3845  000d ab15          	add	a,#21
3846  000f 6b03          	ld	(OFST-52,sp),a
3847                     ; 563 	di.mesh_id_H = ns_host_meshid_H;
3849  0011 c60089        	ld	a,_ns_host_meshid_H
3850  0014 6b04          	ld	(OFST-51,sp),a
3851                     ; 564 	di.mesh_id_L = ns_host_meshid_L;
3853  0016 c60088        	ld	a,_ns_host_meshid_L
3854  0019 6b05          	ld	(OFST-50,sp),a
3855                     ; 565 	di.payload[0] = 0xB2;
3857  001b a6b2          	ld	a,#178
3858  001d 6b06          	ld	(OFST-49,sp),a
3859                     ; 566 	di.payload[1] =	sc.slc[i].deviceid[0];
3861  001f 7b38          	ld	a,(OFST+1,sp)
3862  0021 97            	ld	xl,a
3863  0022 a61a          	ld	a,#26
3864  0024 42            	mul	x,a
3865  0025 d6024e        	ld	a,(_sc+447,x)
3866  0028 6b07          	ld	(OFST-48,sp),a
3867                     ; 567 	di.payload[2] =	sc.slc[i].deviceid[1];
3869  002a 7b38          	ld	a,(OFST+1,sp)
3870  002c 97            	ld	xl,a
3871  002d a61a          	ld	a,#26
3872  002f 42            	mul	x,a
3873  0030 d6024f        	ld	a,(_sc+448,x)
3874  0033 6b08          	ld	(OFST-47,sp),a
3875                     ; 568 	di.payload[3] =	sc.slc[i].deviceid[2];
3877  0035 7b38          	ld	a,(OFST+1,sp)
3878  0037 97            	ld	xl,a
3879  0038 a61a          	ld	a,#26
3880  003a 42            	mul	x,a
3881  003b d60250        	ld	a,(_sc+449,x)
3882  003e 6b09          	ld	(OFST-46,sp),a
3883                     ; 569 	di.payload[4] =	sc.slc[i].deviceid[3];
3885  0040 7b38          	ld	a,(OFST+1,sp)
3886  0042 97            	ld	xl,a
3887  0043 a61a          	ld	a,#26
3888  0045 42            	mul	x,a
3889  0046 d60251        	ld	a,(_sc+450,x)
3890  0049 6b0a          	ld	(OFST-45,sp),a
3891                     ; 570 	di.payload[5] =	sc.slc[i].model;
3893  004b 7b38          	ld	a,(OFST+1,sp)
3894  004d 97            	ld	xl,a
3895  004e a61a          	ld	a,#26
3896  0050 42            	mul	x,a
3897  0051 d60254        	ld	a,(_sc+453,x)
3898  0054 6b0b          	ld	(OFST-44,sp),a
3899                     ; 571 	di.payload[6] = sc.slc[i].firmware;
3901  0056 7b38          	ld	a,(OFST+1,sp)
3902  0058 97            	ld	xl,a
3903  0059 a61a          	ld	a,#26
3904  005b 42            	mul	x,a
3905  005c d60252        	ld	a,(_sc+451,x)
3906  005f 6b0c          	ld	(OFST-43,sp),a
3907                     ; 572 	di.payload[7] = sc.slc[i].HWTtest;
3909  0061 7b38          	ld	a,(OFST+1,sp)
3910  0063 97            	ld	xl,a
3911  0064 a61a          	ld	a,#26
3912  0066 42            	mul	x,a
3913  0067 d60253        	ld	a,(_sc+452,x)
3914  006a 6b0d          	ld	(OFST-42,sp),a
3915                     ; 573 	di.payload[8] = sc.slc[i].MDID;
3917  006c 7b38          	ld	a,(OFST+1,sp)
3918  006e 97            	ld	xl,a
3919  006f a61a          	ld	a,#26
3920  0071 42            	mul	x,a
3921  0072 d60260        	ld	a,(_sc+465,x)
3922  0075 6b0e          	ld	(OFST-41,sp),a
3923                     ; 574 	sicp_send_message(&di,9);
3925  0077 4b09          	push	#9
3926  0079 96            	ldw	x,sp
3927  007a 1c0002        	addw	x,#OFST-53
3928  007d cd0000        	call	_sicp_send_message
3930  0080 84            	pop	a
3931                     ; 575 }
3934  0081 5b38          	addw	sp,#56
3935  0083 81            	ret
3982                     ; 577 void send_spc_device_info(u8 i)
3982                     ; 578 {
3983                     .text:	section	.text,new
3984  0000               _send_spc_device_info:
3986  0000 88            	push	a
3987  0001 5237          	subw	sp,#55
3988       00000037      OFST:	set	55
3991                     ; 580 	di.frame_h1 = 0xEE;
3993  0003 a6ee          	ld	a,#238
3994  0005 6b01          	ld	(OFST-54,sp),a
3995                     ; 581 	di.frame_h2 = 0xEE;
3997  0007 a6ee          	ld	a,#238
3998  0009 6b02          	ld	(OFST-53,sp),a
3999                     ; 582 	di.message_id = 36+i;
4001  000b 7b38          	ld	a,(OFST+1,sp)
4002  000d ab24          	add	a,#36
4003  000f 6b03          	ld	(OFST-52,sp),a
4004                     ; 583 	di.mesh_id_H = ns_host_meshid_H;
4006  0011 c60089        	ld	a,_ns_host_meshid_H
4007  0014 6b04          	ld	(OFST-51,sp),a
4008                     ; 584 	di.mesh_id_L = ns_host_meshid_L;
4010  0016 c60088        	ld	a,_ns_host_meshid_L
4011  0019 6b05          	ld	(OFST-50,sp),a
4012                     ; 585 	di.payload[0] = 0xB3;
4014  001b a6b3          	ld	a,#179
4015  001d 6b06          	ld	(OFST-49,sp),a
4016                     ; 586 	di.payload[1] =	sc.spc[i].deviceid[0];
4018  001f 7b38          	ld	a,(OFST+1,sp)
4019  0021 97            	ld	xl,a
4020  0022 a61c          	ld	a,#28
4021  0024 42            	mul	x,a
4022  0025 d600aa        	ld	a,(_sc+27,x)
4023  0028 6b07          	ld	(OFST-48,sp),a
4024                     ; 587 	di.payload[2] =	sc.spc[i].deviceid[1];
4026  002a 7b38          	ld	a,(OFST+1,sp)
4027  002c 97            	ld	xl,a
4028  002d a61c          	ld	a,#28
4029  002f 42            	mul	x,a
4030  0030 d600ab        	ld	a,(_sc+28,x)
4031  0033 6b08          	ld	(OFST-47,sp),a
4032                     ; 588 	di.payload[3] =	sc.spc[i].deviceid[2];
4034  0035 7b38          	ld	a,(OFST+1,sp)
4035  0037 97            	ld	xl,a
4036  0038 a61c          	ld	a,#28
4037  003a 42            	mul	x,a
4038  003b d600ac        	ld	a,(_sc+29,x)
4039  003e 6b09          	ld	(OFST-46,sp),a
4040                     ; 589 	di.payload[4] =	sc.spc[i].deviceid[3];
4042  0040 7b38          	ld	a,(OFST+1,sp)
4043  0042 97            	ld	xl,a
4044  0043 a61c          	ld	a,#28
4045  0045 42            	mul	x,a
4046  0046 d600ad        	ld	a,(_sc+30,x)
4047  0049 6b0a          	ld	(OFST-45,sp),a
4048                     ; 590 	di.payload[5] =	sc.spc[i].model;
4050  004b 7b38          	ld	a,(OFST+1,sp)
4051  004d 97            	ld	xl,a
4052  004e a61c          	ld	a,#28
4053  0050 42            	mul	x,a
4054  0051 d600b0        	ld	a,(_sc+33,x)
4055  0054 6b0b          	ld	(OFST-44,sp),a
4056                     ; 591 	di.payload[6] = sc.spc[i].firmware;
4058  0056 7b38          	ld	a,(OFST+1,sp)
4059  0058 97            	ld	xl,a
4060  0059 a61c          	ld	a,#28
4061  005b 42            	mul	x,a
4062  005c d600ae        	ld	a,(_sc+31,x)
4063  005f 6b0c          	ld	(OFST-43,sp),a
4064                     ; 592 	di.payload[7] = sc.spc[i].HWTtest;
4066  0061 7b38          	ld	a,(OFST+1,sp)
4067  0063 97            	ld	xl,a
4068  0064 a61c          	ld	a,#28
4069  0066 42            	mul	x,a
4070  0067 d600af        	ld	a,(_sc+32,x)
4071  006a 6b0d          	ld	(OFST-42,sp),a
4072                     ; 593 	di.payload[8] = sc.spc[i].MDID;
4074  006c 7b38          	ld	a,(OFST+1,sp)
4075  006e 97            	ld	xl,a
4076  006f a61c          	ld	a,#28
4077  0071 42            	mul	x,a
4078  0072 d600bc        	ld	a,(_sc+45,x)
4079  0075 6b0e          	ld	(OFST-41,sp),a
4080                     ; 594 	sicp_send_message(&di,9);
4082  0077 4b09          	push	#9
4083  0079 96            	ldw	x,sp
4084  007a 1c0002        	addw	x,#OFST-53
4085  007d cd0000        	call	_sicp_send_message
4087  0080 84            	pop	a
4088                     ; 595 }
4091  0081 5b38          	addw	sp,#56
4092  0083 81            	ret
4130                     ; 597 void send_device_info(void)
4130                     ; 598 {
4131                     .text:	section	.text,new
4132  0000               _send_device_info:
4134  0000 88            	push	a
4135       00000001      OFST:	set	1
4138                     ; 601 	send_sc_device_info();
4140  0001 cd0000        	call	_send_sc_device_info
4142                     ; 602 	delay(100);
4144  0004 ae0064        	ldw	x,#100
4145  0007 cd0000        	call	_delay
4147                     ; 604 	for(i = 0; i < 15;i++){
4149  000a 0f01          	clr	(OFST+0,sp)
4150  000c               L3551:
4151                     ; 605 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4153  000c 7b01          	ld	a,(OFST+0,sp)
4154  000e 97            	ld	xl,a
4155  000f a61a          	ld	a,#26
4156  0011 42            	mul	x,a
4157  0012 d60260        	ld	a,(_sc+465,x)
4158  0015 da025f        	or	a,(_sc+464,x)
4159  0018 270b          	jreq	L1651
4160                     ; 606 			send_slc_device_info(i);
4162  001a 7b01          	ld	a,(OFST+0,sp)
4163  001c cd0000        	call	_send_slc_device_info
4165                     ; 607 			delay(100);
4167  001f ae0064        	ldw	x,#100
4168  0022 cd0000        	call	_delay
4170  0025               L1651:
4171                     ; 604 	for(i = 0; i < 15;i++){
4173  0025 0c01          	inc	(OFST+0,sp)
4176  0027 7b01          	ld	a,(OFST+0,sp)
4177  0029 a10f          	cp	a,#15
4178  002b 25df          	jrult	L3551
4179                     ; 611 	for(i = 0; i < 15;i++){
4181  002d 0f01          	clr	(OFST+0,sp)
4182  002f               L3651:
4183                     ; 612 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4185  002f 7b01          	ld	a,(OFST+0,sp)
4186  0031 97            	ld	xl,a
4187  0032 a61c          	ld	a,#28
4188  0034 42            	mul	x,a
4189  0035 d600bc        	ld	a,(_sc+45,x)
4190  0038 da00bb        	or	a,(_sc+44,x)
4191  003b 270b          	jreq	L1751
4192                     ; 613 			send_spc_device_info(i);
4194  003d 7b01          	ld	a,(OFST+0,sp)
4195  003f cd0000        	call	_send_spc_device_info
4197                     ; 614 			delay(100);
4199  0042 ae0064        	ldw	x,#100
4200  0045 cd0000        	call	_delay
4202  0048               L1751:
4203                     ; 611 	for(i = 0; i < 15;i++){
4205  0048 0c01          	inc	(OFST+0,sp)
4208  004a 7b01          	ld	a,(OFST+0,sp)
4209  004c a10f          	cp	a,#15
4210  004e 25df          	jrult	L3651
4211                     ; 617 	di_timeout = 5;
4213  0050 35050001      	mov	_di_timeout,#5
4214                     ; 618 }
4217  0054 84            	pop	a
4218  0055 81            	ret
4264                     ; 621 void send_malfunction(void)
4264                     ; 622 {
4265                     .text:	section	.text,new
4266  0000               _send_malfunction:
4268  0000 5238          	subw	sp,#56
4269       00000038      OFST:	set	56
4272                     ; 626 	if((sc.HWTtest & 0xC0)!=0xC0){
4274  0002 c60096        	ld	a,_sc+7
4275  0005 a4c0          	and	a,#192
4276  0007 a1c0          	cp	a,#192
4277  0009 272f          	jreq	L3161
4278                     ; 627 		mal.frame_h1 = 0xEE;
4280  000b a6ee          	ld	a,#238
4281  000d 6b02          	ld	(OFST-54,sp),a
4282                     ; 628 		mal.frame_h2 = 0xEE;
4284  000f a6ee          	ld	a,#238
4285  0011 6b03          	ld	(OFST-53,sp),a
4286                     ; 629 		mal.message_id = 17;
4288  0013 a611          	ld	a,#17
4289  0015 6b04          	ld	(OFST-52,sp),a
4290                     ; 630 		mal.mesh_id_H = ns_host_meshid_H;
4292  0017 c60089        	ld	a,_ns_host_meshid_H
4293  001a 6b05          	ld	(OFST-51,sp),a
4294                     ; 631 		mal.mesh_id_L = ns_host_meshid_L;
4296  001c c60088        	ld	a,_ns_host_meshid_L
4297  001f 6b06          	ld	(OFST-50,sp),a
4298                     ; 632 		mal.payload[0] = 0x0A;
4300  0021 a60a          	ld	a,#10
4301  0023 6b07          	ld	(OFST-49,sp),a
4302                     ; 633 		mal.payload[1] = 0xB1;
4304  0025 a6b1          	ld	a,#177
4305  0027 6b08          	ld	(OFST-48,sp),a
4306                     ; 634 		mal.payload[2] =	0x00;
4308  0029 0f09          	clr	(OFST-47,sp)
4309                     ; 635 		mal.payload[3] =	sc.HWTtest;
4311  002b c60096        	ld	a,_sc+7
4312  002e 6b0a          	ld	(OFST-46,sp),a
4313                     ; 636 		sicp_send_message(&mal,4);
4315  0030 4b04          	push	#4
4316  0032 96            	ldw	x,sp
4317  0033 1c0003        	addw	x,#OFST-53
4318  0036 cd0000        	call	_sicp_send_message
4320  0039 84            	pop	a
4321  003a               L3161:
4322                     ; 639 	for(i = 0; i < 15;i++){
4324  003a 0f01          	clr	(OFST-55,sp)
4325  003c               L5161:
4326                     ; 640 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4328  003c 7b01          	ld	a,(OFST-55,sp)
4329  003e 97            	ld	xl,a
4330  003f a61a          	ld	a,#26
4331  0041 42            	mul	x,a
4332  0042 d60260        	ld	a,(_sc+465,x)
4333  0045 da025f        	or	a,(_sc+464,x)
4334  0048 274f          	jreq	L3261
4336  004a 7b01          	ld	a,(OFST-55,sp)
4337  004c 97            	ld	xl,a
4338  004d a61a          	ld	a,#26
4339  004f 42            	mul	x,a
4340  0050 d60253        	ld	a,(_sc+452,x)
4341  0053 a4c0          	and	a,#192
4342  0055 a1c0          	cp	a,#192
4343  0057 2740          	jreq	L3261
4344                     ; 641 			mal.frame_h1 = 0xEE;
4346  0059 a6ee          	ld	a,#238
4347  005b 6b02          	ld	(OFST-54,sp),a
4348                     ; 642 			mal.frame_h2 = 0xEE;
4350  005d a6ee          	ld	a,#238
4351  005f 6b03          	ld	(OFST-53,sp),a
4352                     ; 643 			mal.message_id = 51+i;
4354  0061 7b01          	ld	a,(OFST-55,sp)
4355  0063 ab33          	add	a,#51
4356  0065 6b04          	ld	(OFST-52,sp),a
4357                     ; 644 			mal.mesh_id_H = ns_host_meshid_H;
4359  0067 c60089        	ld	a,_ns_host_meshid_H
4360  006a 6b05          	ld	(OFST-51,sp),a
4361                     ; 645 			mal.mesh_id_L = ns_host_meshid_L;
4363  006c c60088        	ld	a,_ns_host_meshid_L
4364  006f 6b06          	ld	(OFST-50,sp),a
4365                     ; 646 			mal.payload[0] = 0x0A;
4367  0071 a60a          	ld	a,#10
4368  0073 6b07          	ld	(OFST-49,sp),a
4369                     ; 647 			mal.payload[1] = 0xB2;
4371  0075 a6b2          	ld	a,#178
4372  0077 6b08          	ld	(OFST-48,sp),a
4373                     ; 648 			mal.payload[2] =	sc.slc[i].MDID;
4375  0079 7b01          	ld	a,(OFST-55,sp)
4376  007b 97            	ld	xl,a
4377  007c a61a          	ld	a,#26
4378  007e 42            	mul	x,a
4379  007f d60260        	ld	a,(_sc+465,x)
4380  0082 6b09          	ld	(OFST-47,sp),a
4381                     ; 649 			mal.payload[3] =	sc.slc[i].HWTtest;
4383  0084 7b01          	ld	a,(OFST-55,sp)
4384  0086 97            	ld	xl,a
4385  0087 a61a          	ld	a,#26
4386  0089 42            	mul	x,a
4387  008a d60253        	ld	a,(_sc+452,x)
4388  008d 6b0a          	ld	(OFST-46,sp),a
4389                     ; 650 			sicp_send_message(&mal,4);
4391  008f 4b04          	push	#4
4392  0091 96            	ldw	x,sp
4393  0092 1c0003        	addw	x,#OFST-53
4394  0095 cd0000        	call	_sicp_send_message
4396  0098 84            	pop	a
4397  0099               L3261:
4398                     ; 639 	for(i = 0; i < 15;i++){
4400  0099 0c01          	inc	(OFST-55,sp)
4403  009b 7b01          	ld	a,(OFST-55,sp)
4404  009d a10f          	cp	a,#15
4405  009f 259b          	jrult	L5161
4406                     ; 654 	for(i = 0; i < 15;i++){
4408  00a1 0f01          	clr	(OFST-55,sp)
4409  00a3               L5261:
4410                     ; 655 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4412  00a3 7b01          	ld	a,(OFST-55,sp)
4413  00a5 97            	ld	xl,a
4414  00a6 a61c          	ld	a,#28
4415  00a8 42            	mul	x,a
4416  00a9 d600bc        	ld	a,(_sc+45,x)
4417  00ac da00bb        	or	a,(_sc+44,x)
4418  00af 274f          	jreq	L3361
4420  00b1 7b01          	ld	a,(OFST-55,sp)
4421  00b3 97            	ld	xl,a
4422  00b4 a61c          	ld	a,#28
4423  00b6 42            	mul	x,a
4424  00b7 d600af        	ld	a,(_sc+32,x)
4425  00ba a4c0          	and	a,#192
4426  00bc a1c0          	cp	a,#192
4427  00be 2740          	jreq	L3361
4428                     ; 656 			mal.frame_h1 = 0xEE;
4430  00c0 a6ee          	ld	a,#238
4431  00c2 6b02          	ld	(OFST-54,sp),a
4432                     ; 657 			mal.frame_h2 = 0xEE;
4434  00c4 a6ee          	ld	a,#238
4435  00c6 6b03          	ld	(OFST-53,sp),a
4436                     ; 658 			mal.message_id = 66+i;
4438  00c8 7b01          	ld	a,(OFST-55,sp)
4439  00ca ab42          	add	a,#66
4440  00cc 6b04          	ld	(OFST-52,sp),a
4441                     ; 659 			mal.mesh_id_H = ns_host_meshid_H;
4443  00ce c60089        	ld	a,_ns_host_meshid_H
4444  00d1 6b05          	ld	(OFST-51,sp),a
4445                     ; 660 			mal.mesh_id_L = ns_host_meshid_L;
4447  00d3 c60088        	ld	a,_ns_host_meshid_L
4448  00d6 6b06          	ld	(OFST-50,sp),a
4449                     ; 661 			mal.payload[0] = 0x0A;
4451  00d8 a60a          	ld	a,#10
4452  00da 6b07          	ld	(OFST-49,sp),a
4453                     ; 662 			mal.payload[1] = 0xB2;
4455  00dc a6b2          	ld	a,#178
4456  00de 6b08          	ld	(OFST-48,sp),a
4457                     ; 663 			mal.payload[2] =	sc.spc[i].MDID;
4459  00e0 7b01          	ld	a,(OFST-55,sp)
4460  00e2 97            	ld	xl,a
4461  00e3 a61c          	ld	a,#28
4462  00e5 42            	mul	x,a
4463  00e6 d600bc        	ld	a,(_sc+45,x)
4464  00e9 6b09          	ld	(OFST-47,sp),a
4465                     ; 664 			mal.payload[3] =	sc.spc[i].HWTtest;
4467  00eb 7b01          	ld	a,(OFST-55,sp)
4468  00ed 97            	ld	xl,a
4469  00ee a61c          	ld	a,#28
4470  00f0 42            	mul	x,a
4471  00f1 d600af        	ld	a,(_sc+32,x)
4472  00f4 6b0a          	ld	(OFST-46,sp),a
4473                     ; 665 			sicp_send_message(&mal,4);
4475  00f6 4b04          	push	#4
4476  00f8 96            	ldw	x,sp
4477  00f9 1c0003        	addw	x,#OFST-53
4478  00fc cd0000        	call	_sicp_send_message
4480  00ff 84            	pop	a
4481  0100               L3361:
4482                     ; 654 	for(i = 0; i < 15;i++){
4484  0100 0c01          	inc	(OFST-55,sp)
4487  0102 7b01          	ld	a,(OFST-55,sp)
4488  0104 a10f          	cp	a,#15
4489  0106 259b          	jrult	L5261
4490                     ; 668 }
4493  0108 5b38          	addw	sp,#56
4494  010a 81            	ret
4532                     ; 671 void check_send_repeatedly(void){
4533                     .text:	section	.text,new
4534  0000               _check_send_repeatedly:
4536  0000 88            	push	a
4537       00000001      OFST:	set	1
4540                     ; 674 	if(di_timeout){
4542  0001 725d0001      	tnz	_di_timeout
4543  0005 2766          	jreq	L1561
4544                     ; 675 		if(--di_timeout == 0){
4546  0007 725a0001      	dec	_di_timeout
4547  000b 2660          	jrne	L1561
4548                     ; 676 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4550  000d c603d2        	ld	a,_sc+835
4551  0010 a502          	bcp	a,#2
4552  0012 2607          	jrne	L5561
4555  0014 cd0000        	call	_send_sc_device_info
4559  0017 35050001      	mov	_di_timeout,#5
4560  001b               L5561:
4561                     ; 677 			for(i = 0; i < 15; i++){
4563  001b 0f01          	clr	(OFST+0,sp)
4564  001d               L7561:
4565                     ; 678 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4567  001d 7b01          	ld	a,(OFST+0,sp)
4568  001f 97            	ld	xl,a
4569  0020 a61a          	ld	a,#26
4570  0022 42            	mul	x,a
4571  0023 d60260        	ld	a,(_sc+465,x)
4572  0026 da025f        	or	a,(_sc+464,x)
4573  0029 2716          	jreq	L5661
4575  002b 7b01          	ld	a,(OFST+0,sp)
4576  002d 97            	ld	xl,a
4577  002e a61a          	ld	a,#26
4578  0030 42            	mul	x,a
4579  0031 d60265        	ld	a,(_sc+470,x)
4580  0034 a502          	bcp	a,#2
4581  0036 2609          	jrne	L5661
4584  0038 7b01          	ld	a,(OFST+0,sp)
4585  003a cd0000        	call	_send_slc_device_info
4589  003d 35050001      	mov	_di_timeout,#5
4590  0041               L5661:
4591                     ; 679 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4593  0041 7b01          	ld	a,(OFST+0,sp)
4594  0043 97            	ld	xl,a
4595  0044 a61c          	ld	a,#28
4596  0046 42            	mul	x,a
4597  0047 d600bc        	ld	a,(_sc+45,x)
4598  004a da00bb        	or	a,(_sc+44,x)
4599  004d 2716          	jreq	L7661
4601  004f 7b01          	ld	a,(OFST+0,sp)
4602  0051 97            	ld	xl,a
4603  0052 a61c          	ld	a,#28
4604  0054 42            	mul	x,a
4605  0055 d600c3        	ld	a,(_sc+52,x)
4606  0058 a502          	bcp	a,#2
4607  005a 2609          	jrne	L7661
4610  005c 7b01          	ld	a,(OFST+0,sp)
4611  005e cd0000        	call	_send_spc_device_info
4615  0061 35050001      	mov	_di_timeout,#5
4616  0065               L7661:
4617                     ; 677 			for(i = 0; i < 15; i++){
4619  0065 0c01          	inc	(OFST+0,sp)
4622  0067 7b01          	ld	a,(OFST+0,sp)
4623  0069 a10f          	cp	a,#15
4624  006b 25b0          	jrult	L7561
4625  006d               L1561:
4626                     ; 683 }
4629  006d 84            	pop	a
4630  006e 81            	ret
4643                     	xdef	_send_spc_device_info
4644                     	xdef	_send_slc_device_info
4645                     	xdef	_send_sc_device_info
4646                     	xdef	_clear_uart_buf
4647                     	xdef	_Uart2_Send
4648                     	xref	_rand
4649                     	xref	_i2c_multiple_action_dimmer
4650                     	xref	_i2c_action_plug
4651                     	xref	_i2c_single_action_dimmer
4652                     	xref	_i2c_get_energy_consum
4653                     	xref	_action_dimmer_ext
4654                     	xdef	_delay
4655                     	xref	_systime_count
4656                     	xref	_init_slc_spc_done
4657                     	xref	_sys_init
4658                     	xdef	_check_send_repeatedly
4659                     	xdef	_send_malfunction
4660                     	xdef	_send_device_info
4661                     	xdef	_report_energy_consum
4662                     	xdef	_rev_cmd_data
4663                     	xdef	_sicp_receipt_Done
4664                     	xdef	_sicp_receipt_OK
4665                     	xdef	_sicp_send_message
4666                     	xdef	_random
4667                     	xdef	_rev_deal
4668                     	xdef	_Check_Sum
4669                     	xdef	_rev_anaylze
4670                     	xdef	_UART2_RX_ISR
4671                     	xdef	_UART2_TX_ISR
4672                     	xdef	_Init_uart2
4673                     	xdef	_mymemcpy
4674                     	switch	.bss
4675  0000               _mal_timeout:
4676  0000 00            	ds.b	1
4677                     	xdef	_mal_timeout
4678  0001               _di_timeout:
4679  0001 00            	ds.b	1
4680                     	xdef	_di_timeout
4681  0002               _send_failed_count:
4682  0002 0000          	ds.b	2
4683                     	xdef	_send_failed_count
4684  0004               _send_fault_count:
4685  0004 0000          	ds.b	2
4686                     	xdef	_send_fault_count
4687  0006               _sicp_buf:
4688  0006 000000000000  	ds.b	40
4689                     	xdef	_sicp_buf
4690  002e               _Uart2_Rec_Cnt:
4691  002e 00            	ds.b	1
4692                     	xdef	_Uart2_Rec_Cnt
4693  002f               _Uart2_Rece_Buf:
4694  002f 000000000000  	ds.b	40
4695                     	xdef	_Uart2_Rece_Buf
4696  0057               _Uart2_Send_Done:
4697  0057 00            	ds.b	1
4698                     	xdef	_Uart2_Send_Done
4699  0058               _Uart2_Send_Cnt:
4700  0058 00            	ds.b	1
4701                     	xdef	_Uart2_Send_Cnt
4702  0059               _Uart2_Send_Length:
4703  0059 00            	ds.b	1
4704                     	xdef	_Uart2_Send_Length
4705  005a               _UART2_Send_Buf:
4706  005a 000000000000  	ds.b	40
4707                     	xdef	_UART2_Send_Buf
4708  0082               _rev_ad_channel:
4709  0082 00            	ds.b	1
4710                     	xdef	_rev_ad_channel
4711  0083               _rev_ad_mdid:
4712  0083 00            	ds.b	1
4713                     	xdef	_rev_ad_mdid
4714  0084               _rev_ad_message_id:
4715  0084 00            	ds.b	1
4716                     	xdef	_rev_ad_message_id
4717  0085               _rev_mesh_id_L:
4718  0085 00            	ds.b	1
4719                     	xdef	_rev_mesh_id_L
4720  0086               _rev_mesh_id_H:
4721  0086 00            	ds.b	1
4722                     	xdef	_rev_mesh_id_H
4723  0087               _rev_message_id:
4724  0087 00            	ds.b	1
4725                     	xdef	_rev_message_id
4726  0088               _ns_host_meshid_L:
4727  0088 00            	ds.b	1
4728                     	xdef	_ns_host_meshid_L
4729  0089               _ns_host_meshid_H:
4730  0089 00            	ds.b	1
4731                     	xdef	_ns_host_meshid_H
4732  008a               _ns_own_meshid_L:
4733  008a 00            	ds.b	1
4734                     	xdef	_ns_own_meshid_L
4735  008b               _ns_own_meshid_H:
4736  008b 00            	ds.b	1
4737                     	xdef	_ns_own_meshid_H
4738  008c               _ns_phonenum:
4739  008c 00            	ds.b	1
4740                     	xdef	_ns_phonenum
4741  008d               _ns_status:
4742  008d 00            	ds.b	1
4743                     	xdef	_ns_status
4744  008e               _ns_signal:
4745  008e 00            	ds.b	1
4746                     	xdef	_ns_signal
4747  008f               _sc:
4748  008f 000000000000  	ds.b	836
4749                     	xdef	_sc
4750  03d3               _UART1Flag6_:
4751  03d3 00            	ds.b	1
4752                     	xdef	_UART1Flag6_
4753  03d4               _UART1Flag5_:
4754  03d4 00            	ds.b	1
4755                     	xdef	_UART1Flag5_
4756  03d5               _UART1Flag4_:
4757  03d5 00            	ds.b	1
4758                     	xdef	_UART1Flag4_
4759  03d6               _UART1Flag3_:
4760  03d6 00            	ds.b	1
4761                     	xdef	_UART1Flag3_
4762  03d7               _UART1Flag2_:
4763  03d7 00            	ds.b	1
4764                     	xdef	_UART1Flag2_
4765  03d8               _UART1Flag1_:
4766  03d8 00            	ds.b	1
4767                     	xdef	_UART1Flag1_
4768                     	xref	_UART2_ITConfig
4769                     	xref	_UART2_Cmd
4770                     	xref	_UART2_Init
4771                     	xref	_UART2_DeInit
4772                     	xref.b	c_lreg
4773                     	xref.b	c_x
4774                     	xref.b	c_y
4794                     	xref	c_idiv
4795                     	xref	c_lrzmp
4796                     	xref	c_lgsbc
4797                     	xref	c_ltor
4798                     	end
