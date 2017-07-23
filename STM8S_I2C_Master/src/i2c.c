#define _I2C_GLOBAL
#include "stm8s.h"
#include "i2c.h"
#include "uart.h"
#include "i2c_master_poll.h"
#include <stdio.h>
u8 test;
u8 i2c_send_message(u8 type,I2C_Message *tx,u8 payload_len,u8 mdid,u8 nreadbytes)
{
	i2c_tx_buf[0] = tx->frame_h1;
	i2c_tx_buf[1] = tx->frame_h2;
	i2c_tx_buf[2] = tx->message_id;
	i2c_tx_buf[3] = 2+payload_len;
	mymemcpy(&i2c_tx_buf[4],tx->payload,payload_len);
	i2c_tx_buf[4+payload_len] = Check_Sum(&i2c_tx_buf[2],i2c_tx_buf[3]);
	//Uart2_Send(UART2_Send_Buf,5+payload_len);
	if(type == 0x00)	return(I2C_WriteBytes(mdid,i2c_tx_buf,5+payload_len,50));
	else							return(I2C_WriteReadBytes(mdid,i2c_tx_buf,5+payload_len,i2c_rx_buf,nreadbytes,50));
}

//ɨ��SC�µ�SLC��SPC�豸
void scan_device(void)
{
	int ret;
	u8 i;
	device_flag = 0x00;
	for(i=1;i <= 0x0F;i++){
		ret = I2C_WriteBytes(i,NULL,0,10);
		if(ret == IIC_SUCCESS){
			test = i;
			device_flag |= (1<<(i-1));
		}
	}
}

//�ϵ��ѯdevice info
void i2c_device_info(void)
{
	u8 i,ret;
	u8 mdid = 0;
	I2C_Message di;
	u16 temp = device_flag;
	for(i = 1;i <= 15;i++){
		mdid++;
		if((temp & 0x0001) == 0x0001){
			di.frame_h1 = 0x7E;
			di.frame_h2 = 0x7E;
			di.message_id = mdid;
			di.payload[0] = 0xFE;//�Լ�����
			di.payload[1] = 0x01;//�Լ�����
			ret = i2c_send_message(0x01,&di,2,mdid,14);
			if (ret == IIC_SUCCESS){
				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[13]){//У����ȷ
					if(i2c_rx_buf[4] == 0xB2){//��ΪSLC
						sc.slc[mdid-1].MDID = mdid;
						sc.slc[mdid-1].deviceid[0] = i2c_rx_buf[5];
						sc.slc[mdid-1].deviceid[1] = i2c_rx_buf[6];
						sc.slc[mdid-1].deviceid[2] = i2c_rx_buf[7];
						sc.slc[mdid-1].deviceid[3] = i2c_rx_buf[8];
						sc.slc[mdid-1].model = i2c_rx_buf[9];
						sc.slc[mdid-1].firmware = i2c_rx_buf[10];
						sc.slc[mdid-1].HWTtest = i2c_rx_buf[11];
					}
					else if(i2c_rx_buf[4] == 0xB3){//��ΪSPC
						sc.spc[mdid-1].MDID = mdid;
						sc.spc[mdid-1].deviceid[0] = i2c_rx_buf[5];
						sc.spc[mdid-1].deviceid[1] = i2c_rx_buf[6];
						sc.spc[mdid-1].deviceid[2] = i2c_rx_buf[7];
						sc.spc[mdid-1].deviceid[3] = i2c_rx_buf[8];
						sc.spc[mdid-1].model = i2c_rx_buf[9];
						sc.spc[mdid-1].firmware = i2c_rx_buf[10];
						sc.spc[mdid-1].HWTtest = i2c_rx_buf[11];
					}
				}
			}
			
		}
		temp = temp>>1;
	}
}

