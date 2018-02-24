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
#include "timer.h"
#include "uart.h"
#include "main.h"
#include "string.h"



u8 	slcspc_heartbeat_counts = 0;
u8	cmd_led_flag = 0;



/*----------------------------------------------------------------------------
   EEPROM中写入一个字节
   dLocal_Addr:EEPROM中的地址，从0x4000
   dLocal_Data:要写入EEPOM中的数据
-----------------------------------------------------------------------------*/
void MEEPROM_WriteByte(u16 dLocal_Addr, u8 dLocal_Data)
{
   FLASH_Unlock(FLASH_MEMTYPE_DATA);
   while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET);
   
   FLASH_ProgramByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr, dLocal_Data);
   FLASH_Lock(FLASH_MEMTYPE_DATA);

}

 /*----------------------------------------------------------------------------
	从EEPROM中读取一个字节
	直接使用FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
-----------------------------------------------------------------------------*/
 u8 MEEPROM_ReadByte(u16 dLocal_Addr)
 {
	 u8 dLocal_1;
	 dLocal_1 = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + dLocal_Addr);
	 return dLocal_1;
 }

 
 /*----------------------------------------------------------------------------
	  设置默认的信息
 -----------------------------------------------------------------------------*/
 void default_info_set(void)
 {	 

	 MEEPROM_WriteByte(EEPROM_MESHID_H_ADDRESS, 0);
	 MEEPROM_WriteByte(EEPROM_MESHID_L_ADDRESS, 0);

 }
 


/*----------------------------------------------------------------------------
	 读取设备信息 
-----------------------------------------------------------------------------*/
void device_info_read(void)
{
	u8 temp = 0;

	sc.model = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MODEL_ADDRESS);
	sc.firmware_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_FW_VERSION_ADDRESS);   
	if(sc.firmware_version == 1){	   /* 第一版本，device ID 4个字节  */	   
		   sc.deviceID[0] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 3);
		   sc.deviceID[1] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 2);
		   sc.deviceID[2] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 1);
		   sc.deviceID[3] = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_DEVICEID_ADDRESS + 0);
	}
	sc.HW_version = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_HW_VERSION_ADDRESS);

	temp = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 0);
	sc.bash = temp + 256 * FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_BASH_ADDRESS + 1);

	sc.manaYear = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_YEAR_ADDRESS);
	sc.manaMonth = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_MONTH_ADDRESS);
	sc.manaDay = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MANA_DAY_ADDRESS);

	ns_host_meshid_H = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MESHID_H_ADDRESS);
	ns_host_meshid_L = FLASH_ReadByte(FLASH_DATA_START_PHYSICAL_ADDRESS + EEPROM_MESHID_L_ADDRESS);
	

}


/*----------------------------------------------------------------------------
	初始化EEPROM
-----------------------------------------------------------------------------*/
void MEEPROM_Init(void)
{
	u8 temp = 0;

	FLASH_DeInit();
	temp = MEEPROM_ReadByte(EEPROM_INIT_ADDRESS);



	//初次上电设置默认数据
	if(temp != EEPROM_INIT_FLAG) {	   
		   MEEPROM_WriteByte(EEPROM_INIT_ADDRESS, EEPROM_INIT_FLAG);
		   default_info_set();
	}

	device_info_read();

}



/*----------------------------------------------------------------------------
	初始化全局变量
-----------------------------------------------------------------------------*/
void sys_init(void)
{
	u8 i;

	memset(&sc, 0, sizeof(sc));

	sc.scanDevFlag = 1;		/* 上电扫描设备是否存在 */

	ns_own_meshid_H = 0;
	ns_own_meshid_L = 0;
	
}



/*----------------------------------------------------------------------------
	设置系统时钟 
-----------------------------------------------------------------------------*/
void system_clock_set(void)
{

	//CLK->CKDIVR = 0;				  // sys clock /1
	CLK->SWCR |= 0x02; //开启切换
	
	CLK->SWR   = 0xb4;		 //选择时钟为外部16M
	while((CLK->SWCR & 0x01) == 0x01);
	CLK->CKDIVR = 0x80;    //不分频
	
	CLK->SWCR  &= ~0x02; //关闭切换

}

/*----------------------------------------------------------------------------
	设置LED
-----------------------------------------------------------------------------*/
void system_led_init(void)
{

	// Set GPIO for LED uses 
  	GPIO_Init(SYSTEM_LED_PORT, (GPIO_Pin_TypeDef)SYSTEM_LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST); 
	GPIO_Init(COMM_LED_PORT, (GPIO_Pin_TypeDef)COMM_LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST); 

	SYSTEM_LED_ON;
	COMM_LED_OFF;
}


