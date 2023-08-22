#include <alloc_table.h>

/**
 * @brief 初始化分配表
 * @param table 要初始化的表
 * @param entries 表项
 * @param number_of_entries 表项个数
*/
PUBLIC void allocate_table_init(allocate_table_t* table,
                                allocate_table_entry_t* entries,
                                uint64_t number_of_entries)
{
    table->number_of_entries = number_of_entries;
    table->frees             = 0;
    table->entries           = entries;
    return;
}

/**
 * @brief 在表中分配单元
 * @param table 从这个表中分配
 * @param number_of_units 分配的单元个数
 *
 * @return 分配到的单元下标
*/
PUBLIC uint64_t allocate_units(allocate_table_t* table,uint64_t number_of_units)
{
    uint64_t i;
    uint64_t index;
    for (i = 0;i < table->number_of_entries;i++)
    {
        if (table->entries[i].number_of_units >= number_of_units)
        {
            index = table->entries[i].index;
            table->entries[i].index += number_of_units;
            table->entries[i].number_of_units -= number_of_units;
            if (table->entries[i].number_of_units == 0)
            {
                table->frees--;
                while (i < table->frees)
                {
                    table->entries[i] = table->entries[i + 1];
                    i++;
                }
            }
            return index;
        }
    }
    return -1;
}

/**
 * @brief 在表中释放单元
 * @param table 从这个表中释放
 * @param index 单元编号
 * @param number_of_units 释放的单元个数
*/
PUBLIC void free_units(allocate_table_t* table,uint64_t index,
                       uint64_t number_of_units)
{
    uint64_t i,j;
    for (i = 0;i < table->frees;i++)
    {
        if (table->entries[i].index > index)
        {
            break;
        }
    }
    if (i > 0)
    {
        if (table->entries[i - 1].index + table->entries[i - 1].number_of_units
            == index)
        {
            table->entries[i - 1].number_of_units += number_of_units;
            if (i < table->frees)
            {
                if (index + number_of_units == table->entries[i].index)
                {
                    table->entries[i - 1].number_of_units +=
                                            table->entries[i].number_of_units;
                    table->frees--;
                    while (i < table->frees)
                    {
                        table->entries[i] = table->entries[i + 1];
                        i++;
                    }
                }
            }
            return;
        }
    }
    if (i < table->frees)
    {
        if (index + number_of_units == table->entries[i].index)
        {
            table->entries[i].index = index;
            table->entries[i].number_of_units += number_of_units;
            return;
        }
    }
    if (table->frees < table->number_of_entries)
    {
        for (j = table->frees;j > i;j--)
        {
            table->entries[j] = table->entries[j - 1];
        }
        table->frees++;
        table->entries[i].index = index;
        table->entries[i].number_of_units = number_of_units;
        return;
    }
    return;
}

PUBLIC uint64_t total_free_units(allocate_table_t* table)
{
    uint64_t i;
    uint64_t free_units = 0;
    for (i = 0;i < table->frees;i++)
    {
        free_units += table->entries[i].number_of_units;
    }
    return free_units;
}