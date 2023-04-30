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
    if
    (!(
        gBI.Magic[0] == 0x5a &&
        gBI.Magic[1] == 0x42 &&
        gBI.Magic[2] == 0xcb &&
        gBI.Magic[3] == 0x16 &&
        gBI.Magic[4] == 0x13 &&
        gBI.Magic[5] == 0xd4 &&
        gBI.Magic[6] == 0xa6 &&
        gBI.Magic[7] == 0x2f)
    )
    {
        while(1);
    };
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
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col, \
    "     _______   ______   __   __   ______   ______   __       \n" \
    "    / ___  /| / ____/| /  | / /| / ____/| /_  __/| / /|      \n" \
    "   / /__/ / // /____|// | |/ / // /|___|/ |/ /|_|// / /      \n" \
    "  / _____/ // ____/| / /| | / // / /      / / /  / / /       \n" \
    " / /|____|// /____|// / |  / // /_/__  __/ /_/  / / /__      \n" \
    "/_/ /     /______/|/_/ /|_/ //______/|/______/|/______/|     \n" \
    "|_|/      |______|/|_|/ |_|/ |______|/|______|/|______|/     \n" \
    ,FontNormal);
    sprintf(str,"%s \n",VERSION);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"Copyright 2022 Pencil-Kernel developers. All Rights Reserved.\n",FontNormal);
    sprintf(str,"HorizontalResolution: %d VerticalResolution: %d\n",
    gBI.GraphicsInfo.HorizontalResolution,
    gBI.GraphicsInfo.VerticalResolution);
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    pid_table[0] = thread_start("test 1",31,kthread,NULL)->pid;
    sprintf(str,"线程 1: pid: %d, PCB: %p\n",pid_table[0],pid2thread(pid_table[0]));
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    pid_table[1] = thread_start("test 2",31,kthread2,NULL)->pid;
    sprintf(str,"线程 2: pid: %d, PCB: %p\n",pid_table[1],pid2thread(pid_table[1]));
    vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,str,FontNormal);
    
    // test
    int count = 10;
    char *addr1,*addr2,*addr3,*addr4,*addr5,*addr6,*addr7;
    int size;
    while(count-- > 0)
    {
        size = 127;
        addr1 = kmalloc(size);
        size *= 2;
        addr2 = kmalloc(size);
        size *= 2;
        addr3 = kmalloc(size);
        kfree(addr1);
        addr4 = kmalloc(size);
        size *= 2;
        addr5 = kmalloc(size);
        addr6 = kmalloc(size);
        kfree(addr5);
        size *= 2;
        addr7 = kmalloc(size);
        kfree(addr6);
        kfree(addr7);
        kfree(addr2);
        kfree(addr3);
        kfree(addr4);
    }



    // process_execute(k_prog,"kProg1");
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

void kthread(void* arg __attribute__((unused)))
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

void kthread2(void* arg __attribute__((unused)))
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
    PRIVATE BltPixel col =
    {
        .Red = 0,
        .Green = 0,
        .Blue = 0,
    };
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