//ÿ5s����heart,1s��û�н��յ��ظ������ط�20�Σ�����Ӧ����ͨѶ���ϣ��˺�������5sѭ����
void i2c_heartbeat(void)
{
	u8 i,j,ret;
	u8 mdid = 0;
	I2C_Message hb;
	for(i = 1;i <= 15;i++){
		mdid++;
		if(device_flag & 0x01){
			hb.frame_h1 = 0x7E;
			hb.frame_h2 = 0x7E;
			hb.message_id = mdid+15;
			hb.payload[0] = 0x03;
			hb.payload[1] = 0x03;
			hb.payload[2] = mdid;
			ret = i2c_send_message(0x01,&hb,3,mdid,11);
			if (ret == IIC_SUCCESS){
				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[10]){//У����ȷ
					if(i2c_rx_buf[4] == 0x06){
						for(j = 0;j < 15;j++){
							if(sc.slc[j].MDID == i2c_rx_buf[5]){
								sc.slc[j].ch1_status = i2c_rx_buf[6];
								sc.slc[j].ch2_status = i2c_rx_buf[7];
								sc.slc[j].ch3_status = i2c_rx_buf[8];
								sc.slc[j].ch4_status = i2c_rx_buf[9];
								break;
							}
							else if(sc.spc[j].MDID == i2c_rx_buf[5]){
								sc.spc[j].ch1_status = i2c_rx_buf[6];
								sc.spc[j].ch2_status = i2c_rx_buf[7];
								sc.spc[j].ch3_status = i2c_rx_buf[8];
								sc.spc[j].ch4_status = i2c_rx_buf[9];
								break;
							}
						}
					}
				}
				hb_fail_mdid_cnt[mdid-1]=0;//��1�ζ�ȡ���ظ�����������Ӧ��mdidʧ�ܵĴ���
			}
			else{//û�ж�ȡ���ظ�����¼ʧ��mdid�Ĵ���
				hb_fail_mdid_cnt[mdid-1]++;
			}
			device_flag = device_flag>>1;
		}
	}
	for(i = 0; i < 15;i++){
		if(hb_fail_mdid_cnt[i] >= 20){
			for(j = 0; j < 15;j++){//Ѱ�ҹ��ϵ�SLC����SPC
				if(sc.slc[j].MDID == i){
					sc.slc[j].HWTtest &= 0x7F;//SLC STM8S����
					break;
				}
				else if(sc.spc[j].MDID == i){
					sc.spc[j].HWTtest &= 0x7F;//SPC STM8S����
					break;
				}
			}
		}
	}
}

//��ȡSPC�ĵ������ݣ�ÿ30���Ӷ�ȡһ�Σ�����ֵ����
void i2c_get_energy_consum(void)
{
	u8 i,ret;
	I2C_Message eg;
	for(i = 0; i < 15;i++){
		if(sc.spc[i].MDID){
			eg.frame_h1 = 0x7E;
			eg.frame_h2 = 0x7E;
			eg.message_id = sc.spc[i].MDID+30;
			eg.payload[0] = 0xFE;//�Լ�����
			eg.payload[1] = 0x02;//�Լ�����
			ret = i2c_send_message(0x01,&eg,2,sc.spc[i].MDID,9);
			if (ret == IIC_SUCCESS){
				if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[8]){//У����ȷ
					if(i2c_rx_buf[4] == 0x2A){
						if(sc.spc[i].MDID == i2c_rx_buf[7])
							sc.spc[i].energy_consum = ((u16)i2c_rx_buf[5])<<8 + (u16)i2c_rx_buf[6];
					}
				}
			}
		}
	}
}

//SC�յ�SIDP��action dimmer��ת���͵���SLC��ͨ��action dimmerָ���SLC
u8 i2c_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext)
{
	u8 ret;
	I2C_Message sad;
	u8 mdid = (mdid_channel&0xf0)>>4;
	sad.frame_h1 = 0x7E;
	sad.frame_h2 = 0x7E;
	sad.message_id = mdid+45;
	sad.payload[0] = action;
	sad.payload[1] = mdid_channel;
	sad.payload[2] = value;
	sad.payload[3] = ext;
	/*ret = i2c_send_message(0x01,&sad,4,mdid,12);
	if (ret == IIC_SUCCESS){
		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//У����ȷ
			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
				sc.slc[i2c_rx_buf[6]].ch1_status = i2c_rx_buf[7];
				sc.slc[i2c_rx_buf[6]].ch2_status = i2c_rx_buf[8];
				sc.slc[i2c_rx_buf[6]].ch3_status = i2c_rx_buf[9];
				sc.slc[i2c_rx_buf[6]].ch4_status = i2c_rx_buf[10];
			}
		}
	}*/
	//��ȡslc�Ƿ��������ջ�ִAA 02
	ret = i2c_send_message(0x01,&sad,4,mdid,8);
	if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[7]){//У����ȷ
		if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x02)){
			action_dimmer_MDID = i2c_rx_buf[6];
		}
	}
	return ret;
}
//���Ͳ�ѯaction dimmerִ�н��
u8 i2c_single_action_dimmer_result(u8 mdid)
{
	u8 ret;
	I2C_Message sad;
	sad.frame_h1 = 0x7E;
	sad.frame_h2 = 0x7E;
	sad.message_id = 66;
	sad.payload[0] = 0x59;
	sad.payload[1] = mdid;
	ret = i2c_send_message(0x01,&sad,2,mdid,12);
	if (ret == IIC_SUCCESS){
		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//У����ȷ
			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
				sc.slc[i2c_rx_buf[6]-1].ch1_status = i2c_rx_buf[7];
				sc.slc[i2c_rx_buf[6]-1].ch2_status = i2c_rx_buf[8];
				sc.slc[i2c_rx_buf[6]-1].ch3_status = i2c_rx_buf[9];
				sc.slc[i2c_rx_buf[6]-1].ch4_status = i2c_rx_buf[10];
			}
		}
	}
	delay(10);
	return ret;
}


