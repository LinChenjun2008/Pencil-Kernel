#ifndef __BITMAP_H_
#define __BITMAP_H_

#include <global.h>
#include <stdint.h>

#define BITMAP_MASK 0x01

struct Bitmap
{
    UINTN btmp_bytes_len; // 位图以字节为单位的长度
    byte* map;            // 位图
};

/**
 * @brief 初始化位图
 * @param btmp 要初始化的位图指针
*/
void bitmap_init(struct Bitmap* btmp);

/**
 * @brief 判断位图中bit_idx是否为1
 * @param btmp        :位图指针
 * @param bit_index   :bit位下标
 * @return true: 为1 false: 为0
*/
BOOL bitmap_scan_test(struct Bitmap* btmp,UINTN bit_index);

/**
 * @brief 在bitmap中分配cnt个位
 * @param btmp       :bitmap指针
 * @param cnt        :要分配的位数
 * @retval 返回值为位的下标. 返回-1为分配失败
*/
signed int bitmap_alloc(struct Bitmap* btmp,UINTN cnt);

/**
 * @brief 将bitmap的bit_index位设为value
 * @param btmp bitmap指针
 * @param bit_index 要设置的位的下标
 * @param value 设置值
*/
void bitmap_set(struct Bitmap* btmp,UINTN bit_index,byte value);

//8388608
#endif /* __BITMAP_H_ */
