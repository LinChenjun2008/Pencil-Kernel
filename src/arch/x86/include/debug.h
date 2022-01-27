/* debug.h
*/

#ifndef __DEBUG_H__
#define __DEBUG_H__

void panic_spin(const char* file,int line,const char* func,const char* condition);

#ifndef NDEBUG
    #define PANIC(...) panic_spin(__FILE__,__LINE__,__func__,__VA_ARGS__)
    #define ASSRET(CONDITION)          \
                if(CONDITION)          \
                {                      \
                                       \
                }                      \
                else                   \
                {                      \
                    PANIC(#CONDITION); \
                }
#else
    #define ASSRET(CONDITION) ((void)0)
#endif /* NDEBUG */
#endif /* __DEBUG_H__ */
