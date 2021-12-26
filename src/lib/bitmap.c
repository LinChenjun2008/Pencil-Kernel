#include "bitmap.h"
#include "stdint.h"
#include "global.h"

/* bitmap_init
* 初始化btmp
* btmp :要初始化的bitmap指针
*/
void bitmap_init(struct bitmap* btmp)
{
    memset(btmp->map,0,btmp->btmp_bytes_len);
    return;
}

/* */
bool bitmap_scan_test(struct bitmap* btmp,uint32_t bit_idx);
int bitmap_alloc(struct bitmap* btmp,uint32_t cnt);
void bitmap_set(struct bitmap* btmp,uint32_t bit_idx,uint8_t value);
