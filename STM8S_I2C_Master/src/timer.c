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
#include "uart.h"


/**
  * @brief  initializion for time4
  * @param  None.
  * @retval None
  */
void timer4_init(void)
{

	TIM4->PSCR = 0x06;		//分频值 16M/2^6 = 250K
	TIM4->IER = 0x01;		//使能触发中断
	TIM4->CNTR = 250;		//250*(1/250K) = 0.001s
	TIM4->ARR = 249;		//自动重装的值	
//	TIM4->ARR = 187;		//自动重装的值
	
	//enableInterrupts();
	//TIM4->CR1 |= 0x01;	//使能计数器
	TIM4->IER = 0x01;     	// Enable interrupt
  	TIM4->CR1 = 0x01;     	// Start timer
  	
}

/*----------------------------------------------------------------------------
	定时100ms
-----------------------------------------------------------------------------*/
void timer2_init(void)
{    
	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 25000);
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);
	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);	
	TIM2_Cmd(ENABLE);	
	
}



/*----------------------------------------------------------------------------
	Timer4_ISR 1ms
-----------------------------------------------------------------------------*/
#ifdef _COSMIC_
@far @interrupt void Timer4_ISR (void)
#else
void Timer4_ISR (void) interrupt 23 
#endif
 { 
  	TIM4->SR1 = 0;

 	f_1ms = 1;

	swuart_frame.txOverWait++;
	swuart_frame.rxOverWait++;


}




/*----------------------------------------------------------------------------
	Timer2_ISR 100ms
-----------------------------------------------------------------------------*/
#ifdef _RAISONANCE_
void Timer2_ISR(void) interrupt 13 {
#endif
#ifdef _COSMIC_
@far @interrupt void Timer2_ISR(void) {
#endif

	static u8	count_1s = 0;

	/* 清除标志 */
	TIM2->SR1 = 0;


	f_100ms = 1;

	count_1s++;

	if (count_1s >= 10){
		count_1s = 0;
		f_1s = 1;
	}



}













