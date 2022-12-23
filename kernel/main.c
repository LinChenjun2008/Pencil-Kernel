#include <common.h>
#include <stdint.h>
#include <global.h>
#include <init.h>
#include <interrupt.h>
#include <graphic.h>
#include <stdio.h>

/**
    @brief 内核的主函数
    @param binfo    启动数据,由引导程序传入

    @retval         正常情况下永不返回

**/
struct BootInfo gBI;
PUBLIC uint64_t kernel_main(struct BootInfo* binfo)
{
    gBI = *binfo;
    init_all();
    //intr_enable();
    const char VERSION[] = "Pencil-Kernel(PKn) 0.1.1 ";
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

    int i,MemorySize = 0,PageCnt = binfo->MemoryMap.MapSize / binfo->MemoryMap.DescriptorSize;
    for(i = 0;i < PageCnt;i++)
    {
        //     sprintf(str,"%2d Type %x PhysicalStart %p VirtualStart %p NumberOfPages: %d Attribute %x\n",
        //     i,
        //     (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Type,
        //     (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->PhysicalStart,
        //     (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->VirtualStart,
        //     (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->NumberOfPages,
        //     (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Attribute
        //     );
        //     vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
        // 
        if((((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Attribute != EfiMemoryMappedIO)
        {
            MemorySize += (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->NumberOfPages;
        }
    }
    sprintf(str,"内存: %d GB (%d MB)\n",
    MemorySize >> 18,MemorySize >> 8);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    while(1);
    return 0;
}


struct BootInfo gBI;