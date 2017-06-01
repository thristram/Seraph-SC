/**
  ******************************************************************************
  * @file    timer.c
  * @author  Seraph
  * @version  V1.0
  * @date     2017-03
  * @brief   This file contains the main function for STM8S003F3 timer operation.
**/

#define  _TIMER_GLOBAL
#include "stm8s.h"
#include "timer.h"


extern u16 TIM4_tout;
/**
  * @brief  initializion for time4
  * @param  None.
  * @retval None
  */
void Init_Time4(void)
{

	TIM4->PSCR = 0x06;//��Ƶֵ 8M/2^6 = 12.5K
	TIM4->IER = 0x01;//ʹ�ܴ����ж�
	TIM4->CNTR = 125;//125*(1/12.5K) = 0.001s
	TIM4->ARR = 125;//�Զ���װ��ֵ
}


/**
  * @brief  System time manage,set all the time flag used
  * @param  None.
  * @retval None
  */
void Sys_Time_Manage(void)
{
	systime_count[0]++;
	if (systime_count[0] >= 100)
	{
		systime_count[0] = 0;
		f_100ms = 1;
	}
	systime_count[1]++;
	if (systime_count[1] >= 300)
	{
		systime_count[1] = 0;
		f_300ms = 1;
	}
	systime_count[2]++;
	if (systime_count[2] >= 1000)
	{
		systime_count[2] = 0;
		f_1s = 1;
	}
}

#ifdef _COSMIC_
@far @interrupt void TIM4InterruptHandle (void) {
#else
void TIM4InterruptHandle (void) interrupt 23 {
#endif
  f_1ms = 1;
  TIM4->SR1= 0;
	Sys_Time_Manage();
	
	 if(TIM4_tout)
    if(--TIM4_tout == 0)
#ifdef _COSMIC_
      _asm("nop");
#else
      _nop_();
#endif
}
