#include <alloc_table.h>
#include <debug.h>

// #include <interrupt.h>

/**
 * @brief 初始化分配表
 * @param table 要初始化的表
 * @param entries 表项
 * @param number_of_entries 表项个数
*/
void allocate_table_init(allocate_table_t* table,allocate_table_entry_t* entries,uint64_t number_of_entries)
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
uint32_t allocate_units(allocate_table_t* table,uint32_t number_of_units)
{
    // enum intr_status old_status = intr_disable();
    uint64_t i;
    uint64_t index;
    for (i = 0;i < table->number_of_entries;i++)
    {
        if (table->entries[i].number_of_units > number_of_units)
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
            // intr_set_status(old_status);
            return index;
        }
    }
    // intr_set_status(old_status);
    return 0;
}

/**
 * @brief 在表中释放单元
 * @param table 从这个表中释放
 * @param index 单元编号
 * @param number_of_units 释放的单元个数
*/
void free_units(allocate_table_t* table,uint32_t index,uint32_t number_of_units)
{
    // enum intr_status old_status = intr_disable();
    uint32_t i,j;
    for (i = 0;i < table->frees;i++)
    {
        if (table->entries[i].index > index)
        {
            break;
        }
    }
    if (i > 0)
    {
        if (table->entries[i - 1].index + table->entries[i - 1].number_of_units == index)
        {
            table->entries[i - 1].number_of_units += number_of_units;
            if (i < table->frees)
            {
                if (index + number_of_units == table->entries[i].index)
                {
                    table->entries[i - 1].number_of_units += table->entries[i].number_of_units;
                    table->frees--;
                    while (i < table->frees)
                    {
                        table->entries[i] = table->entries[i + 1];
                        i++;
                    }
                }
            }
            // intr_set_status(old_status);
            return;
        }
    }
    if (i < table->frees)
    {
        if (index + number_of_units == table->entries[i].index)
        {
            table->entries[i].index = index;
            table->entries[i].number_of_units += number_of_units;
            // intr_set_status(old_status);
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
        // intr_set_status(old_status);
        return;
    }
    // intr_set_status(old_status);
    return;
}

/**
 * @brief 在allocate_table中移除范围内的单元
 * @param table 从这个表中移除
 * @param index 从这里开始
 * @param number_of_units 移除的单元数
*/
void remove_units(allocate_table_t* table,uint32_t index,uint32_t number_of_units)
{
    uint32_t i = 0;
    // 先将要删除的区域加入到table中
    free_units(table,index,number_of_units);
    for (i = 0;i < table->frees;i++)
    {
        if (table->entries[i].index > index)
        {
            i--;
            break;
        }
    }
    ASSERT(table->entries[i].index <= index);
    ASSERT(table->entries[i].number_of_units == number_of_units);
    // 开头相同
    if (table->entries[i].index == index)
    {
        if (table->entries[i].number_of_units == number_of_units)
        {
            uint32_t j;
            for (j = i;j < table->frees - 1;j++)
            {
                table->entries[j] = table->entries[j + 1];
            }
            table->frees--;
            return;
        }
        else if (table->entries[i].number_of_units > number_of_units)
        {
            table->entries[i].index = index;
            return;
        }
        // 不会出现 table->entries[i].number_of_units < number_of_units
    }
    // 开头不同,结尾相同
    else if (table->entries[i].index + table->entries[i].number_of_units == index + number_of_units)
    {
        // 扣除结尾部分
        table->entries[i].number_of_units -= number_of_units;
    }
    else
    {
        uint32_t j;
        for(j = table->frees; j > i;j--)
        {
            table->entries[j] = table->entries[j - 1];
        }
        // uint32_t end = table->entries[i].index + table->entries[i].number_of_units;
        table->frees++;
        table->entries[i + 1].index           = index + number_of_units;
        // table->entries[i + 1].number_of_units = end - table->entries[i + 1].index;
        table->entries[i + 1].number_of_units = table->entries[i].index - (index - table->entries[i].index) - number_of_units;

        table->entries[i].number_of_units = index - table->entries[i].index;
    }
    return;
}