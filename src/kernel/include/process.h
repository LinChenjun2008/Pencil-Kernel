#ifndef __PROCESS_H__
#define __PROCESS_H__

#include <global.h>
#include <thread.h>

#define USER_STACK_VADDR (0x00007fffffffffff - PCB_SIZE)
#define USER_VADDR_START 0x804800
extern void intr_exit(void);

void process_execute(void* process_name,char* name);
void process_activate(struct task_struct* pthread);

void k_prog(void* arg __attribute((unused)));

#endif