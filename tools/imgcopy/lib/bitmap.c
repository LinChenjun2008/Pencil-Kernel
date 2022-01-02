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
* btmp        :bitmap指针
* bit_index   :bit位下标
* 返回 true    :为1
* 返回 false   :为0
*/
bool bitmap_scan_test(struct bitmap* btmp,uint32_t bit_index)
{
    uint32_t byte_index = bit_index / 8;
    uint32_t bit_odd = bit_index % 8;
    return (btmp->map[byte_index] & (BITMAP_MAST << bit_odd));
}

/* bitmap_alloc
* 在bitmap中分配cnt个位
* btmp       :bitmap指针
* cnt        :要分配的位数
* 返回 -1     :分配失败
* 返回值!= -1 :返回值为位的下标
*/
signed int bitmap_alloc(struct bitmap* btmp,uint32_t cnt)
{
    uint32_t byte_index = 0;
    /* 寻找第一个空的bit所在位 */
    while((btmp->map[byte_index] == 0xff) && (byte_index < (bitmp->btmp_bytes_len)))
    {
        byte_index++;
    }
    ASSRET(byte_index < (btmp->btmp_bytes_len))
    /* bitmap已满,找不到空位 */
    if(byte_index == (btmp->btmp_bytes_len))
    {
        return -1;/* 分配失败 */
    }
    /* 发现有空位,*/
    uint32_t bit_index = 0;
    /* 在刚才发现空位的btmp->map[byte_index]中寻找空闲位的索引 */
    while(((uint8_t)(BITMAP_MASK << bit_index)) & btmp->map[byte_index])
    {
        bit_index++;
    }
    signed int bit_index_start = byte_index * 8 + bit_index;/* 空闲位在整个bitmap中的下标 */
    if(cnt == 1)/* 只分配一个位, 那就是bit_index_start位 */
    {
        return bit_index_start;
    }
    uint32_t bit_rem = (btmp->btmp_bytes_len * 8 - bit_index_start); /* 剩下的位 */
    uint32_t next_bit_index = bit_index_start + 1;
    uint32_t count = 1;/* 找到的空闲位的个数,上面已经找到一个了 */
    
    bit_index_start = -1;/* 找不到时直接返回-1 */
    while(bit_rem > 0)
    {
        if(!(bitmap_scan_test(btmp,next_bit_index)))
        {
            /* 下一个bit位是0,那就又找到一个空bit位 */
            count++;
        }
        else
        {
            /* next_bit_index位不是0,重新找空闲位 */
            count = 0;
        }
        if(count == cnt)
        {
            /* 找到了连续cnt个空闲位 */
            bit_index_start = next_bit_index - cnt + 1;/* 空闲位的起始下标 */
            break;/* 寻找结束,退出循环 */
        }
        bit_rem--;
        next_bit_index++;
    }
    return bit_index_start;
}

/* bitmap_set
* 将bitmap的bit_index位设为value
* btmp      :bitmap指针
* bit_index :要设置的位的下标
* value     :设置值
*/
void bitmap_set(struct bitmap* btmp,uint32_t bit_index,uint32_t value)
{
    ASSRET(value == 0 || value == 1)
    uint32_t byte_index = bit_index / 8;
    uint32_t bit_odd = bit_index % 8;
    switch(value)
    {
        case 0:
            btmp->map[byte_index] &= (~(BITMAP_MASK << bit_odd));
            break;
        case 1:
            btmp->map[byte_index] |= (BITMAP_MASK << bit_odd);
            break;
    }
    return;
}
