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
#include "stdlib.h"

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
void Init_UART1(void)
{
	UART1_DeInit();
	//波特率115200，8位数据位，1位停止位，无校验位，禁用同步模式，允许接收和发送
	UART1_Init((u32)57600,UART1_WORDLENGTH_8D,UART1_STOPBITS_1,UART1_PARITY_NO,UART1_SYNCMODE_CLOCK_DISABLE,	UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_TC,ENABLE);//发送完成中断
	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);//接收非空中断
	UART1_Cmd(ENABLE);//启用uart1接口
}


/**
  * @brief  uart1 send data init
  * @param  none.
  * @retval None
  */
void UART1_Send_Data_Init(void)
{
	send_buf[0] = 0xAA;
	send_buf[1] = 0xAA;
	send_buf[2] = 0x11;
	send_buf[3] = 0x22;
	send_buf[4] = 13;	//帧头及校验码不计入内
	send_buf[5] = 0x01;
	send_buf[6] = 0x02;
	send_buf[7] = 0x03;
	send_buf[8] = 0x04;
	send_buf[9] = 0x05;
	send_buf[10] = 0x06;
	send_buf[11] = 0x07;
	send_buf[12] = 0x08;
	send_buf[13] = 0x09;
	send_buf[14] = 0x0A;
	send_buf[15] = Check_Sum(send_buf,15);
	
}

/**
  * @brief  uart1 send data start
  * @param  none.
  * @retval None
  */
void UART1_Send_Data_Start(void)
{
	UART1->DR = send_buf[0];
	send_count = 1;
}


void clear_sicp_buf(void)
{
	u8 i;
	for (i=0;i<30;i++)
	{
		sicp_buf[i] = 0;
	}
}


void clear_send_buf(void)
{
	u8 i;
	for (i=0;i<30;i++)
	{
		send_buf[i] = 0;
	}
}


/**
  * @brief  UART1 tx isr
  * @param  none.
  * @retval None
  */
@interrupt void UART1_TX_ISR(void)
{
	/* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	UART1->SR &= ~0x40;//清除发送完成标志位
	if (send_count < send_buf[5]+3)
	{
		UART1->DR = send_buf[send_count];
		send_count++;
	}
	else//发送完成
	{
		send_count = 0;
		rev_count = 0;
	}
}

/**
  * @brief  UART1 rx isr
  * @param  none.
  * @retval None
  */

@interrupt void UART1_RX_ISR(void)
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
	temp = (u8)UART1->DR;
	rev_buf[rev_count] = temp;
	rev_count++;
	switch(rev_count)
	{
		case 1:
			if ((temp != 0xEE) && (temp != 0xDD))	rev_count = 0;
			break;
		case 2:
			if ((temp != 0xEE) && (temp != 0xDD)) rev_count = 0;
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
			if (rev_count > 30)//防止接收错误后溢出
			{
				rev_count = 0;
			}
			if ((rev_buf[0] == 0xEE)&&(rev_buf[1] == 0xEE))
			{
				if (rev_count > rev_buf[5] + 2)//接收数据完成
				{
					rev_count = 0;
					check_sum = Check_Sum(rev_buf,rev_buf[5] + 2);
					
					if (check_sum == rev_buf[rev_buf[5] + 2])//校验正确	
					{
						rev_success = 1;
						for (i = 0;i < 30;i++)
						{
							sicp_buf[i] = rev_buf[i];
						}
					}
					else
					{
						rev_count = 0;
					}
				}
			}
			else if((rev_buf[0] == 0xDD)&&(rev_buf[1] == 0xDD))
			{
				if (rev_count > rev_buf[3] + 1)//接收数据完成
				{
					rev_count = 0;
					rev_success = 1;
					for (i = 0;i < 30;i++)
					{
						sicp_buf[i] = rev_buf[i];
					}
				}
			}
			else
			{
				rev_count = 0;
			}
			break;
	}
	if (UART1->SR & 0x20) //|| (UART1->SR & UART1_SR_OR))
	{
		temp2 = UART1->DR;
	}	
		/*
		if( UART1_GetITStatus(UART1_IT_RXNE) == SET)
		{
			temp2 = UART1_ReceiveData8();
		}
	
	if(UART1->SR & UART1_SR_OR)
	{
		UART1_ClearITPendingBit(UART1_IT_OR);
	}	
	*/
} 
/**
  * @brief  send_header_init 
	* @param  none
  * @retval none
  */
