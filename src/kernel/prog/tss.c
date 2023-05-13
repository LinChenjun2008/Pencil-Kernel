#include <tss.h>
#include <string.h>

struct TSS64
{
    uint32_t reserved1;
    uint32_t rsp0_l;
    uint32_t rsp0_h;

    uint32_t rsp1_l;
    uint32_t rsp1_h;

    uint32_t rsp2_l;
    uint32_t rsp2_h;

    uint32_t reserved2;
    uint32_t reserved3;

    uint32_t ist1_l;
    uint32_t ist1_h;

    uint32_t ist2_l;
    uint32_t ist2_h;

    uint32_t ist3_l;
    uint32_t ist3_h;

    uint32_t ist4_l;
    uint32_t ist4_h;

    uint32_t ist5_l;
    uint32_t ist5_h;

    uint32_t ist6_l;
    uint32_t ist6_h;

    uint32_t ist7_l;
    uint32_t ist7_h;

    uint32_t reserved4;
    uint32_t reserved5;

    uint32_t io_map;
}__attribute__((packed));

PRIVATE struct TSS64 tss;

PUBLIC void init_tss()
{
    uint32_t tss_size = sizeof(struct TSS64);
    memset(&tss,0,tss_size);
    tss.io_map = tss_size << 16;
    UINTN tss_base_l = ((UINTN)&tss) & 0xffffffff;
    UINTN tss_base_h = (((UINTN)&tss) >> 32) & 0xffffffff;

            gdt_table[9    ] = make_segmdesc((uint32_t)(tss_base_l & 0xffffffff),tss_size,AR_TYPE_TSS | AR_P);
    memcpy(&gdt_table[9 + 1],&tss_base_h,8);
    return;
}

PUBLIC void update_tss_rsp0(task_struct_t* pthread)
{
    tss.rsp0_h = ((uint32_t)(((uintptr_t)pthread + PCB_SIZE) & 0xffffffff));
    tss.rsp0_l = ((uint32_t)(((uintptr_t)pthread + PCB_SIZE) >> 32));
}