#include <stdint.h>

typedef struct
{
    uint32_t index;           /// 该条目的索引
    uint32_t number_of_units; /// 该条目包含几个空置单元
} allocate_table_entry_t;

typedef struct
{
    uint32_t                number_of_entries; /// 条目总数
    uint32_t                frees;             /// 空闲条目数
    allocate_table_entry_t *entries;           /// 条目内容
} allocate_table_t;

void allocate_table_init(allocate_table_t* table,allocate_table_entry_t* entries,uint64_t number_of_entries);
uint32_t allocate_units(allocate_table_t* table,uint32_t number_of_units);
void free_units(allocate_table_t* table,uint32_t index,uint32_t number_of_units);