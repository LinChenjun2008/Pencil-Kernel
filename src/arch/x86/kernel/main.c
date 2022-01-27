#include "global.h"
#include "init.h"
#include "io.h"
#include "print.h"

int main()
{
    int i;
    for(i = 0; i < COL;i++)
    {
        put_string_xy("-",20,i,0x7,0x0);
    }
    put_string_xy("Pencil-Kernel (PKn) version 0.0.0 test",21,0,0x7,0x0);
    io_sti();
    init_all();
    put_string_xy("init down!",8,0,0x7,0x0);
    while(1)
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
