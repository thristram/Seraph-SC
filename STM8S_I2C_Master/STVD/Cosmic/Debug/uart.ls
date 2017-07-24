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
1946  0009 cc04f5        	jp	L7111
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
1989  0044 cc048b        	jp	L1311
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
2007                     ; 366 				break;
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
2020  0071 cc0104        	jp	L5201
2021  0074               L65:
2022  0074 a002          	sub	a,#2
2023  0076 2603          	jrne	L06
2024  0078 cc0153        	jp	L7201
2025  007b               L06:
2026  007b 4a            	dec	a
2027  007c 2603          	jrne	L26
2028  007e cc0266        	jp	L1301
2029  0081               L26:
2030  0081 a052          	sub	a,#82
2031  0083 2603          	jrne	L46
2032  0085 cc0379        	jp	L3301
2033  0088               L46:
2034  0088 a006          	sub	a,#6
2035  008a 2603          	jrne	L66
2036  008c cc045e        	jp	L7301
2037  008f               L66:
2038  008f acf504f5      	jpf	L7111
2039  0093               L1201:
2040                     ; 254 				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
2040                     ; 255 					if(sicp_buf[7] == 0x03){
2042  0093 c6000d        	ld	a,_sicp_buf+7
2043  0096 a103          	cp	a,#3
2044  0098 2703          	jreq	L07
2045  009a cc04f5        	jp	L7111
2046  009d               L07:
2047                     ; 256 						rev_cmd_data(sicp_buf[8]);
2049  009d c6000e        	ld	a,_sicp_buf+8
2050  00a0 cd0000        	call	_rev_cmd_data
2052  00a3 acf504f5      	jpf	L7111
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
2080                     ; 270 					ret = 1;
2082  00d1 7b3b          	ld	a,(OFST+0,sp)
2083  00d3 97            	ld	xl,a
2084                     ; 271 					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2086  00d4 3b000f        	push	_sicp_buf+9
2087  00d7 3b000e        	push	_sicp_buf+8
2088  00da c6000d        	ld	a,_sicp_buf+7
2089  00dd 97            	ld	xl,a
2090  00de c6000c        	ld	a,_sicp_buf+6
2091  00e1 95            	ld	xh,a
2092  00e2 cd0000        	call	_i2c_single_action_dimmer
2094  00e5 85            	popw	x
2095  00e6 6b3b          	ld	(OFST+0,sp),a
2096                     ; 272 					if(ret == IIC_SUCCESS)	
2098  00e8 0d3b          	tnz	(OFST+0,sp)
2099  00ea 2703          	jreq	L27
2100  00ec cc04f5        	jp	L7111
2101  00ef               L27:
2102                     ; 273 						sicp_receipt_OK(0x02,rev_message_id,rev_mesh_id_H,rev_mesh_id_H);
2104  00ef 3b0088        	push	_rev_mesh_id_H
2105  00f2 3b0088        	push	_rev_mesh_id_H
2106  00f5 c60089        	ld	a,_rev_message_id
2107  00f8 97            	ld	xl,a
2108  00f9 a602          	ld	a,#2
2109  00fb 95            	ld	xh,a
2110  00fc cd0000        	call	_sicp_receipt_OK
2112  00ff 85            	popw	x
2113  0100 acf504f5      	jpf	L7111
2114  0104               L5201:
2115                     ; 276 				case 0x55://打开或关闭开关
2115                     ; 277 					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
2117  0104 c6000d        	ld	a,_sicp_buf+7
2118  0107 a4f0          	and	a,#240
2119  0109 4e            	swap	a
2120  010a a40f          	and	a,#15
2121  010c c70085        	ld	_rev_ad_mdid,a
2122                     ; 278 					rev_ad_channel = (sicp_buf[7]&0x0f);
2124  010f c6000d        	ld	a,_sicp_buf+7
2125  0112 a40f          	and	a,#15
2126  0114 c70084        	ld	_rev_ad_channel,a
2127                     ; 280 					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
2129  0117 3b000f        	push	_sicp_buf+9
2130  011a 3b000e        	push	_sicp_buf+8
2131  011d c6000d        	ld	a,_sicp_buf+7
2132  0120 97            	ld	xl,a
2133  0121 c6000c        	ld	a,_sicp_buf+6
2134  0124 95            	ld	xh,a
2135  0125 cd0000        	call	_i2c_action_plug
2137  0128 85            	popw	x
2138  0129 6b3b          	ld	(OFST+0,sp),a
2139                     ; 281 					delay(100);
2141  012b ae0064        	ldw	x,#100
2142  012e cd0000        	call	_delay
2144                     ; 282 					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
2146  0131 0d3b          	tnz	(OFST+0,sp)
2147  0133 2703          	jreq	L47
2148  0135 cc04f5        	jp	L7111
2149  0138               L47:
2152  0138 3b0085        	push	_rev_ad_mdid
2153  013b 4b02          	push	#2
2154  013d 3b008a        	push	_ns_host_meshid_L
2155  0140 3b008b        	push	_ns_host_meshid_H
2156  0143 c60089        	ld	a,_rev_message_id
2157  0146 97            	ld	xl,a
2158  0147 a605          	ld	a,#5
2159  0149 95            	ld	xh,a
2160  014a cd0000        	call	_sicp_receipt_Done
2162  014d 5b04          	addw	sp,#4
2163  014f acf504f5      	jpf	L7111
2164  0153               L7201:
2165                     ; 284 				case 0x57://一个SC下多个SLC多个通道调光
2165                     ; 285 					action_dimmer_num = sicp_buf[7];
2167  0153 c6000d        	ld	a,_sicp_buf+7
2168  0156 6b03          	ld	(OFST-56,sp),a
2169                     ; 286 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2171  0158 3b008a        	push	_ns_host_meshid_L
2172  015b 3b008b        	push	_ns_host_meshid_H
2173  015e c60089        	ld	a,_rev_message_id
2174  0161 97            	ld	xl,a
2175  0162 a602          	ld	a,#2
2176  0164 95            	ld	xh,a
2177  0165 cd0000        	call	_sicp_receipt_OK
2179  0168 85            	popw	x
2180                     ; 288 					ret = i2c_multiple_action_dimmer(action_dimmer_num);
2182  0169 7b03          	ld	a,(OFST-56,sp)
2183  016b cd0000        	call	_i2c_multiple_action_dimmer
2185  016e 6b3b          	ld	(OFST+0,sp),a
2186                     ; 289 					delay(100);
2188  0170 ae0064        	ldw	x,#100
2189  0173 cd0000        	call	_delay
2191                     ; 290 					if(ret == IIC_SUCCESS){
2193  0176 0d3b          	tnz	(OFST+0,sp)
2194  0178 2703          	jreq	L67
2195  017a cc04f5        	jp	L7111
2196  017d               L67:
2197                     ; 291 						receipt.frame_h1 = 0xEE;
2199  017d a6ee          	ld	a,#238
2200  017f 6b04          	ld	(OFST-55,sp),a
2201                     ; 292 						receipt.frame_h2 = 0xAA;
2203  0181 a6aa          	ld	a,#170
2204  0183 6b05          	ld	(OFST-54,sp),a
2205                     ; 293 						receipt.message_id = rev_message_id;
2207  0185 c60089        	ld	a,_rev_message_id
2208  0188 6b06          	ld	(OFST-53,sp),a
2209                     ; 294 						receipt.mesh_id_H = ns_host_meshid_H;
2211  018a c6008b        	ld	a,_ns_host_meshid_H
2212  018d 6b07          	ld	(OFST-52,sp),a
2213                     ; 295 						receipt.mesh_id_L = ns_host_meshid_L;
2215  018f c6008a        	ld	a,_ns_host_meshid_L
2216  0192 6b08          	ld	(OFST-51,sp),a
2217                     ; 296 						receipt.payload[0] = 0xAA;
2219  0194 a6aa          	ld	a,#170
2220  0196 6b09          	ld	(OFST-50,sp),a
2221                     ; 297 						receipt.payload[1] = 0x05;
2223  0198 a605          	ld	a,#5
2224  019a 6b0a          	ld	(OFST-49,sp),a
2225                     ; 298 						receipt.payload[2] = action_dimmer_num;
2227  019c 7b03          	ld	a,(OFST-56,sp)
2228  019e 6b0b          	ld	(OFST-48,sp),a
2229                     ; 299 						i = 0;
2231  01a0 0f3b          	clr	(OFST+0,sp)
2233  01a2 ac460246      	jpf	L3511
2234  01a6               L7411:
2235                     ; 301 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2237  01a6 7b3b          	ld	a,(OFST+0,sp)
2238  01a8 5f            	clrw	x
2239  01a9 97            	ld	xl,a
2240  01aa d6000e        	ld	a,(_sicp_buf+8,x)
2241  01ad a4f0          	and	a,#240
2242  01af 4e            	swap	a
2243  01b0 a40f          	and	a,#15
2244  01b2 c70085        	ld	_rev_ad_mdid,a
2245                     ; 302 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2247  01b5 7b3b          	ld	a,(OFST+0,sp)
2248  01b7 5f            	clrw	x
2249  01b8 97            	ld	xl,a
2250  01b9 d6000e        	ld	a,(_sicp_buf+8,x)
2251  01bc a40f          	and	a,#15
2252  01be c70084        	ld	_rev_ad_channel,a
2253                     ; 303 							receipt.payload[3+i*5] = rev_ad_mdid;
2255  01c1 96            	ldw	x,sp
2256  01c2 1c000c        	addw	x,#OFST-47
2257  01c5 1f01          	ldw	(OFST-58,sp),x
2258  01c7 7b3b          	ld	a,(OFST+0,sp)
2259  01c9 97            	ld	xl,a
2260  01ca a605          	ld	a,#5
2261  01cc 42            	mul	x,a
2262  01cd 72fb01        	addw	x,(OFST-58,sp)
2263  01d0 c60085        	ld	a,_rev_ad_mdid
2264  01d3 f7            	ld	(x),a
2265                     ; 304 							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch1_status;
2267  01d4 96            	ldw	x,sp
2268  01d5 1c000d        	addw	x,#OFST-46
2269  01d8 1f01          	ldw	(OFST-58,sp),x
2270  01da 7b3b          	ld	a,(OFST+0,sp)
2271  01dc 97            	ld	xl,a
2272  01dd a605          	ld	a,#5
2273  01df 42            	mul	x,a
2274  01e0 72fb01        	addw	x,(OFST-58,sp)
2275  01e3 89            	pushw	x
2276  01e4 c60085        	ld	a,_rev_ad_mdid
2277  01e7 97            	ld	xl,a
2278  01e8 a61a          	ld	a,#26
2279  01ea 42            	mul	x,a
2280  01eb d60263        	ld	a,(_sc+466,x)
2281  01ee 85            	popw	x
2282  01ef f7            	ld	(x),a
2283                     ; 305 							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch2_status;
2285  01f0 96            	ldw	x,sp
2286  01f1 1c000e        	addw	x,#OFST-45
2287  01f4 1f01          	ldw	(OFST-58,sp),x
2288  01f6 7b3b          	ld	a,(OFST+0,sp)
2289  01f8 97            	ld	xl,a
2290  01f9 a605          	ld	a,#5
2291  01fb 42            	mul	x,a
2292  01fc 72fb01        	addw	x,(OFST-58,sp)
2293  01ff 89            	pushw	x
2294  0200 c60085        	ld	a,_rev_ad_mdid
2295  0203 97            	ld	xl,a
2296  0204 a61a          	ld	a,#26
2297  0206 42            	mul	x,a
2298  0207 d60264        	ld	a,(_sc+467,x)
2299  020a 85            	popw	x
2300  020b f7            	ld	(x),a
2301                     ; 306 							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch3_status;
2303  020c 96            	ldw	x,sp
2304  020d 1c000f        	addw	x,#OFST-44
2305  0210 1f01          	ldw	(OFST-58,sp),x
2306  0212 7b3b          	ld	a,(OFST+0,sp)
2307  0214 97            	ld	xl,a
2308  0215 a605          	ld	a,#5
2309  0217 42            	mul	x,a
2310  0218 72fb01        	addw	x,(OFST-58,sp)
2311  021b 89            	pushw	x
2312  021c c60085        	ld	a,_rev_ad_mdid
2313  021f 97            	ld	xl,a
2314  0220 a61a          	ld	a,#26
2315  0222 42            	mul	x,a
2316  0223 d60265        	ld	a,(_sc+468,x)
2317  0226 85            	popw	x
2318  0227 f7            	ld	(x),a
2319                     ; 307 							receipt.payload[7+i*5] = sc.slc[rev_ad_mdid].ch4_status;
2321  0228 96            	ldw	x,sp
2322  0229 1c0010        	addw	x,#OFST-43
2323  022c 1f01          	ldw	(OFST-58,sp),x
2324  022e 7b3b          	ld	a,(OFST+0,sp)
2325  0230 97            	ld	xl,a
2326  0231 a605          	ld	a,#5
2327  0233 42            	mul	x,a
2328  0234 72fb01        	addw	x,(OFST-58,sp)
2329  0237 89            	pushw	x
2330  0238 c60085        	ld	a,_rev_ad_mdid
2331  023b 97            	ld	xl,a
2332  023c a61a          	ld	a,#26
2333  023e 42            	mul	x,a
2334  023f d60266        	ld	a,(_sc+469,x)
2335  0242 85            	popw	x
2336  0243 f7            	ld	(x),a
2337                     ; 309 							i++;
2339  0244 0c3b          	inc	(OFST+0,sp)
2340  0246               L3511:
2341                     ; 300 						while(action_dimmer_num--){
2343  0246 7b03          	ld	a,(OFST-56,sp)
2344  0248 0a03          	dec	(OFST-56,sp)
2345  024a 4d            	tnz	a
2346  024b 2703          	jreq	L001
2347  024d cc01a6        	jp	L7411
2348  0250               L001:
2349                     ; 311 						sicp_send_message(&receipt,8+i*5);
2351  0250 7b3b          	ld	a,(OFST+0,sp)
2352  0252 97            	ld	xl,a
2353  0253 a605          	ld	a,#5
2354  0255 42            	mul	x,a
2355  0256 9f            	ld	a,xl
2356  0257 ab08          	add	a,#8
2357  0259 88            	push	a
2358  025a 96            	ldw	x,sp
2359  025b 1c0005        	addw	x,#OFST-54
2360  025e cd0000        	call	_sicp_send_message
2362  0261 84            	pop	a
2363  0262 acf504f5      	jpf	L7111
2364  0266               L1301:
2365                     ; 314 				case 0x58://一个SC下多个SPC多个通道调光
2365                     ; 315 					action_plup_num = sicp_buf[7];
2367  0266 c6000d        	ld	a,_sicp_buf+7
2368  0269 6b03          	ld	(OFST-56,sp),a
2369                     ; 316 					sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2371  026b 3b008a        	push	_ns_host_meshid_L
2372  026e 3b008b        	push	_ns_host_meshid_H
2373  0271 c60089        	ld	a,_rev_message_id
2374  0274 97            	ld	xl,a
2375  0275 a602          	ld	a,#2
2376  0277 95            	ld	xh,a
2377  0278 cd0000        	call	_sicp_receipt_OK
2379  027b 85            	popw	x
2380                     ; 317 					ret = i2c_multiple_action_plug(action_plup_num);
2382  027c 7b03          	ld	a,(OFST-56,sp)
2383  027e cd0000        	call	_i2c_multiple_action_plug
2385  0281 6b3b          	ld	(OFST+0,sp),a
2386                     ; 319 					delay(100);
2388  0283 ae0064        	ldw	x,#100
2389  0286 cd0000        	call	_delay
2391                     ; 320 					if(ret == IIC_SUCCESS){
2393  0289 0d3b          	tnz	(OFST+0,sp)
2394  028b 2703          	jreq	L201
2395  028d cc04f5        	jp	L7111
2396  0290               L201:
2397                     ; 321 						receipt.frame_h1 = 0xEE;
2399  0290 a6ee          	ld	a,#238
2400  0292 6b04          	ld	(OFST-55,sp),a
2401                     ; 322 						receipt.frame_h2 = 0xAA;
2403  0294 a6aa          	ld	a,#170
2404  0296 6b05          	ld	(OFST-54,sp),a
2405                     ; 323 						receipt.message_id = rev_message_id;
2407  0298 c60089        	ld	a,_rev_message_id
2408  029b 6b06          	ld	(OFST-53,sp),a
2409                     ; 324 						receipt.mesh_id_H = ns_host_meshid_H;
2411  029d c6008b        	ld	a,_ns_host_meshid_H
2412  02a0 6b07          	ld	(OFST-52,sp),a
2413                     ; 325 						receipt.mesh_id_L = ns_host_meshid_L;
2415  02a2 c6008a        	ld	a,_ns_host_meshid_L
2416  02a5 6b08          	ld	(OFST-51,sp),a
2417                     ; 326 						receipt.payload[0] = 0xAA;
2419  02a7 a6aa          	ld	a,#170
2420  02a9 6b09          	ld	(OFST-50,sp),a
2421                     ; 327 						receipt.payload[1] = 0x05;
2423  02ab a605          	ld	a,#5
2424  02ad 6b0a          	ld	(OFST-49,sp),a
2425                     ; 328 						receipt.payload[2] = action_plup_num;
2427  02af 7b03          	ld	a,(OFST-56,sp)
2428  02b1 6b0b          	ld	(OFST-48,sp),a
2429                     ; 329 						i = 0;
2431  02b3 0f3b          	clr	(OFST+0,sp)
2433  02b5 ac590359      	jpf	L5611
2434  02b9               L1611:
2435                     ; 331 							rev_ad_mdid = (sicp_buf[8+i]&0xf0)>>4;
2437  02b9 7b3b          	ld	a,(OFST+0,sp)
2438  02bb 5f            	clrw	x
2439  02bc 97            	ld	xl,a
2440  02bd d6000e        	ld	a,(_sicp_buf+8,x)
2441  02c0 a4f0          	and	a,#240
2442  02c2 4e            	swap	a
2443  02c3 a40f          	and	a,#15
2444  02c5 c70085        	ld	_rev_ad_mdid,a
2445                     ; 332 							rev_ad_channel = (sicp_buf[8+i]&0x0f);
2447  02c8 7b3b          	ld	a,(OFST+0,sp)
2448  02ca 5f            	clrw	x
2449  02cb 97            	ld	xl,a
2450  02cc d6000e        	ld	a,(_sicp_buf+8,x)
2451  02cf a40f          	and	a,#15
2452  02d1 c70084        	ld	_rev_ad_channel,a
2453                     ; 333 							receipt.payload[3+i*5] = rev_ad_mdid;
2455  02d4 96            	ldw	x,sp
2456  02d5 1c000c        	addw	x,#OFST-47
2457  02d8 1f01          	ldw	(OFST-58,sp),x
2458  02da 7b3b          	ld	a,(OFST+0,sp)
2459  02dc 97            	ld	xl,a
2460  02dd a605          	ld	a,#5
2461  02df 42            	mul	x,a
2462  02e0 72fb01        	addw	x,(OFST-58,sp)
2463  02e3 c60085        	ld	a,_rev_ad_mdid
2464  02e6 f7            	ld	(x),a
2465                     ; 334 							receipt.payload[4+i*5] = sc.spc[rev_ad_mdid].ch1_status;
2467  02e7 96            	ldw	x,sp
2468  02e8 1c000d        	addw	x,#OFST-46
2469  02eb 1f01          	ldw	(OFST-58,sp),x
2470  02ed 7b3b          	ld	a,(OFST+0,sp)
2471  02ef 97            	ld	xl,a
2472  02f0 a605          	ld	a,#5
2473  02f2 42            	mul	x,a
2474  02f3 72fb01        	addw	x,(OFST-58,sp)
2475  02f6 89            	pushw	x
2476  02f7 c60085        	ld	a,_rev_ad_mdid
2477  02fa 97            	ld	xl,a
2478  02fb a61c          	ld	a,#28
2479  02fd 42            	mul	x,a
2480  02fe d600bf        	ld	a,(_sc+46,x)
2481  0301 85            	popw	x
2482  0302 f7            	ld	(x),a
2483                     ; 335 							receipt.payload[5+i*5] = sc.spc[rev_ad_mdid].ch2_status;
2485  0303 96            	ldw	x,sp
2486  0304 1c000e        	addw	x,#OFST-45
2487  0307 1f01          	ldw	(OFST-58,sp),x
2488  0309 7b3b          	ld	a,(OFST+0,sp)
2489  030b 97            	ld	xl,a
2490  030c a605          	ld	a,#5
2491  030e 42            	mul	x,a
2492  030f 72fb01        	addw	x,(OFST-58,sp)
2493  0312 89            	pushw	x
2494  0313 c60085        	ld	a,_rev_ad_mdid
2495  0316 97            	ld	xl,a
2496  0317 a61c          	ld	a,#28
2497  0319 42            	mul	x,a
2498  031a d600c0        	ld	a,(_sc+47,x)
2499  031d 85            	popw	x
2500  031e f7            	ld	(x),a
2501                     ; 336 							receipt.payload[6+i*5] = sc.spc[rev_ad_mdid].ch3_status;
2503  031f 96            	ldw	x,sp
2504  0320 1c000f        	addw	x,#OFST-44
2505  0323 1f01          	ldw	(OFST-58,sp),x
2506  0325 7b3b          	ld	a,(OFST+0,sp)
2507  0327 97            	ld	xl,a
2508  0328 a605          	ld	a,#5
2509  032a 42            	mul	x,a
2510  032b 72fb01        	addw	x,(OFST-58,sp)
2511  032e 89            	pushw	x
2512  032f c60085        	ld	a,_rev_ad_mdid
2513  0332 97            	ld	xl,a
2514  0333 a61c          	ld	a,#28
2515  0335 42            	mul	x,a
2516  0336 d600c1        	ld	a,(_sc+48,x)
2517  0339 85            	popw	x
2518  033a f7            	ld	(x),a
2519                     ; 337 							receipt.payload[7+i*5] = sc.spc[rev_ad_mdid].ch4_status;
2521  033b 96            	ldw	x,sp
2522  033c 1c0010        	addw	x,#OFST-43
2523  033f 1f01          	ldw	(OFST-58,sp),x
2524  0341 7b3b          	ld	a,(OFST+0,sp)
2525  0343 97            	ld	xl,a
2526  0344 a605          	ld	a,#5
2527  0346 42            	mul	x,a
2528  0347 72fb01        	addw	x,(OFST-58,sp)
2529  034a 89            	pushw	x
2530  034b c60085        	ld	a,_rev_ad_mdid
2531  034e 97            	ld	xl,a
2532  034f a61c          	ld	a,#28
2533  0351 42            	mul	x,a
2534  0352 d600c2        	ld	a,(_sc+49,x)
2535  0355 85            	popw	x
2536  0356 f7            	ld	(x),a
2537                     ; 338 							i++;
2539  0357 0c3b          	inc	(OFST+0,sp)
2540  0359               L5611:
2541                     ; 330 						while(action_plup_num--){
2543  0359 7b03          	ld	a,(OFST-56,sp)
2544  035b 0a03          	dec	(OFST-56,sp)
2545  035d 4d            	tnz	a
2546  035e 2703          	jreq	L401
2547  0360 cc02b9        	jp	L1611
2548  0363               L401:
2549                     ; 340 						sicp_send_message(&receipt,8+i*5);
2551  0363 7b3b          	ld	a,(OFST+0,sp)
2552  0365 97            	ld	xl,a
2553  0366 a605          	ld	a,#5
2554  0368 42            	mul	x,a
2555  0369 9f            	ld	a,xl
2556  036a ab08          	add	a,#8
2557  036c 88            	push	a
2558  036d 96            	ldw	x,sp
2559  036e 1c0005        	addw	x,#OFST-54
2560  0371 cd0000        	call	_sicp_send_message
2562  0374 84            	pop	a
2563  0375 acf504f5      	jpf	L7111
2564  0379               L3301:
2565                     ; 343 				case 0xAA:
2565                     ; 344 					if(sicp_buf[7] == 0x02)	{
2567  0379 c6000d        	ld	a,_sicp_buf+7
2568  037c a102          	cp	a,#2
2569  037e 2703          	jreq	L601
2570  0380 cc04f5        	jp	L7111
2571  0383               L601:
2572                     ; 346 						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
2574  0383 725d0089      	tnz	_rev_message_id
2575  0387 271d          	jreq	L3711
2577  0389 c60089        	ld	a,_rev_message_id
2578  038c a110          	cp	a,#16
2579  038e 2416          	jruge	L3711
2582  0390 c60089        	ld	a,_rev_message_id
2583  0393 97            	ld	xl,a
2584  0394 a61c          	ld	a,#28
2585  0396 42            	mul	x,a
2586  0397 1d001c        	subw	x,#28
2587  039a d600c5        	ld	a,(_sc+52,x)
2588  039d aa01          	or	a,#1
2589  039f d700c5        	ld	(_sc+52,x),a
2591  03a2 acf504f5      	jpf	L7111
2592  03a6               L3711:
2593                     ; 348 						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
2595  03a6 c60089        	ld	a,_rev_message_id
2596  03a9 a110          	cp	a,#16
2597  03ab 2608          	jrne	L7711
2600  03ad 721203d4      	bset	_sc+835,#1
2602  03b1 acf504f5      	jpf	L7111
2603  03b5               L7711:
2604                     ; 349 						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
2606  03b5 c60089        	ld	a,_rev_message_id
2607  03b8 a115          	cp	a,#21
2608  03ba 251d          	jrult	L3021
2610  03bc c60089        	ld	a,_rev_message_id
2611  03bf a124          	cp	a,#36
2612  03c1 2416          	jruge	L3021
2615  03c3 c60089        	ld	a,_rev_message_id
2616  03c6 97            	ld	xl,a
2617  03c7 a61a          	ld	a,#26
2618  03c9 42            	mul	x,a
2619  03ca 1d0222        	subw	x,#546
2620  03cd d60267        	ld	a,(_sc+470,x)
2621  03d0 aa02          	or	a,#2
2622  03d2 d70267        	ld	(_sc+470,x),a
2624  03d5 acf504f5      	jpf	L7111
2625  03d9               L3021:
2626                     ; 350 						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
2628  03d9 c60089        	ld	a,_rev_message_id
2629  03dc a124          	cp	a,#36
2630  03de 251d          	jrult	L7021
2632  03e0 c60089        	ld	a,_rev_message_id
2633  03e3 a133          	cp	a,#51
2634  03e5 2416          	jruge	L7021
2637  03e7 c60089        	ld	a,_rev_message_id
2638  03ea 97            	ld	xl,a
2639  03eb a61c          	ld	a,#28
2640  03ed 42            	mul	x,a
2641  03ee 1d03f0        	subw	x,#1008
2642  03f1 d600c5        	ld	a,(_sc+52,x)
2643  03f4 aa02          	or	a,#2
2644  03f6 d700c5        	ld	(_sc+52,x),a
2646  03f9 acf504f5      	jpf	L7111
2647  03fd               L7021:
2648                     ; 352 						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
2650  03fd c60089        	ld	a,_rev_message_id
2651  0400 a111          	cp	a,#17
2652  0402 2608          	jrne	L3121
2655  0404 721403d4      	bset	_sc+835,#2
2657  0408 acf504f5      	jpf	L7111
2658  040c               L3121:
2659                     ; 353 						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
2661  040c c60089        	ld	a,_rev_message_id
2662  040f a133          	cp	a,#51
2663  0411 251d          	jrult	L7121
2665  0413 c60089        	ld	a,_rev_message_id
2666  0416 a142          	cp	a,#66
2667  0418 2416          	jruge	L7121
2670  041a c60089        	ld	a,_rev_message_id
2671  041d 97            	ld	xl,a
2672  041e a61a          	ld	a,#26
2673  0420 42            	mul	x,a
2674  0421 1d052e        	subw	x,#1326
2675  0424 d60267        	ld	a,(_sc+470,x)
2676  0427 aa04          	or	a,#4
2677  0429 d70267        	ld	(_sc+470,x),a
2679  042c acf504f5      	jpf	L7111
2680  0430               L7121:
2681                     ; 354 						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
2683  0430 c60089        	ld	a,_rev_message_id
2684  0433 a142          	cp	a,#66
2685  0435 2403          	jruge	L011
2686  0437 cc04f5        	jp	L7111
2687  043a               L011:
2689  043a c60089        	ld	a,_rev_message_id
2690  043d a151          	cp	a,#81
2691  043f 2503          	jrult	L211
2692  0441 cc04f5        	jp	L7111
2693  0444               L211:
2696  0444 c60089        	ld	a,_rev_message_id
2697  0447 97            	ld	xl,a
2698  0448 a61c          	ld	a,#28
2699  044a 42            	mul	x,a
2700  044b 1d0738        	subw	x,#1848
2701  044e d600c5        	ld	a,(_sc+52,x)
2702  0451 aa04          	or	a,#4
2703  0453 d700c5        	ld	(_sc+52,x),a
2704  0456 acf504f5      	jpf	L7111
2705  045a               L5301:
2706                     ; 357 				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
2706                     ; 358 				break;
2708  045a acf504f5      	jpf	L7111
2709  045e               L7301:
2710                     ; 359 				case 0xB0://Gateway	Mesh	ID	Broadcasting
2710                     ; 360 					if(rev_message_id == 0x9E){
2712  045e c60089        	ld	a,_rev_message_id
2713  0461 a19e          	cp	a,#158
2714  0463 2703          	jreq	L411
2715  0465 cc04f5        	jp	L7111
2716  0468               L411:
2717                     ; 361 						rev_ssbroadcast = 1;
2719  0468 721403d9      	bset	_UART1Flag2_,#2
2720                     ; 362 						ns_host_meshid_H = rev_mesh_id_H;
2722  046c 550088008b    	mov	_ns_host_meshid_H,_rev_mesh_id_H
2723                     ; 363 						ns_host_meshid_L = rev_mesh_id_L;
2725  0471 550087008a    	mov	_ns_host_meshid_L,_rev_mesh_id_L
2726                     ; 364 						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
2728  0476 3b008a        	push	_ns_host_meshid_L
2729  0479 3b008b        	push	_ns_host_meshid_H
2730  047c c60089        	ld	a,_rev_message_id
2731  047f 97            	ld	xl,a
2732  0480 a602          	ld	a,#2
2733  0482 95            	ld	xh,a
2734  0483 cd0000        	call	_sicp_receipt_OK
2736  0486 85            	popw	x
2737  0487 206c          	jra	L7111
2738  0489               L5311:
2739                     ; 366 				break;
2740  0489 206a          	jra	L7111
2741  048b               L1311:
2742                     ; 369 		else if (ble_ctrl_frame){
2744  048b c603da        	ld	a,_UART1Flag1_
2745  048e a504          	bcp	a,#4
2746  0490 2763          	jreq	L7111
2747                     ; 370 			ble_ctrl_frame = 0;
2749  0492 721503da      	bres	_UART1Flag1_,#2
2750                     ; 371 			switch(sicp_buf[4]){
2752  0496 c6000a        	ld	a,_sicp_buf+4
2754                     ; 402 				break;
2755  0499 4a            	dec	a
2756  049a 2708          	jreq	L1401
2757  049c 4a            	dec	a
2758  049d 2724          	jreq	L3401
2759  049f 4a            	dec	a
2760  04a0 272d          	jreq	L5401
2761  04a2 2051          	jra	L7111
2762  04a4               L1401:
2763                     ; 372 				case 0x01://网络状态帧
2763                     ; 373 				rev_bleheartbeat = 1;
2765  04a4 721203d9      	bset	_UART1Flag2_,#1
2766                     ; 374 				ns_signal = sicp_buf[5];
2768  04a8 55000b0090    	mov	_ns_signal,_sicp_buf+5
2769                     ; 375 				ns_status = sicp_buf[6];
2771  04ad 55000c008f    	mov	_ns_status,_sicp_buf+6
2772                     ; 376 				ns_phonenum = sicp_buf[7];
2774  04b2 55000d008e    	mov	_ns_phonenum,_sicp_buf+7
2775                     ; 377 				ns_own_meshid_H = sicp_buf[8];
2777  04b7 55000e008d    	mov	_ns_own_meshid_H,_sicp_buf+8
2778                     ; 378 				ns_own_meshid_L = sicp_buf[9];
2780  04bc 55000f008c    	mov	_ns_own_meshid_L,_sicp_buf+9
2781                     ; 385 				break;
2783  04c1 2032          	jra	L7111
2784  04c3               L3401:
2785                     ; 386 			case 0x02://重置芯片，清空串口缓存，保留mesh连接
2785                     ; 387 				sys_init();
2787  04c3 cd0000        	call	_sys_init
2789                     ; 388 				clear_uart_buf();
2791  04c6 cd0000        	call	_clear_uart_buf
2793                     ; 389 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2795  04c9 725f0000      	clr	_init_slc_spc_done
2796                     ; 390 				break;
2798  04cd 2026          	jra	L7111
2799  04cf               L5401:
2800                     ; 391 			case 0x03://重置芯片和网络，退出mesh连接
2800                     ; 392 				sys_init();
2802  04cf cd0000        	call	_sys_init
2804                     ; 393 				clear_uart_buf();
2806  04d2 cd0000        	call	_clear_uart_buf
2808                     ; 394 				init_slc_spc_done = 0;//重新获取slc和spc的数据
2810  04d5 725f0000      	clr	_init_slc_spc_done
2811                     ; 395 				ns_signal = 0x00;
2813  04d9 725f0090      	clr	_ns_signal
2814                     ; 396 				ns_status = 0x00;
2816  04dd 725f008f      	clr	_ns_status
2817                     ; 397 				ns_phonenum = 0x00;
2819  04e1 725f008e      	clr	_ns_phonenum
2820                     ; 398 				ns_own_meshid_H = 0x00;
2822  04e5 725f008d      	clr	_ns_own_meshid_H
2823                     ; 399 				ns_own_meshid_L = 0x00;
2825  04e9 725f008c      	clr	_ns_own_meshid_L
2826                     ; 400 				ns_host_meshid_H = 0x80;
2828  04ed 3580008b      	mov	_ns_host_meshid_H,#128
2829                     ; 401 				ns_host_meshid_L = 0xFF;
2831  04f1 35ff008a      	mov	_ns_host_meshid_L,#255
2832                     ; 402 				break;
2834  04f5               L5321:
2835  04f5               L7111:
2836                     ; 406 }
2839  04f5 5b3b          	addw	sp,#59
2840  04f7 81            	ret
2889                     ; 409 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2889                     ; 410 {
2890                     .text:	section	.text,new
2891  0000               _sicp_send_message:
2893  0000 89            	pushw	x
2894       00000000      OFST:	set	0
2897                     ; 413 	UART2_Send_Buf[0] = tx->frame_h1;
2899  0001 f6            	ld	a,(x)
2900  0002 c7005a        	ld	_UART2_Send_Buf,a
2901                     ; 414 	UART2_Send_Buf[1] = tx->frame_h2;
2903  0005 e601          	ld	a,(1,x)
2904  0007 c7005b        	ld	_UART2_Send_Buf+1,a
2905                     ; 415 	UART2_Send_Buf[2] = tx->message_id;
2907  000a e602          	ld	a,(2,x)
2908  000c c7005c        	ld	_UART2_Send_Buf+2,a
2909                     ; 416 	UART2_Send_Buf[3] = tx->mesh_id_H;
2911  000f e603          	ld	a,(3,x)
2912  0011 c7005d        	ld	_UART2_Send_Buf+3,a
2913                     ; 417 	UART2_Send_Buf[4] = tx->mesh_id_L;
2915  0014 e604          	ld	a,(4,x)
2916  0016 c7005e        	ld	_UART2_Send_Buf+4,a
2917                     ; 418 	UART2_Send_Buf[5] = 4+payload_len;
2919  0019 7b05          	ld	a,(OFST+5,sp)
2920  001b ab04          	add	a,#4
2921  001d c7005f        	ld	_UART2_Send_Buf+5,a
2922                     ; 419 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2924  0020 7b05          	ld	a,(OFST+5,sp)
2925  0022 b703          	ld	c_lreg+3,a
2926  0024 3f02          	clr	c_lreg+2
2927  0026 3f01          	clr	c_lreg+1
2928  0028 3f00          	clr	c_lreg
2929  002a be02          	ldw	x,c_lreg+2
2930  002c 89            	pushw	x
2931  002d be00          	ldw	x,c_lreg
2932  002f 89            	pushw	x
2933  0030 1e05          	ldw	x,(OFST+5,sp)
2934  0032 1c0005        	addw	x,#5
2935  0035 89            	pushw	x
2936  0036 ae0060        	ldw	x,#_UART2_Send_Buf+6
2937  0039 cd0000        	call	_mymemcpy
2939  003c 5b06          	addw	sp,#6
2940                     ; 420 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2942  003e 7b05          	ld	a,(OFST+5,sp)
2943  0040 5f            	clrw	x
2944  0041 97            	ld	xl,a
2945  0042 89            	pushw	x
2946  0043 3b005f        	push	_UART2_Send_Buf+5
2947  0046 ae005c        	ldw	x,#_UART2_Send_Buf+2
2948  0049 cd0000        	call	_Check_Sum
2950  004c 5b01          	addw	sp,#1
2951  004e 85            	popw	x
2952  004f d70060        	ld	(_UART2_Send_Buf+6,x),a
2953                     ; 421 	Uart2_Send(UART2_Send_Buf,7+payload_len);
2955  0052 7b05          	ld	a,(OFST+5,sp)
2956  0054 5f            	clrw	x
2957  0055 97            	ld	xl,a
2958  0056 1c0007        	addw	x,#7
2959  0059 89            	pushw	x
2960  005a ae005a        	ldw	x,#_UART2_Send_Buf
2961  005d cd0000        	call	_Uart2_Send
2963  0060 85            	popw	x
2965  0061               L3621:
2966                     ; 422 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
2968  0061 725d0057      	tnz	_Uart2_Send_Done
2969  0065 27fa          	jreq	L3621
2972  0067 725f0057      	clr	_Uart2_Send_Done
2973                     ; 423 }
2976  006b 85            	popw	x
2977  006c 81            	ret
3029                     ; 429 void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
3029                     ; 430 {
3030                     .text:	section	.text,new
3031  0000               _sicp_receipt_OK:
3033  0000 5237          	subw	sp,#55
3034       00000037      OFST:	set	55
3037                     ; 432 	receipt.frame_h1 = 0xEE;
3039  0002 a6ee          	ld	a,#238
3040  0004 6b01          	ld	(OFST-54,sp),a
3041                     ; 433 	receipt.frame_h2 = 0xAA;
3043  0006 a6aa          	ld	a,#170
3044  0008 6b02          	ld	(OFST-53,sp),a
3045                     ; 434 	receipt.message_id = send_message_id;
3047  000a 9f            	ld	a,xl
3048  000b 6b03          	ld	(OFST-52,sp),a
3049                     ; 435 	receipt.mesh_id_H = ns_host_meshid_H;
3051  000d c6008b        	ld	a,_ns_host_meshid_H
3052  0010 6b04          	ld	(OFST-51,sp),a
3053                     ; 436 	receipt.mesh_id_L = ns_host_meshid_L;
3055  0012 c6008a        	ld	a,_ns_host_meshid_L
3056  0015 6b05          	ld	(OFST-50,sp),a
3057                     ; 437 	receipt.payload[0] = 0xAA;
3059  0017 a6aa          	ld	a,#170
3060  0019 6b06          	ld	(OFST-49,sp),a
3061                     ; 438 	receipt.payload[1] = type;
3063  001b 9e            	ld	a,xh
3064  001c 6b07          	ld	(OFST-48,sp),a
3065                     ; 439 	sicp_send_message(&receipt,2);
3067  001e 4b02          	push	#2
3068  0020 96            	ldw	x,sp
3069  0021 1c0002        	addw	x,#OFST-53
3070  0024 cd0000        	call	_sicp_send_message
3072  0027 84            	pop	a
3073                     ; 440 }
3076  0028 5b37          	addw	sp,#55
3077  002a 81            	ret
3151                     ; 442 void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
3151                     ; 443 {
3152                     .text:	section	.text,new
3153  0000               _sicp_receipt_Done:
3155  0000 89            	pushw	x
3156  0001 5238          	subw	sp,#56
3157       00000038      OFST:	set	56
3160                     ; 444 	u8 i = 0;
3162  0003 0f38          	clr	(OFST+0,sp)
3163                     ; 446 	receipt.frame_h1 = 0xEE;
3165  0005 a6ee          	ld	a,#238
3166  0007 6b01          	ld	(OFST-55,sp),a
3167                     ; 447 	receipt.frame_h2 = 0xAA;
3169  0009 a6aa          	ld	a,#170
3170  000b 6b02          	ld	(OFST-54,sp),a
3171                     ; 448 	receipt.message_id = send_message_id;
3173  000d 9f            	ld	a,xl
3174  000e 6b03          	ld	(OFST-53,sp),a
3175                     ; 449 	receipt.mesh_id_H = ns_host_meshid_H;
3177  0010 c6008b        	ld	a,_ns_host_meshid_H
3178  0013 6b04          	ld	(OFST-52,sp),a
3179                     ; 450 	receipt.mesh_id_L = ns_host_meshid_L;
3181  0015 c6008a        	ld	a,_ns_host_meshid_L
3182  0018 6b05          	ld	(OFST-51,sp),a
3183                     ; 451 	receipt.payload[0] = 0xAA;
3185  001a a6aa          	ld	a,#170
3186  001c 6b06          	ld	(OFST-50,sp),a
3187                     ; 452 	receipt.payload[1] = type;
3189  001e 9e            	ld	a,xh
3190  001f 6b07          	ld	(OFST-49,sp),a
3191                     ; 453 	switch(method){
3193  0021 7b3f          	ld	a,(OFST+7,sp)
3195                     ; 480 		default:
3195                     ; 481 		break;
3196  0023 4a            	dec	a
3197  0024 2707          	jreq	L1131
3198  0026 4a            	dec	a
3199  0027 2766          	jreq	L3131
3200  0029 acef00ef      	jpf	L1531
3201  002d               L1131:
3202                     ; 454 		case 0x01://action Dimmer调光的执行回执
3202                     ; 455 		receipt.payload[2] = mdid;
3204  002d 7b40          	ld	a,(OFST+8,sp)
3205  002f 6b08          	ld	(OFST-48,sp),a
3206                     ; 456 		for(i = 0;i < 15;i++){
3208  0031 0f38          	clr	(OFST+0,sp)
3209  0033               L3531:
3210                     ; 457 			if(sc.slc[i].MDID == mdid){
3212  0033 7b38          	ld	a,(OFST+0,sp)
3213  0035 97            	ld	xl,a
3214  0036 a61a          	ld	a,#26
3215  0038 42            	mul	x,a
3216  0039 7b40          	ld	a,(OFST+8,sp)
3217  003b 905f          	clrw	y
3218  003d 9097          	ld	yl,a
3219  003f 90bf00        	ldw	c_y,y
3220  0042 9093          	ldw	y,x
3221  0044 90de0261      	ldw	y,(_sc+464,y)
3222  0048 90b300        	cpw	y,c_y
3223  004b 2638          	jrne	L1631
3224                     ; 458 				receipt.payload[3] = sc.slc[i].ch1_status;
3226  004d 7b38          	ld	a,(OFST+0,sp)
3227  004f 97            	ld	xl,a
3228  0050 a61a          	ld	a,#26
3229  0052 42            	mul	x,a
3230  0053 d60263        	ld	a,(_sc+466,x)
3231  0056 6b09          	ld	(OFST-47,sp),a
3232                     ; 459 				receipt.payload[4] = sc.slc[i].ch2_status;
3234  0058 7b38          	ld	a,(OFST+0,sp)
3235  005a 97            	ld	xl,a
3236  005b a61a          	ld	a,#26
3237  005d 42            	mul	x,a
3238  005e d60264        	ld	a,(_sc+467,x)
3239  0061 6b0a          	ld	(OFST-46,sp),a
3240                     ; 460 				receipt.payload[5] = sc.slc[i].ch3_status;
3242  0063 7b38          	ld	a,(OFST+0,sp)
3243  0065 97            	ld	xl,a
3244  0066 a61a          	ld	a,#26
3245  0068 42            	mul	x,a
3246  0069 d60265        	ld	a,(_sc+468,x)
3247  006c 6b0b          	ld	(OFST-45,sp),a
3248                     ; 461 				receipt.payload[6] = sc.slc[i].ch4_status;
3250  006e 7b38          	ld	a,(OFST+0,sp)
3251  0070 97            	ld	xl,a
3252  0071 a61a          	ld	a,#26
3253  0073 42            	mul	x,a
3254  0074 d60266        	ld	a,(_sc+469,x)
3255  0077 6b0c          	ld	(OFST-44,sp),a
3256                     ; 462 				sicp_send_message(&receipt,7);
3258  0079 4b07          	push	#7
3259  007b 96            	ldw	x,sp
3260  007c 1c0002        	addw	x,#OFST-54
3261  007f cd0000        	call	_sicp_send_message
3263  0082 84            	pop	a
3264                     ; 463 				break;
3266  0083 206a          	jra	L1531
3267  0085               L1631:
3268                     ; 456 		for(i = 0;i < 15;i++){
3270  0085 0c38          	inc	(OFST+0,sp)
3273  0087 7b38          	ld	a,(OFST+0,sp)
3274  0089 a10f          	cp	a,#15
3275  008b 25a6          	jrult	L3531
3276  008d 2060          	jra	L1531
3277  008f               L3131:
3278                     ; 467 		case 0x02://action plug switch打开或关闭开关的执行回执
3278                     ; 468 		receipt.payload[2] = mdid;
3280  008f 7b40          	ld	a,(OFST+8,sp)
3281  0091 6b08          	ld	(OFST-48,sp),a
3282                     ; 469 		for(i = 0;i < 15;i++){
3284  0093 0f38          	clr	(OFST+0,sp)
3285  0095               L3631:
3286                     ; 470 			if(sc.spc[i].MDID == mdid){
3288  0095 7b38          	ld	a,(OFST+0,sp)
3289  0097 97            	ld	xl,a
3290  0098 a61c          	ld	a,#28
3291  009a 42            	mul	x,a
3292  009b 7b40          	ld	a,(OFST+8,sp)
3293  009d 905f          	clrw	y
3294  009f 9097          	ld	yl,a
3295  00a1 90bf00        	ldw	c_y,y
3296  00a4 9093          	ldw	y,x
3297  00a6 90de00bd      	ldw	y,(_sc+44,y)
3298  00aa 90b300        	cpw	y,c_y
3299  00ad 2638          	jrne	L1731
3300                     ; 471 				receipt.payload[3] = sc.spc[i].ch1_status;
3302  00af 7b38          	ld	a,(OFST+0,sp)
3303  00b1 97            	ld	xl,a
3304  00b2 a61c          	ld	a,#28
3305  00b4 42            	mul	x,a
3306  00b5 d600bf        	ld	a,(_sc+46,x)
3307  00b8 6b09          	ld	(OFST-47,sp),a
3308                     ; 472 				receipt.payload[4] = sc.spc[i].ch2_status;
3310  00ba 7b38          	ld	a,(OFST+0,sp)
3311  00bc 97            	ld	xl,a
3312  00bd a61c          	ld	a,#28
3313  00bf 42            	mul	x,a
3314  00c0 d600c0        	ld	a,(_sc+47,x)
3315  00c3 6b0a          	ld	(OFST-46,sp),a
3316                     ; 473 				receipt.payload[5] = sc.spc[i].ch3_status;
3318  00c5 7b38          	ld	a,(OFST+0,sp)
3319  00c7 97            	ld	xl,a
3320  00c8 a61c          	ld	a,#28
3321  00ca 42            	mul	x,a
3322  00cb d600c1        	ld	a,(_sc+48,x)
3323  00ce 6b0b          	ld	(OFST-45,sp),a
3324                     ; 474 				receipt.payload[6] = sc.spc[i].ch4_status;
3326  00d0 7b38          	ld	a,(OFST+0,sp)
3327  00d2 97            	ld	xl,a
3328  00d3 a61c          	ld	a,#28
3329  00d5 42            	mul	x,a
3330  00d6 d600c2        	ld	a,(_sc+49,x)
3331  00d9 6b0c          	ld	(OFST-44,sp),a
3332                     ; 475 				sicp_send_message(&receipt,7);
3334  00db 4b07          	push	#7
3335  00dd 96            	ldw	x,sp
3336  00de 1c0002        	addw	x,#OFST-54
3337  00e1 cd0000        	call	_sicp_send_message
3339  00e4 84            	pop	a
3340                     ; 476 				break;
3342  00e5 2008          	jra	L1531
3343  00e7               L1731:
3344                     ; 469 		for(i = 0;i < 15;i++){
3346  00e7 0c38          	inc	(OFST+0,sp)
3349  00e9 7b38          	ld	a,(OFST+0,sp)
3350  00eb a10f          	cp	a,#15
3351  00ed 25a6          	jrult	L3631
3352  00ef               L5131:
3353                     ; 480 		default:
3353                     ; 481 		break;
3355  00ef               L1531:
3356                     ; 483 }
3359  00ef 5b3a          	addw	sp,#58
3360  00f1 81            	ret
3414                     ; 486 void rev_cmd_data(u8 moduleid){
3415                     .text:	section	.text,new
3416  0000               _rev_cmd_data:
3418  0000 88            	push	a
3419  0001 5238          	subw	sp,#56
3420       00000038      OFST:	set	56
3423                     ; 489 	for(i = 0;i < 15;i++){
3425  0003 0f01          	clr	(OFST-55,sp)
3426  0005               L5141:
3427                     ; 490 		if(sc.slc[i].MDID == moduleid){
3429  0005 7b01          	ld	a,(OFST-55,sp)
3430  0007 97            	ld	xl,a
3431  0008 a61a          	ld	a,#26
3432  000a 42            	mul	x,a
3433  000b 7b39          	ld	a,(OFST+1,sp)
3434  000d 905f          	clrw	y
3435  000f 9097          	ld	yl,a
3436  0011 90bf00        	ldw	c_y,y
3437  0014 9093          	ldw	y,x
3438  0016 90de0261      	ldw	y,(_sc+464,y)
3439  001a 90b300        	cpw	y,c_y
3440  001d 2657          	jrne	L3241
3441                     ; 491 			cmd_data.frame_h1 = 0xEE;
3443  001f a6ee          	ld	a,#238
3444  0021 6b02          	ld	(OFST-54,sp),a
3445                     ; 492 			cmd_data.frame_h2 = 0xAA;
3447  0023 a6aa          	ld	a,#170
3448  0025 6b03          	ld	(OFST-53,sp),a
3449                     ; 493 			cmd_data.message_id = rev_message_id;
3451  0027 c60089        	ld	a,_rev_message_id
3452  002a 6b04          	ld	(OFST-52,sp),a
3453                     ; 494 			cmd_data.mesh_id_H = ns_host_meshid_H;
3455  002c c6008b        	ld	a,_ns_host_meshid_H
3456  002f 6b05          	ld	(OFST-51,sp),a
3457                     ; 495 			cmd_data.mesh_id_L = ns_host_meshid_L;
3459  0031 c6008a        	ld	a,_ns_host_meshid_L
3460  0034 6b06          	ld	(OFST-50,sp),a
3461                     ; 496 			cmd_data.payload[0] = 0x06;
3463  0036 a606          	ld	a,#6
3464  0038 6b07          	ld	(OFST-49,sp),a
3465                     ; 497 			cmd_data.payload[1] = moduleid;
3467  003a 7b39          	ld	a,(OFST+1,sp)
3468  003c 6b08          	ld	(OFST-48,sp),a
3469                     ; 498 			cmd_data.payload[2] = sc.slc[i].ch1_status;
3471  003e 7b01          	ld	a,(OFST-55,sp)
3472  0040 97            	ld	xl,a
3473  0041 a61a          	ld	a,#26
3474  0043 42            	mul	x,a
3475  0044 d60263        	ld	a,(_sc+466,x)
3476  0047 6b09          	ld	(OFST-47,sp),a
3477                     ; 499 			cmd_data.payload[3] = sc.slc[i].ch2_status;
3479  0049 7b01          	ld	a,(OFST-55,sp)
3480  004b 97            	ld	xl,a
3481  004c a61a          	ld	a,#26
3482  004e 42            	mul	x,a
3483  004f d60264        	ld	a,(_sc+467,x)
3484  0052 6b0a          	ld	(OFST-46,sp),a
3485                     ; 500 			cmd_data.payload[4] = sc.slc[i].ch3_status;
3487  0054 7b01          	ld	a,(OFST-55,sp)
3488  0056 97            	ld	xl,a
3489  0057 a61a          	ld	a,#26
3490  0059 42            	mul	x,a
3491  005a d60265        	ld	a,(_sc+468,x)
3492  005d 6b0b          	ld	(OFST-45,sp),a
3493                     ; 501 			cmd_data.payload[5] = sc.slc[i].ch4_status;
3495  005f 7b01          	ld	a,(OFST-55,sp)
3496  0061 97            	ld	xl,a
3497  0062 a61a          	ld	a,#26
3498  0064 42            	mul	x,a
3499  0065 d60266        	ld	a,(_sc+469,x)
3500  0068 6b0c          	ld	(OFST-44,sp),a
3501                     ; 502 			sicp_send_message(&cmd_data,6);
3503  006a 4b06          	push	#6
3504  006c 96            	ldw	x,sp
3505  006d 1c0003        	addw	x,#OFST-53
3506  0070 cd0000        	call	_sicp_send_message
3508  0073 84            	pop	a
3509                     ; 503 			break;
3511  0074 207c          	jra	L1241
3512  0076               L3241:
3513                     ; 505 		if(sc.spc[i].MDID == moduleid){
3515  0076 7b01          	ld	a,(OFST-55,sp)
3516  0078 97            	ld	xl,a
3517  0079 a61c          	ld	a,#28
3518  007b 42            	mul	x,a
3519  007c 7b39          	ld	a,(OFST+1,sp)
3520  007e 905f          	clrw	y
3521  0080 9097          	ld	yl,a
3522  0082 90bf00        	ldw	c_y,y
3523  0085 9093          	ldw	y,x
3524  0087 90de00bd      	ldw	y,(_sc+44,y)
3525  008b 90b300        	cpw	y,c_y
3526  008e 2657          	jrne	L5241
3527                     ; 506 			cmd_data.frame_h1 = 0xEE;
3529  0090 a6ee          	ld	a,#238
3530  0092 6b02          	ld	(OFST-54,sp),a
3531                     ; 507 			cmd_data.frame_h2 = 0xAA;
3533  0094 a6aa          	ld	a,#170
3534  0096 6b03          	ld	(OFST-53,sp),a
3535                     ; 508 			cmd_data.message_id = rev_message_id;
3537  0098 c60089        	ld	a,_rev_message_id
3538  009b 6b04          	ld	(OFST-52,sp),a
3539                     ; 509 			cmd_data.mesh_id_H = ns_host_meshid_H;
3541  009d c6008b        	ld	a,_ns_host_meshid_H
3542  00a0 6b05          	ld	(OFST-51,sp),a
3543                     ; 510 			cmd_data.mesh_id_L = ns_host_meshid_L;
3545  00a2 c6008a        	ld	a,_ns_host_meshid_L
3546  00a5 6b06          	ld	(OFST-50,sp),a
3547                     ; 511 			cmd_data.payload[0] = 0x06;
3549  00a7 a606          	ld	a,#6
3550  00a9 6b07          	ld	(OFST-49,sp),a
3551                     ; 512 			cmd_data.payload[1] = moduleid;
3553  00ab 7b39          	ld	a,(OFST+1,sp)
3554  00ad 6b08          	ld	(OFST-48,sp),a
3555                     ; 513 			cmd_data.payload[2] = sc.spc[i].ch1_status;
3557  00af 7b01          	ld	a,(OFST-55,sp)
3558  00b1 97            	ld	xl,a
3559  00b2 a61c          	ld	a,#28
3560  00b4 42            	mul	x,a
3561  00b5 d600bf        	ld	a,(_sc+46,x)
3562  00b8 6b09          	ld	(OFST-47,sp),a
3563                     ; 514 			cmd_data.payload[3] = sc.spc[i].ch2_status;
3565  00ba 7b01          	ld	a,(OFST-55,sp)
3566  00bc 97            	ld	xl,a
3567  00bd a61c          	ld	a,#28
3568  00bf 42            	mul	x,a
3569  00c0 d600c0        	ld	a,(_sc+47,x)
3570  00c3 6b0a          	ld	(OFST-46,sp),a
3571                     ; 515 			cmd_data.payload[4] = sc.spc[i].ch3_status;
3573  00c5 7b01          	ld	a,(OFST-55,sp)
3574  00c7 97            	ld	xl,a
3575  00c8 a61c          	ld	a,#28
3576  00ca 42            	mul	x,a
3577  00cb d600c1        	ld	a,(_sc+48,x)
3578  00ce 6b0b          	ld	(OFST-45,sp),a
3579                     ; 516 			cmd_data.payload[5] = sc.spc[i].ch4_status;
3581  00d0 7b01          	ld	a,(OFST-55,sp)
3582  00d2 97            	ld	xl,a
3583  00d3 a61c          	ld	a,#28
3584  00d5 42            	mul	x,a
3585  00d6 d600c2        	ld	a,(_sc+49,x)
3586  00d9 6b0c          	ld	(OFST-44,sp),a
3587                     ; 517 			sicp_send_message(&cmd_data,6);
3589  00db 4b06          	push	#6
3590  00dd 96            	ldw	x,sp
3591  00de 1c0003        	addw	x,#OFST-53
3592  00e1 cd0000        	call	_sicp_send_message
3594  00e4 84            	pop	a
3595                     ; 518 			break;
3597  00e5 200b          	jra	L1241
3598  00e7               L5241:
3599                     ; 489 	for(i = 0;i < 15;i++){
3601  00e7 0c01          	inc	(OFST-55,sp)
3604  00e9 7b01          	ld	a,(OFST-55,sp)
3605  00eb a10f          	cp	a,#15
3606  00ed 2403          	jruge	L621
3607  00ef cc0005        	jp	L5141
3608  00f2               L621:
3609  00f2               L1241:
3610                     ; 521 }
3613  00f2 5b39          	addw	sp,#57
3614  00f4 81            	ret
3617                     	switch	.data
3618  0000               L7241_eg_timeout:
3619  0000 0000          	dc.w	0
3673                     ; 524 void report_energy_consum(void){
3674                     .text:	section	.text,new
3675  0000               _report_energy_consum:
3677  0000 5238          	subw	sp,#56
3678       00000038      OFST:	set	56
3681                     ; 528 	systime_count[3]++;
3683  0002 ce0006        	ldw	x,_systime_count+6
3684  0005 1c0001        	addw	x,#1
3685  0008 cf0006        	ldw	_systime_count+6,x
3686                     ; 529 	if(systime_count[3] >= 60){
3688  000b ce0006        	ldw	x,_systime_count+6
3689  000e a3003c        	cpw	x,#60
3690  0011 2403          	jruge	L231
3691  0013 cc00a2        	jp	L3541
3692  0016               L231:
3693                     ; 530 		systime_count[3] = 0;
3695  0016 5f            	clrw	x
3696  0017 cf0006        	ldw	_systime_count+6,x
3697                     ; 531 		systime_count[4]++;
3699  001a ce0008        	ldw	x,_systime_count+8
3700  001d 1c0001        	addw	x,#1
3701  0020 cf0008        	ldw	_systime_count+8,x
3702                     ; 532 		if(systime_count[4] >= 30){
3704  0023 ce0008        	ldw	x,_systime_count+8
3705  0026 a3001e        	cpw	x,#30
3706  0029 2577          	jrult	L3541
3707                     ; 533 			systime_count[4] = 0;
3709  002b 5f            	clrw	x
3710  002c cf0008        	ldw	_systime_count+8,x
3711                     ; 534 			i2c_get_energy_consum();
3713  002f cd0000        	call	_i2c_get_energy_consum
3715                     ; 535 			for(i = 0; i < 15; i++){
3717  0032 0f01          	clr	(OFST-55,sp)
3718  0034               L7541:
3719                     ; 536 				if(sc.spc[i].MDID){//有ID说明SPC存在
3721  0034 7b01          	ld	a,(OFST-55,sp)
3722  0036 97            	ld	xl,a
3723  0037 a61c          	ld	a,#28
3724  0039 42            	mul	x,a
3725  003a d600be        	ld	a,(_sc+45,x)
3726  003d da00bd        	or	a,(_sc+44,x)
3727  0040 2758          	jreq	L5641
3728                     ; 537 				ec.frame_h1 = 0xEE;
3730  0042 a6ee          	ld	a,#238
3731  0044 6b02          	ld	(OFST-54,sp),a
3732                     ; 538 				ec.frame_h2 = 0xEE;
3734  0046 a6ee          	ld	a,#238
3735  0048 6b03          	ld	(OFST-53,sp),a
3736                     ; 539 				ec.message_id = i+1;
3738  004a 7b01          	ld	a,(OFST-55,sp)
3739  004c 4c            	inc	a
3740  004d 6b04          	ld	(OFST-52,sp),a
3741                     ; 540 				ec.mesh_id_H = ns_host_meshid_H;
3743  004f c6008b        	ld	a,_ns_host_meshid_H
3744  0052 6b05          	ld	(OFST-51,sp),a
3745                     ; 541 				ec.mesh_id_L = ns_host_meshid_L;
3747  0054 c6008a        	ld	a,_ns_host_meshid_L
3748  0057 6b06          	ld	(OFST-50,sp),a
3749                     ; 542 				ec.payload[0] = 0x2A;
3751  0059 a62a          	ld	a,#42
3752  005b 6b07          	ld	(OFST-49,sp),a
3753                     ; 543 				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3755  005d 7b01          	ld	a,(OFST-55,sp)
3756  005f 97            	ld	xl,a
3757  0060 a61c          	ld	a,#28
3758  0062 42            	mul	x,a
3759  0063 de00c3        	ldw	x,(_sc+50,x)
3760  0066 01            	rrwa	x,a
3761  0067 9f            	ld	a,xl
3762  0068 a4ff          	and	a,#255
3763  006a 97            	ld	xl,a
3764  006b 4f            	clr	a
3765  006c 02            	rlwa	x,a
3766  006d 4f            	clr	a
3767  006e 01            	rrwa	x,a
3768  006f 9f            	ld	a,xl
3769  0070 6b08          	ld	(OFST-48,sp),a
3770                     ; 544 				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3772  0072 7b01          	ld	a,(OFST-55,sp)
3773  0074 97            	ld	xl,a
3774  0075 a61c          	ld	a,#28
3775  0077 42            	mul	x,a
3776  0078 d600c4        	ld	a,(_sc+51,x)
3777  007b a4ff          	and	a,#255
3778  007d 6b09          	ld	(OFST-47,sp),a
3779                     ; 545 				ec.payload[3] =	sc.spc[i].MDID;
3781  007f 7b01          	ld	a,(OFST-55,sp)
3782  0081 97            	ld	xl,a
3783  0082 a61c          	ld	a,#28
3784  0084 42            	mul	x,a
3785  0085 d600be        	ld	a,(_sc+45,x)
3786  0088 6b0a          	ld	(OFST-46,sp),a
3787                     ; 546 				sicp_send_message(&ec,4);
3789  008a 4b04          	push	#4
3790  008c 96            	ldw	x,sp
3791  008d 1c0003        	addw	x,#OFST-53
3792  0090 cd0000        	call	_sicp_send_message
3794  0093 84            	pop	a
3795                     ; 547 				eg_timeout = 5;
3797  0094 ae0005        	ldw	x,#5
3798  0097 cf0000        	ldw	L7241_eg_timeout,x
3799  009a               L5641:
3800                     ; 535 			for(i = 0; i < 15; i++){
3802  009a 0c01          	inc	(OFST-55,sp)
3805  009c 7b01          	ld	a,(OFST-55,sp)
3806  009e a10f          	cp	a,#15
3807  00a0 2592          	jrult	L7541
3808  00a2               L3541:
3809                     ; 553 	if(eg_timeout){
3811  00a2 ce0000        	ldw	x,L7241_eg_timeout
3812  00a5 2603          	jrne	L431
3813  00a7 cc0132        	jp	L7641
3814  00aa               L431:
3815                     ; 554 		if(--eg_timeout == 0){
3817  00aa ce0000        	ldw	x,L7241_eg_timeout
3818  00ad 1d0001        	subw	x,#1
3819  00b0 cf0000        	ldw	L7241_eg_timeout,x
3820  00b3 267d          	jrne	L7641
3821                     ; 555 			for(i = 0;i < 15;i++){
3823  00b5 0f01          	clr	(OFST-55,sp)
3824  00b7               L3741:
3825                     ; 556 				if((sc.spc[i].MDID!=0) && (!sc.spc[i].flag._flag_bit.bit0)){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
3827  00b7 7b01          	ld	a,(OFST-55,sp)
3828  00b9 97            	ld	xl,a
3829  00ba a61c          	ld	a,#28
3830  00bc 42            	mul	x,a
3831  00bd d600be        	ld	a,(_sc+45,x)
3832  00c0 da00bd        	or	a,(_sc+44,x)
3833  00c3 2765          	jreq	L1051
3835  00c5 7b01          	ld	a,(OFST-55,sp)
3836  00c7 97            	ld	xl,a
3837  00c8 a61c          	ld	a,#28
3838  00ca 42            	mul	x,a
3839  00cb d600c5        	ld	a,(_sc+52,x)
3840  00ce a501          	bcp	a,#1
3841  00d0 2658          	jrne	L1051
3842                     ; 557 					ec.frame_h1 = 0xEE;
3844  00d2 a6ee          	ld	a,#238
3845  00d4 6b02          	ld	(OFST-54,sp),a
3846                     ; 558 					ec.frame_h2 = 0xEE;
3848  00d6 a6ee          	ld	a,#238
3849  00d8 6b03          	ld	(OFST-53,sp),a
3850                     ; 559 					ec.message_id = i+1;
3852  00da 7b01          	ld	a,(OFST-55,sp)
3853  00dc 4c            	inc	a
3854  00dd 6b04          	ld	(OFST-52,sp),a
3855                     ; 560 					ec.mesh_id_H = ns_host_meshid_H;
3857  00df c6008b        	ld	a,_ns_host_meshid_H
3858  00e2 6b05          	ld	(OFST-51,sp),a
3859                     ; 561 					ec.mesh_id_L = ns_host_meshid_L;
3861  00e4 c6008a        	ld	a,_ns_host_meshid_L
3862  00e7 6b06          	ld	(OFST-50,sp),a
3863                     ; 562 					ec.payload[0] = 0x2A;
3865  00e9 a62a          	ld	a,#42
3866  00eb 6b07          	ld	(OFST-49,sp),a
3867                     ; 563 					ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
3869  00ed 7b01          	ld	a,(OFST-55,sp)
3870  00ef 97            	ld	xl,a
3871  00f0 a61c          	ld	a,#28
3872  00f2 42            	mul	x,a
3873  00f3 de00c3        	ldw	x,(_sc+50,x)
3874  00f6 01            	rrwa	x,a
3875  00f7 9f            	ld	a,xl
3876  00f8 a4ff          	and	a,#255
3877  00fa 97            	ld	xl,a
3878  00fb 4f            	clr	a
3879  00fc 02            	rlwa	x,a
3880  00fd 4f            	clr	a
3881  00fe 01            	rrwa	x,a
3882  00ff 9f            	ld	a,xl
3883  0100 6b08          	ld	(OFST-48,sp),a
3884                     ; 564 					ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
3886  0102 7b01          	ld	a,(OFST-55,sp)
3887  0104 97            	ld	xl,a
3888  0105 a61c          	ld	a,#28
3889  0107 42            	mul	x,a
3890  0108 d600c4        	ld	a,(_sc+51,x)
3891  010b a4ff          	and	a,#255
3892  010d 6b09          	ld	(OFST-47,sp),a
3893                     ; 565 					ec.payload[3] =	sc.spc[i].MDID;
3895  010f 7b01          	ld	a,(OFST-55,sp)
3896  0111 97            	ld	xl,a
3897  0112 a61c          	ld	a,#28
3898  0114 42            	mul	x,a
3899  0115 d600be        	ld	a,(_sc+45,x)
3900  0118 6b0a          	ld	(OFST-46,sp),a
3901                     ; 566 					sicp_send_message(&ec,4);
3903  011a 4b04          	push	#4
3904  011c 96            	ldw	x,sp
3905  011d 1c0003        	addw	x,#OFST-53
3906  0120 cd0000        	call	_sicp_send_message
3908  0123 84            	pop	a
3909                     ; 567 					eg_timeout = 5;//每5s重发1次直到接收到回执为止
3911  0124 ae0005        	ldw	x,#5
3912  0127 cf0000        	ldw	L7241_eg_timeout,x
3913  012a               L1051:
3914                     ; 555 			for(i = 0;i < 15;i++){
3916  012a 0c01          	inc	(OFST-55,sp)
3919  012c 7b01          	ld	a,(OFST-55,sp)
3920  012e a10f          	cp	a,#15
3921  0130 2585          	jrult	L3741
3922  0132               L7641:
3923                     ; 572 }
3926  0132 5b38          	addw	sp,#56
3927  0134 81            	ret
3967                     ; 575 void send_sc_device_info(void)
3967                     ; 576 {
3968                     .text:	section	.text,new
3969  0000               _send_sc_device_info:
3971  0000 5237          	subw	sp,#55
3972       00000037      OFST:	set	55
3975                     ; 579 	di.frame_h1 = 0xEE;
3977  0002 a6ee          	ld	a,#238
3978  0004 6b01          	ld	(OFST-54,sp),a
3979                     ; 580 	di.frame_h2 = 0xEE;
3981  0006 a6ee          	ld	a,#238
3982  0008 6b02          	ld	(OFST-53,sp),a
3983                     ; 581 	di.message_id = 16;
3985  000a a610          	ld	a,#16
3986  000c 6b03          	ld	(OFST-52,sp),a
3987                     ; 582 	di.mesh_id_H = ns_host_meshid_H;
3989  000e c6008b        	ld	a,_ns_host_meshid_H
3990  0011 6b04          	ld	(OFST-51,sp),a
3991                     ; 583 	di.mesh_id_L = ns_host_meshid_L;
3993  0013 c6008a        	ld	a,_ns_host_meshid_L
3994  0016 6b05          	ld	(OFST-50,sp),a
3995                     ; 584 	di.payload[0] = 0xB1;
3997  0018 a6b1          	ld	a,#177
3998  001a 6b06          	ld	(OFST-49,sp),a
3999                     ; 585 	di.payload[1] =	sc.deviceid[0];
4001  001c c60093        	ld	a,_sc+2
4002  001f 6b07          	ld	(OFST-48,sp),a
4003                     ; 586 	di.payload[2] =	sc.deviceid[1];
4005  0021 c60094        	ld	a,_sc+3
4006  0024 6b08          	ld	(OFST-47,sp),a
4007                     ; 587 	di.payload[3] =	sc.deviceid[2];
4009  0026 c60095        	ld	a,_sc+4
4010  0029 6b09          	ld	(OFST-46,sp),a
4011                     ; 588 	di.payload[4] =	sc.deviceid[3];
4013  002b c60096        	ld	a,_sc+5
4014  002e 6b0a          	ld	(OFST-45,sp),a
4015                     ; 589 	di.payload[5] =	sc.model;
4017  0030 c60099        	ld	a,_sc+8
4018  0033 6b0b          	ld	(OFST-44,sp),a
4019                     ; 590 	di.payload[6] = sc.firmware;
4021  0035 c60097        	ld	a,_sc+6
4022  0038 6b0c          	ld	(OFST-43,sp),a
4023                     ; 591 	di.payload[7] = sc.HWTtest;
4025  003a c60098        	ld	a,_sc+7
4026  003d 6b0d          	ld	(OFST-42,sp),a
4027                     ; 592 	di.payload[8] = sc.Ndevice;
4029  003f c600a4        	ld	a,_sc+19
4030  0042 6b0e          	ld	(OFST-41,sp),a
4031                     ; 593 	sicp_send_message(&di,9);
4033  0044 4b09          	push	#9
4034  0046 96            	ldw	x,sp
4035  0047 1c0002        	addw	x,#OFST-53
4036  004a cd0000        	call	_sicp_send_message
4038  004d 84            	pop	a
4039                     ; 594 }
4042  004e 5b37          	addw	sp,#55
4043  0050 81            	ret
4090                     ; 596 void send_slc_device_info(u8 i)
4090                     ; 597 {
4091                     .text:	section	.text,new
4092  0000               _send_slc_device_info:
4094  0000 88            	push	a
4095  0001 5237          	subw	sp,#55
4096       00000037      OFST:	set	55
4099                     ; 599 	di.frame_h1 = 0xEE;
4101  0003 a6ee          	ld	a,#238
4102  0005 6b01          	ld	(OFST-54,sp),a
4103                     ; 600 	di.frame_h2 = 0xEE;
4105  0007 a6ee          	ld	a,#238
4106  0009 6b02          	ld	(OFST-53,sp),a
4107                     ; 601 	di.message_id = 21+i;
4109  000b 7b38          	ld	a,(OFST+1,sp)
4110  000d ab15          	add	a,#21
4111  000f 6b03          	ld	(OFST-52,sp),a
4112                     ; 602 	di.mesh_id_H = ns_host_meshid_H;
4114  0011 c6008b        	ld	a,_ns_host_meshid_H
4115  0014 6b04          	ld	(OFST-51,sp),a
4116                     ; 603 	di.mesh_id_L = ns_host_meshid_L;
4118  0016 c6008a        	ld	a,_ns_host_meshid_L
4119  0019 6b05          	ld	(OFST-50,sp),a
4120                     ; 604 	di.payload[0] = 0xB2;
4122  001b a6b2          	ld	a,#178
4123  001d 6b06          	ld	(OFST-49,sp),a
4124                     ; 605 	di.payload[1] =	sc.slc[i].deviceid[0];
4126  001f 7b38          	ld	a,(OFST+1,sp)
4127  0021 97            	ld	xl,a
4128  0022 a61a          	ld	a,#26
4129  0024 42            	mul	x,a
4130  0025 d60250        	ld	a,(_sc+447,x)
4131  0028 6b07          	ld	(OFST-48,sp),a
4132                     ; 606 	di.payload[2] =	sc.slc[i].deviceid[1];
4134  002a 7b38          	ld	a,(OFST+1,sp)
4135  002c 97            	ld	xl,a
4136  002d a61a          	ld	a,#26
4137  002f 42            	mul	x,a
4138  0030 d60251        	ld	a,(_sc+448,x)
4139  0033 6b08          	ld	(OFST-47,sp),a
4140                     ; 607 	di.payload[3] =	sc.slc[i].deviceid[2];
4142  0035 7b38          	ld	a,(OFST+1,sp)
4143  0037 97            	ld	xl,a
4144  0038 a61a          	ld	a,#26
4145  003a 42            	mul	x,a
4146  003b d60252        	ld	a,(_sc+449,x)
4147  003e 6b09          	ld	(OFST-46,sp),a
4148                     ; 608 	di.payload[4] =	sc.slc[i].deviceid[3];
4150  0040 7b38          	ld	a,(OFST+1,sp)
4151  0042 97            	ld	xl,a
4152  0043 a61a          	ld	a,#26
4153  0045 42            	mul	x,a
4154  0046 d60253        	ld	a,(_sc+450,x)
4155  0049 6b0a          	ld	(OFST-45,sp),a
4156                     ; 609 	di.payload[5] =	sc.slc[i].model;
4158  004b 7b38          	ld	a,(OFST+1,sp)
4159  004d 97            	ld	xl,a
4160  004e a61a          	ld	a,#26
4161  0050 42            	mul	x,a
4162  0051 d60256        	ld	a,(_sc+453,x)
4163  0054 6b0b          	ld	(OFST-44,sp),a
4164                     ; 610 	di.payload[6] = sc.slc[i].firmware;
4166  0056 7b38          	ld	a,(OFST+1,sp)
4167  0058 97            	ld	xl,a
4168  0059 a61a          	ld	a,#26
4169  005b 42            	mul	x,a
4170  005c d60254        	ld	a,(_sc+451,x)
4171  005f 6b0c          	ld	(OFST-43,sp),a
4172                     ; 611 	di.payload[7] = sc.slc[i].HWTtest;
4174  0061 7b38          	ld	a,(OFST+1,sp)
4175  0063 97            	ld	xl,a
4176  0064 a61a          	ld	a,#26
4177  0066 42            	mul	x,a
4178  0067 d60255        	ld	a,(_sc+452,x)
4179  006a 6b0d          	ld	(OFST-42,sp),a
4180                     ; 612 	di.payload[8] = sc.slc[i].MDID;
4182  006c 7b38          	ld	a,(OFST+1,sp)
4183  006e 97            	ld	xl,a
4184  006f a61a          	ld	a,#26
4185  0071 42            	mul	x,a
4186  0072 d60262        	ld	a,(_sc+465,x)
4187  0075 6b0e          	ld	(OFST-41,sp),a
4188                     ; 613 	sicp_send_message(&di,9);
4190  0077 4b09          	push	#9
4191  0079 96            	ldw	x,sp
4192  007a 1c0002        	addw	x,#OFST-53
4193  007d cd0000        	call	_sicp_send_message
4195  0080 84            	pop	a
4196                     ; 614 }
4199  0081 5b38          	addw	sp,#56
4200  0083 81            	ret
4247                     ; 616 void send_spc_device_info(u8 i)
4247                     ; 617 {
4248                     .text:	section	.text,new
4249  0000               _send_spc_device_info:
4251  0000 88            	push	a
4252  0001 5237          	subw	sp,#55
4253       00000037      OFST:	set	55
4256                     ; 619 	di.frame_h1 = 0xEE;
4258  0003 a6ee          	ld	a,#238
4259  0005 6b01          	ld	(OFST-54,sp),a
4260                     ; 620 	di.frame_h2 = 0xEE;
4262  0007 a6ee          	ld	a,#238
4263  0009 6b02          	ld	(OFST-53,sp),a
4264                     ; 621 	di.message_id = 36+i;
4266  000b 7b38          	ld	a,(OFST+1,sp)
4267  000d ab24          	add	a,#36
4268  000f 6b03          	ld	(OFST-52,sp),a
4269                     ; 622 	di.mesh_id_H = ns_host_meshid_H;
4271  0011 c6008b        	ld	a,_ns_host_meshid_H
4272  0014 6b04          	ld	(OFST-51,sp),a
4273                     ; 623 	di.mesh_id_L = ns_host_meshid_L;
4275  0016 c6008a        	ld	a,_ns_host_meshid_L
4276  0019 6b05          	ld	(OFST-50,sp),a
4277                     ; 624 	di.payload[0] = 0xB3;
4279  001b a6b3          	ld	a,#179
4280  001d 6b06          	ld	(OFST-49,sp),a
4281                     ; 625 	di.payload[1] =	sc.spc[i].deviceid[0];
4283  001f 7b38          	ld	a,(OFST+1,sp)
4284  0021 97            	ld	xl,a
4285  0022 a61c          	ld	a,#28
4286  0024 42            	mul	x,a
4287  0025 d600ac        	ld	a,(_sc+27,x)
4288  0028 6b07          	ld	(OFST-48,sp),a
4289                     ; 626 	di.payload[2] =	sc.spc[i].deviceid[1];
4291  002a 7b38          	ld	a,(OFST+1,sp)
4292  002c 97            	ld	xl,a
4293  002d a61c          	ld	a,#28
4294  002f 42            	mul	x,a
4295  0030 d600ad        	ld	a,(_sc+28,x)
4296  0033 6b08          	ld	(OFST-47,sp),a
4297                     ; 627 	di.payload[3] =	sc.spc[i].deviceid[2];
4299  0035 7b38          	ld	a,(OFST+1,sp)
4300  0037 97            	ld	xl,a
4301  0038 a61c          	ld	a,#28
4302  003a 42            	mul	x,a
4303  003b d600ae        	ld	a,(_sc+29,x)
4304  003e 6b09          	ld	(OFST-46,sp),a
4305                     ; 628 	di.payload[4] =	sc.spc[i].deviceid[3];
4307  0040 7b38          	ld	a,(OFST+1,sp)
4308  0042 97            	ld	xl,a
4309  0043 a61c          	ld	a,#28
4310  0045 42            	mul	x,a
4311  0046 d600af        	ld	a,(_sc+30,x)
4312  0049 6b0a          	ld	(OFST-45,sp),a
4313                     ; 629 	di.payload[5] =	sc.spc[i].model;
4315  004b 7b38          	ld	a,(OFST+1,sp)
4316  004d 97            	ld	xl,a
4317  004e a61c          	ld	a,#28
4318  0050 42            	mul	x,a
4319  0051 d600b2        	ld	a,(_sc+33,x)
4320  0054 6b0b          	ld	(OFST-44,sp),a
4321                     ; 630 	di.payload[6] = sc.spc[i].firmware;
4323  0056 7b38          	ld	a,(OFST+1,sp)
4324  0058 97            	ld	xl,a
4325  0059 a61c          	ld	a,#28
4326  005b 42            	mul	x,a
4327  005c d600b0        	ld	a,(_sc+31,x)
4328  005f 6b0c          	ld	(OFST-43,sp),a
4329                     ; 631 	di.payload[7] = sc.spc[i].HWTtest;
4331  0061 7b38          	ld	a,(OFST+1,sp)
4332  0063 97            	ld	xl,a
4333  0064 a61c          	ld	a,#28
4334  0066 42            	mul	x,a
4335  0067 d600b1        	ld	a,(_sc+32,x)
4336  006a 6b0d          	ld	(OFST-42,sp),a
4337                     ; 632 	di.payload[8] = sc.spc[i].MDID;
4339  006c 7b38          	ld	a,(OFST+1,sp)
4340  006e 97            	ld	xl,a
4341  006f a61c          	ld	a,#28
4342  0071 42            	mul	x,a
4343  0072 d600be        	ld	a,(_sc+45,x)
4344  0075 6b0e          	ld	(OFST-41,sp),a
4345                     ; 633 	sicp_send_message(&di,9);
4347  0077 4b09          	push	#9
4348  0079 96            	ldw	x,sp
4349  007a 1c0002        	addw	x,#OFST-53
4350  007d cd0000        	call	_sicp_send_message
4352  0080 84            	pop	a
4353                     ; 634 }
4356  0081 5b38          	addw	sp,#56
4357  0083 81            	ret
4395                     ; 636 void send_device_info(void)
4395                     ; 637 {
4396                     .text:	section	.text,new
4397  0000               _send_device_info:
4399  0000 88            	push	a
4400       00000001      OFST:	set	1
4403                     ; 640 	send_sc_device_info();
4405  0001 cd0000        	call	_send_sc_device_info
4407                     ; 641 	delay(200);
4409  0004 ae00c8        	ldw	x,#200
4410  0007 cd0000        	call	_delay
4412                     ; 643 	for(i = 0; i < 15;i++){
4414  000a 0f01          	clr	(OFST+0,sp)
4415  000c               L5751:
4416                     ; 644 		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
4418  000c 7b01          	ld	a,(OFST+0,sp)
4419  000e 97            	ld	xl,a
4420  000f a61a          	ld	a,#26
4421  0011 42            	mul	x,a
4422  0012 d60262        	ld	a,(_sc+465,x)
4423  0015 da0261        	or	a,(_sc+464,x)
4424  0018 270b          	jreq	L3061
4425                     ; 645 			send_slc_device_info(i);
4427  001a 7b01          	ld	a,(OFST+0,sp)
4428  001c cd0000        	call	_send_slc_device_info
4430                     ; 646 			delay(100);
4432  001f ae0064        	ldw	x,#100
4433  0022 cd0000        	call	_delay
4435  0025               L3061:
4436                     ; 643 	for(i = 0; i < 15;i++){
4438  0025 0c01          	inc	(OFST+0,sp)
4441  0027 7b01          	ld	a,(OFST+0,sp)
4442  0029 a10f          	cp	a,#15
4443  002b 25df          	jrult	L5751
4444                     ; 650 	for(i = 0; i < 15;i++){
4446  002d 0f01          	clr	(OFST+0,sp)
4447  002f               L5061:
4448                     ; 651 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4450  002f 7b01          	ld	a,(OFST+0,sp)
4451  0031 97            	ld	xl,a
4452  0032 a61c          	ld	a,#28
4453  0034 42            	mul	x,a
4454  0035 d600be        	ld	a,(_sc+45,x)
4455  0038 da00bd        	or	a,(_sc+44,x)
4456  003b 270b          	jreq	L3161
4457                     ; 652 			send_spc_device_info(i);
4459  003d 7b01          	ld	a,(OFST+0,sp)
4460  003f cd0000        	call	_send_spc_device_info
4462                     ; 653 			delay(100);
4464  0042 ae0064        	ldw	x,#100
4465  0045 cd0000        	call	_delay
4467  0048               L3161:
4468                     ; 650 	for(i = 0; i < 15;i++){
4470  0048 0c01          	inc	(OFST+0,sp)
4473  004a 7b01          	ld	a,(OFST+0,sp)
4474  004c a10f          	cp	a,#15
4475  004e 25df          	jrult	L5061
4476                     ; 656 	di_timeout = 5;
4478  0050 35050001      	mov	_di_timeout,#5
4479                     ; 657 }
4482  0054 84            	pop	a
4483  0055 81            	ret
4530                     ; 660 void send_malfunction(void)
4530                     ; 661 {
4531                     .text:	section	.text,new
4532  0000               _send_malfunction:
4534  0000 5238          	subw	sp,#56
4535       00000038      OFST:	set	56
4538                     ; 665 	if((sc.HWTtest & 0xC0)!=0xC0){
4540  0002 c60098        	ld	a,_sc+7
4541  0005 a4c0          	and	a,#192
4542  0007 a1c0          	cp	a,#192
4543  0009 2735          	jreq	L5361
4544                     ; 666 		mal.frame_h1 = 0xEE;
4546  000b a6ee          	ld	a,#238
4547  000d 6b02          	ld	(OFST-54,sp),a
4548                     ; 667 		mal.frame_h2 = 0xEE;
4550  000f a6ee          	ld	a,#238
4551  0011 6b03          	ld	(OFST-53,sp),a
4552                     ; 668 		mal.message_id = 17;
4554  0013 a611          	ld	a,#17
4555  0015 6b04          	ld	(OFST-52,sp),a
4556                     ; 669 		mal.mesh_id_H = ns_host_meshid_H;
4558  0017 c6008b        	ld	a,_ns_host_meshid_H
4559  001a 6b05          	ld	(OFST-51,sp),a
4560                     ; 670 		mal.mesh_id_L = ns_host_meshid_L;
4562  001c c6008a        	ld	a,_ns_host_meshid_L
4563  001f 6b06          	ld	(OFST-50,sp),a
4564                     ; 671 		mal.payload[0] = 0x0A;
4566  0021 a60a          	ld	a,#10
4567  0023 6b07          	ld	(OFST-49,sp),a
4568                     ; 672 		mal.payload[1] = 0xB1;
4570  0025 a6b1          	ld	a,#177
4571  0027 6b08          	ld	(OFST-48,sp),a
4572                     ; 673 		mal.payload[2] =	0x00;
4574  0029 0f09          	clr	(OFST-47,sp)
4575                     ; 674 		mal.payload[3] =	sc.HWTtest;
4577  002b c60098        	ld	a,_sc+7
4578  002e 6b0a          	ld	(OFST-46,sp),a
4579                     ; 675 		sicp_send_message(&mal,4);
4581  0030 4b04          	push	#4
4582  0032 96            	ldw	x,sp
4583  0033 1c0003        	addw	x,#OFST-53
4584  0036 cd0000        	call	_sicp_send_message
4586  0039 84            	pop	a
4587                     ; 676 		delay(200);
4589  003a ae00c8        	ldw	x,#200
4590  003d cd0000        	call	_delay
4592  0040               L5361:
4593                     ; 679 	for(i = 0; i < 15;i++){
4595  0040 0f01          	clr	(OFST-55,sp)
4596  0042               L7361:
4597                     ; 680 		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
4599  0042 7b01          	ld	a,(OFST-55,sp)
4600  0044 97            	ld	xl,a
4601  0045 a61a          	ld	a,#26
4602  0047 42            	mul	x,a
4603  0048 d60262        	ld	a,(_sc+465,x)
4604  004b da0261        	or	a,(_sc+464,x)
4605  004e 2755          	jreq	L5461
4607  0050 7b01          	ld	a,(OFST-55,sp)
4608  0052 97            	ld	xl,a
4609  0053 a61a          	ld	a,#26
4610  0055 42            	mul	x,a
4611  0056 d60255        	ld	a,(_sc+452,x)
4612  0059 a4c0          	and	a,#192
4613  005b a1c0          	cp	a,#192
4614  005d 2746          	jreq	L5461
4615                     ; 681 			mal.frame_h1 = 0xEE;
4617  005f a6ee          	ld	a,#238
4618  0061 6b02          	ld	(OFST-54,sp),a
4619                     ; 682 			mal.frame_h2 = 0xEE;
4621  0063 a6ee          	ld	a,#238
4622  0065 6b03          	ld	(OFST-53,sp),a
4623                     ; 683 			mal.message_id = 51+i;
4625  0067 7b01          	ld	a,(OFST-55,sp)
4626  0069 ab33          	add	a,#51
4627  006b 6b04          	ld	(OFST-52,sp),a
4628                     ; 684 			mal.mesh_id_H = ns_host_meshid_H;
4630  006d c6008b        	ld	a,_ns_host_meshid_H
4631  0070 6b05          	ld	(OFST-51,sp),a
4632                     ; 685 			mal.mesh_id_L = ns_host_meshid_L;
4634  0072 c6008a        	ld	a,_ns_host_meshid_L
4635  0075 6b06          	ld	(OFST-50,sp),a
4636                     ; 686 			mal.payload[0] = 0x0A;
4638  0077 a60a          	ld	a,#10
4639  0079 6b07          	ld	(OFST-49,sp),a
4640                     ; 687 			mal.payload[1] = 0xB2;
4642  007b a6b2          	ld	a,#178
4643  007d 6b08          	ld	(OFST-48,sp),a
4644                     ; 688 			mal.payload[2] =	sc.slc[i].MDID;
4646  007f 7b01          	ld	a,(OFST-55,sp)
4647  0081 97            	ld	xl,a
4648  0082 a61a          	ld	a,#26
4649  0084 42            	mul	x,a
4650  0085 d60262        	ld	a,(_sc+465,x)
4651  0088 6b09          	ld	(OFST-47,sp),a
4652                     ; 689 			mal.payload[3] =	sc.slc[i].HWTtest;
4654  008a 7b01          	ld	a,(OFST-55,sp)
4655  008c 97            	ld	xl,a
4656  008d a61a          	ld	a,#26
4657  008f 42            	mul	x,a
4658  0090 d60255        	ld	a,(_sc+452,x)
4659  0093 6b0a          	ld	(OFST-46,sp),a
4660                     ; 690 			sicp_send_message(&mal,4);
4662  0095 4b04          	push	#4
4663  0097 96            	ldw	x,sp
4664  0098 1c0003        	addw	x,#OFST-53
4665  009b cd0000        	call	_sicp_send_message
4667  009e 84            	pop	a
4668                     ; 691 			delay(200);
4670  009f ae00c8        	ldw	x,#200
4671  00a2 cd0000        	call	_delay
4673  00a5               L5461:
4674                     ; 679 	for(i = 0; i < 15;i++){
4676  00a5 0c01          	inc	(OFST-55,sp)
4679  00a7 7b01          	ld	a,(OFST-55,sp)
4680  00a9 a10f          	cp	a,#15
4681  00ab 2595          	jrult	L7361
4682                     ; 695 	for(i = 0; i < 15;i++){
4684  00ad 0f01          	clr	(OFST-55,sp)
4685  00af               L7461:
4686                     ; 696 		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
4688  00af 7b01          	ld	a,(OFST-55,sp)
4689  00b1 97            	ld	xl,a
4690  00b2 a61c          	ld	a,#28
4691  00b4 42            	mul	x,a
4692  00b5 d600be        	ld	a,(_sc+45,x)
4693  00b8 da00bd        	or	a,(_sc+44,x)
4694  00bb 2755          	jreq	L5561
4696  00bd 7b01          	ld	a,(OFST-55,sp)
4697  00bf 97            	ld	xl,a
4698  00c0 a61c          	ld	a,#28
4699  00c2 42            	mul	x,a
4700  00c3 d600b1        	ld	a,(_sc+32,x)
4701  00c6 a4c0          	and	a,#192
4702  00c8 a1c0          	cp	a,#192
4703  00ca 2746          	jreq	L5561
4704                     ; 697 			mal.frame_h1 = 0xEE;
4706  00cc a6ee          	ld	a,#238
4707  00ce 6b02          	ld	(OFST-54,sp),a
4708                     ; 698 			mal.frame_h2 = 0xEE;
4710  00d0 a6ee          	ld	a,#238
4711  00d2 6b03          	ld	(OFST-53,sp),a
4712                     ; 699 			mal.message_id = 66+i;
4714  00d4 7b01          	ld	a,(OFST-55,sp)
4715  00d6 ab42          	add	a,#66
4716  00d8 6b04          	ld	(OFST-52,sp),a
4717                     ; 700 			mal.mesh_id_H = ns_host_meshid_H;
4719  00da c6008b        	ld	a,_ns_host_meshid_H
4720  00dd 6b05          	ld	(OFST-51,sp),a
4721                     ; 701 			mal.mesh_id_L = ns_host_meshid_L;
4723  00df c6008a        	ld	a,_ns_host_meshid_L
4724  00e2 6b06          	ld	(OFST-50,sp),a
4725                     ; 702 			mal.payload[0] = 0x0A;
4727  00e4 a60a          	ld	a,#10
4728  00e6 6b07          	ld	(OFST-49,sp),a
4729                     ; 703 			mal.payload[1] = 0xB2;
4731  00e8 a6b2          	ld	a,#178
4732  00ea 6b08          	ld	(OFST-48,sp),a
4733                     ; 704 			mal.payload[2] =	sc.spc[i].MDID;
4735  00ec 7b01          	ld	a,(OFST-55,sp)
4736  00ee 97            	ld	xl,a
4737  00ef a61c          	ld	a,#28
4738  00f1 42            	mul	x,a
4739  00f2 d600be        	ld	a,(_sc+45,x)
4740  00f5 6b09          	ld	(OFST-47,sp),a
4741                     ; 705 			mal.payload[3] =	sc.spc[i].HWTtest;
4743  00f7 7b01          	ld	a,(OFST-55,sp)
4744  00f9 97            	ld	xl,a
4745  00fa a61c          	ld	a,#28
4746  00fc 42            	mul	x,a
4747  00fd d600b1        	ld	a,(_sc+32,x)
4748  0100 6b0a          	ld	(OFST-46,sp),a
4749                     ; 706 			sicp_send_message(&mal,4);
4751  0102 4b04          	push	#4
4752  0104 96            	ldw	x,sp
4753  0105 1c0003        	addw	x,#OFST-53
4754  0108 cd0000        	call	_sicp_send_message
4756  010b 84            	pop	a
4757                     ; 707 			delay(200);
4759  010c ae00c8        	ldw	x,#200
4760  010f cd0000        	call	_delay
4762  0112               L5561:
4763                     ; 695 	for(i = 0; i < 15;i++){
4765  0112 0c01          	inc	(OFST-55,sp)
4768  0114 7b01          	ld	a,(OFST-55,sp)
4769  0116 a10f          	cp	a,#15
4770  0118 2595          	jrult	L7461
4771                     ; 710 }
4774  011a 5b38          	addw	sp,#56
4775  011c 81            	ret
4813                     ; 713 void check_send_repeatedly(void){
4814                     .text:	section	.text,new
4815  0000               _check_send_repeatedly:
4817  0000 88            	push	a
4818       00000001      OFST:	set	1
4821                     ; 716 	if(di_timeout){
4823  0001 725d0001      	tnz	_di_timeout
4824  0005 2766          	jreq	L3761
4825                     ; 717 		if(--di_timeout == 0){
4827  0007 725a0001      	dec	_di_timeout
4828  000b 2660          	jrne	L3761
4829                     ; 718 			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
4831  000d c603d4        	ld	a,_sc+835
4832  0010 a502          	bcp	a,#2
4833  0012 2607          	jrne	L7761
4836  0014 cd0000        	call	_send_sc_device_info
4840  0017 35050001      	mov	_di_timeout,#5
4841  001b               L7761:
4842                     ; 719 			for(i = 0; i < 15; i++){
4844  001b 0f01          	clr	(OFST+0,sp)
4845  001d               L1071:
4846                     ; 720 				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
4848  001d 7b01          	ld	a,(OFST+0,sp)
4849  001f 97            	ld	xl,a
4850  0020 a61a          	ld	a,#26
4851  0022 42            	mul	x,a
4852  0023 d60262        	ld	a,(_sc+465,x)
4853  0026 da0261        	or	a,(_sc+464,x)
4854  0029 2716          	jreq	L7071
4856  002b 7b01          	ld	a,(OFST+0,sp)
4857  002d 97            	ld	xl,a
4858  002e a61a          	ld	a,#26
4859  0030 42            	mul	x,a
4860  0031 d60267        	ld	a,(_sc+470,x)
4861  0034 a502          	bcp	a,#2
4862  0036 2609          	jrne	L7071
4865  0038 7b01          	ld	a,(OFST+0,sp)
4866  003a cd0000        	call	_send_slc_device_info
4870  003d 35050001      	mov	_di_timeout,#5
4871  0041               L7071:
4872                     ; 721 				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
4874  0041 7b01          	ld	a,(OFST+0,sp)
4875  0043 97            	ld	xl,a
4876  0044 a61c          	ld	a,#28
4877  0046 42            	mul	x,a
4878  0047 d600be        	ld	a,(_sc+45,x)
4879  004a da00bd        	or	a,(_sc+44,x)
4880  004d 2716          	jreq	L1171
4882  004f 7b01          	ld	a,(OFST+0,sp)
4883  0051 97            	ld	xl,a
4884  0052 a61c          	ld	a,#28
4885  0054 42            	mul	x,a
4886  0055 d600c5        	ld	a,(_sc+52,x)
4887  0058 a502          	bcp	a,#2
4888  005a 2609          	jrne	L1171
4891  005c 7b01          	ld	a,(OFST+0,sp)
4892  005e cd0000        	call	_send_spc_device_info
4896  0061 35050001      	mov	_di_timeout,#5
4897  0065               L1171:
4898                     ; 719 			for(i = 0; i < 15; i++){
4900  0065 0c01          	inc	(OFST+0,sp)
4903  0067 7b01          	ld	a,(OFST+0,sp)
4904  0069 a10f          	cp	a,#15
4905  006b 25b0          	jrult	L1071
4906  006d               L3761:
4907                     ; 725 }
4910  006d 84            	pop	a
4911  006e 81            	ret
4924                     	xdef	_send_spc_device_info
4925                     	xdef	_send_slc_device_info
4926                     	xdef	_send_sc_device_info
4927                     	xdef	_clear_uart_buf
4928                     	xdef	_Uart2_Send
4929                     	xref	_rand
4930                     	xref	_i2c_multiple_action_plug
4931                     	xref	_i2c_multiple_action_dimmer
4932                     	xref	_i2c_action_plug
4933                     	xref	_i2c_single_action_dimmer
4934                     	xref	_i2c_get_energy_consum
4935                     	xref	_action_dimmer_ext
4936                     	xdef	_delay
4937                     	xref	_systime_count
4938                     	xref	_init_slc_spc_done
4939                     	xref	_sys_init
4940                     	xdef	_check_send_repeatedly
4941                     	xdef	_send_malfunction
4942                     	xdef	_send_device_info
4943                     	xdef	_report_energy_consum
4944                     	xdef	_rev_cmd_data
4945                     	xdef	_sicp_receipt_Done
4946                     	xdef	_sicp_receipt_OK
4947                     	xdef	_sicp_send_message
4948                     	xdef	_random
4949                     	xdef	_rev_deal
4950                     	xdef	_Check_Sum
4951                     	xdef	_rev_anaylze
4952                     	xdef	_UART2_RX_ISR
4953                     	xdef	_UART2_TX_ISR
4954                     	xdef	_Init_uart2
4955                     	xdef	_mymemcpy
4956                     	switch	.bss
4957  0000               _mal_timeout:
4958  0000 00            	ds.b	1
4959                     	xdef	_mal_timeout
4960  0001               _di_timeout:
4961  0001 00            	ds.b	1
4962                     	xdef	_di_timeout
4963  0002               _send_failed_count:
4964  0002 0000          	ds.b	2
4965                     	xdef	_send_failed_count
4966  0004               _send_fault_count:
4967  0004 0000          	ds.b	2
4968                     	xdef	_send_fault_count
4969  0006               _sicp_buf:
4970  0006 000000000000  	ds.b	40
4971                     	xdef	_sicp_buf
4972  002e               _Uart2_Rec_Cnt:
4973  002e 00            	ds.b	1
4974                     	xdef	_Uart2_Rec_Cnt
4975  002f               _Uart2_Rece_Buf:
4976  002f 000000000000  	ds.b	40
4977                     	xdef	_Uart2_Rece_Buf
4978  0057               _Uart2_Send_Done:
4979  0057 00            	ds.b	1
4980                     	xdef	_Uart2_Send_Done
4981  0058               _Uart2_Send_Cnt:
4982  0058 00            	ds.b	1
4983                     	xdef	_Uart2_Send_Cnt
4984  0059               _Uart2_Send_Length:
4985  0059 00            	ds.b	1
4986                     	xdef	_Uart2_Send_Length
4987  005a               _UART2_Send_Buf:
4988  005a 000000000000  	ds.b	40
4989                     	xdef	_UART2_Send_Buf
4990  0082               _rev_ad_mesh_id_L:
4991  0082 00            	ds.b	1
4992                     	xdef	_rev_ad_mesh_id_L
4993  0083               _rev_ad_mesh_id_H:
4994  0083 00            	ds.b	1
4995                     	xdef	_rev_ad_mesh_id_H
4996  0084               _rev_ad_channel:
4997  0084 00            	ds.b	1
4998                     	xdef	_rev_ad_channel
4999  0085               _rev_ad_mdid:
5000  0085 00            	ds.b	1
5001                     	xdef	_rev_ad_mdid
5002  0086               _rev_ad_message_id:
5003  0086 00            	ds.b	1
5004                     	xdef	_rev_ad_message_id
5005  0087               _rev_mesh_id_L:
5006  0087 00            	ds.b	1
5007                     	xdef	_rev_mesh_id_L
5008  0088               _rev_mesh_id_H:
5009  0088 00            	ds.b	1
5010                     	xdef	_rev_mesh_id_H
5011  0089               _rev_message_id:
5012  0089 00            	ds.b	1
5013                     	xdef	_rev_message_id
5014  008a               _ns_host_meshid_L:
5015  008a 00            	ds.b	1
5016                     	xdef	_ns_host_meshid_L
5017  008b               _ns_host_meshid_H:
5018  008b 00            	ds.b	1
5019                     	xdef	_ns_host_meshid_H
5020  008c               _ns_own_meshid_L:
5021  008c 00            	ds.b	1
5022                     	xdef	_ns_own_meshid_L
5023  008d               _ns_own_meshid_H:
5024  008d 00            	ds.b	1
5025                     	xdef	_ns_own_meshid_H
5026  008e               _ns_phonenum:
5027  008e 00            	ds.b	1
5028                     	xdef	_ns_phonenum
5029  008f               _ns_status:
5030  008f 00            	ds.b	1
5031                     	xdef	_ns_status
5032  0090               _ns_signal:
5033  0090 00            	ds.b	1
5034                     	xdef	_ns_signal
5035  0091               _sc:
5036  0091 000000000000  	ds.b	836
5037                     	xdef	_sc
5038  03d5               _UART1Flag6_:
5039  03d5 00            	ds.b	1
5040                     	xdef	_UART1Flag6_
5041  03d6               _UART1Flag5_:
5042  03d6 00            	ds.b	1
5043                     	xdef	_UART1Flag5_
5044  03d7               _UART1Flag4_:
5045  03d7 00            	ds.b	1
5046                     	xdef	_UART1Flag4_
5047  03d8               _UART1Flag3_:
5048  03d8 00            	ds.b	1
5049                     	xdef	_UART1Flag3_
5050  03d9               _UART1Flag2_:
5051  03d9 00            	ds.b	1
5052                     	xdef	_UART1Flag2_
5053  03da               _UART1Flag1_:
5054  03da 00            	ds.b	1
5055                     	xdef	_UART1Flag1_
5056                     	xref	_UART2_ITConfig
5057                     	xref	_UART2_Cmd
5058                     	xref	_UART2_Init
5059                     	xref	_UART2_DeInit
5060                     	xref.b	c_lreg
5061                     	xref.b	c_x
5062                     	xref.b	c_y
5082                     	xref	c_idiv
5083                     	xref	c_lrzmp
5084                     	xref	c_lgsbc
5085                     	xref	c_ltor
5086                     	end
