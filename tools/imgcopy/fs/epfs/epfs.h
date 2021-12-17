#ifndef __EPFS_H_
#define __EPFS_H_

#include "stdint.h"

#ifndef PACKED
    #define PACKED __attribute__((packed))
#endif /* PACKED */

struct super_block
{
    uint32_t magic;
    uint32_t disk_size;
    uint32_t sector_size;//512
    uint32_t bitmap_start_sector;
    uint32_t bitmap_sectors_len;
    uint32_t data_start_sector;
    uint32_t data_size;
    uint32_t root_dir_start_sector;
    uint32_t root_dir_sector_len;
    uint8_t unused[512 - (4 * 9)];
}PACKED;//512B

struct file_desc
{
    char name[15];     //15B
    uint8_t f_type;    // 1B
    uint32_t f_size;   // 4B
    uint32_t index[11];//44B
}PACKED;//64B

struct index_block
{
    uint32_t sector[128];
}PACKED;//512B

#endif /* __EPFS_H_ */
