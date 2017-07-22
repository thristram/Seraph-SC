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
1917                     ; 235 void rev_anaylze(void)
1917                     ; 236 {
1918                     .text:	section	.text,new
1919  0000               _rev_anaylze:
1921  0000 523b          	subw	sp,#59
1922       0000003b      OFST:	set	59
1925                     ; 239 	if(rev_success){
1927  0002 c603d8        	ld	a,_UART1Flag1_
1928  0005 a501          	bcp	a,#1
1929  0007 2603          	jrne	L25
1930  0009 cc04ea        	jp	L3111
1931  000c               L25:
1932                     ; 240 		rev_success = 0;
1934  000c 721103d8      	bres	_UART1Flag1_,#0
1935                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1937  0010 c60006        	ld	a,_sicp_buf
1938  0013 a1ee          	cp	a,#238
1939  0015 2614          	jrne	L5111
1941  0017 c60007        	ld	a,_sicp_buf+1
1942  001a a1ee          	cp	a,#238
1943  001c 2707          	jreq	L7111
1945  001e c60007        	ld	a,_sicp_buf+1
1946  0021 a1aa          	cp	a,#170
1947  0023 2606          	jrne	L5111
1948  0025               L7111:
1949                     ; 242 			ble_data_frame = 1;
1951  0025 721203d8      	bset	_UART1Flag1_,#1
1953  0029 2012          	jra	L1211
1954  002b               L5111:
1955                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1957  002b c60006        	ld	a,_sicp_buf
1958  002e a1dd          	cp	a,#221
1959  0030 260b          	jrne	L1211
1961  0032 c60007        	ld	a,_sicp_buf+1
1962  0035 a1dd          	cp	a,#221
1963  0037 2604          	jrne	L1211
1964                     ; 245 			ble_ctrl_frame = 1;
1966  0039 721403d8      	bset	_UART1Flag1_,#2
1967  003d               L1211:
1968                     ; 248 		if (ble_data_frame){
1970  003d c603d8        	ld	a,_UART1Flag1_
1971  0040 a502          	bcp	a,#2
1972  0042 2603          	jrne	L45
1973  0044 cc0480        	jp	L5211
1974  0047               L45:
1975                     ; 249 			ble_data_frame = 0;
1977  0047 721303d8      	bres	_UART1Flag1_,#1
1978                     ; 250 			rev_message_id = sicp_buf[2];
1980  004b 5500080087    	mov	_rev_message_id,_sicp_buf+2
1981                     ; 251 			rev_mesh_id_H	= sicp_buf[3];
1983  0050 5500090086    	mov	_rev_mesh_id_H,_sicp_buf+3
1984                     ; 252 			rev_mesh_id_L = sicp_buf[4];
1986  0055 55000a0085    	mov	_rev_mesh_id_L,_sicp_buf+4
1987                     ; 253 			switch(sicp_buf[6]){
1989  005a c6000c        	ld	a,_sicp_buf+6
1991                     ; 362 				break;
1992  005d a003          	sub	a,#3
1993  005f 2732          	jreq	L5101
1994  0061 a04e          	sub	a,#78
1995  0063 2742          	jreq	L7101
1996  0065 4a            	dec	a
1997  0066 273f          	jreq	L7101
1998  0068 4a            	dec	a
1999  0069 273c          	jreq	L7101
2000  006b 4a            	dec	a
2001  006c 2739          	jreq	L7101
2002  006e 4a            	dec	a
2003  006f 2603          	jrne	L65
2004  0071 cc00fd        	jp	L1201
2005  0074               L65:
2006  0074 a002          	sub	a,#2
2007  0076 2603          	jrne	L06
2008  0078 cc014c        	jp	L3201
2009  007b               L06:
2010  007b 4a            	dec	a
2011  007c 2603          	jrne	L26
2012  007e cc025f        	jp	L5201
2013  0081               L26:
2014  0081 a052          	sub	a,#82
2015  0083 2603          	jrne	L46
2016  0085 cc0372        	jp	L7201
2017  0088               L46:
2018  0088 a006          	sub	a,#6
2019  008a 2603          	jrne	L66
2020  008c cc0457        	jp	L3301
2021  008f               L66:
2022  008f acea04ea      	jpf	L3111
2023  0093               L5101:
2024                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2024                     ; 255 					if(sicp_buf[7] == 0x03){
2026  0093 c6000d        	ld	a,_sicp_buf+7
2027  0096 a103          	cp	a,#3
2028  0098 2703          	jreq	L07
2029  009a cc04ea        	jp	L3111
2030  009d               L07:
2031                     ; 256 						rev_cmd_data(sicp_buf[8]);
2033  009d c6000e        	ld	a,_sicp_buf+8
2034  00a0 cd0000        	call	_rev_cmd_data
2036  00a3 acea04ea      	jpf	L3111
2037  00a7               L7101:
2038                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2038                     ; 260 				case 0x52:
2038                     ; 261 				case 0x53:
2038                     ; 262 				case 0x54:
2038                     ; 263 					rev_ad_message_id = sicp_buf[2];
2040  00a7 5500080084    	mov	_rev_ad_message_id,_sicp_buf+2
2041                     ; 264 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2043  00ac c6000d        	ld	a,_sicp_buf+7
2044  00af a4f0          	and	a,#240
2045  00b1 4e            	swap	a
2046  00b2 a40f          	and	a,#15
2047  00b4 c70083        	ld	_rev_ad_mdid,a
2048                     ; 265 					rev_ad_channel = (sicp_buf[7]&0x0f);
2050  00b7 c6000d        	ld	a,_sicp_buf+7
2051  00ba a40f          	and	a,#15
2052  00bc c70082        	ld	_rev_ad_channel,a
2053                     ; 266 					action_dimmer_ext = sicp_buf[9]+2;
2055  00bf c6000f        	ld	a,_sicp_buf+9
2056  00c2 ab02          	add	a,#2
2057  00c4 c70000        	ld	_action_dimmer_ext,a
2058                     ; 268 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2060  00c7 3b000f        	push	_sicp_buf+9
2061  00ca 3b000e        	push	_sicp_buf+8
2062  00cd c6000d        	ld	a,_sicp_buf+7
2063  00d0 97            	ld	xl,a
2064  00d1 c6000c        	ld	a,_sicp_buf+6
2065  00d4 95            	ld	xh,a
2066  00d5 cd0000        	call	_i2c_single_action_dimmer
2068  00d8 85            	popw	x
2069  00d9 6b3b          	ld	(OFST+0,sp),a
2070                     ; 269 					delay(100);
2072  00db ae0064        	ldw	x,#100
2073  00de cd0000        	call	_delay
2075                     ; 270 					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2077  00e1 0d3b          	tnz	(OFST+0,sp)
2078  00e3 2703          	jreq	L27
2079  00e5 cc04ea        	jp	L3111
2080  00e8               L27:
2083  00e8 3b0088        	push	_ns_host_meshid_L
2084  00eb 3b0089        	push	_ns_host_meshid_H
2085  00ee c60087        	ld	a,_rev_message_id
2086  00f1 97            	ld	xl,a
2087  00f2 a602          	ld	a,#2
2088  00f4 95            	ld	xh,a
2089  00f5 cd0000        	call	_sicp_receipt_OK
2091  00f8 85            	popw	x
2092  00f9 acea04ea      	jpf	L3111
2093  00fd               L1201:
2094                     ; 273 				case 0x55://打开或关闭开关
2094                     ; 274 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2096  00fd c6000d        	ld	a,_sicp_buf+7
2097  0100 a4f0          	and	a,#240
2098  0102 4e            	swap	a
2099  0103 a40f          	and	a,#15
2100  0105 c70083        	ld	_rev_ad_mdid,a
2101                     ; 275 					rev_ad_channel = (sicp_buf[7]&0x0f);
2103  0108 c6000d        	ld	a,_sicp_buf+7
2104  010b a40f          	and	a,#15
2105  010d c70082        	ld	_rev_ad_channel,a
2106                     ; 277 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2108  0110 3b000f        	push	_sicp_buf+9
2109  0113 3b000e        	push	_sicp_buf+8
2110  0116 c6000d        	ld	a,_sicp_buf+7
2111  0119 97            	ld	xl,a
2112  011a c6000c        	ld	a,_sicp_buf+6
2113  011d 95            	ld	xh,a
2114  011e cd0000        	call	_i2c_action_plug
2116  0121 85            	popw	x
2117  0122 6b3b          	ld	(OFST+0,sp),a
2118                     ; 278 					delay(100);
2120  0124 ae0064        	ldw	x,#100
2121  0127 cd0000        	call	_delay
2123                     ; 279 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
2125  012a 0d3b          	tnz	(OFST+0,sp)
2126  012c 2703          	jreq	L47
2127  012e cc04ea        	jp	L3111
2128  0131               L47:
2131  0131 3b0083        	push	_rev_ad_mdid
2132  0134 4b02          	push	#2
2133  0136 3b0088        	push	_ns_host_meshid_L
2134  0139 3b0089        	push	_ns_host_meshid_H
2135  013c c60087        	ld	a,_rev_message_id
2136  013f 97            	ld	xl,a
2137  0140 a605          	ld	a,#5
2138  0142 95            	ld	xh,a
2139  0143 cd0000        	call	_sicp_receipt_Done
2141  0146 5b04          	addw	sp,#4
2142  0148 acea04ea      	jpf	L3111
2143  014c               L3201:
2144                     ; 281 				case 0x57://一个SC下多个SLC多个通道调光
2144                     ; 282 					action_dimmer_num = sicp_buf[7];
2146  014c c6000d        	ld	a,_sicp_buf+7
2147  014f 6b03          	ld	(OFST-56,sp),a
2148                     ; 283 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2150  0151 3b0088        	push	_ns_host_meshid_L
2151  0154 3b0089        	push	_ns_host_meshid_H
2152  0157 c60087        	ld	a,_rev_message_id
2153  015a 97            	ld	xl,a
2154  015b a602          	ld	a,#2
2155  015d 95            	ld	xh,a
2156  015e cd0000        	call	_sicp_receipt_OK
2158  0161 85            	popw	x
2159                     ; 285 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2161  0162 7b03          	ld	a,(OFST-56,sp)
2162  0164 cd0000        	call	_i2c_multiple_action_dimmer
2164  0167 6b3b          	ld	(OFST+0,sp),a
2165                     ; 286 					delay(100);
2167  0169 ae0064        	ldw	x,#100
2168  016c cd0000        	call	_delay
2170                     ; 287 					if(ret == IIC_SUCCESS){
2172  016f 0d3b          	tnz	(OFST+0,sp)
2173  0171 2703          	jreq	L67
2174  0173 cc04ea        	jp	L3111
2175  0176               L67:
2176                     ; 288 						receipt.frame_h1 = 0xEE;
2178  0176 a6ee          	ld	a,#238
2179  0178 6b04          	ld	(OFST-55,sp),a
2180                     ; 289 						receipt.frame_h2 = 0xAA;
2182  017a a6aa          	ld	a,#170
2183  017c 6b05          	ld	(OFST-54,sp),a
2184                     ; 290 						receipt.message_id = rev_message_id;
2186  017e c60087        	ld	a,_rev_message_id
2187  0181 6b06          	ld	(OFST-53,sp),a
2188                     ; 291 						receipt.mesh_id_H = ns_own_meshid_H;
2190  0183 c6008b        	ld	a,_ns_own_meshid_H
2191  0186 6b07          	ld	(OFST-52,sp),a
2192                     ; 292 						receipt.mesh_id_L = ns_own_meshid_L;
2194  0188 c6008a        	ld	a,_ns_own_meshid_L
2195  018b 6b08          	ld	(OFST-51,sp),a
2196                     ; 293 						receipt.payload[0] = 0xAA;
2198  018d a6aa          	ld	a,#170
2199  018f 6b09          	ld	(OFST-50,sp),a
2200                     ; 294 						receipt.payload[1] = 0x05;
2202  0191 a605          	ld	a,#5
2203  0193 6b0a          	ld	(OFST-49,sp),a
2204                     ; 295 						receipt.payload[2] = action_dimmer_num;
2206  0195 7b03          	ld	a,(OFST-56,sp)
2207  0197 6b0b          	ld	(OFST-48,sp),a
2208                     ; 296 						i = 0;
2210  0199 0f3b          	clr	(OFST+0,sp)
2212  019b ac3f023f      	jpf	L7411
2213  019f               L3411:
2214                     ; 298 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2216  019f 7b3b          	ld	a,(OFST+0,sp)
2217  01a1 5f            	clrw	x
2218  01a2 97            	ld	xl,a
2219  01a3 d6000e        	ld	a,(_sicp_buf+8,x)
2220  01a6 a4f0          	and	a,#240
2221  01a8 4e            	swap	a
2222  01a9 a40f          	and	a,#15
2223  01ab c70083        	ld	_rev_ad_mdid,a
2224                     ; 299 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2226  01ae 7b3b          	ld	a,(OFST+0,sp)
2227  01b0 5f            	clrw	x
2228  01b1 97            	ld	xl,a
2229  01b2 d6000e        	ld	a,(_sicp_buf+8,x)
2230  01b5 a40f          	and	a,#15
2231  01b7 c70082        	ld	_rev_ad_channel,a
2232                     ; 300 							receipt.payload[3+i*5] = rev_ad_mdid;
2234  01ba 96            	ldw	x,sp
2235  01bb 1c000c        	addw	x,#OFST-47
2236  01be 1f01          	ldw	(OFST-58,sp),x
2237  01c0 7b3b          	ld	a,(OFST+0,sp)
2238  01c2 97            	ld	xl,a
2239  01c3 a605          	ld	a,#5
2240  01c5 42            	mul	x,a
2241  01c6 72fb01        	addw	x,(OFST-58,sp)
2242  01c9 c60083        	ld	a,_rev_ad_mdid
2243  01cc f7            	ld	(x),a
2244                     ; 301 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2246  01cd 96            	ldw	x,sp
2247  01ce 1c000d        	addw	x,#OFST-46
2248  01d1 1f01          	ldw	(OFST-58,sp),x
2249  01d3 7b3b          	ld	a,(OFST+0,sp)
2250  01d5 97            	ld	xl,a
2251  01d6 a605          	ld	a,#5
2252  01d8 42            	mul	x,a
2253  01d9 72fb01        	addw	x,(OFST-58,sp)
2254  01dc 89            	pushw	x
2255  01dd c60083        	ld	a,_rev_ad_mdid
2256  01e0 97            	ld	xl,a
2257  01e1 a61a          	ld	a,#26
2258  01e3 42            	mul	x,a
2259  01e4 d60261        	ld	a,(_sc+466,x)
2260  01e7 85            	popw	x
2261  01e8 f7            	ld	(x),a
2262                     ; 302 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2264  01e9 96            	ldw	x,sp
2265  01ea 1c000e        	addw	x,#OFST-45
2266  01ed 1f01          	ldw	(OFST-58,sp),x
2267  01ef 7b3b          	ld	a,(OFST+0,sp)
2268  01f1 97            	ld	xl,a
2269  01f2 a605          	ld	a,#5
2270  01f4 42            	mul	x,a
2271  01f5 72fb01        	addw	x,(OFST-58,sp)
2272  01f8 89            	pushw	x
2273  01f9 c60083        	ld	a,_rev_ad_mdid
2274  01fc 97            	ld	xl,a
2275  01fd a61a          	ld	a,#26
2276  01ff 42            	mul	x,a
2277  0200 d60262        	ld	a,(_sc+467,x)
2278  0203 85            	popw	x
2279  0204 f7            	ld	(x),a
2280                     ; 303 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2282  0205 96            	ldw	x,sp
2283  0206 1c000f        	addw	x,#OFST-44
2284  0209 1f01          	ldw	(OFST-58,sp),x
2285  020b 7b3b          	ld	a,(OFST+0,sp)
2286  020d 97            	ld	xl,a
2287  020e a605          	ld	a,#5
2288  0210 42            	mul	x,a
2289  0211 72fb01        	addw	x,(OFST-58,sp)
2290  0214 89            	pushw	x
2291  0215 c60083        	ld	a,_rev_ad_mdid
2292  0218 97            	ld	xl,a
2293  0219 a61a          	ld	a,#26
2294  021b 42            	mul	x,a
2295  021c d60263        	ld	a,(_sc+468,x)
2296  021f 85            	popw	x
2297  0220 f7            	ld	(x),a
2298                     ; 304 							receipt.payload[7+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2300  0221 96            	ldw	x,sp
2301  0222 1c0010        	addw	x,#OFST-43
2302  0225 1f01          	ldw	(OFST-58,sp),x
2303  0227 7b3b          	ld	a,(OFST+0,sp)
2304  0229 97            	ld	xl,a
2305  022a a605          	ld	a,#5
2306  022c 42            	mul	x,a
2307  022d 72fb01        	addw	x,(OFST-58,sp)
2308  0230 89            	pushw	x
2309  0231 c60083        	ld	a,_rev_ad_mdid
2310  0234 97            	ld	xl,a
2311  0235 a61a          	ld	a,#26
2312  0237 42            	mul	x,a
2313  0238 d60264        	ld	a,(_sc+469,x)
2314  023b 85            	popw	x
2315  023c f7            	ld	(x),a
2316                     ; 306 							i++;
2318  023d 0c3b          	inc	(OFST+0,sp)
2319  023f               L7411:
2320                     ; 297 						while(action_dimmer_num--){
2322  023f 7b03          	ld	a,(OFST-56,sp)
2323  0241 0a03          	dec	(OFST-56,sp)
2324  0243 4d            	tnz	a
2325  0244 2703          	jreq	L001
2326  0246 cc019f        	jp	L3411
2327  0249               L001:
2328                     ; 308 						sicp_send_message(&receipt,8+i*5);
2330  0249 7b3b          	ld	a,(OFST+0,sp)
2331  024b 97            	ld	xl,a
2332  024c a605          	ld	a,#5
2333  024e 42            	mul	x,a
2334  024f 9f            	ld	a,xl
2335  0250 ab08          	add	a,#8
2336  0252 88            	push	a
2337  0253 96            	ldw	x,sp
2338  0254 1c0005        	addw	x,#OFST-54
2339  0257 cd0000        	call	_sicp_send_message
2341  025a 84            	pop	a
2342  025b acea04ea      	jpf	L3111
2343  025f               L5201:
2344                     ; 311 				case 0x58://一个SC下多个SPC多个通道调光
2344                     ; 312 					action_plup_num = sicp_buf[7];
2346  025f c6000d        	ld	a,_sicp_buf+7
2347  0262 6b03          	ld	(OFST-56,sp),a
2348                     ; 313 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2350  0264 3b0088        	push	_ns_host_meshid_L
2351  0267 3b0089        	push	_ns_host_meshid_H
2352  026a c60087        	ld	a,_rev_message_id
2353  026d 97            	ld	xl,a
2354  026e a602          	ld	a,#2
2355  0270 95            	ld	xh,a
2356  0271 cd0000        	call	_sicp_receipt_OK
2358  0274 85            	popw	x
2359                     ; 314 					ret = i2c_multiple_action_plug(action_plup_num);
2361  0275 7b03          	ld	a,(OFST-56,sp)
2362  0277 cd0000        	call	_i2c_multiple_action_plug
2364  027a 6b3b          	ld	(OFST+0,sp),a
2365                     ; 316 					delay(100);
2367  027c ae0064        	ldw	x,#100
2368  027f cd0000        	call	_delay
2370                     ; 317 					if(ret == IIC_SUCCESS){
2372  0282 0d3b          	tnz	(OFST+0,sp)
2373  0284 2703          	jreq	L201
2374  0286 cc04ea        	jp	L3111
2375  0289               L201:
2376                     ; 318 						receipt.frame_h1 = 0xEE;
2378  0289 a6ee          	ld	a,#238
2379  028b 6b04          	ld	(OFST-55,sp),a
2380                     ; 319 						receipt.frame_h2 = 0xAA;
2382  028d a6aa          	ld	a,#170
2383  028f 6b05          	ld	(OFST-54,sp),a
2384                     ; 320 						receipt.message_id = rev_message_id;
2386  0291 c60087        	ld	a,_rev_message_id
2387  0294 6b06          	ld	(OFST-53,sp),a
2388                     ; 321 						receipt.mesh_id_H = ns_own_meshid_H;
2390  0296 c6008b        	ld	a,_ns_own_meshid_H
2391  0299 6b07          	ld	(OFST-52,sp),a
2392                     ; 322 						receipt.mesh_id_L = ns_own_meshid_L;
2394  029b c6008a        	ld	a,_ns_own_meshid_L
2395  029e 6b08          	ld	(OFST-51,sp),a
2396                     ; 323 						receipt.payload[0] = 0xAA;
2398  02a0 a6aa          	ld	a,#170
2399  02a2 6b09          	ld	(OFST-50,sp),a
2400                     ; 324 						receipt.payload[1] = 0x05;
2402  02a4 a605          	ld	a,#5
2403  02a6 6b0a          	ld	(OFST-49,sp),a
2404                     ; 325 						receipt.payload[2] = action_plup_num;
2406  02a8 7b03          	ld	a,(OFST-56,sp)
2407  02aa 6b0b          	ld	(OFST-48,sp),a
2408                     ; 326 						i = 0;
2410  02ac 0f3b          	clr	(OFST+0,sp)
2412  02ae ac520352      	jpf	L1611
2413  02b2               L5511:
2414                     ; 328 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2416  02b2 7b3b          	ld	a,(OFST+0,sp)
2417  02b4 5f            	clrw	x
2418  02b5 97            	ld	xl,a
2419  02b6 d6000e        	ld	a,(_sicp_buf+8,x)
2420  02b9 a4f0          	and	a,#240
2421  02bb 4e            	swap	a
2422  02bc a40f          	and	a,#15
2423  02be c70083        	ld	_rev_ad_mdid,a
2424                     ; 329 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2426  02c1 7b3b          	ld	a,(OFST+0,sp)
2427  02c3 5f            	clrw	x
2428  02c4 97            	ld	xl,a
2429  02c5 d6000e        	ld	a,(_sicp_buf+8,x)
2430  02c8 a40f          	and	a,#15
2431  02ca c70082        	ld	_rev_ad_channel,a
2432                     ; 330 							receipt.payload[3+i*5] = rev_ad_mdid;
2434  02cd 96            	ldw	x,sp
2435  02ce 1c000c        	addw	x,#OFST-47
2436  02d1 1f01          	ldw	(OFST-58,sp),x
2437  02d3 7b3b          	ld	a,(OFST+0,sp)
2438  02d5 97            	ld	xl,a
2439  02d6 a605          	ld	a,#5
2440  02d8 42            	mul	x,a
2441  02d9 72fb01        	addw	x,(OFST-58,sp)
2442  02dc c60083        	ld	a,_rev_ad_mdid
2443  02df f7            	ld	(x),a
2444                     ; 331 							receipt.payload[4+i*5] = sc.spc[rev_ad_mdid].ch1_status;
2446  02e0 96            	ldw	x,sp
2447  02e1 1c000d        	addw	x,#OFST-46
2448  02e4 1f01          	ldw	(OFST-58,sp),x
2449  02e6 7b3b          	ld	a,(OFST+0,sp)
2450  02e8 97            	ld	xl,a
2451  02e9 a605          	ld	a,#5
2452  02eb 42            	mul	x,a
2453  02ec 72fb01        	addw	x,(OFST-58,sp)
2454  02ef 89            	pushw	x
2455  02f0 c60083        	ld	a,_rev_ad_mdid
2456  02f3 97            	ld	xl,a
2457  02f4 a61c          	ld	a,#28
2458  02f6 42            	mul	x,a
2459  02f7 d600bd        	ld	a,(_sc+46,x)
2460  02fa 85            	popw	x
2461  02fb f7            	ld	(x),a
2462                     ; 332 							receipt.payload[5+i*5] = sc.spc[rev_ad_mdid].ch2_status;
2464  02fc 96            	ldw	x,sp
2465  02fd 1c000e        	addw	x,#OFST-45
2466  0300 1f01          	ldw	(OFST-58,sp),x
2467  0302 7b3b          	ld	a,(OFST+0,sp)
2468  0304 97            	ld	xl,a
2469  0305 a605          	ld	a,#5
2470  0307 42            	mul	x,a
2471  0308 72fb01        	addw	x,(OFST-58,sp)
2472  030b 89            	pushw	x
2473  030c c60083        	ld	a,_rev_ad_mdid
2474  030f 97            	ld	xl,a
2475  0310 a61c          	ld	a,#28
2476  0312 42            	mul	x,a
2477  0313 d600be        	ld	a,(_sc+47,x)
2478  0316 85            	popw	x
2479  0317 f7            	ld	(x),a
2480                     ; 333 							receipt.payload[6+i*5] = sc.spc[rev_ad_mdid].ch3_status;
2482  0318 96            	ldw	x,sp
2483  0319 1c000f        	addw	x,#OFST-44
2484  031c 1f01          	ldw	(OFST-58,sp),x
2485  031e 7b3b          	ld	a,(OFST+0,sp)
2486  0320 97            	ld	xl,a
2487  0321 a605          	ld	a,#5
2488  0323 42            	mul	x,a
2489  0324 72fb01        	addw	x,(OFST-58,sp)
2490  0327 89            	pushw	x
2491  0328 c60083        	ld	a,_rev_ad_mdid
2492  032b 97            	ld	xl,a
2493  032c a61c          	ld	a,#28
2494  032e 42            	mul	x,a
2495  032f d600bf        	ld	a,(_sc+48,x)
2496  0332 85            	popw	x
2497  0333 f7            	ld	(x),a
2498                     ; 334 							receipt.payload[7+i*5] = sc.spc[rev_ad_mdid].ch4_status;
2500  0334 96            	ldw	x,sp
2501  0335 1c0010        	addw	x,#OFST-43
2502  0338 1f01          	ldw	(OFST-58,sp),x
2503  033a 7b3b          	ld	a,(OFST+0,sp)
2504  033c 97            	ld	xl,a
2505  033d a605          	ld	a,#5
2506  033f 42            	mul	x,a
2507  0340 72fb01        	addw	x,(OFST-58,sp)
2508  0343 89            	pushw	x
2509  0344 c60083        	ld	a,_rev_ad_mdid
2510  0347 97            	ld	xl,a
2511  0348 a61c          	ld	a,#28
2512  034a 42            	mul	x,a
2513  034b d600c0        	ld	a,(_sc+49,x)
2514  034e 85            	popw	x
2515  034f f7            	ld	(x),a
2516                     ; 335 							i++;
2518  0350 0c3b          	inc	(OFST+0,sp)
2519  0352               L1611:
2520                     ; 327 						while(action_plup_num--){
2522  0352 7b03          	ld	a,(OFST-56,sp)
2523  0354 0a03          	dec	(OFST-56,sp)
2524  0356 4d            	tnz	a
2525  0357 2703          	jreq	L401
2526  0359 cc02b2        	jp	L5511
2527  035c               L401:
2528                     ; 337 						sicp_send_message(&receipt,8+i*5);
2530  035c 7b3b          	ld	a,(OFST+0,sp)
2531  035e 97            	ld	xl,a
2532  035f a605          	ld	a,#5
2533  0361 42            	mul	x,a
2534  0362 9f            	ld	a,xl
2535  0363 ab08          	add	a,#8
2536  0365 88            	push	a
2537  0366 96            	ldw	x,sp
2538  0367 1c0005        	addw	x,#OFST-54
2539  036a cd0000        	call	_sicp_send_message
2541  036d 84            	pop	a
2542  036e acea04ea      	jpf	L3111
2543  0372               L7201:
2544                     ; 340 				case 0xAA:
2544                     ; 341 					if(sicp_buf[7] == 0x02)	{
2546  0372 c6000d        	ld	a,_sicp_buf+7
2547  0375 a102          	cp	a,#2
2548  0377 2703          	jreq	L601
2549  0379 cc04ea        	jp	L3111
2550  037c               L601:
2551                     ; 343 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2553  037c 725d0087      	tnz	_rev_message_id
2554  0380 271d          	jreq	L7611
2556  0382 c60087        	ld	a,_rev_message_id
2557  0385 a110          	cp	a,#16
2558  0387 2416          	jruge	L7611
2561  0389 c60087        	ld	a,_rev_message_id
2562  038c 97            	ld	xl,a
2563  038d a61c          	ld	a,#28
2564  038f 42            	mul	x,a
2565  0390 1d001c        	subw	x,#28
2566  0393 d600c3        	ld	a,(_sc+52,x)
2567  0396 aa01          	or	a,#1
2568  0398 d700c3        	ld	(_sc+52,x),a
2570  039b acea04ea      	jpf	L3111
2571  039f               L7611:
2572                     ; 345 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2574  039f c60087        	ld	a,_rev_message_id
2575  03a2 a110          	cp	a,#16
2576  03a4 2608          	jrne	L3711
2579  03a6 721203d2      	bset	_sc+835,#1
2581  03aa acea04ea      	jpf	L3111
2582  03ae               L3711:
2583                     ; 346 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2585  03ae c60087        	ld	a,_rev_message_id
2586  03b1 a115          	cp	a,#21
2587  03b3 251d          	jrult	L7711
2589  03b5 c60087        	ld	a,_rev_message_id
2590  03b8 a124          	cp	a,#36
2591  03ba 2416          	jruge	L7711
2594  03bc c60087        	ld	a,_rev_message_id
2595  03bf 97            	ld	xl,a
2596  03c0 a61a          	ld	a,#26
2597  03c2 42            	mul	x,a
2598  03c3 1d0222        	subw	x,#546
2599  03c6 d60265        	ld	a,(_sc+470,x)
2600  03c9 aa02          	or	a,#2
2601  03cb d70265        	ld	(_sc+470,x),a
2603  03ce acea04ea      	jpf	L3111
2604  03d2               L7711:
2605                     ; 347 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2607  03d2 c60087        	ld	a,_rev_message_id
2608  03d5 a124          	cp	a,#36
2609  03d7 251d          	jrult	L3021
2611  03d9 c60087        	ld	a,_rev_message_id
2612  03dc a133          	cp	a,#51
2613  03de 2416          	jruge	L3021
2616  03e0 c60087        	ld	a,_rev_message_id
2617  03e3 97            	ld	xl,a
2618  03e4 a61c          	ld	a,#28
2619  03e6 42            	mul	x,a
2620  03e7 1d03f0        	subw	x,#1008
2621  03ea d600c3        	ld	a,(_sc+52,x)
2622  03ed aa02          	or	a,#2
2623  03ef d700c3        	ld	(_sc+52,x),a
2625  03f2 acea04ea      	jpf	L3111
2626  03f6               L3021:
2627                     ; 349 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2629  03f6 c60087        	ld	a,_rev_message_id
2630  03f9 a111          	cp	a,#17
2631  03fb 2608          	jrne	L7021
2634  03fd 721403d2      	bset	_sc+835,#2
2636  0401 acea04ea      	jpf	L3111
2637  0405               L7021:
2638                     ; 350 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2640  0405 c60087        	ld	a,_rev_message_id
2641  0408 a133          	cp	a,#51
2642  040a 251d          	jrult	L3121
2644  040c c60087        	ld	a,_rev_message_id
2645  040f a142          	cp	a,#66
2646  0411 2416          	jruge	L3121
2649  0413 c60087        	ld	a,_rev_message_id
2650  0416 97            	ld	xl,a
2651  0417 a61a          	ld	a,#26
2652  0419 42            	mul	x,a
2653  041a 1d052e        	subw	x,#1326
2654  041d d60265        	ld	a,(_sc+470,x)
2655  0420 aa04          	or	a,#4
2656  0422 d70265        	ld	(_sc+470,x),a
2658  0425 acea04ea      	jpf	L3111
2659  0429               L3121:
2660                     ; 351 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2662  0429 c60087        	ld	a,_rev_message_id
2663  042c a142          	cp	a,#66
2664  042e 2403          	jruge	L011
2665  0430 cc04ea        	jp	L3111
2666  0433               L011:
2668  0433 c60087        	ld	a,_rev_message_id
2669  0436 a151          	cp	a,#81
2670  0438 2503          	jrult	L211
2671  043a cc04ea        	jp	L3111
2672  043d               L211:
2675  043d c60087        	ld	a,_rev_message_id
2676  0440 97            	ld	xl,a
2677  0441 a61c          	ld	a,#28
2678  0443 42            	mul	x,a
2679  0444 1d0738        	subw	x,#1848
2680  0447 d600c3        	ld	a,(_sc+52,x)
2681  044a aa04          	or	a,#4
2682  044c d700c3        	ld	(_sc+52,x),a
2683  044f acea04ea      	jpf	L3111
2684  0453               L1301:
2685                     ; 354 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2685                     ; 355 				break;
2687  0453 acea04ea      	jpf	L3111
2688  0457               L3301:
2689                     ; 356 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2689                     ; 357 					if(rev_message_id == 0x9E){
2691  0457 c60087        	ld	a,_rev_message_id
2692  045a a19e          	cp	a,#158
2693  045c 2703          	jreq	L411
2694  045e cc04ea        	jp	L3111
2695  0461               L411:
2696                     ; 358 						ns_host_meshid_H = rev_mesh_id_H;
2698  0461 5500860089    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2699                     ; 359 						ns_host_meshid_L = rev_mesh_id_L;
2701  0466 5500850088    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2702                     ; 360 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2704  046b 3b0088        	push	_ns_host_meshid_L
2705  046e 3b0089        	push	_ns_host_meshid_H
2706  0471 c60087        	ld	a,_rev_message_id
2707  0474 97            	ld	xl,a
2708  0475 a602          	ld	a,#2
2709  0477 95            	ld	xh,a
2710  0478 cd0000        	call	_sicp_receipt_OK
2712  047b 85            	popw	x
2713  047c 206c          	jra	L3111
2714  047e               L1311:
2715                     ; 362 				break;
2716  047e 206a          	jra	L3111
2717  0480               L5211:
2718                     ; 365 		else if (ble_ctrl_frame){
2720  0480 c603d8        	ld	a,_UART1Flag1_
2721  0483 a504          	bcp	a,#4
2722  0485 2763          	jreq	L3111
2723                     ; 366 			ble_ctrl_frame = 0;
2725  0487 721503d8      	bres	_UART1Flag1_,#2
2726                     ; 367 			switch(sicp_buf[4]){
2728  048b c6000a        	ld	a,_sicp_buf+4
2730                     ; 398 				break;
2731  048e 4a            	dec	a
2732  048f 2708          	jreq	L5301
2733  0491 4a            	dec	a
2734  0492 2724          	jreq	L7301
2735  0494 4a            	dec	a
2736  0495 272d          	jreq	L1401
2737  0497 2051          	jra	L3111
2738  0499               L5301:
2739                     ; 368 				case 0x01://网络状态帧
2739                     ; 369 				rev_bleheartbeat = 1;
2741  0499 721203d7      	bset	_UART1Flag2_,#1
2742                     ; 370 				ns_signal = sicp_buf[5];
2744  049d 55000b008e    	mov	_ns_signal,_sicp_buf+5
2745                     ; 371 				ns_status = sicp_buf[6];
2747  04a2 55000c008d    	mov	_ns_status,_sicp_buf+6
2748                     ; 372 				ns_phonenum = sicp_buf[7];
2750  04a7 55000d008c    	mov	_ns_phonenum,_sicp_buf+7
2751                     ; 373 				ns_own_meshid_H = sicp_buf[8];
2753  04ac 55000e008b    	mov	_ns_own_meshid_H,_sicp_buf+8
2754                     ; 374 				ns_own_meshid_L = sicp_buf[9];
2756  04b1 55000f008a    	mov	_ns_own_meshid_L,_sicp_buf+9
2757                     ; 381 				break;
2759  04b6 2032          	jra	L3111
2760  04b8               L7301:
2761                     ; 382 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2761                     ; 383 				sys_init();
2763  04b8 cd0000        	call	_sys_init
2765                     ; 384 				clear_uart_buf();
2767  04bb cd0000        	call	_clear_uart_buf
2769                     ; 385 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2771  04be 725f0000      	clr	_init_slc_spc_done
2772                     ; 386 				break;
2774  04c2 2026          	jra	L3111
2775  04c4               L1401:
2776                     ; 387 			case 0x03://重置芯片和网络，退出mesh连接
2776                     ; 388 				sys_init();
2778  04c4 cd0000        	call	_sys_init
2780                     ; 389 				clear_uart_buf();
2782  04c7 cd0000        	call	_clear_uart_buf
2784                     ; 390 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2786  04ca 725f0000      	clr	_init_slc_spc_done
2787                     ; 391 				ns_signal = 0x00;
2789  04ce 725f008e      	clr	_ns_signal
2790                     ; 392 				ns_status = 0x00;
2792  04d2 725f008d      	clr	_ns_status
2793                     ; 393 				ns_phonenum = 0x00;
2795  04d6 725f008c      	clr	_ns_phonenum
2796                     ; 394 				ns_own_meshid_H = 0x00;
2798  04da 725f008b      	clr	_ns_own_meshid_H
2799                     ; 395 				ns_own_meshid_L = 0x00;
2801  04de 725f008a      	clr	_ns_own_meshid_L
2802                     ; 396 				ns_host_meshid_H = 0x80;
2804  04e2 35800089      	mov	_ns_host_meshid_H,#128
2805                     ; 397 				ns_host_meshid_L = 0xFF;
2807  04e6 35ff0088      	mov	_ns_host_meshid_L,#255
2808                     ; 398 				break;
2810  04ea               L1321:
2811  04ea               L3111:
2812                     ; 402 }
2815  04ea 5b3b          	addw	sp,#59
2816  04ec 81            	ret
2865                     ; 405 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2865                     ; 406 {
2866                     .text:	section	.text,new
2867  0000               _sicp_send_message:
2869  0000 89            	pushw	x
2870       00000000      OFST:	set	0
2873                     ; 409 	UART2_Send_Buf[0] = tx->frame_h1;
2875  0001 f6            	ld	a,(x)
2876  0002 c7005a        	ld	_UART2_Send_Buf,a
2877                     ; 410 	UART2_Send_Buf[1] = tx->frame_h2;
2879  0005 e601          	ld	a,(1,x)
2880  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2881                     ; 411 	UART2_Send_Buf[2] = tx->message_id;
2883  000a e602          	ld	a,(2,x)
2884  000c c7005c        	ld	_UART2_Send_Buf+2,a
2885                     ; 412 	UART2_Send_Buf[3] = tx->mesh_id_H;
2887  000f e603          	ld	a,(3,x)
2888  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2889                     ; 413 	UART2_Send_Buf[4] = tx->mesh_id_L;
2891  0014 e604          	ld	a,(4,x)
2892  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2893                     ; 414 	UART2_Send_Buf[5] = 4+payload_len;
2895  0019 7b05          	ld	a,(OFST+5,sp)
2896  001b ab04          	add	a,#4
2897  001d c7005f        	ld	_UART2_Send_Buf+5,a
2898                     ; 415 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2900  0020 7b05          	ld	a,(OFST+5,sp)
2901  0022 b703          	ld	c_lreg+3,a
2902  0024 3f02          	clr	c_lreg+2
2903  0026 3f01          	clr	c_lreg+1
2904  0028 3f00          	clr	c_lreg
2905  002a be02          	ldw	x,c_lreg+2
2906  002c 89            	pushw	x
2907  002d be00          	ldw	x,c_lreg
2908  002f 89            	pushw	x
2909  0030 1e05          	ldw	x,(OFST+5,sp)
2910  0032 1c0005        	addw	x,#5
2911  0035 89            	pushw	x
2912  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2913  0039 cd0000        	call	_mymemcpy
2915  003c 5b06          	addw	sp,#6
2916                     ; 416 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2918  003e 7b05          	ld	a,(OFST+5,sp)
2919  0040 5f            	clrw	x
2920  0041 97            	ld	xl,a
2921  0042 89            	pushw	x
2922  0043 3b005f        	push	_UART2_Send_Buf+5
2923  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2924  0049 cd0000        	call	_Check_Sum
2926  004c 5b01          	addw	sp,#1
2927  004e 85            	popw	x
2928  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2929                     ; 417 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2931  0052 7b05          	ld	a,(OFST+5,sp)
2932  0054 5f            	clrw	x
2933  0055 97            	ld	xl,a
2934  0056 1c0007        	addw	x,#7
2935  0059 89            	pushw	x
2936  005a ae005a        	ldw	x,#_UART2_Send_Buf
2937  005d cd0000        	call	_Uart2_Send
2939  0060 85            	popw	x
2941  0061               L7521:
2942                     ; 418 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2944  0061 725d0057      	tnz	_Uart2_Send_Done
2945  0065 27fa          	jreq	L7521
2948  0067 725f0057      	clr	_Uart2_Send_Done
2949                     ; 419 }
2952  006b 85            	popw	x
2953  006c 81            	ret
3005                     ; 425 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
3005                     ; 426 {
3006                     .text:	section	.text,new
3007  0000               _sicp_receipt_OK:
3009  0000 5237          	subw	sp,#55
3010       00000037      OFST:	set	55
3013                     ; 428 	receipt.frame_h1 = 0xEE;
3015  0002 a6ee          	ld	a,#238
3016  0004 6b01          	ld	(OFST-54,sp),a
3017                     ; 429 	receipt.frame_h2 = 0xAA;
3019  0006 a6aa          	ld	a,#170
3020  0008 6b02          	ld	(OFST-53,sp),a
3021                     ; 430 	receipt.message_id = send_message_id;
3023  000a 9f            	ld	a,xl
3024  000b 6b03          	ld	(OFST-52,sp),a
3025                     ; 431 	receipt.mesh_id_H = ns_host_meshid_H;
3027  000d c60089        	ld	a,_ns_host_meshid_H
3028  0010 6b04          	ld	(OFST-51,sp),a
3029                     ; 432 	receipt.mesh_id_L = ns_host_meshid_L;
3031  0012 c60088        	ld	a,_ns_host_meshid_L
3032  0015 6b05          	ld	(OFST-50,sp),a
3033                     ; 433 	receipt.payload[0] = 0xAA;
3035  0017 a6aa          	ld	a,#170
3036  0019 6b06          	ld	(OFST-49,sp),a
3037                     ; 434 	receipt.payload[1] = type;
3039  001b 9e            	ld	a,xh
3040  001c 6b07          	ld	(OFST-48,sp),a
3041                     ; 435 	sicp_send_message(&receipt,2);
3043  001e 4b02          	push	#2
3044  0020 96            	ldw	x,sp
3045  0021 1c0002        	addw	x,#OFST-53
3046  0024 cd0000        	call	_sicp_send_message
3048  0027 84            	pop	a
3049                     ; 436 }
3052  0028 5b37          	addw	sp,#55
3053  002a 81            	ret
3127                     ; 438 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
3127                     ; 439 {
3128                     .text:	section	.text,new
3129  0000               _sicp_receipt_Done:
3131  0000 89            	pushw	x
3132  0001 5238          	subw	sp,#56
3133       00000038      OFST:	set	56
3136                     ; 440 	u8 i = 0;
3138  0003 0f38          	clr	(OFST+0,sp)
3139                     ; 442 	receipt.frame_h1 = 0xEE;
3141  0005 a6ee          	ld	a,#238
3142  0007 6b01          	ld	(OFST-55,sp),a
3143                     ; 443 	receipt.frame_h2 = 0xAA;
3145  0009 a6aa          	ld	a,#170
3146  000b 6b02          	ld	(OFST-54,sp),a
3147                     ; 444 	receipt.message_id = send_message_id;
3149  000d 9f            	ld	a,xl
3150  000e 6b03          	ld	(OFST-53,sp),a
3151                     ; 445 	receipt.mesh_id_H = ns_host_meshid_H;
3153  0010 c60089        	ld	a,_ns_host_meshid_H
3154  0013 6b04          	ld	(OFST-52,sp),a
3155                     ; 446 	receipt.mesh_id_L = ns_host_meshid_L;
3157  0015 c60088        	ld	a,_ns_host_meshid_L
3158  0018 6b05          	ld	(OFST-51,sp),a
3159                     ; 447 	receipt.payload[0] = 0xAA;
3161  001a a6aa          	ld	a,#170
3162  001c 6b06          	ld	(OFST-50,sp),a
3163                     ; 448 	receipt.payload[1] = type;
3165  001e 9e            	ld	a,xh
3166  001f 6b07          	ld	(OFST-49,sp),a
3167                     ; 449 	switch(method){
3169  0021 7b3f          	ld	a,(OFST+7,sp)
3171                     ; 476 		default:
3171                     ; 477 		break;
3172  0023 4a            	dec	a
3173  0024 2707          	jreq	L5031
3174  0026 4a            	dec	a
3175  0027 2766          	jreq	L7031
3176  0029 acef00ef      	jpf	L5431
3177  002d               L5031:
3178                     ; 450 		case 0x01://action Dimmer调光的执行回执
3178                     ; 451 		receipt.payload[2] = mdid;
3180  002d 7b40          	ld	a,(OFST+8,sp)
3181  002f 6b08          	ld	(OFST-48,sp),a
3182                     ; 452 		for(i = 0;i < 15;i++){
3184  0031 0f38          	clr	(OFST+0,sp)
3185  0033               L7431:
3186                     ; 453 			if(sc.slc[i].MDID == mdid){
3188  0033 7b38          	ld	a,(OFST+0,sp)
3189  0035 97            	ld	xl,a
3190  0036 a61a          	ld	a,#26
3191  0038 42            	mul	x,a
3192  0039 7b40          	ld	a,(OFST+8,sp)
3193  003b 905f          	clrw	y
3194  003d 9097          	ld	yl,a
3195  003f 90bf00        	ldw	c_y,y
3196  0042 9093          	ldw	y,x
3197  0044 90de025f      	ldw	y,(_sc+464,y)
3198  0048 90b300        	cpw	y,c_y
3199  004b 2638          	jrne	L5531
3200                     ; 454 				receipt.payload[3] = sc.slc[i].ch1_status;
3202  004d 7b38          	ld	a,(OFST+0,sp)
3203  004f 97            	ld	xl,a
3204  0050 a61a          	ld	a,#26
3205  0052 42            	mul	x,a
3206  0053 d60261        	ld	a,(_sc+466,x)
3207  0056 6b09          	ld	(OFST-47,sp),a
3208                     ; 455 				receipt.payload[4] = sc.slc[i].ch2_status;
3210  0058 7b38          	ld	a,(OFST+0,sp)
3211  005a 97            	ld	xl,a
3212  005b a61a          	ld	a,#26
3213  005d 42            	mul	x,a
3214  005e d60262        	ld	a,(_sc+467,x)
3215  0061 6b0a          	ld	(OFST-46,sp),a
3216                     ; 456 				receipt.payload[5] = sc.slc[i].ch3_status;
3218  0063 7b38          	ld	a,(OFST+0,sp)
3219  0065 97            	ld	xl,a
3220  0066 a61a          	ld	a,#26
3221  0068 42            	mul	x,a
3222  0069 d60263        	ld	a,(_sc+468,x)
3223  006c 6b0b          	ld	(OFST-45,sp),a
3224                     ; 457 				receipt.payload[6] = sc.slc[i].ch4_status;
3226  006e 7b38          	ld	a,(OFST+0,sp)
3227  0070 97            	ld	xl,a
3228  0071 a61a          	ld	a,#26
3229  0073 42            	mul	x,a
3230  0074 d60264        	ld	a,(_sc+469,x)
3231  0077 6b0c          	ld	(OFST-44,sp),a
3232                     ; 458 				sicp_send_message(&receipt,7);
3234  0079 4b07          	push	#7
3235  007b 96            	ldw	x,sp
3236  007c 1c0002        	addw	x,#OFST-54
3237  007f cd0000        	call	_sicp_send_message
3239  0082 84            	pop	a
3240                     ; 459 				break;
3242  0083 206a          	jra	L5431
3243  0085               L5531:
3244                     ; 452 		for(i = 0;i < 15;i++){
3246  0085 0c38          	inc	(OFST+0,sp)
3249  0087 7b38          	ld	a,(OFST+0,sp)
3250  0089 a10f          	cp	a,#15
3251  008b 25a6          	jrult	L7431
3252  008d 2060          	jra	L5431
3253  008f               L7031:
3254                     ; 463 		case 0x02://action plug switch打开或关闭开关的执行回执
3254                     ; 464 		receipt.payload[2] = mdid;
3256  008f 7b40          	ld	a,(OFST+8,sp)
3257  0091 6b08          	ld	(OFST-48,sp),a
3258                     ; 465 		for(i = 0;i < 15;i++){
3260  0093 0f38          	clr	(OFST+0,sp)
3261  0095               L7531:
3262                     ; 466 			if(sc.spc[i].MDID == mdid){
3264  0095 7b38          	ld	a,(OFST+0,sp)
3265  0097 97            	ld	xl,a
3266  0098 a61c          	ld	a,#28
3267  009a 42            	mul	x,a
3268  009b 7b40          	ld	a,(OFST+8,sp)
3269  009d 905f          	clrw	y
3270  009f 9097          	ld	yl,a
3271  00a1 90bf00        	ldw	c_y,y
3272  00a4 9093          	ldw	y,x
3273  00a6 90de00bb      	ldw	y,(_sc+44,y)
3274  00aa 90b300        	cpw	y,c_y
3275  00ad 2638          	jrne	L5631
3276                     ; 467 				receipt.payload[3] = sc.spc[i].ch1_status;
3278  00af 7b38          	ld	a,(OFST+0,sp)
3279  00b1 97            	ld	xl,a
3280  00b2 a61c          	ld	a,#28
3281  00b4 42            	mul	x,a
3282  00b5 d600bd        	ld	a,(_sc+46,x)
3283  00b8 6b09          	ld	(OFST-47,sp),a
3284                     ; 468 				receipt.payload[4] = sc.spc[i].ch2_status;
3286  00ba 7b38          	ld	a,(OFST+0,sp)
3287  00bc 97            	ld	xl,a
3288  00bd a61c          	ld	a,#28
3289  00bf 42            	mul	x,a
3290  00c0 d600be        	ld	a,(_sc+47,x)
3291  00c3 6b0a          	ld	(OFST-46,sp),a
3292                     ; 469 				receipt.payload[5] = sc.spc[i].ch3_status;
3294  00c5 7b38          	ld	a,(OFST+0,sp)
3295  00c7 97            	ld	xl,a
3296  00c8 a61c          	ld	a,#28
3297  00ca 42            	mul	x,a
3298  00cb d600bf        	ld	a,(_sc+48,x)
3299  00ce 6b0b          	ld	(OFST-45,sp),a
3300                     ; 470 				receipt.payload[6] = sc.spc[i].ch4_status;
3302  00d0 7b38          	ld	a,(OFST+0,sp)
3303  00d2 97            	ld	xl,a
3304  00d3 a61c          	ld	a,#28
3305  00d5 42            	mul	x,a
3306  00d6 d600c0        	ld	a,(_sc+49,x)
3307  00d9 6b0c          	ld	(OFST-44,sp),a
3308                     ; 471 				sicp_send_message(&receipt,7);
3310  00db 4b07          	push	#7
3311  00dd 96            	ldw	x,sp
3312  00de 1c0002        	addw	x,#OFST-54
3313  00e1 cd0000        	call	_sicp_send_message
3315  00e4 84            	pop	a
3316                     ; 472 				break;
3318  00e5 2008          	jra	L5431
3319  00e7               L5631:
3320                     ; 465 		for(i = 0;i < 15;i++){
3322  00e7 0c38          	inc	(OFST+0,sp)
3325  00e9 7b38          	ld	a,(OFST+0,sp)
3326  00eb a10f          	cp	a,#15
3327  00ed 25a6          	jrult	L7531
3328  00ef               L1131:
3329                     ; 476 		default:
3329                     ; 477 		break;
3331  00ef               L5431:
3332                     ; 479 }
3335  00ef 5b3a          	addw	sp,#58
3336  00f1 81            	ret
3390                     ; 482 void rev_cmd_data(u8 moduleid){
3391                     .text:	section	.text,new
3392  0000               _rev_cmd_data:
3394  0000 88            	push	a
3395  0001 5238          	subw	sp,#56
3396       00000038      OFST:	set	56
3399                     ; 485 	for(i = 0;i < 15;i++){
3401  0003 0f01          	clr	(OFST-55,sp)
3402  0005               L1141:
3403                     ; 486 		if(sc.slc[i].MDID == moduleid){
3405  0005 7b01          	ld	a,(OFST-55,sp)
3406  0007 97            	ld	xl,a
3407  0008 a61a          	ld	a,#26
3408  000a 42            	mul	x,a
3409  000b 7b39          	ld	a,(OFST+1,sp)
3410  000d 905f          	clrw	y
3411  000f 9097          	ld	yl,a
3412  0011 90bf00        	ldw	c_y,y
3413  0014 9093          	ldw	y,x
3414  0016 90de025f      	ldw	y,(_sc+464,y)
3415  001a 90b300        	cpw	y,c_y
3416  001d 2657          	jrne	L7141
3417                     ; 487 			cmd_data.frame_h1 = 0xEE;
3419  001f a6ee          	ld	a,#238
3420  0021 6b02          	ld	(OFST-54,sp),a
3421                     ; 488 			cmd_data.frame_h2 = 0xAA;
3423  0023 a6aa          	ld	a,#170
3424  0025 6b03          	ld	(OFST-53,sp),a
3425                     ; 489 			cmd_data.message_id = rev_message_id;
3427  0027 c60087        	ld	a,_rev_message_id
3428  002a 6b04          	ld	(OFST-52,sp),a
3429                     ; 490 			cmd_data.mesh_id_H = ns_host_meshid_H;
3431  002c c60089        	ld	a,_ns_host_meshid_H
3432  002f 6b05          	ld	(OFST-51,sp),a
3433                     ; 491 			cmd_data.mesh_id_L = ns_host_meshid_L;
3435  0031 c60088        	ld	a,_ns_host_meshid_L
3436  0034 6b06          	ld	(OFST-50,sp),a
3437                     ; 492 			cmd_data.payload[0] = 0x06;
3439  0036 a606          	ld	a,#6
3440  0038 6b07          	ld	(OFST-49,sp),a
3441                     ; 493 			cmd_data.payload[1] = moduleid;
3443  003a 7b39          	ld	a,(OFST+1,sp)
3444  003c 6b08          	ld	(OFST-48,sp),a
3445                     ; 494 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3447  003e 7b01          	ld	a,(OFST-55,sp)
3448  0040 97            	ld	xl,a
3449  0041 a61a          	ld	a,#26
3450  0043 42            	mul	x,a
3451  0044 d60261        	ld	a,(_sc+466,x)
3452  0047 6b09          	ld	(OFST-47,sp),a
3453                     ; 495 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3455  0049 7b01          	ld	a,(OFST-55,sp)
3456  004b 97            	ld	xl,a
3457  004c a61a          	ld	a,#26
3458  004e 42            	mul	x,a
3459  004f d60262        	ld	a,(_sc+467,x)
3460  0052 6b0a          	ld	(OFST-46,sp),a
3461                     ; 496 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3463  0054 7b01          	ld	a,(OFST-55,sp)
3464  0056 97            	ld	xl,a
3465  0057 a61a          	ld	a,#26
3466  0059 42            	mul	x,a
3467  005a d60263        	ld	a,(_sc+468,x)
3468  005d 6b0b          	ld	(OFST-45,sp),a
3469                     ; 497 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3471  005f 7b01          	ld	a,(OFST-55,sp)
3472  0061 97            	ld	xl,a
3473  0062 a61a          	ld	a,#26
3474  0064 42            	mul	x,a
3475  0065 d60264        	ld	a,(_sc+469,x)
3476  0068 6b0c          	ld	(OFST-44,sp),a
3477                     ; 498 			sicp_send_message(&cmd_data,6);
3479  006a 4b06          	push	#6
3480  006c 96            	ldw	x,sp
3481  006d 1c0003        	addw	x,#OFST-53
3482  0070 cd0000        	call	_sicp_send_message
3484  0073 84            	pop	a
3485                     ; 499 			break;
3487  0074 207c          	jra	L5141
3488  0076               L7141:
3489                     ; 501 		if(sc.spc[i].MDID == moduleid){
3491  0076 7b01          	ld	a,(OFST-55,sp)
3492  0078 97            	ld	xl,a
3493  0079 a61c          	ld	a,#28
3494  007b 42            	mul	x,a
3495  007c 7b39          	ld	a,(OFST+1,sp)
3496  007e 905f          	clrw	y
3497  0080 9097          	ld	yl,a
3498  0082 90bf00        	ldw	c_y,y
3499  0085 9093          	ldw	y,x
3500  0087 90de00bb      	ldw	y,(_sc+44,y)
3501  008b 90b300        	cpw	y,c_y
3502  008e 2657          	jrne	L1241
3503                     ; 502 			cmd_data.frame_h1 = 0xEE;
3505  0090 a6ee          	ld	a,#238
3506  0092 6b02          	ld	(OFST-54,sp),a
3507                     ; 503 			cmd_data.frame_h2 = 0xAA;
3509  0094 a6aa          	ld	a,#170
3510  0096 6b03          	ld	(OFST-53,sp),a
3511                     ; 504 			cmd_data.message_id = rev_message_id;
3513  0098 c60087        	ld	a,_rev_message_id
3514  009b 6b04          	ld	(OFST-52,sp),a
3515                     ; 505 			cmd_data.mesh_id_H = ns_host_meshid_H;
3517  009d c60089        	ld	a,_ns_host_meshid_H
3518  00a0 6b05          	ld	(OFST-51,sp),a
3519                     ; 506 			cmd_data.mesh_id_L = ns_host_meshid_L;
3521  00a2 c60088        	ld	a,_ns_host_meshid_L
3522  00a5 6b06          	ld	(OFST-50,sp),a
3523                     ; 507 			cmd_data.payload[0] = 0x06;
3525  00a7 a606          	ld	a,#6
3526  00a9 6b07          	ld	(OFST-49,sp),a
3527                     ; 508 			cmd_data.payload[1] = moduleid;
3529  00ab 7b39          	ld	a,(OFST+1,sp)
3530  00ad 6b08          	ld	(OFST-48,sp),a
3531                     ; 509 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3533  00af 7b01          	ld	a,(OFST-55,sp)
3534  00b1 97            	ld	xl,a
3535  00b2 a61c          	ld	a,#28
3536  00b4 42            	mul	x,a
3537  00b5 d600bd        	ld	a,(_sc+46,x)
3538  00b8 6b09          	ld	(OFST-47,sp),a
3539                     ; 510 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3541  00ba 7b01          	ld	a,(OFST-55,sp)
3542  00bc 97            	ld	xl,a
3543  00bd a61c          	ld	a,#28
3544  00bf 42            	mul	x,a
3545  00c0 d600be        	ld	a,(_sc+47,x)
3546  00c3 6b0a          	ld	(OFST-46,sp),a
3547                     ; 511 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3549  00c5 7b01          	ld	a,(OFST-55,sp)
3550  00c7 97            	ld	xl,a
3551  00c8 a61c          	ld	a,#28
3552  00ca 42            	mul	x,a
3553  00cb d600bf        	ld	a,(_sc+48,x)
3554  00ce 6b0b          	ld	(OFST-45,sp),a
3555                     ; 512 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3557  00d0 7b01          	ld	a,(OFST-55,sp)
3558  00d2 97            	ld	xl,a
3559  00d3 a61c          	ld	a,#28
3560  00d5 42            	mul	x,a
3561  00d6 d600c0        	ld	a,(_sc+49,x)
3562  00d9 6b0c          	ld	(OFST-44,sp),a
3563                     ; 513 			sicp_send_message(&cmd_data,6);
3565  00db 4b06          	push	#6
3566  00dd 96            	ldw	x,sp
3567  00de 1c0003        	addw	x,#OFST-53
3568  00e1 cd0000        	call	_sicp_send_message
3570  00e4 84            	pop	a
3571                     ; 514 			break;
3573  00e5 200b          	jra	L5141
3574  00e7               L1241:
3575                     ; 485 	for(i = 0;i < 15;i++){
3577  00e7 0c01          	inc	(OFST-55,sp)
3580  00e9 7b01          	ld	a,(OFST-55,sp)
3581  00eb a10f          	cp	a,#15
3582  00ed 2403          	jruge	L621
3583  00ef cc0005        	jp	L1141
3584  00f2               L621:
3585  00f2               L5141:
3586                     ; 517 }
3589  00f2 5b39          	addw	sp,#57
3590  00f4 81            	ret
3593                     	switch	.data
3594  0000               L3241_eg_timeout:
3595  0000 0000          	dc.w	0
3649                     ; 520 void report_energy_consum(void){
3650                     .text:	section	.text,new
3651  0000               _report_energy_consum:
3653  0000 5238          	subw	sp,#56
3654       00000038      OFST:	set	56
3657                     ; 524 	systime_count[3]++;
3659  0002 ce0006        	ldw	x,_systime_count+6
3660  0005 1c0001        	addw	x,#1
3661  0008 cf0006        	ldw	_systime_count+6,x
3662                     ; 525 	if(systime_count[3] >= 60){
3664  000b ce0006        	ldw	x,_systime_count+6
3665  000e a3003c        	cpw	x,#60
3666  0011 2403          	jruge	L231
3667  0013 cc00a2        	jp	L7441
3668  0016               L231:
3669                     ; 526 		systime_count[3] = 0;
3671  0016 5f            	clrw	x
3672  0017 cf0006        	ldw	_systime_count+6,x
3673                     ; 527 		systime_count[4]++;
3675  001a ce0008        	ldw	x,_systime_count+8
3676  001d 1c0001        	addw	x,#1
3677  0020 cf0008        	ldw	_systime_count+8,x
3678                     ; 528 		if(systime_count[4] >= 30){
3680  0023 ce0008        	ldw	x,_systime_count+8
3681  0026 a3001e        	cpw	x,#30
3682  0029 2577          	jrult	L7441
3683                     ; 529 			systime_count[4] = 0;
3685  002b 5f            	clrw	x
3686  002c cf0008        	ldw	_systime_count+8,x
3687                     ; 530 			i2c_get_energy_consum();
3689  002f cd0000        	call	_i2c_get_energy_consum
3691                     ; 531 			for(i = 0; i < 15; i++){
3693  0032 0f01          	clr	(OFST-55,sp)
3694  0034               L3541:
3695                     ; 532 				if(sc.spc[i].MDID){//有ID说明SPC存在
3697  0034 7b01          	ld	a,(OFST-55,sp)
3698  0036 97            	ld	xl,a
3699  0037 a61c          	ld	a,#28
3700  0039 42            	mul	x,a
3701  003a d600bc        	ld	a,(_sc+45,x)
3702  003d da00bb        	or	a,(_sc+44,x)
3703  0040 2758          	jreq	L1641
3704                     ; 533 				ec.frame_h1 = 0xEE;
3706  0042 a6ee          	ld	a,#238
3707  0044 6b02          	ld	(OFST-54,sp),a
3708                     ; 534 				ec.frame_h2 = 0xEE;
3710  0046 a6ee          	ld	a,#238
3711  0048 6b03          	ld	(OFST-53,sp),a
3712                     ; 535 				ec.message_id = i+1;
3714  004a 7b01          	ld	a,(OFST-55,sp)
3715  004c 4c            	inc	a
3716  004d 6b04          	ld	(OFST-52,sp),a
3717                     ; 536 				ec.mesh_id_H = ns_host_meshid_H;
3719  004f c60089        	ld	a,_ns_host_meshid_H
3720  0052 6b05          	ld	(OFST-51,sp),a
3721                     ; 537 				ec.mesh_id_L = ns_host_meshid_L;
3723  0054 c60088        	ld	a,_ns_host_meshid_L
3724  0057 6b06          	ld	(OFST-50,sp),a
3725                     ; 538 				ec.payload[0] = 0x2A;
3727  0059 a62a          	ld	a,#42
3728  005b 6b07          	ld	(OFST-49,sp),a
3729                     ; 539 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3731  005d 7b01          	ld	a,(OFST-55,sp)
3732  005f 97            	ld	xl,a
3733  0060 a61c          	ld	a,#28
3734  0062 42            	mul	x,a
3735  0063 de00c1        	ldw	x,(_sc+50,x)
3736  0066 01            	rrwa	x,a
3737  0067 9f            	ld	a,xl
3738  0068 a4ff          	and	a,#255
3739  006a 97            	ld	xl,a
3740  006b 4f            	clr	a
3741  006c 02            	rlwa	x,a
3742  006d 4f            	clr	a
3743  006e 01            	rrwa	x,a
3744  006f 9f            	ld	a,xl
3745  0070 6b08          	ld	(OFST-48,sp),a
3746                     ; 540 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3748  0072 7b01          	ld	a,(OFST-55,sp)
3749  0074 97            	ld	xl,a
3750  0075 a61c          	ld	a,#28
3751  0077 42            	mul	x,a
3752  0078 d600c2        	ld	a,(_sc+51,x)
3753  007b a4ff          	and	a,#255
3754  007d 6b09          	ld	(OFST-47,sp),a
3755                     ; 541 				ec.payload[3] =	sc.spc[i].MDID;
3757  007f 7b01          	ld	a,(OFST-55,sp)
3758  0081 97            	ld	xl,a
3759  0082 a61c          	ld	a,#28
3760  0084 42            	mul	x,a
3761  0085 d600bc        	ld	a,(_sc+45,x)
3762  0088 6b0a          	ld	(OFST-46,sp),a
3763                     ; 542 				sicp_send_message(&ec,4);
3765  008a 4b04          	push	#4
3766  008c 96            	ldw	x,sp
3767  008d 1c0003        	addw	x,#OFST-53
3768  0090 cd0000        	call	_sicp_send_message
3770  0093 84            	pop	a
3771                     ; 543 				eg_timeout = 5;
3773  0094 ae0005        	ldw	x,#5
3774  0097 cf0000        	ldw	L3241_eg_timeout,x
3775  009a               L1641:
3776                     ; 531 			for(i = 0; i < 15; i++){
3778  009a 0c01          	inc	(OFST-55,sp)
3781  009c 7b01          	ld	a,(OFST-55,sp)
3782  009e a10f          	cp	a,#15
3783  00a0 2592          	jrult	L3541
3784  00a2               L7441:
3785                     ; 549 	if(eg_timeout){
3787  00a2 ce0000        	ldw	x,L3241_eg_timeout
3788  00a5 2603          	jrne	L431
3789  00a7 cc0132        	jp	L3641
3790  00aa               L431:
3791                     ; 550 		if(--eg_timeout == 0){
3793  00aa ce0000        	ldw	x,L3241_eg_timeout
3794  00ad 1d0001        	subw	x,#1
3795  00b0 cf0000        	ldw	L3241_eg_timeout,x
3796  00b3 267d          	jrne	L3641
3797                     ; 551 			for(i = 0;i < 15;i++){
3799  00b5 0f01          	clr	(OFST-55,sp)
3800  00b7               L7641:
3801                     ; 552 				if((sc.spc[i].MDID!=0) && (!sc.spc[i].flag._flag_bit.bit0)){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3803  00b7 7b01          	ld	a,(OFST-55,sp)
3804  00b9 97            	ld	xl,a
3805  00ba a61c          	ld	a,#28
3806  00bc 42            	mul	x,a
3807  00bd d600bc        	ld	a,(_sc+45,x)
3808  00c0 da00bb        	or	a,(_sc+44,x)
3809  00c3 2765          	jreq	L5741
3811  00c5 7b01          	ld	a,(OFST-55,sp)
3812  00c7 97            	ld	xl,a
3813  00c8 a61c          	ld	a,#28
3814  00ca 42            	mul	x,a
3815  00cb d600c3        	ld	a,(_sc+52,x)
3816  00ce a501          	bcp	a,#1
3817  00d0 2658          	jrne	L5741
3818                     ; 553 					ec.frame_h1 = 0xEE;
3820  00d2 a6ee          	ld	a,#238
3821  00d4 6b02          	ld	(OFST-54,sp),a
3822                     ; 554 					ec.frame_h2 = 0xEE;
3824  00d6 a6ee          	ld	a,#238
3825  00d8 6b03          	ld	(OFST-53,sp),a
3826                     ; 555 					ec.message_id = i+1;
3828  00da 7b01          	ld	a,(OFST-55,sp)
3829  00dc 4c            	inc	a
3830  00dd 6b04          	ld	(OFST-52,sp),a
3831                     ; 556 					ec.mesh_id_H = ns_host_meshid_H;
3833  00df c60089        	ld	a,_ns_host_meshid_H
3834  00e2 6b05          	ld	(OFST-51,sp),a
3835                     ; 557 					ec.mesh_id_L = ns_host_meshid_L;
3837  00e4 c60088        	ld	a,_ns_host_meshid_L
3838  00e7 6b06          	ld	(OFST-50,sp),a
3839                     ; 558 					ec.payload[0] = 0x2A;
3841  00e9 a62a          	ld	a,#42
3842  00eb 6b07          	ld	(OFST-49,sp),a
3843                     ; 559 					ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3845  00ed 7b01          	ld	a,(OFST-55,sp)
3846  00ef 97            	ld	xl,a
3847  00f0 a61c          	ld	a,#28
3848  00f2 42            	mul	x,a
3849  00f3 de00c1        	ldw	x,(_sc+50,x)
3850  00f6 01            	rrwa	x,a
3851  00f7 9f            	ld	a,xl
3852  00f8 a4ff          	and	a,#255
3853  00fa 97            	ld	xl,a
3854  00fb 4f            	clr	a
3855  00fc 02            	rlwa	x,a
3856  00fd 4f            	clr	a
3857  00fe 01            	rrwa	x,a
3858  00ff 9f            	ld	a,xl
3859  0100 6b08          	ld	(OFST-48,sp),a
3860                     ; 560 					ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3862  0102 7b01          	ld	a,(OFST-55,sp)
3863  0104 97            	ld	xl,a
3864  0105 a61c          	ld	a,#28
3865  0107 42            	mul	x,a
3866  0108 d600c2        	ld	a,(_sc+51,x)
3867  010b a4ff          	and	a,#255
3868  010d 6b09          	ld	(OFST-47,sp),a
3869                     ; 561 					ec.payload[3] =	sc.spc[i].MDID;
3871  010f 7b01          	ld	a,(OFST-55,sp)
3872  0111 97            	ld	xl,a
3873  0112 a61c          	ld	a,#28
3874  0114 42            	mul	x,a
3875  0115 d600bc        	ld	a,(_sc+45,x)
3876  0118 6b0a          	ld	(OFST-46,sp),a
3877                     ; 562 					sicp_send_message(&ec,4);
3879  011a 4b04          	push	#4
3880  011c 96            	ldw	x,sp
3881  011d 1c0003        	addw	x,#OFST-53
3882  0120 cd0000        	call	_sicp_send_message
3884  0123 84            	pop	a
3885                     ; 563 					eg_timeout = 5;//每5s重发1次直到接收到回执为止
3887  0124 ae0005        	ldw	x,#5
3888  0127 cf0000        	ldw	L3241_eg_timeout,x
3889  012a               L5741:
3890                     ; 551 			for(i = 0;i < 15;i++){
3892  012a 0c01          	inc	(OFST-55,sp)
3895  012c 7b01          	ld	a,(OFST-55,sp)
3896  012e a10f          	cp	a,#15
3897  0130 2585          	jrult	L7641
3898  0132               L3641:
3899                     ; 568 }
3902  0132 5b38          	addw	sp,#56
3903  0134 81            	ret
3943                     ; 571 void send_sc_device_info(void)
3943                     ; 572 {
3944                     .text:	section	.text,new
3945  0000               _send_sc_device_info:
3947  0000 5237          	subw	sp,#55
3948       00000037      OFST:	set	55
3951                     ; 575 	di.frame_h1 = 0xEE;
3953  0002 a6ee          	ld	a,#238
3954  0004 6b01          	ld	(OFST-54,sp),a
3955                     ; 576 	di.frame_h2 = 0xEE;
3957  0006 a6ee          	ld	a,#238
3958  0008 6b02          	ld	(OFST-53,sp),a
3959                     ; 577 	di.message_id = 16;
3961  000a a610          	ld	a,#16
3962  000c 6b03          	ld	(OFST-52,sp),a
3963                     ; 578 	di.mesh_id_H = ns_host_meshid_H;
3965  000e c60089        	ld	a,_ns_host_meshid_H
3966  0011 6b04          	ld	(OFST-51,sp),a
3967                     ; 579 	di.mesh_id_L = ns_host_meshid_L;
3969  0013 c60088        	ld	a,_ns_host_meshid_L
3970  0016 6b05          	ld	(OFST-50,sp),a
3971                     ; 580 	di.payload[0] = 0xB1;
3973  0018 a6b1          	ld	a,#177
3974  001a 6b06          	ld	(OFST-49,sp),a
3975                     ; 581 	di.payload[1] =	sc.deviceid[0];
3977  001c c60091        	ld	a,_sc+2
3978  001f 6b07          	ld	(OFST-48,sp),a
3979                     ; 582 	di.payload[2] =	sc.deviceid[1];
3981  0021 c60092        	ld	a,_sc+3
3982  0024 6b08          	ld	(OFST-47,sp),a
3983                     ; 583 	di.payload[3] =	sc.deviceid[2];
3985  0026 c60093        	ld	a,_sc+4
3986  0029 6b09          	ld	(OFST-46,sp),a
3987                     ; 584 	di.payload[4] =	sc.deviceid[3];
3989  002b c60094        	ld	a,_sc+5
3990  002e 6b0a          	ld	(OFST-45,sp),a
3991                     ; 585 	di.payload[5] =	sc.model;
3993  0030 c60097        	ld	a,_sc+8
3994  0033 6b0b          	ld	(OFST-44,sp),a
3995                     ; 586 	di.payload[6] = sc.firmware;
3997  0035 c60095        	ld	a,_sc+6
3998  0038 6b0c          	ld	(OFST-43,sp),a
3999                     ; 587 	di.payload[7] = sc.HWTtest;
4001  003a c60096        	ld	a,_sc+7
4002  003d 6b0d          	ld	(OFST-42,sp),a
4003                     ; 588 	di.payload[8] = sc.Ndevice;
4005  003f c600a2        	ld	a,_sc+19
4006  0042 6b0e          	ld	(OFST-41,sp),a
4007                     ; 589 	sicp_send_message(&di,9);
4009  0044 4b09          	push	#9
4010  0046 96            	ldw	x,sp
4011  0047 1c0002        	addw	x,#OFST-53
4012  004a cd0000        	call	_sicp_send_message
4014  004d 84            	pop	a
4015                     ; 590 }
4018  004e 5b37          	addw	sp,#55
4019  0050 81            	ret
4066                     ; 592 void send_slc_device_info(u8 i)
4066                     ; 593 {
4067                     .text:	section	.text,new
4068  0000               _send_slc_device_info:
4070  0000 88            	push	a
4071  0001 5237          	subw	sp,#55
4072       00000037      OFST:	set	55
4075                     ; 595 	di.frame_h1 = 0xEE;
4077  0003 a6ee          	ld	a,#238
4078  0005 6b01          	ld	(OFST-54,sp),a
4079                     ; 596 	di.frame_h2 = 0xEE;
4081  0007 a6ee          	ld	a,#238
4082  0009 6b02          	ld	(OFST-53,sp),a
4083                     ; 597 	di.message_id = 21+i;
4085  000b 7b38          	ld	a,(OFST+1,sp)
4086  000d ab15          	add	a,#21
4087  000f 6b03          	ld	(OFST-52,sp),a
4088                     ; 598 	di.mesh_id_H = ns_host_meshid_H;
4090  0011 c60089        	ld	a,_ns_host_meshid_H
4091  0014 6b04          	ld	(OFST-51,sp),a
4092                     ; 599 	di.mesh_id_L = ns_host_meshid_L;
4094  0016 c60088        	ld	a,_ns_host_meshid_L
4095  0019 6b05          	ld	(OFST-50,sp),a
4096                     ; 600 	di.payload[0] = 0xB2;
4098  001b a6b2          	ld	a,#178
4099  001d 6b06          	ld	(OFST-49,sp),a
4100                     ; 601 	di.payload[1] =	sc.slc[i].deviceid[0];
4102  001f 7b38          	ld	a,(OFST+1,sp)
4103  0021 97            	ld	xl,a
4104  0022 a61a          	ld	a,#26
4105  0024 42            	mul	x,a
4106  0025 d6024e        	ld	a,(_sc+447,x)
4107  0028 6b07          	ld	(OFST-48,sp),a
4108                     ; 602 	di.payload[2] =	sc.slc[i].deviceid[1];
4110  002a 7b38          	ld	a,(OFST+1,sp)
4111  002c 97            	ld	xl,a
4112  002d a61a          	ld	a,#26
4113  002f 42            	mul	x,a
4114  0030 d6024f        	ld	a,(_sc+448,x)
4115  0033 6b08          	ld	(OFST-47,sp),a
4116                     ; 603 	di.payload[3] =	sc.slc[i].deviceid[2];
4118  0035 7b38          	ld	a,(OFST+1,sp)
4119  0037 97            	ld	xl,a
4120  0038 a61a          	ld	a,#26
4121  003a 42            	mul	x,a
4122  003b d60250        	ld	a,(_sc+449,x)
4123  003e 6b09          	ld	(OFST-46,sp),a
4124                     ; 604 	di.payload[4] =	sc.slc[i].deviceid[3];
4126  0040 7b38          	ld	a,(OFST+1,sp)
4127  0042 97            	ld	xl,a
4128  0043 a61a          	ld	a,#26
4129  0045 42            	mul	x,a
4130  0046 d60251        	ld	a,(_sc+450,x)
4131  0049 6b0a          	ld	(OFST-45,sp),a
4132                     ; 605 	di.payload[5] =	sc.slc[i].model;
4134  004b 7b38          	ld	a,(OFST+1,sp)
4135  004d 97            	ld	xl,a
4136  004e a61a          	ld	a,#26
4137  0050 42            	mul	x,a
4138  0051 d60254        	ld	a,(_sc+453,x)
4139  0054 6b0b          	ld	(OFST-44,sp),a
4140                     ; 606 	di.payload[6] = sc.slc[i].firmware;
4142  0056 7b38          	ld	a,(OFST+1,sp)
4143  0058 97            	ld	xl,a
4144  0059 a61a          	ld	a,#26
4145  005b 42            	mul	x,a
4146  005c d60252        	ld	a,(_sc+451,x)
4147  005f 6b0c          	ld	(OFST-43,sp),a
4148                     ; 607 	di.payload[7] = sc.slc[i].HWTtest;
4150  0061 7b38          	ld	a,(OFST+1,sp)
4151  0063 97            	ld	xl,a
4152  0064 a61a          	ld	a,#26
4153  0066 42            	mul	x,a
4154  0067 d60253        	ld	a,(_sc+452,x)
4155  006a 6b0d          	ld	(OFST-42,sp),a
4156                     ; 608 	di.payload[8] = sc.slc[i].MDID;
4158  006c 7b38          	ld	a,(OFST+1,sp)
4159  006e 97            	ld	xl,a
4160  006f a61a          	ld	a,#26
4161  0071 42            	mul	x,a
4162  0072 d60260        	ld	a,(_sc+465,x)
4163  0075 6b0e          	ld	(OFST-41,sp),a
4164                     ; 609 	sicp_send_message(&di,9);
4166  0077 4b09          	push	#9
4167  0079 96            	ldw	x,sp
4168  007a 1c0002        	addw	x,#OFST-53
4169  007d cd0000        	call	_sicp_send_message
4171  0080 84            	pop	a
4172                     ; 610 }
4175  0081 5b38          	addw	sp,#56
4176  0083 81            	ret
4223                     ; 612 void send_spc_device_info(u8 i)
4223                     ; 613 {
4224                     .text:	section	.text,new
4225  0000               _send_spc_device_info:
4227  0000 88            	push	a
4228  0001 5237          	subw	sp,#55
4229       00000037      OFST:	set	55
4232                     ; 615 	di.frame_h1 = 0xEE;
4234  0003 a6ee          	ld	a,#238
4235  0005 6b01          	ld	(OFST-54,sp),a
4236                     ; 616 	di.frame_h2 = 0xEE;
4238  0007 a6ee          	ld	a,#238
4239  0009 6b02          	ld	(OFST-53,sp),a
4240                     ; 617 	di.message_id = 36+i;
4242  000b 7b38          	ld	a,(OFST+1,sp)
4243  000d ab24          	add	a,#36
4244  000f 6b03          	ld	(OFST-52,sp),a
4245                     ; 618 	di.mesh_id_H = ns_host_meshid_H;
4247  0011 c60089        	ld	a,_ns_host_meshid_H
4248  0014 6b04          	ld	(OFST-51,sp),a
4249                     ; 619 	di.mesh_id_L = ns_host_meshid_L;
4251  0016 c60088        	ld	a,_ns_host_meshid_L
4252  0019 6b05          	ld	(OFST-50,sp),a
4253                     ; 620 	di.payload[0] = 0xB3;
4255  001b a6b3          	ld	a,#179
4256  001d 6b06          	ld	(OFST-49,sp),a
4257                     ; 621 	di.payload[1] =	sc.spc[i].deviceid[0];
4259  001f 7b38          	ld	a,(OFST+1,sp)
4260  0021 97            	ld	xl,a
4261  0022 a61c          	ld	a,#28
4262  0024 42            	mul	x,a
4263  0025 d600aa        	ld	a,(_sc+27,x)
4264  0028 6b07          	ld	(OFST-48,sp),a
4265                     ; 622 	di.payload[2] =	sc.spc[i].deviceid[1];
4267  002a 7b38          	ld	a,(OFST+1,sp)
4268  002c 97            	ld	xl,a
4269  002d a61c          	ld	a,#28
4270  002f 42            	mul	x,a
4271  0030 d600ab        	ld	a,(_sc+28,x)
4272  0033 6b08          	ld	(OFST-47,sp),a
4273                     ; 623 	di.payload[3] =	sc.spc[i].deviceid[2];
4275  0035 7b38          	ld	a,(OFST+1,sp)
4276  0037 97            	ld	xl,a
4277  0038 a61c          	ld	a,#28
4278  003a 42            	mul	x,a
4279  003b d600ac        	ld	a,(_sc+29,x)
4280  003e 6b09          	ld	(OFST-46,sp),a
4281                     ; 624 	di.payload[4] =	sc.spc[i].deviceid[3];
4283  0040 7b38          	ld	a,(OFST+1,sp)
4284  0042 97            	ld	xl,a
4285  0043 a61c          	ld	a,#28
4286  0045 42            	mul	x,a
4287  0046 d600ad        	ld	a,(_sc+30,x)
4288  0049 6b0a          	ld	(OFST-45,sp),a
4289                     ; 625 	di.payload[5] =	sc.spc[i].model;
4291  004b 7b38          	ld	a,(OFST+1,sp)
4292  004d 97            	ld	xl,a
4293  004e a61c          	ld	a,#28
4294  0050 42            	mul	x,a
4295  0051 d600b0        	ld	a,(_sc+33,x)
4296  0054 6b0b          	ld	(OFST-44,sp),a
4297                     ; 626 	di.payload[6] = sc.spc[i].firmware;
4299  0056 7b38          	ld	a,(OFST+1,sp)
4300  0058 97            	ld	xl,a
4301  0059 a61c          	ld	a,#28
4302  005b 42            	mul	x,a
4303  005c d600ae        	ld	a,(_sc+31,x)
4304  005f 6b0c          	ld	(OFST-43,sp),a
4305                     ; 627 	di.payload[7] = sc.spc[i].HWTtest;
4307  0061 7b38          	ld	a,(OFST+1,sp)
4308  0063 97            	ld	xl,a
4309  0064 a61c          	ld	a,#28
4310  0066 42            	mul	x,a
4311  0067 d600af        	ld	a,(_sc+32,x)
4312  006a 6b0d          	ld	(OFST-42,sp),a
4313                     ; 628 	di.payload[8] = sc.spc[i].MDID;
4315  006c 7b38          	ld	a,(OFST+1,sp)
4316  006e 97            	ld	xl,a
4317  006f a61c          	ld	a,#28
4318  0071 42            	mul	x,a
4319  0072 d600bc        	ld	a,(_sc+45,x)
4320  0075 6b0e          	ld	(OFST-41,sp),a
4321                     ; 629 	sicp_send_message(&di,9);
4323  0077 4b09          	push	#9
4324  0079 96            	ldw	x,sp
4325  007a 1c0002        	addw	x,#OFST-53
4326  007d cd0000        	call	_sicp_send_message
4328  0080 84            	pop	a
4329                     ; 630 }
4332  0081 5b38          	addw	sp,#56
4333  0083 81            	ret
4371                     ; 632 void send_device_info(void)
4371                     ; 633 {
4372                     .text:	section	.text,new
4373  0000               _send_device_info:
4375  0000 88            	push	a
4376       00000001      OFST:	set	1
4379                     ; 636 	send_sc_device_info();
4381  0001 cd0000        	call	_send_sc_device_info
4383                     ; 637 	delay(100);
4385  0004 ae0064        	ldw	x,#100
4386  0007 cd0000        	call	_delay
4388                     ; 639 	for(i = 0; i < 15;i++){
4390  000a 0f01          	clr	(OFST+0,sp)
4391  000c               L1751:
4392                     ; 640 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4394  000c 7b01          	ld	a,(OFST+0,sp)
4395  000e 97            	ld	xl,a
4396  000f a61a          	ld	a,#26
4397  0011 42            	mul	x,a
4398  0012 d60260        	ld	a,(_sc+465,x)
4399  0015 da025f        	or	a,(_sc+464,x)
4400  0018 270b          	jreq	L7751
4401                     ; 641 			send_slc_device_info(i);
4403  001a 7b01          	ld	a,(OFST+0,sp)
4404  001c cd0000        	call	_send_slc_device_info
4406                     ; 642 			delay(100);
4408  001f ae0064        	ldw	x,#100
4409  0022 cd0000        	call	_delay
4411  0025               L7751:
4412                     ; 639 	for(i = 0; i < 15;i++){
4414  0025 0c01          	inc	(OFST+0,sp)
4417  0027 7b01          	ld	a,(OFST+0,sp)
4418  0029 a10f          	cp	a,#15
4419  002b 25df          	jrult	L1751
4420                     ; 646 	for(i = 0; i < 15;i++){
4422  002d 0f01          	clr	(OFST+0,sp)
4423  002f               L1061:
4424                     ; 647 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4426  002f 7b01          	ld	a,(OFST+0,sp)
4427  0031 97            	ld	xl,a
4428  0032 a61c          	ld	a,#28
4429  0034 42            	mul	x,a
4430  0035 d600bc        	ld	a,(_sc+45,x)
4431  0038 da00bb        	or	a,(_sc+44,x)
4432  003b 270b          	jreq	L7061
4433                     ; 648 			send_spc_device_info(i);
4435  003d 7b01          	ld	a,(OFST+0,sp)
4436  003f cd0000        	call	_send_spc_device_info
4438                     ; 649 			delay(100);
4440  0042 ae0064        	ldw	x,#100
4441  0045 cd0000        	call	_delay
4443  0048               L7061:
4444                     ; 646 	for(i = 0; i < 15;i++){
4446  0048 0c01          	inc	(OFST+0,sp)
4449  004a 7b01          	ld	a,(OFST+0,sp)
4450  004c a10f          	cp	a,#15
4451  004e 25df          	jrult	L1061
4452                     ; 652 	di_timeout = 5;
4454  0050 35050001      	mov	_di_timeout,#5
4455                     ; 653 }
4458  0054 84            	pop	a
4459  0055 81            	ret
4505                     ; 656 void send_malfunction(void)
4505                     ; 657 {
4506                     .text:	section	.text,new
4507  0000               _send_malfunction:
4509  0000 5238          	subw	sp,#56
4510       00000038      OFST:	set	56
4513                     ; 661 	if((sc.HWTtest & 0xC0)!=0xC0){
4515  0002 c60096        	ld	a,_sc+7
4516  0005 a4c0          	and	a,#192
4517  0007 a1c0          	cp	a,#192
4518  0009 272f          	jreq	L1361
4519                     ; 662 		mal.frame_h1 = 0xEE;
4521  000b a6ee          	ld	a,#238
4522  000d 6b02          	ld	(OFST-54,sp),a
4523                     ; 663 		mal.frame_h2 = 0xEE;
4525  000f a6ee          	ld	a,#238
4526  0011 6b03          	ld	(OFST-53,sp),a
4527                     ; 664 		mal.message_id = 17;
4529  0013 a611          	ld	a,#17
4530  0015 6b04          	ld	(OFST-52,sp),a
4531                     ; 665 		mal.mesh_id_H = ns_host_meshid_H;
4533  0017 c60089        	ld	a,_ns_host_meshid_H
4534  001a 6b05          	ld	(OFST-51,sp),a
4535                     ; 666 		mal.mesh_id_L = ns_host_meshid_L;
4537  001c c60088        	ld	a,_ns_host_meshid_L
4538  001f 6b06          	ld	(OFST-50,sp),a
4539                     ; 667 		mal.payload[0] = 0x0A;
4541  0021 a60a          	ld	a,#10
4542  0023 6b07          	ld	(OFST-49,sp),a
4543                     ; 668 		mal.payload[1] = 0xB1;
4545  0025 a6b1          	ld	a,#177
4546  0027 6b08          	ld	(OFST-48,sp),a
4547                     ; 669 		mal.payload[2] =	0x00;
4549  0029 0f09          	clr	(OFST-47,sp)
4550                     ; 670 		mal.payload[3] =	sc.HWTtest;
4552  002b c60096        	ld	a,_sc+7
4553  002e 6b0a          	ld	(OFST-46,sp),a
4554                     ; 671 		sicp_send_message(&mal,4);
4556  0030 4b04          	push	#4
4557  0032 96            	ldw	x,sp
4558  0033 1c0003        	addw	x,#OFST-53
4559  0036 cd0000        	call	_sicp_send_message
4561  0039 84            	pop	a
4562  003a               L1361:
4563                     ; 674 	for(i = 0; i < 15;i++){
4565  003a 0f01          	clr	(OFST-55,sp)
4566  003c               L3361:
4567                     ; 675 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4569  003c 7b01          	ld	a,(OFST-55,sp)
4570  003e 97            	ld	xl,a
4571  003f a61a          	ld	a,#26
4572  0041 42            	mul	x,a
4573  0042 d60260        	ld	a,(_sc+465,x)
4574  0045 da025f        	or	a,(_sc+464,x)
4575  0048 274f          	jreq	L1461
4577  004a 7b01          	ld	a,(OFST-55,sp)
4578  004c 97            	ld	xl,a
4579  004d a61a          	ld	a,#26
4580  004f 42            	mul	x,a
4581  0050 d60253        	ld	a,(_sc+452,x)
4582  0053 a4c0          	and	a,#192
4583  0055 a1c0          	cp	a,#192
4584  0057 2740          	jreq	L1461
4585                     ; 676 			mal.frame_h1 = 0xEE;
4587  0059 a6ee          	ld	a,#238
4588  005b 6b02          	ld	(OFST-54,sp),a
4589                     ; 677 			mal.frame_h2 = 0xEE;
4591  005d a6ee          	ld	a,#238
4592  005f 6b03          	ld	(OFST-53,sp),a
4593                     ; 678 			mal.message_id = 51+i;
4595  0061 7b01          	ld	a,(OFST-55,sp)
4596  0063 ab33          	add	a,#51
4597  0065 6b04          	ld	(OFST-52,sp),a
4598                     ; 679 			mal.mesh_id_H = ns_host_meshid_H;
4600  0067 c60089        	ld	a,_ns_host_meshid_H
4601  006a 6b05          	ld	(OFST-51,sp),a
4602                     ; 680 			mal.mesh_id_L = ns_host_meshid_L;
4604  006c c60088        	ld	a,_ns_host_meshid_L
4605  006f 6b06          	ld	(OFST-50,sp),a
4606                     ; 681 			mal.payload[0] = 0x0A;
4608  0071 a60a          	ld	a,#10
4609  0073 6b07          	ld	(OFST-49,sp),a
4610                     ; 682 			mal.payload[1] = 0xB2;
4612  0075 a6b2          	ld	a,#178
4613  0077 6b08          	ld	(OFST-48,sp),a
4614                     ; 683 			mal.payload[2] =	sc.slc[i].MDID;
4616  0079 7b01          	ld	a,(OFST-55,sp)
4617  007b 97            	ld	xl,a
4618  007c a61a          	ld	a,#26
4619  007e 42            	mul	x,a
4620  007f d60260        	ld	a,(_sc+465,x)
4621  0082 6b09          	ld	(OFST-47,sp),a
4622                     ; 684 			mal.payload[3] =	sc.slc[i].HWTtest;
4624  0084 7b01          	ld	a,(OFST-55,sp)
4625  0086 97            	ld	xl,a
4626  0087 a61a          	ld	a,#26
4627  0089 42            	mul	x,a
4628  008a d60253        	ld	a,(_sc+452,x)
4629  008d 6b0a          	ld	(OFST-46,sp),a
4630                     ; 685 			sicp_send_message(&mal,4);
4632  008f 4b04          	push	#4
4633  0091 96            	ldw	x,sp
4634  0092 1c0003        	addw	x,#OFST-53
4635  0095 cd0000        	call	_sicp_send_message
4637  0098 84            	pop	a
4638  0099               L1461:
4639                     ; 674 	for(i = 0; i < 15;i++){
4641  0099 0c01          	inc	(OFST-55,sp)
4644  009b 7b01          	ld	a,(OFST-55,sp)
4645  009d a10f          	cp	a,#15
4646  009f 259b          	jrult	L3361
4647                     ; 689 	for(i = 0; i < 15;i++){
4649  00a1 0f01          	clr	(OFST-55,sp)
4650  00a3               L3461:
4651                     ; 690 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4653  00a3 7b01          	ld	a,(OFST-55,sp)
4654  00a5 97            	ld	xl,a
4655  00a6 a61c          	ld	a,#28
4656  00a8 42            	mul	x,a
4657  00a9 d600bc        	ld	a,(_sc+45,x)
4658  00ac da00bb        	or	a,(_sc+44,x)
4659  00af 274f          	jreq	L1561
4661  00b1 7b01          	ld	a,(OFST-55,sp)
4662  00b3 97            	ld	xl,a
4663  00b4 a61c          	ld	a,#28
4664  00b6 42            	mul	x,a
4665  00b7 d600af        	ld	a,(_sc+32,x)
4666  00ba a4c0          	and	a,#192
4667  00bc a1c0          	cp	a,#192
4668  00be 2740          	jreq	L1561
4669                     ; 691 			mal.frame_h1 = 0xEE;
4671  00c0 a6ee          	ld	a,#238
4672  00c2 6b02          	ld	(OFST-54,sp),a
4673                     ; 692 			mal.frame_h2 = 0xEE;
4675  00c4 a6ee          	ld	a,#238
4676  00c6 6b03          	ld	(OFST-53,sp),a
4677                     ; 693 			mal.message_id = 66+i;
4679  00c8 7b01          	ld	a,(OFST-55,sp)
4680  00ca ab42          	add	a,#66
4681  00cc 6b04          	ld	(OFST-52,sp),a
4682                     ; 694 			mal.mesh_id_H = ns_host_meshid_H;
4684  00ce c60089        	ld	a,_ns_host_meshid_H
4685  00d1 6b05          	ld	(OFST-51,sp),a
4686                     ; 695 			mal.mesh_id_L = ns_host_meshid_L;
4688  00d3 c60088        	ld	a,_ns_host_meshid_L
4689  00d6 6b06          	ld	(OFST-50,sp),a
4690                     ; 696 			mal.payload[0] = 0x0A;
4692  00d8 a60a          	ld	a,#10
4693  00da 6b07          	ld	(OFST-49,sp),a
4694                     ; 697 			mal.payload[1] = 0xB2;
4696  00dc a6b2          	ld	a,#178
4697  00de 6b08          	ld	(OFST-48,sp),a
4698                     ; 698 			mal.payload[2] =	sc.spc[i].MDID;
4700  00e0 7b01          	ld	a,(OFST-55,sp)
4701  00e2 97            	ld	xl,a
4702  00e3 a61c          	ld	a,#28
4703  00e5 42            	mul	x,a
4704  00e6 d600bc        	ld	a,(_sc+45,x)
4705  00e9 6b09          	ld	(OFST-47,sp),a
4706                     ; 699 			mal.payload[3] =	sc.spc[i].HWTtest;
4708  00eb 7b01          	ld	a,(OFST-55,sp)
4709  00ed 97            	ld	xl,a
4710  00ee a61c          	ld	a,#28
4711  00f0 42            	mul	x,a
4712  00f1 d600af        	ld	a,(_sc+32,x)
4713  00f4 6b0a          	ld	(OFST-46,sp),a
4714                     ; 700 			sicp_send_message(&mal,4);
4716  00f6 4b04          	push	#4
4717  00f8 96            	ldw	x,sp
4718  00f9 1c0003        	addw	x,#OFST-53
4719  00fc cd0000        	call	_sicp_send_message
4721  00ff 84            	pop	a
4722  0100               L1561:
4723                     ; 689 	for(i = 0; i < 15;i++){
4725  0100 0c01          	inc	(OFST-55,sp)
4728  0102 7b01          	ld	a,(OFST-55,sp)
4729  0104 a10f          	cp	a,#15
4730  0106 259b          	jrult	L3461
4731                     ; 703 }
4734  0108 5b38          	addw	sp,#56
4735  010a 81            	ret
4773                     ; 706 void check_send_repeatedly(void){
4774                     .text:	section	.text,new
4775  0000               _check_send_repeatedly:
4777  0000 88            	push	a
4778       00000001      OFST:	set	1
4781                     ; 709 	if(di_timeout){
4783  0001 725d0001      	tnz	_di_timeout
4784  0005 2766          	jreq	L7661
4785                     ; 710 		if(--di_timeout == 0){
4787  0007 725a0001      	dec	_di_timeout
4788  000b 2660          	jrne	L7661
4789                     ; 711 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4791  000d c603d2        	ld	a,_sc+835
4792  0010 a502          	bcp	a,#2
4793  0012 2607          	jrne	L3761
4796  0014 cd0000        	call	_send_sc_device_info
4800  0017 35050001      	mov	_di_timeout,#5
4801  001b               L3761:
4802                     ; 712 			for(i = 0; i < 15; i++){
4804  001b 0f01          	clr	(OFST+0,sp)
4805  001d               L5761:
4806                     ; 713 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4808  001d 7b01          	ld	a,(OFST+0,sp)
4809  001f 97            	ld	xl,a
4810  0020 a61a          	ld	a,#26
4811  0022 42            	mul	x,a
4812  0023 d60260        	ld	a,(_sc+465,x)
4813  0026 da025f        	or	a,(_sc+464,x)
4814  0029 2716          	jreq	L3071
4816  002b 7b01          	ld	a,(OFST+0,sp)
4817  002d 97            	ld	xl,a
4818  002e a61a          	ld	a,#26
4819  0030 42            	mul	x,a
4820  0031 d60265        	ld	a,(_sc+470,x)
4821  0034 a502          	bcp	a,#2
4822  0036 2609          	jrne	L3071
4825  0038 7b01          	ld	a,(OFST+0,sp)
4826  003a cd0000        	call	_send_slc_device_info
4830  003d 35050001      	mov	_di_timeout,#5
4831  0041               L3071:
4832                     ; 714 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4834  0041 7b01          	ld	a,(OFST+0,sp)
4835  0043 97            	ld	xl,a
4836  0044 a61c          	ld	a,#28
4837  0046 42            	mul	x,a
4838  0047 d600bc        	ld	a,(_sc+45,x)
4839  004a da00bb        	or	a,(_sc+44,x)
4840  004d 2716          	jreq	L5071
4842  004f 7b01          	ld	a,(OFST+0,sp)
4843  0051 97            	ld	xl,a
4844  0052 a61c          	ld	a,#28
4845  0054 42            	mul	x,a
4846  0055 d600c3        	ld	a,(_sc+52,x)
4847  0058 a502          	bcp	a,#2
4848  005a 2609          	jrne	L5071
4851  005c 7b01          	ld	a,(OFST+0,sp)
4852  005e cd0000        	call	_send_spc_device_info
4856  0061 35050001      	mov	_di_timeout,#5
4857  0065               L5071:
4858                     ; 712 			for(i = 0; i < 15; i++){
4860  0065 0c01          	inc	(OFST+0,sp)
4863  0067 7b01          	ld	a,(OFST+0,sp)
4864  0069 a10f          	cp	a,#15
4865  006b 25b0          	jrult	L5761
4866  006d               L7661:
4867                     ; 718 }
4870  006d 84            	pop	a
4871  006e 81            	ret
4884                     	xdef	_send_spc_device_info
4885                     	xdef	_send_slc_device_info
4886                     	xdef	_send_sc_device_info
4887                     	xdef	_clear_uart_buf
4888                     	xdef	_Uart2_Send
4889                     	xref	_rand
4890                     	xref	_i2c_multiple_action_plug
4891                     	xref	_i2c_multiple_action_dimmer
4892                     	xref	_i2c_action_plug
4893                     	xref	_i2c_single_action_dimmer
4894                     	xref	_i2c_get_energy_consum
4895                     	xref	_action_dimmer_ext
4896                     	xdef	_delay
4897                     	xref	_systime_count
4898                     	xref	_init_slc_spc_done
4899                     	xref	_sys_init
4900                     	xdef	_check_send_repeatedly
4901                     	xdef	_send_malfunction
4902                     	xdef	_send_device_info
4903                     	xdef	_report_energy_consum
4904                     	xdef	_rev_cmd_data
4905                     	xdef	_sicp_receipt_Done
4906                     	xdef	_sicp_receipt_OK
4907                     	xdef	_sicp_send_message
4908                     	xdef	_random
4909                     	xdef	_rev_deal
4910                     	xdef	_Check_Sum
4911                     	xdef	_rev_anaylze
4912                     	xdef	_UART2_RX_ISR
4913                     	xdef	_UART2_TX_ISR
4914                     	xdef	_Init_uart2
4915                     	xdef	_mymemcpy
4916                     	switch	.bss
4917  0000               _mal_timeout:
4918  0000 00            	ds.b	1
4919                     	xdef	_mal_timeout
4920  0001               _di_timeout:
4921  0001 00            	ds.b	1
4922                     	xdef	_di_timeout
4923  0002               _send_failed_count:
4924  0002 0000          	ds.b	2
4925                     	xdef	_send_failed_count
4926  0004               _send_fault_count:
4927  0004 0000          	ds.b	2
4928                     	xdef	_send_fault_count
4929  0006               _sicp_buf:
4930  0006 000000000000  	ds.b	40
4931                     	xdef	_sicp_buf
4932  002e               _Uart2_Rec_Cnt:
4933  002e 00            	ds.b	1
4934                     	xdef	_Uart2_Rec_Cnt
4935  002f               _Uart2_Rece_Buf:
4936  002f 000000000000  	ds.b	40
4937                     	xdef	_Uart2_Rece_Buf
4938  0057               _Uart2_Send_Done:
4939  0057 00            	ds.b	1
4940                     	xdef	_Uart2_Send_Done
4941  0058               _Uart2_Send_Cnt:
4942  0058 00            	ds.b	1
4943                     	xdef	_Uart2_Send_Cnt
4944  0059               _Uart2_Send_Length:
4945  0059 00            	ds.b	1
4946                     	xdef	_Uart2_Send_Length
4947  005a               _UART2_Send_Buf:
4948  005a 000000000000  	ds.b	40
4949                     	xdef	_UART2_Send_Buf
4950  0082               _rev_ad_channel:
4951  0082 00            	ds.b	1
4952                     	xdef	_rev_ad_channel
4953  0083               _rev_ad_mdid:
4954  0083 00            	ds.b	1
4955                     	xdef	_rev_ad_mdid
4956  0084               _rev_ad_message_id:
4957  0084 00            	ds.b	1
4958                     	xdef	_rev_ad_message_id
4959  0085               _rev_mesh_id_L:
4960  0085 00            	ds.b	1
4961                     	xdef	_rev_mesh_id_L
4962  0086               _rev_mesh_id_H:
4963  0086 00            	ds.b	1
4964                     	xdef	_rev_mesh_id_H
4965  0087               _rev_message_id:
4966  0087 00            	ds.b	1
4967                     	xdef	_rev_message_id
4968  0088               _ns_host_meshid_L:
4969  0088 00            	ds.b	1
4970                     	xdef	_ns_host_meshid_L
4971  0089               _ns_host_meshid_H:
4972  0089 00            	ds.b	1
4973                     	xdef	_ns_host_meshid_H
4974  008a               _ns_own_meshid_L:
4975  008a 00            	ds.b	1
4976                     	xdef	_ns_own_meshid_L
4977  008b               _ns_own_meshid_H:
4978  008b 00            	ds.b	1
4979                     	xdef	_ns_own_meshid_H
4980  008c               _ns_phonenum:
4981  008c 00            	ds.b	1
4982                     	xdef	_ns_phonenum
4983  008d               _ns_status:
4984  008d 00            	ds.b	1
4985                     	xdef	_ns_status
4986  008e               _ns_signal:
4987  008e 00            	ds.b	1
4988                     	xdef	_ns_signal
4989  008f               _sc:
4990  008f 000000000000  	ds.b	836
4991                     	xdef	_sc
4992  03d3               _UART1Flag6_:
4993  03d3 00            	ds.b	1
4994                     	xdef	_UART1Flag6_
4995  03d4               _UART1Flag5_:
4996  03d4 00            	ds.b	1
4997                     	xdef	_UART1Flag5_
4998  03d5               _UART1Flag4_:
4999  03d5 00            	ds.b	1
5000                     	xdef	_UART1Flag4_
5001  03d6               _UART1Flag3_:
5002  03d6 00            	ds.b	1
5003                     	xdef	_UART1Flag3_
5004  03d7               _UART1Flag2_:
5005  03d7 00            	ds.b	1
5006                     	xdef	_UART1Flag2_
5007  03d8               _UART1Flag1_:
5008  03d8 00            	ds.b	1
5009                     	xdef	_UART1Flag1_
5010                     	xref	_UART2_ITConfig
5011                     	xref	_UART2_Cmd
5012                     	xref	_UART2_Init
5013                     	xref	_UART2_DeInit
5014                     	xref.b	c_lreg
5015                     	xref.b	c_x
5016                     	xref.b	c_y
5036                     	xref	c_idiv
5037                     	xref	c_lrzmp
5038                     	xref	c_lgsbc
5039                     	xref	c_ltor
5040                     	end
