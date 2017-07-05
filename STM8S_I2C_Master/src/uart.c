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
#include "i2c_master_poll.h"
#include "i2c.h"
#include <stdlib.h>


//复制内存
//*des:目的地址
//*src:源地址
//n:需要复制的内存长度(字节为单位)
void mymemcpy(void *des,void *src,u32 n)  
{  
  u8 *xdes=des;
	u8 *xsrc=src; 
  while(n--)*xdes++=*xsrc++;  
}  

/****************************************************************/
//延时函数delay()，有形参Count用于控制延时函数执行次数，无返回值
/****************************************************************/
void delay(u16 Count)
{
  u8 i,j;
  while (Count--)//Count形参控制延时次数
  {
    for(i=0;i<100;i++)
    for(j=0;j<50;j++);
  }
}

/**
  * @brief  产生随机数 1~255
  * @param  None.
  * @retval None
  */

u8 random(u8 xxx)  
{  
  u8 value,iii;  
  for(iii=0;iii<xxx;iii++)  
  {  
    value = rand() % (MAX + 1- MIN) + MIN; //获取一个随机数1~255
	}  
  return value;  
} 


/**
  * @brief  initializion for uart1
  * @param  None.
  * @retval None
  */
void Init_uart2(void)
{
	UART2_DeInit();
	//波特率115200，8位数据位，1位停止位，无校验位，禁用同步模式，允许接收和发送
	UART2_Init((u32)57600,UART2_WORDLENGTH_8D,UART2_STOPBITS_1,UART2_PARITY_NO,UART2_SYNCMODE_CLOCK_DISABLE,	UART2_MODE_TXRX_ENABLE);
	UART2_ITConfig(UART2_IT_TC,ENABLE);//发送完成中断
	UART2_ITConfig(UART2_IT_RXNE_OR,ENABLE);//接收非空中断
	UART2_Cmd(ENABLE);//启用uart1接口
}



/**
  * @brief  uart1 send data start
  * @param  none.
  * @retval None
  */
void Uart2_Send(u8 *buf,u16 len)
{
	if(len >= Uart2_Send_Len)	len = Uart2_Send_Len;
	//mymemcpy(UART2_Send_Buf,buf,len);
	Uart2_Send_Length = len;
	Uart2_Send_Cnt = 1;
	UART2->DR = UART2_Send_Buf[0];
	
}

/**
  * @brief  uart2 tx isr
  * @param  none.
  * @retval None
  */
@interrupt void UART2_TX_ISR(void)
{
	/* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	UART2->SR &= ~0x40;//清除发送完成标志位
	//if (send_count < send_buf[5]+3)
	if (Uart2_Send_Cnt < Uart2_Send_Length)
	{
		UART2->DR = UART2_Send_Buf[Uart2_Send_Cnt];
		Uart2_Send_Cnt++;
	}
	else//发送完成
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

@interrupt void UART2_RX_ISR(void)
{
	rev_deal();
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

/**
  * @brief  receive data deal
  * @param  none
  * @retval none
  */
void rev_deal(void)
{
	u8 temp,temp2,i;
	u8 check_sum;
	temp = (u8)UART2->DR;
	Uart2_Rece_Buf[Uart2_Rec_Cnt] = temp;
	Uart2_Rec_Cnt++;
	switch(Uart2_Rec_Cnt)
	{
		case 1:
			if ((temp != 0xEE) && (temp != 0xDD))	Uart2_Rec_Cnt = 0;
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
			if (Uart2_Rec_Cnt > Uart2_Rec_Len)//防止接收错误后溢出
			{
				Uart2_Rec_Cnt = 0;
			}
			if ((Uart2_Rece_Buf[0] == 0xEE)&&((Uart2_Rece_Buf[1] == 0xEE) || (Uart2_Rece_Buf[1] == 0xAA)))
			{
				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[5] + 2)//接收数据完成
				{
					Uart2_Rec_Cnt = 0;
					check_sum = Check_Sum(Uart2_Rece_Buf,Uart2_Rece_Buf[5] + 2);
					
					if (check_sum == Uart2_Rece_Buf[Uart2_Rece_Buf[5] + 2])//校验正确	
					{
						rev_success = 1;
						for (i = 0;i < Uart2_Rec_Len;i++)
						{
							sicp_buf[i] = Uart2_Rece_Buf[i];
						}
					}
					else
					{
						Uart2_Rec_Cnt = 0;
					}
				}
			}
			else if((Uart2_Rece_Buf[0] == 0xDD)&&(Uart2_Rece_Buf[1] == 0xDD))
			{
				if (Uart2_Rec_Cnt > Uart2_Rece_Buf[3] + 1)//接收数据完成
				{
					Uart2_Rec_Cnt = 0;
					rev_success = 1;
					for (i = 0;i < Uart2_Rec_Len;i++)
					{
						sicp_buf[i] = Uart2_Rece_Buf[i];
					}
				}
			}
			else
			{
				Uart2_Rec_Cnt = 0;
			}
			break;
	}
	if (UART2->SR & 0x20) //|| (UART2->SR & UART2_SR_OR))
	{
		temp2 = UART2->DR;
	}	

}

