#include <common.h>
#include <cpu.h>
#include <debug.h>
#include <init.h>
#include <interrupt.h>
#include <memory.h>
#include <thread.h>
#include <time.h>
#include <process.h>
#include <graphic.h>
#include <stdio.h>
#include <subsystem.h>
#include <syscall.h>
#include <serial.h>

boot_info_t g_boot_info;

void kthread(void* arg);
void kthread2(void* arg);
void k_prog(void* arg);

PUBLIC uint64_t kernel_main()
{
    intr_disable();
    init_serial(COM1_PORT);
    // 检查运行环境
    g_boot_info = *((boot_info_t*)0x7c00);
    if(g_boot_info.magic != 0x5a42cb1613d4a62f || !fpu_check())
    {
        pr_log(COM1_PORT,"\n --- check failed! ---\n");
        while (1);
    };
    init_all();
    pixel_t col = {255,255,255,0};
    position_t pos = {10,10};

    thread_start("test 1",31,kthread,NULL);
    thread_start("test 2",31,kthread2,NULL);
    process_execute(k_prog,"Kernel prog");
    start_subsystem();
    intr_enable();
    message_t msg;
    send_recv(NR_SEND,SUBSYS_VIEW,&msg);

    char s[128];
    cpu_factory_name(s);
    pr_str(&g_boot_info.graph_info,&pos,col,"CPU: ",12.0);
    pr_str(&g_boot_info.graph_info,&pos,col,s,12.0);
    pos.x = 10;
    sprintf(s,"\n编译时间: %s\n",__COMPILE_TIME__);
    pr_str(&g_boot_info.graph_info,&pos,col,s,12.0);
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
    while(1);
}

void kthread2(void* arg __attribute__((unused)))
{
    PRIVATE pixel_t col =
    {
        .red = 0,
        .green = 0,
        .blue = 0,
    };
    // message_t msg;
    // msg.type = 1;
    // send_recv(NR_SEND,kthread_pid,&msg);
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


////////////////////////////////////////////////////////////////////////////
//  下面是测试进程
////////////////////////////////////////////////////////////////////////////

void k_prog(void* arg __attribute((unused)))
{
    // message_t msg;
    // msg.type = 1;
    // send_recv(NR_SEND,kthread_pid,&msg);
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
        view_fill(&(g_boot_info.graph_info),col,20,0,30,10);
    };
}