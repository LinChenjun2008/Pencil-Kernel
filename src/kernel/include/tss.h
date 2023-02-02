#ifndef __TSS_H__
#define __TSS_H__

#include <global.h>
#include <thread.h>

struct TSS64
{
    dword reserved1;
    dword rsp0_l;
    dword rsp0_h;
    
    dword rsp1_l;
    dword rsp1_h;

    dword rsp2_l;
    dword rsp2_h;

    dword reserved2;
    dword reserved3;

    dword ist1_l;
    dword ist1_h;

    dword ist2_l;
    dword ist2_h;

    dword ist3_l;
    dword ist3_h;

    dword ist4_l;
    dword ist4_h;

    dword ist5_l;
    dword ist5_h;

    dword ist6_l;
    dword ist6_h;

    dword ist7_l;
    dword ist7_h;

    dword reserved4;
    dword reserved5;

    dword io_map;
}__attribute__((packed));

void init_tss();
void update_tss_rsp0(struct task_struct* pthread);

#endif