void clear_uart_buf(void)
{
	u8 i;
	for (i = 0;i < Uart2_Rec_Len;i++)
	{
		sicp_buf[i] = Uart2_Rece_Buf[i] = 0;
	}
}

/*************SICP接收数据分析**********************/
void rev_anaylze(void)
{
	u8 i,action_dimmer_num,ret;
	SICP_Message receipt;
	if(rev_success){
		rev_success = 0;
		if ((sicp_buf[0] == 0xEE) && ((sicp_buf[1]== 0xEE) || (sicp_buf[1]== 0xAA))){
			ble_data_frame = 1;
		}
		else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD)){//Network	Status	Reporting	{
			ble_ctrl_frame = 1;
		}
		
		if (ble_data_frame){
			ble_data_frame = 0;
			rev_message_id = sicp_buf[2];
			rev_mesh_id_H	= sicp_buf[3];
			rev_mesh_id_L = sicp_buf[4];
			switch(sicp_buf[6]){
				case 0x03://heartbeat获取当前设备状态信息(灯亮度，开关等)
					if(sicp_buf[7] == 0x03){
						rev_cmd_data(sicp_buf[8]);
					}
				break;
				case 0x51://一个SC下单个SLC多个通道调光
				case 0x52:
				case 0x53:
				case 0x54:
					rev_ad_message_id = sicp_buf[2];
					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
					rev_ad_channel = (sicp_buf[7]&0x0f);
					action_dimmer_ext = sicp_buf[9]+2;
					//I2C发送调光指令并发送读取调光结果指令
					ret = i2c_single_action_dimmer(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
					if(ret == IIC_SUCCESS)	sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
					//if(ret == IIC_SUCCESS)	sicp_receipt_Done(0x05,rev_message_id,ns_own_meshid_H,ns_own_meshid_L,0x01,rev_mdid);
				break;
				case 0x55://打开或关闭开关
					rev_ad_mdid = (sicp_buf[7]&0xf0)>>4;
					rev_ad_channel = (sicp_buf[7]&0x0f);
					//I2C发送调节开关指令并发送读取调节开关结果指令
					ret = i2c_action_plug(sicp_buf[6],sicp_buf[7],sicp_buf[8],sicp_buf[9]);
					if(ret == IIC_SUCCESS) sicp_receipt_Done(0x05,rev_message_id,ns_host_meshid_H,ns_host_meshid_L,0x02,rev_ad_mdid);
				break;
				case 0x57://一个SC下多个SLC多个通道调光
					action_dimmer_num = sicp_buf[7];
					sicp_receipt_OK(0x02,rev_message_id,ns_own_meshid_H,ns_own_meshid_L);
					//I2C发送多通道调光指令并发送读取调光结果指令
					ret = i2c_multiple_action_dimmer(action_dimmer_num);
					if(ret == IIC_SUCCESS){
						receipt.frame_h1 = 0xEE;
						receipt.frame_h2 = 0xAA;
						receipt.message_id = rev_message_id;
						receipt.mesh_id_H = ns_own_meshid_H;
						receipt.mesh_id_L = ns_own_meshid_L;
						receipt.payload[0] = 0xAA;
						receipt.payload[1] = 0x05;
						i = 0;
						while(action_dimmer_num--){
							rev_ad_mdid = (sicp_buf[8]&0xf0)>>4;
							rev_ad_channel = (sicp_buf[8]&0x0f);
							receipt.payload[2+i*5] = rev_ad_mdid;
							receipt.payload[3+i*5] = sc.slc[rev_ad_mdid].ch1_status;
							receipt.payload[4+i*5] = sc.slc[rev_ad_mdid].ch2_status;
							receipt.payload[5+i*5] = sc.slc[rev_ad_mdid].ch3_status;
							receipt.payload[6+i*5] = sc.slc[rev_ad_mdid].ch4_status;
						}
						sicp_send_message(&receipt,7+i*5);
					}
					break;
				case 0xAA:
					if(sicp_buf[7] == 0x02){
						//收到汇报电量接收回执
						if((rev_message_id >= 1)&&(rev_message_id <= 15))	sc.spc[rev_message_id-1].flag._flag_bit.bit0 = 1;
						//接收到汇报device info接收回执
						else if(rev_message_id == 16)														sc.flag._flag_bit.bit1 = 1;
						else if((rev_message_id >= 21)&&(rev_message_id <= 35))	sc.slc[rev_message_id-21].flag._flag_bit.bit1 = 1;
						else if((rev_message_id >= 36)&&(rev_message_id <= 50))	sc.spc[rev_message_id-36].flag._flag_bit.bit1 = 1;
						//接收到汇报malfunction接收回执
						else if(rev_message_id == 17)														sc.flag._flag_bit.bit2 = 1;
						else if((rev_message_id >= 51)&&(rev_message_id <= 65))	sc.slc[rev_message_id-51].flag._flag_bit.bit2 = 1;
						else if((rev_message_id >= 66)&&(rev_message_id <= 80))	sc.spc[rev_message_id-66].flag._flag_bit.bit2 = 1;
					}
				break;
				case 0x05://Alert Command,SC接收到该条指令不用做任何处理
				break;
				case 0xB0://Gateway	Mesh	ID	Broadcasting
					if(rev_message_id == 0x9E){
						ns_host_meshid_H = rev_mesh_id_H;
						ns_host_meshid_L = rev_mesh_id_L;
						sicp_receipt_OK(0x02,rev_message_id,ns_host_meshid_H,ns_host_meshid_L);
					}
				break;
			}
		}
		else if (ble_ctrl_frame){
			ble_ctrl_frame = 0;
			switch(sicp_buf[4]){
				case 0x01://网络状态帧
				rev_bleheartbeat = 1;
				ns_signal = sicp_buf[5];
				ns_status = sicp_buf[6];
				ns_phonenum = sicp_buf[7];
				ns_own_meshid_H = sicp_buf[8];
				ns_own_meshid_L = sicp_buf[9];
				//ns_host_meshid_H = sicp_buf[10];
				//ns_host_meshid_L = sicp_buf[11];
				//ns_own_meshid_H = 0x80;
				//ns_own_meshid_L = 0x04;
				//ns_host_meshid_H = 0x80;
				//ns_host_meshid_L = 0x05;
				break;
			case 0x02://重置芯片，清空串口缓存，保留mesh连接
				sys_init();
				clear_uart_buf();
				init_slc_spc_done = 0;//重新获取slc和spc的数据
				break;
			case 0x03://重置芯片和网络，退出mesh连接
				sys_init();
				clear_uart_buf();
				init_slc_spc_done = 0;//重新获取slc和spc的数据
				ns_signal = 0x00;
				ns_status = 0x00;
				ns_phonenum = 0x00;
				ns_own_meshid_H = 0x00;
				ns_own_meshid_L = 0x00;
				ns_host_meshid_H = 0x80;
				ns_host_meshid_L = 0xFF;
				break;
			}
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
	Uart2_Send(UART2_Send_Buf,7+payload_len);
	while(!Uart2_Send_Done);	Uart2_Send_Done = 0;//等待这包数据发送完成
}



/*************SICP回复数据**************************/
//发送接收回执
void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L)
{
	SICP_Message receipt;
	receipt.frame_h1 = 0xEE;
	receipt.frame_h2 = 0xAA;
	receipt.message_id = send_message_id;
	receipt.mesh_id_H = ns_host_meshid_H;
	receipt.mesh_id_L = ns_host_meshid_L;
	receipt.payload[0] = 0xAA;
	receipt.payload[1] = type;
	sicp_send_message(&receipt,2);
}
//发送执行回执
void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid)
{
	u8 i = 0;
	SICP_Message receipt;
	receipt.frame_h1 = 0xEE;
	receipt.frame_h2 = 0xAA;
	receipt.message_id = send_message_id;
	receipt.mesh_id_H = ns_host_meshid_H;
	receipt.mesh_id_L = ns_host_meshid_L;
	receipt.payload[0] = 0xAA;
	receipt.payload[1] = type;
	switch(method){
		case 0x01://action Dimmer调光的执行回执
		receipt.payload[2] = mdid;
		for(i = 0;i < 15;i++){
			if(sc.slc[i].MDID == mdid){
				receipt.payload[3] = sc.slc[i].ch1_status;
				receipt.payload[4] = sc.slc[i].ch2_status;
				receipt.payload[5] = sc.slc[i].ch3_status;
				receipt.payload[6] = sc.slc[i].ch4_status;
				sicp_send_message(&receipt,7);
				break;
			}
		}
		break;
		case 0x02://action plug switch打开或关闭开关的执行回执
		receipt.payload[2] = mdid;
		for(i = 0;i < 15;i++){
			if(sc.spc[i].MDID == mdid){
				receipt.payload[3] = sc.spc[i].ch1_status;
				receipt.payload[4] = sc.spc[i].ch2_status;
				receipt.payload[5] = sc.spc[i].ch3_status;
				receipt.payload[6] = sc.spc[i].ch4_status;
				sicp_send_message(&receipt,7);
				break;
			}
		}
		break;
		default:
		break;
	}
}

