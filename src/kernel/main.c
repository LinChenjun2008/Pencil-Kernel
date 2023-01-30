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
    
    thread_start("test 1",31,kthread,NULL);
    thread_start("test 2",31,kthread2,NULL);
    while(1)
    {
        col.Red++;
        if(col.Red >= 250)
        {
            col.Red = 0;
            col.Green++;
        }
        viewFill(&(gBI.GraphicsInfo),col,0,0,10,10);
    };
    return 0;
}