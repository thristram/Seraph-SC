#ifndef __UART_H
#define __UART_H

#ifndef _UART_GLOBAL
#define UART_EXT	extern
#else
#define UART_EXT
#endif

#define MAX              255             //随机数最大值  
#define MIN              1              //随机数最小值 

typedef struct
{
	u16				meshid;
	char 			deviceid[8];
	char			firmware[3];
	int				HWTtest;
	char			model[3];//设备型号
	char			coord[10];//设备在房间的位置
	char			macwifi[17];
	int				MDID;//用于汇报SLC/SPC的信息，模块ID
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
}SLC;

typedef struct
{
	int in;
	int duration;
	int out;
	int blank;
}TIME;

typedef struct
{
	u16				meshid;
	char 			deviceid[8];
	char			firmware[3];
	int				HWTtest;
	char			model[3];//设备型号
	char			coord[10];//设备在房间的位置
	char			macwifi[17];
	int				MDID;//用于汇报SLC/SPC的信息，模块ID
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	u16				energy_consum;
}SPC;

typedef struct
{
	u16 total_energy_consum;
	u16 total_current;
	u8  voltage;
}SC_sense;


typedef struct{
	u16				meshid;
	char 			deviceid[8];
	char			firmware[3];
	int				HWTtest;
	char			model[3];//设备型号
	char			coord[10];//设备在房间的位置
	char			macwifi[17];
	SC_sense	sense;
	SPC				spc[15];
	SLC				slc[15];
}SC_Module;





UART_EXT union  FLAG 				UART1Flag1_;
#define UART1Flag 					UART1Flag1_._flag_byte;
#define rev_success					UART1Flag1_._flag_bit.bit0
#define cmd_data_flag				UART1Flag1_._flag_bit.bit1//获取ST传感器数据
#define cmd_refresh_flag		UART1Flag1_._flag_bit.bit2//刷新ST传感器数据
#define cmd_status_flag			UART1Flag1_._flag_bit.bit3//获取ST当前设备状态
#define action_ctrlpad_flag	UART1Flag1_._flag_bit.bit4//ST打开或关闭ST开关
#define ble_data_frame			UART1Flag1_._flag_bit.bit5//收到BLE数据帧,帧头0xEE 0xEE
#define ble_ctrl_frame			UART1Flag1_._flag_bit.bit6//收到BLE控制帧，帧头0xDD,0xDD

UART_EXT union  FLAG 			UART1Flag2_;
#define UART2Flag 				UART1Flag2_._flag_byte;
#define gest_detect				UART1Flag2_._flag_bit.bit0//检测到上下左右手势标志
#define near_detect				UART1Flag2_._flag_bit.bit1//检测到接近手势标志
#define gest1_confirm			UART1Flag2_._flag_bit.bit2//检测到预设置指令手势1
#define gest2_confirm			UART1Flag2_._flag_bit.bit3//检测到预设置指令手势1
#define gest3_confirm			UART1Flag2_._flag_bit.bit4//检测到预设置指令手势1
#define gest4_confirm			UART1Flag2_._flag_bit.bit5//检测到预设置指令手势1

UART_EXT union  FLAG 			UART1Flag3_;
#define UART3Flag 				UART1Flag3_._flag_byte;
#define st_led_ctrl				UART1Flag3_._flag_bit.bit0//SS发送Action指令打开LED
#define st_pad1_ctrl			UART1Flag3_._flag_bit.bit1//SS发送ACtion指令打开触控开关1
#define st_pad2_ctrl			UART1Flag3_._flag_bit.bit2//SS发送ACtion指令打开触控开关2
#define st_pad3_ctrl			UART1Flag3_._flag_bit.bit3//SS发送ACtion指令打开触控开关3
#define st_pad1_confirm		UART1Flag3_._flag_bit.bit4//检测到预设置按键1被触发
#define st_pad2_confirm		UART1Flag3_._flag_bit.bit5//检测到预设置按键1被触发
#define st_pad3_confirm		UART1Flag3_._flag_bit.bit6//检测到预设置按键1被触发


UART_EXT union  FLAG 			UART1Flag4_;
#define UART4Flag 				UART1Flag4_._flag_byte;
#define kickout_flag			UART1Flag4_._flag_bit.bit0//ST发Device Info给SS后，加入Mesh网络失败，网关回复AA 04
#define net_reset_flag		UART1Flag4_._flag_bit.bit1//网关判断连接设备不合法时发送，模块接收到自动退出该 Mesh 网络 
#define led_ctrl_flag			UART1Flag4_._flag_bit.bit2//接收到LED指令标志
#define load_alert_flag   UART1Flag4_._flag_bit.bit3//加载预设报警信息标志
#define report_fault_flag UART1Flag4_._flag_bit.bit4//汇报Seraph相关设备故障 

