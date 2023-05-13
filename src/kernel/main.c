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

boot_info_t g_boot_info;
position_t pos = {10,10};
void kthread(void* arg);
void kthread2(void* arg);

PUBLIC uint64_t kernel_main()
{
    intr_disable();
    g_boot_info = *((boot_info_t*)0x7c00);
    if
    (!(
        g_boot_info.magic[0] == 0x5a &&
        g_boot_info.magic[1] == 0x42 &&
        g_boot_info.magic[2] == 0xcb &&
        g_boot_info.magic[3] == 0x16 &&
        g_boot_info.magic[4] == 0x13 &&
        g_boot_info.magic[5] == 0xd4 &&
        g_boot_info.magic[6] == 0xa6 &&
        g_boot_info.magic[7] == 0x2f)
    )
    {
        while (1);
    };
    init_all();
    intr_enable();
    const char VERSION[] = "Pencil-Kernel(PKn) 0.1.1 ";
    position_t pos = {10,10};
    pixel_t col =
    {
        .red = 255,
        .green = 255,
        .blue = 255
    };
    char str[512];
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col, \
    "     _______   ______   __   __   ______   ______   __       \n" \
    "    / ___  /| / ____/| /  | / /| / ____/| /_  __/| / /|      \n" \
    "   / /__/ / // /____|// | |/ / // /|___|/ |/ /|_|// / /      \n" \
    "  / _____/ // ____/| / /| | / // / /      / / /  / / /       \n" \
    " / /|____|// /____|// / |  / // /_/__  __/ /_/  / / /__      \n" \
    "/_/ /     /______/|/_/ /|_/ //______/|/______/|/______/|     \n" \
    "|_|/      |______|/|_|/ |_|/ |______|/|______|/|______|/     \n" \
    ,FONT_NORMAL);
    sprintf(str,"%s \n",VERSION);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,str,FONT_NORMAL);
    sprintf(str,"TTF Base: %p\n",g_boot_info.ttf_base);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,str,FONT_NORMAL);
    pid_table[0] = thread_start("test 1",31,kthread,NULL)->pid;
    sprintf(str,"线程 1: pid: %d, PCB: %p\n",pid_table[0],pid2thread(pid_table[0]));
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,str,FONT_NORMAL);
    pid_table[1] = thread_start("test 2",31,kthread2,NULL)->pid;
    sprintf(str,"线程 2: pid: %d, PCB: %p\n",pid_table[1],pid2thread(pid_table[1]));
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,str,FONT_NORMAL);
    // process_execute(k_prog,"kProg1");
    while (1)
    {
        col.red++;
        if (col.red >= 250)
        {
            col.red = 0;
            col.green++;
        }
        view_fill(&(g_boot_info.graph_info),col,0,0,10,10);
    };
    return 0;
}

////////////////////////////////////////////////////////////////////////////
//  下面是测试线程
////////////////////////////////////////////////////////////////////////////

void kthread(void* arg __attribute__((unused)))
{
    PRIVATE pixel_t col =
    {
        .red = 0,
        .green = 0,
        .blue = 0,
    };
    message_t msg;
    send_recv(RECEIVE,pid_table[1],&msg);
    while (1)
    {
        col.red++;
        if (col.red >= 250)
        {
            col.red = 0;
            col.green++;
        }
        view_fill(&(g_boot_info.graph_info),col,10,0,20,10);
    };
}

void kthread2(void* arg __attribute__((unused)))
{
    PRIVATE pixel_t col =
    {
        .red = 0,
        .green = 0,
        .blue = 0,
    };
    message_t msg;
    msg.type = 1;
    send_recv(SEND,pid_table[0],&msg);
    while (1)
    {
        col.red++;
        if (col.red >= 250)
        {
            col.red = 0;
            col.green++;
        }
        view_fill(&(g_boot_info.graph_info),col,20,0,30,10);
    };
}


////////////////////////////////////////////////////////////////////////////
//  下面是测试进程
////////////////////////////////////////////////////////////////////////////

void k_prog(void* arg __attribute((unused)))
{
    PRIVATE pixel_t col =
    {
        .red = 0,
        .green = 0,
        .blue = 0,
    };
    while (1)
    {
        col.red++;
        if (col.red >= 250)
        {
            col.red = 0;
            col.green++;
        }
        view_fill(&(g_boot_info.graph_info),col,30,0,40,10);
    };
}