#include <syscall.h>
#include <debug.h>
#include <interrupt.h>
#include <list.h>
#include <stdio.h>
#include <string.h>
#include <thread.h>

INTN send_recv(int function,pid_t src_dst,struct MESSAGE* msg)
{
    INTN res;
    __asm__ __volatile__
    (
        "movq %q[function],%%rax \n\t"
        "movq %q[src_dst],%%rbx \n\t"
        "movq %q[msg],%%rcx \n\t"
        "int $0x40"
        :"=a"(res)
        :[function]"r"(function),[src_dst]"r"(src_dst),[msg]"r"(msg)
    );
    return res;
}

pid_t pid_table[TASKPID_END - ANY];

void resetmsg(struct MESSAGE* msg)
{
    memset(msg,0,sizeof(struct MESSAGE));
    return;
}

BOOL deadlock(pid_t src,pid_t dst)
{
    struct task_struct* pthread = pid2thread(dst);
    while(1)
    {
        if(pthread->status == TASK_SENDING)
        {
            if(pthread->send_to == src)
            {
                /* 死锁 */
                return TRUE;
            }
            pthread = pid2thread(pthread->send_to);
            if(pthread == NULL)
            {
                return FALSE;
            }
        }
        else
        {
            break;
        }
    }
    return FALSE;
}

PRIVATE uint32_t msg_send(pid_t dst,struct MESSAGE* msg)
{
    struct task_struct* sender;
    struct task_struct* pdest;
    sender = running_thread();
    sender->send_to = dst;
    ASSERT(dst <= 1024);
    pdest = pid2thread(dst);
    ASSERT(pdest != NULL);
    ASSERT(sender != pdest);
    msg->source = running_thread()->pid;
    /* 判断是否死锁 */
    if(deadlock(sender->pid,dst))
    {
        char str[128];
        sprintf(str,"src:%s -> dst:%s dead lock",running_thread()->name,pid2thread(dst)->name);
        PANIC(str);
        return 1;
    }
    /* 消息复制到当前进程pcb */
    memcpy(&(running_thread()->msg),msg,sizeof(struct MESSAGE));
    ASSERT(sender->msg.source == msg->source);
    /* 加入队列 */
    ASSERT(!list_find(&(pdest->sender_list),&(sender->general_tag)));
    list_append(&(pdest->sender_list),&(sender->general_tag));
    /* 对方正准备接收消息 */
    if(pdest->status == TASK_RECEIVING && (pdest->recv_from == ANY || pdest->recv_from == sender->pid))
    {
        /* 唤醒对方 */
        thread_unblock(pdest);
    }
    /* 阻塞自己 */
    thread_block(TASK_SENDING);
    /* 被唤醒后不应该还在队列中 */
    ASSERT(!list_find(&(pdest->sender_list),&(sender->general_tag)));
    sender->send_to = NO_TASK;
    resetmsg(&(sender->msg));
    return 0;
}

int msg_recv(pid_t src,struct MESSAGE* msg)
{
    ASSERT(src == ANY || src <= 1024);
    struct task_struct* psrc;
    struct task_struct* receiver;
    receiver = running_thread();

    ASSERT(src != receiver->pid);
    receiver->recv_from = src;

    /* 从任意进程接收消息 */
    if(src == ANY)
    {
        /* 没有进程发消息,阻塞 */
        if(list_empty(&(receiver->sender_list)))
        {
            thread_block(TASK_RECEIVING);
        }
        /* 被唤醒说明一定有进程发消息*/
        ASSERT(!list_empty(&(receiver->sender_list)));
        psrc = list_pop(&(receiver->sender_list))->container;
    }
    /* 从特定进程接收 */
    else
    {
        /* 阻塞,直到收到消息 */
        while(!list_find(&receiver->sender_list,&pid2thread(src)->general_tag))
        {
            thread_block(TASK_RECEIVING);
        }
        list_remove(&pid2thread(src)->general_tag);

        psrc = pid2thread(src)->general_tag.container;
    }
    ASSERT(psrc != NULL);
    memcpy(msg,&(psrc->msg),sizeof(struct MESSAGE));
    ASSERT(psrc->status == TASK_SENDING)
    psrc->send_to = NO_TASK;
    thread_unblock(psrc);
    receiver->recv_from = NO_TASK;
    return 0;
}

UINTN ASMCALL sys_sendrec(UINTN Nr __attribute__((unused)),struct intr_stack* stack)
{
    int function;
    pid_t src_dst;
    struct MESSAGE* msg;
    function = stack->rax;
    src_dst = stack->rbx;
    msg = (struct MESSAGE*)stack->rcx;
    uint32_t res = 1;
    switch(function)
    {
        case SEND:
            res = msg_send(src_dst,msg);
            break;
        case RECEIVE:
            res = msg_recv(src_dst,msg);
            break;
        case BOTH:
            res = msg_send(src_dst,msg);
            if(res == 0)
            {
                res = msg_recv(src_dst,msg);
            }
            break;
        case MSG_RECEIVED:
            res = !list_empty(&(running_thread()->sender_list));
            break;
        default:
            ASSERT((function == SEND) || (function == RECEIVE) || (function == BOTH) || (function == MSG_RECEIVED));
            break;
    }
    return res;
}

void init_syscall()
{
    register_handle(SYSCALL_INTR,sys_sendrec);
    return;
}