
#ifndef __MAIN_H
#define __MAIN_H


#include "stm8s.h"



/*----------------------------------------------------------------------------
	LED
-----------------------------------------------------------------------------*/

#define SYSTEM_LED_PORT  		(GPIOB)
#define SYSTEM_LED_PIN  		(GPIO_PIN_3)
#define SYSTEM_LED_ON 		GPIO_WriteLow(SYSTEM_LED_PORT, (GPIO_Pin_TypeDef)SYSTEM_LED_PIN)
#define SYSTEM_LED_OFF 		GPIO_WriteHigh(SYSTEM_LED_PORT, (GPIO_Pin_TypeDef)SYSTEM_LED_PIN)
#define SYSTEM_LED_REVERSE 	GPIO_WriteReverse(SYSTEM_LED_PORT, (GPIO_Pin_TypeDef)SYSTEM_LED_PIN)


#define COMM_LED_PORT  		(GPIOB)
#define COMM_LED_PIN  		(GPIO_PIN_2)
#define COMM_LED_ON 			GPIO_WriteLow(COMM_LED_PORT, (GPIO_Pin_TypeDef)COMM_LED_PIN)
#define COMM_LED_OFF 		GPIO_WriteHigh(COMM_LED_PORT, (GPIO_Pin_TypeDef)COMM_LED_PIN)
#define COMM_LED_REVERSE 	GPIO_WriteReverse(COMM_LED_PORT, (GPIO_Pin_TypeDef)COMM_LED_PIN)



/*----------------------------------------------------------------------------
	EEPROM
-----------------------------------------------------------------------------*/

//#define EEPROM_INIT_FLAG				0x55
#define EEPROM_INIT_FLAG				0


#define EEPROM_INIT_ADDRESS			0
#define EEPROM_DEVICEID_ADDRESS		1
#define EEPROM_MODEL_ADDRESS		11

#define EEPROM_FW_VERSION_ADDRESS	13
#define EEPROM_HW_VERSION_ADDRESS	15

#define EEPROM_BASH_ADDRESS			17


#define EEPROM_MANA_YEAR_ADDRESS	19
#define EEPROM_MANA_MONTH_ADDRESS	20
#define EEPROM_MANA_DAY_ADDRESS	21


#define EEPROM_CH1_STATUS_ADDRESS	45
#define EEPROM_CH2_STATUS_ADDRESS	46
#define EEPROM_CH3_STATUS_ADDRESS	47
#define EEPROM_CH4_STATUS_ADDRESS	48

#define EEPROM_MESHID_H_ADDRESS	49
#define EEPROM_MESHID_L_ADDRESS	50





/* 电量上报时间 min */
#define	ENERGY_CONSUM_REPORT_MINUTE	10
//#define	ENERGY_CONSUM_REPORT_MINUTE	1






extern u8	cmd_led_flag;




void sys_init(void);







void MEEPROM_WriteByte(u16 dLocal_Addr, u8 dLocal_Data);

u8 MEEPROM_ReadByte(u16 dLocal_Addr);



























#endif


