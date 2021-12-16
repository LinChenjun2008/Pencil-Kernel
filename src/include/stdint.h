#ifndef __STDINT_H_
#define __STDINT_H_

#include "config.h"

//signed int
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed int int32_t;

#if BITS==32
    typedef signed long long int inu64_t;
#endif /* BITS == 32 */

#if BITS==64
    typedef signed long long int int64_t;
#endif /* BITS == 64 */

//unsigned int
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

#if BITES==32
    typedef unsigned long long int uint64_t;
#endif /* BITS==32 */

#if BITS==64
    typedef unsigned long int uint64_t;
#endif /* BITS==64 */

#endif /* __STDINT_H_ */