//回复command data
void rev_cmd_data(u8 moduleid){
	u8 i;
	SICP_Message cmd_data;
	for(i = 0;i < 15;i++){
		if(sc.slc[i].MDID == moduleid){
			cmd_data.frame_h1 = 0xEE;
			cmd_data.frame_h2 = 0xAA;
			cmd_data.message_id = rev_message_id;
			cmd_data.mesh_id_H = ns_host_meshid_H;
			cmd_data.mesh_id_L = ns_host_meshid_L;
			cmd_data.payload[0] = 0x06;
			cmd_data.payload[1] = moduleid;
			cmd_data.payload[2] = sc.slc[i].ch1_status;
			cmd_data.payload[3] = sc.slc[i].ch2_status;
			cmd_data.payload[4] = sc.slc[i].ch3_status;
			cmd_data.payload[5] = sc.slc[i].ch4_status;
			sicp_send_message(&cmd_data,6);
			break;
		}
		if(sc.spc[i].MDID == moduleid){
			cmd_data.frame_h1 = 0xEE;
			cmd_data.frame_h2 = 0xAA;
			cmd_data.message_id = rev_message_id;
			cmd_data.mesh_id_H = ns_host_meshid_H;
			cmd_data.mesh_id_L = ns_host_meshid_L;
			cmd_data.payload[0] = 0x06;
			cmd_data.payload[1] = moduleid;
			cmd_data.payload[2] = sc.spc[i].ch1_status;
			cmd_data.payload[3] = sc.spc[i].ch2_status;
			cmd_data.payload[4] = sc.spc[i].ch3_status;
			cmd_data.payload[5] = sc.spc[i].ch4_status;
			sicp_send_message(&cmd_data,6);
			break;
		}
	}
}
/**************SICP主动发送***************************/
//每30分钟汇报一次电量,此函数放入1s循环中
void report_energy_consum(void){
	u8 i;
	SICP_Message ec;
	static eg_timeout = 0;
	systime_count[3]++;
	if(systime_count[3] >= 60){
		systime_count[3] = 0;
		systime_count[4]++;
		if(systime_count[4] >= 30){
			systime_count[4] = 0;
			i2c_get_energy_consum();
			for(i = 0; i < 15; i++){
				if(sc.spc[i].MDID){//有ID说明SPC存在
				ec.frame_h1 = 0xEE;
				ec.frame_h2 = 0xEE;
				ec.message_id = i+1;
				ec.mesh_id_H = ns_host_meshid_H;
				ec.mesh_id_L = ns_host_meshid_L;
				ec.payload[0] = 0x2A;
				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
				ec.payload[3] =	sc.spc[i].MDID;
				sicp_send_message(&ec,4);
				eg_timeout = 5;
				}
			}
		}
	}
	
	if(eg_timeout){
		if(--eg_timeout == 0){
			for(i = 0;i < 15;i++){
			if((sc.spc[i].MDID!=0) && !sc.spc[i].flag._flag_bit.bit0){//5s后判断sc.spc[i].flag._flag_bit.bit0还是为0，则重发1次
				ec.frame_h1 = 0xEE;
				ec.frame_h2 = 0xEE;
				ec.message_id = random(TIM4->CNTR);
				ec.mesh_id_H = ns_host_meshid_H;
				ec.mesh_id_L = ns_host_meshid_L;
				ec.payload[0] = 0x2A;
				ec.payload[1] =	(u8)((sc.spc[i].energy_consum&0xff00)>>8);
				ec.payload[2] =	(u8)(sc.spc[i].energy_consum&0x00ff);
				ec.payload[3] =	sc.spc[i].MDID;
				sicp_send_message(&ec,4);
				eg_timeout = 5;//每5s重发1次直到接收到回执为止
			}
			}
		}
	}
}

