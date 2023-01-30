#include <debug.h>
#include <stdint.h>
#include <global.h>
#include <graphic.h>
#include <init.h>
#include <interrupt.h>
#include <timer.h>
#include <memory.h>
#include <thread.h>
#include <keyboard.h>

PRIVATE struct SEGMDESC make_segmdesc(uint32_t base,uint32_t limit,uint16_t access)
{
    struct SEGMDESC desc;
    desc.limit_low    = (limit  & 0x0000ffff);
    desc.base_low     = (base   & 0x0000ffff);
    desc.base_mid     = ((base  & 0x00ff0000) >> 16);
    desc.access_right = (access & 0x00ff); // Type,S,DPL,P
    desc.limit_high   = (((limit >> 16) & 0x0f) | ((access >> 8 ) & 0x00f0)); // AVL,L,D/B,G
    desc.base_high    = ((base >> 24) & 0x00ff);
    return desc;
}

PRIVATE struct SEGMDESC GDT_table[10];

PRIVATE void init_gdt()
{
    GDT_table[0] = make_segmdesc(0,      0,        0);
    GDT_table[1] = make_segmdesc(0,      0,AR_CODE64);
    GDT_table[2] = make_segmdesc(0,      0,AR_DATA64);
    GDT_table[7] = make_segmdesc(0,0xfffff,AR_CODE32);
    GDT_table[8] = make_segmdesc(0,0xfffff,AR_DATA32);
    uint128_t gdt_ptr = (((uint128_t)0 + ((uint128_t)((uint64_t)GDT_table))) << 16) | (sizeof(GDT_table) - 1);
    __asm__ __volatile__
    (
        "lgdt %[gdt_ptr] \n\t"
        "movw %%ax,%%ds \n\t"
        "movw %%ax,%%es \n\t"
        "movw %%ax,%%fs \n\t"
        "movw %%ax,%%gs \n\t"
        "movw %%ax,%%ss \n\t"
         
        "pushq %[SelectorCode64] \n\t"
        "pushq $.next \n\t"
        "lretq \n\t"// == jmp SelectorCode64:.next
        ".next: \n\t"
        :
        :[gdt_ptr]"m"(gdt_ptr),[SelectorCode64]"i"(SelectorCode64_K),[SelectorData64]"ax"(SelectorData64_K)
        :"memory"
    );
}

PUBLIC void init_interrupt();

/**
 * @brief 初始化所有内容
*/
PUBLIC void init_all()
{
    init_gdt();
    init_interrupt();
    init_pit();
    init_memory();
    init_thread();
    init_keyboard();
    init_screen(&(gBI.GraphicsInfo));
}