#ifndef __UART_H
#define __UART_H

#ifndef _UART_GLOBAL
#define UART_EXT	extern
#else
#define UART_EXT
#endif

#define MAX              255             //��������ֵ  
#define MIN              1              //�������Сֵ 

typedef struct
{
	u16				meshid;
	char 			deviceid[8];
	char			firmware[3];
	int				HWTtest;
	char			model[3];//�豸�ͺ�
	char			coord[10];//�豸�ڷ����λ��
	char			macwifi[17];
	int				MDID;//���ڻ㱨SLC/SPC����Ϣ��ģ��ID
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
	char			model[3];//�豸�ͺ�
	char			coord[10];//�豸�ڷ����λ��
	char			macwifi[17];
	int				MDID;//���ڻ㱨SLC/SPC����Ϣ��ģ��ID
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
	char			model[3];//�豸�ͺ�
	char			coord[10];//�豸�ڷ����λ��
	char			macwifi[17];
	SC_sense	sense;
	SPC				spc[15];
	SLC				slc[15];
}SC_Module;





UART_EXT union  FLAG 				UART1Flag1_;
#define UART1Flag 					UART1Flag1_._flag_byte;
#define rev_success					UART1Flag1_._flag_bit.bit0
#define cmd_data_flag				UART1Flag1_._flag_bit.bit1//��ȡST����������
#define cmd_refresh_flag		UART1Flag1_._flag_bit.bit2//ˢ��ST����������
#define cmd_status_flag			UART1Flag1_._flag_bit.bit3//��ȡST��ǰ�豸״̬
#define action_ctrlpad_flag	UART1Flag1_._flag_bit.bit4//ST�򿪻�ر�ST����
#define ble_data_frame			UART1Flag1_._flag_bit.bit5//�յ�BLE����֡,֡ͷ0xEE 0xEE
#define ble_ctrl_frame			UART1Flag1_._flag_bit.bit6//�յ�BLE����֡��֡ͷ0xDD,0xDD

UART_EXT union  FLAG 			UART1Flag2_;
#define UART2Flag 				UART1Flag2_._flag_byte;
#define gest_detect				UART1Flag2_._flag_bit.bit0//��⵽�����������Ʊ�־
#define near_detect				UART1Flag2_._flag_bit.bit1//��⵽�ӽ����Ʊ�־
#define gest1_confirm			UART1Flag2_._flag_bit.bit2//��⵽Ԥ����ָ������1
#define gest2_confirm			UART1Flag2_._flag_bit.bit3//��⵽Ԥ����ָ������1
#define gest3_confirm			UART1Flag2_._flag_bit.bit4//��⵽Ԥ����ָ������1
#define gest4_confirm			UART1Flag2_._flag_bit.bit5//��⵽Ԥ����ָ������1

UART_EXT union  FLAG 			UART1Flag3_;
#define UART3Flag 				UART1Flag3_._flag_byte;
#define st_led_ctrl				UART1Flag3_._flag_bit.bit0//SS����Actionָ���LED
#define st_pad1_ctrl			UART1Flag3_._flag_bit.bit1//SS����ACtionָ��򿪴��ؿ���1
#define st_pad2_ctrl			UART1Flag3_._flag_bit.bit2//SS����ACtionָ��򿪴��ؿ���2
#define st_pad3_ctrl			UART1Flag3_._flag_bit.bit3//SS����ACtionָ��򿪴��ؿ���3
#define st_pad1_confirm		UART1Flag3_._flag_bit.bit4//��⵽Ԥ���ð���1������
#define st_pad2_confirm		UART1Flag3_._flag_bit.bit5//��⵽Ԥ���ð���1������
#define st_pad3_confirm		UART1Flag3_._flag_bit.bit6//��⵽Ԥ���ð���1������


UART_EXT union  FLAG 			UART1Flag4_;
#define UART4Flag 				UART1Flag4_._flag_byte;
#define kickout_flag			UART1Flag4_._flag_bit.bit0//ST��Device Info��SS�󣬼���Mesh����ʧ�ܣ����ػظ�AA 04
#define net_reset_flag		UART1Flag4_._flag_bit.bit1//�����ж������豸���Ϸ�ʱ���ͣ�ģ����յ��Զ��˳��� Mesh ���� 
#define led_ctrl_flag			UART1Flag4_._flag_bit.bit2//���յ�LEDָ���־
#define load_alert_flag   UART1Flag4_._flag_bit.bit3//����Ԥ�豨����Ϣ��־
#define report_fault_flag UART1Flag4_._flag_bit.bit4//�㱨Seraph����豸���� 

/*
**ST���ͣ����ж��Ƿ���յ���ִ
**Device Info
**��⵽����
*/
UART_EXT union  FLAG 					UART1Flag5_;
#define UART5Flag 						UART1Flag5_._flag_byte;
#define receipt_device_info1	UART1Flag5_._flag_bit.bit0//ST�յ�SS����״̬֡�ظ�Device Info��ִ
#define receipt_device_info2  UART1Flag5_._flag_bit.bit0//ST�յ�SS����״̬֡����mesh id���󣬻ظ�AA 03
#define receipt_gesture1			UART1Flag5_._flag_bit.bit1//ST�ϱ���Ԥ����ָ������Ƹ����أ��յ���ִ
#define receipt_gesture2			UART1Flag5_._flag_bit.bit2//ST����0x51����ָ���SC���յ���ִ
#define receipt_action_notify	UART1Flag5_._flag_bit.bit3//ST����0x08�첽֪ͨ��SS,�յ���ִ
#define receipt_send_failed		UART1Flag5_._flag_bit.bit4//ST����ʧ�ܣ�SS�ظ��������ط�
#define receipt_conf_pad1			UART1Flag5_._flag_bit.bit5//SS����ST����1\2\3��SC���ͻ�ִAA 01
#define receipt_conf_pad2			UART1Flag5_._flag_bit.bit6//SS����ST�����������ǰ���1\2\3��SC���ͻ�ִAA 03

UART_EXT union  FLAG 					UART1Flag6_;
#define UART6Flag 						UART1Flag6_._flag_byte;
#define receipt_conf_gest1		UART1Flag6_._flag_bit.bit0//SS����ST����1\2\3\4��SC���ͻ�ִAA 01
#define receipt_conf_gest2		UART1Flag6_._flag_bit.bit1//SS����ST����,����������1��2��3��4,SC���ͻ�ִAA 03


UART_EXT SC_Module sc;
UART_EXT u8 device_info_message_id;	//ST����Device Info����SS��message id
UART_EXT u8 action_notify_message_id;//ST����action_notify����SS��message id

/*
**����״̬����
*/
UART_EXT u8 	ns_signal;//network status signal�ź�ǿ��
UART_EXT u8 	ns_status;//����״̬��0xFF,0x01~0x05
UART_EXT u8 	ns_phonenum;//�����ֻ�����
UART_EXT u8		ns_own_meshid_H;//����Mesh ID
UART_EXT u8		ns_own_meshid_L;
UART_EXT u8		ns_host_meshid_H;//����Mesh ID
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
UART_EXT u16 send_fault_count;//ST��⵽���Ϸ��ʹ�,ÿ�뷢1��
UART_EXT u16 send_failed_count;//�յ�SS/SC����ʧ��ָ��,ÿ�� �ط�1��
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