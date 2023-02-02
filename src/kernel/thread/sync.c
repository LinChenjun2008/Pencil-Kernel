#include <sync.h>
#include <debug.h>
#include <interrupt.h>

/**
 * @brief 初始化信号量
 * @param psema 信号量
 * @param value 值
*/
PUBLIC void sema_init(struct Semaphore* psema,int value)
{
    psema->value = value;
    list_init(&(psema->waiters));
    ASSERT(psema->value == value);
    return;
}

/**
 * @brief 初始化锁
 * @param plock 锁
*/
PUBLIC void lock_init(struct Lock* plock)
{
    plock->holder = NULL;
    plock->HolderRepeatNr = 0;
    sema_init(&(plock->semaphore),1);
    return;
}

/**
 * @brief 信号量P操作
 * @param psema 信号量
*/
PUBLIC void sema_down(struct Semaphore* psema)
{
    enum intr_status old_status = intr_disable();
    while(psema->value == 0)
    {
        /* 保证自己不在waiter中 */
        ASSERT(!list_find(&(psema->waiters),&(running_thread()->general_tag)));
        if(list_find(&(psema->waiters),&(running_thread()->general_tag)))
        {
            PANIC("sema_down: 当前线程意外出现在等待队列中!");
        }
        list_append(&(psema->waiters),&(running_thread()->general_tag));
        thread_block(TASK_BLOCKED);
    }
    psema->value--;
    ASSERT(psema->value == 0);
    intr_set_status(old_status);
    return;
}

/**
 * @brief 信号量V操作
 * @param psema 信号量
*/
PUBLIC void sema_up(struct Semaphore* psema)
{
    enum intr_status ols_status = intr_disable();
    ASSERT(psema->value == 0);
    if(!list_empty(&(psema->waiters)))
    {
        struct ListNode* blocked_tag = list_pop(&(psema->waiters));
        struct task_struct* blocked_thread = blocked_tag->container;
        thread_unblock(blocked_thread);
    }
    psema->value++;
    ASSERT(psema->value == 1);
    intr_set_status(ols_status);
    return;
}

/**
 * @brief 获取锁
 * @param plock 锁
*/
PUBLIC void lock_acquire(struct Lock* plock)
{
    if(plock->holder != running_thread())
    {
        sema_down(&(plock->semaphore));
        plock->holder = running_thread();
        ASSERT(plock->HolderRepeatNr == 0);
        plock->HolderRepeatNr = 1;
    }
    else
    {
        plock->HolderRepeatNr++;
    }
    return;
}


/**
 * @brief 释放锁
 * @param plock 锁
*/
PUBLIC void lock_release(struct Lock* plock)
{
    ASSERT(plock->holder == running_thread());
    if(plock->HolderRepeatNr > 1)
    {
        plock->HolderRepeatNr--;
        return;
    }
    ASSERT(plock->HolderRepeatNr == 1);
    plock->holder = NULL;
    plock->HolderRepeatNr = 0;
    sema_up(&(plock->semaphore));
    return;
}