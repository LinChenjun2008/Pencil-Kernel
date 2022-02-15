#include "init.h"
#include "graphic.h"
#include "interrupt.h"
#include "memory.h"
#include "thread.h"
#include "timer.h"

void init_all()
{
    init_idt();
    init_pit();
    init_memory();
    init_screen(&Screen);
    return;
}