//SC上电汇报信息
void send_sc_device_info(void)
{
	SICP_Message di;
	//SC--0xB1
	di.frame_h1 = 0xEE;
	di.frame_h2 = 0xEE;
	di.message_id = 16;
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB1;
	di.payload[1] =	sc.deviceid[0];
	di.payload[2] =	sc.deviceid[1];
	di.payload[3] =	sc.deviceid[2];
	di.payload[4] =	sc.deviceid[3];
	di.payload[5] =	sc.model;
	di.payload[6] = sc.firmware;
	di.payload[7] = sc.HWTtest;
	di.payload[8] = sc.Ndevice;
	sicp_send_message(&di,9);
}
//SLC上电汇报信息
void send_slc_device_info(u8 i)
{
	SICP_Message di;
	di.frame_h1 = 0xEE;
	di.frame_h2 = 0xEE;
	di.message_id = 21+i;
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB2;
	di.payload[1] =	sc.slc[i].deviceid[0];
	di.payload[2] =	sc.slc[i].deviceid[1];
	di.payload[3] =	sc.slc[i].deviceid[2];
	di.payload[4] =	sc.slc[i].deviceid[3];
	di.payload[5] =	sc.slc[i].model;
	di.payload[6] = sc.slc[i].firmware;
	di.payload[7] = sc.slc[i].HWTtest;
	di.payload[8] = sc.slc[i].MDID;
	sicp_send_message(&di,9);
}
//SPC上电汇报信息
void send_spc_device_info(u8 i)
{
	SICP_Message di;
	di.frame_h1 = 0xEE;
	di.frame_h2 = 0xEE;
	di.message_id = 36+i;
	di.mesh_id_H = ns_host_meshid_H;
	di.mesh_id_L = ns_host_meshid_L;
	di.payload[0] = 0xB3;
	di.payload[1] =	sc.spc[i].deviceid[0];
	di.payload[2] =	sc.spc[i].deviceid[1];
	di.payload[3] =	sc.spc[i].deviceid[2];
	di.payload[4] =	sc.spc[i].deviceid[3];
	di.payload[5] =	sc.spc[i].model;
	di.payload[6] = sc.spc[i].firmware;
	di.payload[7] = sc.spc[i].HWTtest;
	di.payload[8] = sc.spc[i].MDID;
	sicp_send_message(&di,9);
}
//SC发送device info，在上电检查到device id等信息后发送
void send_device_info(void)
{
	u8 i;
	//SC -- 0xB1
	send_sc_device_info();
	//SLC -- 0xB2
	for(i = 0; i < 15;i++){
		if(sc.slc[i].MDID){//MDID不为零说明I2C收到回复
			send_slc_device_info(i);
		}
	}
	//SPC -- 0xB3
	for(i = 0; i < 15;i++){
		if(sc.spc[i].MDID){//MDID不为零说明I2C收到回复
			send_spc_device_info(i);
		}
	}
	di_timeout = 5;
}

