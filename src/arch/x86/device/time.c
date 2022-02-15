#include "time.h"
#include "interrupt.h"
#include "io.h"

#define CMOS_READ(ADDR) ({ \
    io_out8(0x70,0x80 | ADDR); \
    io_in8(0x71); \
})

void get_time(struct TIME* time)
{
    enum intr_status status = intr_get_status();
    do
    {
        time->year = CMOS_READ(0x09) + CMOS_READ(0x32) * 0x100;
        time->month = CMOS_READ(0x08);
        time->day = CMOS_READ(0x07);
        time->hour = CMOS_READ(0x04);
        time->minuet = CMOS_READ(0x02);
        time->second = CMOS_READ(0x00);
    }while(time->second != CMOS_READ(0x00));
    io_out8(0x70,0x00);
    intr_set_status(status);
    return;
}