/*----------------------------------------------------------------------------
	设置中断优先级
-----------------------------------------------------------------------------*/
void interrupt_priority_set(void)
{

	//	//中断优先级设置
	//	disableInterrupts();
	//	
	//	ITC_DeInit();
	//	
	//	ITC_SetSoftwarePriority(ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_2);
	//	ITC_SetSoftwarePriority(ITC_IRQ_TIM3_OVF, ITC_PRIORITYLEVEL_3);
	//	
	//	ITC_SetSoftwarePriority(ITC_IRQ_UART2_TX, ITC_PRIORITYLEVEL_2);
	//	ITC_SetSoftwarePriority(ITC_IRQ_UART2_RX, ITC_PRIORITYLEVEL_2);
		
		/* Enable general interrupts */
	
		enableInterrupts();

}




/*----------------------------------------------------------------------------
	等待slc调光结束后发送查询 
	单模块调光使用59命令查询
	多模块调光直接调用心跳查询
	每100ms执行一次
-----------------------------------------------------------------------------*/
void slc_dimmer_finish_and_search(void)
{
	u8 i;

	if(sc.slcMultipleDimmer){
		
		sc.slcMultipleDimmer--;
		if(sc.slcMultipleDimmer == 0){
			slcspc_heartbeat();			//心跳查询所有设备	
			slcspc_heartbeat_counts = 0;
			sicp_heart_beat(SICP_SEND);		//心跳包 发送给ss		
		}
	}
	
	if(sc.spcMultipleSync){
		
		sc.spcMultipleSync--;
		if(sc.spcMultipleSync == 0){
			slcspc_heartbeat();			//心跳查询所有设备	
			slcspc_heartbeat_counts = 0;
			sicp_heart_beat(SICP_SEND);		//心跳包 发送给ss		
		}
	}

	for(i = 0; i < 15; i++){
		
		if(sc.slc[i].MDID && sc.slc[i].singleDimmer){
			sc.slc[i].singleDimmer--;
			if(sc.slc[i].singleDimmer == 0){
				slcspc_single_action_dimmer_result(i + 1);
				sicp_receipt_Done(0x05, sicp_get_message_id(), ns_host_meshid_H, ns_host_meshid_L, 0x01, i + 1);
 
			}
		}

		if(sc.spc[i].MDID && sc.spc[i].syncTimes){
			
			sc.spc[i].syncTimes--;
			if(sc.spc[i].syncTimes == 0){
				sicp_receipt_Done(0x05, sicp_get_message_id(), ns_host_meshid_H, ns_host_meshid_L, 0x02, i + 1);
		
			}
		}

	}


	

}

/*----------------------------------------------------------------------------

-----------------------------------------------------------------------------*/
void led_show(void)
{
	static u8 cnt = 0;

	if(cmd_led_flag == 1){		//接收到控制
		
		SYSTEM_LED_REVERSE;
		
		cnt++;
		if(cnt > 5){			
			cnt = 0;
			cmd_led_flag = 0;			
		}
	}
	
}



/*-------------------------------------------------------------------------
	1、电量上报的重传还未做，电量的重传暂时不必做
		理由:如果实际SS已经接受电量数据并回复了回执，但SC没有接收到回执
			就会导致SC重复发送电量数据。
	2、故障上报的重传还未做

	3、不考虑串口出现多包数据连续发送的情况，1010处理

    
-------------------------------------------------------------------------*/
void main (void) 
{ 
	int ret = 0;
	
	system_clock_set();
 
	system_led_init();

	slcspc_select_channel_init();

	timer4_init();
	timer2_init();
	
	//串口初始化
	uart1_init();
	uart3_init();
	
	sys_init();

	/* 设置中断优先级 */
	interrupt_priority_set();

	MEEPROM_Init();

	//100大约为200ms，这里等待大约2s	
	delay(1000);		//等待SLC SPC上电完成初始化。


	rev_ssbroadcast = 0;

  	while(1) {

		if(sc.scanDevFlag){
			slcspc_device_info();
			sc.scanDevFlag = 0;
		}

		if(sicp_rev_success){
			sicp_rev_anaylze();			
			sicp_rev_success = 0;			
		}

		
		if(f_100ms){
			f_100ms = 0;
			slc_dimmer_finish_and_search();	

			if(cmd_led_flag){			//有数据接收,闪烁LED
				led_show();
			}				
		}
		
		if(f_1s){
			f_1s = 0;

			if(rev_ssbroadcast == 0){		/* 还没发送deviceinfo */
				if(send_device_info_active()){
					rev_ssbroadcast = 1;
				}						
			}
						
			report_energy_consum();

			slcspc_heartbeat_counts++;
			if(slcspc_heartbeat_counts >= 5){
				slcspc_heartbeat_counts = 0;
				slcspc_heartbeat();
			}

			malfunction_detect();

			if(cmd_led_flag == 0){	//没有数据接收，正常翻转LED
				SYSTEM_LED_REVERSE;
			}

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




