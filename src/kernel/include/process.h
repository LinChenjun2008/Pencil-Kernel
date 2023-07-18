#ifndef __PROCESS_H__
#define __PROCESS_H__

#include <global.h>
#include <thread.h>

#define USER_STACK_VADDR_BASE (0x0000800000000000 - PG_SIZE)
/* #define USER_VADDR_START 0x804800 */
#define USER_VADDR_START 0x800000
extern void intr_exit(void);

PUBLIC void process_activate(task_struct_t* pthread);
PUBLIC task_struct_t* process_execute(void* process_name,char* name);

#endif