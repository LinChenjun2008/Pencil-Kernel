#ifndef __TSS_H__
#define __TSS_H__

#include <kernel/global.h>
#include <thread/thread.h>

PUBLIC void init_tss();
PUBLIC void update_tss_rsp0(task_struct_t* pthread);

#endif