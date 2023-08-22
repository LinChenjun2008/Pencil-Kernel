#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#include <kernel/global.h>

typedef enum
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
} intr_status_t;

PUBLIC void init_interrupt();

/**
 * @brief 注册中断处理函数
 * @param NR 中断号
 * @param handel 处理程序
*/
PUBLIC void register_handle(uint8_t nr,void* handle);

/**
 * @brief  开中断
 * @return 开中断前的状态
*/
PUBLIC intr_status_t intr_enable();

/**
 * @brief  关中断
 * @return 关中断前的状态
*/
PUBLIC intr_status_t intr_disable();

/**
 * @brief 将中断状态设为status
 * @return 之前的中断状态
*/
PUBLIC intr_status_t intr_set_status(intr_status_t status);

/**
 * @brief 获取中断状态
 * @return 中断状态
*/
PUBLIC intr_status_t intr_get_status();

#endif