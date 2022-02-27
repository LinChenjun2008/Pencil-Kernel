/* type.h 是对stdint.h的扩充 */
#ifndef __TYPE_H__
#define __TYPE_H__

#include "stdint.h"

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

/* message参考了MINIX */
struct msg1
{
    uint32_t m1i1;
    uint32_t m1i2;
    uint32_t m1i3;
    uint32_t m1i4;
};

struct msg2
{
    void* m2p1;
    void* m2p2;
    void* m2p3;
    void* m2p3;
};

struct msg3
{
    uint32_t m3i1;
    uint32_t m3i2;
    uint32_t m3i3;
    uint32_t m3i4;
    uint64_t m3l1;
    uint64_t m3l2;
    void* m3p1;
    void* m3p2;
};

typedef struct
{
    uint32_t source;
    uint32_t type;
    union
    {
        struct msg1;
        struct msg2;
        struct msg3;
    }msg;
}MESSAGE;



#endif /* __TYPE_H__ */
