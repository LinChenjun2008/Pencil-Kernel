#include <bitmap.h>
#include <debug.h>
#include <string.h>

/**
 * @brief 初始化位图
 * @param btmp 要初始化的位图指针
*/
void bitmap_init(struct Bitmap* btmp)
{
    memset(btmp->map,0,btmp->btmp_bytes_len);
    return;
}

/**
 * @brief 判断位图中bit_idx是否为1
 * @param btmp        :位图指针
 * @param bit_index   :bit位下标
 * @return true: 为1 false: 为0
*/
BOOL bitmap_scan_test(struct Bitmap* btmp,UINTN bit_index)
{
    UINTN byte_index = bit_index / 8;
    UINTN bit_odd = bit_index % 8;
    return (btmp->map[byte_index] & (BITMAP_MASK << bit_odd));
}

/**
 * @brief 在bitmap中分配cnt个位
 * @param btmp       :bitmap指针
 * @param cnt        :要分配的位数
 * @retval 返回值为位的下标. 返回-1为分配失败
*/
signed int bitmap_alloc(struct Bitmap* btmp,UINTN cnt)
{
    UINTN byte_index = 0;
    /* 寻找第一个空的bit所在位 */
    while((btmp->map[byte_index] == 0xff) && (byte_index < (btmp->btmp_bytes_len)))
    {
        byte_index++;
    }
    ASSERT(byte_index < (btmp->btmp_bytes_len));
    /* bitmap已满,找不到空位 */
    if(byte_index == (btmp->btmp_bytes_len))
    {
        return -1;/* 分配失败 */
    }
    /* 发现有空位,*/
    UINTN bit_index = 0;
    /* 在刚才发现空位的btmp->map[byte_index]中寻找空闲位的索引 */
    while(((byte)(BITMAP_MASK << bit_index)) & btmp->map[byte_index])
    {
        bit_index++;
    }
    signed int bit_index_start = byte_index * 8 + bit_index;/* 空闲位在整个bitmap中的下标 */
    if(cnt == 1)/* 只分配一个位, 那就是bit_index_start位 */
    {
        return bit_index_start;
    }
    UINTN bit_rem = (btmp->btmp_bytes_len * 8 - bit_index_start); /* 剩下的位 */
    UINTN next_bit_index = bit_index_start + 1;
    UINTN count = 1;/* 找到的空闲位的个数,上面已经找到一个了 */
    
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

/**
 * @brief 将bitmap的bit_index位设为value
 * @param btmp bitmap指针
 * @param bit_index 要设置的位的下标
 * @param value 设置值
*/
void bitmap_set(struct Bitmap* btmp,UINTN bit_index,byte value)
{
    ASSERT(value == 0 || value == 1);
    UINTN byte_index = bit_index / 8;
    UINTN bit_odd = bit_index % 8;
    switch(value)
    {
        case 0:
            btmp->map[byte_index] &= (~(BITMAP_MASK << bit_odd));
            break;
        case 1:
            btmp->map[byte_index] |= (BITMAP_MASK << bit_odd);
            break;
        default:
            ASSERT(value == 1 || value == 0);
            break;
    }
    return;
}
