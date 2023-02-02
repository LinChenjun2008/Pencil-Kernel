#ifndef __LIST_H__
#define __LIST_H__

#include <global.h>
#include <stdint.h>

// #define offset(Type,Member) ((UINTN)(&(((Type*)0)->Member)))

/* #define container_of(Type,Member,Ptr) \
 ({ \
     ((Type*)(((UINTN)Ptr) - offset(Type,Member))); \
 })
*/
struct ListNode
{
    struct ListNode* prev; /* 上一个节点 */
    struct ListNode* next; /* 下一个节点 */
    void* container;
};

struct List
{
    struct ListNode head; /* 链表头 */
    struct ListNode tail; /* 链表尾 */
};

typedef BOOL (func) (struct ListNode* ,UINTN arg);

/**
 * @brief 初始化链表
 * @param plist 待初始化链表的指针
*/
void list_init(struct List* plist);

/**
 * @brief 插入Node到in_before前面
 * @param pNode     链表节点指针
 * @param in_before Node被插入到这个节点前面
*/
void list_in(struct ListNode* pNode,struct ListNode* in_before);

/**
 * @brief 把pNode添加到队首,类似于push
 * @param plist 链表指针
 * @param pNode  要添加的元素的指针
*/
void list_push(struct List* plist,struct ListNode* pNode);

/**
 * @brief 添加pNode到队尾
 * @param plist 链表指针
 * @param pNode 要添加的元素的指针
*/
void list_append(struct List* plist,struct ListNode* pNode);

/**
 * @brief 将元素从链中退出
 * @param pNode 要弹出的元素
*/
void list_remove(struct ListNode* pNode);

/**
 * @brief 从队首弹出一个Node,类似于pop
 * @param plist 链表指针
 * @return 弹出的元素指针
*/
struct ListNode* list_pop(struct List* plist);

/**
 * @brief 在链表中查找objNode
 * @param plist 在此链表中查找
 * @param objNode 要查找的节点
 * @retval false 查找失败
 * @retval true  找到元素
*/
BOOL list_find(struct List* plist,struct ListNode* objNode);

/**
 * @brief 在链表中查找符合条件的节点
 * @param plist 在此链表中查找
 * @param function 回调函数,用于判断节点是否满足条件
 * @param arg 作为回调函数function的一个参数
 * @return 符合条件的链表指针
*/
struct ListNode* list_traversal(struct List* plist,func function,int arg);

/**
 * @brief 计算链表长度
 * @param plist 计算此链表的长度
 * @return 链表长度
*/
int list_len(struct List* plist);

BOOL list_empty(struct List* plist);

#endif /* __LIST_H_ */