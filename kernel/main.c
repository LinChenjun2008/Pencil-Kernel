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
void kthread(void* arg);
void kthread2(void* arg);
PUBLIC uint64_t kernel_main()
{
    intr_disable();
    gBI = *((struct BootInfo*)0x7c00);
    init_all();
    intr_enable();
    thread_start("test 1",31,kthread,NULL);
    thread_start("test 2",31,kthread2,NULL);
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
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,logo,FontNormal);
    sprintf(str,"%s \n",VERSION);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"Copyright 2022 Pencil-Kernel developers. All Rights Reserved.\n",FontNormal);
    sprintf(str,"HorizontalResolution: %d VerticalResolution: %d\n",
    gBI.GraphicsInfo.HorizontalResolution,
    gBI.GraphicsInfo.VerticalResolution);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);

    int i,MemorySize = 0,PageCnt = gBI.MemoryMap.MapSize / gBI.MemoryMap.DescriptorSize;
    for(i = 0;i < PageCnt;i++)
    {
        if((((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->Type != EfiMemoryMappedIO)
        {
            MemorySize += (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->NumberOfPages;
        }
    }
    sprintf(str,"内存: %d GB (%d MB) PhysicalMemoryBitmapBytes: %p\n",
    MemorySize >> 18,MemorySize >> 8,PhysicalMemoryBitmapBytes);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    while(1);
    return 0;
}