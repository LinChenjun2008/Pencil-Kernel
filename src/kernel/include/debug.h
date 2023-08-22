#ifndef __DEBUG_H__
#define __DEBUG_H__

void panic_spin(const char* file,const char* base_file,int line,const char* func,
                const char* condition);

#ifndef __NO_DEBUG__

#define PANIC(...) \
    panic_spin(__FILE__,__BASE_FILE__,__LINE__,__func__,__VA_ARGS__)

#define ASSERT(CONDITION)          \
            if (CONDITION)         \
            {                      \
                                   \
            }                      \
            else                   \
            {                      \
                PANIC(#CONDITION); \
            }

#else
    #define ASSERT(CONDITION) ((void)0)
#endif

#endif