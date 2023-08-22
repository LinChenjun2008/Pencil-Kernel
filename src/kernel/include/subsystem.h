#ifndef __SUBSYSTEM_H__
#define __SUBSYSTEM_H__

#include <interrupt/interrupt.h>
#include <syscall.h>
#include <thread/thread.h>

#define SUBSYS_CNT 2

#define SUBSYS_MM   0x80000001
#define SUBSYS_VIEW 0x80000002

extern pid_t subsystem_pid[SUBSYS_CNT + 1];

#define MM_FORK           0x80000001
#define MM_WAIT           0x80000002
#define MM_EXIT           0x80000003
#define MM_GET_A_PAGE     0x80000004 /* 获取一个页 */
#define MM_FREE_A_PAGE    0x80000005 /* 释放一个页 */
#define MM_READ_PROC_ADDR 0x80000006 /* 读取某个进程的内存空间 */

PUBLIC void start_subsystem();

#endif