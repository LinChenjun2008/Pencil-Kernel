#ifndef __LIST_H__
#define __LIST_H__

#include <kernel/global.h>
#include <std/stdint.h>

// #define offset(Type,Member) ((UINTN)(&(((Type*)0)->Member)))

/* #define container_of(Type,Member,Ptr) \
 ({ \
     ((Type*)(((UINTN)Ptr) - offset(Type,Member))); \
 })
*/
typedef struct _list_node_t list_node_t;
struct _list_node_t
{
    list_node_t *prev; /* 上一个节点 */
    list_node_t *next; /* 下一个节点 */
    void        *container;
};

typedef struct
{
    list_node_t head; /* 链表头 */
    list_node_t tail; /* 链表尾 */
} list_t;

typedef bool (func) (list_node_t* ,wordsize_t arg);

/**
 * @brief 初始化链表
 * @param list 待初始化链表的指针
*/
PUBLIC void list_init(list_t* list);

/**
 * @brief 插入node到in_before前面
 * @param node     链表节点指针
 * @param in_before node被插入到这个节点前面
*/
PUBLIC void list_in(list_node_t* node,list_node_t* in_before);

/**
 * @brief 把node添加到队首,类似于push
 * @param list 链表指针
 * @param node  要添加的元素的指针
*/
PUBLIC void list_push(list_t* list,list_node_t* node);

/**
 * @brief 添加node到队尾
 * @param list 链表指针
 * @param node 要添加的元素的指针
*/
PUBLIC void list_append(list_t* list,list_node_t* node);

/**
 * @brief 将元素从链中退出
 * @param node 要弹出的元素
*/
PUBLIC void list_remove(list_node_t* node);

/**
 * @brief 从队首弹出一个node,类似于pop
 * @param list 链表指针
 * @return 弹出的元素指针
*/
PUBLIC list_node_t* list_pop(list_t* list);

/**
 * @brief 在链表中查找objnode
 * @param list 在此链表中查找
 * @param objnode 要查找的节点
 * @retval false 查找失败
 * @retval true  找到元素
*/
PUBLIC bool list_find(list_t* list,list_node_t* objnode);

/**
 * @brief 在链表中查找符合条件的节点
 * @param list 在此链表中查找
 * @param function 回调函数,用于判断节点是否满足条件
 * @param arg 作为回调函数function的一个参数
 * @return 符合条件的链表指针
*/
PUBLIC list_node_t* list_traversal(list_t* list,func function,int arg);

/**
 * @brief 计算链表长度
 * @param list 计算此链表的长度
 * @return 链表长度
*/
PUBLIC int list_len(list_t* list);

PUBLIC bool list_empty(list_t* list);

#endif /* __LIST_H_ */