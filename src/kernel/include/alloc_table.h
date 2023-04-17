#include <stdint.h>

struct ALLOCATE_TABLE_ENTRY
{
    uint32_t Index; /// 该条目的索引
    uint32_t NumberOfUnits; /// 该条目包含几个空置单元
};

struct ALLOCATE_TABLE
{
    uint32_t NumberOfEntries; /// 条目总数
    uint32_t Frees;           /// 空闲条目数
    struct ALLOCATE_TABLE_ENTRY* Entries; /// 条目内容
};

void init_AllocateTable(struct ALLOCATE_TABLE* Table,struct ALLOCATE_TABLE_ENTRY* Entries,uint64_t NumberOfEntries);
uint32_t AllocateUnits(struct ALLOCATE_TABLE* Table,uint32_t NumberOfUnits);
void FreeUnits(struct ALLOCATE_TABLE* Table,uint32_t Index,uint32_t NumberOfUnits);