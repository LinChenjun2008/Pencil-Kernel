/* type.h 是对stdint.h的扩充 */
#ifndef __TYPE_H__
#define __TYPE_H__

#include "stdint.h"

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
}

#endif /* __TYPE_H__ */
