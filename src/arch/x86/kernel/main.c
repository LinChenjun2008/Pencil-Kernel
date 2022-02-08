#include "debug.h"
#include "global.h"
#include "init.h"
#include "io.h"
#include "print.h"

int main()
{
    int i;
    put_char('\n');
    put_str("Pencil-Kernel (PKn) version 0.0.0 test\n");
    init_all();
    put_str("init down!\n");
    int* addr = (int*)0xfe000000;
    for(i = 0;i < (ScrnX)*(ScrnY);i++)
    {
        *((char*)addr + 0) = (char)0x84; /* B */
        *((char*)addr + 1) = (char)0x84; /* G */
        *((char*)addr + 2) = (char)0x00; /* R */
        *((char*)addr + 3) = (char)0x00;
        addr+=1;
    }
    //intr_enable(); /* 开中断 */
    while(1) /* 这个死循环不能少 */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
