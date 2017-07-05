#ifndef __UART_H
#define __UART_H

#ifndef _UART_GLOBAL
#define UART_EXT	extern
#else
#define UART_EXT
#endif

#define MAX              255             //随机数最大值  
#define MIN              1              //随机数最小值 
#define Uart2_Send_Len	 40
#define Uart2_Rec_Len	 	 40

typedef struct
{
	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 mesh_id_H;
	u8 mesh_id_L;
	u8 payload[50];
}SICP_Message;

typedef struct
{
	u16				meshid;
	u8 				deviceid[4];
	u8				firmware;
	u8				HWTtest;
	u8				model;//设备型号
	char			coord[10];//设备在房间的位置
	int				MDID;//用于汇报SLC/SPC的信息，模块ID
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	union FLAG flag;//bit0
									//bit1表示接收到decive info回执
									//bit2表示接收到malfunction回执
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
	u8 				deviceid[4];
	u8				firmware;
	u8				HWTtest;
	u8				model;//设备型号
	char			coord[10];//设备在房间的位置
	int				MDID;//用于汇报SLC/SPC的信息，模块ID
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	u16				energy_consum;
	union FLAG flag;//bit0表示接收到电量汇报回执
									//bit1表示接收到decive info回执
									//bit2表示接收到malfunction回执
}SPC;

typedef struct
{
	u16 total_energy_consum;//单位是W.h
	u16 total_current;
	u8  voltage;
}SC_sense;


typedef struct{
	u16				meshid;
	u8 				deviceid[4];
	u8				firmware;
	u8				HWTtest;
	u8				model;//设备型号
	char			coord[10];//设备在房间的位置
	u8 				Ndevice;//总共挂有几个SLC和SPC
	SC_sense	sense;
	SPC				spc[15];
	SLC				slc[15];
	union FLAG flag;//bit0
									//bit1表示接收到decive info回执
									//bit2表示接收到malfunction回执
}SC_Module;



UART_EXT union  FLAG 				UART1Flag1_;
#define UART1Flag1 					UART1Flag1_._flag_byte;
#define rev_success					UART1Flag1_._flag_bit.bit0
#define ble_data_frame			UART1Flag1_._flag_bit.bit1
#define ble_ctrl_frame			UART1Flag1_._flag_bit.bit2

UART_EXT union  FLAG 				UART1Flag2_;
#define UART1Flag2 					UART1Flag2_._flag_byte;
#define receipt_eg					UART1Flag2_._flag_bit.bit0
#define rev_bleheartbeat		UART1Flag2_._flag_bit.bit1

UART_EXT union  FLAG 			UART1Flag3_;
#define UART1Flag3 				UART1Flag3_._flag_byte;



UART_EXT union  FLAG 			UART1Flag4_;
#define UART1Flag4 				UART1Flag4_._flag_byte;


/*
**ST发送，需判断是否接收到回执
**Device Info
**检测到手势
*/
UART_EXT union  FLAG 					UART1Flag5_;
#define UART5Flag 						UART1Flag5_._flag_byte;


UART_EXT union  FLAG 					UART1Flag6_;
#define UART6Flag 						UART1Flag6_._flag_byte;



UART_EXT SC_Module sc;
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

UART_EXT u8   rev_message_id;
UART_EXT u8   rev_mesh_id_H;
UART_EXT u8   rev_mesh_id_L;
//接收到action dimmer指令暂存，main函数中用到
UART_EXT u8   rev_ad_message_id;
UART_EXT u8   rev_ad_mdid;
UART_EXT u8   rev_ad_channel;



UART_EXT u8 UART2_Send_Buf[Uart2_Send_Len];
UART_EXT u8 Uart2_Send_Length;
UART_EXT u8 Uart2_Send_Cnt;
UART_EXT u8 Uart2_Send_Done;
UART_EXT u8 Uart2_Rece_Buf[Uart2_Rec_Len];
UART_EXT u8	Uart2_Rec_Cnt;
UART_EXT u8 sicp_buf[Uart2_Rec_Len];
UART_EXT u16 send_fault_count;//ST检测到故障发送错,每秒发1次
UART_EXT u16 send_failed_count;//收到SS/SC发送失败指令,每秒 重发1次


//UART_EXT u8 eg_message_id;//发送电量汇报时的message id
//1~15表示spc[0]~spc[14]
//UART_EXT u8 sc_di_message_id;//发送sc device info的message id
//16表示sc
//UART_EXT u8 slc_di_message_id;//发送slc device info的message id
//21~35表示slc[0]~slc[14]
//UART_EXT u8 spc_di_message_id;//发送spc device info的message id
//36~50表示spc[0]~spc[14]
//17表示sc发送malfunction的message id
//51~65表示slc[0]~slc[14]发送malfunction的message id
//66~80表示spc[0]~spc[14]发送malfunction的message id

UART_EXT u8 di_timeout;
UART_EXT u8 mal_timeout;



UART_EXT void mymemcpy(void *des,void *src,u32 n);
UART_EXT void Init_uart2(void);
@interrupt void UART2_TX_ISR(void);
@interrupt void UART2_RX_ISR(void);
UART_EXT void rev_anaylze(void);
UART_EXT u8 Check_Sum(u8 *buf,u8 length);
UART_EXT void rev_deal(void);
UART_EXT u8 random(u8 xxx); 

UART_EXT void sicp_send_message(SICP_Message *tx,u8 payload_len);

//回复
UART_EXT void sicp_receipt_OK(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L);
UART_EXT void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid);
UART_EXT void rev_cmd_data(u8 moduleid);
//主动发送
UART_EXT void report_energy_consum(void);
UART_EXT void send_device_info(void);
UART_EXT void send_malfunction(void);
UART_EXT void check_send_repeatedly(void);

extern void sys_init(void);
extern u8 init_slc_spc_done;
#endif


