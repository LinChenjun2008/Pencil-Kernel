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

/* bitmap_scan_test
* 判断bitmap中bit_idx是否为1
* btmp      :bitmap指针
* bit_idx   :bit位下标
* 返回 true  :为1
* 返回 false :为0
*/
bool bitmap_scan_test(struct bitmap* btmp,uint32_t bit_idx)
{
    uint32_t index = bit_idx / 8;
    uint32_t odd = bit_idx % 8;
    return (btmp->map[index] & (BITMAP_MAST << odd));
}

/* bitmap_alloc
* 在bitmap中分配cnt个位
* btmp :bitmap指针
* cnt  :要分配的位数
* 返回 -1:分配失败
* 返回值!= -1:返回值为位的下标
*/
int bitmap_alloc(struct bitmap* btmp,uint32_t cnt)
{
    uint32_t index = 0;
    /* 寻找第一个空的bit所在位 */
    while((btmp->map[index] == 0xff) && (index < (bitmp->btmp_bytes_len)))
    {
        index++;
    }
    ASSRET(index < (btmp->btmp_bytes_len))
    /* bitmap已满,找不到空位 */
    if(index == (btmp->btmp_bytes_len))
    {
        return -1;/* 分配失败 */
    }
    /* 发现有空位,*/
}

void bitmap_set(struct bitmap* btmp,uint32_t bit_idx,uint8_t value);
