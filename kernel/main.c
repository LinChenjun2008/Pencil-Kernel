#include <common.h>
#include <stdint.h>
#include <global.h>
#include <graphic.h>
#include <stdarg.h>

const char VERSION[] = "Pencil-Kernel(PKn) 0.1.1 ";
/**
    @brief 内核的主函数
    @param binfo    启动数据,由引导程序传入

    @retval         正常情况下永不返回

**/

struct BootInfo gBI;

uint64_t kernel_main(struct BootInfo* binfo)
{
    init_screen(&(binfo->GraphicsInfo));
    gBI = *binfo;
    struct Position Pos = {10,10};
    BltPixel col = 
    {
        .Red = 255,
        .Green = 255,
        .Blue = 255
    };
    char str[512];
    char* logo = 
    "     _______   ______   __   __   ______   ______   __       \n"
    "    / ___  /| / ____/| /  | / /| / ____/| /_  __/| / /|      \n"
    "   / /__/ / // /____|// | |/ / // /|___|/ |/ /|_|// / /      \n"
    "  / _____/ // ____/| / /| | / // / /      / / /  / / /       \n"
    " / /|____|// /____|// / |  / // /_/__  __/ /_/  / / /__      \n"
    "/_/ /     /______/|/_/ /|_/ //______/|/______/|/______/|     \n"
    "|_|/      |______|/|_|/ |_|/ |______|/|______|/|______|/     \n";
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,logo);
    sprintf(str,"%s%s \n",VERSION,__COMPILE_DATE__);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"Copyright 2022 Pencil-Kernel developers. All Rights Reserved.\n");
    sprintf(str,"分辨率:%d * %d 显存基址:%p\n",
    binfo->GraphicsInfo.HorizontalResolution,
    binfo->GraphicsInfo.VerticalResolution,
    binfo->GraphicsInfo.FrameBufferBase);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);

    col.Red = 240;
    col.Green = 155;
    col.Blue = 90;
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"系统初始化开始\n");
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"创建GDT\n");
    init_gdt();
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"完成.\n");
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,"系统初始化结束\n");
    col.Red = 255;
    col.Green = 255;
    col.Blue = 255;

    int i,cnt = 0;
    for(i = 0;i < binfo->MemoryMap.MapSize / binfo->MemoryMap.DescriptorSize;i++)
    {
        // sprintf(str,"%2d Type %x PhysicalStart %p VirtualStart %p NumberOfPages: %d Attribute %x\n",
        // i,
        // (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Type,
        // (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->PhysicalStart,
        // (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->VirtualStart,
        // (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->NumberOfPages,
        // (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Attribute
        // );
        // vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
        if((((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Attribute != EfiMemoryMappedIO)
        {
            cnt += (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->NumberOfPages;
        }
    }
    sprintf(str,"内存: %d GB (%d MB)\n",
    cnt >> 18,cnt >> 8);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    while(1);
    return 0;
}


static struct SEGMDESC make_segmdesc(uint32_t base,uint32_t limit,uint16_t access)
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

static struct SEGMDESC GDT_table[10];
void init_gdt()
{
    GDT_table[0] = make_segmdesc(0,      0,        0);
    GDT_table[1] = make_segmdesc(0,      0,AR_CODE64);
    GDT_table[2] = make_segmdesc(0,      0,AR_DATA64);
    GDT_table[7] = make_segmdesc(0,0xfffff,AR_CODE32);
    GDT_table[8] = make_segmdesc(0,0xfffff,AR_DATA32);
    uint128_t gdt_ptr = (((uint128_t)0 + ((uint128_t)GDT_table)) << 16) | (sizeof(GDT_table) - 1);
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