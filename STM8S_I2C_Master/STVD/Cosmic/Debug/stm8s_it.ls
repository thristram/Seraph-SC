   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 61 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  32                     ; 62 {
  33                     .text:	section	.text,new
  34  0000               f_TRAP_IRQHandler:
  39                     ; 66 }
  42  0000 80            	iret
  64                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  64                     ; 73 {
  65                     .text:	section	.text,new
  66  0000               f_TLI_IRQHandler:
  71                     ; 77 }
  74  0000 80            	iret
  96                     ; 84 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
  96                     ; 85 {
  97                     .text:	section	.text,new
  98  0000               f_AWU_IRQHandler:
 103                     ; 89 }
 106  0000 80            	iret
 128                     ; 96 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 128                     ; 97 {
 129                     .text:	section	.text,new
 130  0000               f_CLK_IRQHandler:
 135                     ; 101 }
 138  0000 80            	iret
 161                     ; 108 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 161                     ; 109 {
 162                     .text:	section	.text,new
 163  0000               f_EXTI_PORTA_IRQHandler:
 168                     ; 113 }
 171  0000 80            	iret
 194                     ; 120 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 194                     ; 121 {
 195                     .text:	section	.text,new
 196  0000               f_EXTI_PORTB_IRQHandler:
 201                     ; 125 }
 204  0000 80            	iret
 227                     ; 132 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 227                     ; 133 {
 228                     .text:	section	.text,new
 229  0000               f_EXTI_PORTC_IRQHandler:
 234                     ; 137 }
 237  0000 80            	iret
 260                     ; 144 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 260                     ; 145 {
 261                     .text:	section	.text,new
 262  0000               f_EXTI_PORTD_IRQHandler:
 267                     ; 149 }
 270  0000 80            	iret
 293                     ; 156 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 293                     ; 157 {
 294                     .text:	section	.text,new
 295  0000               f_EXTI_PORTE_IRQHandler:
 300                     ; 161 }
 303  0000 80            	iret
 325                     ; 207 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 325                     ; 208 {
 326                     .text:	section	.text,new
 327  0000               f_SPI_IRQHandler:
 332                     ; 212 }
 335  0000 80            	iret
 358                     ; 219 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 358                     ; 220 {
 359                     .text:	section	.text,new
 360  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 365                     ; 224 }
 368  0000 80            	iret
 391                     ; 231 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 391                     ; 232 {
 392                     .text:	section	.text,new
 393  0000               f_TIM1_CAP_COM_IRQHandler:
 398                     ; 236 }
 401  0000 80            	iret
 424                     ; 268  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 424                     ; 269 {
 425                     .text:	section	.text,new
 426  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 431                     ; 273 }
 434  0000 80            	iret
 457                     ; 280  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 457                     ; 281 {
 458                     .text:	section	.text,new
 459  0000               f_TIM2_CAP_COM_IRQHandler:
 464                     ; 285 }
 467  0000 80            	iret
 490                     ; 295  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 490                     ; 296 {
 491                     .text:	section	.text,new
 492  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 497                     ; 300 }
 500  0000 80            	iret
 523                     ; 307  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 523                     ; 308 {
 524                     .text:	section	.text,new
 525  0000               f_TIM3_CAP_COM_IRQHandler:
 530                     ; 312 }
 533  0000 80            	iret
 556                     ; 361  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 556                     ; 362 {
 557                     .text:	section	.text,new
 558  0000               f_UART2_TX_IRQHandler:
 563                     ; 366   }
 566  0000 80            	iret
 589                     ; 373  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 589                     ; 374 {
 590                     .text:	section	.text,new
 591  0000               f_UART2_RX_IRQHandler:
 596                     ; 378   }
 599  0000 80            	iret
 621                     ; 426  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 621                     ; 427 {
 622                     .text:	section	.text,new
 623  0000               f_ADC1_IRQHandler:
 628                     ; 432 }
 631  0000 80            	iret
 654                     ; 466 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 654                     ; 467 {
 655                     .text:	section	.text,new
 656  0000               f_EEPROM_EEC_IRQHandler:
 661                     ; 471 }
 664  0000 80            	iret
 676                     	xdef	f_EEPROM_EEC_IRQHandler
 677                     	xdef	f_ADC1_IRQHandler
 678                     	xdef	f_UART2_TX_IRQHandler
 679                     	xdef	f_UART2_RX_IRQHandler
 680                     	xdef	f_TIM3_CAP_COM_IRQHandler
 681                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 682                     	xdef	f_TIM2_CAP_COM_IRQHandler
 683                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 684                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 685                     	xdef	f_TIM1_CAP_COM_IRQHandler
 686                     	xdef	f_SPI_IRQHandler
 687                     	xdef	f_EXTI_PORTE_IRQHandler
 688                     	xdef	f_EXTI_PORTD_IRQHandler
 689                     	xdef	f_EXTI_PORTC_IRQHandler
 690                     	xdef	f_EXTI_PORTB_IRQHandler
 691                     	xdef	f_EXTI_PORTA_IRQHandler
 692                     	xdef	f_CLK_IRQHandler
 693                     	xdef	f_AWU_IRQHandler
 694                     	xdef	f_TLI_IRQHandler
 695                     	xdef	f_TRAP_IRQHandler
 714                     	end
