#ifndef __SYNC_H__
#define __SYNC_H__

#include <lib/list.h>
#include <kernel/global.h>
#include <thread/thread.h>

typedef struct
{
    volatile int value;
    list_t       waiters;
} semaphore_t;

typedef struct
{
    task_struct_t *holder;
    semaphore_t    semaphore;
    int            holder_repeat_nr;
} lock_t;

/**
 * @brief 初始化信号量
 * @param psema 信号量
 * @param value 值
*/
PUBLIC void sema_init(semaphore_t* psema,int value);

/**
 * @brief 初始化锁
 * @param plock 锁
*/
PUBLIC void lock_init(lock_t* plock);

/**
 * @brief 信号量P操作
 * @param psema 信号量
*/
PUBLIC void sema_down(semaphore_t* psema);

/**
 * @brief 信号量V操作
 * @param psema 信号量
*/
PUBLIC void sema_up(semaphore_t* psema);

/**
 * @brief 获取锁
 * @param plock 锁
*/
PUBLIC void lock_acquire(lock_t* plock);

/**
 * @brief 释放锁
 * @param plock 锁
*/
PUBLIC void lock_release(lock_t* plock);
#endif