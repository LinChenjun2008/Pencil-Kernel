#include "debug.h"
#include "global.h"
#include "graphic.h"
#include "init.h"
#include "io.h"
#include "print.h"

int main()
{
    set_cursor(ScrnX * 8);
    //put_char('\n');
    put_str("Pencil-Kernel (PKn) version 0.0.0 test\n");
    init_all();
    put_str("init down!\n");
    //intr_enable(); /* 开中断 */
    while(1) /* 这个死循环不能少 */
    {
        ;
    }
    return 0; /* 这句return应该永远不会执行,放在这里只是摆设用的 */
}
