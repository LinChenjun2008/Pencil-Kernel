#include "init.h"
#include "interrupt.h"
#include "timer.h"

void init_all()
{
    init_idt();
    init_pit();
    return;
}