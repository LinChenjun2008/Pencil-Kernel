#include "init.h"
#include "graphic.h"
#include "interrupt.h"
#include "timer.h"

void init_all()
{
    init_idt();
    init_pit();
    init_screen();
    return;
}