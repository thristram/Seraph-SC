/**
  ******************************************************************************
  * @file    main.c
  * @author  MCD Application Team
  * @version V0.0.3
  * @date    Feb 2010
  * @brief   This file contains main test loop for optimized I2C master
  ******************************************************************************
  * @copy
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  */ 
#include "stm8s.h"
#include "i2c_master_poll.h"
#include "timer.h"
#include "uart.h"
#include "i2c.h"


#define LED_GPIO_PORT  (GPIOB)

const u8 DUMMY_INIT[MAX_DUMMY]= { 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80, 0x90, 0xa0 };
char *IIC_ErrorStr[]={"IIC_SUCCESS","IIC_ERROR_TIME_OUT","IIC_ERROR_BUSY","IIC_ERROR_NOT_ACK"};
uint8_t write_buffer[MAX_DUMMY];
uint8_t read_buffer[MAX_DUMMY];

u8 init_slc_spc_done;
u8 tick_5s;
extern void delay(u16 Count);
void sys_init(void)
{
	u8 i,j;
	//ns_own_meshid_H = 0x80;
	//ns_own_meshid_L = 0x04;
	//ns_host_meshid_H = 0x80;
	//ns_host_meshid_L = 0x05;
	
	sc.HWTtest = 0xC0;
	sc.deviceid[0] = 0xAA;
	sc.deviceid[1] = 0x55;
	sc.deviceid[2] = 0xAB;
	sc.deviceid[3] = 0x56;
	for(i = 0; i < 15; i++){
		for(j = 0; j < 4;j++){
			sc.slc[i].deviceid[j] = 0x00;
			sc.spc[i].deviceid[j] = 0x00;
		}
		sc.slc[i].firmware = 0x00;
		sc.slc[i].HWTtest = 0xC0;
		sc.slc[i].MDID = 0x00;
		sc.slc[i].model = 0x00;
		sc.slc[i].flag._flag_byte = 0x00;
		sc.slc[i].ch1_status = 0x00;
		sc.slc[i].ch2_status = 0x00;
		sc.slc[i].ch3_status = 0x00;
		sc.slc[i].ch4_status = 0x00;
		sc.spc[i].firmware = 0x00;
		sc.spc[i].HWTtest = 0xC0;
		sc.spc[i].MDID = 0x00;
		sc.spc[i].model = 0x00;
		sc.spc[i].flag._flag_byte = 0x00;
		sc.spc[i].energy_consum = 0x0000;
		sc.spc[i].ch1_status = 0x00;
		sc.spc[i].ch2_status = 0x00;
		sc.spc[i].ch3_status = 0x00;
		sc.spc[i].ch4_status = 0x00;	
	}
}


/******************************************************************************
* Function name : main
* Description 	: Main testing loop
* Input param 	: None
* Return 		    : None
* See also 		  : None
*******************************************************************************/
void main (void) { 
	int ret,i,j,k,slave_num = 0;
	uint8_t slave_addrs[32];
  /*High speed internal clock prescaler: 1*/
  //CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  CLK->SWCR |= 0x02; //开启切换
  CLK->SWR   = 0xb4;       //选择时钟为外部8M
  while((CLK->SWCR & 0x01)==0x01);
  CLK->CKDIVR = 0x80;    //不分频
  CLK->SWCR  &= ~0x02; //关闭切换
	// Set GPIO for LED uses 
  GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST); 
	GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST); 
	GPIO_WriteHigh(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
	enableInterrupts();
	Init_Time4();
	//串口初始化
	Init_uart2();
	//I2C初始化
	I2C_Config();
	sys_init();
	delay(2500);//等待SLC SPC上电完成初始化。10s
  while(1) {

		if((!init_slc_spc_done)&&(rev_bleheartbeat)){
			rev_bleheartbeat = 0;
			scan_device();
			i2c_device_info();
			send_device_info();
			init_slc_spc_done = 1;
		}
		
		if(f_100ms){
			f_100ms = 0;
			if(action_dimmer_ext > 0)	{
				action_dimmer_ext -= 1;
				if(action_dimmer_ext == 0){
					//i2c发送查询action dimmer执行结果
					ret = i2c_single_action_dimmer_result(action_dimmer_MDID);
					if(ret == IIC_SUCCESS) {
						action_dimmer_MDID = 0x00;
						delay(10);
						sicp_receipt_Done(0x05,rev_ad_message_id,ns_host_meshid_H,ns_host_meshid_L,0x01,rev_ad_mdid);
					}
				}
			}
			rev_anaylze();
		}
		
		//if(f_300ms){
		//	f_300ms = 0;
		//}
		
		if(f_1s){
			f_1s = 0;
			tick_5s++;
			check_send_repeatedly();
			report_energy_consum();
			if(tick_5s >= 5)	{tick_5s = 0;i2c_heartbeat();}
			send_malfunction();
			GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)GPIO_PIN_3);
		}
	}
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
		
  }
}
#endif