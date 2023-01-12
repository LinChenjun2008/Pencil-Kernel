#ifndef __SYNC_H__
#define __SYNC_H__

#include <list.h>
#include <global.h>
#include <thread.h>

struct Semaphore
{
    volatile int value;
    struct List waiters;
};

struct Lock
{
    struct task_struct* holder;
    struct Semaphore semaphore;
    UINTN HolderRepeatNr;
};

/**
 * @brief 初始化信号量
 * @param psema 信号量
 * @param value 值
*/
PUBLIC void sema_init(struct Semaphore* psema,int value);

/**
 * @brief 初始化锁
 * @param plock 锁
*/
PUBLIC void lock_init(struct Lock* plock);

/**
 * @brief 信号量P操作
 * @param psema 信号量
*/
PUBLIC void sema_down(struct Semaphore* psema);

/**
 * @brief 信号量V操作
 * @param psema 信号量
*/
PUBLIC void sema_up(struct Semaphore* psema);

/**
 * @brief 获取锁
 * @param plock 锁
*/
PUBLIC void lock_acquire(struct Lock* plock);

/**
 * @brief 释放锁
 * @param plock 锁
*/
PUBLIC void lock_release(struct Lock* plock);
#endif