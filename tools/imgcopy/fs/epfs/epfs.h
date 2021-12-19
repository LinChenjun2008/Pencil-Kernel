#ifndef __EPFS_H_
#define __EPFS_H_

#include "stdint.h"

//packed属性:不对数据进行对齐,确保结构体大小
#ifndef PACKED
    #define PACKED __attribute__((packed))
#endif /* PACKED */

struct super_block
{
    char magic[8];                       //  8B 文件系统名称
    uint32_t disk_size;                  //  4B 磁盘(分区)大小
    uint32_t sector_size;                //  4B 每扇区大小(byte)
    uint32_t bitmap_start_sector;        //  4B bitmap的起始扇区
    uint32_t bitmap_sectors_len;         //  4B bitmap占用的扇区数
    uint32_t data_start_sector;          //  4B 数据区起始扇区
    uint32_t data_size;                  //  4B 数据区大小
    uint32_t root_dir_start_sector;      //  4B 根目录起始扇区
    uint32_t root_dir_sector_len;        //  4B 根目录占用扇区数
    uint8_t unused[510 - ((4 * 8)+(8))]; //470B 引导程序
    uint8_t end[2];                      //  2B 结束标志0x55,0xaa
}PACKED;//512B

struct file_desc
{
    char name[15];     //15B 文件名12B + 拓展名3B
    uint8_t f_type;    // 1B 文件类型
    uint32_t f_size;   // 4B 文件大小
    uint32_t index[11];//44B 文件索引. [0~7]直接索引 [8]:一级间接索引 [9]:二级间接索引 [10]:三级间接索引
}PACKED;//64B

struct index_block
{
    uint32_t sector[128];//512B 文件索引块
}PACKED;//512B

#endif /* __EPFS_H_ */
