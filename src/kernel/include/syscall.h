#ifndef __SYSCALL_H__
#define __SYSCALL_H__

#include <thread.h>

#define SYSCALL_INTR 0x40

typedef uint32_t syscall_status_t;
typedef uint32_t syscall_function_t;

#define NR_SEND         0x80000001 /* 发送消息 */
#define NR_RECEIVE      0x80000002 /* 接收消息 */
#define NR_BOTH         0x80000003 /* 发送消息,等待对方回复 */

#define SYSCALL_SUCCESS       0x80000000                   /* 系统调用执行成功 */
#define SYSCALL_ERROR         0xc0000000
#define SYSCALL_NO_SYSCALL    (SYSCALL_ERROR | 0x00000001) /* 不是系统调用 */
#define SYSCALL_DEADLOCK      (SYSCALL_ERROR | 0x00000002) /* 会死锁 */
#define SYSCALL_NO_DST        (SYSCALL_ERROR | 0x00000003) /* 找不到发送目标 */
#define SYSCALL_NO_SRC        (SYSCALL_ERROR | 0x00000004) /* 找不到接收来源 */

#define IS_SYSCALL_ERROR(STATUS) (STATUS != SYSCALL_SUCCESS)

#define NO_TASK 0x80000000
#define ANY     0xc0000000

PUBLIC void init_syscall();
PUBLIC syscall_status_t send_recv(syscall_function_t function,pid_t src_dst,message_t* msg);

#endif