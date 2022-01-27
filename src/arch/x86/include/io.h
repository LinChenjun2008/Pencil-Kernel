#ifndef __IO_H__
#define __IO_H__

#include "stdint.h"

extern void io_hlt(void);
extern void io_sti(void);
extern void io_cli(void);
extern void io_stihlt(void);

extern uint32_t io_in8(uint32_t port);
extern uint32_t io_in16(uint32_t port);
extern uint32_t io_in32(uint32_t port);

extern void io_out8(uint32_t port,uint32_t data);
extern void io_out16(uint32_t port,uint32_t data);
extern void io_out32(uint32_t port,uint32_t data);

#endif /* __IO_H__ */