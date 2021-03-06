#include "apilib.h"
#include "debug.h"
#include "fifo.h"
#include "global.h"
#include "graphic.h"
#include "init.h"
#include "interrupt.h"
#include "io.h"
#include "keyboard.h"
#include "logo.h"
#include "memory.h"
#include "message.h"
#include "mouse.h"
#include "print.h"
#include "process.h"
#include "stdio.h"
#include "string.h"
#include "syscall.h"
#include "task.h"
#include "thread.h"
#include "time.h"
#include "tss.h"

void shell(void* arg);

void kernel_main(void)
{
    int i;
    // char str[64];
    set_cursor(0);
    for(i = 0;i < 35;i++)
    {
        put_char(0x07,'\n');
    }
    set_cursor(0);
    init_all();
    intr_enable(); /* 开中断 */

    // vput_str(background->buf,ScrnX,20,20,rgb(255,255,255),PKn_Version);
    // sprintf(str,"Video Mode: 0x%x Scrnx = %d Scrny = %d\nMemory: %dMB", VideoMode, ScrnX, ScrnY,TotalMem_l / 1024 /1024);
    // vput_str(background->buf,ScrnX,20,36,rgb(255,255,255),"Copyright (c) 2021-2022 Pencil-Kernel developers, All rights reserved.");
    // vput_str(background->buf,ScrnX,20,52,rgb(255,255,255),str);
    // view_reflush(background,20,20,background->xsize,68);

    thread_start("MM",31,MM_task,NULL);
    thread_start("Taskmgr",31,taskmgr_thread,NULL);

    thread_start("View",31,view_task,NULL);
    // task_execute(view_task,"View");

    process_execute(u_prog_a,"user_progA");
    thread_start("shell",31,shell,NULL);
    task_execute(task_a,"Task_A");
    while(1); /* 这个死循环不能少 */

    return; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}

extern volatile int ticks;
void k_thread_a(void* arg)
{
    // struct viewblock* task_bar = viewblock_init(background->xsize,50);
    // viewFill(task_bar->buf,task_bar->xsize,rgb(198,198,198),0,0,task_bar->xsize - 1,task_bar->ysize - 1);
    // int off = 3;

    // viewFill(task_bar->buf,task_bar->xsize,rgb(132,132,132),10 + off,10 + off,40 + off,40 + off);
    // viewFill(task_bar->buf,task_bar->xsize,rgb(255,255,255),      10,      10,      40,      40);

    // int logo_x = 10;
    // int logo_y = 10;
    // int x;
    // int y;
    // for(y = 0;y < 15;y++)
    // {
    //     for(x = 0;x < 15;x++)
    //     {
    //         if(PencilLogo[y][x] == '#')
    //         {
    //             viewFill(task_bar->buf,task_bar->xsize,rgb(132,132,132),logo_x + 2 * x,logo_y + 2 * y,logo_x + 2 * (x + 1) ,logo_y + 2 * (y + 1));
    //         }
    //     }
    // }

    // viewFill(task_bar->buf,task_bar->xsize,rgb(132,132,132),50 + off,10 + off,60 + off,40 + off);
    // viewFill(task_bar->buf,task_bar->xsize,rgb(255,255,255),      50,      10,      60,      40);


    // viewFill(task_bar->buf,task_bar->xsize,rgb(132,132,132),task_bar->xsize - 153 + off,task_bar->ysize - 41 + off,task_bar->xsize - 11 + off,task_bar->ysize - 11 + off);
    // viewFill(task_bar->buf,task_bar->xsize,rgb(255,255,255),      task_bar->xsize - 153,      task_bar->ysize - 41,      task_bar->xsize - 11,      task_bar->ysize - 11);

    // viewInsert(&Screen_Ctl,task_bar);
    // viewSlide(task_bar,0,background->ysize - 50);

    struct TIME time;  /* 十进制表示的现实时间 */
    get_time(&time);
    int old_tickes = ticks;
    char str[32];
    while(1)
    {
        sprintf(str,"%04x/%02x/%02x %02x:%02x",time.year,time.month,time.day,time.hour,time.minuet);
        // viewFill(task_bar->buf,task_bar->xsize,rgb(255,255,255),task_bar->xsize - 145,task_bar->ysize - 33,task_bar->xsize - 17,task_bar->ysize - 18);
        // vput_str(task_bar->buf,task_bar->xsize,task_bar->xsize - 145,task_bar->ysize - 33,rgb(132,132,132),str);
        // view_reflush(task_bar,task_bar->xsize - 145,task_bar->ysize - 33,task_bar->xsize - 17,task_bar->ysize - 18);
        while(ticks <= old_tickes + 100){ ; } /* 时间发生变化时再刷新 */
        old_tickes = ticks;
        get_time(&time);
    }
}

void shell(void* arg)
{
    char data;
    // console_str(0x07,"\n[User]:");
    int pos_x = 20;
    int pos_y = 100;
    while(1)
    {
        if(!fifo_empty(&keybuf))
        {
            fifo_get(&keybuf,&data);
            // console_char(0x07,data);
            vput_char((void*)0xe0000000,ScrnX,pos_x,pos_y,rgb(255,255,255),data);
            pos_x += 8;
            if (data == enter)
            {
                pos_x = 20;
                pos_y += 16;
                // console_str(0x07,"[User]:");
            }
        }
    }
}

void u_prog_a(void)
{
    void* view;
    struct MESSAGE msg;
    view = api_viewCreat(100,100);
    api_viewFill(view,rgb(255,255,255),0,0,100,100);

    msg.type = VIEW_INSERT;
    msg.msg2.m2p1 = view;
    send_recv(BOTH,VIEW,&msg);

    msg.type = VIEW_SLIED;
    msg.msg3.m3i1 = 10;
    msg.msg3.m3i2 = 10;
    msg.msg3.m3p1 = view;
    send_recv(BOTH,VIEW,&msg);


    while(1);
}

void task_a(void)
{
    void* view;
    struct MESSAGE msg;
    msg.type = VIEW_CREAT;
    msg.msg1.m1i1 = 100;
    msg.msg1.m1i2 = 100;
    send_recv(BOTH,VIEW,&msg);
    view = api_viewCreat(200,200);
    api_viewFill(view,rgb(255,0,0),0,0,200,200);
    // msg.type = VIEW_FILL;
    // msg.msg3.m3i1 = 0;
    // msg.msg3.m3i2 = 0;
    // msg.msg3.m3i3 = 100;
    // msg.msg3.m3i4 = 100;
    // msg.msg3.m3l1 = rgb(0,255,0);
    // msg.msg3.m3p1 = view;
    // send_recv(BOTH,VIEW,&msg);

    msg.type = VIEW_INSERT;
    msg.msg2.m2p1 = view;
    send_recv(BOTH,VIEW,&msg);

    // msg.type = VIEW_SLIED;
    // msg.msg3.m3i1 = 30;
    // msg.msg3.m3i2 = 30;
    // msg.msg3.m3p1 = view;
    // send_recv(BOTH,VIEW,&msg);

    msg.type = VIEW_SLIED;
    msg.msg3.m3i1 = 100;
    msg.msg3.m3i2 = 100;
    msg.msg3.m3p1 = view;
    send_recv(BOTH,VIEW,&msg);

    (void)msg;
    while(1);
}