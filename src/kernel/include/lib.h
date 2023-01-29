#ifndef __LIB_H__
#define __LIB_H__

#include <stdint.h>

/**
 * @brief 求绝对值
 * @param digit 求这个数的绝对值
*/
uint64_t abs(int64_t digits);

/** itoa
 * @brief 将a转为base进制的字符串写入str地址
 * @param a       要转换的数字(有符号)
 * @param str     转换后的字符串的存储地址
 * @param base    进制,最高支持36进制
*/
void itoa(int64_t a,char* str,int base);

/** utoa
 * @brief 将a转为base进制的字符串写入str地址
 * @param a       要转换的数字(无符号)
 * @param str     转换后的字符串的存储地址
 * @param base    进制,最高支持36进制
*/
void utoa(uint64_t a,char* str,int base);

#endif