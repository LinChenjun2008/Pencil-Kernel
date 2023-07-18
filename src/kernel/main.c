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
PRIVATE position_t pos = {10,10};
void kthread(void* arg);
void k_prog(void* arg);

PUBLIC uint64_t kernel_main()
{
    intr_disable();
    init_serial(COM1_PORT);
    // 检查运行环境
    g_boot_info = *((boot_info_t*)0xffff800000007c00);
    if(g_boot_info.magic != 0x5a42cb1613d4a62f || !fpu_check())
    {
        pr_log(COM1_PORT,"\n --- check failed! ---\n");
        while (1);
    };
    g_boot_info.typeface_base += KERNEL_VMA_BASE;
    g_boot_info.ttf_base      += KERNEL_VMA_BASE;

    init_all();
    fpu_init();
    pixel_t col = {255,255,255,0};

    start_subsystem();
    intr_enable();
    message_t msg;
    send_recv(NR_SEND,SUBSYS_VIEW,&msg);
    send_recv(NR_SEND,SUBSYS_MM,&msg);

    thread_start("test 1",31,kthread,NULL);
    process_execute(k_prog,"Kernel prog");

    char s[128];
    cpu_factory_name(s);
    pr_str(&g_boot_info.graph_info,&pos,col,"CPU: ",1);
    pr_str(&g_boot_info.graph_info,&pos,col,s,1);
    pos.x = 10;
    sprintf(s,"\n编译时间: %s\n",__COMPILE_TIME__);
    pr_str(&g_boot_info.graph_info,&pos,col,s,1);
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
    PRIVATE pixel_t col =
    {
        .red = 255,
        .green = 255,
        .blue = 0,
    };
    message_t msg;
    // char s[126];
    msg.type = MM_GET_A_PAGE;
    send_recv(NR_BOTH,SUBSYS_MM,&msg);

    // sprintf(s,"mm_get_a_page: %p\n",msg.msg2.m2p1);
    // pr_str(&g_boot_info.graph_info,&pos,col,s,1);
    // // memset(msg.msg2.m2p1,0xff,PG_SIZE);

    // msg.type = MM_GET_A_PAGE;
    // send_recv(NR_BOTH,SUBSYS_MM,&msg);
    // sprintf(s,"mm_get_a_page: %p\n",msg.msg2.m2p1);
    // pr_str(&g_boot_info.graph_info,&pos,col,s,1);
    // memset(msg.msg2.m2p1,0xff,PG_SIZE);
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