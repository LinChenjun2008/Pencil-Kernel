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
    io_sti();
    init_all();
    put_str("init down!\n");
    while(1) /* 这个死循环不能少!!! */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
