#include <kernel/global.h>
#include <interrupt/interrupt.h>
#include <thread/thread.h>
#include <device/serial.h>
#include <std/stdio.h>

PRIVATE char str[512];
void panic_spin(const char* file,const char* base_file,int line,const char* func,
                const char* condition)
{
    intr_disable();
    sprintf(str,"--- Kernel Panic --- \n" \
                " File: %s \n" \
                " Base File: %s \n" \
                " In function: %s\n" \
                " Line: %d\n" \
                " Condition: %s\n" \
                " thread: %s",
                file,base_file,func,line,condition,running_thread()->name
            );
    // position_t pos = { 10,10};
    // pos.x = g_boot_info.graph_info.horizontal_resolution / 2 - (600 / 2);
    // pos.y = g_boot_info.graph_info.vertical_resolution / 2 - (250 / 2);
    // pixel_t col;
    // col.red = 127;
    // col.green = 64;
    // col.blue = 64;
    // view_fill(&(g_boot_info.graph_info),col,
    //         g_boot_info.graph_info.horizontal_resolution / 2 - (600 / 2),
    //         g_boot_info.graph_info.vertical_resolution / 2 - (250 / 2),
    //         g_boot_info.graph_info.horizontal_resolution / 2 + (600 / 2),
    //         g_boot_info.graph_info.vertical_resolution / 2 + (250 / 2)
    //         );
    // col.red = 255;
    // col.green = 255;
    // col.blue = 255;
    // pr_str(&(g_boot_info.graph_info),&pos,col,str,1);
    pr_log(COM1_PORT,str);
    while (1);
}