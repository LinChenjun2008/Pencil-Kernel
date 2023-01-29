#ifndef __STRING_H__
#define __STRING_H__

void memset(void* dst__,uint8_t value,uint32_t size);
void memcpy(void* dst__,const void* src__,uint32_t size);
int32_t memcmp(const void* p1__,void* p2__,uint32_t size);
char* strcpy(char* dst__,const char* src__);
uint32_t strlen(const char* str);
int32_t strcmp(const char* str1__,const char* str2__);

/*
char* strchr(const char* str,const uint8_t ch);
char* strrchr(const char* str,const uint8_t ch);
char* strcat(char* dst__,const char* src__);
uint32_t strchrs(const char* name,uint8_t ch);
*/
#endif