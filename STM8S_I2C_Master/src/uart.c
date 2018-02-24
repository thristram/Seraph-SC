/**
  ******************************************************************************
  * @file    uart.c
  * @author  Seraph
  * @version  V1.0
  * @date     2017-03
  * @brief   This file contains the main function for STM8S003F3 timer operation.
**/


#define  _UART_GLOBAL
#include "stm8s.h"
#include "uart.h"
#include "timer.h"
#include <stdlib.h>
#include "main.h"


u8 BIT[8] = {0x01, 0x02,0x04,0x08, 0x10, 0x20, 0x40, 0x80};


u8  hb_fail_mdid_cnt[15];		//i2cÿ5s���¹�SLC��SPC������������û�лظ����ظ���20�Σ�����15���¹ҵ�ģ����ط�����




swuart_frame_t swuart_frame;


//�����ڴ�
//*des:Ŀ�ĵ�ַ
//*src:Դ��ַ
//n:��Ҫ���Ƶ��ڴ泤��(�ֽ�Ϊ��λ)
void mymemcpy(void *des,void *src,u32 n)  
{  
  u8 *xdes=des;
	u8 *xsrc=src; 
  while(n--)*xdes++=*xsrc++;  
}  

/****************************************************************/
//��ʱ����delay()�����β�Count���ڿ�����ʱ����ִ�д������޷���ֵ
/****************************************************************/
void delay(u16 Count)
{
	u8 i, j;
	
	while (Count--)//Count�βο�����ʱ����
	{
		for(i=0; i<100; i++)
		for(j=0; j<50; j++);
	}
	
}

/**
  * @brief  ��������� 1~255
  * @param  None.
  * @retval None
  */

u8 random(u8 xxx)  
{  
  u8 value,iii;  
  for(iii=0;iii<xxx;iii++)  
  {  
    value = rand() % (MAX + 1- MIN) + MIN; //��ȡһ�������1~255
	}  
  return value;  
} 










/*----------------------------------------------------------------------------
	
-----------------------------------------------------------------------------*/
u8 sicp_get_message_id(void)
{
	static u8 id = 0;
	
	id++;

	if(id == 0){
		id = 1;
	}

	return id;
}




/*----------------------------------------------------------------------------
	
-----------------------------------------------------------------------------*/
u8 slcspc_get_message_id(void)
{
	static u8 id = 0;
	
	id++;

	if(id == 0){
		id = 1;
	}

	return id;
}





/*----------------------------------------------------------------------------
	uart1 init
-----------------------------------------------------------------------------*/
void uart1_init(void)
{
	UART1_DeInit();
	//8λ����λ��1λֹͣλ����У��λ������ͬ��ģʽ��������պͷ���
	UART1_Init((u32)57600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, 
		UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_TC, ENABLE);//��������ж�
	UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);//���շǿ��ж�
	UART1_Cmd(ENABLE);//����uart1�ӿ�
}


/*----------------------------------------------------------------------------
	uart1 send begin
-----------------------------------------------------------------------------*/
void uart1_send(u8 *buf, u16 len)
{
	if(len >= UART1_SEND_LEN)	len = UART1_SEND_LEN;
	//mymemcpy(UART2_Send_Buf,buf,len);
	Uart2_Send_Length = len;
	Uart2_Send_Cnt = 1;
	UART1->DR = UART2_Send_Buf[0];
	
}

/*----------------------------------------------------------------------------
	UART1_TX_ISR
-----------------------------------------------------------------------------*/
@interrupt void UART1_TX_ISR(void)
{
	/* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	UART1->SR &= ~0x40;//���������ɱ�־λ
	//if (send_count < send_buf[5]+3)
	if (Uart2_Send_Cnt < Uart2_Send_Length)
	{
		UART1->DR = UART2_Send_Buf[Uart2_Send_Cnt];
		Uart2_Send_Cnt++;
	}
	else//�������
	{
		Uart2_Send_Done = 1;
		Uart2_Send_Cnt = 0;
	}
}




/**
  * @brief  uart2 rx isr
  * @param  none.
  * @retval None
  */

@interrupt void UART1_RX_ISR(void)
{
	u8 temp, i, check_sum;

	temp = UART1->DR;
	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
	Uart2_Rec_Cnt++;

	switch(Uart2_Rec_Cnt)
	{
		case 1:
			if ((temp != 0xEE) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
			break;
		case 2:
			if ((temp != 0xEE) && (temp != 0xAA) && (temp != 0xDD)) Uart2_Rec_Cnt = 0;
			break;
		case 3:
			//if (!temp)				rev_count = 0;
			break;
		case 4:
			//if (!temp)				rev_count = 0;
			break;
		case 5:
			//if (!temp)				rev_count = 0;
			break;
		default:
			//��ֹ���մ�������
			if (Uart2_Rec_Cnt >= Uart2_Rec_Len) {
				Uart2_Rec_Cnt = 0;
			}
			//����֡
			if ((Uart2_Rece_Buf[0] == 0xEE) && ((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA))){

				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2){ //�����������
									
					check_sum = Check_Sum(Uart2_Rece_Buf + 2, Uart2_Rece_Buf[5]);
					
					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2]){		//У����ȷ	

						if(sicp_rev_success == 0){
							sicp_rev_success = 1;
							for (i = 0; i < Uart2_Rec_Cnt; i++){
								sicp_buf[i] = Uart2_Rece_Buf[i];
							}						
						}
					
					}
					Uart2_Rec_Cnt = 0;
					
				}
			}			
			else if((Uart2_Rece_Buf[0] == 0xDD) && (Uart2_Rece_Buf[1] == 0xDD)){		//����ָ��(����״̬֡)
				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 2){ //�����������					

					if(sicp_rev_success == 0){
						sicp_rev_success = 1;
						for (i = 0; i < Uart2_Rec_Cnt; i++){
							sicp_buf[i] = Uart2_Rece_Buf[i];
						}
					}

					Uart2_Rec_Cnt = 0;
				}
				
			}else{
				Uart2_Rec_Cnt = 0;
			}
			break;
			
	}

	if (UART1->SR & 0x20){
		temp = UART1->DR;
	}	

}



