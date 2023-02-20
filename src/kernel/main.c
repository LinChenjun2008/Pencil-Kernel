#include <common.h>
#include <debug.h>
#include <stdint.h>
#include <global.h>
#include <init.h>
#include <interrupt.h>
#include <memory.h>
#include <thread.h>
#include <process.h>
#include <graphic.h>
#include <stdio.h>

#include <syscall.h>

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
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"中文显示测试。这是普通点阵字体《》。；‘’“”【】、|\n",FontNormal);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"中文显示测试。这是中号点阵字体\n",FontMedium);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"中文显示测试。这是大号点阵字体\n",FontLarge);
    pid_table[0] = thread_start("test 1",31,kthread,NULL)->pid;
    pid_table[1] = thread_start("test 2",31,kthread2,NULL)->pid;
    
    process_execute(k_prog,"kProg1");
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

////////////////////////////////////////////////////////////////////////////
//  下面是测试线程
////////////////////////////////////////////////////////////////////////////

void kthread(void* arg __attribute((unused)))
{
    PRIVATE BltPixel col =
    {
        .Red = 0,
        .Green = 0,
        .Blue = 0,
    };
    struct MESSAGE msg;
// send_recv(SEND,pid_table[1],&msg);
    send_recv(RECEIVE,pid_table[1],&msg);
    while(1)
    {
        col.Red++;
        if(col.Red >= 250)
        {
            col.Red = 0;
            col.Green++;
        }
        viewFill(&(gBI.GraphicsInfo),col,10,0,20,10);
    };
}

void kthread2(void* arg __attribute((unused)))
{
    PRIVATE BltPixel col =
    {
        .Red = 0,
        .Green = 0,
        .Blue = 0,
    };
    struct MESSAGE msg;
    msg.type = 1;
    send_recv(SEND,pid_table[0],&msg);
    while(1)
    {
        col.Red++;
        if(col.Red >= 250)
        {
            col.Red = 0;
            col.Green++;
        }
        viewFill(&(gBI.GraphicsInfo),col,20,0,30,10);
    };
}


////////////////////////////////////////////////////////////////////////////
//  下面是测试进程
////////////////////////////////////////////////////////////////////////////

void k_prog(void* arg __attribute((unused)))
{
    PANIC("In user Prog");
    PRIVATE BltPixel col =
    {
        .Red = 0,
        .Green = 0,
        .Blue = 0,
    };
    // struct MESSAGE msg;
// send_recv(SEND,pid_table[1],&msg);
    // send_recv(RECEIVE,pid_table[1],&msg);
    while(1)
    {
        col.Red++;
        if(col.Red >= 250)
        {
            col.Red = 0;
            col.Green++;
        }
        viewFill(&(gBI.GraphicsInfo),col,30,0,40,10);
    };
}