#ifndef __TSS_H__
#define __TSS_H__

#include <global.h>
#include <thread.h>

void init_tss();
void update_tss_rsp0(task_struct_t* pthread);

#endif