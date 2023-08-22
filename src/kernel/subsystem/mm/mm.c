#include <subsystem.h>
#include <memory.h>
#include <lib/list.h>


#include <std/stdio.h>
#include <device/serial.h>

PRIVATE void mm_get_a_page(message_t* msg)
{
    void *paddr;
    uintptr_t vaddr;
    task_struct_t* src = pid2thread(msg->source);
    paddr = alloc_physical_page(1);
    if (paddr == NULL)
    {
        return;
    }
    vaddr = (uintptr_t)paddr;
    if (src->page_dir != NULL)
    {
        vaddr = allocate_units(&src->vaddr_table,1) * PG_SIZE;
        page_map(src->page_dir,paddr,(void*)vaddr);
    }
    msg->msg2.m2p1 = (void*)vaddr;
    return;
}

PRIVATE void mm_free_a_page(message_t* msg)
{
    task_struct_t* src = pid2thread(msg->source);
    void* vaddr = msg->msg2.m2p1;
    void* paddr = to_physical_address(src->page_dir,vaddr);
    free_physical_page(paddr,1);
    free_units(&src->vaddr_table,(uintptr_t)vaddr & ~(PG_SIZE - 1),1);
    msg->msg2.m2p1 = NULL;
    return;
}

PRIVATE void mm_exit(message_t* msg)
{
    task_struct_t* cur = pid2thread(msg->source);
    list_remove(&cur->all_tag);
    uint64_t pml4e,pdpte,pde;
    uint64_t *pml4t,*pdpt,*pdt;
    pml4t = KADDR_P2V(cur->page_dir);
    for (pml4e = 0;pml4e < 0x100;pml4e++)
    {
        if (!(pml4t[pml4e] & PG_P))
        {
            continue;
        }
        pdpt = KADDR_P2V(pml4t[pml4e] & ~0xfff);
        for (pdpte = 0;pdpte < 512;pdpte++)
        {
            if (!(pdpt[pdpte] & PG_P))
            {
                continue;
            }
            pdt = KADDR_P2V(pdpt[pdpte] & ~0xfff);
            for (pde = 0;pde < 512;pde++)
            {
                if (!(pdt[pde] & PG_P))
                {
                    continue;
                }
                free_physical_page((void*)(pdt[pde] & ~0xfff),1);
            }
            pfree(KADDR_V2P(pdt));
        }
        pfree(KADDR_V2P(pdpt));
    }
    pfree(KADDR_V2P(pml4t));
    pfree(KADDR_V2P(cur->vaddr_table.entries));
}

PUBLIC void mm_main()
{
    message_t msg;
    send_recv(NR_RECEIVE,ANY,&msg);
    while(1)
    {
        send_recv(NR_RECEIVE,ANY,&msg);
        switch(msg.type)
        {
            case MM_EXIT:
                mm_exit(&msg);
                break;
            case MM_GET_A_PAGE:
                mm_get_a_page(&msg);
                send_recv(NR_SEND,msg.source,&msg);
                break;
            case MM_FREE_A_PAGE:
                mm_free_a_page(&msg);
                send_recv(NR_SEND,msg.source,&msg);
                break;
            default:
                break;
        }
    }
}