//SC�յ�SIDP��action plug switch��ת����SPC
u8 i2c_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext)
{
	u8 ret;
	I2C_Message ap;
	u8 mdid = (mdid_channel&0xf0)>>4;
	ap.frame_h1 = 0x7E;
	ap.frame_h2 = 0x7E;
	ap.message_id = mdid+60;
	ap.payload[0] = action;
	ap.payload[1] = mdid_channel;
	ap.payload[2] = value;
	ap.payload[3] = ext;
	ret = i2c_send_message(0x01,&ap,4,mdid,12);
	if (ret == IIC_SUCCESS){
		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[11]){//У����ȷ
			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
				sc.spc[i2c_rx_buf[6]-1].ch1_status = i2c_rx_buf[7];
				sc.spc[i2c_rx_buf[6]-1].ch2_status = i2c_rx_buf[8];
				sc.spc[i2c_rx_buf[6]-1].ch3_status = i2c_rx_buf[9];
				sc.spc[i2c_rx_buf[6]-1].ch4_status = i2c_rx_buf[10];
			}
		}
	}
	delay(10);
	return ret;
}

//SC�յ�SIDP��action dimmer��ת���Ͷ��SLC��ͨ��action dimmerָ���SLC
//ע��ú�����Ҫֱ���õ�sicp_buf[*]����
u8 i2c_multiple_action_dimmer(u8 action_dimmer_num)
{
	u8 temp,i=0;
	u8 ret;
	I2C_Message mad;
	temp = action_dimmer_num;
	while(temp--){
		mad.payload[2+i] = sicp_buf[8+i];
		ret = i2c_single_action_dimmer(0x51,sicp_buf[8+i],sicp_buf[8+action_dimmer_num],sicp_buf[9+action_dimmer_num]);
		i++;
		delay(100);
	}
	return ret;
	/*
	temp = action_dimmer_num;
	mad.payload[2+i] = sicp_buf[8+i];
	mad.payload[3+i] = sicp_buf[9+i];//value
	mad.payload[4+i] = sicp_buf[10+i];//ext
	ret = i2c_send_message(0x01,&mad,5+i,mdid,7+5*i);
	if (ret == IIC_SUCCESS){
		if(Check_Sum(&i2c_rx_buf[2],i2c_rx_buf[3]) == i2c_rx_buf[6+5*i]){//У����ȷ
			if((i2c_rx_buf[4] == 0xAA)&&(i2c_rx_buf[5]==0x05)){
				while(temp--){
					sc.slc[i2c_rx_buf[6+j*5]].ch1_status = i2c_rx_buf[7+5*j];
					sc.slc[i2c_rx_buf[6+j*5]].ch2_status = i2c_rx_buf[8+5*j];
					sc.slc[i2c_rx_buf[6+j*5]].ch3_status = i2c_rx_buf[9+5*j];
					sc.slc[i2c_rx_buf[6+j*5]].ch4_status = i2c_rx_buf[10+5*j];
					j++;
				}
			}
		}
	}
	*/
}

//SC�յ�SIDP��action plug��ת���Ͷ��SpC��ͨ��action plug
//ע��ú�����Ҫֱ���õ�sicp_buf[*]����
u8 i2c_multiple_action_plug(u8 action_plug_num)
{
	u8 temp,i=0;
	u8 ret;
	I2C_Message map;
	temp = action_plug_num;
	while(temp--){
		map.payload[2+i] = sicp_buf[8+i];
		ret = i2c_action_plug(0x55,sicp_buf[8+i],sicp_buf[8+action_plug_num],sicp_buf[9+action_plug_num]);
		i++;
		delay(100);
	}
	return ret;
}
