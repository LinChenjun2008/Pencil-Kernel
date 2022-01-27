#include "global.h"
#include "print.h"

int main()
{
    char* vram = 0xc0000000 + 0xb8000;/* 文本模式的显存地址 */
    put_string(vram,"Pencil-Kernel (PKn)",8,0,0x7,0x0);
    while(1)
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