/*
**ST发送，需判断是否接收到回执
**Device Info
**检测到手势
*/
UART_EXT union  FLAG 					UART1Flag5_;
#define UART5Flag 						UART1Flag5_._flag_byte;
#define receipt_device_info1	UART1Flag5_._flag_bit.bit0//ST收到SS网络状态帧回复Device Info回执
#define receipt_device_info2  UART1Flag5_._flag_bit.bit0//ST收到SS网络状态帧，但mesh id错误，回复AA 03
#define receipt_gesture1			UART1Flag5_._flag_bit.bit1//ST上报非预设置指令触发手势给网关，收到回执
#define receipt_gesture2			UART1Flag5_._flag_bit.bit2//ST发送0x51调光指令给SC，收到回执
#define receipt_action_notify	UART1Flag5_._flag_bit.bit3//ST发送0x08异步通知给SS,收到回执
#define receipt_send_failed		UART1Flag5_._flag_bit.bit4//ST发送失败，SS回复丢包，重发
#define receipt_conf_pad1			UART1Flag5_._flag_bit.bit5//SS配置ST按键1\2\3，SC发送回执AA 01
#define receipt_conf_pad2			UART1Flag5_._flag_bit.bit6//SS配置ST按键，但不是按键1\2\3，SC发送回执AA 03

UART_EXT union  FLAG 					UART1Flag6_;
#define UART6Flag 						UART1Flag6_._flag_byte;
#define receipt_conf_gest1		UART1Flag6_._flag_bit.bit0//SS配置ST手势1\2\3\4SC发送回执AA 01
#define receipt_conf_gest2		UART1Flag6_._flag_bit.bit1//SS配置ST手势,但不是手势1、2、3、4,SC发送回执AA 03


UART_EXT SC_Module sc;
UART_EXT u8 device_info_message_id;	//ST发送Device Info包给SS的message id
UART_EXT u8 action_notify_message_id;//ST发送action_notify包给SS的message id

/*
**网络状态缓存
*/
UART_EXT u8 	ns_signal;//network status signal信号强度
UART_EXT u8 	ns_status;//连接状态，0xFF,0x01~0x05
UART_EXT u8 	ns_phonenum;//连接手机数量
UART_EXT u8		ns_own_meshid_H;//本机Mesh ID
UART_EXT u8		ns_own_meshid_L;
UART_EXT u8		ns_host_meshid_H;//网关Mesh ID
UART_EXT u8		ns_host_meshid_L;

UART_EXT u8 rev_message_id;
UART_EXT u8 rev_module_id;
UART_EXT u8 rev_message_length;
UART_EXT u8 rev_meshid_H;
UART_EXT u8 rev_meshid_L;
UART_EXT u8 send_message_length;
UART_EXT u8 send_cmd;
UART_EXT u8 send_meshid_H;
UART_EXT u8 send_meshid_L;
UART_EXT u8 generate_messageid;
UART_EXT u8 send_count;
UART_EXT u8 rev_count;
UART_EXT u16 send_fault_count;//ST检测到故障发送错,每秒发1次
UART_EXT u16 send_failed_count;//收到SS/SC发送失败指令,每秒 重发1次
UART_EXT u8 send_buf[30];
UART_EXT u8 rev_buf[30];
UART_EXT u8 sicp_buf[30];

UART_EXT void delay(u16 Count);

UART_EXT void Init_UART1(void);
@interrupt void UART1_TX_ISR(void);
@interrupt void UART1_RX_ISR(void);
UART_EXT void UART1_Send_Data_Init(void);
UART_EXT void UART1_Send_Data_Start(void);
UART_EXT void clear_sicp_buf(void);
UART_EXT void clear_send_buf(void);
UART_EXT u8 Check_Sum(u8 *buf,u8 length);
UART_EXT void rev_deal(void);
UART_EXT u8 random(u8 xxx); 
UART_EXT void reve_analyze_reply(void);
UART_EXT void send_header_payload_init(u8 id,u8 mesh_id_H,u8 mesh_id_L,u8 len,u8 cmd);
UART_EXT void send_payload_init(u8 len,u8 cmd);
UART_EXT void rev_header_anaylze(u8 *message_id,u8 *mesh_id_H,u8 *mesh_id_L,u8 *message_length);
UART_EXT bool rev_payload_anaylze(void);

UART_EXT void pad_confirm(void);
UART_EXT void gest_confirm(void);


#endif