# ST Visual Debugger Generated MAKE File, based on i2c_master_poll.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=
ToolsetBin=
ToolsetInc=D:\Hstm8
ToolsetLib=D:\Lib
ToolsetIncOpts=-iD:\Hstm8 
ToolsetLibOpts=-lD:\Lib 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=i2c_master_poll
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +modsl0 +debug -pxp -no +split -pp -l -dSTM8S005 -i..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc -i..\..\..\inc -i..\..\..\include $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\stm8s_clk.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart2.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart2.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\i2c.$(ObjectExt) : ..\..\src\i2c.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\i2c.h ..\..\inc\uart.h ..\..\inc\i2c_master_poll.h c:\PROGRA~2\cosmic\cxstm8\hstm8\stdio.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\i2c_master_poll.$(ObjectExt) : ..\..\src\i2c_master_poll.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\inc\i2c_master_poll.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\main.$(ObjectExt) : ..\..\src\main.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\i2c_master_poll.h ..\..\inc\timer.h ..\..\inc\uart.h ..\..\inc\i2c.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\inc\stm8s_it.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\timer.$(ObjectExt) : ..\..\src\timer.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\timer.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\uart.$(ObjectExt) : ..\..\src\uart.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\uart.h ..\..\inc\timer.h ..\..\inc\i2c_master_poll.h ..\..\inc\i2c.h c:\PROGRA~2\cosmic\cxstm8\hstm8\stdlib.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\PROGRA~2\cosmic\cxstm8\hstm8\modsl0.h ..\..\inc\i2c_master_poll.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\uart.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart2.o $(OutputPath)\i2c.o $(OutputPath)\i2c_master_poll.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\timer.o $(OutputPath)\uart.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\i2c_master_poll.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 -m$(OutputPath)\$(TargetSName).map $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart2.o
	-@erase $(OutputPath)\i2c.o
	-@erase $(OutputPath)\i2c_master_poll.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\timer.o
	-@erase $(OutputPath)\uart.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\i2c_master_poll.elf
	-@erase $(OutputPath)\i2c_master_poll.elf
	-@erase $(OutputPath)\i2c_master_poll.map
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart2.ls
	-@erase $(OutputPath)\i2c.ls
	-@erase $(OutputPath)\i2c_master_poll.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\timer.ls
	-@erase $(OutputPath)\uart.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=i2c_master_poll
TargetSName=$(ProjectSFile)
TargetFName=$(ProjectSFile).elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 -pp -dSTM8S005 -i..\..\..\libraries\stm8s_stdperiph_driver\inc -i..\..\inc -i..\..\..\inc -i..\..\..\include $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) $(ProjectSFile).elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\stm8s_clk.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_clk.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_exti.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_gpio.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_i2c.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_itc.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_rst.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim1.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim2.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_tim4.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart2.$(ObjectExt) : ..\..\..\libraries\stm8s_stdperiph_driver\src\stm8s_uart2.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\i2c.$(ObjectExt) : ..\..\src\i2c.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\i2c.h ..\..\inc\uart.h ..\..\inc\i2c_master_poll.h c:\PROGRA~2\cosmic\cxstm8\hstm8\stdio.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\i2c_master_poll.$(ObjectExt) : ..\..\src\i2c_master_poll.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\inc\i2c_master_poll.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\main.$(ObjectExt) : ..\..\src\main.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\i2c_master_poll.h ..\..\inc\timer.h ..\..\inc\uart.h ..\..\inc\i2c.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : ..\..\src\stm8s_it.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\inc\stm8s_it.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\timer.$(ObjectExt) : ..\..\src\timer.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\timer.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\uart.$(ObjectExt) : ..\..\src\uart.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\uart.h ..\..\inc\timer.h ..\..\inc\i2c_master_poll.h ..\..\inc\i2c.h c:\PROGRA~2\cosmic\cxstm8\hstm8\stdlib.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\PROGRA~2\cosmic\cxstm8\hstm8\mods0.h ..\..\inc\i2c_master_poll.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s.h ..\..\inc\stm8s_conf.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_adc1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_awu.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_beep.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_clk.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_exti.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_flash.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_gpio.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_i2c.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_itc.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_iwdg.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_rst.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_spi.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim1.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim3.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_tim4.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_uart2.h ..\..\..\libraries\stm8s_stdperiph_driver\inc\stm8s_wwdg.h ..\..\inc\uart.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

$(ProjectSFile).elf :  $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart2.o $(OutputPath)\i2c.o $(OutputPath)\i2c_master_poll.o $(OutputPath)\main.o $(OutputPath)\stm8s_it.o $(OutputPath)\timer.o $(OutputPath)\uart.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\i2c_master_poll.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart2.o
	-@erase $(OutputPath)\i2c.o
	-@erase $(OutputPath)\i2c_master_poll.o
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\timer.o
	-@erase $(OutputPath)\uart.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\i2c_master_poll.elf
	-@erase $(OutputPath)\i2c_master_poll.elf
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart2.ls
	-@erase $(OutputPath)\i2c.ls
	-@erase $(OutputPath)\i2c_master_poll.ls
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\timer.ls
	-@erase $(OutputPath)\uart.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
endif
