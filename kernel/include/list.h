#ifndef __LIST_H__
#define __LIST_H__

#include <global.h>
#include <stdint.h>

#define offset(Type,Member) ((UINTN)(&(((Type*)0)->Member)))

#define container_of(Type,Member,Ptr) \
({ \
    ((Type*)(((UINTN)Ptr) - offset(Type,Member))); \
})

struct ListNode
{
    struct ListNode* prev; /* 上一个节点 */
    struct ListNode* next; /* 下一个节点 */
};

struct List
{
    struct ListNode head; /* 链表头 */
    struct ListNode tail; /* 链表尾 */
};

typedef BOOL (func) (struct ListNode* ,uint32_t arg);

// void list_init(struct list* plist);
// void list_in(struct list_elem* elem,struct list_elem* in_before);
// void list_push(struct list* plist,struct list_elem* elem);
// void list_append(struct list* plist,struct list_elem* elem);
// void list_remove(struct list_elem* elem);
// struct list_elem* list_pop(struct list* plist);
// bool list_find(struct list* plist,struct list_elem* obj_elem);
// struct list_elem* list_traversal(struct list* plist,func function,int arg);
// int list_len(struct list* plist);
// bool list_empty(struct list* plist);

#endif /* __LIST_H_ */