void send_header_payload_init(u8 id,u8 mesh_id_H,u8 mesh_id_L,u8 len ,u8 cmd)
{
	send_buf[0] = 0xEE;
	send_buf[1] = 0xEE;
	send_buf[2] = id;
	send_buf[3] = mesh_id_H;
	send_buf[4] = mesh_id_L;
	send_buf[5] = len;
	
	switch(cmd)
	{
		case 0x20://回复环境光和环境颜色
			send_buf[6] = cmd;
			send_buf[7] = st1.st_ambient_light;
			send_buf[8] = st1.st_color_sense_L;
			send_buf[9] = st1.st_color_sense_M;
			send_buf[10] = st1.st_color_sense_H;
			break;
		case 0x06://回复心跳包，回复背光LED,及3个触控开关的状态
			send_buf[6] = cmd;
			send_buf[7] = 0x00;//ST Module ID发0x00
			send_buf[8] = 0x00;
			if ((st1.st_device_status & 0x08)==0x08)	send_buf[8] = st1.st_pad1_status;
			send_buf[9] = 0x00;
			if ((st1.st_device_status & 0x04)==0x04)	send_buf[9] = st1.st_pad2_status;
			send_buf[10] = 0x00;
			if ((st1.st_device_status & 0x02)==0x02)	send_buf[10]= st1.st_pad3_status;
			send_buf[11] = 0x00;
			if ((st1.st_device_status & 0x01)==0x01)	send_buf[11]= st1.st_led_status;
			break;
		case 0x29://ST上报手势信息
			send_buf[6] = cmd;
			send_buf[7] = st1.st_ges_H;
			send_buf[8] = st1.st_ges_L;
			send_buf[9] = 0x00;//ST Module ID 保留
			break;
		case 0x35:
			send_buf[6] = cmd;
			if (st_pad1_ctrl)
			{
				send_buf[7] = st1.st_pad1_ctrl_boardid;
				send_buf[8] = st1.st_pad1_status;
			}
			else if (st_pad2_ctrl)
			{
				send_buf[7] = st1.st_pad2_ctrl_boardid;
				send_buf[8] = st1.st_pad2_status;
			}
			else if (st_pad3_ctrl)
			{
				send_buf[7] = st1.st_pad3_ctrl_boardid;
				send_buf[8] = st1.st_pad3_status;
			}
			break;
		case 0xAA://发送回执
		  if (action_ctrlpad_flag)
			{
				action_ctrlpad_flag = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x05;//代表成功执行并返回模块状态
				send_buf[8] = st1.st_pad1_status;
				send_buf[9] = st1.st_pad2_status;
				send_buf[10] = st1.st_pad3_status;
				send_buf[11] = st1.st_led_status;
			}
			else if(led_ctrl_flag)
			{
				led_ctrl_flag = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x01;//代表指令执行成功
				if((st1.st_led_mode == 0x4F) ||	(st1.st_led_mode == 0x5F))
					send_buf[7] = 0x02;//代表成功接收数据
			}
			else if(load_alert_flag)
			{
				load_alert_flag = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x01;//代表指令执行成功
			}
			else if (cmd_refresh_flag)
			{
				cmd_refresh_flag = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x01;//代表指令执行成功
			}
			else if(receipt_conf_pad1)
			{
				receipt_conf_pad1 = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x01;//代表指令执行成功
			}
			else if(receipt_conf_pad2)
			{
				receipt_conf_pad2 = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x03;//代表指令执行失败
			}
			else if(receipt_conf_gest1)
			{
				receipt_conf_gest1 = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x01;//代表指令执行成功
			}
			else if(receipt_conf_gest2)
			{
				receipt_conf_gest2 = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x03;//代表指令执行失败
			}
			else if(receipt_device_info2)
			{
				receipt_device_info2 = 0;
				send_buf[6] = cmd;
				send_buf[7] = 0x03;//代表指令执行失败
			}
			break;
		case 0xB4://ST回复设备信息
			send_buf[6] = cmd;
			send_buf[7] = 0x11;//UUID
			send_buf[8] = 0x11;
			send_buf[9] = 0x11;
			send_buf[10] = 0x11;
			send_buf[11] = 0x63;//设备型号
			send_buf[12] = 0x00;//固件版本
			send_buf[13] = st1.st_device_status;
			break;
		case 0x0A://汇报 Seraph相关设备故障 
			send_buf[6] = cmd;
			send_buf[7] = 0xB4;
			send_buf[8] = st1.st_device_status;
			break;
		case 0x51://ST被触发判断需要向SC 发送指令	预设值指令手势
			send_buf[6] = cmd;
			if(gest1_confirm)
			{
				send_buf[7] = st1.st_ges1_ctrl_boardid;
				send_buf[8] = st1.st_ges1_ctrl_action_value;
				send_buf[9] = 0x00;
			}
			else if(gest2_confirm)
			{
				send_buf[7] = st1.st_ges2_ctrl_boardid;
				send_buf[8] = st1.st_ges2_ctrl_action_value;
				send_buf[9] = 0x00;
			}
			else if(gest3_confirm)
			{
				send_buf[7] = st1.st_ges3_ctrl_boardid;
				send_buf[8] = st1.st_ges3_ctrl_action_value;
				send_buf[9] = 0x00;
			}
			else if(gest4_confirm)
			{
				send_buf[7] = st1.st_ges4_ctrl_boardid;
				send_buf[8] = st1.st_ges4_ctrl_action_value;
				send_buf[9] = 0x00;
			}
			else if(st_pad1_confirm)
			{
				send_buf[7] = st1.st_pad1_ctrl_boardid;
				send_buf[8] = 0x00;
				send_buf[9] = 0x00;
			}
			else if(st_pad2_confirm)
			{
				send_buf[7] = st1.st_pad2_ctrl_boardid;
				send_buf[8] = 0x00;
				send_buf[9] = 0x00;
			}
			else if(st_pad3_confirm)
			{
				send_buf[7] = st1.st_pad3_ctrl_boardid;
				send_buf[8] = 0x00;
				send_buf[9] = 0x00;
			}
			
			break;
		case 0x08://ST被触发异步向 SS 推送触发器数值和判断结果
			send_buf[6] = cmd;
			
			if(gest1_confirm)
			{
				send_buf[7] = 0x02;//触发器是手势
				send_buf[8] = st1.st_ges1_ctrl_H;
				send_buf[9] = st1.st_ges1_ctrl_L;
				send_buf[10] = st1.st_ges1_ctrl_meshid_H;
				send_buf[11] = st1.st_ges1_ctrl_meshid_L;
				send_buf[12] = st1.st_ges1_ctrl_action;
				send_buf[13] = st1.st_ges1_ctrl_boardid;
				send_buf[14] = st1.st_ges1_ctrl_action_value;
				send_buf[15] = st1.st_ges1_ctrl_action_time;
			}
			else if(gest2_confirm)
			{
				send_buf[7] = 0x02;
				send_buf[8] = st1.st_ges2_ctrl_H;
				send_buf[9] = st1.st_ges2_ctrl_L;
				send_buf[10] = st1.st_ges2_ctrl_meshid_H;
				send_buf[11] = st1.st_ges2_ctrl_meshid_L;
				send_buf[12] = st1.st_ges2_ctrl_action;
				send_buf[13] = st1.st_ges2_ctrl_boardid;
				send_buf[14] = st1.st_ges2_ctrl_action_value;
				send_buf[15] = st1.st_ges2_ctrl_action_time;
			}
			else if(gest3_confirm)
			{
				send_buf[7] = 0x02;
				send_buf[8] = st1.st_ges3_ctrl_H;
				send_buf[9] = st1.st_ges3_ctrl_L;
				send_buf[10] = st1.st_ges3_ctrl_meshid_H;
				send_buf[11] = st1.st_ges3_ctrl_meshid_L;
				send_buf[12] = st1.st_ges3_ctrl_action;
				send_buf[13] = st1.st_ges3_ctrl_boardid;
				send_buf[14] = st1.st_ges3_ctrl_action_value;
				send_buf[15] = st1.st_ges3_ctrl_action_time;
			}
			else if(gest4_confirm)
			{
				send_buf[7] = 0x02;
				send_buf[8] = st1.st_ges4_ctrl_H;
				send_buf[9] = st1.st_ges4_ctrl_L;
				send_buf[10] = st1.st_ges4_ctrl_meshid_H;
				send_buf[11] = st1.st_ges4_ctrl_meshid_L;
				send_buf[12] = st1.st_ges4_ctrl_action;
				send_buf[13] = st1.st_ges4_ctrl_boardid;
				send_buf[14] = st1.st_ges4_ctrl_action_value;
				send_buf[15] = 0x00;
			}
			else if(st_pad1_confirm)
			{
				send_buf[7] = 0x01;//触发器是按键
				send_buf[8] = 0x00;
				send_buf[9] = st1.st_ctrl_address;
				send_buf[10] = st1.st_pad1_ctrl_meshid_H;
				send_buf[11] = st1.st_pad1_ctrl_meshid_L;
				send_buf[12] = st1.st_pad1_ctrl_action;
				send_buf[13] = st1.st_pad1_ctrl_boardid;
				send_buf[14] = 0x00;
				send_buf[15] = 0x00;
			}
			else if(st_pad2_confirm)
			{
				send_buf[7] = 0x01;//触发器是按键
				send_buf[8] = 0x00;
				send_buf[9] = st1.st_ctrl_address;
				send_buf[10] = st1.st_pad2_ctrl_meshid_H;
				send_buf[11] = st1.st_pad2_ctrl_meshid_L;
				send_buf[12] = st1.st_pad2_ctrl_action;
				send_buf[13] = st1.st_pad2_ctrl_boardid;
				send_buf[14] = 0x00;
				send_buf[15] = 0x00;
			}
			else if(st_pad3_confirm)
			{
				send_buf[7] = 0x01;//触发器是按键
				send_buf[8] = 0x00;
				send_buf[9] = st1.st_ctrl_address;
				send_buf[10] = st1.st_pad3_ctrl_meshid_H;
				send_buf[11] = st1.st_pad3_ctrl_meshid_L;
				send_buf[12] = st1.st_pad3_ctrl_action;
				send_buf[13] = st1.st_pad3_ctrl_boardid;
				send_buf[14] = 0x00;
				send_buf[15] = 0x00;
			}
			break;
	}
	send_buf[len+2] = Check_Sum((send_buf+2),len);
}

