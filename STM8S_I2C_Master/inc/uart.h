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



#define MAX              		255             //��������ֵ  
#define MIN              		1              //�������Сֵ 
#define Uart2_Send_Len	 40
#define Uart2_Rec_Len	 	 40


#define UART1_SEND_LEN	 40
#define UART1_RECV_LEN	 40





//SICP�����ݽṹ

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
	
	u8				model;		//�豸�ͺ�
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//�������κ�
	u16				GATTmeshID;

	
	char				coord[12];	//�豸�ڷ����λ��

	u8				MDID;		//���ڻ㱨SLC/SPC����Ϣ��ģ��ID
	
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;

	u8				malfunction_msgid;

	u8				singleDimmer;

	u8				HWTtest;			//������Ϣ�����sidp��6��
	u8				offLineCnt;		/* ��¼ͨѶʧ�ܵĴ��� */

	union FLAG 		flag;//bit0
								//bit1��ʾ���յ�decive info��ִ
								//bit2��ʾ���յ�malfunction��ִ
	
}SLC;




typedef struct
{
	int in;
	int duration;
	int out;
	int blank;
}TIME;			//ST action backlight��time�ṹ



typedef struct
{ 
	u8 				deviceID[4];
	
	u8				model;		//�豸�ͺ�
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//�������κ�
	u16				GATTmeshID;
	
	char				coord[12];	//�豸�ڷ����λ��

	u8				MDID;		//���ڻ㱨SLC/SPC����Ϣ��ģ��ID
	
	u8				ch1_status;
	u8				ch2_status;
	u8				ch3_status;
	u8				ch4_status;
	
	u8				malfunction_msgid;				/* �������Ƿ��ͳɹ�������ǰ���棬���յ���ִ������ */
	u8				energy_consum_msgid;				/* �������Ƿ��ͳɹ� */

	u16       			energy_consume;	/* ���ĵĵ��� */

	u8				syncTimes;		//ͬ��״̬��ʱ�䣬��100msΪ��λ������ST����ʱ��SS����״̬ͬ��

	u8				HWTtest;//������Ϣ�����sidp��6��
	u8				offLineCnt;		/* ��¼ͨѶʧ�ܵĴ��� */

	union FLAG           	flag;				//bit0��ʾ���յ������㱨��ִ
									//bit1��ʾ���յ�decive info��ִ
									//bit2��ʾ���յ�malfunction��ִ

}SPC;


#define SLCSPC_OFFLINE_BIT	0x01







typedef struct
{
	u16 total_energy_consum;		//SC�¹�����SPC�㱨�ĵ�������λ��W.h
	
	u16 total_current;				//SC�¹�����SPC�㱨���ܵ���
	
	u8  voltage;				//��ѹ��Ĭ��220V				
		
	
}SC_sense;


