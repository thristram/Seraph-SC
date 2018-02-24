#ifndef __TIMER_H
#define __TIMER_H

#ifndef _TIMER_GLOBAL
#define TIEMR_EXT	extern
#else
#define TIEMR_EXT
#endif

TIEMR_EXT union  FLAG 		Flag1_;
#define Flag1 					Flag1_._flag_byte;
#define f_1ms						Flag1_._flag_bit.bit0
#define f_100ms					Flag1_._flag_bit.bit1
#define f_300ms					Flag1_._flag_bit.bit2
#define f_1s						Flag1_._flag_bit.bit3



void timer4_init(void);
void timer2_init(void);

#ifdef _COSMIC_
@far @interrupt void Timer4_ISR (void);
#else
void Timer4_ISR (void) interrupt 23;
#endif



#ifdef _RAISONANCE_
void Timer2_ISR(void) interrupt 13 ;
#endif
#ifdef _COSMIC_
@far @interrupt void Timer2_ISR(void);
#endif



#endif