/* bitmap.h
*/

#ifndef __BITMAP_H_
#define __BITMAP_H_

#include "global.h"
#include "stdint.h"

#define BITMAP_MASK 0x01

struct bitmap
{
    uint32_t bitmap_bytes_len;
    uint8_t* map;
};

void bitmap_init(struct bitmap* btmp);
bool bitmap_scan_test(struct bitmap* btmp,uint32_t bit_index);
signed int bitmap_alloc(struct bitmap* btmp,uint32_t cnt);
void bitmap_set(struct bitmap* btmp,uint32_t bit_index,uint8_t value);

#endif /* __BITMAP_H_ */
