#ifndef _TIME_H_
#define _TIME_H_

#include <std/stdint.h>
#include <kernel/global.h>

typedef struct
{
    uint32_t second; //00
    uint32_t minuet; //02
    uint32_t hour;   //04
    uint32_t day;    //07
    uint32_t month;  //08
    uint32_t year;   //09 + 32
} time_t;

PUBLIC void get_time(time_t* time);

#endif