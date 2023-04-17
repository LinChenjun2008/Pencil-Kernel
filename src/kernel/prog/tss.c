#include <tss.h>
#include <string.h>

PRIVATE struct TSS64 tss;

PUBLIC void init_tss()
{
    dword tss_size = sizeof(struct TSS64);
    memset(&tss,0,tss_size);
    tss.io_map = tss_size << 16;
    UINTN tss_base_l = ((UINTN)&tss) & 0xffffffff;
    UINTN tss_base_h = (((UINTN)&tss) >> 32) & 0xffffffff;
            
            GDT_table[9    ] = make_segmdesc((uint32_t)(tss_base_l & 0xffffffff),tss_size,AR_TYPE_TSS | AR_P);
    memcpy(&GDT_table[9 + 1],&tss_base_h,8);
    return;
}

PUBLIC void update_tss_rsp0(struct task_struct* pthread)
{
    tss.rsp0_h = ((dword)(((MEMORY_ADDRESS)pthread + PCB_SIZE) & 0xffffffff));
    tss.rsp0_l = ((dword)(((MEMORY_ADDRESS)pthread + PCB_SIZE) >> 32));
}