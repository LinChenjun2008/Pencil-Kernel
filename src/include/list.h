/* list.h
* copyright (c) 2021 Lin Chenjun,All rights reseved
*/
#ifndef __LIST_H_
#define __LIST_H_

#define offset(struct_t,elem_name) ((int)(&(((struct_t*)0)->elem_name)))

struct list_elem
{
    struct list_elem* prev;
    struct list_elem* next;
};

struct list
{
    struct list_elem head;
    struct list_elem list tail;
};

//初始化
void list_init(struct list* L);
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

#endif /* __LIST_H_ */
