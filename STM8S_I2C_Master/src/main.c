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
	sc.HWTtest = 0xC0;
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
	//UART_Init(57600);
	//printf("Hello World!\n");
	// Initialize I2C for communication
	/*
	ret = I2C_Config();                     
  if(ret != IIC_SUCCESS){
		printf("Initialize I2C Faild!\n");
	}else{
		printf("Initialize I2C Success!\n");
	}
	printf("Scan Device:\n");
	for(i=0;i<0x80;i++){
		ret = I2C_WriteBytes(i,NULL,0,10);
		if(ret == IIC_SUCCESS){
			printf("%02X ",i&0xFF);
			slave_addrs[slave_num++] = (uint8_t)i;
		}else{
			//printf("%02X --> %d\n",i,ret);
		}
	}
	printf("\n");
	//依次向每个从设备写读数据
	for(i=0;i<slave_num;i++){
		//写数据
		for(k=0;k<sizeof(write_buffer);k++){
			write_buffer[k] = (slave_addrs[i]<<4)|k;
		}
		printf("-------------------Write Teast[%02X]-------------------\n",slave_addrs[i]&0xFF);
		ret = I2C_WriteBytes(slave_addrs[i],write_buffer,sizeof(write_buffer),50);
		if(ret != IIC_SUCCESS){
			printf("Write Data To %02X Failed![%s]\n",slave_addrs[i],IIC_ErrorStr[ret]);
		}else{
			printf("Write Data To %02X Succeeded!\n",slave_addrs[i]&0xFF);
			printf("Write Data:");
			for(k=0;k<sizeof(write_buffer);k++){
				printf("%02X ",write_buffer[k]&0xFF);
			}
			printf("\n");
		}
		printf("-----------------Write&Read Teast[%02X]----------------\n",slave_addrs[i]&0xFF);
		//写读数据
		for(j=0;j<3;j++){
			write_buffer[0] = 0;
			write_buffer[1] = (uint8_t)j;
			ret = I2C_WriteReadBytes(slave_addrs[i],write_buffer,2,read_buffer,8,50);
			if(ret != IIC_SUCCESS){
				printf("Write&Read Data To %02X Failed![%s]\n",slave_addrs[i],IIC_ErrorStr[ret]);
			}else{
				printf("Write&Read Data To %02X Succeeded!\n",slave_addrs[i]&0xFF);
				printf("Write Data:");
				for(k=0;k<2;k++){
					printf("%02X ",write_buffer[k]&0xFF);
				}
				printf("\n");
				printf("Read Data:");
				for(k=0;k<8;k++){
					printf("%02X ",read_buffer[k]&0xFF);
				}
				printf("\n");
			}
		}
		printf("\n");
	}*/
  // initialization of dummy field for test purpose    
  //memcpy(Dummy, DUMMY_INIT, MAX_DUMMY);
  /*
	#ifndef _COSMIC_
  err_save= 0;
  TIM4_tout= loop_count= 0;
	#endif
  */
	// Enable all interrupts
	/*
	#if 0

	ret = I2C_WriteBytes(0x50,DUMMY_INIT,0,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_WriteBytes Error:%d\n",ret);
	}else{
		printf("I2C_WriteBytes Success\n");
	}
	
	ret = I2C_WriteBytes(0x50,DUMMY_INIT,9,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_WriteBytes Error:%d\n",ret);
	}else{
		printf("I2C_WriteBytes Success\n");
	}
	delay_ms(10);
	ret = I2C_ReadBytes(0x60,Dummy,1,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_ReadBytes Error:%d\n",ret);
	}else{
		printf("I2C Read 1Byte Success\n");
	}
	ret = I2C_ReadBytes(0x50,Dummy,2,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_ReadBytes Error:%d\n",ret);
	}else{
		printf("I2C Read 2Byte Success\n");
	}
	ret = I2C_ReadBytes(0x50,Dummy,3,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_ReadBytes Error:%d\n",ret);
	}else{
		printf("I2C Read 3Byte Success\n");
	}
	//set_tout_ms(10);
	//I2C_ReadRegister(0,5,Dummy);
	ret = I2C_ReadBytes(0x50,Dummy,4,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_ReadBytes Error:%d\n",ret);
	}else{
		printf("I2C Read 4Byte Success\n");
	}
	ret = I2C_WriteReadBytes(0x50,DUMMY_INIT,1,Dummy,8,100);
	if(ret != IIC_SUCCESS){
		printf("I2C_WriteReadBytes Error:%d\n",ret);
	}else{
		printf("I2C Read Success:");
		for(i=0;i<8;i++){
			printf("%02X ",Dummy[i]&0xFF);
		}
		printf("\n");
	}
	#endif
	*/
  /* main test loop */
	
	
  while(1) {
		
		/*
		// switch on LED1 at the beginning of test
    switch_on(LED1);
		// write 1 data bytes with offset 8 from Dummy filed to slave memory
    set_tout_ms(10);
    I2C_WriteRegister(8, 1, &Dummy[8]);
    // read 1 byte with offset 8 back from the image at slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_ReadRegister(8, 1, &Dummy[8]);
    }
    // write 6 bytes with offset 2 from Dummy filed to slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_WriteRegister(2, 6, &Dummy[2]);
    }
    // read 6 bytes with offset 2 back from the image at slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_ReadRegister(2, 6, &Dummy[2]);
    }
    // write 1 byte with offset 9 from Dummy filed to slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_WriteRegister(9, 1, &Dummy[9]);
    }
    // read 1 byte with offset 9 back from the image at slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_ReadRegister(9, 1, &Dummy[9]);
    }
    // write 2 bytes with offset 0 from Dummy filed to slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_WriteRegister(0, 2, &Dummy[0]);
    }
    // read 2 bytes with offset 0 back from the image at slave memory
    if(tout()) {
      set_tout_ms(10);
      I2C_ReadRegister(0, 2, &Dummy[0]);
    }
    // if a timout error occures switch on LED2 
    if(!tout())
      switch_on(LED1);
		// switch off LED1 at the end of test
    switch_off(LED1);
    // check if dummy field is not corrupted => switch on LED 4 if test not successful   
    if(memcmp(Dummy, DUMMY_INIT, MAX_DUMMY) != 0)
      switch_on(LED1);
    delay(1);
		*/
		if(!init_slc_spc_done){
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
						sicp_receipt_Done(0x05,rev_ad_message_id,ns_own_meshid_H,ns_own_meshid_L,0x01,rev_ad_mdid);
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