//SC发送故障信息，此函数放入1s函数中，如果故障没有恢复则一直发送
void send_malfunction(void)
{
	u8 i;
	SICP_Message mal;
	//SC type--0xB1
	if((sc.HWTtest & 0xC0)!=0xC0){
		mal.frame_h1 = 0xEE;
		mal.frame_h2 = 0xEE;
		mal.message_id = 17;
		mal.mesh_id_H = ns_host_meshid_H;
		mal.mesh_id_L = ns_host_meshid_L;
		mal.payload[0] = 0x0A;
		mal.payload[1] = 0xB1;
		mal.payload[2] =	0x00;
		mal.payload[3] =	sc.HWTtest;
		sicp_send_message(&mal,4);
	}
	//SLC type--0xB2
	for(i = 0; i < 15;i++){
		if((sc.slc[i].MDID)&&((sc.slc[i].HWTtest& 0xC0)!=0xC0)){	//send_slc_malfunction(i);
			mal.frame_h1 = 0xEE;
			mal.frame_h2 = 0xEE;
			mal.message_id = 51+i;
			mal.mesh_id_H = ns_host_meshid_H;
			mal.mesh_id_L = ns_host_meshid_L;
			mal.payload[0] = 0x0A;
			mal.payload[1] = 0xB2;
			mal.payload[2] =	sc.slc[i].MDID;
			mal.payload[3] =	sc.slc[i].HWTtest;
			sicp_send_message(&mal,4);
		}
	}
	//SPC type--0xB3
	for(i = 0; i < 15;i++){
		if((sc.spc[i].MDID)&&((sc.spc[i].HWTtest& 0xC0)!=0xC0)){	//send_spc_malfunction(i);
			mal.frame_h1 = 0xEE;
			mal.frame_h2 = 0xEE;
			mal.message_id = 66+i;
			mal.mesh_id_H = ns_host_meshid_H;
			mal.mesh_id_L = ns_host_meshid_L;
			mal.payload[0] = 0x0A;
			mal.payload[1] = 0xB2;
			mal.payload[2] =	sc.spc[i].MDID;
			mal.payload[3] =	sc.spc[i].HWTtest;
			sicp_send_message(&mal,4);
		}
	}
}

//检查是否需要重复发送，此函数放入Task1s中
void check_send_repeatedly(void){
	u8 i;
	//检查是否需要重发device info
	if(di_timeout){
		if(--di_timeout == 0){
			if(!sc.flag._flag_bit.bit1)	{send_sc_device_info();di_timeout = 5;}
			for(i = 0; i < 15; i++){
				if((sc.slc[i].MDID) && !sc.slc[i].flag._flag_bit.bit1){send_slc_device_info(i);di_timeout = 5;}
				if((sc.spc[i].MDID) && !sc.spc[i].flag._flag_bit.bit1){send_spc_device_info(i);di_timeout = 5;}
			}
		}
	}
}

