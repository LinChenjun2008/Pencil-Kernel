#include "debug.h"
#include "global.h"
#include "graphic.h"
#include "init.h"
#include "io.h"
#include "memory.h"
#include "print.h"
#include "string.h"

void logo();
int main()
{
    //logo();
    char buf[100];
    set_cursor(ScrnX * 8);
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
    put_char('b');
    put_char('u');
    put_char('i');
    put_char('l');
    put_char('d');
    put_char(' ');
    put_char('0');
    put_char('.');
    put_char('0');
    put_char('.');
    put_char('0');
    put_char(' ');
    put_char('t');
    put_char('\n');

    // put_char('M');
    // put_char('e');
    // put_char('m');
    // put_char('o');
    // put_char('r');
    // put_char('y');
    // put_char(':');
    // put_char(' ');
    // itoa(TotalMem_l,buf,10);
    // put_char(buf[0]);
    // put_char(buf[1]);
    // put_char(buf[2]);
    // put_char(buf[3]);
    // put_char(buf[4]);
    // put_char(buf[5]);
    // put_char(buf[6]);
    //put_str("hello word!\n"); //显示不出来,why?
    init_all();
    //put_str("init down!\n");
    // put_str_graphic(&Screen,16,16,0x00ffffff,"hello world!");
    // put_char_graphic(&Screen,20,20 ,0x00000000,'A');
    // intr_enable(); /* 开中断 */
    while(1) /* 这个死循环不能少 */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
