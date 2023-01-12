#include <stdint.h>

/** itoa
 * @brief 将a转为base进制的字符串写入str地址
 * @param a       要转换的数字(有符号)
 * @param str     转换后的字符串的存储地址
 * @param base    进制,最高支持36进制
*/
void itoa(int64_t a,char* str,int base)
{
    static char digits[37] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int i; /* 作为下标来索引 */
    int isNegative; /* 是否是负的？ */
    isNegative = a;
    if(a < 0) /* 如果是负数 */
    {
        a = -a; /* 先转换为正数 */
    }
    i = 0;
    /* 转换为字符串,不过是倒过来的 */
    do
    {
        str[i] = digits[a % base];
        i++;
        a = a / base;
    }while(a > 0);
    /* 是负数,就加上负号 */
    if(isNegative < 0)
    {
        str[i] = '-';
        i++;
    }
    str[i] = '\0'; /* 加上字符串结尾 */
    char* p = str;
    char* q = str;
    char tmp;
    while(*q != '\0')
    {
        q++;
    } 
    q--;
    /* 把字符串倒过来 */
    while(q > p)
    {
        tmp = *p;
        *p = *q;
        p++;
        *q = tmp;
        q--;
    }
    return;
}

/** utoa
 * @brief 将a转为base进制的字符串写入str地址
 * @param a       要转换的数字(无符号)
 * @param str     转换后的字符串的存储地址
 * @param base    进制,最高支持36进制
*/
void utoa(uint64_t a,char* str,int base)
{
    static char digits[37] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int i; /* 作为下标来索引 */
    i = 0;
    /* 转换为字符串,不过是倒过来的 */
    do
    {
        str[i] = digits[a % base];
        i++;
        a = a / base;
    }while(a > 0);
    str[i] = '\0'; /* 加上字符串结尾 */
    char* p = str;
    char* q = str;
    char tmp;
    while(*q != '\0')
    {
        q++;
    } 
    q--;
    /* 把字符串倒过来 */
    while(q > p)
    {
        tmp = *p;
        *p = *q;
        p++;
        *q = tmp;
        q--;
    }
    return;
}