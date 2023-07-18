#include <subsystem.h>
#include <memory.h>


#include <stdio.h>
#include <serial.h>

void mm_get_a_page(message_t* msg)
{
    void *paddr;
    uintptr_t vaddr;
    task_struct_t* src = pid2thread(msg->source);
    paddr = alloc_physical_page(1);
    vaddr = (uintptr_t)paddr;
    if (src->page_dir != NULL)
    {
        vaddr = allocate_units(&src->vaddr_table,1) * PG_SIZE;
        page_map(src->page_dir,paddr,(void*)vaddr);
    }
    msg->msg2.m2p1 = (void*)vaddr;
    return;
}

void mm_main()
{
    message_t msg;
    send_recv(NR_RECEIVE,ANY,&msg);
    while(1)
    {
        send_recv(NR_RECEIVE,ANY,&msg);
        switch(msg.type)
        {
            case MM_GET_A_PAGE:
                mm_get_a_page(&msg);
                send_recv(NR_SEND,msg.source,&msg);
                break;
            default:
                break;
        }
    }
}