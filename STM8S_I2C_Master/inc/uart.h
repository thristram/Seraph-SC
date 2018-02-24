#ifndef __UART_H
#define __UART_H

#ifndef _UART_GLOBAL
#define UART_EXT	extern
#else
#define UART_EXT
#endif

#include "stm8s.h"


typedef struct
{
	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 payload[30];
	
}I2C_Message;



#define MAX              		255             //随机数最大值  
#define MIN              		1              //随机数最小值 
#define Uart2_Send_Len	 40
#define Uart2_Rec_Len	 	 40


#define UART1_SEND_LEN	 40
#define UART1_RECV_LEN	 40





//SICP的数据结构

typedef struct {

	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 mesh_id_H;
	u8 mesh_id_L;
	u8 payload[50];
	
}SICP_Message;	


typedef struct
{

	u8 				deviceID[4];
	
	u8				model;		//设备型号
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//生产批次号
	u16				GATTmeshID;

	
	char				coord[12];	//设备在房间的位置

	u8				MDID;		//用于汇报SLC/SPC的信息，模块ID
	
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;

	u8				malfunction_msgid;

	u8				singleDimmer;

	u8				HWTtest;			//故障信息，详见sidp第6点
	u8				offLineCnt;		/* 记录通讯失败的次数 */

	union FLAG 		flag;//bit0
								//bit1表示接收到decive info回执
								//bit2表示接收到malfunction回执
	
}SLC;




typedef struct
{
	int in;
	int duration;
	int out;
	int blank;
}TIME;			//ST action backlight的time结构



typedef struct
{ 
	u8 				deviceID[4];
	
	u8				model;		//设备型号
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//生产批次号
	u16				GATTmeshID;
	
	char				coord[12];	//设备在房间的位置

	u8				MDID;		//用于汇报SLC/SPC的信息，模块ID
	
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	
	u8				malfunction_msgid;				/* 检测故障是否发送成功，发射前保存，接收到回执后清零 */
	u8				energy_consum_msgid;				/* 检测电量是否发送成功 */

	u16       			energy_consume;	/* 消耗的电量 */

	u8				syncTimes;		//同步状态的时间，以100ms为单位，用在ST控制时向SS发送状态同步

	u8				HWTtest;//故障信息，详见sidp第6点
	u8				offLineCnt;		/* 记录通讯失败的次数 */

	union FLAG           	flag;				//bit0表示接收到电量汇报回执
									//bit1表示接收到decive info回执
									//bit2表示接收到malfunction回执

}SPC;


#define SLCSPC_OFFLINE_BIT	0x01







typedef struct
{
	u16 total_energy_consum;		//SC下挂所有SPC汇报的电量，单位是W.h
	
	u16 total_current;				//SC下挂所有SPC汇报的总电流
	
	u8  voltage;				//电压，默认220V				
		
	
}SC_sense;


typedef struct{


	u8 				deviceID[4];
	
	u8				scanDevFlag;	//扫描设备的标志

	u8				model;		//设备型号
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//生产批次号
	u16				meshID;
	u16				GATTmeshID;


	char				coord[10];//设备在房间的位置

	u8 				Ndevice;//总共挂有几个SLC和SPC
				
	u8				HWTtest;//故障信息，详见sidp第6点

	u8				malfunction_msgid;		/* 接收回执确认 */

	SC_sense	sense;


	
	u8				slcMultipleDimmer;		//slc多模块调光，状态同步时间
	u8				spcMultipleSync;		//slc多模块调光，状态同步时间

	SPC				spc[15];

	SLC				slc[15];

	union FLAG flag;					//bit0
									//bit1表示接收到decive info回执
									//bit2表示接收到malfunction回执
}SC_Module;


typedef enum {
  SICP_RECV =0,                      
  SICP_SEND 
} SICP_RXTX_TYPE;


#define 	DEVICE_SC	0xB1
#define 	DEVICE_SLC	0xB2
#define 	DEVICE_SPC	0xB3



UART_EXT union  FLAG 				UART1Flag1_;
#define UART1Flag1 					UART1Flag1_._flag_byte;
#define sicp_rev_success				UART1Flag1_._flag_bit.bit0	//uart2接收到1包SIDP数据,sicp_buf[]使能标志，为1时表示有数据正在使用，不可赋值

UART_EXT union  FLAG 				UART1Flag2_;
#define UART1Flag2 					UART1Flag2_._flag_byte;
#define receipt_eg						UART1Flag2_._flag_bit.bit0	//SC接收到SPC汇报电量
#define rev_ssbroadcast					UART1Flag2_._flag_bit.bit2	//SC接收到SS的广播包，得知网关的mesh id

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

UART_EXT u8	ns_own_meshid_H;//本机Mesh ID
UART_EXT u8	ns_own_meshid_L;
UART_EXT u8	ns_host_meshid_H;//网关Mesh ID
UART_EXT u8	ns_host_meshid_L;

UART_EXT u8   	rev_message_id;
UART_EXT u8   	rev_mesh_id_H;
UART_EXT u8   	rev_mesh_id_L;

