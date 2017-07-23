   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 814                     ; 24 void mymemcpy(void *des,void *src,u32 n)  
 814                     ; 25 {  
 816                     .text:	section	.text,new
 817  0000               _mymemcpy:
 819  0000 89            	pushw	x
 820  0001 5204          	subw	sp,#4
 821       00000004      OFST:	set	4
 824                     ; 26   u8 *xdes=des;
 826  0003 1f01          	ldw	(OFST-3,sp),x
 827                     ; 27 	u8 *xsrc=src; 
 829  0005 1e09          	ldw	x,(OFST+5,sp)
 830  0007 1f03          	ldw	(OFST-1,sp),x
 832  0009 2016          	jra	L754
 833  000b               L354:
 834                     ; 28   while(n--)*xdes++=*xsrc++;  
 836  000b 1e03          	ldw	x,(OFST-1,sp)
 837  000d 1c0001        	addw	x,#1
 838  0010 1f03          	ldw	(OFST-1,sp),x
 839  0012 1d0001        	subw	x,#1
 840  0015 f6            	ld	a,(x)
 841  0016 1e01          	ldw	x,(OFST-3,sp)
 842  0018 1c0001        	addw	x,#1
 843  001b 1f01          	ldw	(OFST-3,sp),x
 844  001d 1d0001        	subw	x,#1
 845  0020 f7            	ld	(x),a
 846  0021               L754:
 849  0021 96            	ldw	x,sp
 850  0022 1c000b        	addw	x,#OFST+7
 851  0025 cd0000        	call	c_ltor
 853  0028 96            	ldw	x,sp
 854  0029 1c000b        	addw	x,#OFST+7
 855  002c a601          	ld	a,#1
 856  002e cd0000        	call	c_lgsbc
 858  0031 cd0000        	call	c_lrzmp
 860  0034 26d5          	jrne	L354
 861                     ; 29 }  
 864  0036 5b06          	addw	sp,#6
 865  0038 81            	ret
 911                     ; 34 void delay(u16 Count)
 911                     ; 35 {
 912                     .text:	section	.text,new
 913  0000               _delay:
 915  0000 89            	pushw	x
 916  0001 89            	pushw	x
 917       00000002      OFST:	set	2
 920  0002 2014          	jra	L505
 921  0004               L305:
 922                     ; 39     for(i=0;i<100;i++)
 924  0004 0f01          	clr	(OFST-1,sp)
 925  0006               L115:
 926                     ; 40     for(j=0;j<50;j++);
 928  0006 0f02          	clr	(OFST+0,sp)
 929  0008               L715:
 933  0008 0c02          	inc	(OFST+0,sp)
 936  000a 7b02          	ld	a,(OFST+0,sp)
 937  000c a132          	cp	a,#50
 938  000e 25f8          	jrult	L715
 939                     ; 39     for(i=0;i<100;i++)
 941  0010 0c01          	inc	(OFST-1,sp)
 944  0012 7b01          	ld	a,(OFST-1,sp)
 945  0014 a164          	cp	a,#100
 946  0016 25ee          	jrult	L115
 947  0018               L505:
 948                     ; 37   while (Count--)//Count形参控制延时次数
 950  0018 1e03          	ldw	x,(OFST+1,sp)
 951  001a 1d0001        	subw	x,#1
 952  001d 1f03          	ldw	(OFST+1,sp),x
 953  001f 1c0001        	addw	x,#1
 954  0022 a30000        	cpw	x,#0
 955  0025 26dd          	jrne	L305
 956                     ; 42 }
 959  0027 5b04          	addw	sp,#4
 960  0029 81            	ret