/*----------------------------------------------------------------------------
	uart3 init
-----------------------------------------------------------------------------*/
void uart3_init(void)
{
	UART3_DeInit();
	//8λ����λ��1λֹͣλ����У��λ������ͬ��ģʽ��������պͷ���
	UART3_Init((u32)19200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, 
		UART3_PARITY_NO, UART3_MODE_TXRX_ENABLE);
	UART3_ITConfig(UART3_IT_TC, ENABLE);//��������ж�
	UART3_ITConfig(UART3_IT_RXNE_OR, ENABLE);//���շǿ��ж�
	UART3_Cmd(ENABLE);//����uart1�ӿ�
}


/*----------------------------------------------------------------------------
	UART1_TX_ISR
-----------------------------------------------------------------------------*/
@interrupt void UART3_TX_ISR(void)
{
	/* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	UART3->SR &= ~0x40; 	//���������ɱ�־λ
	
	if (swuart_frame.txhas < swuart_frame.txlen){
		
		UART3->DR = swuart_frame.txbuf[swuart_frame.txhas];
		swuart_frame.txhas++;
	  
	}

}




/**
  * @brief  uart2 rx isr
  * @param  none.
  * @retval None
  */

@interrupt void UART3_RX_ISR(void)
{
	u8 temp = 0;

	temp = UART3->DR;
	
	if(swuart_frame.rxtxflag == 2){		/* recv  */
		swuart_frame.flow = 3;
		swuart_frame.rxbuf[swuart_frame.rxhas] = temp;
		swuart_frame.rxhas++;
		swuart_frame.rxOverWait = 0;
		
		if(swuart_frame.rxhas >= UART3_RECV_LEN){
			swuart_frame.rxhas = 0; 		/* ���½��� */
		}
	}
	
	if (UART3->SR & 0x20){
		temp = UART3->DR;
	}
	
}






/**
  * @brief  check sum(cumulative sum)
  * @param  u8 *sendbuf,u8 length.
  * @retval u8 result
  */
u8 Check_Sum(u8 *buf,u8 length)
{
	u8 i;
	u8 result = *buf++;
	for(i = 1;i < length;i++)
	{
		result ^= *buf++;
	}
	return result;
}

void clear_uart_buf(void)
{
	u8 i;
	for (i = 0;i < Uart2_Rec_Len;i++){
		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
	}
}



/*----------------------------------------------------------------------------
	�������ص�meshid
-----------------------------------------------------------------------------*/
void host_meshid_save(u8 meshid_h, u8 meshid_l)
{
	/* mesh id ��ͬ */
	if((ns_host_meshid_H != meshid_h) || (ns_host_meshid_L != meshid_l)){
		
		ns_host_meshid_H = meshid_h;
		ns_host_meshid_L = meshid_l;
			
		MEEPROM_WriteByte(EEPROM_MESHID_H_ADDRESS, ns_host_meshid_H);
		MEEPROM_WriteByte(EEPROM_MESHID_L_ADDRESS, ns_host_meshid_L);

	}

}


/*----------------------------------------------------------------------------
	sicp_recv_DD
-----------------------------------------------------------------------------*/
void sicp_recv_DD(void)
{
	switch(sicp_buf[4]){
		case 0x01://����״̬֡
			ns_signal = sicp_buf[5];
			ns_status = sicp_buf[6];
			ns_phonenum = sicp_buf[7];
			ns_own_meshid_H = sicp_buf[8];
			ns_own_meshid_L = sicp_buf[9];
	
			break;
		case 0x02:		

			break;
		case 0x03:		

			break;
		
	}


}


/*-------------------------------------------------------------------------
    SICP�������ݷ���*
-------------------------------------------------------------------------*/
void sicp_rev_anaylze(void)
{
	u8 i, num ,ret, mdid;
	SICP_Message receipt;

	if (sicp_buf[0] == 0xDD){	//Network	Status	Reporting	{
		sicp_recv_DD();
	}
		
	if (sicp_buf[0] == 0xEE){

		cmd_led_flag = 1;
		
		rev_message_id 	= sicp_buf[2];
		rev_mesh_id_H	= sicp_buf[3];
		rev_mesh_id_L  	= sicp_buf[4];
		
//		if(ns_own_meshid_H){				//���յ��Լ���meshid
//			if((rev_mesh_id_H == ns_own_meshid_H) && (rev_mesh_id_L == ns_own_meshid_H) ){		//�Լ����͵�����
//				return;
//			}
//		}

		switch(sicp_buf[6]){
			case 0x10:		//heartbeat��ȡ��ǰ�豸״̬��Ϣ(�����ȣ����ص�)
				if(sicp_buf[7] == 0x02){
					sicp_heart_beat(SICP_RECV);
				}
				break;
			case 0x51:	//һ��SC�µ���SLC���ͨ������
//			case 0x52:
//			case 0x53:
//			case 0x54:				
				mdid = sicp_buf[7] >> 4;
				ret = slcspc_single_action_dimmer(sicp_buf[6], sicp_buf[7], sicp_buf[8], sicp_buf[9]);
				if(ret == 0){		
					sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
					
					//���������Ϣ�����Եȴ������������״̬��ѯ 
					sc.slc[mdid -1].singleDimmer = sicp_buf[9] + SLC_DIMMER_DELAY_TIME;

				}else{
					sicp_receipt(0x03, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
				}
				break;
				
			case 0x55:	//�򿪻�رտ���	
				mdid = sicp_buf[7] >> 4;
				ret = slcspc_action_plug(sicp_buf[6], sicp_buf[7], sicp_buf[8], sicp_buf[9]);				
				if(ret == 0) {
					sicp_receipt_Done(0x05, rev_message_id, rev_mesh_id_H, rev_mesh_id_L, 0x02, mdid);

					if((rev_mesh_id_H != ns_host_meshid_H) || (rev_mesh_id_L != ns_host_meshid_L)){
						
						sc.spc[mdid -1].syncTimes = SPC_SYNC_DELAY_TIME;
					}
				}else{
					sicp_receipt(0x03, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
				}			
				break;
				
			case 0x57:	//һ��SC�¶��SLC���ͨ������
				num = sicp_buf[7];
				sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
				
				slcspc_multiple_action_dimmer(num);

				//���������Ϣ�����Եȴ������������״̬��ѯ 
				sc.slcMultipleDimmer = sicp_buf[9 + num] + SLC_DIMMER_DELAY_TIME;
				break;
				
			case 0x58:	//���SPC���ͨ������ ֱ�ӻظ�������
				num = sicp_buf[7];
				ret = slcspc_multiple_action_plug(num);
				if((rev_mesh_id_H == ns_host_meshid_H) && (rev_mesh_id_L == ns_host_meshid_L)){			/* SS�Ŀ��� */
					sicp_heart_beat(SICP_RECV);
				}else{										/* �������ƣ���ST��Ӧ����Ƴɹ�������SSͬ��״̬ */
					sicp_receipt(0x02, rev_message_id, rev_mesh_id_H, rev_mesh_id_L);
					sc.spcMultipleSync = SPC_SYNC_DELAY_TIME;
				}
							
				break;
				
			case 0xAA:	/* ���ջ�ִ */	
				malfunction_sended_confirm(rev_message_id);
				break;
				
			case 0x05:	//Alert Command,SC���յ�����ָ������κδ���
				break;
				
			case 0xB0:	//Gateway	Mesh	ID	Broadcasting
				if(rev_message_id == 0){
											
					if((sc.deviceID[0] == sicp_buf[7]) && (sc.deviceID[1] == sicp_buf[8]) && 
					    (sc.deviceID[2] == sicp_buf[9]) && (sc.deviceID[3] == sicp_buf[10])){

						host_meshid_save(rev_mesh_id_H, rev_mesh_id_L);
						rev_ssbroadcast = 1;
						send_device_info_all(0xAA, rev_message_id);

					}					
				}
				break;
				
			default:
				break;
				
		}
		
	}
	
}


void sicp_send_message(SICP_Message *tx,u8 payload_len)
{
	//u8 payload_len;
	//payload_len = strlen(tx->payload);
	UART2_Send_Buf[0] = tx->frame_h1;
	UART2_Send_Buf[1] = tx->frame_h2;
	UART2_Send_Buf[2] = tx->message_id;
	UART2_Send_Buf[3] = tx->mesh_id_H;
	UART2_Send_Buf[4] = tx->mesh_id_L;
	UART2_Send_Buf[5] = 4+payload_len;
	mymemcpy(&UART2_Send_Buf[6],tx->payload,payload_len);
	UART2_Send_Buf[6+payload_len] = Check_Sum(&UART2_Send_Buf[2],UART2_Send_Buf[5]);
	uart1_send(UART2_Send_Buf,7+payload_len);
	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//�ȴ�������ݷ������
}



/*************SICP�ظ�����**************************/
//���ͽ��ջ�ִ
void sicp_receipt(u8 type,u8 msgid,u8 meshid_h,u8 meshid_l)
{
	SICP_Message receipt;
	
	receipt.frame_h1 = 0xEE;
	receipt.frame_h2 = 0xAA;
	receipt.message_id = msgid;
	receipt.mesh_id_H = meshid_h;
	receipt.mesh_id_L = meshid_l;
	receipt.payload[0] = 0xAA;
	receipt.payload[1] = type;
	
	sicp_send_message(&receipt, 2);
}


//����ִ�л�ִ
void sicp_receipt_Done(u8 type, u8 msgid, u8 meshid_h, u8 meshid_l, u8 method, u8 mdid)
{
	SICP_Message receipt;
	receipt.frame_h1 = 0xEE;
	receipt.frame_h2 = 0xAA;
	receipt.message_id = msgid;
	receipt.mesh_id_H = meshid_h;
	receipt.mesh_id_L = meshid_l;
	receipt.payload[0] = 0xAA;
	receipt.payload[1] = type;
	switch(method){
		case 0x01:	//action Dimmer�����ִ�л�ִ
			receipt.payload[2] = mdid;
			receipt.payload[3] = sc.slc[mdid-1].ch1_status;
			receipt.payload[4] = sc.slc[mdid-1].ch2_status;
			receipt.payload[5] = sc.slc[mdid-1].ch3_status;
			receipt.payload[6] = sc.slc[mdid-1].ch4_status;
			sicp_send_message(&receipt,7);

			break;
		case 0x02:	//action plug switch�򿪻�رտ��ص�ִ�л�ִ
			receipt.payload[2] = mdid;
			receipt.payload[3] = sc.spc[mdid-1].ch1_status;
			receipt.payload[4] = sc.spc[mdid-1].ch2_status;
			receipt.payload[5] = sc.spc[mdid-1].ch3_status;
			receipt.payload[6] = sc.spc[mdid-1].ch4_status;
			sicp_send_message(&receipt, 7);
			break;
		default:
			break;
		
	}
	
}

/*----------------------------------------------------------------------------
	�ظ�����
-----------------------------------------------------------------------------*/
void sicp_heart_beat(SICP_RXTX_TYPE s)
{
	u8 i, len, data, cnt, tmp;
	SICP_Message cmd_data;
	
	cmd_data.frame_h1 = 0xEE;
	if(s == SICP_RECV){
		cmd_data.frame_h2 = 0xAA;
		cmd_data.message_id = rev_message_id;
	}else{
		cmd_data.frame_h2 = 0xEE;
		cmd_data.message_id = sicp_get_message_id();
	}

	cmd_data.mesh_id_H = ns_host_meshid_H;
	cmd_data.mesh_id_L = ns_host_meshid_L;
	cmd_data.payload[0] = 0x11;

 	len = 9;	
	data = 0;
	cnt = 0;
	for(i = 0; i < 15; i++){
		cnt++;
		tmp = 0;
		if(sc.slc[i].MDID){
			tmp |= sc.slc[i].ch1_status ? 0x01 : 0;
			tmp |= sc.slc[i].ch2_status ? 0x02 : 0;
			tmp |= 0x08;
			data |= (cnt == 1) ? (tmp << 4) : tmp;
			
			if(sc.slc[i].ch1_status){ cmd_data.payload[len++] = sc.slc[i].ch1_status;}
			if(sc.slc[i].ch2_status){ cmd_data.payload[len++] = sc.slc[i].ch2_status;}
								
		}else if(sc.spc[i].MDID){
			tmp |= sc.spc[i].ch1_status ? 0x01 : 0;
			tmp |= sc.spc[i].ch2_status ? 0x02 : 0;
			tmp |= sc.spc[i].ch3_status ? 0x04 : 0;
			data |= (cnt == 1) ? (tmp << 4) : tmp;

		}else{
			tmp = 0x0c;
			data |= (cnt == 1) ? (tmp << 4) : tmp;
		}
		
		if(cnt >= 2){		/* һ���ֽ���� */
			cmd_data.payload[(i + 1) /2] = data;
			data = 0;
			cnt = 0;
		}		
	}
	cmd_data.payload[8] = data;
	
	sicp_send_message(&cmd_data, len);
	
}

/*----------------------------------------------------------------------------
	1���˺�������1sѭ���У������ϱ������ʵ�ʵ���
	2�����ú���ÿ��ֻ�ܷ���һ���豸������
	3����ʱ�����ش� 
-----------------------------------------------------------------------------*/
void report_energy_consum(void)
{
	static u8 eg_timeout = 0;
	static u8 counts = 0;
	static u8 i = 0;				/* �ж��spc�豸ʱ��������ǰ����豸��β�ѯ�뷢�� */
	
	SICP_Message ec;
	
	counts++;
	if(counts >= 60 * ENERGY_CONSUM_REPORT_MINUTE){			/* �����ϱ����� */
		
		for( ; i < 15; i++){
			
			if(sc.spc[i].MDID){			//��ID˵��SPC����
				if(slcspc_get_energy_consum(i) == 0){			/* ��ȡ�ɹ� */

					ec.frame_h1 = 0xEE;
					ec.frame_h2 = 0xEE;
					ec.message_id = sicp_get_message_id();
					ec.mesh_id_H = ns_host_meshid_H;
					ec.mesh_id_L = ns_host_meshid_L;
					ec.payload[0] = 0x2A;
					ec.payload[1] = (u8)(sc.spc[i].energy_consume >> 8);
					ec.payload[2] = (u8)(sc.spc[i].energy_consume & 0xff);
					ec.payload[3] = sc.spc[i].MDID;
					sicp_send_message(&ec, 4);

//					sc.spc[i].energy_consum_msgid = ec.message_id;		/* ��ʱ���������ϱ����ش� */

					break;			/* ÿ��ֻ�ܷ���һ���豸 */
				}
			}
			
		}
		
		i++;				/* ��break����ѭ��ʱ�����ﱣ֤�´�ִ�д���һ���豸��ʼ */
		if(i >= 15){			/* ѭ����ϣ����¿�ʼ�������� */
			counts = 0;
			i = 0;	
		}
		
	}
	
}



/*----------------------------------------------------------------------------
	�ϵ�60���û���ͣ�����������device info
	1sִ��һ��
	�з��ͷ���1���޷��ͷ���0
	����©��:��һ���ϵ�ʱmeshidΪ0����û�н��յ����صĹ㲥�����޷��Զ�����
-----------------------------------------------------------------------------*/
u8 send_device_info_active(void)
{
	static u16 counts = 0;
	u8 ret = 0;
	u8 waits = 60 + (ns_host_meshid_L & 0x0f);

	if(ns_host_meshid_H){			/* meshid ���� */

		counts++;
		
		if(counts >= waits){
			send_device_info_all(0xEE, 0);
			counts = 0;
			ret = 1;
		}
	}
	return ret;
	
}




/*----------------------------------------------------------------------------
	һ�����ݷ������е���Ϣ
-----------------------------------------------------------------------------*/
void send_device_info_all(u8 type, u8 msgid)
{
	u8 i, tmp;
	SICP_Message di;
	//SC--0xB1
	di.frame_h1 = 0xEE;
	di.frame_h2 = type;
	if(type == 0xEE){
		di.message_id = sicp_get_message_id();
	}
	if(type == 0xAA){
		di.message_id = msgid;
	}
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB1;
	di.payload[1] =	sc.deviceID[0];
	di.payload[2] =	sc.deviceID[1];
	di.payload[3] =	sc.deviceID[2];
	di.payload[4] =	sc.deviceID[3];
	di.payload[5] =	sc.model;
	di.payload[6] = sc.firmware_version;
	di.payload[7] = sc.HWTtest;

	tmp = 0;
	for(i=1; i<8; i++){
		if(sc.slc[i -1].MDID){
			tmp |= BIT[i];
		}
	}
	di.payload[8] = tmp;
	
	tmp = 0;
	for(i=0; i<8; i++){
		if(sc.slc[i+7].MDID){
			tmp |= BIT[i];
		}
	}
	di.payload[9] = tmp;

	tmp = 0;
	for(i=1; i<8; i++){
		if(sc.spc[i -1].MDID){
			tmp |= BIT[i];
		}
	}
	di.payload[10] = tmp;
	
	tmp = 0;
	for(i=0; i<8; i++){
		if(sc.spc[i+7].MDID){
			tmp |= BIT[i];
		}
	}
	di.payload[11] = tmp;
	
	sicp_send_message(&di, 12);
	
}


//SLC�ϵ�㱨��Ϣ
void send_slc_device_info(u8 i)
{
	SICP_Message di;
	
	di.frame_h1 = 0xEE;
	di.frame_h2 = 0xEE;
	di.message_id = sicp_get_message_id();
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB2;
	di.payload[1] =	sc.slc[i].deviceID[0];
	di.payload[2] =	sc.slc[i].deviceID[1];
	di.payload[3] =	sc.slc[i].deviceID[2];
	di.payload[4] =	sc.slc[i].deviceID[3];
	di.payload[5] =	sc.slc[i].model;
	di.payload[6] = sc.slc[i].firmware_version;
	di.payload[7] = sc.slc[i].HWTtest;
	di.payload[8] = sc.slc[i].MDID;
	sicp_send_message(&di,9);
	
}

//SPC�ϵ�㱨��Ϣ
void send_spc_device_info(u8 i)
{
	SICP_Message di;
	di.frame_h1 = 0xEE;
	di.frame_h2 = 0xEE;
	di.message_id = sicp_get_message_id();
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB3;
	di.payload[1] =	sc.spc[i].deviceID[0];
	di.payload[2] =	sc.spc[i].deviceID[1];
	di.payload[3] =	sc.spc[i].deviceID[2];
	di.payload[4] =	sc.spc[i].deviceID[3];
	di.payload[5] =	sc.spc[i].model;
	di.payload[6] = sc.spc[i].firmware_version;
	di.payload[7] = sc.spc[i].HWTtest;
	di.payload[8] = sc.spc[i].MDID;
	sicp_send_message(&di,9);
	
}

//SC����device info�����ϵ��鵽device id����Ϣ����
void send_device_info(void)
{
	u8 i;
	//SC -- 0xB1
//	send_sc_device_info();
	delay(200);
	//SLC -- 0xB2
	for(i = 0; i < 15;i++){
		if(sc.slc[i].MDID){		//MDID��Ϊ��˵��I2C�յ��ظ�
			send_slc_device_info(i);
			delay(100);
		}
	}
	//SPC -- 0xB3
	for(i = 0; i < 15;i++){
		if(sc.spc[i].MDID){//MDID��Ϊ��˵��I2C�յ��ظ�
			send_spc_device_info(i);
			delay(100);
		}
	}
	di_timeout = 5;
	
}


/*-------------------------------------------------------------------------
    addr = 0 SC
    addr > 0 SLC\SPC
-------------------------------------------------------------------------*/
void send_malfunction(u8 mdid, u8 devType)
{
	SICP_Message mal;

	mal.frame_h1 = 0xEE;
	mal.frame_h2 = 0xEE;
	mal.message_id = sicp_get_message_id();
	mal.mesh_id_H = ns_host_meshid_H;
	mal.mesh_id_L = ns_host_meshid_L;
	mal.payload[0] = 0x0A;
	mal.payload[1] = devType;
	mal.payload[2] = mdid;
	
	if(devType == DEVICE_SC){
		mal.payload[3] = sc.HWTtest;
		sc.malfunction_msgid = mal.message_id;		
		
	}else if(devType == DEVICE_SLC){
		mal.payload[3] = sc.slc[mdid -1].HWTtest;
		sc.slc[mdid - 1].malfunction_msgid = mal.message_id;
		
	}else{
		mal.payload[3] = sc.spc[mdid -1].HWTtest;
		sc.spc[mdid -1].malfunction_msgid = mal.message_id;
	}

	sicp_send_message(&mal, 4);
	
}



/*-------------------------------------------------------------------------
    ȷ�Ϲ�����Ϣ�Ѿ����� 
-------------------------------------------------------------------------*/
void malfunction_sended_confirm(u8 recvMsgid)
{
	u8 i;

	if(recvMsgid > 0){
		
		if(sc.malfunction_msgid == recvMsgid){		/* SC */
			sc.malfunction_msgid = 0;

		}else{
		
			for(i = 0; i < 15; i++){
			
				if(sc.slc[i].malfunction_msgid == recvMsgid){ 
					sc.slc[i].malfunction_msgid = 0;
				}
				
				if(sc.spc[i].malfunction_msgid == recvMsgid){ 
					sc.spc[i].malfunction_msgid = 0;
				}			
			}
			
		}

	}

}


/*-------------------------------------------------------------------------
	���ϼ��
	�˺�������1s�����У�һ��ֻ����һ���豸�Ĺ�����Ϣ
-------------------------------------------------------------------------*/
void malfunction_detect(void)
{
	static u8 sc_HWTest = 0;
	static u8 slcspc_HWTest[15] = {0};

	static u8 i = 0;
	static u8 j = 0;

	if(sc.HWTtest != sc_HWTest){		/* SC */
		sc_HWTest = sc.HWTtest;
		send_malfunction(0, DEVICE_SC);
		return;
	}

	for( ; i < 15; i++){

		if(sc.slc[i].MDID){	
			if(sc.slc[i].HWTtest != slcspc_HWTest[i]){
				slcspc_HWTest[i] = sc.slc[i].HWTtest;		/* ��֤���ϲ��ᱻ�ظ����� */
				send_malfunction(i + 1, DEVICE_SLC);	
				return;
			}
		}
		if(sc.spc[i].MDID){ 
			if(sc.spc[i].HWTtest != slcspc_HWTest[i]){		
				slcspc_HWTest[i] = sc.spc[i].HWTtest;
				send_malfunction(i + 1, DEVICE_SPC);					
				return;
			}
		}
	}
	i = 0;


	/* �ش����� */
	if(sc.malfunction_msgid){			/* û�յ���ִ */		
		send_malfunction(0, DEVICE_SC);		
		return;
	}
	
	for( ; j < 15; j++){

		if(sc.slc[j].MDID && sc.slc[j].malfunction_msgid){		/* û�յ���ִ */		
			j++;									/* ��֤���ϲ��ᱻ�ظ����� */
			send_malfunction(j, DEVICE_SLC);					
			return;
		}	
		if(sc.spc[j].MDID && sc.spc[j].malfunction_msgid){		/* û�յ���ִ */	
			j++;									/* ��֤���ϲ��ᱻ�ظ����� */
			send_malfunction(j, DEVICE_SPC);					
			return;
		}
	}
	j = 0;

}



/**
  * @brief  check sum(cumulative sum)
  * @param  u8 *sendbuf,u8 length.
  * @retval u8 result
  */
u8 slcspc_check_sum(u8 *buf, u8 length)
{
	u8 i;
	u8 result = *buf++;
	
	for(i = 1; i < length; i++)
	{
		result ^= *buf++;
	}
	
	return result;
}

/*----------------------------------------------------------------------------
	swuart send and recv
-----------------------------------------------------------------------------*/
void slcspc_send_and_recv(void)
{
	u8 status = 0;
				
	swuart_frame.rxhas = 0;
	swuart_frame.rxlen = 0;
	
	swuart_frame.txhas = 1;
	UART3->DR = swuart_frame.txbuf[0];

	while(swuart_frame.txhas < swuart_frame.txlen);	/* �ȴ�������� */

	swuart_frame.txhas = 0;
	swuart_frame.txlen = 0;

	/* ������ɽ������ */	
	swuart_frame.rxtxflag = 2;
	swuart_frame.flow  = 2;
	swuart_frame.rxhas = 0;
	swuart_frame.rxlen = 0;
	swuart_frame.txOverWait = 0;	

	/* �жϵȴ����ճ�ʱ */
	while(swuart_frame.flow == 2){
		if(swuart_frame.txOverWait > SWUART_TX_OVER_WAIT_TIME){
			swuart_frame.rxtxflag = 0;			/* ��ʱ����������  */
			return;
		}
	}		 
	/* ��ʼ���� */
	/* �ж��Ƿ������� */	
	while(swuart_frame.flow == 3){
		if(swuart_frame.rxOverWait > SWUART_RX_OVER_WAIT_TIME){
			swuart_frame.flow = 4;				/* ������� */
			swuart_frame.rxtxflag = 0;	
		}
	}
			
}




/*----------------------------------------------------------------------------
	uart data handle
-----------------------------------------------------------------------------*/
u8 slcspc_one_process(I2C_Message *tx, u8 payload_len, u8 addr)
{
	u8 i = addr - 1;
		
	swuart_frame.txbuf[0] = tx->frame_h1;	//0x7e
	swuart_frame.txbuf[1] = tx->frame_h2;	//0x7e
	swuart_frame.txbuf[2] = addr;			//addr
	swuart_frame.txbuf[3] = tx->message_id;	//msg id
	swuart_frame.txbuf[4] = payload_len + 3;			//len
	mymemcpy(&swuart_frame.txbuf[5], tx->payload, payload_len);
	swuart_frame.txbuf[payload_len + 5] = Check_Sum(&swuart_frame.txbuf[2], swuart_frame.txbuf[4]);
	
	swuart_frame.txhas = 0;
	swuart_frame.txlen = payload_len + 6;
	swuart_frame.rxtxflag = 1;
	swuart_frame.flow = 0;
	swuart_frame.rxbuf[0] = 0;
	swuart_frame.rxbuf[1] = 0;

	slcspc_select_channel(addr);
	slcspc_send_and_recv();			/* �ȴ����ͽ������̴������ */
	slcspc_select_channel_reset();
	
	if(swuart_frame.flow == 4){		/* ������� */	
		if(swuart_frame.rxbuf[0] == 0x7e && swuart_frame.rxbuf[1] == 0x7e){
			if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){//У����ȷ

				if(sc.slc[i].MDID){ 		/* slc */
					sc.slc[i].offLineCnt = 0;
					sc.slc[i].HWTtest &= ~SLCSPC_OFFLINE_BIT;
				}
				if(sc.spc[i].MDID){		/* spc */
					sc.spc[i].offLineCnt = 0;
					sc.spc[i].HWTtest &= ~SLCSPC_OFFLINE_BIT;
				}

				return 0;
			}			
		}		
	}
	
	if(sc.slc[i].MDID){			/* slc */
		sc.slc[i].offLineCnt++;
		if(sc.slc[i].offLineCnt >= 5){sc.slc[i].HWTtest |= SLCSPC_OFFLINE_BIT;} 		/* ����5�β�ͨѶ�����ɹ������ж�Ϊ���� */
	}
	if(sc.spc[i].MDID){			/* spc */
		sc.spc[i].offLineCnt++;
		if(sc.spc[i].offLineCnt >= 5){sc.spc[i].HWTtest |= SLCSPC_OFFLINE_BIT;} 		/* ����5�β�ͨѶ�����ɹ������ж�Ϊ���� */
	}

	return 1; 
	
}


 
 /*----------------------------------------------------------------------------
 
 -----------------------------------------------------------------------------*/
void slcspc_device_info(void)
{
	u8 i, ret;
	I2C_Message di;

	swuart_frame.devflag = 0;
	
	for(i = 1; i <= 15; i++){
	
		di.frame_h1 = 0x7E;
		di.frame_h2 = 0x7E;
		di.message_id = slcspc_get_message_id();
		di.payload[0] = 0xFE;		//�Լ�����
		di.payload[1] = 0x01;		//�Լ�����

		sc.slc[i -1].MDID = 0;
		sc.spc[i -1].MDID = 0;
		ret = slcspc_one_process(&di, 2, i);
		
		if (ret == 0){
			
//			if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){//У����ȷ
			
				swuart_frame.devflag |= (1 << ( i -1));
				
				if(swuart_frame.rxbuf[5] == 0xB2){		//��ΪSLC
					sc.slc[i-1].MDID = i;
					sc.slc[i-1].deviceID[0] = swuart_frame.rxbuf[6];
					sc.slc[i-1].deviceID[1] = swuart_frame.rxbuf[7];
					sc.slc[i-1].deviceID[2] = swuart_frame.rxbuf[8];
					sc.slc[i-1].deviceID[3] = swuart_frame.rxbuf[9];
					sc.slc[i-1].model = swuart_frame.rxbuf[10];
					sc.slc[i-1].firmware_version = swuart_frame.rxbuf[11];
					sc.slc[i-1].HWTtest = swuart_frame.rxbuf[12];	
				}
				if(swuart_frame.rxbuf[5] == 0xB3){	//��ΪSPC
					sc.spc[i-1].MDID = i;
					sc.spc[i-1].deviceID[0] = swuart_frame.rxbuf[6];
					sc.spc[i-1].deviceID[1] = swuart_frame.rxbuf[7];
					sc.spc[i-1].deviceID[2] = swuart_frame.rxbuf[8];
					sc.spc[i-1].deviceID[3] = swuart_frame.rxbuf[9];
					sc.spc[i-1].model = swuart_frame.rxbuf[10];
					sc.spc[i-1].firmware_version = swuart_frame.rxbuf[11];
					sc.spc[i-1].HWTtest = swuart_frame.rxbuf[12];	

				}
				
//			}
			
		}
		

	}
	
}




/*----------------------------------------------------------------------------

//ÿ5s����heart,

-----------------------------------------------------------------------------*/
void slcspc_heartbeat(void)
{
	u8 i, j, ret;
	I2C_Message hb;
	
	for(j = 0; j < 15; j++){

		if(sc.slc[j].MDID || sc.spc[j].MDID){

			hb.frame_h1 = 0x7E;
			hb.frame_h2 = 0x7E;
			hb.message_id = slcspc_get_message_id();
			hb.payload[0] = 0x03;
			hb.payload[1] = 0x03;
			hb.payload[2] = j + 1;
			
			ret = slcspc_one_process(&hb, 3, j + 1);
			
			if (ret == 0){
//				if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){	//У����ȷ

					if(swuart_frame.rxbuf[5] == 0x06){
						
						if(sc.slc[j].MDID){
							sc.slc[j].ch1_status = swuart_frame.rxbuf[7];
							sc.slc[j].ch2_status = swuart_frame.rxbuf[8];
//							sc.slc[j].ch3_status = swuart_frame.rxbuf[9];
//							sc.slc[j].ch4_status = swuart_frame.rxbuf[10];
							sc.slc[j].HWTtest = swuart_frame.rxbuf[11];								
						}
						if(sc.spc[j].MDID){
							
							sc.spc[j].ch1_status = swuart_frame.rxbuf[7];
							sc.spc[j].ch2_status = swuart_frame.rxbuf[8];
							sc.spc[j].ch3_status = swuart_frame.rxbuf[9];
//							sc.spc[j].ch4_status = swuart_frame.rxbuf[10];
							sc.spc[j].HWTtest = swuart_frame.rxbuf[11];	
							
						}
					}
										
//				}
							
			}
					
		}
				
	}
		
}






/*----------------------------------------------------------------------------
//��ȡSPC�ĵ������ݣ���ȡ���ĵ�������Ϊ�˴ζ�ȡ��ǰ�ζ�ȡ֮�����ĵĵ���

-----------------------------------------------------------------------------*/
u8 slcspc_get_energy_consum(u8 i)
{
	u8 ret;
	I2C_Message msg;
	
	msg.frame_h1 = 0x7E;
	msg.frame_h2 = 0x7E;
	msg.message_id = slcspc_get_message_id();
	msg.payload[0] = 0xFE;		//�Լ�����
	msg.payload[1] = 0x02;		//�Լ�����

	sc.spc[i].energy_consume = 0;

	ret = slcspc_one_process(&msg, 2, i + 1);		
	if (ret == 0){
		if(swuart_frame.rxbuf[5] == 0x2A){
			if(sc.spc[i].MDID == swuart_frame.rxbuf[8]){
				sc.spc[i].energy_consume = swuart_frame.rxbuf[6] * 256 + swuart_frame.rxbuf[7];
				return 0;
			}				
		}
	}
		
	
	return 1;	
	
}


/*----------------------------------------------------------------------------

//SC�յ�SIDP��action dimmer��ת���͵���SLC��ͨ��action dimmerָ���SLC

ret = slcspc_one_process(&msg, 4, mdid);		
if (ret == 0){
	if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){ //У����ȷ
	
	}

}

-----------------------------------------------------------------------------*/
u8 slcspc_single_action_dimmer(u8 action, u8 mdid_channel, u8 value, u8 ext)
{
	u8 ret;
	I2C_Message msg;
	u8 mdid = mdid_channel >> 4;
	
	msg.frame_h1 = 0x7E;
	msg.frame_h2 = 0x7E;
	msg.message_id = slcspc_get_message_id();
	msg.payload[0] = action;
	msg.payload[1] = mdid_channel;
	msg.payload[2] = value;
	msg.payload[3] = ext;

	//��ȡslc�Ƿ��������ջ�ִAA 02
	ret = slcspc_one_process(&msg, 4, mdid);		

	return ret;
	
}



/*----------------------------------------------------------------------------
//���Ͳ�ѯaction dimmerִ�н��
-----------------------------------------------------------------------------*/
u8 slcspc_single_action_dimmer_result(u8 mdid)
{
	u8 ret;
	I2C_Message msg;
	
	msg.frame_h1 = 0x7E;
	msg.frame_h2 = 0x7E;
	msg.message_id = slcspc_get_message_id();
	msg.payload[0] = 0x59;
	msg.payload[1] = mdid;

	ret = slcspc_one_process(&msg, 2, mdid);		
	if (ret == 0){
//		if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){ //У����ȷ
			if((swuart_frame.rxbuf[5] == 0xAA) && (swuart_frame.rxbuf[6]==0x05)){
				sc.slc[swuart_frame.rxbuf[7] -1].ch1_status = swuart_frame.rxbuf[8];
				sc.slc[swuart_frame.rxbuf[7] -1].ch2_status = swuart_frame.rxbuf[9];
				sc.slc[swuart_frame.rxbuf[7] -1].ch3_status = swuart_frame.rxbuf[10];
				sc.slc[swuart_frame.rxbuf[7] -1].ch4_status = swuart_frame.rxbuf[11];
			}		
//		}
	
	}
	
	return ret;
	
}





/*----------------------------------------------------------------------------

//SC�յ�SIDP��action plug switch��ת����SPC

-----------------------------------------------------------------------------*/
u8 slcspc_action_plug(u8 action, u8 mdid_channel, u8 value, u8 ext)
{
	u8 ret;
	I2C_Message msg;
	u8 mdid = mdid_channel >> 4;
	
	msg.frame_h1 = 0x7E;
	msg.frame_h2 = 0x7E;
	msg.message_id = slcspc_get_message_id();
	msg.payload[0] = action;
	msg.payload[1] = mdid_channel;
	msg.payload[2] = value;
	msg.payload[3] = ext;

	ret = slcspc_one_process(&msg, 4, mdid);		
	if (ret == 0){
//		if(Check_Sum(&swuart_frame.rxbuf[2], swuart_frame.rxbuf[4]) == swuart_frame.rxbuf[swuart_frame.rxhas - 1]){ //У����ȷ

			if((swuart_frame.rxbuf[5] == 0xAA) && (swuart_frame.rxbuf[6] == 0x05)){
				sc.spc[swuart_frame.rxbuf[7] -1].ch1_status = swuart_frame.rxbuf[8];
				sc.spc[swuart_frame.rxbuf[7] -1].ch2_status = swuart_frame.rxbuf[9];
				sc.spc[swuart_frame.rxbuf[7] -1].ch3_status = swuart_frame.rxbuf[10];
				sc.spc[swuart_frame.rxbuf[7] -1].ch4_status = swuart_frame.rxbuf[11];
			}
	
//		}
	
	}
	
	return ret;
	
}

/*----------------------------------------------------------------------------

//SC�յ�SIDP��action dimmer��ת���Ͷ��SLC��ͨ��action dimmerָ���SLC
//ע��ú�����Ҫֱ���õ�sicp_buf[*]����

-----------------------------------------------------------------------------*/
u8 slcspc_multiple_action_dimmer(u8 num)
{
	u8 i;

	for(i = 0; i < num; i++){
		
		slcspc_single_action_dimmer(0x51, sicp_buf[8 + i], sicp_buf[8 + num], sicp_buf[9 + num]);

	}

	return 0;

}


/*----------------------------------------------------------------------------

//SC�յ�SIDP��action plug��ת���Ͷ��SpC��ͨ��action plug
//ע��ú�����Ҫֱ���õ�sicp_buf[*]����

-----------------------------------------------------------------------------*/
u8 slcspc_multiple_action_plug(u8 num)
{
	u8 i;

	for(i = 0; i < num; i++){
		
		slcspc_action_plug(0x55, sicp_buf[8 + i], sicp_buf[8 + num], sicp_buf[9 + num]);

	}
	
	return 0;
	
}





void slcspc_select_channel_init(void)
{

	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH, GPIO_MODE_OUT_PP_HIGH_FAST); 
	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW,  GPIO_MODE_OUT_PP_HIGH_FAST); 
	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2, GPIO_MODE_OUT_PP_LOW_FAST); 
	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1, GPIO_MODE_OUT_PP_LOW_FAST); 
	GPIO_Init(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0, GPIO_MODE_OUT_PP_LOW_FAST); 

}


void slcspc_select_channel_reset(void)
{
	GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH);
	GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW);
	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2);
	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1);
	GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0);
}


void slcspc_select_channel(u8 addr)
{
	slcspc_select_channel_reset();

	if(addr & 0x08){
		GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_HIGH);
	}else{
		GPIO_WriteLow(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_LOW);
	}

	if(addr & 0x04){
		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN2);
	}
	
	if(addr & 0x02){
		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN1);
	}

	if(addr & 0x01){
		GPIO_WriteHigh(SLCSPC_SELECT_GPIO, (GPIO_Pin_TypeDef)SLCSPC_SELECT_PIN0);
	}

}





