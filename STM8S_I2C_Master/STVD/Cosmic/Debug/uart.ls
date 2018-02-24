   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 893                     	switch	.data
 894  0000               _BIT:
 895  0000 01            	dc.b	1
 896  0001 02            	dc.b	2
 897  0002 04            	dc.b	4
 898  0003 08            	dc.b	8
 899  0004 10            	dc.b	16
 900  0005 20            	dc.b	32
 901  0006 40            	dc.b	64
 902  0007 80            	dc.b	128
 980                     ; 34 void mymemcpy(void *des,void *src,u32 n)  
 980                     ; 35 {  
 982                     .text:	section	.text,new
 983  0000               _mymemcpy:
 985  0000 89            	pushw	x
 986  0001 5204          	subw	sp,#4
 987       00000004      OFST:	set	4
 990                     ; 36   u8 *xdes=des;
 992  0003 1f01          	ldw	(OFST-3,sp),x
 993                     ; 37 	u8 *xsrc=src; 
 995  0005 1e09          	ldw	x,(OFST+5,sp)
 996  0007 1f03          	ldw	(OFST-1,sp),x
 998  0009 2016          	jra	L335
 999  000b               L725:
1000                     ; 38   while(n--)*xdes++=*xsrc++;  
1002  000b 1e03          	ldw	x,(OFST-1,sp)
1003  000d 1c0001        	addw	x,#1
1004  0010 1f03          	ldw	(OFST-1,sp),x
1005  0012 1d0001        	subw	x,#1
1006  0015 f6            	ld	a,(x)
1007  0016 1e01          	ldw	x,(OFST-3,sp)
1008  0018 1c0001        	addw	x,#1
1009  001b 1f01          	ldw	(OFST-3,sp),x
1010  001d 1d0001        	subw	x,#1
1011  0020 f7            	ld	(x),a
1012  0021               L335:
1015  0021 96            	ldw	x,sp
1016  0022 1c000b        	addw	x,#OFST+7
1017  0025 cd0000        	call	c_ltor
1019  0028 96            	ldw	x,sp
1020  0029 1c000b        	addw	x,#OFST+7
1021  002c a601          	ld	a,#1
1022  002e cd0000        	call	c_lgsbc
1024  0031 cd0000        	call	c_lrzmp
1026  0034 26d5          	jrne	L725
1027                     ; 39 }  
1030  0036 5b06          	addw	sp,#6
1031  0038 81            	ret
1077                     ; 44 void delay(u16 Count)
1077                     ; 45 {
1078                     .text:	section	.text,new
1079  0000               _delay:
1081  0000 89            	pushw	x
1082  0001 89            	pushw	x
1083       00000002      OFST:	set	2
1086  0002 2014          	jra	L165
1087  0004               L755:
1088                     ; 50 		for(i=0; i<100; i++)
1090  0004 0f01          	clr	(OFST-1,sp)
1091  0006               L565:
1092                     ; 51 		for(j=0; j<50; j++);
1094  0006 0f02          	clr	(OFST+0,sp)
1095  0008               L375:
1099  0008 0c02          	inc	(OFST+0,sp)
1102  000a 7b02          	ld	a,(OFST+0,sp)
1103  000c a132          	cp	a,#50
1104  000e 25f8          	jrult	L375
1105                     ; 50 		for(i=0; i<100; i++)
1107  0010 0c01          	inc	(OFST-1,sp)
1110  0012 7b01          	ld	a,(OFST-1,sp)
1111  0014 a164          	cp	a,#100
1112  0016 25ee          	jrult	L565
1113  0018               L165:
1114                     ; 48 	while (Count--)//Count形参控制延时次数
1116  0018 1e03          	ldw	x,(OFST+1,sp)
1117  001a 1d0001        	subw	x,#1
1118  001d 1f03          	ldw	(OFST+1,sp),x
1119  001f 1c0001        	addw	x,#1
1120  0022 a30000        	cpw	x,#0
1121  0025 26dd          	jrne	L755
1122                     ; 54 }
1125  0027 5b04          	addw	sp,#4
1126  0029 81            	ret
1173                     ; 62 u8 random(u8 xxx)  
1173                     ; 63 {  
1174                     .text:	section	.text,new
1175  0000               _random:
1177  0000 88            	push	a
1178  0001 89            	pushw	x
1179       00000002      OFST:	set	2
1182                     ; 65   for(iii=0;iii<xxx;iii++)  
1184  0002 0f02          	clr	(OFST+0,sp)
1186  0004 2011          	jra	L526
1187  0006               L126:
1188                     ; 67     value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
1190  0006 cd0000        	call	_rand
1192  0009 90ae00ff      	ldw	y,#255
1193  000d cd0000        	call	c_idiv
1195  0010 51            	exgw	x,y
1196  0011 9f            	ld	a,xl
1197  0012 4c            	inc	a
1198  0013 6b01          	ld	(OFST-1,sp),a
1199                     ; 65   for(iii=0;iii<xxx;iii++)  
1201  0015 0c02          	inc	(OFST+0,sp)
1202  0017               L526:
1205  0017 7b02          	ld	a,(OFST+0,sp)
1206  0019 1103          	cp	a,(OFST+1,sp)
1207  001b 25e9          	jrult	L126
1208                     ; 69   return value;  
1210  001d 7b01          	ld	a,(OFST-1,sp)
1213  001f 5b03          	addw	sp,#3
1214  0021 81            	ret
1217                     	switch	.data
1218  0008               L136_id:
1219  0008 00            	dc.b	0
1250                     ; 84 u8 sicp_get_message_id(void)
1250                     ; 85 {
1251                     .text:	section	.text,new
1252  0000               _sicp_get_message_id:
1256                     ; 88 	id++;
1258  0000 725c0008      	inc	L136_id
1259                     ; 90 	if(id == 0){
1261  0004 725d0008      	tnz	L136_id
1262  0008 2604          	jrne	L746
1263                     ; 91 		id = 1;
1265  000a 35010008      	mov	L136_id,#1
1266  000e               L746:
1267                     ; 94 	return id;
1269  000e c60008        	ld	a,L136_id
1272  0011 81            	ret
1275                     	switch	.data
1276  0009               L156_id:
1277  0009 00            	dc.b	0
1308                     ; 103 u8 slcspc_get_message_id(void)
1308                     ; 104 {
1309                     .text:	section	.text,new
1310  0000               _slcspc_get_message_id:
1314                     ; 107 	id++;
1316  0000 725c0009      	inc	L156_id
1317                     ; 109 	if(id == 0){
1319  0004 725d0009      	tnz	L156_id
1320  0008 2604          	jrne	L766
1321                     ; 110 		id = 1;
1323  000a 35010009      	mov	L156_id,#1
1324  000e               L766:
1325                     ; 113 	return id;
1327  000e c60009        	ld	a,L156_id
1330  0011 81            	ret
1357                     ; 123 void uart1_init(void)
1357                     ; 124 {
1358                     .text:	section	.text,new
1359  0000               _uart1_init:
1363                     ; 125 	UART1_DeInit();
1365  0000 cd0000        	call	_UART1_DeInit
1367                     ; 127 	UART1_Init((u32)57600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
1367                     ; 128 		UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
1369  0003 4b0c          	push	#12
1370  0005 4b80          	push	#128
1371  0007 4b00          	push	#0
1372  0009 4b00          	push	#0
1373  000b 4b00          	push	#0
1374  000d aee100        	ldw	x,#57600
1375  0010 89            	pushw	x
1376  0011 ae0000        	ldw	x,#0
1377  0014 89            	pushw	x
1378  0015 cd0000        	call	_UART1_Init
1380  0018 5b09          	addw	sp,#9
1381                     ; 129 	UART1_ITConfig(UART1_IT_TC, ENABLE);//发送完成中断
1383  001a 4b01          	push	#1
1384  001c ae0266        	ldw	x,#614
1385  001f cd0000        	call	_UART1_ITConfig
1387  0022 84            	pop	a
1388                     ; 130 	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//接收非空中断
1390  0023 4b01          	push	#1
1391  0025 ae0205        	ldw	x,#517
1392  0028 cd0000        	call	_UART1_ITConfig
1394  002b 84            	pop	a
1395                     ; 131 	UART1_Cmd(ENABLE);//启用uart1接口
1397  002c a601          	ld	a,#1
1398  002e cd0000        	call	_UART1_Cmd
1400                     ; 132 }
1403  0031 81            	ret
1448                     ; 138 void uart1_send(u8 *buf, u16 len)
1448                     ; 139 {
1449                     .text:	section	.text,new
1450  0000               _uart1_send:
1452  0000 89            	pushw	x
1453       00000000      OFST:	set	0
1456                     ; 140 	if(len >= UART1_SEND_LEN)	len = UART1_SEND_LEN;
1458  0001 1e05          	ldw	x,(OFST+5,sp)
1459  0003 a30028        	cpw	x,#40
1460  0006 2505          	jrult	L127
1463  0008 ae0028        	ldw	x,#40
1464  000b 1f05          	ldw	(OFST+5,sp),x
1465  000d               L127:
1466                     ; 142 	Uart2_Send_Length = len;
1468  000d 7b06          	ld	a,(OFST+6,sp)
1469  000f c700c8        	ld	_Uart2_Send_Length,a
1470                     ; 143 	Uart2_Send_Cnt = 1;
1472  0012 350100c7      	mov	_Uart2_Send_Cnt,#1
1473                     ; 144 	UART1->DR = UART2_Send_Buf[0];
1475  0016 5500c95231    	mov	21041,_UART2_Send_Buf
1476                     ; 146 }
1479  001b 85            	popw	x
1480  001c 81            	ret
1507                     ; 151 @interrupt void UART1_TX_ISR(void)
1507                     ; 152 {
1508                     .text:	section	.text,new
1509  0000               _UART1_TX_ISR:
1514                     ; 156 	UART1->SR &= ~0x40;//清除发送完成标志位
1516  0000 721d5230      	bres	21040,#6
1517                     ; 158 	if (Uart2_Send_Cnt < Uart2_Send_Length)
1519  0004 c600c7        	ld	a,_Uart2_Send_Cnt
1520  0007 c100c8        	cp	a,_Uart2_Send_Length
1521  000a 2411          	jruge	L337
1522                     ; 160 		UART1->DR = UART2_Send_Buf[Uart2_Send_Cnt];
1524  000c c600c7        	ld	a,_Uart2_Send_Cnt
1525  000f 5f            	clrw	x
1526  0010 97            	ld	xl,a
1527  0011 d600c9        	ld	a,(_UART2_Send_Buf,x)
1528  0014 c75231        	ld	21041,a
1529                     ; 161 		Uart2_Send_Cnt++;
1531  0017 725c00c7      	inc	_Uart2_Send_Cnt
1533  001b 2008          	jra	L537
1534  001d               L337:
1535                     ; 165 		Uart2_Send_Done = 1;
1537  001d 350100c6      	mov	_Uart2_Send_Done,#1
1538                     ; 166 		Uart2_Send_Cnt = 0;
1540  0021 725f00c7      	clr	_Uart2_Send_Cnt
1541  0025               L537:
1542                     ; 168 }
1545  0025 80            	iret
1596                     ; 179 @interrupt void UART1_RX_ISR(void)
1596                     ; 180 {
1597                     .text:	section	.text,new
1598  0000               _UART1_RX_ISR:
1601       00000001      OFST:	set	1
1602  0000 3b0002        	push	c_x+2
1603  0003 be00          	ldw	x,c_x
1604  0005 89            	pushw	x
1605  0006 3b0002        	push	c_y+2
1606  0009 be00          	ldw	x,c_y
1607  000b 89            	pushw	x
1608  000c 88            	push	a
1611                     ; 183 	temp = UART1->DR;
1613  000d c65231        	ld	a,21041
1614  0010 6b01          	ld	(OFST+0,sp),a
1615                     ; 184 	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
1617  0012 c6009d        	ld	a,_Uart2_Rec_Cnt
1618  0015 5f            	clrw	x
1619  0016 97            	ld	xl,a
1620  0017 7b01          	ld	a,(OFST+0,sp)
1621  0019 d7009e        	ld	(_Uart2_Rece_Buf,x),a
1622                     ; 185 	Uart2_Rec_Cnt++;
1624  001c 725c009d      	inc	_Uart2_Rec_Cnt
1625                     ; 187 	switch(Uart2_Rec_Cnt)
1627  0020 c6009d        	ld	a,_Uart2_Rec_Cnt
1629                     ; 246 			break;
1630  0023 4a            	dec	a
1631  0024 2722          	jreq	L737
1632  0026 4a            	dec	a
1633  0027 2739          	jreq	L147
1634  0029 4a            	dec	a
1635  002a 2603          	jrne	L62
1636  002c cc0148        	jp	L577
1637  002f               L62:
1638  002f 4a            	dec	a
1639  0030 2603          	jrne	L03
1640  0032 cc0148        	jp	L577
1641  0035               L03:
1642  0035 4a            	dec	a
1643  0036 2603          	jrne	L23
1644  0038 cc0148        	jp	L577
1645  003b               L23:
1646  003b               L157:
1647                     ; 204 		default:
1647                     ; 205 			//防止接收错误后溢出
1647                     ; 206 			if (Uart2_Rec_Cnt >= Uart2_Rec_Len) {
1649  003b c6009d        	ld	a,_Uart2_Rec_Cnt
1650  003e a128          	cp	a,#40
1651  0040 2543          	jrult	L3001
1652                     ; 207 				Uart2_Rec_Cnt = 0;
1654  0042 725f009d      	clr	_Uart2_Rec_Cnt
1655  0046 203d          	jra	L3001
1656  0048               L737:
1657                     ; 189 		case 1:
1657                     ; 190 			if ((temp != 0xEE) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1659  0048 7b01          	ld	a,(OFST+0,sp)
1660  004a a1ee          	cp	a,#238
1661  004c 2603          	jrne	L43
1662  004e cc0148        	jp	L577
1663  0051               L43:
1665  0051 7b01          	ld	a,(OFST+0,sp)
1666  0053 a1dd          	cp	a,#221
1667  0055 2603          	jrne	L63
1668  0057 cc0148        	jp	L577
1669  005a               L63:
1672  005a 725f009d      	clr	_Uart2_Rec_Cnt
1673  005e ac480148      	jpf	L577
1674  0062               L147:
1675                     ; 192 		case 2:
1675                     ; 193 			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
1677  0062 7b01          	ld	a,(OFST+0,sp)
1678  0064 a1ee          	cp	a,#238
1679  0066 2603          	jrne	L04
1680  0068 cc0148        	jp	L577
1681  006b               L04:
1683  006b 7b01          	ld	a,(OFST+0,sp)
1684  006d a1aa          	cp	a,#170
1685  006f 2603          	jrne	L24
1686  0071 cc0148        	jp	L577
1687  0074               L24:
1689  0074 7b01          	ld	a,(OFST+0,sp)
1690  0076 a1dd          	cp	a,#221
1691  0078 2603          	jrne	L44
1692  007a cc0148        	jp	L577
1693  007d               L44:
1696  007d 725f009d      	clr	_Uart2_Rec_Cnt
1697  0081 ac480148      	jpf	L577
1698  0085               L3001:
1699                     ; 210 			if ((Uart2_Rece_Buf[0] == 0xEE) && ((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA))){
1701  0085 c6009e        	ld	a,_Uart2_Rece_Buf
1702  0088 a1ee          	cp	a,#238
1703  008a 266a          	jrne	L5001
1705  008c c6009f        	ld	a,_Uart2_Rece_Buf+1
1706  008f a1ee          	cp	a,#238
1707  0091 2707          	jreq	L7001
1709  0093 c6009f        	ld	a,_Uart2_Rece_Buf+1
1710  0096 a1aa          	cp	a,#170
1711  0098 265c          	jrne	L5001
1712  009a               L7001:
1713                     ; 212 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2){ //接收数据完成
1715  009a 9c            	rvf
1716  009b c6009d        	ld	a,_Uart2_Rec_Cnt
1717  009e 5f            	clrw	x
1718  009f 97            	ld	xl,a
1719  00a0 c600a3        	ld	a,_Uart2_Rece_Buf+5
1720  00a3 905f          	clrw	y
1721  00a5 9097          	ld	yl,a
1722  00a7 905c          	incw	y
1723  00a9 905c          	incw	y
1724  00ab bf01          	ldw	c_x+1,x
1725  00ad 90b301        	cpw	y,c_x+1
1726  00b0 2f03          	jrslt	L64
1727  00b2 cc0148        	jp	L577
1728  00b5               L64:
1729                     ; 214 					check_sum = Check_Sum(Uart2_Rece_Buf + 2, Uart2_Rece_Buf[5]);
1731  00b5 3b00a3        	push	_Uart2_Rece_Buf+5
1732  00b8 ae00a0        	ldw	x,#_Uart2_Rece_Buf+2
1733  00bb cd0000        	call	_Check_Sum
1735  00be 5b01          	addw	sp,#1
1736  00c0 6b01          	ld	(OFST+0,sp),a
1737                     ; 216 					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2]){		//校验正确	
1739  00c2 c600a3        	ld	a,_Uart2_Rece_Buf+5
1740  00c5 5f            	clrw	x
1741  00c6 97            	ld	xl,a
1742  00c7 d600a0        	ld	a,(_Uart2_Rece_Buf+2,x)
1743  00ca 1101          	cp	a,(OFST+0,sp)
1744  00cc 2622          	jrne	L3101
1745                     ; 218 						if(sicp_rev_success == 0){
1747  00ce c6058b        	ld	a,_UART1Flag1_
1748  00d1 a501          	bcp	a,#1
1749  00d3 261b          	jrne	L3101
1750                     ; 219 							sicp_rev_success = 1;
1752  00d5 7210058b      	bset	_UART1Flag1_,#0
1753                     ; 220 							for (i = 0; i < Uart2_Rec_Cnt; i++){
1755  00d9 0f01          	clr	(OFST+0,sp)
1757  00db 200c          	jra	L3201
1758  00dd               L7101:
1759                     ; 221 								sicp_buf[i] = Uart2_Rece_Buf[i];
1761  00dd 7b01          	ld	a,(OFST+0,sp)
1762  00df 5f            	clrw	x
1763  00e0 97            	ld	xl,a
1764  00e1 d6009e        	ld	a,(_Uart2_Rece_Buf,x)
1765  00e4 d70075        	ld	(_sicp_buf,x),a
1766                     ; 220 							for (i = 0; i < Uart2_Rec_Cnt; i++){
1768  00e7 0c01          	inc	(OFST+0,sp)
1769  00e9               L3201:
1772  00e9 7b01          	ld	a,(OFST+0,sp)
1773  00eb c1009d        	cp	a,_Uart2_Rec_Cnt
1774  00ee 25ed          	jrult	L7101
1775  00f0               L3101:
1776                     ; 226 					Uart2_Rec_Cnt = 0;
1778  00f0 725f009d      	clr	_Uart2_Rec_Cnt
1779  00f4 2052          	jra	L577
1780  00f6               L5001:
1781                     ; 230 			else if((Uart2_Rece_Buf[0] == 0xDD) && (Uart2_Rece_Buf[1] == 0xDD)){		//控制指令(网络状态帧)
1783  00f6 c6009e        	ld	a,_Uart2_Rece_Buf
1784  00f9 a1dd          	cp	a,#221
1785  00fb 2647          	jrne	L1301
1787  00fd c6009f        	ld	a,_Uart2_Rece_Buf+1
1788  0100 a1dd          	cp	a,#221
1789  0102 2640          	jrne	L1301
1790                     ; 231 				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 2){ //接收数据完成					
1792  0104 9c            	rvf
1793  0105 c6009d        	ld	a,_Uart2_Rec_Cnt
1794  0108 5f            	clrw	x
1795  0109 97            	ld	xl,a
1796  010a c600a1        	ld	a,_Uart2_Rece_Buf+3
1797  010d 905f          	clrw	y
1798  010f 9097          	ld	yl,a
1799  0111 905c          	incw	y
1800  0113 905c          	incw	y
1801  0115 bf01          	ldw	c_x+1,x
1802  0117 90b301        	cpw	y,c_x+1
1803  011a 2e2c          	jrsge	L577
1804                     ; 233 					if(sicp_rev_success == 0){
1806  011c c6058b        	ld	a,_UART1Flag1_
1807  011f a501          	bcp	a,#1
1808  0121 261b          	jrne	L5301
1809                     ; 234 						sicp_rev_success = 1;
1811  0123 7210058b      	bset	_UART1Flag1_,#0
1812                     ; 235 						for (i = 0; i < Uart2_Rec_Cnt; i++){
1814  0127 0f01          	clr	(OFST+0,sp)
1816  0129 200c          	jra	L3401
1817  012b               L7301:
1818                     ; 236 							sicp_buf[i] = Uart2_Rece_Buf[i];
1820  012b 7b01          	ld	a,(OFST+0,sp)
1821  012d 5f            	clrw	x
1822  012e 97            	ld	xl,a
1823  012f d6009e        	ld	a,(_Uart2_Rece_Buf,x)
1824  0132 d70075        	ld	(_sicp_buf,x),a
1825                     ; 235 						for (i = 0; i < Uart2_Rec_Cnt; i++){
1827  0135 0c01          	inc	(OFST+0,sp)
1828  0137               L3401:
1831  0137 7b01          	ld	a,(OFST+0,sp)
1832  0139 c1009d        	cp	a,_Uart2_Rec_Cnt
1833  013c 25ed          	jrult	L7301
1834  013e               L5301:
1835                     ; 240 					Uart2_Rec_Cnt = 0;
1837  013e 725f009d      	clr	_Uart2_Rec_Cnt
1838  0142 2004          	jra	L577
1839  0144               L1301:
1840                     ; 244 				Uart2_Rec_Cnt = 0;
1842  0144 725f009d      	clr	_Uart2_Rec_Cnt
1843  0148               L577:
1844                     ; 250 	if (UART1->SR & 0x20){
1846  0148 c65230        	ld	a,21040
1847  014b a520          	bcp	a,#32
1848  014d 2707          	jreq	L1501
1849                     ; 251 		temp = UART1->DR;
1851  014f 7b01          	ld	a,(OFST+0,sp)
1852  0151 97            	ld	xl,a
1853  0152 c65231        	ld	a,21041
1854  0155 97            	ld	xl,a
1855  0156               L1501:
1856                     ; 254 }
1859  0156 84            	pop	a
1860  0157 85            	popw	x
1861  0158 bf00          	ldw	c_y,x
1862  015a 320002        	pop	c_y+2
1863  015d 85            	popw	x
1864  015e bf00          	ldw	c_x,x
1865  0160 320002        	pop	c_x+2
1866  0163 80            	iret
1893                     ; 261 void uart3_init(void)
1893                     ; 262 {
1894                     .text:	section	.text,new
1895  0000               _uart3_init:
1899                     ; 263 	UART3_DeInit();
1901  0000 cd0000        	call	_UART3_DeInit
1903                     ; 265 	UART3_Init((u32)19200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, 
1903                     ; 266 		UART3_PARITY_NO, UART3_MODE_TXRX_ENABLE);
1905  0003 4b0c          	push	#12
1906  0005 4b00          	push	#0
1907  0007 4b00          	push	#0
1908  0009 4b00          	push	#0
1909  000b ae4b00        	ldw	x,#19200
1910  000e 89            	pushw	x
1911  000f ae0000        	ldw	x,#0
1912  0012 89            	pushw	x
1913  0013 cd0000        	call	_UART3_Init
1915  0016 5b08          	addw	sp,#8
1916                     ; 267 	UART3_ITConfig(UART3_IT_TC, ENABLE);//发送完成中断
1918  0018 4b01          	push	#1
1919  001a ae0266        	ldw	x,#614
1920  001d cd0000        	call	_UART3_ITConfig
1922  0020 84            	pop	a
1923                     ; 268 	UART3_ITConfig(UART3_IT_RXNE_OR, ENABLE);//接收非空中断
1925  0021 4b01          	push	#1
1926  0023 ae0205        	ldw	x,#517
1927  0026 cd0000        	call	_UART3_ITConfig
1929  0029 84            	pop	a
1930                     ; 269 	UART3_Cmd(ENABLE);//启用uart1接口
1932  002a a601          	ld	a,#1
1933  002c cd0000        	call	_UART3_Cmd
1935                     ; 270 }
1938  002f 81            	ret
1962                     ; 276 @interrupt void UART3_TX_ISR(void)
1962                     ; 277 {
1963                     .text:	section	.text,new
1964  0000               _UART3_TX_ISR:
1969                     ; 281 	UART3->SR &= ~0x40; 	//清除发送完成标志位
1971  0000 721d5240      	bres	21056,#6
1972                     ; 283 	if (swuart_frame.txhas < swuart_frame.txlen){
1974  0004 ce001b        	ldw	x,_swuart_frame+12
1975  0007 c30019        	cpw	x,_swuart_frame+10
1976  000a 2412          	jruge	L3701
1977                     ; 285 		UART3->DR = swuart_frame.txbuf[swuart_frame.txhas];
1979  000c ce001b        	ldw	x,_swuart_frame+12
1980  000f d60047        	ld	a,(_swuart_frame+56,x)
1981  0012 c75241        	ld	21057,a
1982                     ; 286 		swuart_frame.txhas++;
1984  0015 ce001b        	ldw	x,_swuart_frame+12
1985  0018 1c0001        	addw	x,#1
1986  001b cf001b        	ldw	_swuart_frame+12,x
1987  001e               L3701:
1988                     ; 290 }
1991  001e 80            	iret
2024                     ; 301 @interrupt void UART3_RX_ISR(void)
2024                     ; 302 {
2025                     .text:	section	.text,new
2026  0000               _UART3_RX_ISR:
2029       00000001      OFST:	set	1
2030  0000 88            	push	a
2033                     ; 303 	u8 temp = 0;
2035  0001 0f01          	clr	(OFST+0,sp)
2036                     ; 305 	temp = UART3->DR;
2038  0003 c65241        	ld	a,21057
2039  0006 6b01          	ld	(OFST+0,sp),a
2040                     ; 307 	if(swuart_frame.rxtxflag == 2){		/* recv  */
2042  0008 c6000f        	ld	a,_swuart_frame
2043  000b a102          	cp	a,#2
2044  000d 2625          	jrne	L1111
2045                     ; 308 		swuart_frame.flow = 3;
2047  000f 35030010      	mov	_swuart_frame+1,#3
2048                     ; 309 		swuart_frame.rxbuf[swuart_frame.rxhas] = temp;
2050  0013 7b01          	ld	a,(OFST+0,sp)
2051  0015 ce0015        	ldw	x,_swuart_frame+6
2052  0018 d7001f        	ld	(_swuart_frame+16,x),a
2053                     ; 310 		swuart_frame.rxhas++;
2055  001b ce0015        	ldw	x,_swuart_frame+6
2056  001e 1c0001        	addw	x,#1
2057  0021 cf0015        	ldw	_swuart_frame+6,x
2058                     ; 311 		swuart_frame.rxOverWait = 0;
2060  0024 5f            	clrw	x
2061  0025 cf0017        	ldw	_swuart_frame+8,x
2062                     ; 313 		if(swuart_frame.rxhas >= UART3_RECV_LEN){
2064  0028 ce0015        	ldw	x,_swuart_frame+6
2065  002b a30028        	cpw	x,#40
2066  002e 2504          	jrult	L1111
2067                     ; 314 			swuart_frame.rxhas = 0; 		/* 重新接收 */
2069  0030 5f            	clrw	x
2070  0031 cf0015        	ldw	_swuart_frame+6,x
2071  0034               L1111:
2072                     ; 318 	if (UART3->SR & 0x20){
2074  0034 c65240        	ld	a,21056
2075  0037 a520          	bcp	a,#32
2076  0039 2705          	jreq	L5111
2077                     ; 319 		temp = UART3->DR;
2079  003b c65241        	ld	a,21057
2080  003e 6b01          	ld	(OFST+0,sp),a
2081  0040               L5111:
2082                     ; 322 }
2085  0040 84            	pop	a
2086  0041 80            	iret
2142                     ; 334 u8 Check_Sum(u8 *buf,u8 length)
2142                     ; 335 {
2143                     .text:	section	.text,new
2144  0000               _Check_Sum:
2146  0000 89            	pushw	x
2147  0001 89            	pushw	x
2148       00000002      OFST:	set	2
2151                     ; 337 	u8 result = *buf++;
2153  0002 1e03          	ldw	x,(OFST+1,sp)
2154  0004 1c0001        	addw	x,#1
2155  0007 1f03          	ldw	(OFST+1,sp),x
2156  0009 1d0001        	subw	x,#1
2157  000c f6            	ld	a,(x)
2158  000d 6b01          	ld	(OFST-1,sp),a
2159                     ; 338 	for(i = 1;i < length;i++)
2161  000f a601          	ld	a,#1
2162  0011 6b02          	ld	(OFST+0,sp),a
2164  0013 2011          	jra	L7411
2165  0015               L3411:
2166                     ; 340 		result ^= *buf++;
2168  0015 1e03          	ldw	x,(OFST+1,sp)
2169  0017 1c0001        	addw	x,#1
2170  001a 1f03          	ldw	(OFST+1,sp),x
2171  001c 1d0001        	subw	x,#1
2172  001f 7b01          	ld	a,(OFST-1,sp)
2173  0021 f8            	xor	a,	(x)
2174  0022 6b01          	ld	(OFST-1,sp),a
2175                     ; 338 	for(i = 1;i < length;i++)
2177  0024 0c02          	inc	(OFST+0,sp)
2178  0026               L7411:
2181  0026 7b02          	ld	a,(OFST+0,sp)
2182  0028 1107          	cp	a,(OFST+5,sp)
2183  002a 25e9          	jrult	L3411
2184                     ; 342 	return result;
2186  002c 7b01          	ld	a,(OFST-1,sp)
2189  002e 5b04          	addw	sp,#4
2190  0030 81            	ret
2224                     ; 345 void clear_uart_buf(void)
2224                     ; 346 {
2225                     .text:	section	.text,new
2226  0000               _clear_uart_buf:
2228  0000 88            	push	a
2229       00000001      OFST:	set	1
2232                     ; 348 	for (i = 0;i < Uart2_Rec_Len;i++){
2234  0001 0f01          	clr	(OFST+0,sp)
2235  0003               L7611:
2236                     ; 349 		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
2238  0003 7b01          	ld	a,(OFST+0,sp)
2239  0005 5f            	clrw	x
2240  0006 97            	ld	xl,a
2241  0007 724f009e      	clr	(_Uart2_Rece_Buf,x)
2242  000b 7b01          	ld	a,(OFST+0,sp)
2243  000d 5f            	clrw	x
2244  000e 97            	ld	xl,a
2245  000f 724f0075      	clr	(_sicp_buf,x)
2246                     ; 348 	for (i = 0;i < Uart2_Rec_Len;i++){
2248  0013 0c01          	inc	(OFST+0,sp)
2251  0015 7b01          	ld	a,(OFST+0,sp)
2252  0017 a128          	cp	a,#40
2253  0019 25e8          	jrult	L7611
2254                     ; 351 }
2257  001b 84            	pop	a
2258  001c 81            	ret
2300                     ; 358 void host_meshid_save(u8 meshid_h, u8 meshid_l)
2300                     ; 359 {
2301                     .text:	section	.text,new
2302  0000               _host_meshid_save:
2304  0000 89            	pushw	x
2305       00000000      OFST:	set	0
2308                     ; 361 	if((ns_host_meshid_H != meshid_h) || (ns_host_meshid_L != meshid_l)){
2310  0001 c600f5        	ld	a,_ns_host_meshid_H
2311  0004 1101          	cp	a,(OFST+1,sp)
2312  0006 2607          	jrne	L5121
2314  0008 c600f4        	ld	a,_ns_host_meshid_L
2315  000b 1102          	cp	a,(OFST+2,sp)
2316  000d 271e          	jreq	L3121
2317  000f               L5121:
2318                     ; 363 		ns_host_meshid_H = meshid_h;
2320  000f 7b01          	ld	a,(OFST+1,sp)
2321  0011 c700f5        	ld	_ns_host_meshid_H,a
2322                     ; 364 		ns_host_meshid_L = meshid_l;
2324  0014 7b02          	ld	a,(OFST+2,sp)
2325  0016 c700f4        	ld	_ns_host_meshid_L,a
2326                     ; 366 		MEEPROM_WriteByte(EEPROM_MESHID_H_ADDRESS, ns_host_meshid_H);
2328  0019 3b00f5        	push	_ns_host_meshid_H
2329  001c ae0031        	ldw	x,#49
2330  001f cd0000        	call	_MEEPROM_WriteByte
2332  0022 84            	pop	a
2333                     ; 367 		MEEPROM_WriteByte(EEPROM_MESHID_L_ADDRESS, ns_host_meshid_L);
2335  0023 3b00f4        	push	_ns_host_meshid_L
2336  0026 ae0032        	ldw	x,#50
2337  0029 cd0000        	call	_MEEPROM_WriteByte
2339  002c 84            	pop	a
2340  002d               L3121:
2341                     ; 371 }
2344  002d 85            	popw	x
2345  002e 81            	ret
2374                     ; 377 void sicp_recv_DD(void)
2374                     ; 378 {
2375                     .text:	section	.text,new
2376  0000               _sicp_recv_DD:
2380                     ; 379 	switch(sicp_buf[4]){
2382  0000 c60079        	ld	a,_sicp_buf+4
2383  0003 a101          	cp	a,#1
2384  0005 2619          	jrne	L7321
2387  0007               L7121:
2388                     ; 380 		case 0x01://网络状态帧
2388                     ; 381 			ns_signal = sicp_buf[5];
2390  0007 55007a00fa    	mov	_ns_signal,_sicp_buf+5
2391                     ; 382 			ns_status = sicp_buf[6];
2393  000c 55007b00f9    	mov	_ns_status,_sicp_buf+6
2394                     ; 383 			ns_phonenum = sicp_buf[7];
2396  0011 55007c00f8    	mov	_ns_phonenum,_sicp_buf+7
2397                     ; 384 			ns_own_meshid_H = sicp_buf[8];
2399  0016 55007d00f7    	mov	_ns_own_meshid_H,_sicp_buf+8
2400                     ; 385 			ns_own_meshid_L = sicp_buf[9];
2402  001b 55007e00f6    	mov	_ns_own_meshid_L,_sicp_buf+9
2403                     ; 387 			break;
2405  0020               L1221:
2406                     ; 388 		case 0x02:		
2406                     ; 389 
2406                     ; 390 			break;
2408  0020               L3221:
2409                     ; 391 		case 0x03:		
2409                     ; 392 
2409                     ; 393 			break;
2411  0020               L7321:
2412                     ; 398 }
2415  0020 81            	ret
2481                     ; 404 void sicp_rev_anaylze(void)
2481                     ; 405 {
2482                     .text:	section	.text,new
2483  0000               _sicp_rev_anaylze:
2485  0000 89            	pushw	x
2486       00000002      OFST:	set	2
2489                     ; 409 	if (sicp_buf[0] == 0xDD){	//Network	Status	Reporting	{
2491  0001 c60075        	ld	a,_sicp_buf
2492  0004 a1dd          	cp	a,#221
2493  0006 2603          	jrne	L3031
2494                     ; 410 		sicp_recv_DD();
2496  0008 cd0000        	call	_sicp_recv_DD
2498  000b               L3031:
2499                     ; 413 	if (sicp_buf[0] == 0xEE){
2501  000b c60075        	ld	a,_sicp_buf
2502  000e a1ee          	cp	a,#238
2503  0010 2703          	jreq	L07
2504  0012 cc01e5        	jp	L5031
2505  0015               L07:
2506                     ; 415 		cmd_led_flag = 1;
2508  0015 35010000      	mov	_cmd_led_flag,#1
2509                     ; 417 		rev_message_id 	= sicp_buf[2];
2511  0019 55007700f3    	mov	_rev_message_id,_sicp_buf+2
2512                     ; 418 		rev_mesh_id_H	= sicp_buf[3];
2514  001e 55007800f2    	mov	_rev_mesh_id_H,_sicp_buf+3
2515                     ; 419 		rev_mesh_id_L  	= sicp_buf[4];
2517  0023 55007900f1    	mov	_rev_mesh_id_L,_sicp_buf+4
2518                     ; 427 		switch(sicp_buf[6]){
2520  0028 c6007b        	ld	a,_sicp_buf+6
2522                     ; 508 			default:
2522                     ; 509 				break;
2523  002b a010          	sub	a,#16
2524  002d 272a          	jreq	L1421
2525  002f a041          	sub	a,#65
2526  0031 2738          	jreq	L3421
2527  0033 a004          	sub	a,#4
2528  0035 2603          	jrne	L27
2529  0037 cc00c6        	jp	L5421
2530  003a               L27:
2531  003a a002          	sub	a,#2
2532  003c 2603          	jrne	L47
2533  003e cc0137        	jp	L7421
2534  0041               L47:
2535  0041 4a            	dec	a
2536  0042 2603          	jrne	L67
2537  0044 cc0162        	jp	L1521
2538  0047               L67:
2539  0047 a052          	sub	a,#82
2540  0049 2603          	jrne	L001
2541  004b cc019c        	jp	L3521
2542  004e               L001:
2543  004e a006          	sub	a,#6
2544  0050 2603          	jrne	L201
2545  0052 cc01a6        	jp	L7521
2546  0055               L201:
2547  0055 ace501e5      	jpf	L5031
2548  0059               L1421:
2549                     ; 428 			case 0x10:		//heartbeat获取当前设备状态信息(灯亮度，开关等)
2549                     ; 429 				if(sicp_buf[7] == 0x02){
2551  0059 c6007c        	ld	a,_sicp_buf+7
2552  005c a102          	cp	a,#2
2553  005e 2703          	jreq	L401
2554  0060 cc01e5        	jp	L5031
2555  0063               L401:
2556                     ; 430 					sicp_heart_beat(SICP_RECV);
2558  0063 4f            	clr	a
2559  0064 cd0000        	call	_sicp_heart_beat
2561  0067 ace501e5      	jpf	L5031
2562  006b               L3421:
2563                     ; 433 			case 0x51:	//一个SC下单个SLC多个通道调光
2563                     ; 434 //			case 0x52:
2563                     ; 435 //			case 0x53:
2563                     ; 436 //			case 0x54:				
2563                     ; 437 				mdid = sicp_buf[7] >> 4;
2565  006b c6007c        	ld	a,_sicp_buf+7
2566  006e 4e            	swap	a
2567  006f a40f          	and	a,#15
2568  0071 6b01          	ld	(OFST-1,sp),a
2569                     ; 438 				ret = slcspc_single_action_dimmer(sicp_buf[6], sicp_buf[7], sicp_buf[8], sicp_buf[9]);
2571  0073 3b007e        	push	_sicp_buf+9
2572  0076 3b007d        	push	_sicp_buf+8
2573  0079 c6007c        	ld	a,_sicp_buf+7
2574  007c 97            	ld	xl,a
2575  007d c6007b        	ld	a,_sicp_buf+6
2576  0080 95            	ld	xh,a
2577  0081 cd0000        	call	_slcspc_single_action_dimmer
2579  0084 85            	popw	x
2580  0085 6b02          	ld	(OFST+0,sp),a
2581                     ; 439 				if(ret == 0){		
2583  0087 0d02          	tnz	(OFST+0,sp)
2584  0089 2626          	jrne	L5131
2585                     ; 440 					sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
2587  008b 3b00f1        	push	_rev_mesh_id_L
2588  008e 3b00f2        	push	_rev_mesh_id_H
2589  0091 c600f3        	ld	a,_rev_message_id
2590  0094 97            	ld	xl,a
2591  0095 a602          	ld	a,#2
2592  0097 95            	ld	xh,a
2593  0098 cd0000        	call	_sicp_receipt
2595  009b 85            	popw	x
2596                     ; 443 					sc.slc[mdid -1].singleDimmer = sicp_buf[9] + SLC_DIMMER_DELAY_TIME;
2598  009c 7b01          	ld	a,(OFST-1,sp)
2599  009e 97            	ld	xl,a
2600  009f a624          	ld	a,#36
2601  00a1 42            	mul	x,a
2602  00a2 1d0024        	subw	x,#36
2603  00a5 c6007e        	ld	a,_sicp_buf+9
2604  00a8 ab0a          	add	a,#10
2605  00aa d70389        	ld	(_sc+654,x),a
2607  00ad ace501e5      	jpf	L5031
2608  00b1               L5131:
2609                     ; 446 					sicp_receipt(0x03, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
2611  00b1 3b00f1        	push	_rev_mesh_id_L
2612  00b4 3b00f2        	push	_rev_mesh_id_H
2613  00b7 c600f3        	ld	a,_rev_message_id
2614  00ba 97            	ld	xl,a
2615  00bb a603          	ld	a,#3
2616  00bd 95            	ld	xh,a
2617  00be cd0000        	call	_sicp_receipt
2619  00c1 85            	popw	x
2620  00c2 ace501e5      	jpf	L5031
2621  00c6               L5421:
2622                     ; 450 			case 0x55:	//打开或关闭开关	
2622                     ; 451 				mdid = sicp_buf[7] >> 4;
2624  00c6 c6007c        	ld	a,_sicp_buf+7
2625  00c9 4e            	swap	a
2626  00ca a40f          	and	a,#15
2627  00cc 6b01          	ld	(OFST-1,sp),a
2628                     ; 452 				ret = slcspc_action_plug(sicp_buf[6], sicp_buf[7], sicp_buf[8], sicp_buf[9]);				
2630  00ce 3b007e        	push	_sicp_buf+9
2631  00d1 3b007d        	push	_sicp_buf+8
2632  00d4 c6007c        	ld	a,_sicp_buf+7
2633  00d7 97            	ld	xl,a
2634  00d8 c6007b        	ld	a,_sicp_buf+6
2635  00db 95            	ld	xh,a
2636  00dc cd0000        	call	_slcspc_action_plug
2638  00df 85            	popw	x
2639  00e0 6b02          	ld	(OFST+0,sp),a
2640                     ; 453 				if(ret == 0) {
2642  00e2 0d02          	tnz	(OFST+0,sp)
2643  00e4 263c          	jrne	L1231
2644                     ; 454 					sicp_receipt_Done(0x05, rev_message_id, rev_mesh_id_H, rev_mesh_id_L, 0x02, mdid);
2646  00e6 7b01          	ld	a,(OFST-1,sp)
2647  00e8 88            	push	a
2648  00e9 4b02          	push	#2
2649  00eb 3b00f1        	push	_rev_mesh_id_L
2650  00ee 3b00f2        	push	_rev_mesh_id_H
2651  00f1 c600f3        	ld	a,_rev_message_id
2652  00f4 97            	ld	xl,a
2653  00f5 a605          	ld	a,#5
2654  00f7 95            	ld	xh,a
2655  00f8 cd0000        	call	_sicp_receipt_Done
2657  00fb 5b04          	addw	sp,#4
2658                     ; 456 					if((rev_mesh_id_H != ns_host_meshid_H) || (rev_mesh_id_L != ns_host_meshid_L)){
2660  00fd c600f2        	ld	a,_rev_mesh_id_H
2661  0100 c100f5        	cp	a,_ns_host_meshid_H
2662  0103 260b          	jrne	L5231
2664  0105 c600f1        	ld	a,_rev_mesh_id_L
2665  0108 c100f4        	cp	a,_ns_host_meshid_L
2666  010b 2603          	jrne	L601
2667  010d cc01e5        	jp	L5031
2668  0110               L601:
2669  0110               L5231:
2670                     ; 458 						sc.spc[mdid -1].syncTimes = SPC_SYNC_DELAY_TIME;
2672  0110 7b01          	ld	a,(OFST-1,sp)
2673  0112 97            	ld	xl,a
2674  0113 a627          	ld	a,#39
2675  0115 42            	mul	x,a
2676  0116 1d0027        	subw	x,#39
2677  0119 a60a          	ld	a,#10
2678  011b d70143        	ld	(_sc+72,x),a
2679  011e ace501e5      	jpf	L5031
2680  0122               L1231:
2681                     ; 461 					sicp_receipt(0x03, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
2683  0122 3b00f1        	push	_rev_mesh_id_L
2684  0125 3b00f2        	push	_rev_mesh_id_H
2685  0128 c600f3        	ld	a,_rev_message_id
2686  012b 97            	ld	xl,a
2687  012c a603          	ld	a,#3
2688  012e 95            	ld	xh,a
2689  012f cd0000        	call	_sicp_receipt
2691  0132 85            	popw	x
2692  0133 ace501e5      	jpf	L5031
2693  0137               L7421:
2694                     ; 465 			case 0x57:	//一个SC下多个SLC多个通道调光
2694                     ; 466 				num = sicp_buf[7];
2696  0137 c6007c        	ld	a,_sicp_buf+7
2697  013a 6b02          	ld	(OFST+0,sp),a
2698                     ; 467 				sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
2700  013c 3b00f1        	push	_rev_mesh_id_L
2701  013f 3b00f2        	push	_rev_mesh_id_H
2702  0142 c600f3        	ld	a,_rev_message_id
2703  0145 97            	ld	xl,a
2704  0146 a602          	ld	a,#2
2705  0148 95            	ld	xh,a
2706  0149 cd0000        	call	_sicp_receipt
2708  014c 85            	popw	x
2709                     ; 469 				slcspc_multiple_action_dimmer(num);
2711  014d 7b02          	ld	a,(OFST+0,sp)
2712  014f cd0000        	call	_slcspc_multiple_action_dimmer
2714                     ; 472 				sc.slcMultipleDimmer = sicp_buf[9 + num] + SLC_DIMMER_DELAY_TIME;
2716  0152 7b02          	ld	a,(OFST+0,sp)
2717  0154 5f            	clrw	x
2718  0155 97            	ld	xl,a
2719  0156 d6007e        	ld	a,(_sicp_buf+9,x)
2720  0159 ab0a          	add	a,#10
2721  015b c7011e        	ld	_sc+35,a
2722                     ; 473 				break;
2724  015e ace501e5      	jpf	L5031
2725  0162               L1521:
2726                     ; 475 			case 0x58:	//多个SPC多个通道开关 直接回复心跳包
2726                     ; 476 				num = sicp_buf[7];
2728  0162 c6007c        	ld	a,_sicp_buf+7
2729  0165 6b02          	ld	(OFST+0,sp),a
2730                     ; 477 				ret = slcspc_multiple_action_plug(num);
2732  0167 7b02          	ld	a,(OFST+0,sp)
2733  0169 97            	ld	xl,a
2734  016a 7b02          	ld	a,(OFST+0,sp)
2735  016c cd0000        	call	_slcspc_multiple_action_plug
2737                     ; 478 				if((rev_mesh_id_H == ns_host_meshid_H) && (rev_mesh_id_L == ns_host_meshid_L)){			/* SS的控制 */
2739  016f c600f2        	ld	a,_rev_mesh_id_H
2740  0172 c100f5        	cp	a,_ns_host_meshid_H
2741  0175 260e          	jrne	L1331
2743  0177 c600f1        	ld	a,_rev_mesh_id_L
2744  017a c100f4        	cp	a,_ns_host_meshid_L
2745  017d 2606          	jrne	L1331
2746                     ; 479 					sicp_heart_beat(SICP_RECV);
2748  017f 4f            	clr	a
2749  0180 cd0000        	call	_sicp_heart_beat
2752  0183 2060          	jra	L5031
2753  0185               L1331:
2754                     ; 481 					sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
2756  0185 3b00f1        	push	_rev_mesh_id_L
2757  0188 3b00f2        	push	_rev_mesh_id_H
2758  018b c600f3        	ld	a,_rev_message_id
2759  018e 97            	ld	xl,a
2760  018f a602          	ld	a,#2
2761  0191 95            	ld	xh,a
2762  0192 cd0000        	call	_sicp_receipt
2764  0195 85            	popw	x
2765                     ; 482 					sc.spcMultipleSync = SPC_SYNC_DELAY_TIME;
2767  0196 350a011f      	mov	_sc+36,#10
2768  019a 2049          	jra	L5031
2769  019c               L3521:
2770                     ; 487 			case 0xAA:	/* 接收回执 */	
2770                     ; 488 				malfunction_sended_confirm(rev_message_id);
2772  019c c600f3        	ld	a,_rev_message_id
2773  019f cd0000        	call	_malfunction_sended_confirm
2775                     ; 489 				break;
2777  01a2 2041          	jra	L5031
2778  01a4               L5521:
2779                     ; 491 			case 0x05:	//Alert Command,SC接收到该条指令不用做任何处理
2779                     ; 492 				break;
2781  01a4 203f          	jra	L5031
2782  01a6               L7521:
2783                     ; 494 			case 0xB0:	//Gateway	Mesh	ID	Broadcasting
2783                     ; 495 				if(rev_message_id == 0){
2785  01a6 725d00f3      	tnz	_rev_message_id
2786  01aa 2639          	jrne	L5031
2787                     ; 497 					if((sc.deviceID[0] == sicp_buf[7]) && (sc.deviceID[1] == sicp_buf[8]) && 
2787                     ; 498 					    (sc.deviceID[2] == sicp_buf[9]) && (sc.deviceID[3] == sicp_buf[10])){
2789  01ac c600fb        	ld	a,_sc
2790  01af c1007c        	cp	a,_sicp_buf+7
2791  01b2 2631          	jrne	L5031
2793  01b4 c600fc        	ld	a,_sc+1
2794  01b7 c1007d        	cp	a,_sicp_buf+8
2795  01ba 2629          	jrne	L5031
2797  01bc c600fd        	ld	a,_sc+2
2798  01bf c1007e        	cp	a,_sicp_buf+9
2799  01c2 2621          	jrne	L5031
2801  01c4 c600fe        	ld	a,_sc+3
2802  01c7 c1007f        	cp	a,_sicp_buf+10
2803  01ca 2619          	jrne	L5031
2804                     ; 500 						host_meshid_save(rev_mesh_id_H, rev_mesh_id_L);
2806  01cc c600f1        	ld	a,_rev_mesh_id_L
2807  01cf 97            	ld	xl,a
2808  01d0 c600f2        	ld	a,_rev_mesh_id_H
2809  01d3 95            	ld	xh,a
2810  01d4 cd0000        	call	_host_meshid_save
2812                     ; 501 						rev_ssbroadcast = 1;
2814  01d7 7214058a      	bset	_UART1Flag2_,#2
2815                     ; 502 						send_device_info_all(0xAA, rev_message_id);
2817  01db c600f3        	ld	a,_rev_message_id
2818  01de 97            	ld	xl,a
2819  01df a6aa          	ld	a,#170
2820  01e1 95            	ld	xh,a
2821  01e2 cd0000        	call	_send_device_info_all
2823  01e5               L1621:
2824                     ; 508 			default:
2824                     ; 509 				break;
2826  01e5               L1131:
2827  01e5               L5031:
2828                     ; 515 }
2831  01e5 85            	popw	x
2832  01e6 81            	ret
2933                     ; 518 void sicp_send_message(SICP_Message *tx,u8 payload_len)
2933                     ; 519 {
2934                     .text:	section	.text,new
2935  0000               _sicp_send_message:
2937  0000 89            	pushw	x
2938       00000000      OFST:	set	0
2941                     ; 522 	UART2_Send_Buf[0] = tx->frame_h1;
2943  0001 f6            	ld	a,(x)
2944  0002 c700c9        	ld	_UART2_Send_Buf,a
2945                     ; 523 	UART2_Send_Buf[1] = tx->frame_h2;
2947  0005 e601          	ld	a,(1,x)
2948  0007 c700ca        	ld	_UART2_Send_Buf+1,a
2949                     ; 524 	UART2_Send_Buf[2] = tx->message_id;
2951  000a e602          	ld	a,(2,x)
2952  000c c700cb        	ld	_UART2_Send_Buf+2,a
2953                     ; 525 	UART2_Send_Buf[3] = tx->mesh_id_H;
2955  000f e603          	ld	a,(3,x)
2956  0011 c700cc        	ld	_UART2_Send_Buf+3,a
2957                     ; 526 	UART2_Send_Buf[4] = tx->mesh_id_L;
2959  0014 e604          	ld	a,(4,x)
2960  0016 c700cd        	ld	_UART2_Send_Buf+4,a
2961                     ; 527 	UART2_Send_Buf[5] = 4+payload_len;
2963  0019 7b05          	ld	a,(OFST+5,sp)
2964  001b ab04          	add	a,#4
2965  001d c700ce        	ld	_UART2_Send_Buf+5,a
2966                     ; 528 	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
2968  0020 7b05          	ld	a,(OFST+5,sp)
2969  0022 b703          	ld	c_lreg+3,a
2970  0024 3f02          	clr	c_lreg+2
2971  0026 3f01          	clr	c_lreg+1
2972  0028 3f00          	clr	c_lreg
2973  002a be02          	ldw	x,c_lreg+2
2974  002c 89            	pushw	x
2975  002d be00          	ldw	x,c_lreg
2976  002f 89            	pushw	x
2977  0030 1e05          	ldw	x,(OFST+5,sp)
2978  0032 1c0005        	addw	x,#5
2979  0035 89            	pushw	x
2980  0036 ae00cf        	ldw	x,#_UART2_Send_Buf+6
2981  0039 cd0000        	call	_mymemcpy
2983  003c 5b06          	addw	sp,#6
2984                     ; 529 	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
2986  003e 7b05          	ld	a,(OFST+5,sp)
2987  0040 5f            	clrw	x
2988  0041 97            	ld	xl,a
2989  0042 89            	pushw	x
2990  0043 3b00ce        	push	_UART2_Send_Buf+5
2991  0046 ae00cb        	ldw	x,#_UART2_Send_Buf+2
2992  0049 cd0000        	call	_Check_Sum
2994  004c 5b01          	addw	sp,#1
2995  004e 85            	popw	x
2996  004f d700cf        	ld	(_UART2_Send_Buf+6,x),a
2997                     ; 530 	uart1_send(UART2_Send_Buf,7+payload_len);
2999  0052 7b05          	ld	a,(OFST+5,sp)
3000  0054 5f            	clrw	x
3001  0055 97            	ld	xl,a
3002  0056 1c0007        	addw	x,#7
3003  0059 89            	pushw	x
3004  005a ae00c9        	ldw	x,#_UART2_Send_Buf
3005  005d cd0000        	call	_uart1_send
3007  0060 85            	popw	x
3009  0061               L7041:
3010                     ; 531 	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
3012  0061 725d00c6      	tnz	_Uart2_Send_Done
3013  0065 27fa          	jreq	L7041
3016  0067 725f00c6      	clr	_Uart2_Send_Done
3017                     ; 532 }
3020  006b 85            	popw	x
3021  006c 81            	ret
3085                     ; 538 void sicp_receipt(u8 type,u8 msgid,u8 meshid_h,u8 meshid_l)
3085                     ; 539 {
3086                     .text:	section	.text,new
3087  0000               _sicp_receipt:
3089  0000 89            	pushw	x
3090  0001 5237          	subw	sp,#55
3091       00000037      OFST:	set	55
3094                     ; 542 	receipt.frame_h1 = 0xEE;
3096  0003 a6ee          	ld	a,#238
3097  0005 6b01          	ld	(OFST-54,sp),a
3098                     ; 543 	receipt.frame_h2 = 0xAA;
3100  0007 a6aa          	ld	a,#170
3101  0009 6b02          	ld	(OFST-53,sp),a
3102                     ; 544 	receipt.message_id = msgid;
3104  000b 9f            	ld	a,xl
3105  000c 6b03          	ld	(OFST-52,sp),a
3106                     ; 545 	receipt.mesh_id_H = meshid_h;
3108  000e 7b3c          	ld	a,(OFST+5,sp)
3109  0010 6b04          	ld	(OFST-51,sp),a
3110                     ; 546 	receipt.mesh_id_L = meshid_l;
3112  0012 7b3d          	ld	a,(OFST+6,sp)
3113  0014 6b05          	ld	(OFST-50,sp),a
3114                     ; 547 	receipt.payload[0] = 0xAA;
3116  0016 a6aa          	ld	a,#170
3117  0018 6b06          	ld	(OFST-49,sp),a
3118                     ; 548 	receipt.payload[1] = type;
3120  001a 9e            	ld	a,xh
3121  001b 6b07          	ld	(OFST-48,sp),a
3122                     ; 550 	sicp_send_message(&receipt, 2);
3124  001d 4b02          	push	#2
3125  001f 96            	ldw	x,sp
3126  0020 1c0002        	addw	x,#OFST-53
3127  0023 cd0000        	call	_sicp_send_message
3129  0026 84            	pop	a
3130                     ; 551 }
3133  0027 5b39          	addw	sp,#57
3134  0029 81            	ret
3213                     ; 555 void sicp_receipt_Done(u8 type, u8 msgid, u8 meshid_h, u8 meshid_l, u8 method, u8 mdid)
3213                     ; 556 {
3214                     .text:	section	.text,new
3215  0000               _sicp_receipt_Done:
3217  0000 89            	pushw	x
3218  0001 5237          	subw	sp,#55
3219       00000037      OFST:	set	55
3222                     ; 558 	receipt.frame_h1 = 0xEE;
3224  0003 a6ee          	ld	a,#238
3225  0005 6b01          	ld	(OFST-54,sp),a
3226                     ; 559 	receipt.frame_h2 = 0xAA;
3228  0007 a6aa          	ld	a,#170
3229  0009 6b02          	ld	(OFST-53,sp),a
3230                     ; 560 	receipt.message_id = msgid;
3232  000b 9f            	ld	a,xl
3233  000c 6b03          	ld	(OFST-52,sp),a
3234                     ; 561 	receipt.mesh_id_H = meshid_h;
3236  000e 7b3c          	ld	a,(OFST+5,sp)
3237  0010 6b04          	ld	(OFST-51,sp),a
3238                     ; 562 	receipt.mesh_id_L = meshid_l;
3240  0012 7b3d          	ld	a,(OFST+6,sp)
3241  0014 6b05          	ld	(OFST-50,sp),a
3242                     ; 563 	receipt.payload[0] = 0xAA;
3244  0016 a6aa          	ld	a,#170
3245  0018 6b06          	ld	(OFST-49,sp),a
3246                     ; 564 	receipt.payload[1] = type;
3248  001a 9e            	ld	a,xh
3249  001b 6b07          	ld	(OFST-48,sp),a
3250                     ; 565 	switch(method){
3252  001d 7b3e          	ld	a,(OFST+7,sp)
3254                     ; 583 		default:
3254                     ; 584 			break;
3255  001f 4a            	dec	a
3256  0020 2706          	jreq	L1441
3257  0022 4a            	dec	a
3258  0023 274b          	jreq	L3441
3259  0025 cc00b6        	jra	L3051
3260  0028               L1441:
3261                     ; 566 		case 0x01:	//action Dimmer调光的执行回执
3261                     ; 567 			receipt.payload[2] = mdid;
3263  0028 7b3f          	ld	a,(OFST+8,sp)
3264  002a 6b08          	ld	(OFST-47,sp),a
3265                     ; 568 			receipt.payload[3] = sc.slc[mdid-1].ch1_status;
3267  002c 7b3f          	ld	a,(OFST+8,sp)
3268  002e 97            	ld	xl,a
3269  002f a624          	ld	a,#36
3270  0031 42            	mul	x,a
3271  0032 1d0024        	subw	x,#36
3272  0035 d60384        	ld	a,(_sc+649,x)
3273  0038 6b09          	ld	(OFST-46,sp),a
3274                     ; 569 			receipt.payload[4] = sc.slc[mdid-1].ch2_status;
3276  003a 7b3f          	ld	a,(OFST+8,sp)
3277  003c 97            	ld	xl,a
3278  003d a624          	ld	a,#36
3279  003f 42            	mul	x,a
3280  0040 1d0024        	subw	x,#36
3281  0043 d60385        	ld	a,(_sc+650,x)
3282  0046 6b0a          	ld	(OFST-45,sp),a
3283                     ; 570 			receipt.payload[5] = sc.slc[mdid-1].ch3_status;
3285  0048 7b3f          	ld	a,(OFST+8,sp)
3286  004a 97            	ld	xl,a
3287  004b a624          	ld	a,#36
3288  004d 42            	mul	x,a
3289  004e 1d0024        	subw	x,#36
3290  0051 d60386        	ld	a,(_sc+651,x)
3291  0054 6b0b          	ld	(OFST-44,sp),a
3292                     ; 571 			receipt.payload[6] = sc.slc[mdid-1].ch4_status;
3294  0056 7b3f          	ld	a,(OFST+8,sp)
3295  0058 97            	ld	xl,a
3296  0059 a624          	ld	a,#36
3297  005b 42            	mul	x,a
3298  005c 1d0024        	subw	x,#36
3299  005f d60387        	ld	a,(_sc+652,x)
3300  0062 6b0c          	ld	(OFST-43,sp),a
3301                     ; 572 			sicp_send_message(&receipt,7);
3303  0064 4b07          	push	#7
3304  0066 96            	ldw	x,sp
3305  0067 1c0002        	addw	x,#OFST-53
3306  006a cd0000        	call	_sicp_send_message
3308  006d 84            	pop	a
3309                     ; 574 			break;
3311  006e 2046          	jra	L3051
3312  0070               L3441:
3313                     ; 575 		case 0x02:	//action plug switch打开或关闭开关的执行回执
3313                     ; 576 			receipt.payload[2] = mdid;
3315  0070 7b3f          	ld	a,(OFST+8,sp)
3316  0072 6b08          	ld	(OFST-47,sp),a
3317                     ; 577 			receipt.payload[3] = sc.spc[mdid-1].ch1_status;
3319  0074 7b3f          	ld	a,(OFST+8,sp)
3320  0076 97            	ld	xl,a
3321  0077 a627          	ld	a,#39
3322  0079 42            	mul	x,a
3323  007a 1d0027        	subw	x,#39
3324  007d d6013b        	ld	a,(_sc+64,x)
3325  0080 6b09          	ld	(OFST-46,sp),a
3326                     ; 578 			receipt.payload[4] = sc.spc[mdid-1].ch2_status;
3328  0082 7b3f          	ld	a,(OFST+8,sp)
3329  0084 97            	ld	xl,a
3330  0085 a627          	ld	a,#39
3331  0087 42            	mul	x,a
3332  0088 1d0027        	subw	x,#39
3333  008b d6013c        	ld	a,(_sc+65,x)
3334  008e 6b0a          	ld	(OFST-45,sp),a
3335                     ; 579 			receipt.payload[5] = sc.spc[mdid-1].ch3_status;
3337  0090 7b3f          	ld	a,(OFST+8,sp)
3338  0092 97            	ld	xl,a
3339  0093 a627          	ld	a,#39
3340  0095 42            	mul	x,a
3341  0096 1d0027        	subw	x,#39
3342  0099 d6013d        	ld	a,(_sc+66,x)
3343  009c 6b0b          	ld	(OFST-44,sp),a
3344                     ; 580 			receipt.payload[6] = sc.spc[mdid-1].ch4_status;
3346  009e 7b3f          	ld	a,(OFST+8,sp)
3347  00a0 97            	ld	xl,a
3348  00a1 a627          	ld	a,#39
3349  00a3 42            	mul	x,a
3350  00a4 1d0027        	subw	x,#39
3351  00a7 d6013e        	ld	a,(_sc+67,x)
3352  00aa 6b0c          	ld	(OFST-43,sp),a
3353                     ; 581 			sicp_send_message(&receipt, 7);
3355  00ac 4b07          	push	#7
3356  00ae 96            	ldw	x,sp
3357  00af 1c0002        	addw	x,#OFST-53
3358  00b2 cd0000        	call	_sicp_send_message
3360  00b5 84            	pop	a
3361                     ; 582 			break;
3363  00b6               L5441:
3364                     ; 583 		default:
3364                     ; 584 			break;
3366  00b6               L3051:
3367                     ; 588 }
3370  00b6 5b39          	addw	sp,#57
3371  00b8 81            	ret
3477                     ; 593 void sicp_heart_beat(SICP_RXTX_TYPE s)
3477                     ; 594 {
3478                     .text:	section	.text,new
3479  0000               _sicp_heart_beat:
3481  0000 88            	push	a
3482  0001 523e          	subw	sp,#62
3483       0000003e      OFST:	set	62
3486                     ; 598 	cmd_data.frame_h1 = 0xEE;
3488  0003 a6ee          	ld	a,#238
3489  0005 6b06          	ld	(OFST-56,sp),a
3490                     ; 599 	if(s == SICP_RECV){
3492  0007 0d3f          	tnz	(OFST+1,sp)
3493  0009 260b          	jrne	L1551
3494                     ; 600 		cmd_data.frame_h2 = 0xAA;
3496  000b a6aa          	ld	a,#170
3497  000d 6b07          	ld	(OFST-55,sp),a
3498                     ; 601 		cmd_data.message_id = rev_message_id;
3500  000f c600f3        	ld	a,_rev_message_id
3501  0012 6b08          	ld	(OFST-54,sp),a
3503  0014 2009          	jra	L3551
3504  0016               L1551:
3505                     ; 603 		cmd_data.frame_h2 = 0xEE;
3507  0016 a6ee          	ld	a,#238
3508  0018 6b07          	ld	(OFST-55,sp),a
3509                     ; 604 		cmd_data.message_id = sicp_get_message_id();
3511  001a cd0000        	call	_sicp_get_message_id
3513  001d 6b08          	ld	(OFST-54,sp),a
3514  001f               L3551:
3515                     ; 607 	cmd_data.mesh_id_H = ns_host_meshid_H;
3517  001f c600f5        	ld	a,_ns_host_meshid_H
3518  0022 6b09          	ld	(OFST-53,sp),a
3519                     ; 608 	cmd_data.mesh_id_L = ns_host_meshid_L;
3521  0024 c600f4        	ld	a,_ns_host_meshid_L
3522  0027 6b0a          	ld	(OFST-52,sp),a
3523                     ; 609 	cmd_data.payload[0] = 0x11;
3525  0029 a611          	ld	a,#17
3526  002b 6b0b          	ld	(OFST-51,sp),a
3527                     ; 611  	len = 9;	
3529  002d a609          	ld	a,#9
3530  002f 6b03          	ld	(OFST-59,sp),a
3531                     ; 612 	data = 0;
3533  0031 0f04          	clr	(OFST-58,sp)
3534                     ; 613 	cnt = 0;
3536  0033 0f05          	clr	(OFST-57,sp)
3537                     ; 614 	for(i = 0; i < 15; i++){
3539  0035 0f3e          	clr	(OFST+0,sp)
3540  0037               L5551:
3541                     ; 615 		cnt++;
3543  0037 0c05          	inc	(OFST-57,sp)
3544                     ; 616 		tmp = 0;
3546  0039 0f3d          	clr	(OFST-1,sp)
3547                     ; 617 		if(sc.slc[i].MDID){
3549  003b 7b3e          	ld	a,(OFST+0,sp)
3550  003d 97            	ld	xl,a
3551  003e a624          	ld	a,#36
3552  0040 42            	mul	x,a
3553  0041 724d0383      	tnz	(_sc+648,x)
3554  0045 2603          	jrne	L061
3555  0047 cc00e6        	jp	L3651
3556  004a               L061:
3557                     ; 618 			tmp |= sc.slc[i].ch1_status ? 0x01 : 0;
3559  004a 7b3e          	ld	a,(OFST+0,sp)
3560  004c 97            	ld	xl,a
3561  004d a624          	ld	a,#36
3562  004f 42            	mul	x,a
3563  0050 724d0384      	tnz	(_sc+649,x)
3564  0054 2704          	jreq	L021
3565  0056 a601          	ld	a,#1
3566  0058 2001          	jra	L221
3567  005a               L021:
3568  005a 4f            	clr	a
3569  005b               L221:
3570  005b 1a3d          	or	a,(OFST-1,sp)
3571  005d 6b3d          	ld	(OFST-1,sp),a
3572                     ; 619 			tmp |= sc.slc[i].ch2_status ? 0x02 : 0;
3574  005f 7b3e          	ld	a,(OFST+0,sp)
3575  0061 97            	ld	xl,a
3576  0062 a624          	ld	a,#36
3577  0064 42            	mul	x,a
3578  0065 724d0385      	tnz	(_sc+650,x)
3579  0069 2704          	jreq	L421
3580  006b a602          	ld	a,#2
3581  006d 2001          	jra	L621
3582  006f               L421:
3583  006f 4f            	clr	a
3584  0070               L621:
3585  0070 1a3d          	or	a,(OFST-1,sp)
3586  0072 6b3d          	ld	(OFST-1,sp),a
3587                     ; 620 			tmp |= 0x08;
3589  0074 7b3d          	ld	a,(OFST-1,sp)
3590  0076 aa08          	or	a,#8
3591  0078 6b3d          	ld	(OFST-1,sp),a
3592                     ; 621 			data |= (cnt == 1) ? (tmp << 4) : tmp;
3594  007a 7b05          	ld	a,(OFST-57,sp)
3595  007c a101          	cp	a,#1
3596  007e 2609          	jrne	L031
3597  0080 7b3d          	ld	a,(OFST-1,sp)
3598  0082 97            	ld	xl,a
3599  0083 a610          	ld	a,#16
3600  0085 42            	mul	x,a
3601  0086 9f            	ld	a,xl
3602  0087 2002          	jra	L231
3603  0089               L031:
3604  0089 7b3d          	ld	a,(OFST-1,sp)
3605  008b               L231:
3606  008b 1a04          	or	a,(OFST-58,sp)
3607  008d 6b04          	ld	(OFST-58,sp),a
3608                     ; 623 			if(sc.slc[i].ch1_status){ cmd_data.payload[len++] = sc.slc[i].ch1_status;}
3610  008f 7b3e          	ld	a,(OFST+0,sp)
3611  0091 97            	ld	xl,a
3612  0092 a624          	ld	a,#36
3613  0094 42            	mul	x,a
3614  0095 724d0384      	tnz	(_sc+649,x)
3615  0099 271d          	jreq	L5651
3618  009b 96            	ldw	x,sp
3619  009c 1c000b        	addw	x,#OFST-51
3620  009f 1f01          	ldw	(OFST-61,sp),x
3621  00a1 7b03          	ld	a,(OFST-59,sp)
3622  00a3 97            	ld	xl,a
3623  00a4 0c03          	inc	(OFST-59,sp)
3624  00a6 9f            	ld	a,xl
3625  00a7 5f            	clrw	x
3626  00a8 97            	ld	xl,a
3627  00a9 72fb01        	addw	x,(OFST-61,sp)
3628  00ac 89            	pushw	x
3629  00ad 7b40          	ld	a,(OFST+2,sp)
3630  00af 97            	ld	xl,a
3631  00b0 a624          	ld	a,#36
3632  00b2 42            	mul	x,a
3633  00b3 d60384        	ld	a,(_sc+649,x)
3634  00b6 85            	popw	x
3635  00b7 f7            	ld	(x),a
3636  00b8               L5651:
3637                     ; 624 			if(sc.slc[i].ch2_status){ cmd_data.payload[len++] = sc.slc[i].ch2_status;}
3639  00b8 7b3e          	ld	a,(OFST+0,sp)
3640  00ba 97            	ld	xl,a
3641  00bb a624          	ld	a,#36
3642  00bd 42            	mul	x,a
3643  00be 724d0385      	tnz	(_sc+650,x)
3644  00c2 2603          	jrne	L261
3645  00c4 cc015b        	jp	L1751
3646  00c7               L261:
3649  00c7 96            	ldw	x,sp
3650  00c8 1c000b        	addw	x,#OFST-51
3651  00cb 1f01          	ldw	(OFST-61,sp),x
3652  00cd 7b03          	ld	a,(OFST-59,sp)
3653  00cf 97            	ld	xl,a
3654  00d0 0c03          	inc	(OFST-59,sp)
3655  00d2 9f            	ld	a,xl
3656  00d3 5f            	clrw	x
3657  00d4 97            	ld	xl,a
3658  00d5 72fb01        	addw	x,(OFST-61,sp)
3659  00d8 89            	pushw	x
3660  00d9 7b40          	ld	a,(OFST+2,sp)
3661  00db 97            	ld	xl,a
3662  00dc a624          	ld	a,#36
3663  00de 42            	mul	x,a
3664  00df d60385        	ld	a,(_sc+650,x)
3665  00e2 85            	popw	x
3666  00e3 f7            	ld	(x),a
3667  00e4 2075          	jra	L1751
3668  00e6               L3651:
3669                     ; 626 		}else if(sc.spc[i].MDID){
3671  00e6 7b3e          	ld	a,(OFST+0,sp)
3672  00e8 97            	ld	xl,a
3673  00e9 a627          	ld	a,#39
3674  00eb 42            	mul	x,a
3675  00ec 724d013a      	tnz	(_sc+63,x)
3676  00f0 2756          	jreq	L3751
3677                     ; 627 			tmp |= sc.spc[i].ch1_status ? 0x01 : 0;
3679  00f2 7b3e          	ld	a,(OFST+0,sp)
3680  00f4 97            	ld	xl,a
3681  00f5 a627          	ld	a,#39
3682  00f7 42            	mul	x,a
3683  00f8 724d013b      	tnz	(_sc+64,x)
3684  00fc 2704          	jreq	L431
3685  00fe a601          	ld	a,#1
3686  0100 2001          	jra	L631
3687  0102               L431:
3688  0102 4f            	clr	a
3689  0103               L631:
3690  0103 1a3d          	or	a,(OFST-1,sp)
3691  0105 6b3d          	ld	(OFST-1,sp),a
3692                     ; 628 			tmp |= sc.spc[i].ch2_status ? 0x02 : 0;
3694  0107 7b3e          	ld	a,(OFST+0,sp)
3695  0109 97            	ld	xl,a
3696  010a a627          	ld	a,#39
3697  010c 42            	mul	x,a
3698  010d 724d013c      	tnz	(_sc+65,x)
3699  0111 2704          	jreq	L041
3700  0113 a602          	ld	a,#2
3701  0115 2001          	jra	L241
3702  0117               L041:
3703  0117 4f            	clr	a
3704  0118               L241:
3705  0118 1a3d          	or	a,(OFST-1,sp)
3706  011a 6b3d          	ld	(OFST-1,sp),a
3707                     ; 629 			tmp |= sc.spc[i].ch3_status ? 0x04 : 0;
3709  011c 7b3e          	ld	a,(OFST+0,sp)
3710  011e 97            	ld	xl,a
3711  011f a627          	ld	a,#39
3712  0121 42            	mul	x,a
3713  0122 724d013d      	tnz	(_sc+66,x)
3714  0126 2704          	jreq	L441
3715  0128 a604          	ld	a,#4
3716  012a 2001          	jra	L641
3717  012c               L441:
3718  012c 4f            	clr	a
3719  012d               L641:
3720  012d 1a3d          	or	a,(OFST-1,sp)
3721  012f 6b3d          	ld	(OFST-1,sp),a
3722                     ; 630 			data |= (cnt == 1) ? (tmp << 4) : tmp;
3724  0131 7b05          	ld	a,(OFST-57,sp)
3725  0133 a101          	cp	a,#1
3726  0135 2609          	jrne	L051
3727  0137 7b3d          	ld	a,(OFST-1,sp)
3728  0139 97            	ld	xl,a
3729  013a a610          	ld	a,#16
3730  013c 42            	mul	x,a
3731  013d 9f            	ld	a,xl
3732  013e 2002          	jra	L251
3733  0140               L051:
3734  0140 7b3d          	ld	a,(OFST-1,sp)
3735  0142               L251:
3736  0142 1a04          	or	a,(OFST-58,sp)
3737  0144 6b04          	ld	(OFST-58,sp),a
3739  0146 2013          	jra	L1751
3740  0148               L3751:
3741                     ; 633 			tmp = 0x0c;
3743  0148 7b3d          	ld	a,(OFST-1,sp)
3744  014a 97            	ld	xl,a
3745                     ; 634 			data |= (cnt == 1) ? (tmp << 4) : tmp;
3747  014b 7b05          	ld	a,(OFST-57,sp)
3748  014d a101          	cp	a,#1
3749  014f 2604          	jrne	L451
3750  0151 a6c0          	ld	a,#192
3751  0153 2002          	jra	L651
3752  0155               L451:
3753  0155 a60c          	ld	a,#12
3754  0157               L651:
3755  0157 1a04          	or	a,(OFST-58,sp)
3756  0159 6b04          	ld	(OFST-58,sp),a
3757  015b               L1751:
3758                     ; 637 		if(cnt >= 2){		/* 一个字节完成 */
3760  015b 7b05          	ld	a,(OFST-57,sp)
3761  015d a102          	cp	a,#2
3762  015f 251a          	jrult	L7751
3763                     ; 638 			cmd_data.payload[(i + 1) /2] = data;
3765  0161 96            	ldw	x,sp
3766  0162 1c000b        	addw	x,#OFST-51
3767  0165 1f01          	ldw	(OFST-61,sp),x
3768  0167 7b3e          	ld	a,(OFST+0,sp)
3769  0169 5f            	clrw	x
3770  016a 97            	ld	xl,a
3771  016b 5c            	incw	x
3772  016c a602          	ld	a,#2
3773  016e cd0000        	call	c_sdivx
3775  0171 72fb01        	addw	x,(OFST-61,sp)
3776  0174 7b04          	ld	a,(OFST-58,sp)
3777  0176 f7            	ld	(x),a
3778                     ; 639 			data = 0;
3780  0177 0f04          	clr	(OFST-58,sp)
3781                     ; 640 			cnt = 0;
3783  0179 0f05          	clr	(OFST-57,sp)
3784  017b               L7751:
3785                     ; 614 	for(i = 0; i < 15; i++){
3787  017b 0c3e          	inc	(OFST+0,sp)
3790  017d 7b3e          	ld	a,(OFST+0,sp)
3791  017f a10f          	cp	a,#15
3792  0181 2403          	jruge	L461
3793  0183 cc0037        	jp	L5551
3794  0186               L461:
3795                     ; 643 	cmd_data.payload[8] = data;
3797  0186 7b04          	ld	a,(OFST-58,sp)
3798  0188 6b13          	ld	(OFST-43,sp),a
3799                     ; 645 	sicp_send_message(&cmd_data, len);
3801  018a 7b03          	ld	a,(OFST-59,sp)
3802  018c 88            	push	a
3803  018d 96            	ldw	x,sp
3804  018e 1c0007        	addw	x,#OFST-55
3805  0191 cd0000        	call	_sicp_send_message
3807  0194 84            	pop	a
3808                     ; 647 }
3811  0195 5b3f          	addw	sp,#63
3812  0197 81            	ret
3815                     	switch	.data
3816  000a               L1061_eg_timeout:
3817  000a 00            	dc.b	0
3818  000b               L3061_counts:
3819  000b 00            	dc.b	0
3820  000c               L5061_i:
3821  000c 00            	dc.b	0
3882                     ; 654 void report_energy_consum(void)
3882                     ; 655 {
3883                     .text:	section	.text,new
3884  0000               _report_energy_consum:
3888                     ; 662 	counts++;
3890  0000 725c000b      	inc	L3061_counts
3891                     ; 697 }
3894  0004 81            	ret
3897                     	switch	.data
3898  000d               L3361_counts:
3899  000d 0000          	dc.w	0
3947                     ; 707 u8 send_device_info_active(void)
3947                     ; 708 {
3948                     .text:	section	.text,new
3949  0000               _send_device_info_active:
3951  0000 89            	pushw	x
3952       00000002      OFST:	set	2
3955                     ; 710 	u8 ret = 0;
3957  0001 0f02          	clr	(OFST+0,sp)
3958                     ; 711 	u8 waits = 60 + (ns_host_meshid_L & 0x0f);
3960  0003 c600f4        	ld	a,_ns_host_meshid_L
3961  0006 a40f          	and	a,#15
3962  0008 ab3c          	add	a,#60
3963  000a 6b01          	ld	(OFST-1,sp),a
3964                     ; 713 	if(ns_host_meshid_H){			/* meshid 存在 */
3966  000c 725d00f5      	tnz	_ns_host_meshid_H
3967  0010 2725          	jreq	L5561
3968                     ; 715 		counts++;
3970  0012 ce000d        	ldw	x,L3361_counts
3971  0015 1c0001        	addw	x,#1
3972  0018 cf000d        	ldw	L3361_counts,x
3973                     ; 717 		if(counts >= waits){
3975  001b 7b01          	ld	a,(OFST-1,sp)
3976  001d 5f            	clrw	x
3977  001e 97            	ld	xl,a
3978  001f bf00          	ldw	c_x,x
3979  0021 ce000d        	ldw	x,L3361_counts
3980  0024 b300          	cpw	x,c_x
3981  0026 250f          	jrult	L5561
3982                     ; 718 			send_device_info_all(0xEE, 0);
3984  0028 5f            	clrw	x
3985  0029 a6ee          	ld	a,#238
3986  002b 95            	ld	xh,a
3987  002c cd0000        	call	_send_device_info_all
3989                     ; 719 			counts = 0;
3991  002f 5f            	clrw	x
3992  0030 cf000d        	ldw	L3361_counts,x
3993                     ; 720 			ret = 1;
3995  0033 a601          	ld	a,#1
3996  0035 6b02          	ld	(OFST+0,sp),a
3997  0037               L5561:
3998                     ; 723 	return ret;
4000  0037 7b02          	ld	a,(OFST+0,sp)
4003  0039 85            	popw	x
4004  003a 81            	ret
4074                     ; 733 void send_device_info_all(u8 type, u8 msgid)
4074                     ; 734 {
4075                     .text:	section	.text,new
4076  0000               _send_device_info_all:
4078  0000 89            	pushw	x
4079  0001 5239          	subw	sp,#57
4080       00000039      OFST:	set	57
4083                     ; 738 	di.frame_h1 = 0xEE;
4085  0003 a6ee          	ld	a,#238
4086  0005 6b01          	ld	(OFST-56,sp),a
4087                     ; 739 	di.frame_h2 = type;
4089  0007 9e            	ld	a,xh
4090  0008 6b02          	ld	(OFST-55,sp),a
4091                     ; 740 	if(type == 0xEE){
4093  000a 9e            	ld	a,xh
4094  000b a1ee          	cp	a,#238
4095  000d 2605          	jrne	L7071
4096                     ; 741 		di.message_id = sicp_get_message_id();
4098  000f cd0000        	call	_sicp_get_message_id
4100  0012 6b03          	ld	(OFST-54,sp),a
4101  0014               L7071:
4102                     ; 743 	if(type == 0xAA){
4104  0014 7b3a          	ld	a,(OFST+1,sp)
4105  0016 a1aa          	cp	a,#170
4106  0018 2604          	jrne	L1171
4107                     ; 744 		di.message_id = msgid;
4109  001a 7b3b          	ld	a,(OFST+2,sp)
4110  001c 6b03          	ld	(OFST-54,sp),a
4111  001e               L1171:
4112                     ; 746 	di.mesh_id_H = ns_host_meshid_H;
4114  001e c600f5        	ld	a,_ns_host_meshid_H
4115  0021 6b04          	ld	(OFST-53,sp),a
4116                     ; 747 	di.mesh_id_L = ns_host_meshid_L;
4118  0023 c600f4        	ld	a,_ns_host_meshid_L
4119  0026 6b05          	ld	(OFST-52,sp),a
4120                     ; 748 	di.payload[0] = 0xB1;
4122  0028 a6b1          	ld	a,#177
4123  002a 6b06          	ld	(OFST-51,sp),a
4124                     ; 749 	di.payload[1] =	sc.deviceID[0];
4126  002c c600fb        	ld	a,_sc
4127  002f 6b07          	ld	(OFST-50,sp),a
4128                     ; 750 	di.payload[2] =	sc.deviceID[1];
4130  0031 c600fc        	ld	a,_sc+1
4131  0034 6b08          	ld	(OFST-49,sp),a
4132                     ; 751 	di.payload[3] =	sc.deviceID[2];
4134  0036 c600fd        	ld	a,_sc+2
4135  0039 6b09          	ld	(OFST-48,sp),a
4136                     ; 752 	di.payload[4] =	sc.deviceID[3];
4138  003b c600fe        	ld	a,_sc+3
4139  003e 6b0a          	ld	(OFST-47,sp),a
4140                     ; 753 	di.payload[5] =	sc.model;
4142  0040 c60100        	ld	a,_sc+5
4143  0043 6b0b          	ld	(OFST-46,sp),a
4144                     ; 754 	di.payload[6] = sc.firmware_version;
4146  0045 c60101        	ld	a,_sc+6
4147  0048 6b0c          	ld	(OFST-45,sp),a
4148                     ; 755 	di.payload[7] = sc.HWTtest;
4150  004a c60117        	ld	a,_sc+28
4151  004d 6b0d          	ld	(OFST-44,sp),a
4152                     ; 757 	tmp = 0;
4154  004f 0f38          	clr	(OFST-1,sp)
4155                     ; 758 	for(i=1; i<8; i++){
4157  0051 a601          	ld	a,#1
4158  0053 6b39          	ld	(OFST+0,sp),a
4159  0055               L3171:
4160                     ; 759 		if(sc.slc[i -1].MDID){
4162  0055 7b39          	ld	a,(OFST+0,sp)
4163  0057 97            	ld	xl,a
4164  0058 a624          	ld	a,#36
4165  005a 42            	mul	x,a
4166  005b 1d0024        	subw	x,#36
4167  005e 724d0383      	tnz	(_sc+648,x)
4168  0062 270b          	jreq	L1271
4169                     ; 760 			tmp |= BIT[i];
4171  0064 7b39          	ld	a,(OFST+0,sp)
4172  0066 5f            	clrw	x
4173  0067 97            	ld	xl,a
4174  0068 7b38          	ld	a,(OFST-1,sp)
4175  006a da0000        	or	a,(_BIT,x)
4176  006d 6b38          	ld	(OFST-1,sp),a
4177  006f               L1271:
4178                     ; 758 	for(i=1; i<8; i++){
4180  006f 0c39          	inc	(OFST+0,sp)
4183  0071 7b39          	ld	a,(OFST+0,sp)
4184  0073 a108          	cp	a,#8
4185  0075 25de          	jrult	L3171
4186                     ; 763 	di.payload[8] = tmp;
4188  0077 7b38          	ld	a,(OFST-1,sp)
4189  0079 6b0e          	ld	(OFST-43,sp),a
4190                     ; 765 	tmp = 0;
4192  007b 0f38          	clr	(OFST-1,sp)
4193                     ; 766 	for(i=0; i<8; i++){
4195  007d 0f39          	clr	(OFST+0,sp)
4196  007f               L3271:
4197                     ; 767 		if(sc.slc[i+7].MDID){
4199  007f 7b39          	ld	a,(OFST+0,sp)
4200  0081 97            	ld	xl,a
4201  0082 a624          	ld	a,#36
4202  0084 42            	mul	x,a
4203  0085 724d047f      	tnz	(_sc+900,x)
4204  0089 270b          	jreq	L1371
4205                     ; 768 			tmp |= BIT[i];
4207  008b 7b39          	ld	a,(OFST+0,sp)
4208  008d 5f            	clrw	x
4209  008e 97            	ld	xl,a
4210  008f 7b38          	ld	a,(OFST-1,sp)
4211  0091 da0000        	or	a,(_BIT,x)
4212  0094 6b38          	ld	(OFST-1,sp),a
4213  0096               L1371:
4214                     ; 766 	for(i=0; i<8; i++){
4216  0096 0c39          	inc	(OFST+0,sp)
4219  0098 7b39          	ld	a,(OFST+0,sp)
4220  009a a108          	cp	a,#8
4221  009c 25e1          	jrult	L3271
4222                     ; 771 	di.payload[9] = tmp;
4224  009e 7b38          	ld	a,(OFST-1,sp)
4225  00a0 6b0f          	ld	(OFST-42,sp),a
4226                     ; 773 	tmp = 0;
4228  00a2 0f38          	clr	(OFST-1,sp)
4229                     ; 774 	for(i=1; i<8; i++){
4231  00a4 a601          	ld	a,#1
4232  00a6 6b39          	ld	(OFST+0,sp),a
4233  00a8               L3371:
4234                     ; 775 		if(sc.spc[i -1].MDID){
4236  00a8 7b39          	ld	a,(OFST+0,sp)
4237  00aa 97            	ld	xl,a
4238  00ab a627          	ld	a,#39
4239  00ad 42            	mul	x,a
4240  00ae 1d0027        	subw	x,#39
4241  00b1 724d013a      	tnz	(_sc+63,x)
4242  00b5 270b          	jreq	L1471
4243                     ; 776 			tmp |= BIT[i];
4245  00b7 7b39          	ld	a,(OFST+0,sp)
4246  00b9 5f            	clrw	x
4247  00ba 97            	ld	xl,a
4248  00bb 7b38          	ld	a,(OFST-1,sp)
4249  00bd da0000        	or	a,(_BIT,x)
4250  00c0 6b38          	ld	(OFST-1,sp),a
4251  00c2               L1471:
4252                     ; 774 	for(i=1; i<8; i++){
4254  00c2 0c39          	inc	(OFST+0,sp)
4257  00c4 7b39          	ld	a,(OFST+0,sp)
4258  00c6 a108          	cp	a,#8
4259  00c8 25de          	jrult	L3371
4260                     ; 779 	di.payload[10] = tmp;
4262  00ca 7b38          	ld	a,(OFST-1,sp)
4263  00cc 6b10          	ld	(OFST-41,sp),a
4264                     ; 781 	tmp = 0;
4266  00ce 0f38          	clr	(OFST-1,sp)
4267                     ; 782 	for(i=0; i<8; i++){
4269  00d0 0f39          	clr	(OFST+0,sp)
4270  00d2               L3471:
4271                     ; 783 		if(sc.spc[i+7].MDID){
4273  00d2 7b39          	ld	a,(OFST+0,sp)
4274  00d4 97            	ld	xl,a
4275  00d5 a627          	ld	a,#39
4276  00d7 42            	mul	x,a
4277  00d8 724d024b      	tnz	(_sc+336,x)
4278  00dc 270b          	jreq	L1571
4279                     ; 784 			tmp |= BIT[i];
4281  00de 7b39          	ld	a,(OFST+0,sp)
4282  00e0 5f            	clrw	x
4283  00e1 97            	ld	xl,a
4284  00e2 7b38          	ld	a,(OFST-1,sp)
4285  00e4 da0000        	or	a,(_BIT,x)
4286  00e7 6b38          	ld	(OFST-1,sp),a
4287  00e9               L1571:
4288                     ; 782 	for(i=0; i<8; i++){
4290  00e9 0c39          	inc	(OFST+0,sp)
4293  00eb 7b39          	ld	a,(OFST+0,sp)
4294  00ed a108          	cp	a,#8
4295  00ef 25e1          	jrult	L3471
4296                     ; 787 	di.payload[11] = tmp;
4298  00f1 7b38          	ld	a,(OFST-1,sp)
4299  00f3 6b11          	ld	(OFST-40,sp),a
4300                     ; 789 	sicp_send_message(&di, 12);
4302  00f5 4b0c          	push	#12
4303  00f7 96            	ldw	x,sp
4304  00f8 1c0002        	addw	x,#OFST-55
4305  00fb cd0000        	call	_sicp_send_message
4307  00fe 84            	pop	a
4308                     ; 791 }
4311  00ff 5b3b          	addw	sp,#59
4312  0101 81            	ret
4360                     ; 795 void send_slc_device_info(u8 i)
4360                     ; 796 {
4361                     .text:	section	.text,new
4362  0000               _send_slc_device_info:
4364  0000 88            	push	a
4365  0001 5237          	subw	sp,#55
4366       00000037      OFST:	set	55
4369                     ; 799 	di.frame_h1 = 0xEE;
4371  0003 a6ee          	ld	a,#238
4372  0005 6b01          	ld	(OFST-54,sp),a
4373                     ; 800 	di.frame_h2 = 0xEE;
4375  0007 a6ee          	ld	a,#238
4376  0009 6b02          	ld	(OFST-53,sp),a
4377                     ; 801 	di.message_id = sicp_get_message_id();
4379  000b cd0000        	call	_sicp_get_message_id
4381  000e 6b03          	ld	(OFST-52,sp),a
4382                     ; 802 	di.mesh_id_H = ns_host_meshid_H;
4384  0010 c600f5        	ld	a,_ns_host_meshid_H
4385  0013 6b04          	ld	(OFST-51,sp),a
4386                     ; 803 	di.mesh_id_L = ns_host_meshid_L;
4388  0015 c600f4        	ld	a,_ns_host_meshid_L
4389  0018 6b05          	ld	(OFST-50,sp),a
4390                     ; 804 	di.payload[0] = 0xB2;
4392  001a a6b2          	ld	a,#178
4393  001c 6b06          	ld	(OFST-49,sp),a
4394                     ; 805 	di.payload[1] =	sc.slc[i].deviceID[0];
4396  001e 7b38          	ld	a,(OFST+1,sp)
4397  0020 97            	ld	xl,a
4398  0021 a624          	ld	a,#36
4399  0023 42            	mul	x,a
4400  0024 d60369        	ld	a,(_sc+622,x)
4401  0027 6b07          	ld	(OFST-48,sp),a
4402                     ; 806 	di.payload[2] =	sc.slc[i].deviceID[1];
4404  0029 7b38          	ld	a,(OFST+1,sp)
4405  002b 97            	ld	xl,a
4406  002c a624          	ld	a,#36
4407  002e 42            	mul	x,a
4408  002f d6036a        	ld	a,(_sc+623,x)
4409  0032 6b08          	ld	(OFST-47,sp),a
4410                     ; 807 	di.payload[3] =	sc.slc[i].deviceID[2];
4412  0034 7b38          	ld	a,(OFST+1,sp)
4413  0036 97            	ld	xl,a
4414  0037 a624          	ld	a,#36
4415  0039 42            	mul	x,a
4416  003a d6036b        	ld	a,(_sc+624,x)
4417  003d 6b09          	ld	(OFST-46,sp),a
4418                     ; 808 	di.payload[4] =	sc.slc[i].deviceID[3];
4420  003f 7b38          	ld	a,(OFST+1,sp)
4421  0041 97            	ld	xl,a
4422  0042 a624          	ld	a,#36
4423  0044 42            	mul	x,a
4424  0045 d6036c        	ld	a,(_sc+625,x)
4425  0048 6b0a          	ld	(OFST-45,sp),a
4426                     ; 809 	di.payload[5] =	sc.slc[i].model;
4428  004a 7b38          	ld	a,(OFST+1,sp)
4429  004c 97            	ld	xl,a
4430  004d a624          	ld	a,#36
4431  004f 42            	mul	x,a
4432  0050 d6036d        	ld	a,(_sc+626,x)
4433  0053 6b0b          	ld	(OFST-44,sp),a
4434                     ; 810 	di.payload[6] = sc.slc[i].firmware_version;
4436  0055 7b38          	ld	a,(OFST+1,sp)
4437  0057 97            	ld	xl,a
4438  0058 a624          	ld	a,#36
4439  005a 42            	mul	x,a
4440  005b d6036e        	ld	a,(_sc+627,x)
4441  005e 6b0c          	ld	(OFST-43,sp),a
4442                     ; 811 	di.payload[7] = sc.slc[i].HWTtest;
4444  0060 7b38          	ld	a,(OFST+1,sp)
4445  0062 97            	ld	xl,a
4446  0063 a624          	ld	a,#36
4447  0065 42            	mul	x,a
4448  0066 d6038a        	ld	a,(_sc+655,x)
4449  0069 6b0d          	ld	(OFST-42,sp),a
4450                     ; 812 	di.payload[8] = sc.slc[i].MDID;
4452  006b 7b38          	ld	a,(OFST+1,sp)
4453  006d 97            	ld	xl,a
4454  006e a624          	ld	a,#36
4455  0070 42            	mul	x,a
4456  0071 d60383        	ld	a,(_sc+648,x)
4457  0074 6b0e          	ld	(OFST-41,sp),a
4458                     ; 813 	sicp_send_message(&di,9);
4460  0076 4b09          	push	#9
4461  0078 96            	ldw	x,sp
4462  0079 1c0002        	addw	x,#OFST-53
4463  007c cd0000        	call	_sicp_send_message
4465  007f 84            	pop	a
4466                     ; 815 }
4469  0080 5b38          	addw	sp,#56
4470  0082 81            	ret
4518                     ; 818 void send_spc_device_info(u8 i)
4518                     ; 819 {
4519                     .text:	section	.text,new
4520  0000               _send_spc_device_info:
4522  0000 88            	push	a
4523  0001 5237          	subw	sp,#55
4524       00000037      OFST:	set	55
4527                     ; 821 	di.frame_h1 = 0xEE;
4529  0003 a6ee          	ld	a,#238
4530  0005 6b01          	ld	(OFST-54,sp),a
4531                     ; 822 	di.frame_h2 = 0xEE;
4533  0007 a6ee          	ld	a,#238
4534  0009 6b02          	ld	(OFST-53,sp),a
4535                     ; 823 	di.message_id = sicp_get_message_id();
4537  000b cd0000        	call	_sicp_get_message_id
4539  000e 6b03          	ld	(OFST-52,sp),a
4540                     ; 824 	di.mesh_id_H = ns_host_meshid_H;
4542  0010 c600f5        	ld	a,_ns_host_meshid_H
4543  0013 6b04          	ld	(OFST-51,sp),a
4544                     ; 825 	di.mesh_id_L = ns_host_meshid_L;
4546  0015 c600f4        	ld	a,_ns_host_meshid_L
4547  0018 6b05          	ld	(OFST-50,sp),a
4548                     ; 826 	di.payload[0] = 0xB3;
4550  001a a6b3          	ld	a,#179
4551  001c 6b06          	ld	(OFST-49,sp),a
4552                     ; 827 	di.payload[1] =	sc.spc[i].deviceID[0];
4554  001e 7b38          	ld	a,(OFST+1,sp)
4555  0020 97            	ld	xl,a
4556  0021 a627          	ld	a,#39
4557  0023 42            	mul	x,a
4558  0024 d60120        	ld	a,(_sc+37,x)
4559  0027 6b07          	ld	(OFST-48,sp),a
4560                     ; 828 	di.payload[2] =	sc.spc[i].deviceID[1];
4562  0029 7b38          	ld	a,(OFST+1,sp)
4563  002b 97            	ld	xl,a
4564  002c a627          	ld	a,#39
4565  002e 42            	mul	x,a
4566  002f d60121        	ld	a,(_sc+38,x)
4567  0032 6b08          	ld	(OFST-47,sp),a
4568                     ; 829 	di.payload[3] =	sc.spc[i].deviceID[2];
4570  0034 7b38          	ld	a,(OFST+1,sp)
4571  0036 97            	ld	xl,a
4572  0037 a627          	ld	a,#39
4573  0039 42            	mul	x,a
4574  003a d60122        	ld	a,(_sc+39,x)
4575  003d 6b09          	ld	(OFST-46,sp),a
4576                     ; 830 	di.payload[4] =	sc.spc[i].deviceID[3];
4578  003f 7b38          	ld	a,(OFST+1,sp)
4579  0041 97            	ld	xl,a
4580  0042 a627          	ld	a,#39
4581  0044 42            	mul	x,a
4582  0045 d60123        	ld	a,(_sc+40,x)
4583  0048 6b0a          	ld	(OFST-45,sp),a
4584                     ; 831 	di.payload[5] =	sc.spc[i].model;
4586  004a 7b38          	ld	a,(OFST+1,sp)
4587  004c 97            	ld	xl,a
4588  004d a627          	ld	a,#39
4589  004f 42            	mul	x,a
4590  0050 d60124        	ld	a,(_sc+41,x)
4591  0053 6b0b          	ld	(OFST-44,sp),a
4592                     ; 832 	di.payload[6] = sc.spc[i].firmware_version;
4594  0055 7b38          	ld	a,(OFST+1,sp)
4595  0057 97            	ld	xl,a
4596  0058 a627          	ld	a,#39
4597  005a 42            	mul	x,a
4598  005b d60125        	ld	a,(_sc+42,x)
4599  005e 6b0c          	ld	(OFST-43,sp),a
4600                     ; 833 	di.payload[7] = sc.spc[i].HWTtest;
4602  0060 7b38          	ld	a,(OFST+1,sp)
4603  0062 97            	ld	xl,a
4604  0063 a627          	ld	a,#39
4605  0065 42            	mul	x,a
4606  0066 d60144        	ld	a,(_sc+73,x)
4607  0069 6b0d          	ld	(OFST-42,sp),a
4608                     ; 834 	di.payload[8] = sc.spc[i].MDID;
4610  006b 7b38          	ld	a,(OFST+1,sp)
4611  006d 97            	ld	xl,a
4612  006e a627          	ld	a,#39
4613  0070 42            	mul	x,a
4614  0071 d6013a        	ld	a,(_sc+63,x)
4615  0074 6b0e          	ld	(OFST-41,sp),a
4616                     ; 835 	sicp_send_message(&di,9);
4618  0076 4b09          	push	#9
4619  0078 96            	ldw	x,sp
4620  0079 1c0002        	addw	x,#OFST-53
4621  007c cd0000        	call	_sicp_send_message
4623  007f 84            	pop	a
4624                     ; 837 }
4627  0080 5b38          	addw	sp,#56
4628  0082 81            	ret
4665                     ; 840 void send_device_info(void)
4665                     ; 841 {
4666                     .text:	section	.text,new
4667  0000               _send_device_info:
4669  0000 88            	push	a
4670       00000001      OFST:	set	1
4673                     ; 845 	delay(200);
4675  0001 ae00c8        	ldw	x,#200
4676  0004 cd0000        	call	_delay
4678                     ; 847 	for(i = 0; i < 15;i++){
4680  0007 0f01          	clr	(OFST+0,sp)
4681  0009               L7202:
4682                     ; 848 		if(sc.slc[i].MDID){		//MDID不为零说明I2C收到回复
4684  0009 7b01          	ld	a,(OFST+0,sp)
4685  000b 97            	ld	xl,a
4686  000c a624          	ld	a,#36
4687  000e 42            	mul	x,a
4688  000f 724d0383      	tnz	(_sc+648,x)
4689  0013 270b          	jreq	L5302
4690                     ; 849 			send_slc_device_info(i);
4692  0015 7b01          	ld	a,(OFST+0,sp)
4693  0017 cd0000        	call	_send_slc_device_info
4695                     ; 850 			delay(100);
4697  001a ae0064        	ldw	x,#100
4698  001d cd0000        	call	_delay
4700  0020               L5302:
4701                     ; 847 	for(i = 0; i < 15;i++){
4703  0020 0c01          	inc	(OFST+0,sp)
4706  0022 7b01          	ld	a,(OFST+0,sp)
4707  0024 a10f          	cp	a,#15
4708  0026 25e1          	jrult	L7202
4709                     ; 854 	for(i = 0; i < 15;i++){
4711  0028 0f01          	clr	(OFST+0,sp)
4712  002a               L7302:
4713                     ; 855 		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
4715  002a 7b01          	ld	a,(OFST+0,sp)
4716  002c 97            	ld	xl,a
4717  002d a627          	ld	a,#39
4718  002f 42            	mul	x,a
4719  0030 724d013a      	tnz	(_sc+63,x)
4720  0034 270b          	jreq	L5402
4721                     ; 856 			send_spc_device_info(i);
4723  0036 7b01          	ld	a,(OFST+0,sp)
4724  0038 cd0000        	call	_send_spc_device_info
4726                     ; 857 			delay(100);
4728  003b ae0064        	ldw	x,#100
4729  003e cd0000        	call	_delay
4731  0041               L5402:
4732                     ; 854 	for(i = 0; i < 15;i++){
4734  0041 0c01          	inc	(OFST+0,sp)
4737  0043 7b01          	ld	a,(OFST+0,sp)
4738  0045 a10f          	cp	a,#15
4739  0047 25e1          	jrult	L7302
4740                     ; 860 	di_timeout = 5;
4742  0049 35050070      	mov	_di_timeout,#5
4743                     ; 862 }
4746  004d 84            	pop	a
4747  004e 81            	ret
4801                     ; 869 void send_malfunction(u8 mdid, u8 devType)
4801                     ; 870 {
4802                     .text:	section	.text,new
4803  0000               _send_malfunction:
4805  0000 89            	pushw	x
4806  0001 5237          	subw	sp,#55
4807       00000037      OFST:	set	55
4810                     ; 873 	mal.frame_h1 = 0xEE;
4812  0003 a6ee          	ld	a,#238
4813  0005 6b01          	ld	(OFST-54,sp),a
4814                     ; 874 	mal.frame_h2 = 0xEE;
4816  0007 a6ee          	ld	a,#238
4817  0009 6b02          	ld	(OFST-53,sp),a
4818                     ; 875 	mal.message_id = sicp_get_message_id();
4820  000b cd0000        	call	_sicp_get_message_id
4822  000e 6b03          	ld	(OFST-52,sp),a
4823                     ; 876 	mal.mesh_id_H = ns_host_meshid_H;
4825  0010 c600f5        	ld	a,_ns_host_meshid_H
4826  0013 6b04          	ld	(OFST-51,sp),a
4827                     ; 877 	mal.mesh_id_L = ns_host_meshid_L;
4829  0015 c600f4        	ld	a,_ns_host_meshid_L
4830  0018 6b05          	ld	(OFST-50,sp),a
4831                     ; 878 	mal.payload[0] = 0x0A;
4833  001a a60a          	ld	a,#10
4834  001c 6b06          	ld	(OFST-49,sp),a
4835                     ; 879 	mal.payload[1] = devType;
4837  001e 7b39          	ld	a,(OFST+2,sp)
4838  0020 6b07          	ld	(OFST-48,sp),a
4839                     ; 880 	mal.payload[2] = mdid;
4841  0022 7b38          	ld	a,(OFST+1,sp)
4842  0024 6b08          	ld	(OFST-47,sp),a
4843                     ; 882 	if(devType == DEVICE_SC){
4845  0026 7b39          	ld	a,(OFST+2,sp)
4846  0028 a1b1          	cp	a,#177
4847  002a 260c          	jrne	L1702
4848                     ; 883 		mal.payload[3] = sc.HWTtest;
4850  002c c60117        	ld	a,_sc+28
4851  002f 6b09          	ld	(OFST-46,sp),a
4852                     ; 884 		sc.malfunction_msgid = mal.message_id;		
4854  0031 7b03          	ld	a,(OFST-52,sp)
4855  0033 c70118        	ld	_sc+29,a
4857  0036 2040          	jra	L3702
4858  0038               L1702:
4859                     ; 886 	}else if(devType == DEVICE_SLC){
4861  0038 7b39          	ld	a,(OFST+2,sp)
4862  003a a1b2          	cp	a,#178
4863  003c 261e          	jrne	L5702
4864                     ; 887 		mal.payload[3] = sc.slc[mdid -1].HWTtest;
4866  003e 7b38          	ld	a,(OFST+1,sp)
4867  0040 97            	ld	xl,a
4868  0041 a624          	ld	a,#36
4869  0043 42            	mul	x,a
4870  0044 1d0024        	subw	x,#36
4871  0047 d6038a        	ld	a,(_sc+655,x)
4872  004a 6b09          	ld	(OFST-46,sp),a
4873                     ; 888 		sc.slc[mdid - 1].malfunction_msgid = mal.message_id;
4875  004c 7b38          	ld	a,(OFST+1,sp)
4876  004e 97            	ld	xl,a
4877  004f a624          	ld	a,#36
4878  0051 42            	mul	x,a
4879  0052 1d0024        	subw	x,#36
4880  0055 7b03          	ld	a,(OFST-52,sp)
4881  0057 d70388        	ld	(_sc+653,x),a
4883  005a 201c          	jra	L3702
4884  005c               L5702:
4885                     ; 891 		mal.payload[3] = sc.spc[mdid -1].HWTtest;
4887  005c 7b38          	ld	a,(OFST+1,sp)
4888  005e 97            	ld	xl,a
4889  005f a627          	ld	a,#39
4890  0061 42            	mul	x,a
4891  0062 1d0027        	subw	x,#39
4892  0065 d60144        	ld	a,(_sc+73,x)
4893  0068 6b09          	ld	(OFST-46,sp),a
4894                     ; 892 		sc.spc[mdid -1].malfunction_msgid = mal.message_id;
4896  006a 7b38          	ld	a,(OFST+1,sp)
4897  006c 97            	ld	xl,a
4898  006d a627          	ld	a,#39
4899  006f 42            	mul	x,a
4900  0070 1d0027        	subw	x,#39
4901  0073 7b03          	ld	a,(OFST-52,sp)
4902  0075 d7013f        	ld	(_sc+68,x),a
4903  0078               L3702:
4904                     ; 895 	sicp_send_message(&mal, 4);
4906  0078 4b04          	push	#4
4907  007a 96            	ldw	x,sp
4908  007b 1c0002        	addw	x,#OFST-53
4909  007e cd0000        	call	_sicp_send_message
4911  0081 84            	pop	a
4912                     ; 897 }
4915  0082 5b39          	addw	sp,#57
4916  0084 81            	ret
4957                     ; 904 void malfunction_sended_confirm(u8 recvMsgid)
4957                     ; 905 {
4958                     .text:	section	.text,new
4959  0000               _malfunction_sended_confirm:
4961  0000 88            	push	a
4962  0001 88            	push	a
4963       00000001      OFST:	set	1
4966                     ; 908 	if(recvMsgid > 0){
4968  0002 4d            	tnz	a
4969  0003 2745          	jreq	L7112
4970                     ; 910 		if(sc.malfunction_msgid == recvMsgid){		/* SC */
4972  0005 c60118        	ld	a,_sc+29
4973  0008 1102          	cp	a,(OFST+1,sp)
4974  000a 2606          	jrne	L1212
4975                     ; 911 			sc.malfunction_msgid = 0;
4977  000c 725f0118      	clr	_sc+29
4979  0010 2038          	jra	L7112
4980  0012               L1212:
4981                     ; 915 			for(i = 0; i < 15; i++){
4983  0012 0f01          	clr	(OFST+0,sp)
4984  0014               L5212:
4985                     ; 917 				if(sc.slc[i].malfunction_msgid == recvMsgid){ 
4987  0014 7b01          	ld	a,(OFST+0,sp)
4988  0016 97            	ld	xl,a
4989  0017 a624          	ld	a,#36
4990  0019 42            	mul	x,a
4991  001a d60388        	ld	a,(_sc+653,x)
4992  001d 1102          	cp	a,(OFST+1,sp)
4993  001f 260a          	jrne	L3312
4994                     ; 918 					sc.slc[i].malfunction_msgid = 0;
4996  0021 7b01          	ld	a,(OFST+0,sp)
4997  0023 97            	ld	xl,a
4998  0024 a624          	ld	a,#36
4999  0026 42            	mul	x,a
5000  0027 724f0388      	clr	(_sc+653,x)
5001  002b               L3312:
5002                     ; 921 				if(sc.spc[i].malfunction_msgid == recvMsgid){ 
5004  002b 7b01          	ld	a,(OFST+0,sp)
5005  002d 97            	ld	xl,a
5006  002e a627          	ld	a,#39
5007  0030 42            	mul	x,a
5008  0031 d6013f        	ld	a,(_sc+68,x)
5009  0034 1102          	cp	a,(OFST+1,sp)
5010  0036 260a          	jrne	L5312
5011                     ; 922 					sc.spc[i].malfunction_msgid = 0;
5013  0038 7b01          	ld	a,(OFST+0,sp)
5014  003a 97            	ld	xl,a
5015  003b a627          	ld	a,#39
5016  003d 42            	mul	x,a
5017  003e 724f013f      	clr	(_sc+68,x)
5018  0042               L5312:
5019                     ; 915 			for(i = 0; i < 15; i++){
5021  0042 0c01          	inc	(OFST+0,sp)
5024  0044 7b01          	ld	a,(OFST+0,sp)
5025  0046 a10f          	cp	a,#15
5026  0048 25ca          	jrult	L5212
5027  004a               L7112:
5028                     ; 930 }
5031  004a 85            	popw	x
5032  004b 81            	ret
5035                     	switch	.data
5036  000f               L7312_sc_HWTest:
5037  000f 00            	dc.b	0
5038  0010               L1412_slcspc_HWTest:
5039  0010 00            	dc.b	0
5040  0011 000000000000  	ds.b	14
5041  001f               L3412_i:
5042  001f 00            	dc.b	0
5043  0020               L5412_j:
5044  0020 00            	dc.b	0
5100                     ; 937 void malfunction_detect(void)
5100                     ; 938 {
5101                     .text:	section	.text,new
5102  0000               _malfunction_detect:
5104  0000 88            	push	a
5105       00000001      OFST:	set	1
5108                     ; 945 	if(sc.HWTtest != sc_HWTest){		/* SC */
5110  0001 c60117        	ld	a,_sc+28
5111  0004 c1000f        	cp	a,L7312_sc_HWTest
5112  0007 2603          	jrne	L012
5113  0009 cc00ab        	jp	L1022
5114  000c               L012:
5115                     ; 946 		sc_HWTest = sc.HWTtest;
5117  000c 550117000f    	mov	L7312_sc_HWTest,_sc+28
5118                     ; 947 		send_malfunction(0, DEVICE_SC);
5120  0011 ae00b1        	ldw	x,#177
5121  0014 4f            	clr	a
5122  0015 95            	ld	xh,a
5123  0016 cd0000        	call	_send_malfunction
5125                     ; 948 		return;
5128  0019 84            	pop	a
5129  001a 81            	ret
5130  001b               L5712:
5131                     ; 953 		if(sc.slc[i].MDID){	
5133  001b c6001f        	ld	a,L3412_i
5134  001e 97            	ld	xl,a
5135  001f a624          	ld	a,#36
5136  0021 42            	mul	x,a
5137  0022 724d0383      	tnz	(_sc+648,x)
5138  0026 2739          	jreq	L5022
5139                     ; 954 			if(sc.slc[i].HWTtest != slcspc_HWTest[i]){
5141  0028 c6001f        	ld	a,L3412_i
5142  002b 5f            	clrw	x
5143  002c 97            	ld	xl,a
5144  002d d60010        	ld	a,(L1412_slcspc_HWTest,x)
5145  0030 6b01          	ld	(OFST+0,sp),a
5146  0032 c6001f        	ld	a,L3412_i
5147  0035 97            	ld	xl,a
5148  0036 a624          	ld	a,#36
5149  0038 42            	mul	x,a
5150  0039 d6038a        	ld	a,(_sc+655,x)
5151  003c 1101          	cp	a,(OFST+0,sp)
5152  003e 2721          	jreq	L5022
5153                     ; 955 				slcspc_HWTest[i] = sc.slc[i].HWTtest;		/* 保证故障不会被重复发送 */
5155  0040 c6001f        	ld	a,L3412_i
5156  0043 5f            	clrw	x
5157  0044 97            	ld	xl,a
5158  0045 89            	pushw	x
5159  0046 c6001f        	ld	a,L3412_i
5160  0049 97            	ld	xl,a
5161  004a a624          	ld	a,#36
5162  004c 42            	mul	x,a
5163  004d d6038a        	ld	a,(_sc+655,x)
5164  0050 85            	popw	x
5165  0051 d70010        	ld	(L1412_slcspc_HWTest,x),a
5166                     ; 956 				send_malfunction(i + 1, DEVICE_SLC);	
5168  0054 ae00b2        	ldw	x,#178
5169  0057 c6001f        	ld	a,L3412_i
5170  005a 4c            	inc	a
5171  005b 95            	ld	xh,a
5172  005c cd0000        	call	_send_malfunction
5174                     ; 957 				return;
5177  005f 84            	pop	a
5178  0060 81            	ret
5179  0061               L5022:
5180                     ; 960 		if(sc.spc[i].MDID){ 
5182  0061 c6001f        	ld	a,L3412_i
5183  0064 97            	ld	xl,a
5184  0065 a627          	ld	a,#39
5185  0067 42            	mul	x,a
5186  0068 724d013a      	tnz	(_sc+63,x)
5187  006c 2739          	jreq	L1122
5188                     ; 961 			if(sc.spc[i].HWTtest != slcspc_HWTest[i]){		
5190  006e c6001f        	ld	a,L3412_i
5191  0071 5f            	clrw	x
5192  0072 97            	ld	xl,a
5193  0073 d60010        	ld	a,(L1412_slcspc_HWTest,x)
5194  0076 6b01          	ld	(OFST+0,sp),a
5195  0078 c6001f        	ld	a,L3412_i
5196  007b 97            	ld	xl,a
5197  007c a627          	ld	a,#39
5198  007e 42            	mul	x,a
5199  007f d60144        	ld	a,(_sc+73,x)
5200  0082 1101          	cp	a,(OFST+0,sp)
5201  0084 2721          	jreq	L1122
5202                     ; 962 				slcspc_HWTest[i] = sc.spc[i].HWTtest;
5204  0086 c6001f        	ld	a,L3412_i
5205  0089 5f            	clrw	x
5206  008a 97            	ld	xl,a
5207  008b 89            	pushw	x
5208  008c c6001f        	ld	a,L3412_i
5209  008f 97            	ld	xl,a
5210  0090 a627          	ld	a,#39
5211  0092 42            	mul	x,a
5212  0093 d60144        	ld	a,(_sc+73,x)
5213  0096 85            	popw	x
5214  0097 d70010        	ld	(L1412_slcspc_HWTest,x),a
5215                     ; 963 				send_malfunction(i + 1, DEVICE_SPC);					
5217  009a ae00b3        	ldw	x,#179
5218  009d c6001f        	ld	a,L3412_i
5219  00a0 4c            	inc	a
5220  00a1 95            	ld	xh,a
5221  00a2 cd0000        	call	_send_malfunction
5223                     ; 964 				return;
5226  00a5 84            	pop	a
5227  00a6 81            	ret
5228  00a7               L1122:
5229                     ; 951 	for( ; i < 15; i++){
5231  00a7 725c001f      	inc	L3412_i
5232  00ab               L1022:
5235  00ab c6001f        	ld	a,L3412_i
5236  00ae a10f          	cp	a,#15
5237  00b0 2403          	jruge	L212
5238  00b2 cc001b        	jp	L5712
5239  00b5               L212:
5240                     ; 968 	i = 0;
5242  00b5 725f001f      	clr	L3412_i
5243                     ; 972 	if(sc.malfunction_msgid){			/* 没收到回执 */		
5245  00b9 725d0118      	tnz	_sc+29
5246  00bd 2762          	jreq	L3222
5247                     ; 973 		send_malfunction(0, DEVICE_SC);		
5249  00bf ae00b1        	ldw	x,#177
5250  00c2 4f            	clr	a
5251  00c3 95            	ld	xh,a
5252  00c4 cd0000        	call	_send_malfunction
5254                     ; 974 		return;
5257  00c7 84            	pop	a
5258  00c8 81            	ret
5259  00c9               L7122:
5260                     ; 979 		if(sc.slc[j].MDID && sc.slc[j].malfunction_msgid){		/* 没收到回执 */		
5262  00c9 c60020        	ld	a,L5412_j
5263  00cc 97            	ld	xl,a
5264  00cd a624          	ld	a,#36
5265  00cf 42            	mul	x,a
5266  00d0 724d0383      	tnz	(_sc+648,x)
5267  00d4 271d          	jreq	L7222
5269  00d6 c60020        	ld	a,L5412_j
5270  00d9 97            	ld	xl,a
5271  00da a624          	ld	a,#36
5272  00dc 42            	mul	x,a
5273  00dd 724d0388      	tnz	(_sc+653,x)
5274  00e1 2710          	jreq	L7222
5275                     ; 980 			j++;									/* 保证故障不会被重复发送 */
5277  00e3 725c0020      	inc	L5412_j
5278                     ; 981 			send_malfunction(j, DEVICE_SLC);					
5280  00e7 ae00b2        	ldw	x,#178
5281  00ea c60020        	ld	a,L5412_j
5282  00ed 95            	ld	xh,a
5283  00ee cd0000        	call	_send_malfunction
5285                     ; 982 			return;
5288  00f1 84            	pop	a
5289  00f2 81            	ret
5290  00f3               L7222:
5291                     ; 984 		if(sc.spc[j].MDID && sc.spc[j].malfunction_msgid){		/* 没收到回执 */	
5293  00f3 c60020        	ld	a,L5412_j
5294  00f6 97            	ld	xl,a
5295  00f7 a627          	ld	a,#39
5296  00f9 42            	mul	x,a
5297  00fa 724d013a      	tnz	(_sc+63,x)
5298  00fe 271d          	jreq	L1322
5300  0100 c60020        	ld	a,L5412_j
5301  0103 97            	ld	xl,a
5302  0104 a627          	ld	a,#39
5303  0106 42            	mul	x,a
5304  0107 724d013f      	tnz	(_sc+68,x)
5305  010b 2710          	jreq	L1322
5306                     ; 985 			j++;									/* 保证故障不会被重复发送 */
5308  010d 725c0020      	inc	L5412_j
5309                     ; 986 			send_malfunction(j, DEVICE_SPC);					
5311  0111 ae00b3        	ldw	x,#179
5312  0114 c60020        	ld	a,L5412_j
5313  0117 95            	ld	xh,a
5314  0118 cd0000        	call	_send_malfunction
5316                     ; 987 			return;
5319  011b 84            	pop	a
5320  011c 81            	ret
5321  011d               L1322:
5322                     ; 977 	for( ; j < 15; j++){
5324  011d 725c0020      	inc	L5412_j
5325  0121               L3222:
5328  0121 c60020        	ld	a,L5412_j
5329  0124 a10f          	cp	a,#15
5330  0126 25a1          	jrult	L7122
5331                     ; 990 	j = 0;
5333  0128 725f0020      	clr	L5412_j
5334                     ; 992 }
5337  012c 84            	pop	a
5338  012d 81            	ret
5394                     ; 1001 u8 slcspc_check_sum(u8 *buf, u8 length)
5394                     ; 1002 {
5395                     .text:	section	.text,new
5396  0000               _slcspc_check_sum:
5398  0000 89            	pushw	x
5399  0001 89            	pushw	x
5400       00000002      OFST:	set	2
5403                     ; 1004 	u8 result = *buf++;
5405  0002 1e03          	ldw	x,(OFST+1,sp)
5406  0004 1c0001        	addw	x,#1
5407  0007 1f03          	ldw	(OFST+1,sp),x
5408  0009 1d0001        	subw	x,#1
5409  000c f6            	ld	a,(x)
5410  000d 6b01          	ld	(OFST-1,sp),a
5411                     ; 1006 	for(i = 1; i < length; i++)
5413  000f a601          	ld	a,#1
5414  0011 6b02          	ld	(OFST+0,sp),a
5416  0013 2011          	jra	L3622
5417  0015               L7522:
5418                     ; 1008 		result ^= *buf++;
5420  0015 1e03          	ldw	x,(OFST+1,sp)
5421  0017 1c0001        	addw	x,#1
5422  001a 1f03          	ldw	(OFST+1,sp),x
5423  001c 1d0001        	subw	x,#1
5424  001f 7b01          	ld	a,(OFST-1,sp)
5425  0021 f8            	xor	a,	(x)
5426  0022 6b01          	ld	(OFST-1,sp),a
5427                     ; 1006 	for(i = 1; i < length; i++)
5429  0024 0c02          	inc	(OFST+0,sp)
5430  0026               L3622:
5433  0026 7b02          	ld	a,(OFST+0,sp)
5434  0028 1107          	cp	a,(OFST+5,sp)
5435  002a 25e9          	jrult	L7522
5436                     ; 1011 	return result;
5438  002c 7b01          	ld	a,(OFST-1,sp)
5441  002e 5b04          	addw	sp,#4
5442  0030 81            	ret
5476                     ; 1017 void slcspc_send_and_recv(void)
5476                     ; 1018 {
5477                     .text:	section	.text,new
5478  0000               _slcspc_send_and_recv:
5480  0000 88            	push	a
5481       00000001      OFST:	set	1
5484                     ; 1019 	u8 status = 0;
5486  0001 0f01          	clr	(OFST+0,sp)
5487                     ; 1021 	swuart_frame.rxhas = 0;
5489  0003 5f            	clrw	x
5490  0004 cf0015        	ldw	_swuart_frame+6,x
5491                     ; 1022 	swuart_frame.rxlen = 0;
5493  0007 5f            	clrw	x
5494  0008 cf0013        	ldw	_swuart_frame+4,x
5495                     ; 1024 	swuart_frame.txhas = 1;
5497  000b ae0001        	ldw	x,#1
5498  000e cf001b        	ldw	_swuart_frame+12,x
5499                     ; 1025 	UART3->DR = swuart_frame.txbuf[0];
5501  0011 5500475241    	mov	21057,_swuart_frame+56
5503  0016               L7032:
5504                     ; 1027 	while(swuart_frame.txhas < swuart_frame.txlen);	/* 等待发送完成 */
5506  0016 ce001b        	ldw	x,_swuart_frame+12
5507  0019 c30019        	cpw	x,_swuart_frame+10
5508  001c 25f8          	jrult	L7032
5509                     ; 1029 	swuart_frame.txhas = 0;
5511  001e 5f            	clrw	x
5512  001f cf001b        	ldw	_swuart_frame+12,x
5513                     ; 1030 	swuart_frame.txlen = 0;
5515  0022 5f            	clrw	x
5516  0023 cf0019        	ldw	_swuart_frame+10,x
5517                     ; 1033 	swuart_frame.rxtxflag = 2;
5519  0026 3502000f      	mov	_swuart_frame,#2
5520                     ; 1034 	swuart_frame.flow  = 2;
5522  002a 35020010      	mov	_swuart_frame+1,#2
5523                     ; 1035 	swuart_frame.rxhas = 0;
5525  002e 5f            	clrw	x
5526  002f cf0015        	ldw	_swuart_frame+6,x
5527                     ; 1036 	swuart_frame.rxlen = 0;
5529  0032 5f            	clrw	x
5530  0033 cf0013        	ldw	_swuart_frame+4,x
5531                     ; 1037 	swuart_frame.txOverWait = 0;	
5533  0036 5f            	clrw	x
5534  0037 cf001d        	ldw	_swuart_frame+14,x
5536  003a 200e          	jra	L7132
5537  003c               L3132:
5538                     ; 1041 		if(swuart_frame.txOverWait > SWUART_TX_OVER_WAIT_TIME){
5540  003c ce001d        	ldw	x,_swuart_frame+14
5541  003f a3001f        	cpw	x,#31
5542  0042 2506          	jrult	L7132
5543                     ; 1042 			swuart_frame.rxtxflag = 0;			/* 超时，结束接收  */
5545  0044 725f000f      	clr	_swuart_frame
5546                     ; 1043 			return;
5549  0048 84            	pop	a
5550  0049 81            	ret
5551  004a               L7132:
5552                     ; 1040 	while(swuart_frame.flow == 2){
5554  004a c60010        	ld	a,_swuart_frame+1
5555  004d a102          	cp	a,#2
5556  004f 27eb          	jreq	L3132
5558  0051 2010          	jra	L7232
5559  0053               L5232:
5560                     ; 1049 		if(swuart_frame.rxOverWait > SWUART_RX_OVER_WAIT_TIME){
5562  0053 ce0017        	ldw	x,_swuart_frame+8
5563  0056 a30007        	cpw	x,#7
5564  0059 2508          	jrult	L7232
5565                     ; 1050 			swuart_frame.flow = 4;				/* 接收完成 */
5567  005b 35040010      	mov	_swuart_frame+1,#4
5568                     ; 1051 			swuart_frame.rxtxflag = 0;	
5570  005f 725f000f      	clr	_swuart_frame
5571  0063               L7232:
5572                     ; 1048 	while(swuart_frame.flow == 3){
5574  0063 c60010        	ld	a,_swuart_frame+1
5575  0066 a103          	cp	a,#3
5576  0068 27e9          	jreq	L5232
5577                     ; 1055 }
5580  006a 84            	pop	a
5581  006b 81            	ret
5684                     ; 1063 u8 slcspc_one_process(I2C_Message *tx, u8 payload_len, u8 addr)
5684                     ; 1064 {
5685                     .text:	section	.text,new
5686  0000               _slcspc_one_process:
5688  0000 89            	pushw	x
5689  0001 88            	push	a
5690       00000001      OFST:	set	1
5693                     ; 1065 	u8 i = addr - 1;
5695  0002 7b07          	ld	a,(OFST+6,sp)
5696  0004 4a            	dec	a
5697  0005 6b01          	ld	(OFST+0,sp),a
5698                     ; 1067 	swuart_frame.txbuf[0] = tx->frame_h1;	//0x7e
5700  0007 f6            	ld	a,(x)
5701  0008 c70047        	ld	_swuart_frame+56,a
5702                     ; 1068 	swuart_frame.txbuf[1] = tx->frame_h2;	//0x7e
5704  000b e601          	ld	a,(1,x)
5705  000d c70048        	ld	_swuart_frame+57,a
5706                     ; 1069 	swuart_frame.txbuf[2] = addr;			//addr
5708  0010 7b07          	ld	a,(OFST+6,sp)
5709  0012 c70049        	ld	_swuart_frame+58,a
5710                     ; 1070 	swuart_frame.txbuf[3] = tx->message_id;	//msg id
5712  0015 e602          	ld	a,(2,x)
5713  0017 c7004a        	ld	_swuart_frame+59,a
5714                     ; 1071 	swuart_frame.txbuf[4] = payload_len + 3;			//len
5716  001a 7b06          	ld	a,(OFST+5,sp)
5717  001c ab03          	add	a,#3
5718  001e c7004b        	ld	_swuart_frame+60,a
5719                     ; 1072 	mymemcpy(&swuart_frame.txbuf[5], tx->payload, payload_len);
5721  0021 7b06          	ld	a,(OFST+5,sp)
5722  0023 b703          	ld	c_lreg+3,a
5723  0025 3f02          	clr	c_lreg+2
5724  0027 3f01          	clr	c_lreg+1
5725  0029 3f00          	clr	c_lreg
5726  002b be02          	ldw	x,c_lreg+2
5727  002d 89            	pushw	x
5728  002e be00          	ldw	x,c_lreg
5729  0030 89            	pushw	x
5730  0031 1e06          	ldw	x,(OFST+5,sp)
5731  0033 1c0003        	addw	x,#3
5732  0036 89            	pushw	x
5733  0037 ae004c        	ldw	x,#_swuart_frame+61
5734  003a cd0000        	call	_mymemcpy
5736  003d 5b06          	addw	sp,#6
5737                     ; 1073 	swuart_frame.txbuf[payload_len + 5] = Check_Sum(&swuart_frame.txbuf[2], swuart_frame.txbuf[4]);
5739  003f 7b06          	ld	a,(OFST+5,sp)
5740  0041 5f            	clrw	x
5741  0042 97            	ld	xl,a
5742  0043 89            	pushw	x
5743  0044 3b004b        	push	_swuart_frame+60
5744  0047 ae0049        	ldw	x,#_swuart_frame+58
5745  004a cd0000        	call	_Check_Sum
5747  004d 5b01          	addw	sp,#1
5748  004f 85            	popw	x
5749  0050 d7004c        	ld	(_swuart_frame+61,x),a
5750                     ; 1075 	swuart_frame.txhas = 0;
5752  0053 5f            	clrw	x
5753  0054 cf001b        	ldw	_swuart_frame+12,x
5754                     ; 1076 	swuart_frame.txlen = payload_len + 6;
5756  0057 a600          	ld	a,#0
5757  0059 97            	ld	xl,a
5758  005a a606          	ld	a,#6
5759  005c 1b06          	add	a,(OFST+5,sp)
5760  005e 2401          	jrnc	L222
5761  0060 5c            	incw	x
5762  0061               L222:
5763  0061 c7001a        	ld	_swuart_frame+11,a
5764  0064 9f            	ld	a,xl
5765  0065 c70019        	ld	_swuart_frame+10,a
5766                     ; 1077 	swuart_frame.rxtxflag = 1;
5768  0068 3501000f      	mov	_swuart_frame,#1
5769                     ; 1078 	swuart_frame.flow = 0;
5771  006c 725f0010      	clr	_swuart_frame+1
5772                     ; 1079 	swuart_frame.rxbuf[0] = 0;
5774  0070 725f001f      	clr	_swuart_frame+16
5775                     ; 1080 	swuart_frame.rxbuf[1] = 0;
5777  0074 725f0020      	clr	_swuart_frame+17
5778                     ; 1082 	slcspc_select_channel(addr);
5780  0078 7b07          	ld	a,(OFST+6,sp)
5781  007a cd0000        	call	_slcspc_select_channel
5783                     ; 1083 	slcspc_send_and_recv();			/* 等待发送接收流程处理结束 */
5785  007d cd0000        	call	_slcspc_send_and_recv
5787                     ; 1084 	slcspc_select_channel_reset();
5789  0080 cd0000        	call	_slcspc_select_channel_reset
5791                     ; 1086 	if(swuart_frame.flow == 4){		/* 接收完成 */	
5793  0083 c60010        	ld	a,_swuart_frame+1
5794  0086 a104          	cp	a,#4
5795  0088 266d          	jrne	L1042
5796                     ; 1087 		if(swuart_frame.rxbuf[0] == 0x7e && swuart_frame.rxbuf[1] == 0x7e){
5798  008a c6001f        	ld	a,_swuart_frame+16
5799  008d a17e          	cp	a,#126
5800  008f 2666          	jrne	L1042
5802  0091 c60020        	ld	a,_swuart_frame+17
5803  0094 a17e          	cp	a,#126
5804  0096 265f          	jrne	L1042
5805                     ; 1088 			if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){//校验正确
5807  0098 3b0023        	push	_swuart_frame+20
5808  009b ae0021        	ldw	x,#_swuart_frame+18
5809  009e cd0000        	call	_Check_Sum
5811  00a1 5b01          	addw	sp,#1
5812  00a3 ce0015        	ldw	x,_swuart_frame+6
5813  00a6 5a            	decw	x
5814  00a7 d1001f        	cp	a,(_swuart_frame+16,x)
5815  00aa 264b          	jrne	L1042
5816                     ; 1090 				if(sc.slc[i].MDID){ 		/* slc */
5818  00ac 7b01          	ld	a,(OFST+0,sp)
5819  00ae 97            	ld	xl,a
5820  00af a624          	ld	a,#36
5821  00b1 42            	mul	x,a
5822  00b2 724d0383      	tnz	(_sc+648,x)
5823  00b6 2718          	jreq	L7042
5824                     ; 1091 					sc.slc[i].offLineCnt = 0;
5826  00b8 7b01          	ld	a,(OFST+0,sp)
5827  00ba 97            	ld	xl,a
5828  00bb a624          	ld	a,#36
5829  00bd 42            	mul	x,a
5830  00be 724f038b      	clr	(_sc+656,x)
5831                     ; 1092 					sc.slc[i].HWTtest &= ~SLCSPC_OFFLINE_BIT;
5833  00c2 7b01          	ld	a,(OFST+0,sp)
5834  00c4 97            	ld	xl,a
5835  00c5 a624          	ld	a,#36
5836  00c7 42            	mul	x,a
5837  00c8 d6038a        	ld	a,(_sc+655,x)
5838  00cb a4fe          	and	a,#254
5839  00cd d7038a        	ld	(_sc+655,x),a
5840  00d0               L7042:
5841                     ; 1094 				if(sc.spc[i].MDID){		/* spc */
5843  00d0 7b01          	ld	a,(OFST+0,sp)
5844  00d2 97            	ld	xl,a
5845  00d3 a627          	ld	a,#39
5846  00d5 42            	mul	x,a
5847  00d6 724d013a      	tnz	(_sc+63,x)
5848  00da 2718          	jreq	L1142
5849                     ; 1095 					sc.spc[i].offLineCnt = 0;
5851  00dc 7b01          	ld	a,(OFST+0,sp)
5852  00de 97            	ld	xl,a
5853  00df a627          	ld	a,#39
5854  00e1 42            	mul	x,a
5855  00e2 724f0145      	clr	(_sc+74,x)
5856                     ; 1096 					sc.spc[i].HWTtest &= ~SLCSPC_OFFLINE_BIT;
5858  00e6 7b01          	ld	a,(OFST+0,sp)
5859  00e8 97            	ld	xl,a
5860  00e9 a627          	ld	a,#39
5861  00eb 42            	mul	x,a
5862  00ec d60144        	ld	a,(_sc+73,x)
5863  00ef a4fe          	and	a,#254
5864  00f1 d70144        	ld	(_sc+73,x),a
5865  00f4               L1142:
5866                     ; 1099 				return 0;
5868  00f4 4f            	clr	a
5870  00f5 2064          	jra	L422
5871  00f7               L1042:
5872                     ; 1104 	if(sc.slc[i].MDID){			/* slc */
5874  00f7 7b01          	ld	a,(OFST+0,sp)
5875  00f9 97            	ld	xl,a
5876  00fa a624          	ld	a,#36
5877  00fc 42            	mul	x,a
5878  00fd 724d0383      	tnz	(_sc+648,x)
5879  0101 2725          	jreq	L3142
5880                     ; 1105 		sc.slc[i].offLineCnt++;
5882  0103 7b01          	ld	a,(OFST+0,sp)
5883  0105 97            	ld	xl,a
5884  0106 a624          	ld	a,#36
5885  0108 42            	mul	x,a
5886  0109 724c038b      	inc	(_sc+656,x)
5887                     ; 1106 		if(sc.slc[i].offLineCnt >= 5){sc.slc[i].HWTtest |= SLCSPC_OFFLINE_BIT;} 		/* 连续5次不通讯都不成功，则判断为离线 */
5889  010d 7b01          	ld	a,(OFST+0,sp)
5890  010f 97            	ld	xl,a
5891  0110 a624          	ld	a,#36
5892  0112 42            	mul	x,a
5893  0113 d6038b        	ld	a,(_sc+656,x)
5894  0116 a105          	cp	a,#5
5895  0118 250e          	jrult	L3142
5898  011a 7b01          	ld	a,(OFST+0,sp)
5899  011c 97            	ld	xl,a
5900  011d a624          	ld	a,#36
5901  011f 42            	mul	x,a
5902  0120 d6038a        	ld	a,(_sc+655,x)
5903  0123 aa01          	or	a,#1
5904  0125 d7038a        	ld	(_sc+655,x),a
5905  0128               L3142:
5906                     ; 1108 	if(sc.spc[i].MDID){			/* spc */
5908  0128 7b01          	ld	a,(OFST+0,sp)
5909  012a 97            	ld	xl,a
5910  012b a627          	ld	a,#39
5911  012d 42            	mul	x,a
5912  012e 724d013a      	tnz	(_sc+63,x)
5913  0132 2725          	jreq	L7142
5914                     ; 1109 		sc.spc[i].offLineCnt++;
5916  0134 7b01          	ld	a,(OFST+0,sp)
5917  0136 97            	ld	xl,a
5918  0137 a627          	ld	a,#39
5919  0139 42            	mul	x,a
5920  013a 724c0145      	inc	(_sc+74,x)
5921                     ; 1110 		if(sc.spc[i].offLineCnt >= 5){sc.spc[i].HWTtest |= SLCSPC_OFFLINE_BIT;} 		/* 连续5次不通讯都不成功，则判断为离线 */
5923  013e 7b01          	ld	a,(OFST+0,sp)
5924  0140 97            	ld	xl,a
5925  0141 a627          	ld	a,#39
5926  0143 42            	mul	x,a
5927  0144 d60145        	ld	a,(_sc+74,x)
5928  0147 a105          	cp	a,#5
5929  0149 250e          	jrult	L7142
5932  014b 7b01          	ld	a,(OFST+0,sp)
5933  014d 97            	ld	xl,a
5934  014e a627          	ld	a,#39
5935  0150 42            	mul	x,a
5936  0151 d60144        	ld	a,(_sc+73,x)
5937  0154 aa01          	or	a,#1
5938  0156 d70144        	ld	(_sc+73,x),a
5939  0159               L7142:
5940                     ; 1113 	return 1; 
5942  0159 a601          	ld	a,#1
5944  015b               L422:
5946  015b 5b03          	addw	sp,#3
5947  015d 81            	ret
6000                     ; 1122 void slcspc_device_info(void)
6000                     ; 1123 {
6001                     .text:	section	.text,new
6002  0000               _slcspc_device_info:
6004  0000 5223          	subw	sp,#35
6005       00000023      OFST:	set	35
6008                     ; 1127 	swuart_frame.devflag = 0;
6010  0002 5f            	clrw	x
6011  0003 cf0011        	ldw	_swuart_frame+2,x
6012                     ; 1129 	for(i = 1; i <= 15; i++){
6014  0006 a601          	ld	a,#1
6015  0008 6b23          	ld	(OFST+0,sp),a
6016  000a               L5442:
6017                     ; 1131 		di.frame_h1 = 0x7E;
6019  000a a67e          	ld	a,#126
6020  000c 6b02          	ld	(OFST-33,sp),a
6021                     ; 1132 		di.frame_h2 = 0x7E;
6023  000e a67e          	ld	a,#126
6024  0010 6b03          	ld	(OFST-32,sp),a
6025                     ; 1133 		di.message_id = slcspc_get_message_id();
6027  0012 cd0000        	call	_slcspc_get_message_id
6029  0015 6b04          	ld	(OFST-31,sp),a
6030                     ; 1134 		di.payload[0] = 0xFE;		//自己定义
6032  0017 a6fe          	ld	a,#254
6033  0019 6b05          	ld	(OFST-30,sp),a
6034                     ; 1135 		di.payload[1] = 0x01;		//自己定义
6036  001b a601          	ld	a,#1
6037  001d 6b06          	ld	(OFST-29,sp),a
6038                     ; 1137 		sc.slc[i -1].MDID = 0;
6040  001f 7b23          	ld	a,(OFST+0,sp)
6041  0021 97            	ld	xl,a
6042  0022 a624          	ld	a,#36
6043  0024 42            	mul	x,a
6044  0025 1d0024        	subw	x,#36
6045  0028 724f0383      	clr	(_sc+648,x)
6046                     ; 1138 		sc.spc[i -1].MDID = 0;
6048  002c 7b23          	ld	a,(OFST+0,sp)
6049  002e 97            	ld	xl,a
6050  002f a627          	ld	a,#39
6051  0031 42            	mul	x,a
6052  0032 1d0027        	subw	x,#39
6053  0035 724f013a      	clr	(_sc+63,x)
6054                     ; 1139 		ret = slcspc_one_process(&di, 2, i);
6056  0039 7b23          	ld	a,(OFST+0,sp)
6057  003b 88            	push	a
6058  003c 4b02          	push	#2
6059  003e 96            	ldw	x,sp
6060  003f 1c0004        	addw	x,#OFST-31
6061  0042 cd0000        	call	_slcspc_one_process
6063  0045 85            	popw	x
6064  0046 6b01          	ld	(OFST-34,sp),a
6065                     ; 1141 		if (ret == 0){
6067  0048 0d01          	tnz	(OFST-34,sp)
6068  004a 2703          	jreq	L432
6069  004c cc0164        	jp	L3542
6070  004f               L432:
6071                     ; 1145 				swuart_frame.devflag |= (1 << ( i -1));
6073  004f ae0001        	ldw	x,#1
6074  0052 7b23          	ld	a,(OFST+0,sp)
6075  0054 4a            	dec	a
6076  0055 4d            	tnz	a
6077  0056 2704          	jreq	L032
6078  0058               L232:
6079  0058 58            	sllw	x
6080  0059 4a            	dec	a
6081  005a 26fc          	jrne	L232
6082  005c               L032:
6083  005c 01            	rrwa	x,a
6084  005d ca0012        	or	a,_swuart_frame+3
6085  0060 01            	rrwa	x,a
6086  0061 ca0011        	or	a,_swuart_frame+2
6087  0064 01            	rrwa	x,a
6088  0065 cf0011        	ldw	_swuart_frame+2,x
6089                     ; 1147 				if(swuart_frame.rxbuf[5] == 0xB2){		//此为SLC
6091  0068 c60024        	ld	a,_swuart_frame+21
6092  006b a1b2          	cp	a,#178
6093  006d 2677          	jrne	L5542
6094                     ; 1148 					sc.slc[i-1].MDID = i;
6096  006f 7b23          	ld	a,(OFST+0,sp)
6097  0071 97            	ld	xl,a
6098  0072 a624          	ld	a,#36
6099  0074 42            	mul	x,a
6100  0075 1d0024        	subw	x,#36
6101  0078 7b23          	ld	a,(OFST+0,sp)
6102  007a d70383        	ld	(_sc+648,x),a
6103                     ; 1149 					sc.slc[i-1].deviceID[0] = swuart_frame.rxbuf[6];
6105  007d 7b23          	ld	a,(OFST+0,sp)
6106  007f 97            	ld	xl,a
6107  0080 a624          	ld	a,#36
6108  0082 42            	mul	x,a
6109  0083 1d0024        	subw	x,#36
6110  0086 c60025        	ld	a,_swuart_frame+22
6111  0089 d70369        	ld	(_sc+622,x),a
6112                     ; 1150 					sc.slc[i-1].deviceID[1] = swuart_frame.rxbuf[7];
6114  008c 7b23          	ld	a,(OFST+0,sp)
6115  008e 97            	ld	xl,a
6116  008f a624          	ld	a,#36
6117  0091 42            	mul	x,a
6118  0092 1d0024        	subw	x,#36
6119  0095 c60026        	ld	a,_swuart_frame+23
6120  0098 d7036a        	ld	(_sc+623,x),a
6121                     ; 1151 					sc.slc[i-1].deviceID[2] = swuart_frame.rxbuf[8];
6123  009b 7b23          	ld	a,(OFST+0,sp)
6124  009d 97            	ld	xl,a
6125  009e a624          	ld	a,#36
6126  00a0 42            	mul	x,a
6127  00a1 1d0024        	subw	x,#36
6128  00a4 c60027        	ld	a,_swuart_frame+24
6129  00a7 d7036b        	ld	(_sc+624,x),a
6130                     ; 1152 					sc.slc[i-1].deviceID[3] = swuart_frame.rxbuf[9];
6132  00aa 7b23          	ld	a,(OFST+0,sp)
6133  00ac 97            	ld	xl,a
6134  00ad a624          	ld	a,#36
6135  00af 42            	mul	x,a
6136  00b0 1d0024        	subw	x,#36
6137  00b3 c60028        	ld	a,_swuart_frame+25
6138  00b6 d7036c        	ld	(_sc+625,x),a
6139                     ; 1153 					sc.slc[i-1].model = swuart_frame.rxbuf[10];
6141  00b9 7b23          	ld	a,(OFST+0,sp)
6142  00bb 97            	ld	xl,a
6143  00bc a624          	ld	a,#36
6144  00be 42            	mul	x,a
6145  00bf 1d0024        	subw	x,#36
6146  00c2 c60029        	ld	a,_swuart_frame+26
6147  00c5 d7036d        	ld	(_sc+626,x),a
6148                     ; 1154 					sc.slc[i-1].firmware_version = swuart_frame.rxbuf[11];
6150  00c8 7b23          	ld	a,(OFST+0,sp)
6151  00ca 97            	ld	xl,a
6152  00cb a624          	ld	a,#36
6153  00cd 42            	mul	x,a
6154  00ce 1d0024        	subw	x,#36
6155  00d1 c6002a        	ld	a,_swuart_frame+27
6156  00d4 d7036e        	ld	(_sc+627,x),a
6157                     ; 1155 					sc.slc[i-1].HWTtest = swuart_frame.rxbuf[12];	
6159  00d7 7b23          	ld	a,(OFST+0,sp)
6160  00d9 97            	ld	xl,a
6161  00da a624          	ld	a,#36
6162  00dc 42            	mul	x,a
6163  00dd 1d0024        	subw	x,#36
6164  00e0 c6002b        	ld	a,_swuart_frame+28
6165  00e3 d7038a        	ld	(_sc+655,x),a
6166  00e6               L5542:
6167                     ; 1157 				if(swuart_frame.rxbuf[5] == 0xB3){	//此为SPC
6169  00e6 c60024        	ld	a,_swuart_frame+21
6170  00e9 a1b3          	cp	a,#179
6171  00eb 2677          	jrne	L3542
6172                     ; 1158 					sc.spc[i-1].MDID = i;
6174  00ed 7b23          	ld	a,(OFST+0,sp)
6175  00ef 97            	ld	xl,a
6176  00f0 a627          	ld	a,#39
6177  00f2 42            	mul	x,a
6178  00f3 1d0027        	subw	x,#39
6179  00f6 7b23          	ld	a,(OFST+0,sp)
6180  00f8 d7013a        	ld	(_sc+63,x),a
6181                     ; 1159 					sc.spc[i-1].deviceID[0] = swuart_frame.rxbuf[6];
6183  00fb 7b23          	ld	a,(OFST+0,sp)
6184  00fd 97            	ld	xl,a
6185  00fe a627          	ld	a,#39
6186  0100 42            	mul	x,a
6187  0101 1d0027        	subw	x,#39
6188  0104 c60025        	ld	a,_swuart_frame+22
6189  0107 d70120        	ld	(_sc+37,x),a
6190                     ; 1160 					sc.spc[i-1].deviceID[1] = swuart_frame.rxbuf[7];
6192  010a 7b23          	ld	a,(OFST+0,sp)
6193  010c 97            	ld	xl,a
6194  010d a627          	ld	a,#39
6195  010f 42            	mul	x,a
6196  0110 1d0027        	subw	x,#39
6197  0113 c60026        	ld	a,_swuart_frame+23
6198  0116 d70121        	ld	(_sc+38,x),a
6199                     ; 1161 					sc.spc[i-1].deviceID[2] = swuart_frame.rxbuf[8];
6201  0119 7b23          	ld	a,(OFST+0,sp)
6202  011b 97            	ld	xl,a
6203  011c a627          	ld	a,#39
6204  011e 42            	mul	x,a
6205  011f 1d0027        	subw	x,#39
6206  0122 c60027        	ld	a,_swuart_frame+24
6207  0125 d70122        	ld	(_sc+39,x),a
6208                     ; 1162 					sc.spc[i-1].deviceID[3] = swuart_frame.rxbuf[9];
6210  0128 7b23          	ld	a,(OFST+0,sp)
6211  012a 97            	ld	xl,a
6212  012b a627          	ld	a,#39
6213  012d 42            	mul	x,a
6214  012e 1d0027        	subw	x,#39
6215  0131 c60028        	ld	a,_swuart_frame+25
6216  0134 d70123        	ld	(_sc+40,x),a
6217                     ; 1163 					sc.spc[i-1].model = swuart_frame.rxbuf[10];
6219  0137 7b23          	ld	a,(OFST+0,sp)
6220  0139 97            	ld	xl,a
6221  013a a627          	ld	a,#39
6222  013c 42            	mul	x,a
6223  013d 1d0027        	subw	x,#39
6224  0140 c60029        	ld	a,_swuart_frame+26
6225  0143 d70124        	ld	(_sc+41,x),a
6226                     ; 1164 					sc.spc[i-1].firmware_version = swuart_frame.rxbuf[11];
6228  0146 7b23          	ld	a,(OFST+0,sp)
6229  0148 97            	ld	xl,a
6230  0149 a627          	ld	a,#39
6231  014b 42            	mul	x,a
6232  014c 1d0027        	subw	x,#39
6233  014f c6002a        	ld	a,_swuart_frame+27
6234  0152 d70125        	ld	(_sc+42,x),a
6235                     ; 1165 					sc.spc[i-1].HWTtest = swuart_frame.rxbuf[12];	
6237  0155 7b23          	ld	a,(OFST+0,sp)
6238  0157 97            	ld	xl,a
6239  0158 a627          	ld	a,#39
6240  015a 42            	mul	x,a
6241  015b 1d0027        	subw	x,#39
6242  015e c6002b        	ld	a,_swuart_frame+28
6243  0161 d70144        	ld	(_sc+73,x),a
6244  0164               L3542:
6245                     ; 1129 	for(i = 1; i <= 15; i++){
6247  0164 0c23          	inc	(OFST+0,sp)
6250  0166 7b23          	ld	a,(OFST+0,sp)
6251  0168 a110          	cp	a,#16
6252  016a 2403          	jruge	L632
6253  016c cc000a        	jp	L5442
6254  016f               L632:
6255                     ; 1176 }
6258  016f 5b23          	addw	sp,#35
6259  0171 81            	ret
6312                     ; 1186 void slcspc_heartbeat(void)
6312                     ; 1187 {
6313                     .text:	section	.text,new
6314  0000               _slcspc_heartbeat:
6316  0000 5223          	subw	sp,#35
6317       00000023      OFST:	set	35
6320                     ; 1191 	for(j = 0; j < 15; j++){
6322  0002 0f23          	clr	(OFST+0,sp)
6323  0004               L3052:
6324                     ; 1193 		if(sc.slc[j].MDID || sc.spc[j].MDID){
6326  0004 7b23          	ld	a,(OFST+0,sp)
6327  0006 97            	ld	xl,a
6328  0007 a624          	ld	a,#36
6329  0009 42            	mul	x,a
6330  000a 724d0383      	tnz	(_sc+648,x)
6331  000e 260f          	jrne	L3152
6333  0010 7b23          	ld	a,(OFST+0,sp)
6334  0012 97            	ld	xl,a
6335  0013 a627          	ld	a,#39
6336  0015 42            	mul	x,a
6337  0016 724d013a      	tnz	(_sc+63,x)
6338  001a 2603          	jrne	L242
6339  001c cc00c0        	jp	L1152
6340  001f               L242:
6341  001f               L3152:
6342                     ; 1195 			hb.frame_h1 = 0x7E;
6344  001f a67e          	ld	a,#126
6345  0021 6b02          	ld	(OFST-33,sp),a
6346                     ; 1196 			hb.frame_h2 = 0x7E;
6348  0023 a67e          	ld	a,#126
6349  0025 6b03          	ld	(OFST-32,sp),a
6350                     ; 1197 			hb.message_id = slcspc_get_message_id();
6352  0027 cd0000        	call	_slcspc_get_message_id
6354  002a 6b04          	ld	(OFST-31,sp),a
6355                     ; 1198 			hb.payload[0] = 0x03;
6357  002c a603          	ld	a,#3
6358  002e 6b05          	ld	(OFST-30,sp),a
6359                     ; 1199 			hb.payload[1] = 0x03;
6361  0030 a603          	ld	a,#3
6362  0032 6b06          	ld	(OFST-29,sp),a
6363                     ; 1200 			hb.payload[2] = j + 1;
6365  0034 7b23          	ld	a,(OFST+0,sp)
6366  0036 4c            	inc	a
6367  0037 6b07          	ld	(OFST-28,sp),a
6368                     ; 1202 			ret = slcspc_one_process(&hb, 3, j + 1);
6370  0039 7b23          	ld	a,(OFST+0,sp)
6371  003b 4c            	inc	a
6372  003c 88            	push	a
6373  003d 4b03          	push	#3
6374  003f 96            	ldw	x,sp
6375  0040 1c0004        	addw	x,#OFST-31
6376  0043 cd0000        	call	_slcspc_one_process
6378  0046 85            	popw	x
6379  0047 6b01          	ld	(OFST-34,sp),a
6380                     ; 1204 			if (ret == 0){
6382  0049 0d01          	tnz	(OFST-34,sp)
6383  004b 2673          	jrne	L1152
6384                     ; 1207 					if(swuart_frame.rxbuf[5] == 0x06){
6386  004d c60024        	ld	a,_swuart_frame+21
6387  0050 a106          	cp	a,#6
6388  0052 266c          	jrne	L1152
6389                     ; 1209 						if(sc.slc[j].MDID){
6391  0054 7b23          	ld	a,(OFST+0,sp)
6392  0056 97            	ld	xl,a
6393  0057 a624          	ld	a,#36
6394  0059 42            	mul	x,a
6395  005a 724d0383      	tnz	(_sc+648,x)
6396  005e 2724          	jreq	L1252
6397                     ; 1210 							sc.slc[j].ch1_status = swuart_frame.rxbuf[7];
6399  0060 7b23          	ld	a,(OFST+0,sp)
6400  0062 97            	ld	xl,a
6401  0063 a624          	ld	a,#36
6402  0065 42            	mul	x,a
6403  0066 c60026        	ld	a,_swuart_frame+23
6404  0069 d70384        	ld	(_sc+649,x),a
6405                     ; 1211 							sc.slc[j].ch2_status = swuart_frame.rxbuf[8];
6407  006c 7b23          	ld	a,(OFST+0,sp)
6408  006e 97            	ld	xl,a
6409  006f a624          	ld	a,#36
6410  0071 42            	mul	x,a
6411  0072 c60027        	ld	a,_swuart_frame+24
6412  0075 d70385        	ld	(_sc+650,x),a
6413                     ; 1214 							sc.slc[j].HWTtest = swuart_frame.rxbuf[11];								
6415  0078 7b23          	ld	a,(OFST+0,sp)
6416  007a 97            	ld	xl,a
6417  007b a624          	ld	a,#36
6418  007d 42            	mul	x,a
6419  007e c6002a        	ld	a,_swuart_frame+27
6420  0081 d7038a        	ld	(_sc+655,x),a
6421  0084               L1252:
6422                     ; 1216 						if(sc.spc[j].MDID){
6424  0084 7b23          	ld	a,(OFST+0,sp)
6425  0086 97            	ld	xl,a
6426  0087 a627          	ld	a,#39
6427  0089 42            	mul	x,a
6428  008a 724d013a      	tnz	(_sc+63,x)
6429  008e 2730          	jreq	L1152
6430                     ; 1218 							sc.spc[j].ch1_status = swuart_frame.rxbuf[7];
6432  0090 7b23          	ld	a,(OFST+0,sp)
6433  0092 97            	ld	xl,a
6434  0093 a627          	ld	a,#39
6435  0095 42            	mul	x,a
6436  0096 c60026        	ld	a,_swuart_frame+23
6437  0099 d7013b        	ld	(_sc+64,x),a
6438                     ; 1219 							sc.spc[j].ch2_status = swuart_frame.rxbuf[8];
6440  009c 7b23          	ld	a,(OFST+0,sp)
6441  009e 97            	ld	xl,a
6442  009f a627          	ld	a,#39
6443  00a1 42            	mul	x,a
6444  00a2 c60027        	ld	a,_swuart_frame+24
6445  00a5 d7013c        	ld	(_sc+65,x),a
6446                     ; 1220 							sc.spc[j].ch3_status = swuart_frame.rxbuf[9];
6448  00a8 7b23          	ld	a,(OFST+0,sp)
6449  00aa 97            	ld	xl,a
6450  00ab a627          	ld	a,#39
6451  00ad 42            	mul	x,a
6452  00ae c60028        	ld	a,_swuart_frame+25
6453  00b1 d7013d        	ld	(_sc+66,x),a
6454                     ; 1222 							sc.spc[j].HWTtest = swuart_frame.rxbuf[11];	
6456  00b4 7b23          	ld	a,(OFST+0,sp)
6457  00b6 97            	ld	xl,a
6458  00b7 a627          	ld	a,#39
6459  00b9 42            	mul	x,a
6460  00ba c6002a        	ld	a,_swuart_frame+27
6461  00bd d70144        	ld	(_sc+73,x),a
6462  00c0               L1152:
6463                     ; 1191 	for(j = 0; j < 15; j++){
6465  00c0 0c23          	inc	(OFST+0,sp)
6468  00c2 7b23          	ld	a,(OFST+0,sp)
6469  00c4 a10f          	cp	a,#15
6470  00c6 2403          	jruge	L442
6471  00c8 cc0004        	jp	L3052
6472  00cb               L442:
6473                     ; 1235 }
6476  00cb 5b23          	addw	sp,#35
6477  00cd 81            	ret
6531                     ; 1246 u8 slcspc_get_energy_consum(u8 i)
6531                     ; 1247 {
6532                     .text:	section	.text,new
6533  0000               _slcspc_get_energy_consum:
6535  0000 88            	push	a
6536  0001 5224          	subw	sp,#36
6537       00000024      OFST:	set	36
6540                     ; 1251 	msg.frame_h1 = 0x7E;
6542  0003 a67e          	ld	a,#126
6543  0005 6b04          	ld	(OFST-32,sp),a
6544                     ; 1252 	msg.frame_h2 = 0x7E;
6546  0007 a67e          	ld	a,#126
6547  0009 6b05          	ld	(OFST-31,sp),a
6548                     ; 1253 	msg.message_id = slcspc_get_message_id();
6550  000b cd0000        	call	_slcspc_get_message_id
6552  000e 6b06          	ld	(OFST-30,sp),a
6553                     ; 1254 	msg.payload[0] = 0xFE;		//自己定义
6555  0010 a6fe          	ld	a,#254
6556  0012 6b07          	ld	(OFST-29,sp),a
6557                     ; 1255 	msg.payload[1] = 0x02;		//自己定义
6559  0014 a602          	ld	a,#2
6560  0016 6b08          	ld	(OFST-28,sp),a
6561                     ; 1257 	sc.spc[i].energy_consume = 0;
6563  0018 7b25          	ld	a,(OFST+1,sp)
6564  001a 97            	ld	xl,a
6565  001b a627          	ld	a,#39
6566  001d 42            	mul	x,a
6567  001e 905f          	clrw	y
6568  0020 df0141        	ldw	(_sc+70,x),y
6569                     ; 1259 	ret = slcspc_one_process(&msg, 2, i + 1);		
6571  0023 7b25          	ld	a,(OFST+1,sp)
6572  0025 4c            	inc	a
6573  0026 88            	push	a
6574  0027 4b02          	push	#2
6575  0029 96            	ldw	x,sp
6576  002a 1c0006        	addw	x,#OFST-30
6577  002d cd0000        	call	_slcspc_one_process
6579  0030 85            	popw	x
6580  0031 6b03          	ld	(OFST-33,sp),a
6581                     ; 1260 	if (ret == 0){
6583  0033 0d03          	tnz	(OFST-33,sp)
6584  0035 2635          	jrne	L7452
6585                     ; 1261 		if(swuart_frame.rxbuf[5] == 0x2A){
6587  0037 c60024        	ld	a,_swuart_frame+21
6588  003a a12a          	cp	a,#42
6589  003c 262e          	jrne	L7452
6590                     ; 1262 			if(sc.spc[i].MDID == swuart_frame.rxbuf[8]){
6592  003e 7b25          	ld	a,(OFST+1,sp)
6593  0040 97            	ld	xl,a
6594  0041 a627          	ld	a,#39
6595  0043 42            	mul	x,a
6596  0044 d6013a        	ld	a,(_sc+63,x)
6597  0047 c10027        	cp	a,_swuart_frame+24
6598  004a 2620          	jrne	L7452
6599                     ; 1263 				sc.spc[i].energy_consume = swuart_frame.rxbuf[6] * 256 + swuart_frame.rxbuf[7];
6601  004c c60025        	ld	a,_swuart_frame+22
6602  004f 5f            	clrw	x
6603  0050 97            	ld	xl,a
6604  0051 4f            	clr	a
6605  0052 02            	rlwa	x,a
6606  0053 01            	rrwa	x,a
6607  0054 cb0026        	add	a,_swuart_frame+23
6608  0057 2401          	jrnc	L052
6609  0059 5c            	incw	x
6610  005a               L052:
6611  005a 02            	rlwa	x,a
6612  005b 1f01          	ldw	(OFST-35,sp),x
6613  005d 01            	rrwa	x,a
6614  005e 7b25          	ld	a,(OFST+1,sp)
6615  0060 97            	ld	xl,a
6616  0061 a627          	ld	a,#39
6617  0063 42            	mul	x,a
6618  0064 1601          	ldw	y,(OFST-35,sp)
6619  0066 df0141        	ldw	(_sc+70,x),y
6620                     ; 1264 				return 0;
6622  0069 4f            	clr	a
6624  006a 2002          	jra	L252
6625  006c               L7452:
6626                     ; 1270 	return 1;	
6628  006c a601          	ld	a,#1
6630  006e               L252:
6632  006e 5b25          	addw	sp,#37
6633  0070 81            	ret
6713                     ; 1288 u8 slcspc_single_action_dimmer(u8 action, u8 mdid_channel, u8 value, u8 ext)
6713                     ; 1289 {
6714                     .text:	section	.text,new
6715  0000               _slcspc_single_action_dimmer:
6717  0000 89            	pushw	x
6718  0001 5222          	subw	sp,#34
6719       00000022      OFST:	set	34
6722                     ; 1292 	u8 mdid = mdid_channel >> 4;
6724  0003 9f            	ld	a,xl
6725  0004 4e            	swap	a
6726  0005 a40f          	and	a,#15
6727  0007 6b01          	ld	(OFST-33,sp),a
6728                     ; 1294 	msg.frame_h1 = 0x7E;
6730  0009 a67e          	ld	a,#126
6731  000b 6b02          	ld	(OFST-32,sp),a
6732                     ; 1295 	msg.frame_h2 = 0x7E;
6734  000d a67e          	ld	a,#126
6735  000f 6b03          	ld	(OFST-31,sp),a
6736                     ; 1296 	msg.message_id = slcspc_get_message_id();
6738  0011 cd0000        	call	_slcspc_get_message_id
6740  0014 6b04          	ld	(OFST-30,sp),a
6741                     ; 1297 	msg.payload[0] = action;
6743  0016 7b23          	ld	a,(OFST+1,sp)
6744  0018 6b05          	ld	(OFST-29,sp),a
6745                     ; 1298 	msg.payload[1] = mdid_channel;
6747  001a 7b24          	ld	a,(OFST+2,sp)
6748  001c 6b06          	ld	(OFST-28,sp),a
6749                     ; 1299 	msg.payload[2] = value;
6751  001e 7b27          	ld	a,(OFST+5,sp)
6752  0020 6b07          	ld	(OFST-27,sp),a
6753                     ; 1300 	msg.payload[3] = ext;
6755  0022 7b28          	ld	a,(OFST+6,sp)
6756  0024 6b08          	ld	(OFST-26,sp),a
6757                     ; 1303 	ret = slcspc_one_process(&msg, 4, mdid);		
6759  0026 7b01          	ld	a,(OFST-33,sp)
6760  0028 88            	push	a
6761  0029 4b04          	push	#4
6762  002b 96            	ldw	x,sp
6763  002c 1c0004        	addw	x,#OFST-30
6764  002f cd0000        	call	_slcspc_one_process
6766  0032 85            	popw	x
6767  0033 6b01          	ld	(OFST-33,sp),a
6768                     ; 1305 	return ret;
6770  0035 7b01          	ld	a,(OFST-33,sp)
6773  0037 5b24          	addw	sp,#36
6774  0039 81            	ret
6828                     ; 1314 u8 slcspc_single_action_dimmer_result(u8 mdid)
6828                     ; 1315 {
6829                     .text:	section	.text,new
6830  0000               _slcspc_single_action_dimmer_result:
6832  0000 88            	push	a
6833  0001 5222          	subw	sp,#34
6834       00000022      OFST:	set	34
6837                     ; 1319 	msg.frame_h1 = 0x7E;
6839  0003 a67e          	ld	a,#126
6840  0005 6b02          	ld	(OFST-32,sp),a
6841                     ; 1320 	msg.frame_h2 = 0x7E;
6843  0007 a67e          	ld	a,#126
6844  0009 6b03          	ld	(OFST-31,sp),a
6845                     ; 1321 	msg.message_id = slcspc_get_message_id();
6847  000b cd0000        	call	_slcspc_get_message_id
6849  000e 6b04          	ld	(OFST-30,sp),a
6850                     ; 1322 	msg.payload[0] = 0x59;
6852  0010 a659          	ld	a,#89
6853  0012 6b05          	ld	(OFST-29,sp),a
6854                     ; 1323 	msg.payload[1] = mdid;
6856  0014 7b23          	ld	a,(OFST+1,sp)
6857  0016 6b06          	ld	(OFST-28,sp),a
6858                     ; 1325 	ret = slcspc_one_process(&msg, 2, mdid);		
6860  0018 7b23          	ld	a,(OFST+1,sp)
6861  001a 88            	push	a
6862  001b 4b02          	push	#2
6863  001d 96            	ldw	x,sp
6864  001e 1c0004        	addw	x,#OFST-30
6865  0021 cd0000        	call	_slcspc_one_process
6867  0024 85            	popw	x
6868  0025 6b01          	ld	(OFST-33,sp),a
6869                     ; 1326 	if (ret == 0){
6871  0027 0d01          	tnz	(OFST-33,sp)
6872  0029 264e          	jrne	L1362
6873                     ; 1328 			if((swuart_frame.rxbuf[5] == 0xAA) && (swuart_frame.rxbuf[6]==0x05)){
6875  002b c60024        	ld	a,_swuart_frame+21
6876  002e a1aa          	cp	a,#170
6877  0030 2647          	jrne	L1362
6879  0032 c60025        	ld	a,_swuart_frame+22
6880  0035 a105          	cp	a,#5
6881  0037 2640          	jrne	L1362
6882                     ; 1329 				sc.slc[swuart_frame.rxbuf[7] -1].ch1_status = swuart_frame.rxbuf[8];
6884  0039 c60026        	ld	a,_swuart_frame+23
6885  003c 97            	ld	xl,a
6886  003d a624          	ld	a,#36
6887  003f 42            	mul	x,a
6888  0040 1d0024        	subw	x,#36
6889  0043 c60027        	ld	a,_swuart_frame+24
6890  0046 d70384        	ld	(_sc+649,x),a
6891                     ; 1330 				sc.slc[swuart_frame.rxbuf[7] -1].ch2_status = swuart_frame.rxbuf[9];
6893  0049 c60026        	ld	a,_swuart_frame+23
6894  004c 97            	ld	xl,a
6895  004d a624          	ld	a,#36
6896  004f 42            	mul	x,a
6897  0050 1d0024        	subw	x,#36
6898  0053 c60028        	ld	a,_swuart_frame+25
6899  0056 d70385        	ld	(_sc+650,x),a
6900                     ; 1331 				sc.slc[swuart_frame.rxbuf[7] -1].ch3_status = swuart_frame.rxbuf[10];
6902  0059 c60026        	ld	a,_swuart_frame+23
6903  005c 97            	ld	xl,a
6904  005d a624          	ld	a,#36
6905  005f 42            	mul	x,a
6906  0060 1d0024        	subw	x,#36
6907  0063 c60029        	ld	a,_swuart_frame+26
6908  0066 d70386        	ld	(_sc+651,x),a
6909                     ; 1332 				sc.slc[swuart_frame.rxbuf[7] -1].ch4_status = swuart_frame.rxbuf[11];
6911  0069 c60026        	ld	a,_swuart_frame+23
6912  006c 97            	ld	xl,a
6913  006d a624          	ld	a,#36
6914  006f 42            	mul	x,a
6915  0070 1d0024        	subw	x,#36
6916  0073 c6002a        	ld	a,_swuart_frame+27
6917  0076 d70387        	ld	(_sc+652,x),a
6918  0079               L1362:
6919                     ; 1338 	return ret;
6921  0079 7b01          	ld	a,(OFST-33,sp)
6924  007b 5b23          	addw	sp,#35
6925  007d 81            	ret
7006                     ; 1351 u8 slcspc_action_plug(u8 action, u8 mdid_channel, u8 value, u8 ext)
7006                     ; 1352 {
7007                     .text:	section	.text,new
7008  0000               _slcspc_action_plug:
7010  0000 89            	pushw	x
7011  0001 5222          	subw	sp,#34
7012       00000022      OFST:	set	34
7015                     ; 1355 	u8 mdid = mdid_channel >> 4;
7017  0003 9f            	ld	a,xl
7018  0004 4e            	swap	a
7019  0005 a40f          	and	a,#15
7020  0007 6b01          	ld	(OFST-33,sp),a
7021                     ; 1357 	msg.frame_h1 = 0x7E;
7023  0009 a67e          	ld	a,#126
7024  000b 6b02          	ld	(OFST-32,sp),a
7025                     ; 1358 	msg.frame_h2 = 0x7E;
7027  000d a67e          	ld	a,#126
7028  000f 6b03          	ld	(OFST-31,sp),a
7029                     ; 1359 	msg.message_id = slcspc_get_message_id();
7031  0011 cd0000        	call	_slcspc_get_message_id
7033  0014 6b04          	ld	(OFST-30,sp),a
7034                     ; 1360 	msg.payload[0] = action;
7036  0016 7b23          	ld	a,(OFST+1,sp)
7037  0018 6b05          	ld	(OFST-29,sp),a
7038                     ; 1361 	msg.payload[1] = mdid_channel;
7040  001a 7b24          	ld	a,(OFST+2,sp)
7041  001c 6b06          	ld	(OFST-28,sp),a
7042                     ; 1362 	msg.payload[2] = value;
7044  001e 7b27          	ld	a,(OFST+5,sp)
7045  0020 6b07          	ld	(OFST-27,sp),a
7046                     ; 1363 	msg.payload[3] = ext;
7048  0022 7b28          	ld	a,(OFST+6,sp)
7049  0024 6b08          	ld	(OFST-26,sp),a
7050                     ; 1365 	ret = slcspc_one_process(&msg, 4, mdid);		
7052  0026 7b01          	ld	a,(OFST-33,sp)
7053  0028 88            	push	a
7054  0029 4b04          	push	#4
7055  002b 96            	ldw	x,sp
7056  002c 1c0004        	addw	x,#OFST-30
7057  002f cd0000        	call	_slcspc_one_process
7059  0032 85            	popw	x
7060  0033 6b01          	ld	(OFST-33,sp),a
7061                     ; 1366 	if (ret == 0){
7063  0035 0d01          	tnz	(OFST-33,sp)
7064  0037 264e          	jrne	L7662
7065                     ; 1369 			if((swuart_frame.rxbuf[5] == 0xAA) && (swuart_frame.rxbuf[6] == 0x05)){
7067  0039 c60024        	ld	a,_swuart_frame+21
7068  003c a1aa          	cp	a,#170
7069  003e 2647          	jrne	L7662
7071  0040 c60025        	ld	a,_swuart_frame+22
7072  0043 a105          	cp	a,#5
7073  0045 2640          	jrne	L7662
7074                     ; 1370 				sc.spc[swuart_frame.rxbuf[7] -1].ch1_status = swuart_frame.rxbuf[8];
7076  0047 c60026        	ld	a,_swuart_frame+23
7077  004a 97            	ld	xl,a
7078  004b a627          	ld	a,#39
7079  004d 42            	mul	x,a
7080  004e 1d0027        	subw	x,#39
7081  0051 c60027        	ld	a,_swuart_frame+24
7082  0054 d7013b        	ld	(_sc+64,x),a
7083                     ; 1371 				sc.spc[swuart_frame.rxbuf[7] -1].ch2_status = swuart_frame.rxbuf[9];
7085  0057 c60026        	ld	a,_swuart_frame+23
7086  005a 97            	ld	xl,a
7087  005b a627          	ld	a,#39
7088  005d 42            	mul	x,a
7089  005e 1d0027        	subw	x,#39
7090  0061 c60028        	ld	a,_swuart_frame+25
7091  0064 d7013c        	ld	(_sc+65,x),a
7092                     ; 1372 				sc.spc[swuart_frame.rxbuf[7] -1].ch3_status = swuart_frame.rxbuf[10];
7094  0067 c60026        	ld	a,_swuart_frame+23
7095  006a 97            	ld	xl,a
7096  006b a627          	ld	a,#39
7097  006d 42            	mul	x,a
7098  006e 1d0027        	subw	x,#39
7099  0071 c60029        	ld	a,_swuart_frame+26
7100  0074 d7013d        	ld	(_sc+66,x),a
7101                     ; 1373 				sc.spc[swuart_frame.rxbuf[7] -1].ch4_status = swuart_frame.rxbuf[11];
7103  0077 c60026        	ld	a,_swuart_frame+23
7104  007a 97            	ld	xl,a
7105  007b a627          	ld	a,#39
7106  007d 42            	mul	x,a
7107  007e 1d0027        	subw	x,#39
7108  0081 c6002a        	ld	a,_swuart_frame+27
7109  0084 d7013e        	ld	(_sc+67,x),a
7110  0087               L7662:
7111                     ; 1380 	return ret;
7113  0087 7b01          	ld	a,(OFST-33,sp)
7116  0089 5b24          	addw	sp,#36
7117  008b 81            	ret
7159                     ; 1390 u8 slcspc_multiple_action_dimmer(u8 num)
7159                     ; 1391 {
7160                     .text:	section	.text,new
7161  0000               _slcspc_multiple_action_dimmer:
7163  0000 88            	push	a
7164  0001 88            	push	a
7165       00000001      OFST:	set	1
7168                     ; 1394 	for(i = 0; i < num; i++){
7170  0002 0f01          	clr	(OFST+0,sp)
7172  0004 2021          	jra	L5172
7173  0006               L1172:
7174                     ; 1396 		slcspc_single_action_dimmer(0x51, sicp_buf[8 + i], sicp_buf[8 + num], sicp_buf[9 + num]);
7176  0006 7b02          	ld	a,(OFST+1,sp)
7177  0008 5f            	clrw	x
7178  0009 97            	ld	xl,a
7179  000a d6007e        	ld	a,(_sicp_buf+9,x)
7180  000d 88            	push	a
7181  000e 7b03          	ld	a,(OFST+2,sp)
7182  0010 5f            	clrw	x
7183  0011 97            	ld	xl,a
7184  0012 d6007d        	ld	a,(_sicp_buf+8,x)
7185  0015 88            	push	a
7186  0016 7b03          	ld	a,(OFST+2,sp)
7187  0018 5f            	clrw	x
7188  0019 97            	ld	xl,a
7189  001a d6007d        	ld	a,(_sicp_buf+8,x)
7190  001d 97            	ld	xl,a
7191  001e a651          	ld	a,#81
7192  0020 95            	ld	xh,a
7193  0021 cd0000        	call	_slcspc_single_action_dimmer
7195  0024 85            	popw	x
7196                     ; 1394 	for(i = 0; i < num; i++){
7198  0025 0c01          	inc	(OFST+0,sp)
7199  0027               L5172:
7202  0027 7b01          	ld	a,(OFST+0,sp)
7203  0029 1102          	cp	a,(OFST+1,sp)
7204  002b 25d9          	jrult	L1172
7205                     ; 1400 	return 0;
7207  002d 4f            	clr	a
7210  002e 85            	popw	x
7211  002f 81            	ret
7253                     ; 1411 u8 slcspc_multiple_action_plug(u8 num)
7253                     ; 1412 {
7254                     .text:	section	.text,new
7255  0000               _slcspc_multiple_action_plug:
7257  0000 88            	push	a
7258  0001 88            	push	a
7259       00000001      OFST:	set	1
7262                     ; 1415 	for(i = 0; i < num; i++){
7264  0002 0f01          	clr	(OFST+0,sp)
7266  0004 2021          	jra	L3472
7267  0006               L7372:
7268                     ; 1417 		slcspc_action_plug(0x55, sicp_buf[8 + i], sicp_buf[8 + num], sicp_buf[9 + num]);
7270  0006 7b02          	ld	a,(OFST+1,sp)
7271  0008 5f            	clrw	x
7272  0009 97            	ld	xl,a
7273  000a d6007e        	ld	a,(_sicp_buf+9,x)
7274  000d 88            	push	a
7275  000e 7b03          	ld	a,(OFST+2,sp)
7276  0010 5f            	clrw	x
7277  0011 97            	ld	xl,a
7278  0012 d6007d        	ld	a,(_sicp_buf+8,x)
7279  0015 88            	push	a
7280  0016 7b03          	ld	a,(OFST+2,sp)
7281  0018 5f            	clrw	x
7282  0019 97            	ld	xl,a
7283  001a d6007d        	ld	a,(_sicp_buf+8,x)
7284  001d 97            	ld	xl,a
7285  001e a655          	ld	a,#85
7286  0020 95            	ld	xh,a
7287  0021 cd0000        	call	_slcspc_action_plug
7289  0024 85            	popw	x
7290                     ; 1415 	for(i = 0; i < num; i++){
7292  0025 0c01          	inc	(OFST+0,sp)
7293  0027               L3472:
7296  0027 7b01          	ld	a,(OFST+0,sp)
7297  0029 1102          	cp	a,(OFST+1,sp)
7298  002b 25d9          	jrult	L7372
7299                     ; 1421 	return 0;
7301  002d 4f            	clr	a
7304  002e 85            	popw	x
7305  002f 81            	ret
7330                     ; 1429 void slcspc_select_channel_init(void)
7330                     ; 1430 {
7331                     .text:	section	.text,new
7332  0000               _slcspc_select_channel_init:
7336                     ; 1432 	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH, GPIO_MODE_OUT_PP_HIGH_FAST); 
7338  0000 4bf0          	push	#240
7339  0002 4b20          	push	#32
7340  0004 ae500a        	ldw	x,#20490
7341  0007 cd0000        	call	_GPIO_Init
7343  000a 85            	popw	x
7344                     ; 1433 	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW,  GPIO_MODE_OUT_PP_HIGH_FAST); 
7346  000b 4bf0          	push	#240
7347  000d 4b10          	push	#16
7348  000f ae500a        	ldw	x,#20490
7349  0012 cd0000        	call	_GPIO_Init
7351  0015 85            	popw	x
7352                     ; 1434 	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2, GPIO_MODE_OUT_PP_LOW_FAST); 
7354  0016 4be0          	push	#224
7355  0018 4b08          	push	#8
7356  001a ae500a        	ldw	x,#20490
7357  001d cd0000        	call	_GPIO_Init
7359  0020 85            	popw	x
7360                     ; 1435 	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1, GPIO_MODE_OUT_PP_LOW_FAST); 
7362  0021 4be0          	push	#224
7363  0023 4b04          	push	#4
7364  0025 ae500a        	ldw	x,#20490
7365  0028 cd0000        	call	_GPIO_Init
7367  002b 85            	popw	x
7368                     ; 1436 	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0, GPIO_MODE_OUT_PP_LOW_FAST); 
7370  002c 4be0          	push	#224
7371  002e 4b02          	push	#2
7372  0030 ae500a        	ldw	x,#20490
7373  0033 cd0000        	call	_GPIO_Init
7375  0036 85            	popw	x
7376                     ; 1438 }
7379  0037 81            	ret
7405                     ; 1441 void slcspc_select_channel_reset(void)
7405                     ; 1442 {
7406                     .text:	section	.text,new
7407  0000               _slcspc_select_channel_reset:
7411                     ; 1443 	GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH);
7413  0000 4b20          	push	#32
7414  0002 ae500a        	ldw	x,#20490
7415  0005 cd0000        	call	_GPIO_WriteHigh
7417  0008 84            	pop	a
7418                     ; 1444 	GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW);
7420  0009 4b10          	push	#16
7421  000b ae500a        	ldw	x,#20490
7422  000e cd0000        	call	_GPIO_WriteHigh
7424  0011 84            	pop	a
7425                     ; 1445 	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2);
7427  0012 4b08          	push	#8
7428  0014 ae500a        	ldw	x,#20490
7429  0017 cd0000        	call	_GPIO_WriteLow
7431  001a 84            	pop	a
7432                     ; 1446 	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1);
7434  001b 4b04          	push	#4
7435  001d ae500a        	ldw	x,#20490
7436  0020 cd0000        	call	_GPIO_WriteLow
7438  0023 84            	pop	a
7439                     ; 1447 	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0);
7441  0024 4b02          	push	#2
7442  0026 ae500a        	ldw	x,#20490
7443  0029 cd0000        	call	_GPIO_WriteLow
7445  002c 84            	pop	a
7446                     ; 1448 }
7449  002d 81            	ret
7485                     ; 1451 void slcspc_select_channel(u8 addr)
7485                     ; 1452 {
7486                     .text:	section	.text,new
7487  0000               _slcspc_select_channel:
7489  0000 88            	push	a
7490       00000000      OFST:	set	0
7493                     ; 1453 	slcspc_select_channel_reset();
7495  0001 cd0000        	call	_slcspc_select_channel_reset
7497                     ; 1455 	if(addr & 0x08){
7499  0004 7b01          	ld	a,(OFST+1,sp)
7500  0006 a508          	bcp	a,#8
7501  0008 270b          	jreq	L3003
7502                     ; 1456 		GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH);
7504  000a 4b20          	push	#32
7505  000c ae500a        	ldw	x,#20490
7506  000f cd0000        	call	_GPIO_WriteLow
7508  0012 84            	pop	a
7510  0013 2009          	jra	L5003
7511  0015               L3003:
7512                     ; 1458 		GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW);
7514  0015 4b10          	push	#16
7515  0017 ae500a        	ldw	x,#20490
7516  001a cd0000        	call	_GPIO_WriteLow
7518  001d 84            	pop	a
7519  001e               L5003:
7520                     ; 1461 	if(addr & 0x04){
7522  001e 7b01          	ld	a,(OFST+1,sp)
7523  0020 a504          	bcp	a,#4
7524  0022 2709          	jreq	L7003
7525                     ; 1462 		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2);
7527  0024 4b08          	push	#8
7528  0026 ae500a        	ldw	x,#20490
7529  0029 cd0000        	call	_GPIO_WriteHigh
7531  002c 84            	pop	a
7532  002d               L7003:
7533                     ; 1465 	if(addr & 0x02){
7535  002d 7b01          	ld	a,(OFST+1,sp)
7536  002f a502          	bcp	a,#2
7537  0031 2709          	jreq	L1103
7538                     ; 1466 		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1);
7540  0033 4b04          	push	#4
7541  0035 ae500a        	ldw	x,#20490
7542  0038 cd0000        	call	_GPIO_WriteHigh
7544  003b 84            	pop	a
7545  003c               L1103:
7546                     ; 1469 	if(addr & 0x01){
7548  003c 7b01          	ld	a,(OFST+1,sp)
7549  003e a501          	bcp	a,#1
7550  0040 2709          	jreq	L3103
7551                     ; 1470 		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0);
7553  0042 4b02          	push	#2
7554  0044 ae500a        	ldw	x,#20490
7555  0047 cd0000        	call	_GPIO_WriteHigh
7557  004a 84            	pop	a
7558  004b               L3103:
7559                     ; 1473 }
7562  004b 84            	pop	a
7563  004c 81            	ret
7698                     	xdef	_slcspc_check_sum
7699                     	xdef	_send_malfunction
7700                     	xdef	_send_spc_device_info
7701                     	xdef	_send_slc_device_info
7702                     	xdef	_sicp_recv_DD
7703                     	xdef	_host_meshid_save
7704                     	xdef	_clear_uart_buf
7705                     	xdef	_uart1_send
7706                     	xdef	_BIT
7707                     	xref	_MEEPROM_WriteByte
7708                     	xref	_cmd_led_flag
7709                     	xref	_rand
7710                     	xdef	_slcspc_multiple_action_plug
7711                     	xdef	_slcspc_multiple_action_dimmer
7712                     	xdef	_slcspc_action_plug
7713                     	xdef	_slcspc_single_action_dimmer_result
7714                     	xdef	_slcspc_single_action_dimmer
7715                     	xdef	_slcspc_get_energy_consum
7716                     	xdef	_slcspc_heartbeat
7717                     	xdef	_slcspc_device_info
7718                     	xdef	_slcspc_one_process
7719                     	xdef	_slcspc_select_channel_reset
7720                     	xdef	_slcspc_select_channel
7721                     	xdef	_slcspc_select_channel_init
7722                     	xdef	_slcspc_send_and_recv
7723                     	xdef	_sicp_get_message_id
7724                     	xdef	_slcspc_get_message_id
7725                     	switch	.bss
7726  0000               _hb_fail_mdid_cnt:
7727  0000 000000000000  	ds.b	15
7728                     	xdef	_hb_fail_mdid_cnt
7729  000f               _swuart_frame:
7730  000f 000000000000  	ds.b	96
7731                     	xdef	_swuart_frame
7732                     	xdef	_UART3_RX_ISR
7733                     	xdef	_UART3_TX_ISR
7734                     	xdef	_uart3_init
7735                     	xdef	_delay
7736                     	xdef	_sicp_heart_beat
7737                     	xdef	_send_device_info_active
7738                     	xdef	_send_device_info_all
7739                     	xdef	_malfunction_detect
7740                     	xdef	_malfunction_sended_confirm
7741                     	xdef	_send_device_info
7742                     	xdef	_report_energy_consum
7743                     	xdef	_sicp_receipt_Done
7744                     	xdef	_sicp_receipt
7745                     	xdef	_sicp_send_message
7746                     	xdef	_random
7747                     	xdef	_Check_Sum
7748                     	xdef	_sicp_rev_anaylze
7749                     	xdef	_UART1_RX_ISR
7750                     	xdef	_UART1_TX_ISR
7751                     	xdef	_uart1_init
7752                     	xdef	_mymemcpy
7753  006f               _mal_timeout:
7754  006f 00            	ds.b	1
7755                     	xdef	_mal_timeout
7756  0070               _di_timeout:
7757  0070 00            	ds.b	1
7758                     	xdef	_di_timeout
7759  0071               _send_failed_count:
7760  0071 0000          	ds.b	2
7761                     	xdef	_send_failed_count
7762  0073               _send_fault_count:
7763  0073 0000          	ds.b	2
7764                     	xdef	_send_fault_count
7765  0075               _sicp_buf:
7766  0075 000000000000  	ds.b	40
7767                     	xdef	_sicp_buf
7768  009d               _Uart2_Rec_Cnt:
7769  009d 00            	ds.b	1
7770                     	xdef	_Uart2_Rec_Cnt
7771  009e               _Uart2_Rece_Buf:
7772  009e 000000000000  	ds.b	40
7773                     	xdef	_Uart2_Rece_Buf
7774  00c6               _Uart2_Send_Done:
7775  00c6 00            	ds.b	1
7776                     	xdef	_Uart2_Send_Done
7777  00c7               _Uart2_Send_Cnt:
7778  00c7 00            	ds.b	1
7779                     	xdef	_Uart2_Send_Cnt
7780  00c8               _Uart2_Send_Length:
7781  00c8 00            	ds.b	1
7782                     	xdef	_Uart2_Send_Length
7783  00c9               _UART2_Send_Buf:
7784  00c9 000000000000  	ds.b	40
7785                     	xdef	_UART2_Send_Buf
7786  00f1               _rev_mesh_id_L:
7787  00f1 00            	ds.b	1
7788                     	xdef	_rev_mesh_id_L
7789  00f2               _rev_mesh_id_H:
7790  00f2 00            	ds.b	1
7791                     	xdef	_rev_mesh_id_H
7792  00f3               _rev_message_id:
7793  00f3 00            	ds.b	1
7794                     	xdef	_rev_message_id
7795  00f4               _ns_host_meshid_L:
7796  00f4 00            	ds.b	1
7797                     	xdef	_ns_host_meshid_L
7798  00f5               _ns_host_meshid_H:
7799  00f5 00            	ds.b	1
7800                     	xdef	_ns_host_meshid_H
7801  00f6               _ns_own_meshid_L:
7802  00f6 00            	ds.b	1
7803                     	xdef	_ns_own_meshid_L
7804  00f7               _ns_own_meshid_H:
7805  00f7 00            	ds.b	1
7806                     	xdef	_ns_own_meshid_H
7807  00f8               _ns_phonenum:
7808  00f8 00            	ds.b	1
7809                     	xdef	_ns_phonenum
7810  00f9               _ns_status:
7811  00f9 00            	ds.b	1
7812                     	xdef	_ns_status
7813  00fa               _ns_signal:
7814  00fa 00            	ds.b	1
7815                     	xdef	_ns_signal
7816  00fb               _sc:
7817  00fb 000000000000  	ds.b	1163
7818                     	xdef	_sc
7819  0586               _UART1Flag6_:
7820  0586 00            	ds.b	1
7821                     	xdef	_UART1Flag6_
7822  0587               _UART1Flag5_:
7823  0587 00            	ds.b	1
7824                     	xdef	_UART1Flag5_
7825  0588               _UART1Flag4_:
7826  0588 00            	ds.b	1
7827                     	xdef	_UART1Flag4_
7828  0589               _UART1Flag3_:
7829  0589 00            	ds.b	1
7830                     	xdef	_UART1Flag3_
7831  058a               _UART1Flag2_:
7832  058a 00            	ds.b	1
7833                     	xdef	_UART1Flag2_
7834  058b               _UART1Flag1_:
7835  058b 00            	ds.b	1
7836                     	xdef	_UART1Flag1_
7837                     	xref	_UART3_ITConfig
7838                     	xref	_UART3_Cmd
7839                     	xref	_UART3_Init
7840                     	xref	_UART3_DeInit
7841                     	xref	_UART1_ITConfig
7842                     	xref	_UART1_Cmd
7843                     	xref	_UART1_Init
7844                     	xref	_UART1_DeInit
7845                     	xref	_GPIO_WriteLow
7846                     	xref	_GPIO_WriteHigh
7847                     	xref	_GPIO_Init
7848                     	xref.b	c_lreg
7849                     	xref.b	c_x
7850                     	xref.b	c_y
7870                     	xref	c_sdivx
7871                     	xref	c_idiv
7872                     	xref	c_lrzmp
7873                     	xref	c_lgsbc
7874                     	xref	c_ltor
7875                     	end
