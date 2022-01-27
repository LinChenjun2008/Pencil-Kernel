#include "global.h"
#include "io.h"
#include "print.h"

int main()
{
    char* vram = 0xc0000000 + 0xb8000;/* 文本模式的显存地址 */
    int i;
    for(i = 0; i < COL;i++)
    {
        put_string(vram,"-",20,i,0x7,0x0);
    }
    put_string(vram,"Pencil-Kernel (PKn) version 0.0.0 test",21,0,0x7,0x0);
    put_string(vram,"Hello,world!",8,0,0x7,0x0);
    init_all();
    io_sti();
    while(1)
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