UART_EXT u8 	UART2_Send_Buf[Uart2_Send_Len];
UART_EXT u8 	Uart2_Send_Length;
UART_EXT u8 	Uart2_Send_Cnt;
UART_EXT u8 	Uart2_Send_Done;
UART_EXT u8 	Uart2_Rece_Buf[Uart2_Rec_Len];
UART_EXT u8	Uart2_Rec_Cnt;
UART_EXT u8 	sicp_buf[Uart2_Rec_Len];
UART_EXT u16 	send_fault_count;		//ST检测到故障发送错,每秒发1次
UART_EXT u16 	send_failed_count;		//收到SS/SC发送失败指令,每秒 重发1次


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
UART_EXT void uart1_init(void);
@interrupt void UART1_TX_ISR(void);
@interrupt void UART1_RX_ISR(void);
UART_EXT void sicp_rev_anaylze(void);
UART_EXT u8 Check_Sum(u8 *buf,u8 length);
UART_EXT u8 random(u8 xxx); 

UART_EXT void sicp_send_message(SICP_Message *tx,u8 payload_len);

//回复
UART_EXT void sicp_receipt(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L);
UART_EXT void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid);

//主动发送
UART_EXT void report_energy_consum(void);
UART_EXT void send_device_info(void);

void malfunction_sended_confirm(u8 recvMsgid);
void malfunction_detect(void);

void send_device_info_all(u8 type, u8 msgid);
u8 send_device_info_active(void);
void sicp_heart_beat(SICP_RXTX_TYPE s);



void delay(u16 Count);

void uart3_init(void);


@interrupt void UART3_TX_ISR(void);
@interrupt void UART3_RX_ISR(void);


/* 以100ms为单位 */
#define SLC_DIMMER_DELAY_TIME	 10

#define SPC_SYNC_DELAY_TIME	 10


#define UART3_SEND_LEN	 40
#define UART3_RECV_LEN	 40



#define	SWUART_SUCCESS				0
#define	SWUART_ERROR_TIME_OUT		1
#define	SWUART_ERROR_BUSY				2
#define	SWUART_ERROR_NOT_ACK			3


#define SWUART_SEND_LEN	 40
#define SWUART_RECV_LEN	 40

/* 发送完成后等待接收时间	ms */
#define SWUART_TX_OVER_WAIT_TIME	 30
//判断是否接收完成的时间 ms
#define SWUART_RX_OVER_WAIT_TIME	 6


typedef struct
{
	u8	rxtxflag;		/* 0,无操作 1，发送 2，接收 */
	u8	flow;		/* 1，正在发送  2，发送完成，等待接收 3， 开始接收，等待接收完成 4， 接收完成 */


	u16 	devflag;		//设备标志	//bit0~bit14表示设备存在
	u16 	rxlen;		//总需要接收的字节数
	u16 	rxhas;		//已接收的字节数
	u16 	rxOverWait;	//判断是否接收完成的时间 ms

	u16 	txlen;		//总需要发送的字节数
	u16 	txhas;		//已发送的字节数
	u16 	txOverWait;	//发送完成后等待接收时间	ms
	
	u8 	rxbuf[SWUART_RECV_LEN];

	u8 	txbuf[SWUART_SEND_LEN];

	
}swuart_frame_t;	//SICP的数据结构



extern swuart_frame_t swuart_frame;


extern u8  hb_fail_mdid_cnt[15];		//i2c每5s给下挂SLC和SPC发送心跳包，没有回复则重复发20次，用于15个下挂的模块的重发计数


#define UART1_POSITION_LENGTH	 	4
#define UART1_POSITION_COMMAND	 	5
#define UART1_POSITION_TYPE			6

#define UART1_AFTER_LENGTH_BYTES	 5



#define SLCSPC_SELECT_GPIO			GPIOC

#define SLCSPC_SELECT_HIGH			GPIO_PIN_5
#define SLCSPC_SELECT_LOW			GPIO_PIN_4

#define SLCSPC_SELECT_PIN2			GPIO_PIN_3
#define SLCSPC_SELECT_PIN1			GPIO_PIN_2
#define SLCSPC_SELECT_PIN0			GPIO_PIN_1

u8 slcspc_get_message_id(void);
u8 sicp_get_message_id(void);


void slcspc_send_and_recv(void);
void slcspc_select_channel_init(void);
void slcspc_select_channel(u8 addr);
void slcspc_select_channel_reset(void);

u8 slcspc_one_process(I2C_Message *tx, u8 payload_len, u8 addr);

void slcspc_device_info(void);

void slcspc_heartbeat(void);

u8 slcspc_get_energy_consum(u8 i);

u8 slcspc_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext);

u8 slcspc_single_action_dimmer_result(u8 mdid);

u8 slcspc_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext);

u8 slcspc_multiple_action_dimmer(u8 action_dimmer_num);

u8 slcspc_multiple_action_plug(u8 action_plug_num);


#endif