typedef struct{


	u8 				deviceID[4];
	
	u8				scanDevFlag;	//ɨ���豸�ı�־

	u8				model;		//�豸�ͺ�
	
	u8				firmware_version;
	u8				HW_version;

	u8				manaYear;
	u8				manaMonth;
	u8				manaDay;

	u16				bash;		//�������κ�
	u16				meshID;
	u16				GATTmeshID;


	char				coord[10];//�豸�ڷ����λ��

	u8 				Ndevice;//�ܹ����м���SLC��SPC
				
	u8				HWTtest;//������Ϣ�����sidp��6��

	u8				malfunction_msgid;		/* ���ջ�ִȷ�� */

	SC_sense	sense;


	
	u8				slcMultipleDimmer;		//slc��ģ����⣬״̬ͬ��ʱ��
	u8				spcMultipleSync;		//slc��ģ����⣬״̬ͬ��ʱ��

	SPC				spc[15];

	SLC				slc[15];

	union FLAG flag;					//bit0
									//bit1��ʾ���յ�decive info��ִ
									//bit2��ʾ���յ�malfunction��ִ
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
#define sicp_rev_success				UART1Flag1_._flag_bit.bit0	//uart2���յ�1��SIDP����,sicp_buf[]ʹ�ܱ�־��Ϊ1ʱ��ʾ����������ʹ�ã����ɸ�ֵ

UART_EXT union  FLAG 				UART1Flag2_;
#define UART1Flag2 					UART1Flag2_._flag_byte;
#define receipt_eg						UART1Flag2_._flag_bit.bit0	//SC���յ�SPC�㱨����
#define rev_ssbroadcast					UART1Flag2_._flag_bit.bit2	//SC���յ�SS�Ĺ㲥������֪���ص�mesh id

UART_EXT union  FLAG 			UART1Flag3_;
#define UART1Flag3 				UART1Flag3_._flag_byte;



UART_EXT union  FLAG 			UART1Flag4_;
#define UART1Flag4 				UART1Flag4_._flag_byte;


/*
**ST���ͣ����ж��Ƿ���յ���ִ
**Device Info
**��⵽����
*/
UART_EXT union  FLAG 					UART1Flag5_;
#define UART5Flag 						UART1Flag5_._flag_byte;


UART_EXT union  FLAG 					UART1Flag6_;
#define UART6Flag 						UART1Flag6_._flag_byte;



UART_EXT SC_Module sc;
/*
**����״̬����
*/
UART_EXT u8 	ns_signal;//network status signal�ź�ǿ��
UART_EXT u8 	ns_status;//����״̬��0xFF,0x01~0x05
UART_EXT u8 	ns_phonenum;//�����ֻ�����

UART_EXT u8	ns_own_meshid_H;//����Mesh ID
UART_EXT u8	ns_own_meshid_L;
UART_EXT u8	ns_host_meshid_H;//����Mesh ID
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
UART_EXT u16 	send_fault_count;		//ST��⵽���Ϸ��ʹ�,ÿ�뷢1��
UART_EXT u16 	send_failed_count;		//�յ�SS/SC����ʧ��ָ��,ÿ�� �ط�1��


//UART_EXT u8 eg_message_id;//���͵����㱨ʱ��message id
//1~15��ʾspc[0]~spc[14]
//UART_EXT u8 sc_di_message_id;//����sc device info��message id
//16��ʾsc
//UART_EXT u8 slc_di_message_id;//����slc device info��message id
//21~35��ʾslc[0]~slc[14]
//UART_EXT u8 spc_di_message_id;//����spc device info��message id
//36~50��ʾspc[0]~spc[14]
//17��ʾsc����malfunction��message id
//51~65��ʾslc[0]~slc[14]����malfunction��message id
//66~80��ʾspc[0]~spc[14]����malfunction��message id

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

//�ظ�
UART_EXT void sicp_receipt(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L);
UART_EXT void sicp_receipt_Done(u8 type,u8 send_message_id,u8 send_mesh_id_H,u8 send_mesh_id_L,u8 method,u8 mdid);

//��������
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


/* ��100msΪ��λ */
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

/* ������ɺ�ȴ�����ʱ��	ms */
#define SWUART_TX_OVER_WAIT_TIME	 30
//�ж��Ƿ������ɵ�ʱ�� ms
#define SWUART_RX_OVER_WAIT_TIME	 6


typedef struct
{
	u8	rxtxflag;		/* 0,�޲��� 1������ 2������ */
	u8	flow;		/* 1�����ڷ���  2��������ɣ��ȴ����� 3�� ��ʼ���գ��ȴ�������� 4�� ������� */


	u16 	devflag;		//�豸��־	//bit0~bit14��ʾ�豸����
	u16 	rxlen;		//����Ҫ���յ��ֽ���
	u16 	rxhas;		//�ѽ��յ��ֽ���
	u16 	rxOverWait;	//�ж��Ƿ������ɵ�ʱ�� ms

	u16 	txlen;		//����Ҫ���͵��ֽ���
	u16 	txhas;		//�ѷ��͵��ֽ���
	u16 	txOverWait;	//������ɺ�ȴ�����ʱ��	ms
	
	u8 	rxbuf[SWUART_RECV_LEN];

	u8 	txbuf[SWUART_SEND_LEN];

	
}swuart_frame_t;	//SICP�����ݽṹ



extern swuart_frame_t swuart_frame;


extern u8  hb_fail_mdid_cnt[15];		//i2cÿ5s���¹�SLC��SPC������������û�лظ����ظ���20�Σ�����15���¹ҵ�ģ����ط�����


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


