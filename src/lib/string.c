/* string.c */

/* memset()
* 功能:将dst__开始的size字节置为value
* dst__ :要设置的地址
* value :设置成的值
* size  :要设置的大小(字节)
*/
void memset(void* dst__,uint8_t value,uint32_t size);
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
void memcpy(void* dst__,const void* src__,uint32_t size);
int32_t memcmp(const void* str_a__,void* str_b__,uint32_t size);

char* strcpy(char* dst__,const char* src__);
uint32_t strlen(const char* str);
int32_t strcmp(const char* str_a__,const char* str_b__);
char* strchr(const char* str,const uint8_t ch);
char* strrchr(const char* str,const uint8_t ch);
char* strcat(char* dst__,const char* src__);
uint32_t strchrs(const char* name,uint8_t ch);
