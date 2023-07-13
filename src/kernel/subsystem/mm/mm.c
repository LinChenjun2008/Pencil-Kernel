#include <syscall.h>

void mm_main()
{
    message_t msg;
    pid_t source;
    send_recv(NR_RECEIVE,ANY,&msg);
    while(1)
    {
        send_recv(NR_RECEIVE,ANY,&msg);
        switch(msg.type)
        {
            default:
                break;
        }
    }
}