#ifndef __TSS_H__
#define __TSS_H__

#include "stdint.h"
#include "thread.h"

struct TSS32
{
    uint32_t backlink;
    uint32_t* esp0;
    uint32_t ss0;
    uint32_t* esp1;
    uint32_t ss1;
    uint32_t* esp2;
    uint32_t ss2;

    uint32_t cr3;

    uint32_t (*eip) (void);
    uint32_t eflages;
    
    uint32_t eax;
    uint32_t ecx;
    uint32_t edx;
    uint32_t ebx;
    uint32_t esp;
    uint32_t ebp;
    uint32_t esi;
    uint32_t edi;

    uint32_t es;
    uint32_t cs;
    uint32_t ss;
    uint32_t ds;
    uint32_t fs;
    uint32_t gs;

    uint32_t ldt;
    uint32_t trace;
    uint32_t iomap;
};

void init_tss();
void update_tss_esp0(struct task_struct* pthread);

#endif /* __TSS_H__ */