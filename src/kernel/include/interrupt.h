#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#include <global.h>

#define PIC_M_CTRL 0x20	/* 8259A主片的控制端口是0x20 */
#define PIC_M_DATA 0x21	/* 8259A主片的数据端口是0x21 */
#define PIC_S_CTRL 0xa0	/* 8259A从片的控制端口是0xa0 */
#define PIC_S_DATA 0xa1	/* 8259A从片的数据端口是0xa1 */

typedef enum
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
} intr_status_t;

void init_interrupt();

/**
 * @brief 注册中断处理函数
 * @param NR 中断号
 * @param handel 处理程序
*/
void register_handle(uint8_t nr,void* handle);

/**
 * @brief  开中断
 * @return 开中断前的状态
*/
intr_status_t intr_enable();

/**
 * @brief  关中断
 * @return 关中断前的状态
*/
intr_status_t intr_disable();

/**
 * @brief 将中断状态设为status
 * @return 之前的中断状态
*/
intr_status_t intr_set_status(intr_status_t status);

/**
 * @brief 获取中断状态
 * @return 中断状态
*/
intr_status_t intr_get_status();

#endif