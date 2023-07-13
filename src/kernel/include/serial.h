#ifndef __SERIAL_H__
#define __SERIAL_H__

#include <global.h>
#include <stdint.h>

#define COM1_PORT 0x3f8
#define COM2_PORT 0x2f8
#define COM3_PORT 0x3e8
#define COM4_PORT 0x2e8
#define COM5_PORT 0x5f8
#define COM6_PORT 0x4f8
#define COM7_PORT 0x5e8
#define COM8_PORT 0x4e8

PUBLIC void init_serial(uint16_t port);
PUBLIC int is_transmit_empty(uint16_t port);
PUBLIC void write_serial(uint16_t port,char a);

PUBLIC void pr_log(uint16_t port,const char* log);

#endif