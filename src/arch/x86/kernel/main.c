#include "debug.h"
#include "global.h"
#include "graphic.h"
#include "init.h"
#include "interrupt.h"
#include "io.h"
#include "memory.h"
#include "print.h"
#include "string.h"
#include "thread.h"
#include "time.h"

struct TIME time;

void k_thread_a(void* arg);
void k_thread_b(void* arg);

void kernel_main(void)
{
    init_all();
    intr_enable(); /* 开中断 */
    put_str_graphic(&(Screen.win),20,40,0x00fffffff,"Hello World!",12);
    put_str("Hello world\n");

    put_char('P');
    put_char('K');
    put_char('n');
    put_char(' ');
    put_char('(');
    put_char('c');
    put_char(')');
    put_char(' ');
    put_char('L');
    put_char('i');
    put_char('n');
    put_char('C');
    put_char('h');
    put_char('e');
    put_char('n');
    put_char('j');
    put_char('u');
    put_char('n');

    put_char_graphic(&(Screen.win),20,20,0x00ffffff,'P');
    put_char_graphic(&(Screen.win),30,20,0x00ffffff,'K');
    put_char_graphic(&(Screen.win),40,20,0x00ffffff,'n');
    put_char_graphic(&(Screen.win),50,20,0x00ffffff,' ');
    put_char_graphic(&(Screen.win),60,20,0x00ffffff,'(');
    put_char_graphic(&(Screen.win),70,20,0x00ffffff,'c');
    put_char_graphic(&(Screen.win),80,20,0x00ffffff,')');
    put_char_graphic(&(Screen.win),90,20,0x00ffffff,' ');
    put_char_graphic(&(Screen.win),100,20,0x00ffffff,'L');
    put_char_graphic(&(Screen.win),110,20,0x00ffffff,'i');
    put_char_graphic(&(Screen.win),120,20,0x00ffffff,'n');
    put_char_graphic(&(Screen.win),130,20,0x00ffffff,'C');
    put_char_graphic(&(Screen.win),140,20,0x00ffffff,'h');
    put_char_graphic(&(Screen.win),150,20,0x00ffffff,'e');
    put_char_graphic(&(Screen.win),160,20,0x00ffffff,'n');
    put_char_graphic(&(Screen.win),170,20,0x00ffffff,'j');
    put_char_graphic(&(Screen.win),180,20,0x00ffffff,'u');
    put_char_graphic(&(Screen.win),190,20,0x00ffffff,'n');

    thread_start("k_a",31,k_thread_a,0);
    thread_start("k_b",31,k_thread_b,0);

    while(1) /* 这个死循环不能少 */
    {
        intr_enable();
        io_hlt();
    }
    return; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}

void k_thread_a(void* arg)
{
    uint32_t i = 0x00000000;
    int sec;
    int time_y = ScrnY - 1 - 33;
    int offset = 3;
    get_time(&time);
    while(1)
    {
        enum intr_status old_status = intr_disable();
        sec = time.second;
        RectangleFill(&(Screen.win), 0x00848484,ScrnX - 212 + offset,ScrnY - 1 - 40 + offset,ScrnX - 10 + offset,ScrnY - 1 - 10 + offset);
        RectangleFill(&(Screen.win), 0x00ffffff,ScrnX - 212,ScrnY - 1 - 40,ScrnX - 10,ScrnY - 1 - 10);
        
        put_char_graphic(&(Screen.win), ScrnX - 202,time_y,i,(((time.year & 0x0000f000) >> 12) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 192,time_y,i,(((time.year & 0x00000f00) >> 8) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 182,time_y,i,(((time.year & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 172,time_y,i,(((time.year & 0x0000000f) >> 0) + '0'));

        put_char_graphic(&(Screen.win), ScrnX - 162,time_y,i,'/');
        put_char_graphic(&(Screen.win), ScrnX - 152,time_y,i,(((time.month & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 142,time_y,i,(((time.month & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 132,time_y,i,'/');

        put_char_graphic(&(Screen.win), ScrnX - 122,time_y,i,(((time.day & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 112,time_y,i,(((time.day & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 102,time_y,i,' ');
        put_char_graphic(&(Screen.win), ScrnX -  92,time_y,i,(((time.hour & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  82,time_y,i,(((time.hour & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  72,time_y,i,':');
        put_char_graphic(&(Screen.win), ScrnX -  62,time_y,i,(((time.minuet & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  52,time_y,i,(((time.minuet & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  42,time_y,i,':');
        put_char_graphic(&(Screen.win), ScrnX -  32,time_y,i,(((time.second & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  22,time_y,i,(((time.second & 0x0000000f) >> 0) + '0'));
        intr_set_status(old_status);
        while(time.second == sec) /* 时间发生变化时再刷新 */
        {
            get_time(&time);
        }
    }
}

void k_thread_b(void* arg)
{
    uint32_t i = 0x00000000;
    while(1)
    {
        RectangleFill(&(Screen.win),i,20,40,30,50);
        i++;
    }
}