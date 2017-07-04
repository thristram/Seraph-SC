#ifndef __I2C_H
#define __I2C_H

#ifndef _I2C_GLOBAL
#define I2C_EXT	extern
#else
#define I2C_EXT
#endif

#define  I2C_LEN	30

typedef struct
{
	u8 frame_h1;
	u8 frame_h2;
	u8 message_id;
	u8 payload[30];
}I2C_Message;

//message id����
//��ѯdevice info��1~15�ֱ�Ϊ�¹ҵ��豸1~15
//����heartbeat��16~30�ֱ�Ϊ�¹ҵ��豸1~15
//��ѯSPC energy_consum��31~45
//����action dimmeer��46~60

I2C_EXT u8 i2c_tx_buf[I2C_LEN];
I2C_EXT u8 i2c_tx_len;
I2C_EXT u8 i2c_rx_buf[I2C_LEN];
I2C_EXT u8 i2c_rx_len;


I2C_EXT u16 device_flag;	//bit0~bit14��ʾ�豸����
I2C_EXT u8  hb_fail_mdid_cnt[15];
I2C_EXT u8  action_dimmer_MDID;
I2C_EXT u8  action_dimmer_ext;


I2C_EXT void scan_device(void);
I2C_EXT void i2c_device_info(void);
I2C_EXT void i2c_heartbeat(void);
I2C_EXT void i2c_get_energy_consum(void);
I2C_EXT u8 i2c_single_action_dimmer(u8 action,u8 mdid_channel,u8 value,u8 ext);
I2C_EXT u8 i2c_action_plug(u8 action,u8 mdid_channel,u8 value,u8 ext);
I2C_EXT u8 i2c_multiple_action_dimmer(u8 action_dimmer_num);
I2C_EXT u8 i2c_single_action_dimmer_result(u8 mdid);

#endif