#include <common.h>
#include <debug.h>
#include <stdint.h>
#include <global.h>
#include <init.h>
#include <interrupt.h>
#include <memory.h>
#include <thread.h>
#include <graphic.h>
#include <stdio.h>

struct BootInfo gBI;
struct Position Pos = {10,10};
void kthread(void* arg __attribute((unused)));
PUBLIC uint64_t kernel_main(struct BootInfo* binfo)
{
    intr_disable();
    binfo = (void*)0x7c00;
    gBI = *binfo;
    init_all();
    intr_enable();
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
    sprintf(str,"%s \n",VERSION);
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
        if((((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->Type != EfiMemoryMappedIO)
        {
            MemorySize += (((EFI_MEMORY_DESCRIPTOR*)binfo->MemoryMap.Buffer) + i)->NumberOfPages;
        }
    }
    sprintf(str,"内存: %d GB (%d MB) PhysicalMemoryBitmapBytes: %p\n",
    MemorySize >> 18,MemorySize >> 8,PhysicalMemoryBitmapBytes);
    vput_utf8_str(&(binfo->GraphicsInfo),&Pos,col,str);
    thread_start("Kt1",31,kthread,NULL);
    while(1);
    return 0;
}