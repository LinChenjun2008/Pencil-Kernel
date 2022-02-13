#include "debug.h"
#include "global.h"
#include "graphic.h"
#include "init.h"
#include "io.h"
#include "memory.h"
#include "print.h"
#include "string.h"
#include "thread.h"

void k_thread_a(void* arg)
{
    //char a = *(char*)arg;
    uint32_t i = 0;
    while(1)
    {
        put_char('B');
        put_char(' ');
        put_char_graphic(&(Screen.win),50,50,i,'P');
        i++;
    }
}

int main()
{
    char buf[100] = {"Pencil-Kernel (PKn)"};
    set_cursor(ScrnX * 8);
    int i;
    for(i = 0;i < 100;i++)
    {
        put_char(buf[i]);
    }
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
    init_all();
    //put_str("hello word!\n"); //显示不出来,why?
    
    //put_str("init down!\n");
    //put_str_graphic(&Screen,16,16,0x00ffffff,"hello world!");
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
    //put_str_graphic(&(Screen.win),160,20,0x00ffffff,"123456"); //显示不出来!!!
    page_alloc(Kernel_pool,10);
    thread_start("k_a",31,k_thread_a,0);
    // intr_enable(); /* 开中断 */
    while(1) /* 这个死循环不能少 */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
