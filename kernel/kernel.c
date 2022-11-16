/**
* 正常情况下应该分开编译
* 但由于编译过程中的一些问题,
* 本系统使用将所有源代码include到一起在编译的方法,
* 相当于所有代码写在一个文件里
* 那么干脆所有全局变量就定义在这里
**/

#include <common.h>
#include <global.h>
#include <stdint.h>
#include <graphic.h>
#include <stdarg.h>

struct BootInfo gBI;
#define ASSERT(X) ((void)0)

typedef uint64_t ptr_t;

int sprintf(char* buf,const char* fmt,...);

const char VERSION[] = "Pencil-Kernel(PKn) 0.1.1 ";

#include "main.c" /* 必须在最前面 */
#include "graphic/graphic.c"
#include "lib/lib.c"
#include "libc/string.c"
#include "libc/stdio.c"