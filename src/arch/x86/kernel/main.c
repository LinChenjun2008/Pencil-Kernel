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

void k_thread_a(void* arg)
{
    uint32_t i = 0x00000000;
    while(1)
    {
        get_time(&time);
        RectangleFill(&(Screen.win), 0x00c6c6c6,ScrnX - 202,ScrnY - 30,ScrnX - 12,ScrnY - 14);
        put_char_graphic(&(Screen.win), ScrnX - 202,ScrnY - 30,i,(((time.year & 0x0000f000) >> 12) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 192,ScrnY - 30,i,(((time.year & 0x00000f00) >> 8) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 182,ScrnY - 30,i,(((time.year & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 172,ScrnY - 30,i,(((time.year & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 162,ScrnY - 30,i,' ');
        put_char_graphic(&(Screen.win), ScrnX - 152,ScrnY - 30,i,(((time.month & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 142,ScrnY - 30,i,(((time.month & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 132,ScrnY - 30,i,' ');
        put_char_graphic(&(Screen.win), ScrnX - 122,ScrnY - 30,i,(((time.day & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 112,ScrnY - 30,i,(((time.day & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX - 102,ScrnY - 30,i,' ');
        put_char_graphic(&(Screen.win), ScrnX -  92,ScrnY - 30,i,(((time.hour & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  82,ScrnY - 30,i,(((time.hour & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  72,ScrnY - 30,i,':');
        put_char_graphic(&(Screen.win), ScrnX -  62,ScrnY - 30,i,(((time.minuet & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  52,ScrnY - 30,i,(((time.minuet & 0x0000000f) >> 0) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  42,ScrnY - 30,i,':');
        put_char_graphic(&(Screen.win), ScrnX -  32,ScrnY - 30,i,(((time.second & 0x000000f0) >> 4) + '0'));
        put_char_graphic(&(Screen.win), ScrnX -  22,ScrnY - 30,i,(((time.second & 0x0000000f) >> 0) + '0'));
    }
}

int main()
{
    init_all();
    intr_enable(); /* 开中断 */

    put_char('P');
    put_char('e');
    put_char('n');
    put_char('c');
    put_char('i');
    put_char('l');
    put_char('-');
    put_char('K');
    put_char('e');
    put_char('r');
    put_char('n');
    put_char('e');
    put_char('l');
    put_char(' ');
    put_char('(');
    put_char('P');
    put_char('K');
    put_char('n');
    put_char(')');
    put_char('\n');

    //put_str("hello word!\n"); //显示不出来,why?
    
    //put_str("init down!\n");
    put_str_graphic(&(Screen.win),16,16,0x00ffffff,"hello world!");
    put_char_graphic(&(Screen.win),20,20,0x00ffffff,'P');
    put_char_graphic(&(Screen.win),30,20,0x00ffffff,'e');
    put_char_graphic(&(Screen.win),40,20,0x00ffffff,'n');
    put_char_graphic(&(Screen.win),50,20,0x00ffffff,'c');
    put_char_graphic(&(Screen.win),60,20,0x00ffffff,'i');
    put_char_graphic(&(Screen.win),70,20,0x00ffffff,'l');
    put_char_graphic(&(Screen.win),80,20,0x00ffffff,'-');
    put_char_graphic(&(Screen.win),90,20,0x00ffffff,'K');
    put_char_graphic(&(Screen.win),100,20,0x00ffffff,'e');
    put_char_graphic(&(Screen.win),110,20,0x00ffffff,'r');
    put_char_graphic(&(Screen.win),120,20,0x00ffffff,'n');
    put_char_graphic(&(Screen.win),130,20,0x00ffffff,'e');
    put_char_graphic(&(Screen.win),140,20,0x00ffffff,'l');
    put_char_graphic(&(Screen.win),150,20,0x00ffffff,' ');

    thread_start("k_a",31,k_thread_a,0);

    while(1) /* 这个死循环不能少 */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
