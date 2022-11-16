/* string.c */

/** memset

    将dst__开始的size字节置为value

    @param dst__ :要设置的地址
    @param value :设置成的值
    @param size  :要设置的大小(字节)
**/
void memset(void* dst__,uint8_t value,uint32_t size)
{
    ASSERT(dst__ != NULL);
    uint8_t* dst = (uint8_t*)dst__;
    uint32_t i;
    for(i = 0;i < size;i++)
    {
        (*dst) = value;
        dst++;
    }
    return;
}

/** memcpy

    将src__处的size字节复制到dst__

    @param dst__ :复制的目的地址
    @param src__ :原地址
    @param size  :要复制的字节数
**/
void memcpy(void* dst__,const void* src__,uint32_t size)
{
    ASSERT(dst__ != NULL && src__ != NULL);
    uint8_t* dst = (uint8_t*)dst__;
    uint8_t* src = (uint8_t*)src__;
    uint32_t i;
    for(i = 0;i < size;i++)
    {
        *dst = *src;
        dst++;
        src++;
    }
    return;
}

/** memcmp

    比较p1__和p2__处的size字节数据是否相等

    @param p1__ :地址1
    @param p2__ :地址2
    @param size     :要比较的字节数

    @retval -1  p1__  < p2__
    @retval  0  p1__ == p2__
    @retval  1  p1__  > p2__

*/
int32_t memcmp(const void* p1__,void* p2__,uint32_t size)
{
    ASSERT(p1__ != NULL && p2__ != NULL);
    uint8_t* p1 = (uint8_t*)p1__;
    uint8_t* p2 = (uint8_t*)p2__;
    uint32_t i;
    for(i = 0;i < size;i++)
    {
        if(*p1 != *p2)
        {
            break;
        }
    }
    return (*p1 < *p2 ? -1 : *p1 > *p2);
}

char* strcpy(char* dst__,const char* src__)
{
/* 将字符串从src_复制到dst_ */
   char* r = dst__;		       // 用来返回目的字符串起始地址
   while((*dst__++ = *src__++));
   return r;
}

uint32_t strlen(const char* str)
{
    int len = 0;
    while(*(str++))
    {
        len++;
    }
    return len;
}

int32_t strcmp(const char* str1__,const char* str2__)
{
    ASSERT(str1__ != NULL && str2__ != NULL);
    while(*str1__ != 0 && *str1__ == *str2__)
    {
        str1__++;
        str2__++;
    }
    return (*str1__ < *str2__ ? -1 : *str1__ > *str2__);
}

/*
char* strchr(const char* str,const uint8_t ch);
char* strrchr(const char* str,const uint8_t ch);
char* strcat(char* dst__,const char* src__);
uint32_t strchrs(const char* name,uint8_t ch);
*/
