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

#include <serial.h>

#include <fpu.h>

boot_info_t g_boot_info;
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
    pid_table[0] = thread_start("test 1",31,kthread,NULL)->pid;
    pid_table[1] = thread_start("test 2",31,kthread2,NULL)->pid;
    process_execute(k_prog,"Kernel prog");
    pixel_t col = {255,255,255,0};
    position_t pos = {0,10};
    pr_str(&(g_boot_info.graph_info),&pos,col,"12 Innovation in China 中国智造,慧及全球 0123456789\n",12.0);
    pr_str(&(g_boot_info.graph_info),&pos,col,"18 Innovation in China 中国智造,慧及全球 0123456789\n",18.0);
    pr_str(&(g_boot_info.graph_info),&pos,col,"24 Innovation in China 中国智造,慧及全球 0123456789\n",24.0);
    pr_str(&(g_boot_info.graph_info),&pos,col,"36 Innovation in China 中国智造,慧及全球 0123456789\n",36.0);
    pr_str(&(g_boot_info.graph_info),&pos,col,"48 Innovation in China 中国智造,慧及全球 0123456789\n",48.0);
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