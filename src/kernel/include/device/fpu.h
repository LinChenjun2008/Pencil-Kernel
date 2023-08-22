#ifndef __FPU_H__
#define __FPU_H__

#include <kernel/global.h>
#include <std/stdint.h>

#pragma pack(1)
typedef struct
{
    uint16_t control_word;
    uint16_t reserved1;
    uint16_t status_word;
    uint16_t reserved2;
    uint16_t tag_word;
    uint16_t reserved3;

    uint32_t fip;

    uint16_t fps;
    uint16_t fop;

    uint32_t fdp;

    uint16_t fds;
    uint16_t reserved4;

    uint8_t regs[80];
} fpu_t;
#pragma pack()

PUBLIC bool fpu_check();
PUBLIC void fpu_init();
PUBLIC void fpu_set(void* cur_thread,void* next);
#endif