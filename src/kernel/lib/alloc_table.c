#include <alloc_table.h>

/**
 * @brief 初始化分配表
 * @param Table 要初始化的表
 * @param Entries 表项
 * @param NumberOfEntries 表项个数
*/
void init_AllocateTable(struct ALLOCATE_TABLE* Table,struct ALLOCATE_TABLE_ENTRY* Entries,uint64_t NumberOfEntries)
{
    Table->NumberOfEntries = NumberOfEntries;
    Table->Frees = 0;
    Table->Entries = Entries;
    return;
}

/**
 * @brief 在表中分配单元
 * @param Table 从这个表中分配
 * @param NumberOfUnits 分配的单元个数
*/
uint32_t AllocateUnits(struct ALLOCATE_TABLE* Table,uint32_t NumberOfUnits)
{
    uint64_t i;
    uint64_t Index;
    for (i = 0;i < Table->NumberOfEntries;i++)
    {
        if (Table->Entries[i].NumberOfUnits > NumberOfUnits)
        {
            Index = Table->Entries[i].Index;
            Table->Entries[i].Index += NumberOfUnits;
            Table->Entries[i].NumberOfUnits -= NumberOfUnits;
            if (Table->Entries[i].NumberOfUnits == 0)
            {
                Table->Frees--;
                while (i < Table->Frees)
                {
                    Table->Entries[i] = Table->Entries[i + 1];
                    i++;
                }
            }
            return Index;
        }
    }
    return 0;
}

/**
 * @brief 在表中释放单元
 * @param Table 从这个表中释放
 * @param Index 单元编号
 * @param NumberOfUnits 释放的单元个数
*/
void FreeUnits(struct ALLOCATE_TABLE* Table,uint32_t Index,uint32_t NumberOfUnits)
{
    uint32_t i,j;
    for (i = 0;i < Table->Frees;i++)
    {
        if (Table->Entries[i].Index > Index)
        {
            break;
        }
    }
    if (i > 0)
    {
        if (Table->Entries[i - 1].Index + Table->Entries[i - 1].NumberOfUnits == NumberOfUnits)
        {
            Table->Entries[i - 1].NumberOfUnits += NumberOfUnits;
            if (i < Table->Frees)
            {
                if (Index + NumberOfUnits == Table->Entries[i].Index)
                {
                    Table->Entries[i - 1].NumberOfUnits += Table->Entries[i].NumberOfUnits;
                    Table->Frees--;
                    while (i < Table->Frees)
                    {
                        Table->Entries[i] = Table->Entries[i + 1];
                        i++;
                    }
                }
            }
            return;
        }
    }
    if (i < Table->Frees)
    {
        if (Index + NumberOfUnits == Table->Entries[i].Index)
        {
            Table->Entries[i].Index = Index;
            Table->Entries[i].NumberOfUnits += NumberOfUnits;
            return;
        }
    }
    if (Table->Frees < Table->NumberOfEntries)
    {
        for (j = Table->Frees;j > i;j++)
        {
            Table->Entries[j] = Table->Entries[j - 1];
        }
        Table->Frees++;
        Table->Entries[i].Index = Index;
        Table->Entries[i].NumberOfUnits = NumberOfUnits;
        return;
    }
    return;
}