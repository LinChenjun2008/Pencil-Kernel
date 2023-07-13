#ifndef __SUBSYSTEM_H__
#define __SUBSYSTEM_H__

#include <interrupt.h>
#include <syscall.h>
#include <thread.h>

#define SUBSYS_CNT 2

#define SUBSYS_MM   0x80000001
#define SUBSYS_VIEW 0x80000002

extern pid_t subsystem_pid[SUBSYS_CNT + 1];

PUBLIC void start_subsystem();

#endif