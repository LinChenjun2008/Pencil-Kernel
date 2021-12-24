/* list.h
* copyright (c) 2021 Lin Chenjun,All rights reseved
*/
#ifndef __LIST_H_
#define __LIST_H_

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

#endif /* __LIST_H_ */