1007                     ; 50 u8 random(u8 xxx)  
1007                     ; 51 {  
1008                     .text:	section	.text,new
1009  0000               _random:
1011  0000 88            	push	a
1012  0001 89            	pushw	x
1013       00000002      OFST:	set	2
1016                     ; 53   for(iii=0;iii<xxx;iii++)  
1018  0002 0f02          	clr	(OFST+0,sp)
1020  0004 2011          	jra	L155
1021  0006               L545:
1022                     ; 55     value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
1024  0006 cd0000        	call	_rand
1026  0009 90ae00ff      	ldw	y,#255
1027  000d cd0000        	call	c_idiv
1029  0010 51            	exgw	x,y
1030  0011 9f            	ld	a,xl
1031  0012 4c            	inc	a
1032  0013 6b01          	ld	(OFST-1,sp),a
1033                     ; 53   for(iii=0;iii<xxx;iii++)  
1035  0015 0c02          	inc	(OFST+0,sp)
1036  0017               L155:
1039  0017 7b02          	ld	a,(OFST+0,sp)
1040  0019 1103          	cp	a,(OFST+1,sp)
1041  001b 25e9          	jrult	L545
1042                     ; 57   return value;  
1044  001d 7b01          	ld	a,(OFST-1,sp)
1047  001f 5b03          	addw	sp,#3
1048  0021 81            	ret
1075                     ; 66 void Init_uart2(void)
1075                     ; 67 {
1076                     .text:	section	.text,new
1077  0000               _Init_uart2:
1081                     ; 68 	UART2_DeInit();
1083  0000 cd0000        	call	_UART2_DeInit
1085                     ; 70 	UART2_Init((u32)57600,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,	UART2_MODE_TXRX_ENABLE);
1087  0003 4b0c          	push	#12
1088  0005 4b80          	push	#128
1089  0007 4b00          	push	#0
1090  0009 4b00          	push	#0
1091  000b 4b00          	push	#0
1092  000d aee100        	ldw	x,#57600
1093  0010 89            	pushw	x
1094  0011 ae0000        	ldw	x,#0
1095  0014 89            	pushw	x
1096  0015 cd0000        	call	_UART2_Init
1098  0018 5b09          	addw	sp,#9
1099                     ; 71 	UART2_ITConfig(UART2_IT_TC,ENABLE);//发送完成中断
1101  001a 4b01          	push	#1
1102  001c ae0266        	ldw	x,#614
1103  001f cd0000        	call	_UART2_ITConfig
1105  0022 84            	pop	a
1106                     ; 72 	UART2_ITConfig(UART2_IT_RXNE_OR,ENABLE);//接收非空中断
1108  0023 4b01          	push	#1
1109  0025 ae0205        	ldw	x,#517
1110  0028 cd0000        	call	_UART2_ITConfig
1112  002b 84            	pop	a
1113                     ; 73 	UART2_Cmd(ENABLE);//启用uart1接口
1115  002c a601          	ld	a,#1
1116  002e cd0000        	call	_UART2_Cmd
1118                     ; 74 }
1121  0031 81            	ret
1166                     ; 83 void Uart2_Send(u8 *buf,u16 len)
1166                     ; 84 {
1167                     .text:	section	.text,new
1168  0000               _Uart2_Send:
1170  0000 89            	pushw	x
1171       00000000      OFST:	set	0
1174                     ; 85 	if(len >= Uart2_Send_Len)	len = Uart2_Send_Len;
1176  0001 1e05          	ldw	x,(OFST+5,sp)
1177  0003 a30028        	cpw	x,#40
1178  0006 2505          	jrult	L506
1181  0008 ae0028        	ldw	x,#40
1182  000b 1f05          	ldw	(OFST+5,sp),x
1183  000d               L506:
1184                     ; 87 	Uart2_Send_Length = len;
1186  000d 7b06          	ld	a,(OFST+6,sp)
1187  000f c70059        	ld	_Uart2_Send_Length,a
1188                     ; 88 	Uart2_Send_Cnt = 1;
1190  0012 35010058      	mov	_Uart2_Send_Cnt,#1
1191                     ; 89 	UART2->DR = UART2_Send_Buf[0];
1193  0016 55005a5241    	mov	21057,_UART2_Send_Buf
1194                     ; 91 }
1197  001b 85            	popw	x
1198  001c 81            	ret
1225                     ; 98 @interrupt void UART2_TX_ISR(void)
1225                     ; 99 {
1226                     .text:	section	.text,new
1227  0000               _UART2_TX_ISR:
1232                     ; 103 	UART2->SR &= ~0x40;//清除发送完成标志位
1234  0000 721d5240      	bres	21056,#6
1235                     ; 105 	if (Uart2_Send_Cnt < Uart2_Send_Length)
1237  0004 c60058        	ld	a,_Uart2_Send_Cnt
1238  0007 c10059        	cp	a,_Uart2_Send_Length
1239  000a 2411          	jruge	L716
1240                     ; 107 		UART2->DR = UART2_Send_Buf[Uart2_Send_Cnt];
1242  000c c60058        	ld	a,_Uart2_Send_Cnt
1243  000f 5f            	clrw	x
1244  0010 97            	ld	xl,a
1245  0011 d6005a        	ld	a,(_UART2_Send_Buf,x)
1246  0014 c75241        	ld	21057,a
1247                     ; 108 		Uart2_Send_Cnt++;
1249  0017 725c0058      	inc	_Uart2_Send_Cnt
1251  001b 2008          	jra	L126
1252  001d               L716:
1253                     ; 112 		Uart2_Send_Done = 1;
1255  001d 35010057      	mov	_Uart2_Send_Done,#1
1256                     ; 113 		Uart2_Send_Cnt = 0;
1258  0021 725f0058      	clr	_Uart2_Send_Cnt
1259  0025               L126:
1260                     ; 115 }
1263  0025 80            	iret
1287                     ; 123 @interrupt void UART2_RX_ISR(void)
1287                     ; 124 {
1288                     .text:	section	.text,new
1289  0000               _UART2_RX_ISR:
1292  0000 3b0002        	push	c_x+2
1293  0003 be00          	ldw	x,c_x
1294  0005 89            	pushw	x
1295  0006 3b0002        	push	c_y+2
1296  0009 be00          	ldw	x,c_y
1297  000b 89            	pushw	x
1300                     ; 125 	rev_deal();
1302  000c cd0000        	call	_rev_deal
1304                     ; 126 }
1307  000f 85            	popw	x
1308  0010 bf00          	ldw	c_y,x
1309  0012 320002        	pop	c_y+2
1310  0015 85            	popw	x
1311  0016 bf00          	ldw	c_x,x
1312  0018 320002        	pop	c_x+2
1313  001b 80            	iret
1369                     ; 134 u8 Check_Sum(u8 *buf,u8 length)
1369                     ; 135 {
1370                     .text:	section	.text,new
1371  0000               _Check_Sum:
1373  0000 89            	pushw	x
1374  0001 89            	pushw	x
1375       00000002      OFST:	set	2
1378                     ; 137 	u8 result = *buf++;
1380  0002 1e03          	ldw	x,(OFST+1,sp)
1381  0004 1c0001        	addw	x,#1
1382  0007 1f03          	ldw	(OFST+1,sp),x
1383  0009 1d0001        	subw	x,#1
1384  000c f6            	ld	a,(x)
1385  000d 6b01          	ld	(OFST-1,sp),a
1386                     ; 138 	for(i = 1;i < length;i++)
1388  000f a601          	ld	a,#1
1389  0011 6b02          	ld	(OFST+0,sp),a
1391  0013 2011          	jra	L366
1392  0015               L756:
1393                     ; 140 		result ^= *buf++;
1395  0015 1e03          	ldw	x,(OFST+1,sp)
1396  0017 1c0001        	addw	x,#1
1397  001a 1f03          	ldw	(OFST+1,sp),x
1398  001c 1d0001        	subw	x,#1
1399  001f 7b01          	ld	a,(OFST-1,sp)
1400  0021 f8            	xor	a,	(x)
1401  0022 6b01          	ld	(OFST-1,sp),a
1402                     ; 138 	for(i = 1;i < length;i++)
1404  0024 0c02          	inc	(OFST+0,sp)
1405  0026               L366:
1408  0026 7b02          	ld	a,(OFST+0,sp)
1409  0028 1107          	cp	a,(OFST+5,sp)
1410  002a 25e9          	jrult	L756
1411                     ; 142 	return result;
1413  002c 7b01          	ld	a,(OFST-1,sp)
1416  002e 5b04          	addw	sp,#4
1417  0030 81            	ret
1475                     ; 150 void rev_deal(void)
1475                     ; 151 {
1476                     .text:	section	.text,new
1477  0000               _rev_deal:
1479  0000 89            	pushw	x
1480       00000002      OFST:	set	2
1483                     ; 154 	temp = (u8)UART2->DR;
1485  0001 c65241        	ld	a,21057
1486  0004 6b02          	ld	(OFST+0,sp),a
1487                     ; 155 	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
1489  0006 c6002e        	ld	a,_Uart2_Rec_Cnt
1490  0009 5f            	clrw	x
1491  000a 97            	ld	xl,a
1492  000b 7b02          	ld	a,(OFST+0,sp)
1493  000d d7002f        	ld	(_Uart2_Rece_Buf,x),a
1494                     ; 156 	Uart2_Rec_Cnt++;
1496  0010 725c002e      	inc	_Uart2_Rec_Cnt
1497                     ; 157 	switch(Uart2_Rec_Cnt)
1499  0014 c6002e        	ld	a,_Uart2_Rec_Cnt
1501                     ; 216 			break;
1502  0017 4a            	dec	a
1503  0018 2722          	jreq	L766
1504  001a 4a            	dec	a
1505  001b 2739          	jreq	L176
1506  001d 4a            	dec	a
1507  001e 2603          	jrne	L62
1508  0020 cc012b        	jp	L727
1509  0023               L62:
1510  0023 4a            	dec	a
1511  0024 2603          	jrne	L03
1512  0026 cc012b        	jp	L727
1513  0029               L03:
1514  0029 4a            	dec	a
1515  002a 2603          	jrne	L23
1516  002c cc012b        	jp	L727
1517  002f               L23:
1518  002f               L107:
1519                     ; 174 		default:
1519                     ; 175 			if (Uart2_Rec_Cnt > Uart2_Rec_Len)//防止接收错误后溢出
1521  002f c6002e        	ld	a,_Uart2_Rec_Cnt
1522  0032 a129          	cp	a,#41
1523  0034 2543          	jrult	L537
1524                     ; 177 				Uart2_Rec_Cnt = 0;
1526  0036 725f002e      	clr	_Uart2_Rec_Cnt
1527  003a 203d          	jra	L537
1528  003c               L766:
1529                     ; 159 		case 1:
1529                     ; 160 			if ((temp != 0xEE) && (temp != 0xDD))	Uart2_Rec_Cnt = 0;
1531  003c 7b02          	ld	a,(OFST+0,sp)
1532  003e a1ee          	cp	a,#238
1533  0040 2603          	jrne	L43
1534  0042 cc012b        	jp	L727
1535  0045               L43:
1537  0045 7b02          	ld	a,(OFST+0,sp)
1538  0047 a1dd          	cp	a,#221
1539  0049 2603          	jrne	L63
1540  004b cc012b        	jp	L727
1541  004e               L63:
1544  004e 725f002e      	clr	_Uart2_Rec_Cnt
1545  0052 ac2b012b      	jpf	L727
1546  0056               L176:
1547                     ; 162 		case 2:
1547                     ; 163 			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1549  0056 7b02          	ld	a,(OFST+0,sp)
1550  0058 a1ee          	cp	a,#238
1551  005a 2603          	jrne	L04
1552  005c cc012b        	jp	L727
1553  005f               L04:
1555  005f 7b02          	ld	a,(OFST+0,sp)
1556  0061 a1aa          	cp	a,#170
1557  0063 2603          	jrne	L24
1558  0065 cc012b        	jp	L727
1559  0068               L24:
1561  0068 7b02          	ld	a,(OFST+0,sp)
1562  006a a1dd          	cp	a,#221
1563  006c 2603          	jrne	L44
1564  006e cc012b        	jp	L727
1565  0071               L44:
1568  0071 725f002e      	clr	_Uart2_Rec_Cnt
1569  0075 ac2b012b      	jpf	L727
1570  0079               L537:
1571                     ; 179 			if ((Uart2_Rece_Buf[0] == 0xEE)&&((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA)))
1573  0079 c6002f        	ld	a,_Uart2_Rece_Buf
1574  007c a1ee          	cp	a,#238
1575  007e 2663          	jrne	L737
1577  0080 c60030        	ld	a,_Uart2_Rece_Buf+1
1578  0083 a1ee          	cp	a,#238
1579  0085 2707          	jreq	L147
1581  0087 c60030        	ld	a,_Uart2_Rece_Buf+1
1582  008a a1aa          	cp	a,#170
1583  008c 2655          	jrne	L737
1584  008e               L147:
1585                     ; 181 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2)//接收数据完成
1587  008e 9c            	rvf
1588  008f c6002e        	ld	a,_Uart2_Rec_Cnt
1589  0092 5f            	clrw	x
1590  0093 97            	ld	xl,a
1591  0094 c60034        	ld	a,_Uart2_Rece_Buf+5
1592  0097 905f          	clrw	y
1593  0099 9097          	ld	yl,a
1594  009b 905c          	incw	y
1595  009d 905c          	incw	y
1596  009f bf01          	ldw	c_x+1,x
1597  00a1 90b301        	cpw	y,c_x+1
1598  00a4 2ec8          	jrsge	L727
1599                     ; 183 					Uart2_Rec_Cnt = 0;
1601  00a6 725f002e      	clr	_Uart2_Rec_Cnt
1602                     ; 184 					check_sum = Check_Sum(Uart2_Rece_Buf+2,Uart2_Rece_Buf[5]);
1604  00aa 3b0034        	push	_Uart2_Rece_Buf+5
1605  00ad ae0031        	ldw	x,#_Uart2_Rece_Buf+2
1606  00b0 cd0000        	call	_Check_Sum
1608  00b3 5b01          	addw	sp,#1
1609  00b5 6b02          	ld	(OFST+0,sp),a
1610                     ; 186 					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2])//校验正确	
1612  00b7 c60034        	ld	a,_Uart2_Rece_Buf+5
1613  00ba 5f            	clrw	x
1614  00bb 97            	ld	xl,a
1615  00bc d60031        	ld	a,(_Uart2_Rece_Buf+2,x)
1616  00bf 1102          	cp	a,(OFST+0,sp)
1617  00c1 261a          	jrne	L547
1618                     ; 188 						rev_success = 1;
1620  00c3 721003da      	bset	_UART1Flag1_,#0
1621                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1623  00c7 0f02          	clr	(OFST+0,sp)
1624  00c9               L747:
1625                     ; 191 							sicp_buf[i] = Uart2_Rece_Buf[i];
1627  00c9 7b02          	ld	a,(OFST+0,sp)
1628  00cb 5f            	clrw	x
1629  00cc 97            	ld	xl,a
1630  00cd d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1631  00d0 d70006        	ld	(_sicp_buf,x),a
1632                     ; 189 						for (i = 0;i < Uart2_Rec_Len;i++)
1634  00d3 0c02          	inc	(OFST+0,sp)
1637  00d5 7b02          	ld	a,(OFST+0,sp)
1638  00d7 a128          	cp	a,#40
1639  00d9 25ee          	jrult	L747
1641  00db 204e          	jra	L727
1642  00dd               L547:
1643                     ; 196 						Uart2_Rec_Cnt = 0;
1645  00dd 725f002e      	clr	_Uart2_Rec_Cnt
1646  00e1 2048          	jra	L727
1647  00e3               L737:
1648                     ; 200 			else if((Uart2_Rece_Buf[0] == 0xDD)&&(Uart2_Rece_Buf[1] == 0xDD))
1650  00e3 c6002f        	ld	a,_Uart2_Rece_Buf
1651  00e6 a1dd          	cp	a,#221
1652  00e8 263d          	jrne	L167
1654  00ea c60030        	ld	a,_Uart2_Rece_Buf+1
1655  00ed a1dd          	cp	a,#221
1656  00ef 2636          	jrne	L167
1657                     ; 202 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 2)//接收数据完成
1659  00f1 9c            	rvf
1660  00f2 c6002e        	ld	a,_Uart2_Rec_Cnt
1661  00f5 5f            	clrw	x
1662  00f6 97            	ld	xl,a
1663  00f7 c60032        	ld	a,_Uart2_Rece_Buf+3
1664  00fa 905f          	clrw	y
1665  00fc 9097          	ld	yl,a
1666  00fe 905c          	incw	y
1667  0100 905c          	incw	y
1668  0102 bf01          	ldw	c_x+1,x
1669  0104 90b301        	cpw	y,c_x+1
1670  0107 2e22          	jrsge	L727
1671                     ; 204 					Uart2_Rec_Cnt = 0;
1673  0109 725f002e      	clr	_Uart2_Rec_Cnt
1674                     ; 205 					rev_success = 1;
1676  010d 721003da      	bset	_UART1Flag1_,#0
1677                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1679  0111 0f02          	clr	(OFST+0,sp)
1680  0113               L567:
1681                     ; 208 						sicp_buf[i] = Uart2_Rece_Buf[i];
1683  0113 7b02          	ld	a,(OFST+0,sp)
1684  0115 5f            	clrw	x
1685  0116 97            	ld	xl,a
1686  0117 d6002f        	ld	a,(_Uart2_Rece_Buf,x)
1687  011a d70006        	ld	(_sicp_buf,x),a
1688                     ; 206 					for (i = 0;i < Uart2_Rec_Len;i++)
1690  011d 0c02          	inc	(OFST+0,sp)
1693  011f 7b02          	ld	a,(OFST+0,sp)
1694  0121 a128          	cp	a,#40
1695  0123 25ee          	jrult	L567
1696  0125 2004          	jra	L727
1697  0127               L167:
1698                     ; 214 				Uart2_Rec_Cnt = 0;
1700  0127 725f002e      	clr	_Uart2_Rec_Cnt
1701  012b               L727:
1702                     ; 218 	if (UART2->SR & 0x20) //|| (UART2->SR & UART2_SR_OR))
1704  012b c65240        	ld	a,21056
1705  012e a520          	bcp	a,#32
1706  0130 2707          	jreq	L577
1707                     ; 220 		temp2 = UART2->DR;
1709  0132 7b01          	ld	a,(OFST-1,sp)
1710  0134 97            	ld	xl,a
1711  0135 c65241        	ld	a,21057
1712  0138 97            	ld	xl,a
1713  0139               L577:
1714                     ; 223 }
1717  0139 85            	popw	x
1718  013a 81            	ret
1752                     ; 225 void clear_uart_buf(void)
1752                     ; 226 {
1753                     .text:	section	.text,new
1754  0000               _clear_uart_buf:
1756  0000 88            	push	a
1757       00000001      OFST:	set	1
1760                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1762  0001 0f01          	clr	(OFST+0,sp)
1763  0003               L3101:
1764                     ; 230 		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
1766  0003 7b01          	ld	a,(OFST+0,sp)
1767  0005 5f            	clrw	x
1768  0006 97            	ld	xl,a
1769  0007 724f002f      	clr	(_Uart2_Rece_Buf,x)
1770  000b 7b01          	ld	a,(OFST+0,sp)
1771  000d 5f            	clrw	x
1772  000e 97            	ld	xl,a
1773  000f 724f0006      	clr	(_sicp_buf,x)
1774                     ; 228 	for (i = 0;i < Uart2_Rec_Len;i++)
1776  0013 0c01          	inc	(OFST+0,sp)
1779  0015 7b01          	ld	a,(OFST+0,sp)
1780  0017 a128          	cp	a,#40
1781  0019 25e8          	jrult	L3101
1782                     ; 232 }
1785  001b 84            	pop	a
1786  001c 81            	ret
1933                     ; 235 void rev_anaylze(void)
1933                     ; 236 {
1934                     .text:	section	.text,new
1935  0000               _rev_anaylze:
1937  0000 523b          	subw	sp,#59
1938       0000003b      OFST:	set	59
1941                     ; 239 	if(rev_success){
1943  0002 c603da        	ld	a,_UART1Flag1_
1944  0005 a501          	bcp	a,#1
1945  0007 2603          	jrne	L25
1946  0009 cc04f4        	jp	L7111
1947  000c               L25:
1948                     ; 240 		rev_success = 0;
1950  000c 721103da      	bres	_UART1Flag1_,#0
1951                     ; 241 		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
1953  0010 c60006        	ld	a,_sicp_buf
1954  0013 a1ee          	cp	a,#238
1955  0015 2614          	jrne	L1211
1957  0017 c60007        	ld	a,_sicp_buf+1
1958  001a a1ee          	cp	a,#238
1959  001c 2707          	jreq	L3211
1961  001e c60007        	ld	a,_sicp_buf+1
1962  0021 a1aa          	cp	a,#170
1963  0023 2606          	jrne	L1211
1964  0025               L3211:
1965                     ; 242 			ble_data_frame = 1;
1967  0025 721203da      	bset	_UART1Flag1_,#1
1969  0029 2012          	jra	L5211
1970  002b               L1211:
1971                     ; 244 		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
1973  002b c60006        	ld	a,_sicp_buf
1974  002e a1dd          	cp	a,#221
1975  0030 260b          	jrne	L5211
1977  0032 c60007        	ld	a,_sicp_buf+1
1978  0035 a1dd          	cp	a,#221
1979  0037 2604          	jrne	L5211
1980                     ; 245 			ble_ctrl_frame = 1;
1982  0039 721403da      	bset	_UART1Flag1_,#2
1983  003d               L5211:
1984                     ; 248 		if (ble_data_frame){
1986  003d c603da        	ld	a,_UART1Flag1_
1987  0040 a502          	bcp	a,#2
1988  0042 2603          	jrne	L45
1989  0044 cc048a        	jp	L1311
1990  0047               L45:
1991                     ; 249 			ble_data_frame = 0;
1993  0047 721303da      	bres	_UART1Flag1_,#1
1994                     ; 250 			rev_message_id = sicp_buf[2];
1996  004b 5500080089    	mov	_rev_message_id,_sicp_buf+2
1997                     ; 251 			rev_mesh_id_H	= sicp_buf[3];
1999  0050 5500090088    	mov	_rev_mesh_id_H,_sicp_buf+3
2000                     ; 252 			rev_mesh_id_L = sicp_buf[4];
2002  0055 55000a0087    	mov	_rev_mesh_id_L,_sicp_buf+4
2003                     ; 253 			switch(sicp_buf[6]){
2005  005a c6000c        	ld	a,_sicp_buf+6
2007                     ; 364 				break;
2008  005d a003          	sub	a,#3
2009  005f 2732          	jreq	L1201
2010  0061 a04e          	sub	a,#78
2011  0063 2742          	jreq	L3201
2012  0065 4a            	dec	a
2013  0066 273f          	jreq	L3201
2014  0068 4a            	dec	a
2015  0069 273c          	jreq	L3201
2016  006b 4a            	dec	a
2017  006c 2739          	jreq	L3201
2018  006e 4a            	dec	a
2019  006f 2603          	jrne	L65
2020  0071 cc0107        	jp	L5201
2021  0074               L65:
2022  0074 a002          	sub	a,#2
2023  0076 2603          	jrne	L06
2024  0078 cc0156        	jp	L7201
2025  007b               L06:
2026  007b 4a            	dec	a
2027  007c 2603          	jrne	L26
2028  007e cc0269        	jp	L1301
2029  0081               L26:
2030  0081 a052          	sub	a,#82
2031  0083 2603          	jrne	L46
2032  0085 cc037c        	jp	L3301
2033  0088               L46:
2034  0088 a006          	sub	a,#6
2035  008a 2603          	jrne	L66
2036  008c cc0461        	jp	L7301
2037  008f               L66:
2038  008f acf404f4      	jpf	L7111
2039  0093               L1201:
2040                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2040                     ; 255 					if(sicp_buf[7] == 0x03){
2042  0093 c6000d        	ld	a,_sicp_buf+7
2043  0096 a103          	cp	a,#3
2044  0098 2703          	jreq	L07
2045  009a cc04f4        	jp	L7111
2046  009d               L07:
2047                     ; 256 						rev_cmd_data(sicp_buf[8]);
2049  009d c6000e        	ld	a,_sicp_buf+8
2050  00a0 cd0000        	call	_rev_cmd_data
2052  00a3 acf404f4      	jpf	L7111
2053  00a7               L3201:
2054                     ; 259 				case 0x51://一个SC下单个SLC多个通道调光
2054                     ; 260 				case 0x52:
2054                     ; 261 				case 0x53:
2054                     ; 262 				case 0x54:
2054                     ; 263 					rev_ad_message_id = sicp_buf[2];
2056  00a7 5500080086    	mov	_rev_ad_message_id,_sicp_buf+2
2057                     ; 264 					rev_ad_mesh_id_H = sicp_buf[3];
2059  00ac 5500090083    	mov	_rev_ad_mesh_id_H,_sicp_buf+3
2060                     ; 265 					rev_ad_mesh_id_L = sicp_buf[4];
2062  00b1 55000a0082    	mov	_rev_ad_mesh_id_L,_sicp_buf+4
2063                     ; 266 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2065  00b6 c6000d        	ld	a,_sicp_buf+7
2066  00b9 a4f0          	and	a,#240
2067  00bb 4e            	swap	a
2068  00bc a40f          	and	a,#15
2069  00be c70085        	ld	_rev_ad_mdid,a
2070                     ; 267 					rev_ad_channel = (sicp_buf[7]&0x0f);
2072  00c1 c6000d        	ld	a,_sicp_buf+7
2073  00c4 a40f          	and	a,#15
2074  00c6 c70084        	ld	_rev_ad_channel,a
2075                     ; 268 					action_dimmer_ext = sicp_buf[9]+2;
2077  00c9 c6000f        	ld	a,_sicp_buf+9
2078  00cc ab02          	add	a,#2
2079  00ce c70000        	ld	_action_dimmer_ext,a
2080                     ; 270 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2082  00d1 3b000f        	push	_sicp_buf+9
2083  00d4 3b000e        	push	_sicp_buf+8
2084  00d7 c6000d        	ld	a,_sicp_buf+7
2085  00da 97            	ld	xl,a
2086  00db c6000c        	ld	a,_sicp_buf+6
2087  00de 95            	ld	xh,a
2088  00df cd0000        	call	_i2c_single_action_dimmer
2090  00e2 85            	popw	x
2091  00e3 6b3b          	ld	(OFST+0,sp),a
2092                     ; 271 					delay(100);
2094  00e5 ae0064        	ldw	x,#100
2095  00e8 cd0000        	call	_delay
2097                     ; 272 					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,rev_mesh_id_H,rev_mesh_id_H);
2099  00eb 0d3b          	tnz	(OFST+0,sp)
2100  00ed 2703          	jreq	L27
2101  00ef cc04f4        	jp	L7111
2102  00f2               L27:
2105  00f2 3b0088        	push	_rev_mesh_id_H
2106  00f5 3b0088        	push	_rev_mesh_id_H
2107  00f8 c60089        	ld	a,_rev_message_id
2108  00fb 97            	ld	xl,a
2109  00fc a602          	ld	a,#2
2110  00fe 95            	ld	xh,a
2111  00ff cd0000        	call	_sicp_receipt_OK
2113  0102 85            	popw	x
2114  0103 acf404f4      	jpf	L7111
2115  0107               L5201:
2116                     ; 275 				case 0x55://打开或关闭开关
2116                     ; 276 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2118  0107 c6000d        	ld	a,_sicp_buf+7
2119  010a a4f0          	and	a,#240
2120  010c 4e            	swap	a
2121  010d a40f          	and	a,#15
2122  010f c70085        	ld	_rev_ad_mdid,a
2123                     ; 277 					rev_ad_channel = (sicp_buf[7]&0x0f);
2125  0112 c6000d        	ld	a,_sicp_buf+7
2126  0115 a40f          	and	a,#15
2127  0117 c70084        	ld	_rev_ad_channel,a
2128                     ; 279 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2130  011a 3b000f        	push	_sicp_buf+9
2131  011d 3b000e        	push	_sicp_buf+8
2132  0120 c6000d        	ld	a,_sicp_buf+7
2133  0123 97            	ld	xl,a
2134  0124 c6000c        	ld	a,_sicp_buf+6
2135  0127 95            	ld	xh,a
2136  0128 cd0000        	call	_i2c_action_plug
2138  012b 85            	popw	x
2139  012c 6b3b          	ld	(OFST+0,sp),a
2140                     ; 280 					delay(100);
2142  012e ae0064        	ldw	x,#100
2143  0131 cd0000        	call	_delay
2145                     ; 281 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
2147  0134 0d3b          	tnz	(OFST+0,sp)
2148  0136 2703          	jreq	L47
2149  0138 cc04f4        	jp	L7111
2150  013b               L47:
2153  013b 3b0085        	push	_rev_ad_mdid
2154  013e 4b02          	push	#2
2155  0140 3b008a        	push	_ns_host_meshid_L
2156  0143 3b008b        	push	_ns_host_meshid_H
2157  0146 c60089        	ld	a,_rev_message_id
2158  0149 97            	ld	xl,a
2159  014a a605          	ld	a,#5
2160  014c 95            	ld	xh,a
2161  014d cd0000        	call	_sicp_receipt_Done
2163  0150 5b04          	addw	sp,#4
2164  0152 acf404f4      	jpf	L7111
2165  0156               L7201:
2166                     ; 283 				case 0x57://一个SC下多个SLC多个通道调光
2166                     ; 284 					action_dimmer_num = sicp_buf[7];
2168  0156 c6000d        	ld	a,_sicp_buf+7
2169  0159 6b03          	ld	(OFST-56,sp),a
2170                     ; 285 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2172  015b 3b008a        	push	_ns_host_meshid_L
2173  015e 3b008b        	push	_ns_host_meshid_H
2174  0161 c60089        	ld	a,_rev_message_id
2175  0164 97            	ld	xl,a
2176  0165 a602          	ld	a,#2
2177  0167 95            	ld	xh,a
2178  0168 cd0000        	call	_sicp_receipt_OK
2180  016b 85            	popw	x
2181                     ; 287 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2183  016c 7b03          	ld	a,(OFST-56,sp)
2184  016e cd0000        	call	_i2c_multiple_action_dimmer
2186  0171 6b3b          	ld	(OFST+0,sp),a
2187                     ; 288 					delay(100);
2189  0173 ae0064        	ldw	x,#100
2190  0176 cd0000        	call	_delay
2192                     ; 289 					if(ret == IIC_SUCCESS){
2194  0179 0d3b          	tnz	(OFST+0,sp)
2195  017b 2703          	jreq	L67
2196  017d cc04f4        	jp	L7111
2197  0180               L67:
2198                     ; 290 						receipt.frame_h1 = 0xEE;
2200  0180 a6ee          	ld	a,#238
2201  0182 6b04          	ld	(OFST-55,sp),a
2202                     ; 291 						receipt.frame_h2 = 0xAA;
2204  0184 a6aa          	ld	a,#170
2205  0186 6b05          	ld	(OFST-54,sp),a
2206                     ; 292 						receipt.message_id = rev_message_id;
2208  0188 c60089        	ld	a,_rev_message_id
2209  018b 6b06          	ld	(OFST-53,sp),a
2210                     ; 293 						receipt.mesh_id_H = ns_host_meshid_H;
2212  018d c6008b        	ld	a,_ns_host_meshid_H
2213  0190 6b07          	ld	(OFST-52,sp),a
2214                     ; 294 						receipt.mesh_id_L = ns_host_meshid_L;
2216  0192 c6008a        	ld	a,_ns_host_meshid_L
2217  0195 6b08          	ld	(OFST-51,sp),a
2218                     ; 295 						receipt.payload[0] = 0xAA;
2220  0197 a6aa          	ld	a,#170
2221  0199 6b09          	ld	(OFST-50,sp),a
2222                     ; 296 						receipt.payload[1] = 0x05;
2224  019b a605          	ld	a,#5
2225  019d 6b0a          	ld	(OFST-49,sp),a
2226                     ; 297 						receipt.payload[2] = action_dimmer_num;
2228  019f 7b03          	ld	a,(OFST-56,sp)
2229  01a1 6b0b          	ld	(OFST-48,sp),a
2230                     ; 298 						i = 0;
2232  01a3 0f3b          	clr	(OFST+0,sp)
2234  01a5 ac490249      	jpf	L3511
2235  01a9               L7411:
2236                     ; 300 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2238  01a9 7b3b          	ld	a,(OFST+0,sp)
2239  01ab 5f            	clrw	x
2240  01ac 97            	ld	xl,a
2241  01ad d6000e        	ld	a,(_sicp_buf+8,x)
2242  01b0 a4f0          	and	a,#240
2243  01b2 4e            	swap	a
2244  01b3 a40f          	and	a,#15
2245  01b5 c70085        	ld	_rev_ad_mdid,a
2246                     ; 301 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2248  01b8 7b3b          	ld	a,(OFST+0,sp)
2249  01ba 5f            	clrw	x
2250  01bb 97            	ld	xl,a
2251  01bc d6000e        	ld	a,(_sicp_buf+8,x)
2252  01bf a40f          	and	a,#15
2253  01c1 c70084        	ld	_rev_ad_channel,a
2254                     ; 302 							receipt.payload[3+i*5] = rev_ad_mdid;
2256  01c4 96            	ldw	x,sp
2257  01c5 1c000c        	addw	x,#OFST-47
2258  01c8 1f01          	ldw	(OFST-58,sp),x
2259  01ca 7b3b          	ld	a,(OFST+0,sp)
2260  01cc 97            	ld	xl,a
2261  01cd a605          	ld	a,#5
2262  01cf 42            	mul	x,a
2263  01d0 72fb01        	addw	x,(OFST-58,sp)
2264  01d3 c60085        	ld	a,_rev_ad_mdid
2265  01d6 f7            	ld	(x),a
2266                     ; 303 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2268  01d7 96            	ldw	x,sp
2269  01d8 1c000d        	addw	x,#OFST-46
2270  01db 1f01          	ldw	(OFST-58,sp),x
2271  01dd 7b3b          	ld	a,(OFST+0,sp)
2272  01df 97            	ld	xl,a
2273  01e0 a605          	ld	a,#5
2274  01e2 42            	mul	x,a
2275  01e3 72fb01        	addw	x,(OFST-58,sp)
2276  01e6 89            	pushw	x
2277  01e7 c60085        	ld	a,_rev_ad_mdid
2278  01ea 97            	ld	xl,a
2279  01eb a61a          	ld	a,#26
2280  01ed 42            	mul	x,a
2281  01ee d60263        	ld	a,(_sc+466,x)
2282  01f1 85            	popw	x
2283  01f2 f7            	ld	(x),a
2284                     ; 304 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2286  01f3 96            	ldw	x,sp
2287  01f4 1c000e        	addw	x,#OFST-45
2288  01f7 1f01          	ldw	(OFST-58,sp),x
2289  01f9 7b3b          	ld	a,(OFST+0,sp)
2290  01fb 97            	ld	xl,a
2291  01fc a605          	ld	a,#5
2292  01fe 42            	mul	x,a
2293  01ff 72fb01        	addw	x,(OFST-58,sp)
2294  0202 89            	pushw	x
2295  0203 c60085        	ld	a,_rev_ad_mdid
2296  0206 97            	ld	xl,a
2297  0207 a61a          	ld	a,#26
2298  0209 42            	mul	x,a
2299  020a d60264        	ld	a,(_sc+467,x)
2300  020d 85            	popw	x
2301  020e f7            	ld	(x),a
2302                     ; 305 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2304  020f 96            	ldw	x,sp
2305  0210 1c000f        	addw	x,#OFST-44
2306  0213 1f01          	ldw	(OFST-58,sp),x
2307  0215 7b3b          	ld	a,(OFST+0,sp)
2308  0217 97            	ld	xl,a
2309  0218 a605          	ld	a,#5
2310  021a 42            	mul	x,a
2311  021b 72fb01        	addw	x,(OFST-58,sp)
2312  021e 89            	pushw	x
2313  021f c60085        	ld	a,_rev_ad_mdid
2314  0222 97            	ld	xl,a
2315  0223 a61a          	ld	a,#26
2316  0225 42            	mul	x,a
2317  0226 d60265        	ld	a,(_sc+468,x)
2318  0229 85            	popw	x
2319  022a f7            	ld	(x),a
2320                     ; 306 							receipt.payload[7+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2322  022b 96            	ldw	x,sp
2323  022c 1c0010        	addw	x,#OFST-43
2324  022f 1f01          	ldw	(OFST-58,sp),x
2325  0231 7b3b          	ld	a,(OFST+0,sp)
2326  0233 97            	ld	xl,a
2327  0234 a605          	ld	a,#5
2328  0236 42            	mul	x,a
2329  0237 72fb01        	addw	x,(OFST-58,sp)
2330  023a 89            	pushw	x
2331  023b c60085        	ld	a,_rev_ad_mdid
2332  023e 97            	ld	xl,a
2333  023f a61a          	ld	a,#26
2334  0241 42            	mul	x,a
2335  0242 d60266        	ld	a,(_sc+469,x)
2336  0245 85            	popw	x
2337  0246 f7            	ld	(x),a
2338                     ; 308 							i++;
2340  0247 0c3b          	inc	(OFST+0,sp)
2341  0249               L3511:
2342                     ; 299 						while(action_dimmer_num--){
2344  0249 7b03          	ld	a,(OFST-56,sp)
2345  024b 0a03          	dec	(OFST-56,sp)
2346  024d 4d            	tnz	a
2347  024e 2703          	jreq	L001
2348  0250 cc01a9        	jp	L7411
2349  0253               L001:
2350                     ; 310 						sicp_send_message(&receipt,8+i*5);
2352  0253 7b3b          	ld	a,(OFST+0,sp)
2353  0255 97            	ld	xl,a
2354  0256 a605          	ld	a,#5
2355  0258 42            	mul	x,a
2356  0259 9f            	ld	a,xl
2357  025a ab08          	add	a,#8
2358  025c 88            	push	a
2359  025d 96            	ldw	x,sp
2360  025e 1c0005        	addw	x,#OFST-54
2361  0261 cd0000        	call	_sicp_send_message
2363  0264 84            	pop	a
2364  0265 acf404f4      	jpf	L7111
2365  0269               L1301:
2366                     ; 313 				case 0x58://一个SC下多个SPC多个通道调光
2366                     ; 314 					action_plup_num = sicp_buf[7];
2368  0269 c6000d        	ld	a,_sicp_buf+7
2369  026c 6b03          	ld	(OFST-56,sp),a
2370                     ; 315 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2372  026e 3b008a        	push	_ns_host_meshid_L
2373  0271 3b008b        	push	_ns_host_meshid_H
2374  0274 c60089        	ld	a,_rev_message_id
2375  0277 97            	ld	xl,a
2376  0278 a602          	ld	a,#2
2377  027a 95            	ld	xh,a
2378  027b cd0000        	call	_sicp_receipt_OK
2380  027e 85            	popw	x
2381                     ; 316 					ret = i2c_multiple_action_plug(action_plup_num);
2383  027f 7b03          	ld	a,(OFST-56,sp)
2384  0281 cd0000        	call	_i2c_multiple_action_plug
2386  0284 6b3b          	ld	(OFST+0,sp),a
2387                     ; 318 					delay(100);
2389  0286 ae0064        	ldw	x,#100
2390  0289 cd0000        	call	_delay
2392                     ; 319 					if(ret == IIC_SUCCESS){
2394  028c 0d3b          	tnz	(OFST+0,sp)
2395  028e 2703          	jreq	L201
2396  0290 cc04f4        	jp	L7111
2397  0293               L201:
2398                     ; 320 						receipt.frame_h1 = 0xEE;
2400  0293 a6ee          	ld	a,#238
2401  0295 6b04          	ld	(OFST-55,sp),a
2402                     ; 321 						receipt.frame_h2 = 0xAA;
2404  0297 a6aa          	ld	a,#170
2405  0299 6b05          	ld	(OFST-54,sp),a
2406                     ; 322 						receipt.message_id = rev_message_id;
2408  029b c60089        	ld	a,_rev_message_id
2409  029e 6b06          	ld	(OFST-53,sp),a
2410                     ; 323 						receipt.mesh_id_H = ns_host_meshid_H;
2412  02a0 c6008b        	ld	a,_ns_host_meshid_H
2413  02a3 6b07          	ld	(OFST-52,sp),a
2414                     ; 324 						receipt.mesh_id_L = ns_host_meshid_L;
2416  02a5 c6008a        	ld	a,_ns_host_meshid_L
2417  02a8 6b08          	ld	(OFST-51,sp),a
2418                     ; 325 						receipt.payload[0] = 0xAA;
2420  02aa a6aa          	ld	a,#170
2421  02ac 6b09          	ld	(OFST-50,sp),a
2422                     ; 326 						receipt.payload[1] = 0x05;
2424  02ae a605          	ld	a,#5
2425  02b0 6b0a          	ld	(OFST-49,sp),a
2426                     ; 327 						receipt.payload[2] = action_plup_num;
2428  02b2 7b03          	ld	a,(OFST-56,sp)
2429  02b4 6b0b          	ld	(OFST-48,sp),a
2430                     ; 328 						i = 0;
2432  02b6 0f3b          	clr	(OFST+0,sp)
2434  02b8 ac5c035c      	jpf	L5611
2435  02bc               L1611:
2436                     ; 330 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2438  02bc 7b3b          	ld	a,(OFST+0,sp)
2439  02be 5f            	clrw	x
2440  02bf 97            	ld	xl,a
2441  02c0 d6000e        	ld	a,(_sicp_buf+8,x)
2442  02c3 a4f0          	and	a,#240
2443  02c5 4e            	swap	a
2444  02c6 a40f          	and	a,#15
2445  02c8 c70085        	ld	_rev_ad_mdid,a
2446                     ; 331 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2448  02cb 7b3b          	ld	a,(OFST+0,sp)
2449  02cd 5f            	clrw	x
2450  02ce 97            	ld	xl,a
2451  02cf d6000e        	ld	a,(_sicp_buf+8,x)
2452  02d2 a40f          	and	a,#15
2453  02d4 c70084        	ld	_rev_ad_channel,a
2454                     ; 332 							receipt.payload[3+i*5] = rev_ad_mdid;
2456  02d7 96            	ldw	x,sp
2457  02d8 1c000c        	addw	x,#OFST-47
2458  02db 1f01          	ldw	(OFST-58,sp),x
2459  02dd 7b3b          	ld	a,(OFST+0,sp)
2460  02df 97            	ld	xl,a
2461  02e0 a605          	ld	a,#5
2462  02e2 42            	mul	x,a
2463  02e3 72fb01        	addw	x,(OFST-58,sp)
2464  02e6 c60085        	ld	a,_rev_ad_mdid
2465  02e9 f7            	ld	(x),a
2466                     ; 333 							receipt.payload[4+i*5] = sc.spc[rev_ad_mdid].ch1_status;
2468  02ea 96            	ldw	x,sp
2469  02eb 1c000d        	addw	x,#OFST-46
2470  02ee 1f01          	ldw	(OFST-58,sp),x
2471  02f0 7b3b          	ld	a,(OFST+0,sp)
2472  02f2 97            	ld	xl,a
2473  02f3 a605          	ld	a,#5
2474  02f5 42            	mul	x,a
2475  02f6 72fb01        	addw	x,(OFST-58,sp)
2476  02f9 89            	pushw	x
2477  02fa c60085        	ld	a,_rev_ad_mdid
2478  02fd 97            	ld	xl,a
2479  02fe a61c          	ld	a,#28
2480  0300 42            	mul	x,a
2481  0301 d600bf        	ld	a,(_sc+46,x)
2482  0304 85            	popw	x
2483  0305 f7            	ld	(x),a
2484                     ; 334 							receipt.payload[5+i*5] = sc.spc[rev_ad_mdid].ch2_status;
2486  0306 96            	ldw	x,sp
2487  0307 1c000e        	addw	x,#OFST-45
2488  030a 1f01          	ldw	(OFST-58,sp),x
2489  030c 7b3b          	ld	a,(OFST+0,sp)
2490  030e 97            	ld	xl,a
2491  030f a605          	ld	a,#5
2492  0311 42            	mul	x,a
2493  0312 72fb01        	addw	x,(OFST-58,sp)
2494  0315 89            	pushw	x
2495  0316 c60085        	ld	a,_rev_ad_mdid
2496  0319 97            	ld	xl,a
2497  031a a61c          	ld	a,#28
2498  031c 42            	mul	x,a
2499  031d d600c0        	ld	a,(_sc+47,x)
2500  0320 85            	popw	x
2501  0321 f7            	ld	(x),a
2502                     ; 335 							receipt.payload[6+i*5] = sc.spc[rev_ad_mdid].ch3_status;
2504  0322 96            	ldw	x,sp
2505  0323 1c000f        	addw	x,#OFST-44
2506  0326 1f01          	ldw	(OFST-58,sp),x
2507  0328 7b3b          	ld	a,(OFST+0,sp)
2508  032a 97            	ld	xl,a
2509  032b a605          	ld	a,#5
2510  032d 42            	mul	x,a
2511  032e 72fb01        	addw	x,(OFST-58,sp)
2512  0331 89            	pushw	x
2513  0332 c60085        	ld	a,_rev_ad_mdid
2514  0335 97            	ld	xl,a
2515  0336 a61c          	ld	a,#28
2516  0338 42            	mul	x,a
2517  0339 d600c1        	ld	a,(_sc+48,x)
2518  033c 85            	popw	x
2519  033d f7            	ld	(x),a
2520                     ; 336 							receipt.payload[7+i*5] = sc.spc[rev_ad_mdid].ch4_status;
2522  033e 96            	ldw	x,sp
2523  033f 1c0010        	addw	x,#OFST-43
2524  0342 1f01          	ldw	(OFST-58,sp),x
2525  0344 7b3b          	ld	a,(OFST+0,sp)
2526  0346 97            	ld	xl,a
2527  0347 a605          	ld	a,#5
2528  0349 42            	mul	x,a
2529  034a 72fb01        	addw	x,(OFST-58,sp)
2530  034d 89            	pushw	x
2531  034e c60085        	ld	a,_rev_ad_mdid
2532  0351 97            	ld	xl,a
2533  0352 a61c          	ld	a,#28
2534  0354 42            	mul	x,a
2535  0355 d600c2        	ld	a,(_sc+49,x)
2536  0358 85            	popw	x
2537  0359 f7            	ld	(x),a
2538                     ; 337 							i++;
2540  035a 0c3b          	inc	(OFST+0,sp)
2541  035c               L5611:
2542                     ; 329 						while(action_plup_num--){
2544  035c 7b03          	ld	a,(OFST-56,sp)
2545  035e 0a03          	dec	(OFST-56,sp)
2546  0360 4d            	tnz	a
2547  0361 2703          	jreq	L401
2548  0363 cc02bc        	jp	L1611
2549  0366               L401:
2550                     ; 339 						sicp_send_message(&receipt,8+i*5);
2552  0366 7b3b          	ld	a,(OFST+0,sp)
2553  0368 97            	ld	xl,a
2554  0369 a605          	ld	a,#5
2555  036b 42            	mul	x,a
2556  036c 9f            	ld	a,xl
2557  036d ab08          	add	a,#8
2558  036f 88            	push	a
2559  0370 96            	ldw	x,sp
2560  0371 1c0005        	addw	x,#OFST-54
2561  0374 cd0000        	call	_sicp_send_message
2563  0377 84            	pop	a
2564  0378 acf404f4      	jpf	L7111
2565  037c               L3301:
2566                     ; 342 				case 0xAA:
2566                     ; 343 					if(sicp_buf[7] == 0x02)	{
2568  037c c6000d        	ld	a,_sicp_buf+7
2569  037f a102          	cp	a,#2
2570  0381 2703          	jreq	L601
2571  0383 cc04f4        	jp	L7111
2572  0386               L601:
2573                     ; 345 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2575  0386 725d0089      	tnz	_rev_message_id
2576  038a 271d          	jreq	L3711
2578  038c c60089        	ld	a,_rev_message_id
2579  038f a110          	cp	a,#16
2580  0391 2416          	jruge	L3711
2583  0393 c60089        	ld	a,_rev_message_id
2584  0396 97            	ld	xl,a
2585  0397 a61c          	ld	a,#28
2586  0399 42            	mul	x,a
2587  039a 1d001c        	subw	x,#28
2588  039d d600c5        	ld	a,(_sc+52,x)
2589  03a0 aa01          	or	a,#1
2590  03a2 d700c5        	ld	(_sc+52,x),a
2592  03a5 acf404f4      	jpf	L7111
2593  03a9               L3711:
2594                     ; 347 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2596  03a9 c60089        	ld	a,_rev_message_id
2597  03ac a110          	cp	a,#16
2598  03ae 2608          	jrne	L7711
2601  03b0 721203d4      	bset	_sc+835,#1
2603  03b4 acf404f4      	jpf	L7111
2604  03b8               L7711:
2605                     ; 348 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2607  03b8 c60089        	ld	a,_rev_message_id
2608  03bb a115          	cp	a,#21
2609  03bd 251d          	jrult	L3021
2611  03bf c60089        	ld	a,_rev_message_id
2612  03c2 a124          	cp	a,#36
2613  03c4 2416          	jruge	L3021
2616  03c6 c60089        	ld	a,_rev_message_id
2617  03c9 97            	ld	xl,a
2618  03ca a61a          	ld	a,#26
2619  03cc 42            	mul	x,a
2620  03cd 1d0222        	subw	x,#546
2621  03d0 d60267        	ld	a,(_sc+470,x)
2622  03d3 aa02          	or	a,#2
2623  03d5 d70267        	ld	(_sc+470,x),a
2625  03d8 acf404f4      	jpf	L7111
2626  03dc               L3021:
2627                     ; 349 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2629  03dc c60089        	ld	a,_rev_message_id
2630  03df a124          	cp	a,#36
2631  03e1 251d          	jrult	L7021
2633  03e3 c60089        	ld	a,_rev_message_id
2634  03e6 a133          	cp	a,#51
2635  03e8 2416          	jruge	L7021
2638  03ea c60089        	ld	a,_rev_message_id
2639  03ed 97            	ld	xl,a
2640  03ee a61c          	ld	a,#28
2641  03f0 42            	mul	x,a
2642  03f1 1d03f0        	subw	x,#1008
2643  03f4 d600c5        	ld	a,(_sc+52,x)
2644  03f7 aa02          	or	a,#2
2645  03f9 d700c5        	ld	(_sc+52,x),a
2647  03fc acf404f4      	jpf	L7111
2648  0400               L7021:
2649                     ; 351 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2651  0400 c60089        	ld	a,_rev_message_id
2652  0403 a111          	cp	a,#17
2653  0405 2608          	jrne	L3121
2656  0407 721403d4      	bset	_sc+835,#2
2658  040b acf404f4      	jpf	L7111
2659  040f               L3121:
2660                     ; 352 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2662  040f c60089        	ld	a,_rev_message_id
2663  0412 a133          	cp	a,#51
2664  0414 251d          	jrult	L7121
2666  0416 c60089        	ld	a,_rev_message_id
2667  0419 a142          	cp	a,#66
2668  041b 2416          	jruge	L7121
2671  041d c60089        	ld	a,_rev_message_id
2672  0420 97            	ld	xl,a
2673  0421 a61a          	ld	a,#26
2674  0423 42            	mul	x,a
2675  0424 1d052e        	subw	x,#1326
2676  0427 d60267        	ld	a,(_sc+470,x)
2677  042a aa04          	or	a,#4
2678  042c d70267        	ld	(_sc+470,x),a
2680  042f acf404f4      	jpf	L7111
2681  0433               L7121:
2682                     ; 353 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2684  0433 c60089        	ld	a,_rev_message_id
2685  0436 a142          	cp	a,#66
2686  0438 2403          	jruge	L011
2687  043a cc04f4        	jp	L7111
2688  043d               L011:
2690  043d c60089        	ld	a,_rev_message_id
2691  0440 a151          	cp	a,#81
2692  0442 2503          	jrult	L211
2693  0444 cc04f4        	jp	L7111
2694  0447               L211:
2697  0447 c60089        	ld	a,_rev_message_id
2698  044a 97            	ld	xl,a
2699  044b a61c          	ld	a,#28
2700  044d 42            	mul	x,a
2701  044e 1d0738        	subw	x,#1848
2702  0451 d600c5        	ld	a,(_sc+52,x)
2703  0454 aa04          	or	a,#4
2704  0456 d700c5        	ld	(_sc+52,x),a
2705  0459 acf404f4      	jpf	L7111
2706  045d               L5301:
2707                     ; 356 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2707                     ; 357 				break;
2709  045d acf404f4      	jpf	L7111
2710  0461               L7301:
2711                     ; 358 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2711                     ; 359 					if(rev_message_id == 0x9E){
2713  0461 c60089        	ld	a,_rev_message_id
2714  0464 a19e          	cp	a,#158
2715  0466 2703          	jreq	L411
2716  0468 cc04f4        	jp	L7111
2717  046b               L411:
2718                     ; 360 						ns_host_meshid_H = rev_mesh_id_H;
2720  046b 550088008b    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2721                     ; 361 						ns_host_meshid_L = rev_mesh_id_L;
2723  0470 550087008a    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2724                     ; 362 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2726  0475 3b008a        	push	_ns_host_meshid_L
2727  0478 3b008b        	push	_ns_host_meshid_H
2728  047b c60089        	ld	a,_rev_message_id
2729  047e 97            	ld	xl,a
2730  047f a602          	ld	a,#2
2731  0481 95            	ld	xh,a
2732  0482 cd0000        	call	_sicp_receipt_OK
2734  0485 85            	popw	x
2735  0486 206c          	jra	L7111
2736  0488               L5311:
2737                     ; 364 				break;
2738  0488 206a          	jra	L7111
2739  048a               L1311:
2740                     ; 367 		else if (ble_ctrl_frame){
2742  048a c603da        	ld	a,_UART1Flag1_
2743  048d a504          	bcp	a,#4
2744  048f 2763          	jreq	L7111
2745                     ; 368 			ble_ctrl_frame = 0;
2747  0491 721503da      	bres	_UART1Flag1_,#2
2748                     ; 369 			switch(sicp_buf[4]){
2750  0495 c6000a        	ld	a,_sicp_buf+4
2752                     ; 400 				break;
2753  0498 4a            	dec	a
2754  0499 2708          	jreq	L1401
2755  049b 4a            	dec	a
2756  049c 2724          	jreq	L3401
2757  049e 4a            	dec	a
2758  049f 272d          	jreq	L5401
2759  04a1 2051          	jra	L7111
2760  04a3               L1401:
2761                     ; 370 				case 0x01://网络状态帧
2761                     ; 371 				rev_bleheartbeat = 1;
2763  04a3 721203d9      	bset	_UART1Flag2_,#1
2764                     ; 372 				ns_signal = sicp_buf[5];
2766  04a7 55000b0090    	mov	_ns_signal,_sicp_buf+5
2767                     ; 373 				ns_status = sicp_buf[6];
2769  04ac 55000c008f    	mov	_ns_status,_sicp_buf+6
2770                     ; 374 				ns_phonenum = sicp_buf[7];
2772  04b1 55000d008e    	mov	_ns_phonenum,_sicp_buf+7
2773                     ; 375 				ns_own_meshid_H = sicp_buf[8];
2775  04b6 55000e008d    	mov	_ns_own_meshid_H,_sicp_buf+8
2776                     ; 376 				ns_own_meshid_L = sicp_buf[9];
2778  04bb 55000f008c    	mov	_ns_own_meshid_L,_sicp_buf+9
2779                     ; 383 				break;
2781  04c0 2032          	jra	L7111
2782  04c2               L3401:
2783                     ; 384 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2783                     ; 385 				sys_init();
2785  04c2 cd0000        	call	_sys_init
2787                     ; 386 				clear_uart_buf();
2789  04c5 cd0000        	call	_clear_uart_buf
2791                     ; 387 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2793  04c8 725f0000      	clr	_init_slc_spc_done
2794                     ; 388 				break;
2796  04cc 2026          	jra	L7111
2797  04ce               L5401:
2798                     ; 389 			case 0x03://重置芯片和网络，退出mesh连接
2798                     ; 390 				sys_init();
2800  04ce cd0000        	call	_sys_init
2802                     ; 391 				clear_uart_buf();
2804  04d1 cd0000        	call	_clear_uart_buf
2806                     ; 392 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2808  04d4 725f0000      	clr	_init_slc_spc_done
2809                     ; 393 				ns_signal = 0x00;
2811  04d8 725f0090      	clr	_ns_signal
2812                     ; 394 				ns_status = 0x00;
2814  04dc 725f008f      	clr	_ns_status
2815                     ; 395 				ns_phonenum = 0x00;
2817  04e0 725f008e      	clr	_ns_phonenum
2818                     ; 396 				ns_own_meshid_H = 0x00;
2820  04e4 725f008d      	clr	_ns_own_meshid_H
2821                     ; 397 				ns_own_meshid_L = 0x00;
2823  04e8 725f008c      	clr	_ns_own_meshid_L
2824                     ; 398 				ns_host_meshid_H = 0x80;
2826  04ec 3580008b      	mov	_ns_host_meshid_H,#128
2827                     ; 399 				ns_host_meshid_L = 0xFF;
2829  04f0 35ff008a      	mov	_ns_host_meshid_L,#255
2830                     ; 400 				break;
2832  04f4               L5321:
2833  04f4               L7111:
2834                     ; 404 }
2837  04f4 5b3b          	addw	sp,#59
2838  04f6 81            	ret
2887                     ; 407 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2887                     ; 408 {
2888                     .text:	section	.text,new
2889  0000               _sicp_send_message:
2891  0000 89            	pushw	x
2892       00000000      OFST:	set	0
2895                     ; 411 	UART2_Send_Buf[0] = tx->frame_h1;
2897  0001 f6            	ld	a,(x)
2898  0002 c7005a        	ld	_UART2_Send_Buf,a
2899                     ; 412 	UART2_Send_Buf[1] = tx->frame_h2;
2901  0005 e601          	ld	a,(1,x)
2902  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2903                     ; 413 	UART2_Send_Buf[2] = tx->message_id;
2905  000a e602          	ld	a,(2,x)
2906  000c c7005c        	ld	_UART2_Send_Buf+2,a
2907                     ; 414 	UART2_Send_Buf[3] = tx->mesh_id_H;
2909  000f e603          	ld	a,(3,x)
2910  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2911                     ; 415 	UART2_Send_Buf[4] = tx->mesh_id_L;
2913  0014 e604          	ld	a,(4,x)
2914  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2915                     ; 416 	UART2_Send_Buf[5] = 4+payload_len;
2917  0019 7b05          	ld	a,(OFST+5,sp)
2918  001b ab04          	add	a,#4
2919  001d c7005f        	ld	_UART2_Send_Buf+5,a
2920                     ; 417 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2922  0020 7b05          	ld	a,(OFST+5,sp)
2923  0022 b703          	ld	c_lreg+3,a
2924  0024 3f02          	clr	c_lreg+2
2925  0026 3f01          	clr	c_lreg+1
2926  0028 3f00          	clr	c_lreg
2927  002a be02          	ldw	x,c_lreg+2
2928  002c 89            	pushw	x
2929  002d be00          	ldw	x,c_lreg
2930  002f 89            	pushw	x
2931  0030 1e05          	ldw	x,(OFST+5,sp)
2932  0032 1c0005        	addw	x,#5
2933  0035 89            	pushw	x
2934  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2935  0039 cd0000        	call	_mymemcpy
2937  003c 5b06          	addw	sp,#6
2938                     ; 418 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2940  003e 7b05          	ld	a,(OFST+5,sp)
2941  0040 5f            	clrw	x
2942  0041 97            	ld	xl,a
2943  0042 89            	pushw	x
2944  0043 3b005f        	push	_UART2_Send_Buf+5
2945  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2946  0049 cd0000        	call	_Check_Sum
2948  004c 5b01          	addw	sp,#1
2949  004e 85            	popw	x
2950  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2951                     ; 419 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2953  0052 7b05          	ld	a,(OFST+5,sp)
2954  0054 5f            	clrw	x
2955  0055 97            	ld	xl,a
2956  0056 1c0007        	addw	x,#7
2957  0059 89            	pushw	x
2958  005a ae005a        	ldw	x,#_UART2_Send_Buf
2959  005d cd0000        	call	_Uart2_Send
2961  0060 85            	popw	x
2963  0061               L3621:
2964                     ; 420 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2966  0061 725d0057      	tnz	_Uart2_Send_Done
2967  0065 27fa          	jreq	L3621
2970  0067 725f0057      	clr	_Uart2_Send_Done
2971                     ; 421 }
2974  006b 85            	popw	x
2975  006c 81            	ret
3027                     ; 427 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
3027                     ; 428 {
3028                     .text:	section	.text,new
3029  0000               _sicp_receipt_OK:
3031  0000 5237          	subw	sp,#55
3032       00000037      OFST:	set	55
3035                     ; 430 	receipt.frame_h1 = 0xEE;
3037  0002 a6ee          	ld	a,#238
3038  0004 6b01          	ld	(OFST-54,sp),a
3039                     ; 431 	receipt.frame_h2 = 0xAA;
3041  0006 a6aa          	ld	a,#170
3042  0008 6b02          	ld	(OFST-53,sp),a
3043                     ; 432 	receipt.message_id = send_message_id;
3045  000a 9f            	ld	a,xl
3046  000b 6b03          	ld	(OFST-52,sp),a
3047                     ; 433 	receipt.mesh_id_H = ns_host_meshid_H;
3049  000d c6008b        	ld	a,_ns_host_meshid_H
3050  0010 6b04          	ld	(OFST-51,sp),a
3051                     ; 434 	receipt.mesh_id_L = ns_host_meshid_L;
3053  0012 c6008a        	ld	a,_ns_host_meshid_L
3054  0015 6b05          	ld	(OFST-50,sp),a
3055                     ; 435 	receipt.payload[0] = 0xAA;
3057  0017 a6aa          	ld	a,#170
3058  0019 6b06          	ld	(OFST-49,sp),a
3059                     ; 436 	receipt.payload[1] = type;
3061  001b 9e            	ld	a,xh
3062  001c 6b07          	ld	(OFST-48,sp),a
3063                     ; 437 	sicp_send_message(&receipt,2);
3065  001e 4b02          	push	#2
3066  0020 96            	ldw	x,sp
3067  0021 1c0002        	addw	x,#OFST-53
3068  0024 cd0000        	call	_sicp_send_message
3070  0027 84            	pop	a
3071                     ; 438 }
3074  0028 5b37          	addw	sp,#55
3075  002a 81            	ret
3149                     ; 440 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
3149                     ; 441 {
3150                     .text:	section	.text,new
3151  0000               _sicp_receipt_Done:
3153  0000 89            	pushw	x
3154  0001 5238          	subw	sp,#56
3155       00000038      OFST:	set	56
3158                     ; 442 	u8 i = 0;
3160  0003 0f38          	clr	(OFST+0,sp)
3161                     ; 444 	receipt.frame_h1 = 0xEE;
3163  0005 a6ee          	ld	a,#238
3164  0007 6b01          	ld	(OFST-55,sp),a
3165                     ; 445 	receipt.frame_h2 = 0xAA;
3167  0009 a6aa          	ld	a,#170
3168  000b 6b02          	ld	(OFST-54,sp),a
3169                     ; 446 	receipt.message_id = send_message_id;
3171  000d 9f            	ld	a,xl
3172  000e 6b03          	ld	(OFST-53,sp),a
3173                     ; 447 	receipt.mesh_id_H = ns_host_meshid_H;
3175  0010 c6008b        	ld	a,_ns_host_meshid_H
3176  0013 6b04          	ld	(OFST-52,sp),a
3177                     ; 448 	receipt.mesh_id_L = ns_host_meshid_L;
3179  0015 c6008a        	ld	a,_ns_host_meshid_L
3180  0018 6b05          	ld	(OFST-51,sp),a
3181                     ; 449 	receipt.payload[0] = 0xAA;
3183  001a a6aa          	ld	a,#170
3184  001c 6b06          	ld	(OFST-50,sp),a
3185                     ; 450 	receipt.payload[1] = type;
3187  001e 9e            	ld	a,xh
3188  001f 6b07          	ld	(OFST-49,sp),a
3189                     ; 451 	switch(method){
3191  0021 7b3f          	ld	a,(OFST+7,sp)
3193                     ; 478 		default:
3193                     ; 479 		break;
3194  0023 4a            	dec	a
3195  0024 2707          	jreq	L1131
3196  0026 4a            	dec	a
3197  0027 2766          	jreq	L3131
3198  0029 acef00ef      	jpf	L1531
3199  002d               L1131:
3200                     ; 452 		case 0x01://action Dimmer调光的执行回执
3200                     ; 453 		receipt.payload[2] = mdid;
3202  002d 7b40          	ld	a,(OFST+8,sp)
3203  002f 6b08          	ld	(OFST-48,sp),a
3204                     ; 454 		for(i = 0;i < 15;i++){
3206  0031 0f38          	clr	(OFST+0,sp)
3207  0033               L3531:
3208                     ; 455 			if(sc.slc[i].MDID == mdid){
3210  0033 7b38          	ld	a,(OFST+0,sp)
3211  0035 97            	ld	xl,a
3212  0036 a61a          	ld	a,#26
3213  0038 42            	mul	x,a
3214  0039 7b40          	ld	a,(OFST+8,sp)
3215  003b 905f          	clrw	y
3216  003d 9097          	ld	yl,a
3217  003f 90bf00        	ldw	c_y,y
3218  0042 9093          	ldw	y,x
3219  0044 90de0261      	ldw	y,(_sc+464,y)
3220  0048 90b300        	cpw	y,c_y
3221  004b 2638          	jrne	L1631
3222                     ; 456 				receipt.payload[3] = sc.slc[i].ch1_status;
3224  004d 7b38          	ld	a,(OFST+0,sp)
3225  004f 97            	ld	xl,a
3226  0050 a61a          	ld	a,#26
3227  0052 42            	mul	x,a
3228  0053 d60263        	ld	a,(_sc+466,x)
3229  0056 6b09          	ld	(OFST-47,sp),a
3230                     ; 457 				receipt.payload[4] = sc.slc[i].ch2_status;
3232  0058 7b38          	ld	a,(OFST+0,sp)
3233  005a 97            	ld	xl,a
3234  005b a61a          	ld	a,#26
3235  005d 42            	mul	x,a
3236  005e d60264        	ld	a,(_sc+467,x)
3237  0061 6b0a          	ld	(OFST-46,sp),a
3238                     ; 458 				receipt.payload[5] = sc.slc[i].ch3_status;
3240  0063 7b38          	ld	a,(OFST+0,sp)
3241  0065 97            	ld	xl,a
3242  0066 a61a          	ld	a,#26
3243  0068 42            	mul	x,a
3244  0069 d60265        	ld	a,(_sc+468,x)
3245  006c 6b0b          	ld	(OFST-45,sp),a
3246                     ; 459 				receipt.payload[6] = sc.slc[i].ch4_status;
3248  006e 7b38          	ld	a,(OFST+0,sp)
3249  0070 97            	ld	xl,a
3250  0071 a61a          	ld	a,#26
3251  0073 42            	mul	x,a
3252  0074 d60266        	ld	a,(_sc+469,x)
3253  0077 6b0c          	ld	(OFST-44,sp),a
3254                     ; 460 				sicp_send_message(&receipt,7);
3256  0079 4b07          	push	#7
3257  007b 96            	ldw	x,sp
3258  007c 1c0002        	addw	x,#OFST-54
3259  007f cd0000        	call	_sicp_send_message
3261  0082 84            	pop	a
3262                     ; 461 				break;
3264  0083 206a          	jra	L1531
3265  0085               L1631:
3266                     ; 454 		for(i = 0;i < 15;i++){
3268  0085 0c38          	inc	(OFST+0,sp)
3271  0087 7b38          	ld	a,(OFST+0,sp)
3272  0089 a10f          	cp	a,#15
3273  008b 25a6          	jrult	L3531
3274  008d 2060          	jra	L1531
3275  008f               L3131:
3276                     ; 465 		case 0x02://action plug switch打开或关闭开关的执行回执
3276                     ; 466 		receipt.payload[2] = mdid;
3278  008f 7b40          	ld	a,(OFST+8,sp)
3279  0091 6b08          	ld	(OFST-48,sp),a
3280                     ; 467 		for(i = 0;i < 15;i++){
3282  0093 0f38          	clr	(OFST+0,sp)
3283  0095               L3631:
3284                     ; 468 			if(sc.spc[i].MDID == mdid){
3286  0095 7b38          	ld	a,(OFST+0,sp)
3287  0097 97            	ld	xl,a
3288  0098 a61c          	ld	a,#28
3289  009a 42            	mul	x,a
3290  009b 7b40          	ld	a,(OFST+8,sp)
3291  009d 905f          	clrw	y
3292  009f 9097          	ld	yl,a
3293  00a1 90bf00        	ldw	c_y,y
3294  00a4 9093          	ldw	y,x
3295  00a6 90de00bd      	ldw	y,(_sc+44,y)
3296  00aa 90b300        	cpw	y,c_y
3297  00ad 2638          	jrne	L1731
3298                     ; 469 				receipt.payload[3] = sc.spc[i].ch1_status;
3300  00af 7b38          	ld	a,(OFST+0,sp)
3301  00b1 97            	ld	xl,a
3302  00b2 a61c          	ld	a,#28
3303  00b4 42            	mul	x,a
3304  00b5 d600bf        	ld	a,(_sc+46,x)
3305  00b8 6b09          	ld	(OFST-47,sp),a
3306                     ; 470 				receipt.payload[4] = sc.spc[i].ch2_status;
3308  00ba 7b38          	ld	a,(OFST+0,sp)
3309  00bc 97            	ld	xl,a
3310  00bd a61c          	ld	a,#28
3311  00bf 42            	mul	x,a
3312  00c0 d600c0        	ld	a,(_sc+47,x)
3313  00c3 6b0a          	ld	(OFST-46,sp),a
3314                     ; 471 				receipt.payload[5] = sc.spc[i].ch3_status;
3316  00c5 7b38          	ld	a,(OFST+0,sp)
3317  00c7 97            	ld	xl,a
3318  00c8 a61c          	ld	a,#28
3319  00ca 42            	mul	x,a
3320  00cb d600c1        	ld	a,(_sc+48,x)
3321  00ce 6b0b          	ld	(OFST-45,sp),a
3322                     ; 472 				receipt.payload[6] = sc.spc[i].ch4_status;
3324  00d0 7b38          	ld	a,(OFST+0,sp)
3325  00d2 97            	ld	xl,a
3326  00d3 a61c          	ld	a,#28
3327  00d5 42            	mul	x,a
3328  00d6 d600c2        	ld	a,(_sc+49,x)
3329  00d9 6b0c          	ld	(OFST-44,sp),a
3330                     ; 473 				sicp_send_message(&receipt,7);
3332  00db 4b07          	push	#7
3333  00dd 96            	ldw	x,sp
3334  00de 1c0002        	addw	x,#OFST-54
3335  00e1 cd0000        	call	_sicp_send_message
3337  00e4 84            	pop	a
3338                     ; 474 				break;
3340  00e5 2008          	jra	L1531
3341  00e7               L1731:
3342                     ; 467 		for(i = 0;i < 15;i++){
3344  00e7 0c38          	inc	(OFST+0,sp)
3347  00e9 7b38          	ld	a,(OFST+0,sp)
3348  00eb a10f          	cp	a,#15
3349  00ed 25a6          	jrult	L3631
3350  00ef               L5131:
3351                     ; 478 		default:
3351                     ; 479 		break;
3353  00ef               L1531:
3354                     ; 481 }
3357  00ef 5b3a          	addw	sp,#58
3358  00f1 81            	ret
3412                     ; 484 void rev_cmd_data(u8 moduleid){
3413                     .text:	section	.text,new
3414  0000               _rev_cmd_data:
3416  0000 88            	push	a
3417  0001 5238          	subw	sp,#56
3418       00000038      OFST:	set	56
3421                     ; 487 	for(i = 0;i < 15;i++){
3423  0003 0f01          	clr	(OFST-55,sp)
3424  0005               L5141:
3425                     ; 488 		if(sc.slc[i].MDID == moduleid){
3427  0005 7b01          	ld	a,(OFST-55,sp)
3428  0007 97            	ld	xl,a
3429  0008 a61a          	ld	a,#26
3430  000a 42            	mul	x,a
3431  000b 7b39          	ld	a,(OFST+1,sp)
3432  000d 905f          	clrw	y
3433  000f 9097          	ld	yl,a
3434  0011 90bf00        	ldw	c_y,y
3435  0014 9093          	ldw	y,x
3436  0016 90de0261      	ldw	y,(_sc+464,y)
3437  001a 90b300        	cpw	y,c_y
3438  001d 2657          	jrne	L3241
3439                     ; 489 			cmd_data.frame_h1 = 0xEE;
3441  001f a6ee          	ld	a,#238
3442  0021 6b02          	ld	(OFST-54,sp),a
3443                     ; 490 			cmd_data.frame_h2 = 0xAA;
3445  0023 a6aa          	ld	a,#170
3446  0025 6b03          	ld	(OFST-53,sp),a
3447                     ; 491 			cmd_data.message_id = rev_message_id;
3449  0027 c60089        	ld	a,_rev_message_id
3450  002a 6b04          	ld	(OFST-52,sp),a
3451                     ; 492 			cmd_data.mesh_id_H = ns_host_meshid_H;
3453  002c c6008b        	ld	a,_ns_host_meshid_H
3454  002f 6b05          	ld	(OFST-51,sp),a
3455                     ; 493 			cmd_data.mesh_id_L = ns_host_meshid_L;
3457  0031 c6008a        	ld	a,_ns_host_meshid_L
3458  0034 6b06          	ld	(OFST-50,sp),a
3459                     ; 494 			cmd_data.payload[0] = 0x06;
3461  0036 a606          	ld	a,#6
3462  0038 6b07          	ld	(OFST-49,sp),a
3463                     ; 495 			cmd_data.payload[1] = moduleid;
3465  003a 7b39          	ld	a,(OFST+1,sp)
3466  003c 6b08          	ld	(OFST-48,sp),a
3467                     ; 496 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3469  003e 7b01          	ld	a,(OFST-55,sp)
3470  0040 97            	ld	xl,a
3471  0041 a61a          	ld	a,#26
3472  0043 42            	mul	x,a
3473  0044 d60263        	ld	a,(_sc+466,x)
3474  0047 6b09          	ld	(OFST-47,sp),a
3475                     ; 497 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3477  0049 7b01          	ld	a,(OFST-55,sp)
3478  004b 97            	ld	xl,a
3479  004c a61a          	ld	a,#26
3480  004e 42            	mul	x,a
3481  004f d60264        	ld	a,(_sc+467,x)
3482  0052 6b0a          	ld	(OFST-46,sp),a
3483                     ; 498 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3485  0054 7b01          	ld	a,(OFST-55,sp)
3486  0056 97            	ld	xl,a
3487  0057 a61a          	ld	a,#26
3488  0059 42            	mul	x,a
3489  005a d60265        	ld	a,(_sc+468,x)
3490  005d 6b0b          	ld	(OFST-45,sp),a
3491                     ; 499 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3493  005f 7b01          	ld	a,(OFST-55,sp)
3494  0061 97            	ld	xl,a
3495  0062 a61a          	ld	a,#26
3496  0064 42            	mul	x,a
3497  0065 d60266        	ld	a,(_sc+469,x)
3498  0068 6b0c          	ld	(OFST-44,sp),a
3499                     ; 500 			sicp_send_message(&cmd_data,6);
3501  006a 4b06          	push	#6
3502  006c 96            	ldw	x,sp
3503  006d 1c0003        	addw	x,#OFST-53
3504  0070 cd0000        	call	_sicp_send_message
3506  0073 84            	pop	a
3507                     ; 501 			break;
3509  0074 207c          	jra	L1241
3510  0076               L3241:
3511                     ; 503 		if(sc.spc[i].MDID == moduleid){
3513  0076 7b01          	ld	a,(OFST-55,sp)
3514  0078 97            	ld	xl,a
3515  0079 a61c          	ld	a,#28
3516  007b 42            	mul	x,a
3517  007c 7b39          	ld	a,(OFST+1,sp)
3518  007e 905f          	clrw	y
3519  0080 9097          	ld	yl,a
3520  0082 90bf00        	ldw	c_y,y
3521  0085 9093          	ldw	y,x
3522  0087 90de00bd      	ldw	y,(_sc+44,y)
3523  008b 90b300        	cpw	y,c_y
3524  008e 2657          	jrne	L5241
3525                     ; 504 			cmd_data.frame_h1 = 0xEE;
3527  0090 a6ee          	ld	a,#238
3528  0092 6b02          	ld	(OFST-54,sp),a
3529                     ; 505 			cmd_data.frame_h2 = 0xAA;
3531  0094 a6aa          	ld	a,#170
3532  0096 6b03          	ld	(OFST-53,sp),a
3533                     ; 506 			cmd_data.message_id = rev_message_id;
3535  0098 c60089        	ld	a,_rev_message_id
3536  009b 6b04          	ld	(OFST-52,sp),a
3537                     ; 507 			cmd_data.mesh_id_H = ns_host_meshid_H;
3539  009d c6008b        	ld	a,_ns_host_meshid_H
3540  00a0 6b05          	ld	(OFST-51,sp),a
3541                     ; 508 			cmd_data.mesh_id_L = ns_host_meshid_L;
3543  00a2 c6008a        	ld	a,_ns_host_meshid_L
3544  00a5 6b06          	ld	(OFST-50,sp),a
3545                     ; 509 			cmd_data.payload[0] = 0x06;
3547  00a7 a606          	ld	a,#6
3548  00a9 6b07          	ld	(OFST-49,sp),a
3549                     ; 510 			cmd_data.payload[1] = moduleid;
3551  00ab 7b39          	ld	a,(OFST+1,sp)
3552  00ad 6b08          	ld	(OFST-48,sp),a
3553                     ; 511 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3555  00af 7b01          	ld	a,(OFST-55,sp)
3556  00b1 97            	ld	xl,a
3557  00b2 a61c          	ld	a,#28
3558  00b4 42            	mul	x,a
3559  00b5 d600bf        	ld	a,(_sc+46,x)
3560  00b8 6b09          	ld	(OFST-47,sp),a
3561                     ; 512 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3563  00ba 7b01          	ld	a,(OFST-55,sp)
3564  00bc 97            	ld	xl,a
3565  00bd a61c          	ld	a,#28
3566  00bf 42            	mul	x,a
3567  00c0 d600c0        	ld	a,(_sc+47,x)
3568  00c3 6b0a          	ld	(OFST-46,sp),a
3569                     ; 513 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3571  00c5 7b01          	ld	a,(OFST-55,sp)
3572  00c7 97            	ld	xl,a
3573  00c8 a61c          	ld	a,#28
3574  00ca 42            	mul	x,a
3575  00cb d600c1        	ld	a,(_sc+48,x)
3576  00ce 6b0b          	ld	(OFST-45,sp),a
3577                     ; 514 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3579  00d0 7b01          	ld	a,(OFST-55,sp)
3580  00d2 97            	ld	xl,a
3581  00d3 a61c          	ld	a,#28
3582  00d5 42            	mul	x,a
3583  00d6 d600c2        	ld	a,(_sc+49,x)
3584  00d9 6b0c          	ld	(OFST-44,sp),a
3585                     ; 515 			sicp_send_message(&cmd_data,6);
3587  00db 4b06          	push	#6
3588  00dd 96            	ldw	x,sp
3589  00de 1c0003        	addw	x,#OFST-53
3590  00e1 cd0000        	call	_sicp_send_message
3592  00e4 84            	pop	a
3593                     ; 516 			break;
3595  00e5 200b          	jra	L1241
3596  00e7               L5241:
3597                     ; 487 	for(i = 0;i < 15;i++){
3599  00e7 0c01          	inc	(OFST-55,sp)
3602  00e9 7b01          	ld	a,(OFST-55,sp)
3603  00eb a10f          	cp	a,#15
3604  00ed 2403          	jruge	L621
3605  00ef cc0005        	jp	L5141
3606  00f2               L621:
3607  00f2               L1241:
3608                     ; 519 }
3611  00f2 5b39          	addw	sp,#57
3612  00f4 81            	ret
3615                     	switch	.data
3616  0000               L7241_eg_timeout:
3617  0000 0000          	dc.w	0
3671                     ; 522 void report_energy_consum(void){
3672                     .text:	section	.text,new
3673  0000               _report_energy_consum:
3675  0000 5238          	subw	sp,#56
3676       00000038      OFST:	set	56
3679                     ; 526 	systime_count[3]++;
3681  0002 ce0006        	ldw	x,_systime_count+6
3682  0005 1c0001        	addw	x,#1
3683  0008 cf0006        	ldw	_systime_count+6,x
3684                     ; 527 	if(systime_count[3] >= 60){
3686  000b ce0006        	ldw	x,_systime_count+6
3687  000e a3003c        	cpw	x,#60
3688  0011 2403          	jruge	L231
3689  0013 cc00a2        	jp	L3541
3690  0016               L231:
3691                     ; 528 		systime_count[3] = 0;
3693  0016 5f            	clrw	x
3694  0017 cf0006        	ldw	_systime_count+6,x
3695                     ; 529 		systime_count[4]++;
3697  001a ce0008        	ldw	x,_systime_count+8
3698  001d 1c0001        	addw	x,#1
3699  0020 cf0008        	ldw	_systime_count+8,x
3700                     ; 530 		if(systime_count[4] >= 30){
3702  0023 ce0008        	ldw	x,_systime_count+8
3703  0026 a3001e        	cpw	x,#30
3704  0029 2577          	jrult	L3541
3705                     ; 531 			systime_count[4] = 0;
3707  002b 5f            	clrw	x
3708  002c cf0008        	ldw	_systime_count+8,x
3709                     ; 532 			i2c_get_energy_consum();
3711  002f cd0000        	call	_i2c_get_energy_consum
3713                     ; 533 			for(i = 0; i < 15; i++){
3715  0032 0f01          	clr	(OFST-55,sp)
3716  0034               L7541:
3717                     ; 534 				if(sc.spc[i].MDID){//有ID说明SPC存在
3719  0034 7b01          	ld	a,(OFST-55,sp)
3720  0036 97            	ld	xl,a
3721  0037 a61c          	ld	a,#28
3722  0039 42            	mul	x,a
3723  003a d600be        	ld	a,(_sc+45,x)
3724  003d da00bd        	or	a,(_sc+44,x)
3725  0040 2758          	jreq	L5641
3726                     ; 535 				ec.frame_h1 = 0xEE;
3728  0042 a6ee          	ld	a,#238
3729  0044 6b02          	ld	(OFST-54,sp),a
3730                     ; 536 				ec.frame_h2 = 0xEE;
3732  0046 a6ee          	ld	a,#238
3733  0048 6b03          	ld	(OFST-53,sp),a
3734                     ; 537 				ec.message_id = i+1;
3736  004a 7b01          	ld	a,(OFST-55,sp)
3737  004c 4c            	inc	a
3738  004d 6b04          	ld	(OFST-52,sp),a
3739                     ; 538 				ec.mesh_id_H = ns_host_meshid_H;
3741  004f c6008b        	ld	a,_ns_host_meshid_H
3742  0052 6b05          	ld	(OFST-51,sp),a
3743                     ; 539 				ec.mesh_id_L = ns_host_meshid_L;
3745  0054 c6008a        	ld	a,_ns_host_meshid_L
3746  0057 6b06          	ld	(OFST-50,sp),a
3747                     ; 540 				ec.payload[0] = 0x2A;
3749  0059 a62a          	ld	a,#42
3750  005b 6b07          	ld	(OFST-49,sp),a
3751                     ; 541 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3753  005d 7b01          	ld	a,(OFST-55,sp)
3754  005f 97            	ld	xl,a
3755  0060 a61c          	ld	a,#28
3756  0062 42            	mul	x,a
3757  0063 de00c3        	ldw	x,(_sc+50,x)
3758  0066 01            	rrwa	x,a
3759  0067 9f            	ld	a,xl
3760  0068 a4ff          	and	a,#255
3761  006a 97            	ld	xl,a
3762  006b 4f            	clr	a
3763  006c 02            	rlwa	x,a
3764  006d 4f            	clr	a
3765  006e 01            	rrwa	x,a
3766  006f 9f            	ld	a,xl
3767  0070 6b08          	ld	(OFST-48,sp),a
3768                     ; 542 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3770  0072 7b01          	ld	a,(OFST-55,sp)
3771  0074 97            	ld	xl,a
3772  0075 a61c          	ld	a,#28
3773  0077 42            	mul	x,a
3774  0078 d600c4        	ld	a,(_sc+51,x)
3775  007b a4ff          	and	a,#255
3776  007d 6b09          	ld	(OFST-47,sp),a
3777                     ; 543 				ec.payload[3] =	sc.spc[i].MDID;
3779  007f 7b01          	ld	a,(OFST-55,sp)
3780  0081 97            	ld	xl,a
3781  0082 a61c          	ld	a,#28
3782  0084 42            	mul	x,a
3783  0085 d600be        	ld	a,(_sc+45,x)
3784  0088 6b0a          	ld	(OFST-46,sp),a
3785                     ; 544 				sicp_send_message(&ec,4);
3787  008a 4b04          	push	#4
3788  008c 96            	ldw	x,sp
3789  008d 1c0003        	addw	x,#OFST-53
3790  0090 cd0000        	call	_sicp_send_message
3792  0093 84            	pop	a
3793                     ; 545 				eg_timeout = 5;
3795  0094 ae0005        	ldw	x,#5
3796  0097 cf0000        	ldw	L7241_eg_timeout,x
3797  009a               L5641:
3798                     ; 533 			for(i = 0; i < 15; i++){
3800  009a 0c01          	inc	(OFST-55,sp)
3803  009c 7b01          	ld	a,(OFST-55,sp)
3804  009e a10f          	cp	a,#15
3805  00a0 2592          	jrult	L7541
3806  00a2               L3541:
3807                     ; 551 	if(eg_timeout){
3809  00a2 ce0000        	ldw	x,L7241_eg_timeout
3810  00a5 2603          	jrne	L431
3811  00a7 cc0132        	jp	L7641
3812  00aa               L431:
3813                     ; 552 		if(--eg_timeout == 0){
3815  00aa ce0000        	ldw	x,L7241_eg_timeout
3816  00ad 1d0001        	subw	x,#1
3817  00b0 cf0000        	ldw	L7241_eg_timeout,x
3818  00b3 267d          	jrne	L7641
3819                     ; 553 			for(i = 0;i < 15;i++){
3821  00b5 0f01          	clr	(OFST-55,sp)
3822  00b7               L3741:
3823                     ; 554 				if((sc.spc[i].MDID!=0) && (!sc.spc[i].flag._flag_bit.bit0)){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3825  00b7 7b01          	ld	a,(OFST-55,sp)
3826  00b9 97            	ld	xl,a
3827  00ba a61c          	ld	a,#28
3828  00bc 42            	mul	x,a
3829  00bd d600be        	ld	a,(_sc+45,x)
3830  00c0 da00bd        	or	a,(_sc+44,x)
3831  00c3 2765          	jreq	L1051
3833  00c5 7b01          	ld	a,(OFST-55,sp)
3834  00c7 97            	ld	xl,a
3835  00c8 a61c          	ld	a,#28
3836  00ca 42            	mul	x,a
3837  00cb d600c5        	ld	a,(_sc+52,x)
3838  00ce a501          	bcp	a,#1
3839  00d0 2658          	jrne	L1051
3840                     ; 555 					ec.frame_h1 = 0xEE;
3842  00d2 a6ee          	ld	a,#238
3843  00d4 6b02          	ld	(OFST-54,sp),a
3844                     ; 556 					ec.frame_h2 = 0xEE;
3846  00d6 a6ee          	ld	a,#238
3847  00d8 6b03          	ld	(OFST-53,sp),a
3848                     ; 557 					ec.message_id = i+1;
3850  00da 7b01          	ld	a,(OFST-55,sp)
3851  00dc 4c            	inc	a
3852  00dd 6b04          	ld	(OFST-52,sp),a
3853                     ; 558 					ec.mesh_id_H = ns_host_meshid_H;
3855  00df c6008b        	ld	a,_ns_host_meshid_H
3856  00e2 6b05          	ld	(OFST-51,sp),a
3857                     ; 559 					ec.mesh_id_L = ns_host_meshid_L;
3859  00e4 c6008a        	ld	a,_ns_host_meshid_L
3860  00e7 6b06          	ld	(OFST-50,sp),a
3861                     ; 560 					ec.payload[0] = 0x2A;
3863  00e9 a62a          	ld	a,#42
3864  00eb 6b07          	ld	(OFST-49,sp),a
3865                     ; 561 					ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3867  00ed 7b01          	ld	a,(OFST-55,sp)
3868  00ef 97            	ld	xl,a
3869  00f0 a61c          	ld	a,#28
3870  00f2 42            	mul	x,a
3871  00f3 de00c3        	ldw	x,(_sc+50,x)
3872  00f6 01            	rrwa	x,a
3873  00f7 9f            	ld	a,xl
3874  00f8 a4ff          	and	a,#255
3875  00fa 97            	ld	xl,a
3876  00fb 4f            	clr	a
3877  00fc 02            	rlwa	x,a
3878  00fd 4f            	clr	a
3879  00fe 01            	rrwa	x,a
3880  00ff 9f            	ld	a,xl
3881  0100 6b08          	ld	(OFST-48,sp),a
3882                     ; 562 					ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3884  0102 7b01          	ld	a,(OFST-55,sp)
3885  0104 97            	ld	xl,a
3886  0105 a61c          	ld	a,#28
3887  0107 42            	mul	x,a
3888  0108 d600c4        	ld	a,(_sc+51,x)
3889  010b a4ff          	and	a,#255
3890  010d 6b09          	ld	(OFST-47,sp),a
3891                     ; 563 					ec.payload[3] =	sc.spc[i].MDID;
3893  010f 7b01          	ld	a,(OFST-55,sp)
3894  0111 97            	ld	xl,a
3895  0112 a61c          	ld	a,#28
3896  0114 42            	mul	x,a
3897  0115 d600be        	ld	a,(_sc+45,x)
3898  0118 6b0a          	ld	(OFST-46,sp),a
3899                     ; 564 					sicp_send_message(&ec,4);
3901  011a 4b04          	push	#4
3902  011c 96            	ldw	x,sp
3903  011d 1c0003        	addw	x,#OFST-53
3904  0120 cd0000        	call	_sicp_send_message
3906  0123 84            	pop	a
3907                     ; 565 					eg_timeout = 5;//每5s重发1次直到接收到回执为止
3909  0124 ae0005        	ldw	x,#5
3910  0127 cf0000        	ldw	L7241_eg_timeout,x
3911  012a               L1051:
3912                     ; 553 			for(i = 0;i < 15;i++){
3914  012a 0c01          	inc	(OFST-55,sp)
3917  012c 7b01          	ld	a,(OFST-55,sp)
3918  012e a10f          	cp	a,#15
3919  0130 2585          	jrult	L3741
3920  0132               L7641:
3921                     ; 570 }
3924  0132 5b38          	addw	sp,#56
3925  0134 81            	ret
3965                     ; 573 void send_sc_device_info(void)
3965                     ; 574 {
3966                     .text:	section	.text,new
3967  0000               _send_sc_device_info:
3969  0000 5237          	subw	sp,#55
3970       00000037      OFST:	set	55
3973                     ; 577 	di.frame_h1 = 0xEE;
3975  0002 a6ee          	ld	a,#238
3976  0004 6b01          	ld	(OFST-54,sp),a
3977                     ; 578 	di.frame_h2 = 0xEE;
3979  0006 a6ee          	ld	a,#238
3980  0008 6b02          	ld	(OFST-53,sp),a
3981                     ; 579 	di.message_id = 16;
3983  000a a610          	ld	a,#16
3984  000c 6b03          	ld	(OFST-52,sp),a
3985                     ; 580 	di.mesh_id_H = ns_host_meshid_H;
3987  000e c6008b        	ld	a,_ns_host_meshid_H
3988  0011 6b04          	ld	(OFST-51,sp),a
3989                     ; 581 	di.mesh_id_L = ns_host_meshid_L;
3991  0013 c6008a        	ld	a,_ns_host_meshid_L
3992  0016 6b05          	ld	(OFST-50,sp),a
3993                     ; 582 	di.payload[0] = 0xB1;
3995  0018 a6b1          	ld	a,#177
3996  001a 6b06          	ld	(OFST-49,sp),a
3997                     ; 583 	di.payload[1] =	sc.deviceid[0];
3999  001c c60093        	ld	a,_sc+2
4000  001f 6b07          	ld	(OFST-48,sp),a
4001                     ; 584 	di.payload[2] =	sc.deviceid[1];
4003  0021 c60094        	ld	a,_sc+3
4004  0024 6b08          	ld	(OFST-47,sp),a
4005                     ; 585 	di.payload[3] =	sc.deviceid[2];
4007  0026 c60095        	ld	a,_sc+4
4008  0029 6b09          	ld	(OFST-46,sp),a
4009                     ; 586 	di.payload[4] =	sc.deviceid[3];
4011  002b c60096        	ld	a,_sc+5
4012  002e 6b0a          	ld	(OFST-45,sp),a
4013                     ; 587 	di.payload[5] =	sc.model;
4015  0030 c60099        	ld	a,_sc+8
4016  0033 6b0b          	ld	(OFST-44,sp),a
4017                     ; 588 	di.payload[6] = sc.firmware;
4019  0035 c60097        	ld	a,_sc+6
4020  0038 6b0c          	ld	(OFST-43,sp),a
4021                     ; 589 	di.payload[7] = sc.HWTtest;
4023  003a c60098        	ld	a,_sc+7
4024  003d 6b0d          	ld	(OFST-42,sp),a
4025                     ; 590 	di.payload[8] = sc.Ndevice;
4027  003f c600a4        	ld	a,_sc+19
4028  0042 6b0e          	ld	(OFST-41,sp),a
4029                     ; 591 	sicp_send_message(&di,9);
4031  0044 4b09          	push	#9
4032  0046 96            	ldw	x,sp
4033  0047 1c0002        	addw	x,#OFST-53
4034  004a cd0000        	call	_sicp_send_message
4036  004d 84            	pop	a
4037                     ; 592 }
4040  004e 5b37          	addw	sp,#55
4041  0050 81            	ret
4088                     ; 594 void send_slc_device_info(u8 i)
4088                     ; 595 {
4089                     .text:	section	.text,new
4090  0000               _send_slc_device_info:
4092  0000 88            	push	a
4093  0001 5237          	subw	sp,#55
4094       00000037      OFST:	set	55
4097                     ; 597 	di.frame_h1 = 0xEE;
4099  0003 a6ee          	ld	a,#238
4100  0005 6b01          	ld	(OFST-54,sp),a
4101                     ; 598 	di.frame_h2 = 0xEE;
4103  0007 a6ee          	ld	a,#238
4104  0009 6b02          	ld	(OFST-53,sp),a
4105                     ; 599 	di.message_id = 21+i;
4107  000b 7b38          	ld	a,(OFST+1,sp)
4108  000d ab15          	add	a,#21
4109  000f 6b03          	ld	(OFST-52,sp),a
4110                     ; 600 	di.mesh_id_H = ns_host_meshid_H;
4112  0011 c6008b        	ld	a,_ns_host_meshid_H
4113  0014 6b04          	ld	(OFST-51,sp),a
4114                     ; 601 	di.mesh_id_L = ns_host_meshid_L;
4116  0016 c6008a        	ld	a,_ns_host_meshid_L
4117  0019 6b05          	ld	(OFST-50,sp),a
4118                     ; 602 	di.payload[0] = 0xB2;
4120  001b a6b2          	ld	a,#178
4121  001d 6b06          	ld	(OFST-49,sp),a
4122                     ; 603 	di.payload[1] =	sc.slc[i].deviceid[0];
4124  001f 7b38          	ld	a,(OFST+1,sp)
4125  0021 97            	ld	xl,a
4126  0022 a61a          	ld	a,#26
4127  0024 42            	mul	x,a
4128  0025 d60250        	ld	a,(_sc+447,x)
4129  0028 6b07          	ld	(OFST-48,sp),a
4130                     ; 604 	di.payload[2] =	sc.slc[i].deviceid[1];
4132  002a 7b38          	ld	a,(OFST+1,sp)
4133  002c 97            	ld	xl,a
4134  002d a61a          	ld	a,#26
4135  002f 42            	mul	x,a
4136  0030 d60251        	ld	a,(_sc+448,x)
4137  0033 6b08          	ld	(OFST-47,sp),a
4138                     ; 605 	di.payload[3] =	sc.slc[i].deviceid[2];
4140  0035 7b38          	ld	a,(OFST+1,sp)
4141  0037 97            	ld	xl,a
4142  0038 a61a          	ld	a,#26
4143  003a 42            	mul	x,a
4144  003b d60252        	ld	a,(_sc+449,x)
4145  003e 6b09          	ld	(OFST-46,sp),a
4146                     ; 606 	di.payload[4] =	sc.slc[i].deviceid[3];
4148  0040 7b38          	ld	a,(OFST+1,sp)
4149  0042 97            	ld	xl,a
4150  0043 a61a          	ld	a,#26
4151  0045 42            	mul	x,a
4152  0046 d60253        	ld	a,(_sc+450,x)
4153  0049 6b0a          	ld	(OFST-45,sp),a
4154                     ; 607 	di.payload[5] =	sc.slc[i].model;
4156  004b 7b38          	ld	a,(OFST+1,sp)
4157  004d 97            	ld	xl,a
4158  004e a61a          	ld	a,#26
4159  0050 42            	mul	x,a
4160  0051 d60256        	ld	a,(_sc+453,x)
4161  0054 6b0b          	ld	(OFST-44,sp),a
4162                     ; 608 	di.payload[6] = sc.slc[i].firmware;
4164  0056 7b38          	ld	a,(OFST+1,sp)
4165  0058 97            	ld	xl,a
4166  0059 a61a          	ld	a,#26
4167  005b 42            	mul	x,a
4168  005c d60254        	ld	a,(_sc+451,x)
4169  005f 6b0c          	ld	(OFST-43,sp),a
4170                     ; 609 	di.payload[7] = sc.slc[i].HWTtest;
4172  0061 7b38          	ld	a,(OFST+1,sp)
4173  0063 97            	ld	xl,a
4174  0064 a61a          	ld	a,#26
4175  0066 42            	mul	x,a
4176  0067 d60255        	ld	a,(_sc+452,x)
4177  006a 6b0d          	ld	(OFST-42,sp),a
4178                     ; 610 	di.payload[8] = sc.slc[i].MDID;
4180  006c 7b38          	ld	a,(OFST+1,sp)
4181  006e 97            	ld	xl,a
4182  006f a61a          	ld	a,#26
4183  0071 42            	mul	x,a
4184  0072 d60262        	ld	a,(_sc+465,x)
4185  0075 6b0e          	ld	(OFST-41,sp),a
4186                     ; 611 	sicp_send_message(&di,9);
4188  0077 4b09          	push	#9
4189  0079 96            	ldw	x,sp
4190  007a 1c0002        	addw	x,#OFST-53
4191  007d cd0000        	call	_sicp_send_message
4193  0080 84            	pop	a
4194                     ; 612 }
4197  0081 5b38          	addw	sp,#56
4198  0083 81            	ret
4245                     ; 614 void send_spc_device_info(u8 i)
4245                     ; 615 {
4246                     .text:	section	.text,new
4247  0000               _send_spc_device_info:
4249  0000 88            	push	a
4250  0001 5237          	subw	sp,#55
4251       00000037      OFST:	set	55
4254                     ; 617 	di.frame_h1 = 0xEE;
4256  0003 a6ee          	ld	a,#238
4257  0005 6b01          	ld	(OFST-54,sp),a
4258                     ; 618 	di.frame_h2 = 0xEE;
4260  0007 a6ee          	ld	a,#238
4261  0009 6b02          	ld	(OFST-53,sp),a
4262                     ; 619 	di.message_id = 36+i;
4264  000b 7b38          	ld	a,(OFST+1,sp)
4265  000d ab24          	add	a,#36
4266  000f 6b03          	ld	(OFST-52,sp),a
4267                     ; 620 	di.mesh_id_H = ns_host_meshid_H;
4269  0011 c6008b        	ld	a,_ns_host_meshid_H
4270  0014 6b04          	ld	(OFST-51,sp),a
4271                     ; 621 	di.mesh_id_L = ns_host_meshid_L;
4273  0016 c6008a        	ld	a,_ns_host_meshid_L
4274  0019 6b05          	ld	(OFST-50,sp),a
4275                     ; 622 	di.payload[0] = 0xB3;
4277  001b a6b3          	ld	a,#179
4278  001d 6b06          	ld	(OFST-49,sp),a
4279                     ; 623 	di.payload[1] =	sc.spc[i].deviceid[0];
4281  001f 7b38          	ld	a,(OFST+1,sp)
4282  0021 97            	ld	xl,a
4283  0022 a61c          	ld	a,#28
4284  0024 42            	mul	x,a
4285  0025 d600ac        	ld	a,(_sc+27,x)
4286  0028 6b07          	ld	(OFST-48,sp),a
4287                     ; 624 	di.payload[2] =	sc.spc[i].deviceid[1];
4289  002a 7b38          	ld	a,(OFST+1,sp)
4290  002c 97            	ld	xl,a
4291  002d a61c          	ld	a,#28
4292  002f 42            	mul	x,a
4293  0030 d600ad        	ld	a,(_sc+28,x)
4294  0033 6b08          	ld	(OFST-47,sp),a
4295                     ; 625 	di.payload[3] =	sc.spc[i].deviceid[2];
4297  0035 7b38          	ld	a,(OFST+1,sp)
4298  0037 97            	ld	xl,a
4299  0038 a61c          	ld	a,#28
4300  003a 42            	mul	x,a
4301  003b d600ae        	ld	a,(_sc+29,x)
4302  003e 6b09          	ld	(OFST-46,sp),a
4303                     ; 626 	di.payload[4] =	sc.spc[i].deviceid[3];
4305  0040 7b38          	ld	a,(OFST+1,sp)
4306  0042 97            	ld	xl,a
4307  0043 a61c          	ld	a,#28
4308  0045 42            	mul	x,a
4309  0046 d600af        	ld	a,(_sc+30,x)
4310  0049 6b0a          	ld	(OFST-45,sp),a
4311                     ; 627 	di.payload[5] =	sc.spc[i].model;
4313  004b 7b38          	ld	a,(OFST+1,sp)
4314  004d 97            	ld	xl,a
4315  004e a61c          	ld	a,#28
4316  0050 42            	mul	x,a
4317  0051 d600b2        	ld	a,(_sc+33,x)
4318  0054 6b0b          	ld	(OFST-44,sp),a
4319                     ; 628 	di.payload[6] = sc.spc[i].firmware;
4321  0056 7b38          	ld	a,(OFST+1,sp)
4322  0058 97            	ld	xl,a
4323  0059 a61c          	ld	a,#28
4324  005b 42            	mul	x,a
4325  005c d600b0        	ld	a,(_sc+31,x)
4326  005f 6b0c          	ld	(OFST-43,sp),a
4327                     ; 629 	di.payload[7] = sc.spc[i].HWTtest;
4329  0061 7b38          	ld	a,(OFST+1,sp)
4330  0063 97            	ld	xl,a
4331  0064 a61c          	ld	a,#28
4332  0066 42            	mul	x,a
4333  0067 d600b1        	ld	a,(_sc+32,x)
4334  006a 6b0d          	ld	(OFST-42,sp),a
4335                     ; 630 	di.payload[8] = sc.spc[i].MDID;
4337  006c 7b38          	ld	a,(OFST+1,sp)
4338  006e 97            	ld	xl,a
4339  006f a61c          	ld	a,#28
4340  0071 42            	mul	x,a
4341  0072 d600be        	ld	a,(_sc+45,x)
4342  0075 6b0e          	ld	(OFST-41,sp),a
4343                     ; 631 	sicp_send_message(&di,9);
4345  0077 4b09          	push	#9
4346  0079 96            	ldw	x,sp
4347  007a 1c0002        	addw	x,#OFST-53
4348  007d cd0000        	call	_sicp_send_message
4350  0080 84            	pop	a
4351                     ; 632 }
4354  0081 5b38          	addw	sp,#56
4355  0083 81            	ret
4393                     ; 634 void send_device_info(void)
4393                     ; 635 {
4394                     .text:	section	.text,new
4395  0000               _send_device_info:
4397  0000 88            	push	a
4398       00000001      OFST:	set	1
4401                     ; 638 	send_sc_device_info();
4403  0001 cd0000        	call	_send_sc_device_info
4405                     ; 639 	delay(200);
4407  0004 ae00c8        	ldw	x,#200
4408  0007 cd0000        	call	_delay
4410                     ; 641 	for(i = 0; i < 15;i++){
4412  000a 0f01          	clr	(OFST+0,sp)
4413  000c               L5751:
4414                     ; 642 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4416  000c 7b01          	ld	a,(OFST+0,sp)
4417  000e 97            	ld	xl,a
4418  000f a61a          	ld	a,#26
4419  0011 42            	mul	x,a
4420  0012 d60262        	ld	a,(_sc+465,x)
4421  0015 da0261        	or	a,(_sc+464,x)
4422  0018 270b          	jreq	L3061
4423                     ; 643 			send_slc_device_info(i);
4425  001a 7b01          	ld	a,(OFST+0,sp)
4426  001c cd0000        	call	_send_slc_device_info
4428                     ; 644 			delay(200);
4430  001f ae00c8        	ldw	x,#200
4431  0022 cd0000        	call	_delay
4433  0025               L3061:
4434                     ; 641 	for(i = 0; i < 15;i++){
4436  0025 0c01          	inc	(OFST+0,sp)
4439  0027 7b01          	ld	a,(OFST+0,sp)
4440  0029 a10f          	cp	a,#15
4441  002b 25df          	jrult	L5751
4442                     ; 648 	for(i = 0; i < 15;i++){
4444  002d 0f01          	clr	(OFST+0,sp)
4445  002f               L5061:
4446                     ; 649 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4448  002f 7b01          	ld	a,(OFST+0,sp)
4449  0031 97            	ld	xl,a
4450  0032 a61c          	ld	a,#28
4451  0034 42            	mul	x,a
4452  0035 d600be        	ld	a,(_sc+45,x)
4453  0038 da00bd        	or	a,(_sc+44,x)
4454  003b 270b          	jreq	L3161
4455                     ; 650 			send_spc_device_info(i);
4457  003d 7b01          	ld	a,(OFST+0,sp)
4458  003f cd0000        	call	_send_spc_device_info
4460                     ; 651 			delay(200);
4462  0042 ae00c8        	ldw	x,#200
4463  0045 cd0000        	call	_delay
4465  0048               L3161:
4466                     ; 648 	for(i = 0; i < 15;i++){
4468  0048 0c01          	inc	(OFST+0,sp)
4471  004a 7b01          	ld	a,(OFST+0,sp)
4472  004c a10f          	cp	a,#15
4473  004e 25df          	jrult	L5061
4474                     ; 654 	di_timeout = 5;
4476  0050 35050001      	mov	_di_timeout,#5
4477                     ; 655 }
4480  0054 84            	pop	a
4481  0055 81            	ret
4528                     ; 658 void send_malfunction(void)
4528                     ; 659 {
4529                     .text:	section	.text,new
4530  0000               _send_malfunction:
4532  0000 5238          	subw	sp,#56
4533       00000038      OFST:	set	56
4536                     ; 663 	if((sc.HWTtest & 0xC0)!=0xC0){
4538  0002 c60098        	ld	a,_sc+7
4539  0005 a4c0          	and	a,#192
4540  0007 a1c0          	cp	a,#192
4541  0009 2735          	jreq	L5361
4542                     ; 664 		mal.frame_h1 = 0xEE;
4544  000b a6ee          	ld	a,#238
4545  000d 6b02          	ld	(OFST-54,sp),a
4546                     ; 665 		mal.frame_h2 = 0xEE;
4548  000f a6ee          	ld	a,#238
4549  0011 6b03          	ld	(OFST-53,sp),a
4550                     ; 666 		mal.message_id = 17;
4552  0013 a611          	ld	a,#17
4553  0015 6b04          	ld	(OFST-52,sp),a
4554                     ; 667 		mal.mesh_id_H = ns_host_meshid_H;
4556  0017 c6008b        	ld	a,_ns_host_meshid_H
4557  001a 6b05          	ld	(OFST-51,sp),a
4558                     ; 668 		mal.mesh_id_L = ns_host_meshid_L;
4560  001c c6008a        	ld	a,_ns_host_meshid_L
4561  001f 6b06          	ld	(OFST-50,sp),a
4562                     ; 669 		mal.payload[0] = 0x0A;
4564  0021 a60a          	ld	a,#10
4565  0023 6b07          	ld	(OFST-49,sp),a
4566                     ; 670 		mal.payload[1] = 0xB1;
4568  0025 a6b1          	ld	a,#177
4569  0027 6b08          	ld	(OFST-48,sp),a
4570                     ; 671 		mal.payload[2] =	0x00;
4572  0029 0f09          	clr	(OFST-47,sp)
4573                     ; 672 		mal.payload[3] =	sc.HWTtest;
4575  002b c60098        	ld	a,_sc+7
4576  002e 6b0a          	ld	(OFST-46,sp),a
4577                     ; 673 		sicp_send_message(&mal,4);
4579  0030 4b04          	push	#4
4580  0032 96            	ldw	x,sp
4581  0033 1c0003        	addw	x,#OFST-53
4582  0036 cd0000        	call	_sicp_send_message
4584  0039 84            	pop	a
4585                     ; 674 		delay(200);
4587  003a ae00c8        	ldw	x,#200
4588  003d cd0000        	call	_delay
4590  0040               L5361:
4591                     ; 677 	for(i = 0; i < 15;i++){
4593  0040 0f01          	clr	(OFST-55,sp)
4594  0042               L7361:
4595                     ; 678 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4597  0042 7b01          	ld	a,(OFST-55,sp)
4598  0044 97            	ld	xl,a
4599  0045 a61a          	ld	a,#26
4600  0047 42            	mul	x,a
4601  0048 d60262        	ld	a,(_sc+465,x)
4602  004b da0261        	or	a,(_sc+464,x)
4603  004e 2755          	jreq	L5461
4605  0050 7b01          	ld	a,(OFST-55,sp)
4606  0052 97            	ld	xl,a
4607  0053 a61a          	ld	a,#26
4608  0055 42            	mul	x,a
4609  0056 d60255        	ld	a,(_sc+452,x)
4610  0059 a4c0          	and	a,#192
4611  005b a1c0          	cp	a,#192
4612  005d 2746          	jreq	L5461
4613                     ; 679 			mal.frame_h1 = 0xEE;
4615  005f a6ee          	ld	a,#238
4616  0061 6b02          	ld	(OFST-54,sp),a
4617                     ; 680 			mal.frame_h2 = 0xEE;
4619  0063 a6ee          	ld	a,#238
4620  0065 6b03          	ld	(OFST-53,sp),a
4621                     ; 681 			mal.message_id = 51+i;
4623  0067 7b01          	ld	a,(OFST-55,sp)
4624  0069 ab33          	add	a,#51
4625  006b 6b04          	ld	(OFST-52,sp),a
4626                     ; 682 			mal.mesh_id_H = ns_host_meshid_H;
4628  006d c6008b        	ld	a,_ns_host_meshid_H
4629  0070 6b05          	ld	(OFST-51,sp),a
4630                     ; 683 			mal.mesh_id_L = ns_host_meshid_L;
4632  0072 c6008a        	ld	a,_ns_host_meshid_L
4633  0075 6b06          	ld	(OFST-50,sp),a
4634                     ; 684 			mal.payload[0] = 0x0A;
4636  0077 a60a          	ld	a,#10
4637  0079 6b07          	ld	(OFST-49,sp),a
4638                     ; 685 			mal.payload[1] = 0xB2;
4640  007b a6b2          	ld	a,#178
4641  007d 6b08          	ld	(OFST-48,sp),a
4642                     ; 686 			mal.payload[2] =	sc.slc[i].MDID;
4644  007f 7b01          	ld	a,(OFST-55,sp)
4645  0081 97            	ld	xl,a
4646  0082 a61a          	ld	a,#26
4647  0084 42            	mul	x,a
4648  0085 d60262        	ld	a,(_sc+465,x)
4649  0088 6b09          	ld	(OFST-47,sp),a
4650                     ; 687 			mal.payload[3] =	sc.slc[i].HWTtest;
4652  008a 7b01          	ld	a,(OFST-55,sp)
4653  008c 97            	ld	xl,a
4654  008d a61a          	ld	a,#26
4655  008f 42            	mul	x,a
4656  0090 d60255        	ld	a,(_sc+452,x)
4657  0093 6b0a          	ld	(OFST-46,sp),a
4658                     ; 688 			sicp_send_message(&mal,4);
4660  0095 4b04          	push	#4
4661  0097 96            	ldw	x,sp
4662  0098 1c0003        	addw	x,#OFST-53
4663  009b cd0000        	call	_sicp_send_message
4665  009e 84            	pop	a
4666                     ; 689 			delay(200);
4668  009f ae00c8        	ldw	x,#200
4669  00a2 cd0000        	call	_delay
4671  00a5               L5461:
4672                     ; 677 	for(i = 0; i < 15;i++){
4674  00a5 0c01          	inc	(OFST-55,sp)
4677  00a7 7b01          	ld	a,(OFST-55,sp)
4678  00a9 a10f          	cp	a,#15
4679  00ab 2595          	jrult	L7361
4680                     ; 693 	for(i = 0; i < 15;i++){
4682  00ad 0f01          	clr	(OFST-55,sp)
4683  00af               L7461:
4684                     ; 694 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4686  00af 7b01          	ld	a,(OFST-55,sp)
4687  00b1 97            	ld	xl,a
4688  00b2 a61c          	ld	a,#28
4689  00b4 42            	mul	x,a
4690  00b5 d600be        	ld	a,(_sc+45,x)
4691  00b8 da00bd        	or	a,(_sc+44,x)
4692  00bb 2755          	jreq	L5561
4694  00bd 7b01          	ld	a,(OFST-55,sp)
4695  00bf 97            	ld	xl,a
4696  00c0 a61c          	ld	a,#28
4697  00c2 42            	mul	x,a
4698  00c3 d600b1        	ld	a,(_sc+32,x)
4699  00c6 a4c0          	and	a,#192
4700  00c8 a1c0          	cp	a,#192
4701  00ca 2746          	jreq	L5561
4702                     ; 695 			mal.frame_h1 = 0xEE;
4704  00cc a6ee          	ld	a,#238
4705  00ce 6b02          	ld	(OFST-54,sp),a
4706                     ; 696 			mal.frame_h2 = 0xEE;
4708  00d0 a6ee          	ld	a,#238
4709  00d2 6b03          	ld	(OFST-53,sp),a
4710                     ; 697 			mal.message_id = 66+i;
4712  00d4 7b01          	ld	a,(OFST-55,sp)
4713  00d6 ab42          	add	a,#66
4714  00d8 6b04          	ld	(OFST-52,sp),a
4715                     ; 698 			mal.mesh_id_H = ns_host_meshid_H;
4717  00da c6008b        	ld	a,_ns_host_meshid_H
4718  00dd 6b05          	ld	(OFST-51,sp),a
4719                     ; 699 			mal.mesh_id_L = ns_host_meshid_L;
4721  00df c6008a        	ld	a,_ns_host_meshid_L
4722  00e2 6b06          	ld	(OFST-50,sp),a
4723                     ; 700 			mal.payload[0] = 0x0A;
4725  00e4 a60a          	ld	a,#10
4726  00e6 6b07          	ld	(OFST-49,sp),a
4727                     ; 701 			mal.payload[1] = 0xB2;
4729  00e8 a6b2          	ld	a,#178
4730  00ea 6b08          	ld	(OFST-48,sp),a
4731                     ; 702 			mal.payload[2] =	sc.spc[i].MDID;
4733  00ec 7b01          	ld	a,(OFST-55,sp)
4734  00ee 97            	ld	xl,a
4735  00ef a61c          	ld	a,#28
4736  00f1 42            	mul	x,a
4737  00f2 d600be        	ld	a,(_sc+45,x)
4738  00f5 6b09          	ld	(OFST-47,sp),a
4739                     ; 703 			mal.payload[3] =	sc.spc[i].HWTtest;
4741  00f7 7b01          	ld	a,(OFST-55,sp)
4742  00f9 97            	ld	xl,a
4743  00fa a61c          	ld	a,#28
4744  00fc 42            	mul	x,a
4745  00fd d600b1        	ld	a,(_sc+32,x)
4746  0100 6b0a          	ld	(OFST-46,sp),a
4747                     ; 704 			sicp_send_message(&mal,4);
4749  0102 4b04          	push	#4
4750  0104 96            	ldw	x,sp
4751  0105 1c0003        	addw	x,#OFST-53
4752  0108 cd0000        	call	_sicp_send_message
4754  010b 84            	pop	a
4755                     ; 705 			delay(200);
4757  010c ae00c8        	ldw	x,#200
4758  010f cd0000        	call	_delay
4760  0112               L5561:
4761                     ; 693 	for(i = 0; i < 15;i++){
4763  0112 0c01          	inc	(OFST-55,sp)
4766  0114 7b01          	ld	a,(OFST-55,sp)
4767  0116 a10f          	cp	a,#15
4768  0118 2595          	jrult	L7461
4769                     ; 708 }
4772  011a 5b38          	addw	sp,#56
4773  011c 81            	ret
4811                     ; 711 void check_send_repeatedly(void){
4812                     .text:	section	.text,new
4813  0000               _check_send_repeatedly:
4815  0000 88            	push	a
4816       00000001      OFST:	set	1
4819                     ; 714 	if(di_timeout){
4821  0001 725d0001      	tnz	_di_timeout
4822  0005 2766          	jreq	L3761
4823                     ; 715 		if(--di_timeout == 0){
4825  0007 725a0001      	dec	_di_timeout
4826  000b 2660          	jrne	L3761
4827                     ; 716 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4829  000d c603d4        	ld	a,_sc+835
4830  0010 a502          	bcp	a,#2
4831  0012 2607          	jrne	L7761
4834  0014 cd0000        	call	_send_sc_device_info
4838  0017 35050001      	mov	_di_timeout,#5
4839  001b               L7761:
4840                     ; 717 			for(i = 0; i < 15; i++){
4842  001b 0f01          	clr	(OFST+0,sp)
4843  001d               L1071:
4844                     ; 718 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4846  001d 7b01          	ld	a,(OFST+0,sp)
4847  001f 97            	ld	xl,a
4848  0020 a61a          	ld	a,#26
4849  0022 42            	mul	x,a
4850  0023 d60262        	ld	a,(_sc+465,x)
4851  0026 da0261        	or	a,(_sc+464,x)
4852  0029 2716          	jreq	L7071
4854  002b 7b01          	ld	a,(OFST+0,sp)
4855  002d 97            	ld	xl,a
4856  002e a61a          	ld	a,#26
4857  0030 42            	mul	x,a
4858  0031 d60267        	ld	a,(_sc+470,x)
4859  0034 a502          	bcp	a,#2
4860  0036 2609          	jrne	L7071
4863  0038 7b01          	ld	a,(OFST+0,sp)
4864  003a cd0000        	call	_send_slc_device_info
4868  003d 35050001      	mov	_di_timeout,#5
4869  0041               L7071:
4870                     ; 719 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4872  0041 7b01          	ld	a,(OFST+0,sp)
4873  0043 97            	ld	xl,a
4874  0044 a61c          	ld	a,#28
4875  0046 42            	mul	x,a
4876  0047 d600be        	ld	a,(_sc+45,x)
4877  004a da00bd        	or	a,(_sc+44,x)
4878  004d 2716          	jreq	L1171
4880  004f 7b01          	ld	a,(OFST+0,sp)
4881  0051 97            	ld	xl,a
4882  0052 a61c          	ld	a,#28
4883  0054 42            	mul	x,a
4884  0055 d600c5        	ld	a,(_sc+52,x)
4885  0058 a502          	bcp	a,#2
4886  005a 2609          	jrne	L1171
4889  005c 7b01          	ld	a,(OFST+0,sp)
4890  005e cd0000        	call	_send_spc_device_info
4894  0061 35050001      	mov	_di_timeout,#5
4895  0065               L1171:
4896                     ; 717 			for(i = 0; i < 15; i++){
4898  0065 0c01          	inc	(OFST+0,sp)
4901  0067 7b01          	ld	a,(OFST+0,sp)
4902  0069 a10f          	cp	a,#15
4903  006b 25b0          	jrult	L1071
4904  006d               L3761:
4905                     ; 723 }
4908  006d 84            	pop	a
4909  006e 81            	ret
4922                     	xdef	_send_spc_device_info
4923                     	xdef	_send_slc_device_info
4924                     	xdef	_send_sc_device_info
4925                     	xdef	_clear_uart_buf
4926                     	xdef	_Uart2_Send
4927                     	xref	_rand
4928                     	xref	_i2c_multiple_action_plug
4929                     	xref	_i2c_multiple_action_dimmer
4930                     	xref	_i2c_action_plug
4931                     	xref	_i2c_single_action_dimmer
4932                     	xref	_i2c_get_energy_consum
4933                     	xref	_action_dimmer_ext
4934                     	xdef	_delay
4935                     	xref	_systime_count
4936                     	xref	_init_slc_spc_done
4937                     	xref	_sys_init
4938                     	xdef	_check_send_repeatedly
4939                     	xdef	_send_malfunction
4940                     	xdef	_send_device_info
4941                     	xdef	_report_energy_consum
4942                     	xdef	_rev_cmd_data
4943                     	xdef	_sicp_receipt_Done
4944                     	xdef	_sicp_receipt_OK
4945                     	xdef	_sicp_send_message
4946                     	xdef	_random
4947                     	xdef	_rev_deal
4948                     	xdef	_Check_Sum
4949                     	xdef	_rev_anaylze
4950                     	xdef	_UART2_RX_ISR
4951                     	xdef	_UART2_TX_ISR
4952                     	xdef	_Init_uart2
4953                     	xdef	_mymemcpy
4954                     	switch	.bss
4955  0000               _mal_timeout:
4956  0000 00            	ds.b	1
4957                     	xdef	_mal_timeout
4958  0001               _di_timeout:
4959  0001 00            	ds.b	1
4960                     	xdef	_di_timeout
4961  0002               _send_failed_count:
4962  0002 0000          	ds.b	2
4963                     	xdef	_send_failed_count
4964  0004               _send_fault_count:
4965  0004 0000          	ds.b	2
4966                     	xdef	_send_fault_count
4967  0006               _sicp_buf:
4968  0006 000000000000  	ds.b	40
4969                     	xdef	_sicp_buf
4970  002e               _Uart2_Rec_Cnt:
4971  002e 00            	ds.b	1
4972                     	xdef	_Uart2_Rec_Cnt
4973  002f               _Uart2_Rece_Buf:
4974  002f 000000000000  	ds.b	40
4975                     	xdef	_Uart2_Rece_Buf
4976  0057               _Uart2_Send_Done:
4977  0057 00            	ds.b	1
4978                     	xdef	_Uart2_Send_Done
4979  0058               _Uart2_Send_Cnt:
4980  0058 00            	ds.b	1
4981                     	xdef	_Uart2_Send_Cnt
4982  0059               _Uart2_Send_Length:
4983  0059 00            	ds.b	1
4984                     	xdef	_Uart2_Send_Length
4985  005a               _UART2_Send_Buf:
4986  005a 000000000000  	ds.b	40
4987                     	xdef	_UART2_Send_Buf
4988  0082               _rev_ad_mesh_id_L:
4989  0082 00            	ds.b	1
4990                     	xdef	_rev_ad_mesh_id_L
4991  0083               _rev_ad_mesh_id_H:
4992  0083 00            	ds.b	1
4993                     	xdef	_rev_ad_mesh_id_H
4994  0084               _rev_ad_channel:
4995  0084 00            	ds.b	1
4996                     	xdef	_rev_ad_channel
4997  0085               _rev_ad_mdid:
4998  0085 00            	ds.b	1
4999                     	xdef	_rev_ad_mdid
5000  0086               _rev_ad_message_id:
5001  0086 00            	ds.b	1
5002                     	xdef	_rev_ad_message_id
5003  0087               _rev_mesh_id_L:
5004  0087 00            	ds.b	1
5005                     	xdef	_rev_mesh_id_L
5006  0088               _rev_mesh_id_H:
5007  0088 00            	ds.b	1
5008                     	xdef	_rev_mesh_id_H
5009  0089               _rev_message_id:
5010  0089 00            	ds.b	1
5011                     	xdef	_rev_message_id
5012  008a               _ns_host_meshid_L:
5013  008a 00            	ds.b	1
5014                     	xdef	_ns_host_meshid_L
5015  008b               _ns_host_meshid_H:
5016  008b 00            	ds.b	1
5017                     	xdef	_ns_host_meshid_H
5018  008c               _ns_own_meshid_L:
5019  008c 00            	ds.b	1
5020                     	xdef	_ns_own_meshid_L
5021  008d               _ns_own_meshid_H:
5022  008d 00            	ds.b	1
5023                     	xdef	_ns_own_meshid_H
5024  008e               _ns_phonenum:
5025  008e 00            	ds.b	1
5026                     	xdef	_ns_phonenum
5027  008f               _ns_status:
5028  008f 00            	ds.b	1
5029                     	xdef	_ns_status
5030  0090               _ns_signal:
5031  0090 00            	ds.b	1
5032                     	xdef	_ns_signal
5033  0091               _sc:
5034  0091 000000000000  	ds.b	836
5035                     	xdef	_sc
5036  03d5               _UART1Flag6_:
5037  03d5 00            	ds.b	1
5038                     	xdef	_UART1Flag6_
5039  03d6               _UART1Flag5_:
5040  03d6 00            	ds.b	1
5041                     	xdef	_UART1Flag5_
5042  03d7               _UART1Flag4_:
5043  03d7 00            	ds.b	1
5044                     	xdef	_UART1Flag4_
5045  03d8               _UART1Flag3_:
5046  03d8 00            	ds.b	1
5047                     	xdef	_UART1Flag3_
5048  03d9               _UART1Flag2_:
5049  03d9 00            	ds.b	1
5050                     	xdef	_UART1Flag2_
5051  03da               _UART1Flag1_:
5052  03da 00            	ds.b	1
5053                     	xdef	_UART1Flag1_
5054                     	xref	_UART2_ITConfig
5055                     	xref	_UART2_Cmd
5056                     	xref	_UART2_Init
5057                     	xref	_UART2_DeInit
5058                     	xref.b	c_lreg
5059                     	xref.b	c_x
5060                     	xref.b	c_y
5080                     	xref	c_idiv
5081                     	xref	c_lrzmp
5082                     	xref	c_lgsbc
5083                     	xref	c_ltor
5084                     	end
