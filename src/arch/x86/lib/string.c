#include "string.h"
#include "debug.h"
#include "global.h"
#include "stdint.h"
/* string.c */

/* memset
* 功能:将dst__开始的size字节置为value
* dst__ :要设置的地址
* value :设置成的值
* size  :要设置的大小(字节)
*/
void memset(void* dst__,uint8_t value,uint32_t size)
{
    ASSRET(dst__ != NULL)
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
* 功能:比较p1__和p2__处的size字节数据是否相等
* p1__ :地址1
* p2__ :地址2
* size     :要比较的字节数
* 返回值:
*   < 0 :p1__处 < p2__处
*   > 0 :p1__处 > p2__处
*   = 0 :p1__处 = p2__处
*/
int32_t memcmp(const void* p1__,void* p2__,uint32_t size)
{
    ASSRET(p1__ != NULL && p2__ != NULL)
    uint8_t* p1 = (uint8_t*)p1__;
    uint8_t* p2 = (uint8_t*)p2__;
    int i;
    for(i = 0;i < size;i++)
    {
        if(*p1 != *p2)
        {
            break;
        }
    }
    return (*p1 < *p2 ? -1 : *p1 > *p2);
}

char* strcpy(char* dst__,const char* src__);
uint32_t strlen(const char* str);
int32_t strcmp(const char* str_a__,const char* str_b__);
char* strchr(const char* str,const uint8_t ch);
char* strrchr(const char* str,const uint8_t ch);
char* strcat(char* dst__,const char* src__);
uint32_t strchrs(const char* name,uint8_t ch);
