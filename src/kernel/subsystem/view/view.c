#include <subsystem.h>
#include <graphic.h>
#include <interrupt/interrupt.h>
#include <std/stdio.h>
#include <time.h>

PRIVATE void time_thread()
{
    PRIVATE pixel_t col ={255,255,255,0};
    char s[64];
    char time_style[25] = "%04x/%02x/%02x %02x:%02x";
    time_t time;
    get_time(&time);
    uint32_t minuet1 = time.minuet;
    unsigned int time_x0 = 0;
    unsigned int time_y0 = 0;
    unsigned int time_x1 = 0;
    unsigned int time_y1 = 0;
    position_t pos = {0,0};

    col.alpha = 255; // 先在透明状态下打印一遍,用于计算字体大小
    sprintf(s,time_style,0,0,0,0,0,0);
    pr_ttf_str(&g_boot_info.graph_info,&pos,col,s,12.0);
    time_x0 = g_boot_info.graph_info.horizontal_resolution - pos.x - 20;
    time_x1 = g_boot_info.graph_info.horizontal_resolution - 20;
    pr_ttf_str(&g_boot_info.graph_info,&pos,col,"\n",12.0);
    time_y0 = g_boot_info.graph_info.vertical_resolution - (70 + pos.y) / 2;
    time_y1 = time_y0 + pos.y;
    col.alpha = 0;

    pos.x = time_x0;
    pos.y = time_y0;
    sprintf(s,time_style,time.year,time.month,time.day,time.hour,time.minuet);
    pr_ttf_str(&g_boot_info.graph_info,&pos,col,s,12.0);
    pixel_t bgc = *((pixel_t*)g_boot_info.graph_info.frame_buffer_base
                + time_y0 * g_boot_info.graph_info.horizontal_resolution
                + time_x0);
    while (1)
    {
        if (minuet1 != time.minuet)
        {
            pos.x = time_x0;
            pos.y = time_y0;
            sprintf(s,time_style,time.year,time.month,time.day,time.hour,time.minuet);
            view_fill(&g_boot_info.graph_info,bgc,time_x0,time_y0,time_x1,time_y1);
            pr_ttf_str(&g_boot_info.graph_info,&pos,col,s,12.0);
            minuet1 = time.minuet;
        }
        get_time(&time);
    };
}

PRIVATE void make_background()
{
    intr_status_t intr_status = intr_disable();
    graph_info_t* graph_info = &g_boot_info.graph_info;
    int tsk  = 70;
    pixel_t color;
    color.red   = 0x20;
    color.green = 0x70;
    color.blue  = 0x90;
    view_fill(graph_info,color,0,0,graph_info->horizontal_resolution,
              graph_info->vertical_resolution - tsk);

    color.red   = 0x20;
    color.green = 0x20;
    color.blue  = 0x20;
    view_fill(graph_info,color,0,    graph_info->vertical_resolution - tsk,
              graph_info->horizontal_resolution,graph_info->vertical_resolution);

    color.red   = 0x50;
    color.green = 0x50;
    color.blue  = 0x50;
    view_fill(graph_info,color,0,    graph_info->vertical_resolution - tsk,
              tsk * 4,graph_info->vertical_resolution);

    color.red   = 0xa0;
    color.green = 0xa0;
    color.blue  = 0xa0;
    view_fill(graph_info,color,10,    graph_info->vertical_resolution - tsk + 10,
              tsk - 10,graph_info->vertical_resolution - 10);
    intr_set_status(intr_status);
}

PUBLIC void view_main()
{
    message_t msg;
    send_recv(NR_RECEIVE,ANY,&msg);
    make_background();
    thread_start("time",31,time_thread,NULL);
    while(1)
    {
        send_recv(NR_RECEIVE,ANY,&msg);
        switch(msg.type)
        {
            default:
                break;
        }
    }
}