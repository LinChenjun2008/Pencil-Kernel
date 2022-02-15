#ifndef _TIME_H_
#define _TIME_H_

#include "stdint.h"

struct TIME
{
    uint32_t second;//00
    uint32_t minuet;//02
    uint32_t hour;//04
    uint32_t day;//07
    uint32_t month;//08
    uint32_t year;//09 + 32
};

#endif
