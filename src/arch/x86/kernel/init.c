#include "init.h"
#include "interrupt.h"

void init_all()
{
    init_idt();
    return;
}