/**
  * @brief  send_payload_init 
	* @param  none
  * @retval none
  */
/*
void send_payload_init(u8 len,u8 cmd)
{
	
}
*/
/**
  * @brief  rev_header_anaylze
	* @param  none
  * @retval none
  */
void rev_header_anaylze(u8 *message_id,u8 *mesh_id_H,u8 *mesh_id_L,u8 *message_length)
{
	if ((sicp_buf[0] == 0xEE) && (sicp_buf[1]== 0xEE))
	{
		ble_data_frame = 1;
		*message_id = sicp_buf[2];
		*mesh_id_H = sicp_buf[3];
		*mesh_id_L = sicp_buf[4];
		*message_length = sicp_buf[5];
		//return TRUE;
	}
	else if ((sicp_buf[0] == 0xDD) && (sicp_buf[1]== 0xDD))//Network	Status	Reporting	
	{
		ble_ctrl_frame = 1;
		*message_length = sicp_buf[3];
		//return TRUE;
	}
	//else
	//{
	//	return FALSE;
	//}
}

/**
  * @brief  rev_payload_anaylze
	* @param  none
  * @retval none
  */
bool rev_payload_anaylze(void)
{

	if (ble_data_frame)
	{
		ble_data_frame = 0;
		switch(sicp_buf[6])
		{
			case 0x04://SS向ST发送配置信息
				receipt_device_info1 = 1;
				//if (sicp_buf[2] == device_info_message_id)
				{
					if (sicp_buf[7] == 0x01)//设置ST按键作用
					{
						kickout_flag = 0;
						net_reset_flag = 0;
						if ((sicp_buf[8] & 0x01) == 0x01)//设置通道1
						{
							st1.st_pad1_ctrl_meshid_H = sicp_buf[10];
							st1.st_pad1_ctrl_meshid_L = sicp_buf[11];
							st1.st_pad1_ctrl_boardid 	= sicp_buf[12];
							st1.st_pad1_ctrl_action   = sicp_buf[13];
							st1.st_pad1_ctrl_action_value = sicp_buf[14];
							receipt_conf_pad1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if ((sicp_buf[8] & 0x02) == 0x02)//设置通道2
						{
							st1.st_pad2_ctrl_meshid_H = sicp_buf[10];
							st1.st_pad2_ctrl_meshid_L = sicp_buf[11];
							st1.st_pad2_ctrl_boardid 	= sicp_buf[12];
							st1.st_pad2_ctrl_action   = sicp_buf[13];
							st1.st_pad2_ctrl_action_value = sicp_buf[14];
							receipt_conf_pad1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if ((sicp_buf[8] & 0x04) == 0x04)//设置通道3
						{
							st1.st_pad3_ctrl_meshid_H = sicp_buf[10];
							st1.st_pad3_ctrl_meshid_L = sicp_buf[11];
							st1.st_pad3_ctrl_boardid 	= sicp_buf[12];
							st1.st_pad3_ctrl_action   = sicp_buf[13];
							st1.st_pad3_ctrl_action_value = sicp_buf[14];
							receipt_conf_pad1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else
						{
							receipt_conf_pad2 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						
					}
					if (sicp_buf[7] == 0x02)//设置ST手势作用
					{
						kickout_flag = 0;
						net_reset_flag = 0;
						
						if((sicp_buf[8] != st1.st_ges1_ctrl_H) && (sicp_buf[9] != st1.st_ges1_ctrl_L))//第一个预设置手势
						{
							st1.st_ges1_ctrl_H						= sicp_buf[8];
							st1.st_ges1_ctrl_L						= sicp_buf[9];
							st1.st_ges1_ctrl_meshid_H 		= sicp_buf[10];
							st1.st_ges1_ctrl_meshid_L 		= sicp_buf[11];
							st1.st_ges1_ctrl_boardid 			= sicp_buf[12];
							st1.st_ges1_ctrl_action				= sicp_buf[13];
							st1.st_ges1_ctrl_action_value = sicp_buf[14];
							receipt_conf_gest1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if((sicp_buf[8] != st1.st_ges2_ctrl_H) && (sicp_buf[9] != st1.st_ges2_ctrl_L))//第二个预设置手势
						{
							st1.st_ges2_ctrl_H						= sicp_buf[8];
							st1.st_ges2_ctrl_L						= sicp_buf[9];
							st1.st_ges2_ctrl_meshid_H 		= sicp_buf[10];
							st1.st_ges2_ctrl_meshid_L 		= sicp_buf[11];
							st1.st_ges2_ctrl_boardid 			= sicp_buf[12];
							st1.st_ges2_ctrl_action				= sicp_buf[13];
							st1.st_ges2_ctrl_action_value = sicp_buf[14];
							receipt_conf_gest1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if((sicp_buf[8] != st1.st_ges3_ctrl_H) && (sicp_buf[9] != st1.st_ges3_ctrl_L))//第三个预设置手势
						{
							st1.st_ges3_ctrl_H						= sicp_buf[8];
							st1.st_ges3_ctrl_L						= sicp_buf[9];
							st1.st_ges3_ctrl_meshid_H 		= sicp_buf[10];
							st1.st_ges3_ctrl_meshid_L 		= sicp_buf[11];
							st1.st_ges3_ctrl_boardid 			= sicp_buf[12];
							st1.st_ges3_ctrl_action				= sicp_buf[13];
							st1.st_ges3_ctrl_action_value = sicp_buf[14];
							receipt_conf_gest1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if((sicp_buf[8] != st1.st_ges4_ctrl_H) && (sicp_buf[9] != st1.st_ges4_ctrl_L))//第三个预设置手势
						{
							st1.st_ges4_ctrl_H						= sicp_buf[8];
							st1.st_ges4_ctrl_L						= sicp_buf[9];
							st1.st_ges4_ctrl_meshid_H 		= sicp_buf[10];
							st1.st_ges4_ctrl_meshid_L 		= sicp_buf[11];
							st1.st_ges4_ctrl_boardid 			= sicp_buf[12];
							st1.st_ges4_ctrl_action				= sicp_buf[13];
							st1.st_ges4_ctrl_action_value = sicp_buf[14];
							receipt_conf_gest1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else if(((sicp_buf[8] == st1.st_ges1_ctrl_H) && (sicp_buf[9] == st1.st_ges1_ctrl_L))
										|| ((sicp_buf[8] == st1.st_ges2_ctrl_H) && (sicp_buf[9] == st1.st_ges2_ctrl_L))
										|| ((sicp_buf[8] == st1.st_ges3_ctrl_H) && (sicp_buf[9] == st1.st_ges3_ctrl_L))
										|| ((sicp_buf[8] == st1.st_ges3_ctrl_H) && (sicp_buf[9] == st1.st_ges3_ctrl_L)))
						{
							receipt_conf_gest1 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
						else
						{
							receipt_conf_gest2 = 1;
							send_message_length = 6;
							send_cmd = 0xAA;
							send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
							UART1_Send_Data_Start();
							break;
						}
					}
				}
				break;
			case 0xAA://SS回复ST的Device Info，Kick Out踢出
				if (sicp_buf[7] == 0x04)
				{
					kickout_flag = 1;
				}
				break;
				if(sicp_buf[7] == 0x07)//SS/SC回复ST丢包，置位receipt_send_failed
				{
					receipt_send_failed = 1;
					
				}
				break;
			case 0xC0://BLE 网络模块重置指令
				if (sicp_buf[7] == 0x02)
				{
					net_reset_flag = 1;
				}
				break;
			case 0x03://CMD-Data 
				if (sicp_buf[7] == 0x02)//刷新SC传感器数据
				{
					cmd_refresh_flag = 1;
					send_message_length = 6;
					send_cmd = 0xAA;
					send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
					UART1_Send_Data_Start();
				}
				if (sicp_buf[7] == 0x03)//汇报当前设备状态信息
				{
					cmd_status_flag = 1;
					rev_module_id = sicp_buf[8];
					send_message_length = 10;
					send_cmd = 0x06;
					send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
					UART1_Send_Data_Start();
				}
				break;
			case 0x56://打开或关闭ST开关
				action_ctrlpad_flag = 1;
				st1.st_ctrl_address = sicp_buf[7];
				if((sicp_buf[7] & 0x01) == 0x01)
					st_pad1_ctrl = 1;
				if((sicp_buf[7] & 0x02) == 0x02)
					st_pad2_ctrl = 1;
				if((sicp_buf[7] & 0x04) == 0x04)
					st_pad3_ctrl = 1;
				if((sicp_buf[7] & 0x08) == 0x08)
					st_led_ctrl = 1;
				st1.st_ctrl_value  = sicp_buf[8];
				send_message_length = 10;
				send_cmd = 0xAA;
				send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
				//send_payload_init(send_message_length,send_cmd);
				UART1_Send_Data_Start();
				break;
			case 0x09://LED控制
				led_ctrl_flag = 1;
				switch(sicp_buf[7])
				{
					case 0x1F://循环模式
						st1.st_led_mode = 0x1F;
						st1.st_led_density = sicp_buf[8];
						st1.st_led_speed = sicp_buf[9];
						st1.st_led_color1_H = sicp_buf[10];
						st1.st_led_color1_M = sicp_buf[11];
						st1.st_led_color1_L = sicp_buf[12];
						st1.st_led_color2_H = sicp_buf[13];
						st1.st_led_color2_M = sicp_buf[14];
						st1.st_led_color2_L = sicp_buf[15];
						send_message_length = 6;
						send_cmd = 0xAA;
						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
						//send_payload_init(send_message_length,send_cmd);
						UART1_Send_Data_Start();
						break;
					case 0x2F://呼吸灯模式
						st1.st_led_mode = 0x2F;
						st1.st_led_in		= sicp_buf[8];
						st1.st_led_duration = sicp_buf[9];
						st1.st_led_out	= sicp_buf[10];
						st1.st_led_blank = sicp_buf[11];
						st1.st_led_color1_H = sicp_buf[12];
						st1.st_led_color1_M = sicp_buf[13];
						st1.st_led_color1_L = sicp_buf[14];
						st1.st_led_color2_H = sicp_buf[15];
						st1.st_led_color2_M = sicp_buf[16];
						st1.st_led_color2_L = sicp_buf[17];
						send_message_length = 6;
						send_cmd = 0xAA;
						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
						//send_payload_init(send_message_length,send_cmd);
						UART1_Send_Data_Start();
						break;
					case 0x3F://颜色变化模式，从一个主颜色渐变黑色再变到另一个主颜色
						st1.st_led_mode = 0x3F;
						st1.st_led_in		= sicp_buf[8];
						st1.st_led_duration = sicp_buf[9];
						st1.st_led_color1_H = sicp_buf[10];
						st1.st_led_color1_M = sicp_buf[11];
						st1.st_led_color1_L = sicp_buf[12];
						st1.st_led_color2_H = sicp_buf[13];
						st1.st_led_color2_M = sicp_buf[14];
						st1.st_led_color2_L = sicp_buf[15];
						send_message_length = 6;
						send_cmd = 0xAA;
						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
						//send_payload_init(send_message_length,send_cmd);
						UART1_Send_Data_Start();
						break;
					case 0x4F://指示灯模式，把LED的显示权交给设备
						st1.st_led_mode = 0x4F;
						send_message_length = 6;
						send_cmd = 0xAA;
						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
						//send_payload_init(send_message_length,send_cmd);
						UART1_Send_Data_Start();
						break;
					case 0x5F://关闭模式。关闭所有LED显示 
						st1.st_led_mode = 0x5F;
						send_message_length = 6;
						send_cmd = 0xAA;
						send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
						//send_payload_init(send_message_length,send_cmd);
						UART1_Send_Data_Start();
						break;
				}
				break;
			case 0x05://用于加载预装的报警信息，若此方法激活，则忽略所有 LED方法
				load_alert_flag = 1;
				st1.st_load_alert = sicp_buf[7];
				send_message_length = 6;
				send_cmd = 0xAA;
				send_header_payload_init(rev_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
				//send_payload_init(send_message_length,send_cmd);
				UART1_Send_Data_Start();
				break;
			default:
				break;
		}
		
		return TRUE;
	}
	else if (ble_ctrl_frame)
	{
		ble_ctrl_frame = 0;
		switch(sicp_buf[4])
		{
			case 0x01://网络状态帧
				ns_signal = sicp_buf[5];
				ns_status = sicp_buf[6];
				ns_phonenum = sicp_buf[7];
				ns_own_meshid_H = sicp_buf[8];
				ns_own_meshid_L = sicp_buf[9];
				ns_host_meshid_H = sicp_buf[10];
				ns_host_meshid_L = sicp_buf[11];
				break;
			case 0x02://重置芯片，清空串口缓存，保留mesh连接
				break;
			case 0x03://重置芯片和网络，退出mesh连接
				break;
		}
		generate_messageid = 0x86;//for debug
		//generate_messageid = random(TIM4->CNTR);
		device_info_message_id = generate_messageid;
		//已经分配到Mesh ID,且host mesh id不为0Device Info指令发送自己的配置信息
		if ((((u16)(ns_own_meshid_H<<8) + (u16)ns_own_meshid_L) > 0)
			&& (((u16)(ns_host_meshid_H<<8) + (u16)ns_host_meshid_L) > 0))
		{
			if (!receipt_device_info1)
			{
				
				//clear_sicp_buf();
				send_message_length = 12;
				send_cmd = 0xB4;
				send_header_payload_init(device_info_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
				//send_payload_init(send_message_length,send_cmd);
				UART1_Send_Data_Start();
				delay(10);
			}
		}
		else
		{
			receipt_device_info2 = 1;
			send_message_length = 6;
			send_cmd = 0xAA;
			send_header_payload_init(device_info_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
			UART1_Send_Data_Start();
			delay(10);
		}
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}

/**
  * @brief  receive data analyze and reply，放入Task1ms()
	* @param  none
  * @retval none
  */
void reve_analyze_reply(void)
{
	if (rev_success)
	{
		rev_success = 0;
		rev_header_anaylze(&rev_message_id,&rev_meshid_H,&rev_meshid_L,&rev_message_length);
		rev_payload_anaylze();
	}
	
	/****************************************************
	以下ST主动发送的数据如果收到AA 07回执需要重新发送一次
	*****************************************************/
	/***********准备下一次重发***********/
	if (receipt_send_failed)
	{
		receipt_send_failed = 0;
		st_pad1_ctrl = st_pad_temp._flag_bit.bit0;
		st_pad2_ctrl = st_pad_temp._flag_bit.bit1;
		st_pad3_ctrl = st_pad_temp._flag_bit.bit2;
		st_pad1_confirm = st_pad_temp._flag_bit.bit3;
		st_pad2_confirm = st_pad_temp._flag_bit.bit4;
		st_pad3_confirm = st_pad_temp._flag_bit.bit5;
	}
	/***********准备下一次重发***********/
	if (receipt_send_failed)
	{
		receipt_send_failed = 0;
		st1.st_ges_H = st1_st_ges_H_temp;
		st1.st_ges_L = st1_st_ges_L_temp;
	}
	
	if (st_pad1_ctrl | st_pad2_ctrl | st_pad3_ctrl)
	{
	//当检测到触摸按键状态改变时，属于预设值按键，发送控制SC指令,并且发送异步通知给SS
		if(st_pad1_confirm | st_pad2_confirm | st_pad3_confirm)
		{
			st_pad_temp._flag_bit.bit0 = st_pad1_ctrl;
			st_pad_temp._flag_bit.bit1 = st_pad2_ctrl;
			st_pad_temp._flag_bit.bit2 = st_pad3_ctrl;
			st_pad_temp._flag_bit.bit3 = st_pad1_confirm;
			st_pad_temp._flag_bit.bit4 = st_pad2_confirm;
			st_pad_temp._flag_bit.bit5 = st_pad3_confirm;
			
				generate_messageid = random(TIM4->CNTR);
				send_message_length = 8;
				send_cmd = 0x51;
				if (st_pad1_confirm)//预设置按键1被触发
				{
					st_pad1_ctrl = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
				}
				else if (st_pad2_confirm)
				{
					st_pad2_ctrl = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
				}
				else if (st_pad3_confirm)
				{
					st_pad3_ctrl = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
				}
				//send_payload_init(send_message_length,send_cmd);
				UART1_Send_Data_Start();
				delay(10);
				
				//发送异步通知给SS
				clear_send_buf();
				send_message_length = 14;
				send_cmd = 0x08;
				if (st_pad1_confirm)//预设置按键1被触发
				{
					st_pad1_confirm = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
				}
				else if (st_pad2_confirm)
				{
					st_pad2_confirm = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
				}
				else if(st_pad3_confirm)
				{
					st_pad2_confirm = 0;
					send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
				}
				UART1_Send_Data_Start();
				delay(10);
		}
		else//当检测到触摸按键状态改变时，不属于预设值按键，则通过此指令上报按键
		{
			send_message_length = 7;
			send_cmd = 0x35;
			if (st_pad1_ctrl)
			{
				st_pad1_ctrl = 0;
				send_header_payload_init(gesture_noset_message_id,st1.st_pad1_ctrl_meshid_H,st1.st_pad1_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (st_pad2_ctrl)
			{
				st_pad2_ctrl = 0;
				send_header_payload_init(gesture_noset_message_id,st1.st_pad2_ctrl_meshid_H,st1.st_pad2_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (st_pad3_ctrl)
			{
				st_pad3_ctrl = 0;
				send_header_payload_init(gesture_noset_message_id,st1.st_pad3_ctrl_meshid_H,st1.st_pad3_ctrl_meshid_L,send_message_length,send_cmd);
			}
			UART1_Send_Data_Start();
			delay(10);
		}
	}
	
	
	
	//当ST检测到改手势不属于预设置的指令触发手势（例如左右左是开灯）。则通过此命令上报手势
	if ((st1.st_ges_H != 0x00) && (st1.st_ges_L != 0x00))
	{
		st1_st_ges_H_temp = st1.st_ges_H;
		st1_st_ges_L_temp = st1.st_ges_L;
		st1.st_ges_H = 0x00;
		st1.st_ges_L = 0x00;
		
		if((!gest1_confirm) && (!gest2_confirm) && (!gest3_confirm) && (!gest4_confirm))
		{	
			receipt_gesture1 = 0;//清除接收到该指令回执
			generate_messageid = random(TIM4->CNTR);
			gesture_noset_message_id = generate_messageid;
			
			send_message_length = 8;
			send_cmd = 0x29;
			send_header_payload_init(gesture_noset_message_id,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
			//send_payload_init(send_message_length,send_cmd);
			UART1_Send_Data_Start();
			delay(10);
		}
		else//检测到手势属于预设值指令触发手势，Asynchronous Action Notification
		{
			receipt_gesture2 = 0;//清除接收到该指令回执
			generate_messageid = random(TIM4->CNTR);
			gesture_set_message_id = generate_messageid;
			send_message_length = 8;
			send_cmd = 0x51;
			if (gest1_confirm)
			{
				send_header_payload_init(gesture_set_message_id,st1.st_ges1_ctrl_meshid_H,st1.st_ges1_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest2_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges2_ctrl_meshid_H,st1.st_ges2_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest3_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges3_ctrl_meshid_H,st1.st_ges3_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest4_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges4_ctrl_meshid_H,st1.st_ges4_ctrl_meshid_L,send_message_length,send_cmd);
			}
			//send_payload_init(send_message_length,send_cmd);
			UART1_Send_Data_Start();
			//short delay 等待数据发送完成，ST异步向 SS 推送触发器数值和判断结果
			delay(10);
			clear_send_buf();
			send_message_length = 14;
			send_cmd = 0x08;
			if (gest1_confirm)
			{
				send_header_payload_init(gesture_set_message_id,st1.st_ges1_ctrl_meshid_H,st1.st_ges1_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest2_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges2_ctrl_meshid_H,st1.st_ges2_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest3_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges3_ctrl_meshid_H,st1.st_ges3_ctrl_meshid_L,send_message_length,send_cmd);
			}
			else if (gest4_confirm)
			{
				send_header_payload_init(generate_messageid,st1.st_ges4_ctrl_meshid_H,st1.st_ges4_ctrl_meshid_L,send_message_length,send_cmd);
			}
			//send_payload_init(send_message_length,send_cmd);
			UART1_Send_Data_Start();
			delay(10);
		}
	}
	
	
	//STM8S掉线或其他传感器故障发送Malfunction Command
	if ((st1.st_device_status & 0xFF) < 0xFF)//ST有故障,有0无1
	{
		send_fault_count++;
		if (send_fault_count >= 500)
		{
			send_fault_count = 0;
			generate_messageid = random(TIM4->CNTR);
			send_message_length = 7;
			send_cmd = 0x0A;
			send_header_payload_init(generate_messageid,ns_own_meshid_H,ns_own_meshid_L,send_message_length,send_cmd);
			//send_payload_init(send_message_length,send_cmd);
			UART1_Send_Data_Start();
		}
	}
}