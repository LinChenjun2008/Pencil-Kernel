#include <common.h>
#include <list.h>
#include <interrupt.h>

/**
    @brief 初始化链表
    @param plist 待初始化链表的指针
**/
void list_init(struct List* plist)
{
    (plist->head).prev = NULL;
    (plist->head).next = &(plist->tail);
    (plist->tail).prev = &(plist->head);
    (plist->tail).next = NULL;
    return;
}

/**
    @brief 插入Node到in_before前面
    @param pNode     链表节点指针
    @param in_before Node被插入到这个节点前面
**/
void list_in(struct ListNode* pNode,struct ListNode* in_before)
{
    enum intr_status status= intr_disable();

    (in_before->prev)->next = pNode;

    pNode->prev = in_before->prev;
    pNode->next = in_before;

    in_before->prev = pNode;

    intr_set_status(status);
    return;
}

/**
    @brief 把pNode添加到队首,类似于push
    @param plist 链表指针
    @param pNode  要添加的元素的指针
**/
void list_push(struct List* plist,struct ListNode* pNode)
{
    list_in(pNode,(plist->head).next);
    return;
}

/**
    @brief 添加pNode到队尾
    @param plist 链表指针
    @param pNode 要添加的元素的指针
**/
void list_append(struct List* plist,struct ListNode* pNode)
{
    list_in(pNode,&(plist->tail));
    return;
}

/**
    @brief 将元素从链中退出
    @param pNode 要弹出的元素
**/
void list_remove(struct ListNode* pNode)
{
    enum intr_status status = intr_disable();
    (pNode->prev)->next = pNode->next;
    (pNode->next)->prev = pNode->prev;
    intr_set_status(status);
    return;
}

/**
    @brief 从队首弹出一个Node,类似于pop
    @param plist 链表指针
    @return 弹出的元素指针
**/
struct ListNode* list_pop(struct List* plist)
{
    struct ListNode* pNode = plist->head.next;
    list_remove(pNode);
    return pNode;
}

/**
    @brief 在链表中查找objNode
    @param plist 在此链表中查找
    @param objNode 要查找的节点
    @retval false 查找失败
    @retval true  找到元素
**/
BOOL list_find(struct List* plist,struct ListNode* objNode)
{
    struct ListNode* pNode = (plist->head).next;
    while(pNode != &(plist->tail))
    {
        if(pNode == objNode)
        {
            return TRUE;
        }
        pNode = pNode->next;
    }
    return FALSE;
}

/**
    @brief 在链表中查找符合条件的节点
    @param plist 在此链表中查找
    @param function 回调函数,用于判断节点是否满足条件
    @param arg 作为回调函数function的一个参数
    @return 符合条件的链表指针
**/
struct ListNode* list_traversal(struct List* plist,func function,int arg)
{
    struct ListNode* pNode = plist->head.next;
    while(pNode != &(plist->tail))
    {
        if(function(pNode,arg))
        {
            return pNode;
        }
        pNode = pNode->next;
    }
    return NULL;
}

/**
    @brief 计算链表长度
    @param plist 计算此链表的长度
    @return 链表长度
**/
int list_len(struct List* plist)
{
    struct ListNode* pNode = plist->head.next;
    int len = 0;
    while(pNode != &(plist->tail))
    {
        len++;
        pNode = pNode->next;
    }
    return len;
}

BOOL list_empty(struct List* plist)
{
    return (plist->head.next == &(plist->tail) ? TRUE : FALSE);
}