#include <common.h>
#include <device/cpu.h>
#include <debug.h>
#include <init.h>
#include <interrupt/interrupt.h>
#include <memory.h>
#include <thread/thread.h>
#include <time.h>
#include <process.h>
#include <graphic.h>
#include <std/stdio.h>
#include <subsystem.h>
#include <syscall.h>
#include <device/serial.h>

#include <device/acpi.h>

boot_info_t g_boot_info;
// PRIVATE position_t pos = {10,10};
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

    init_all();
    fpu_init();
    pixel_t col = {0,0,0,0};
    intr_enable();
    start_subsystem();
    message_t msg;
    send_recv(NR_SEND,SUBSYS_VIEW,&msg);
    send_recv(NR_SEND,SUBSYS_MM,&msg);

    thread_start("test 1",31,kthread,NULL);
    process_execute(k_prog,"Kernel prog");

    while (1)
    {
        col.red+=10;
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
        col.red+=10;
        view_fill(&(g_boot_info.graph_info),col,10,0,20,10);
    };
}


////////////////////////////////////////////////////////////////////////////
//  下面是测试进程
////////////////////////////////////////////////////////////////////////////

#include <std/string.h>

void k_prog(void* arg __attribute((unused)))
{
    PRIVATE pixel_t col =
    {
        .red = 128,
        .green = 128,
        .blue = 128,
    };
    message_t msg;
    msg.type = MM_EXIT;
    __asm__ __volatile__("movq %%rsp,%0":"=r"(msg.msg3.m3l1));
    send_recv(NR_BOTH,SUBSYS_MM,&msg);
    while (1)
    {
        col.red+=10;
        view_fill(&(g_boot_info.graph_info),col,20,0,30,10);

        if (col.red > 200)
        {
            message_t msg;
            msg.type = MM_EXIT;
            __asm__ __volatile__("movq %%rsp,%0":"=r"(msg.msg3.m3l1));
            send_recv(NR_BOTH,SUBSYS_MM,&msg);
        }
    };
}