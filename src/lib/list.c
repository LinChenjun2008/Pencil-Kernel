#include "list.h"
#include "debug.h"

/* list_init
* 初始化链表
* L :链表指针
*/
void list_init(struct list* L)
{
    L->head.prev = NULL;
    L->head.next = &(L->tail);
    L->tail.prev = &(L->head);
    L->tail.next = NULL;
    return;
}

//插入elem到in_before前面
void list_in(struct lise_elem* elem,struct list_elem* in_before);
//把elem添加到队首,类似于push
void list_push(struct list* L,struct list_elem* elem);
//添加elem到队尾
void list_append(struct list* L,struct list_elem* elem);
//将元素从链中退出
struct list_elem* list_remove(struct list_elem* elem);
//从队首弹出一个elem,类似于pop
struct list_elem* list_pop(struct list* L);
