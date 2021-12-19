#include "string.h"
#include "debug.h"
/* string.c */

/* memset
* 功能:将dst__开始的size字节置为value
* dst__ :要设置的地址
* value :设置成的值
* size  :要设置的大小(字节)
*/
void memset(void* dst__,uint8_t value,uint32_t size)
{
    ASSRET(dst != NULL)
    uint8_t* dst = (uint8_t*)dst__;
    int i;
    for(i = 0;i < size;i++)
    {
        (*dst) = value;
        dst++;
    }
    return;
}

/* memcpy
* 功能:将src__处的size字节复制到dst__
* dst__ :复制的目的地址
* src__ :原地址
* size  :要复制的字节数
*/
void memcpy(void* dst__,const void* src__,uint32_t size)
{
    ASSRET(dst__ != NULL && src__ != NULL)
    uint8_t* dst = (uint8_t*)dst__;
    uint8_t* src = (uint8_t*)src__;
    int i;
    for(i = 0;i < size;i++)
    {
        *dst = *src;
        dst++;
        src++;
    }
    return;
}

/* memcmp
* 功能:比较addr_a__和addr_b__处的size字节数据是否相等
* addr_a__ :地址a
* addr_b__ :地址b
* size     :要比较的字节数
* 返回值:
*   < 0 :addr_a__处 < addr_b__处
*   > 0 :addr_a__处 > addr_b__处
*   = 0 :addr_a__处 = addr_b__处
*/
int32_t memcmp(const void* addr_a__,void* addr_b__,uint32_t size)
{
    ASSRET(addr_a__ != NULL & addr_b__ != NULL)
    uint8_t* addr_a = (uint8_t*)addr_a__;
    uint8_t* addr_b = (uint8_t*)addr_b__;
    int i;
    for(i = 0;i < size;i++)
    {
        if(*addr_a != *addr_b)
        {
            break;
        }
    }
    return (*addr_a - *addr_b);
}

char* strcpy(char* dst__,const char* src__);
uint32_t strlen(const char* str);
int32_t strcmp(const char* str_a__,const char* str_b__);
char* strchr(const char* str,const uint8_t ch);
char* strrchr(const char* str,const uint8_t ch);
char* strcat(char* dst__,const char* src__);
uint32_t strchrs(const char* name,uint8_t ch);
