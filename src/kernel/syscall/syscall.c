#include <syscall.h>
#include <interrupt/interrupt.h>
#include <device/serial.h>
#include <std/stdio.h>
#include <std/string.h>
#include <subsystem.h>

PUBLIC syscall_status_t send_recv(syscall_function_t function,pid_t src_dst,message_t* msg)
{
    syscall_status_t res;
    __asm__ __volatile__
    (
        "int $0x40"
        :"=a"(res)
        :"a"(function),"b"(src_dst),"c"(msg)
    );
    return res;
}

PRIVATE bool deadlock(pid_t src,pid_t dst)
{
    if (src == dst)
    {
        return TRUE;
    }
    task_struct_t* pthread = pid2thread(dst);
    while (1)
    {
        if (pthread->status == TASK_SENDING)
        {
            if (pthread->send_to == src)
            {
                /* 死锁 */
                return TRUE;
            }
            pthread = pid2thread(pthread->send_to);
            if (pthread == NULL)
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

PRIVATE uint32_t msg_send(pid_t dst,message_t* msg)
{
    task_struct_t* sender;
    task_struct_t* pdst;
    sender = running_thread();
    sender->send_to = dst;
    pdst = pid2thread(dst);
    if (pdst == NULL)
    {
        sender->send_to = NO_TASK;
        return SYSCALL_NO_DST;
    }
    msg->source = sender->pid;
    /* 判断是否死锁 */
    if (deadlock(sender->pid,dst))
    {
        char str[128];
        sprintf(str,"%s:Error: '%s'(src) -> '%s'(dst) dead lock\n",__func__,
                sender->name,pid2thread(dst)->name);
        pr_log(COM1_PORT,str);
        return SYSCALL_DEADLOCK;
    }
    /* 消息复制到当前进程pcb */
    memcpy(&sender->msg,msg,sizeof(message_t));
    /* 加入队列 */
    list_append(&pdst->sender_list,&sender->general_tag);
    /* 对方正准备接收消息 */
    if (pdst->status == TASK_RECEIVING)
    {
        if(pdst->recv_from == ANY || pdst->recv_from == sender->pid)
        {
            /* 唤醒对方 */
            thread_unblock(pdst);
        }
    }
    /* 阻塞自己 */
    thread_block(TASK_SENDING);
    sender->send_to = NO_TASK;
    return SYSCALL_SUCCESS;
}

PRIVATE int msg_recv(pid_t src,message_t* msg)
{
    task_struct_t* psrc;
    task_struct_t* receiver;
    receiver = running_thread();

    if (src == receiver->pid)
    {
        return SYSCALL_DEADLOCK;
    }
    receiver->recv_from = src;

    /* 从任意进程接收消息 */
    if (src == ANY)
    {
        /* 没有进程发消息,阻塞 */
        if (list_empty(&receiver->sender_list))
        {
            thread_block(TASK_RECEIVING);
        }
        /* 被唤醒说明一定有进程发消息*/
        psrc = list_pop(&receiver->sender_list)->container;
    }
    /* 从特定进程接收 */
    else
    {
        if (pid2thread(src) == NULL)
        {
            receiver->recv_from = NO_TASK;
            return SYSCALL_NO_SRC;
        }
        /* 阻塞,直到收到消息 */
        while (!list_find(&receiver->sender_list,&pid2thread(src)->general_tag))
        {
            thread_block(TASK_RECEIVING);
        }
        list_remove(&pid2thread(src)->general_tag);
        psrc = pid2thread(src);
    }
    if (psrc == NULL)
    {
        receiver->recv_from = NO_TASK;
        return SYSCALL_NO_SRC;
    }
    memcpy(msg,&psrc->msg,sizeof(message_t));
    psrc->send_to = NO_TASK;
    if (psrc->status == TASK_SENDING)
    {
        thread_unblock(psrc);
    }
    receiver->recv_from = NO_TASK;
    return SYSCALL_SUCCESS;
}

PRIVATE void ASMCALL sys_sendrec(wordsize_t nr __attribute__((unused)),
                                 intr_stack_t* stack)
{
    syscall_function_t function;
    pid_t src_dst;
    message_t* msg;
    function = stack->rax;
    src_dst = stack->rbx;
    msg = (message_t*)stack->rcx;
    syscall_status_t res = SYSCALL_ERROR;
    if (0x80000000 + SUBSYS_CNT >= src_dst && src_dst > 0x80000000)
    {
        src_dst = subsystem_pid[src_dst - 0x80000000];
    }
    switch(function)
    {
        case NR_SEND:
            res = msg_send(src_dst,msg);
            break;
        case NR_RECEIVE:
            res = msg_recv(src_dst,msg);
            break;
        case NR_BOTH:
            res = msg_send(src_dst,msg);
            if (res == SYSCALL_SUCCESS)
            {
                res = msg_recv(src_dst,msg);
            }
            break;
        default:
            res = SYSCALL_NO_SYSCALL;
            break;
    }

    if (IS_SYSCALL_ERROR(res))
    {
        char s[64];
        sprintf(s,"%s:%x syscall error(%x)\n",running_thread()->name,
                function,res);
        pr_log(COM1_PORT,s);
    }
    stack->rax = res;
    return;
}

PUBLIC void init_syscall()
{
    register_handle(SYSCALL_INTR,sys_sendrec);
    return;
}