#include <subsystem.h>

pid_t subsystem_pid[SUBSYS_CNT + 1];

void mm_main();
void view_main();

PUBLIC void start_subsystem()
{
    subsystem_pid[                       0] = 0;
    subsystem_pid[SUBSYS_MM   - 0x80000000] =
                                    thread_start(  "MM",63,  mm_main,NULL)->pid;
    subsystem_pid[SUBSYS_VIEW - 0x80000000] =
                                    thread_start("VIEW",63,view_main,NULL)->pid;
}