/* debug.h
*/

#ifndef __DEBUG_H__
#define __DEBUG_H__

void panic_spin(const char* file,int line,const char* func,const char* condition);

#define PANIC(...) panic_spin(__FILE__,__LINE__,__func__,__VA_ARGS__)
#define ASSERT(CONDITION)          \
            if(CONDITION)          \
            {                      \
                                   \
            }                      \
            else                   \
            {                      \
                PANIC(#CONDITION); \
            }
#ifdef NDEBUG
    #undef ASSERT
    #define ASSERT(CONDITION) ((void)0)
#endif /* NDEBUG */

#endif /* __DEBUG_H__ */
