#include <list.h>
#include <interrupt.h>

/**
 * @brief 初始化链表
 * @param list 待初始化链表的指针
*/
PUBLIC void list_init(list_t* list)
{
    list->head.prev = NULL;
    list->head.next = &list->tail;
    list->tail.prev = &list->head;
    list->tail.next = NULL;
    return;
}

/**
 * @brief 插入node到in_before前面
 * @param node     链表节点指针
 * @param in_before node被插入到这个节点前面
*/
PUBLIC void list_in(list_node_t* node,list_node_t* in_before)
{
    intr_status_t status= intr_disable();

    in_before->prev->next = node;

    node->prev = in_before->prev;
    node->next = in_before;

    in_before->prev = node;

    intr_set_status(status);
    return;
}

/**
 * @brief 把pnode添加到队首,类似于push
 * @param list 链表指针
 * @param node  要添加的元素的指针
*/
PUBLIC void list_push(list_t* list,list_node_t* node)
{
    list_in(node,list->head.next);
    return;
}

/**
 * @brief 添加pnode到队尾
 * @param list 链表指针
 * @param node 要添加的元素的指针
*/
PUBLIC void list_append(list_t* list,list_node_t* node)
{
    list_in(node,&list->tail);
    return;
}

/**
 * @brief 将元素从链中退出
 * @param node 要弹出的元素
*/
PUBLIC void list_remove(list_node_t* node)
{
    intr_status_t status = intr_disable();
    node->prev->next = node->next;
    node->next->prev = node->prev;
    intr_set_status(status);
    return;
}

/**
 * @brief 从队首弹出一个node,类似于pop
 * @param list 链表指针
 * @return 弹出的元素指针
*/
PUBLIC list_node_t* list_pop(list_t* list)
{
    list_node_t* node = list->head.next;
    list_remove(node);
    return node;
}

/**
 * @brief 在链表中查找objnode
 * @param list 在此链表中查找
 * @param objnode 要查找的节点
 * @retval false 查找失败
 * @retval true  找到元素
*/
PUBLIC BOOL list_find(list_t* list,list_node_t* objnode)
{
    list_node_t* node = list->head.next;
    while (node != &(list->tail))
    {
        if (node == objnode)
        {
            return TRUE;
        }
        node = node->next;
    }
    return FALSE;
}

/**
 * @brief 在链表中查找符合条件的节点
 * @param list 在此链表中查找
 * @param function 回调函数,用于判断节点是否满足条件
 * @param arg 作为回调函数function的一个参数
 * @return 符合条件的链表节点指针,没有符合的则返回0
*/
PUBLIC list_node_t* list_traversal(list_t* list,func function,int arg)
{
    list_node_t* node = list->head.next;
    while (node != &list->tail)
    {
        if (function(node,arg))
        {
            return node;
        }
        node = node->next;
    }
    return NULL;
}

/**
 * @brief 计算链表长度
 * @param list 计算此链表的长度
 * @return 链表长度
*/
PUBLIC int list_len(list_t* list)
{
    list_node_t* node = list->head.next;
    int len = 0;
    while (node != &list->tail)
    {
        len++;
        node = node->next;
    }
    return len;
}

PUBLIC BOOL list_empty(list_t* list)
{
    return list->head.next == &list->tail;
}