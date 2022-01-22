/* epfs.h
* Copyright 2021-2022 Lin Chenjun,All rights reserved.
*/
#ifndef __EPFS_H_
#define __EPFS_H_

#include "stdint.h"

//packed属性:不对数据进行对齐,确保结构体大小
#ifndef PACKED
    #define PACKED __attribute__((packed))
#endif /* PACKED */

/* 看了一下Linux的ext文件系统,感觉比EPFS更好一些
* 就想根据ext文件系统来改进EPFS
* 改进后大概有以下结构:
* Magic          :用于识别文件系统
* StartSec       :分区起始扇区
* TotSec         :用于记录总扇区数
* BytesPerSector :每扇区字节数(应该都是512吧?)
* InodeCnt       :inode数量
* InodeStartSec  :inode起始扇区
* InodeSectors   :inode占用扇区数
*/
struct index_block
{
    uint8_t Magic[8];                          //  8B 文件系统名称
    uint32_t TotSec;                           //  4B 总扇区数
    uint32_t BytesPerSector;                   //  4B 每扇区大小(byte)
    uint32_t InodeStartSec;
    uint32_t InodeSectors;
    uint32_t BitmapStartSec;                   //  4B bitmap的起始扇区
    uint32_t BitmapSectors;                    //  4B bitmap占用的扇区数
    uint32_t DataStartSec;                     //  4B 数据区起始扇区
    uint32_t DataSectors;                      //  4B 数据区大小
    uint32_t RootDirStartSec;                  //  4B 根目录起始扇区
    uint32_t RootDirSectors;                   //  4B 根目录占用扇区数
    uint8_t ipl[510 - ((4 * 8)+(5 + 8))];      //465B 引导程序
    uint8_t end[2];                            //  2B 结束标志0x55,0xaa
}PACKED;//512B

struct file_desc
{
    char name[15];     //15B 文件名12B + 拓展名3B
    uint8_t f_type;    // 1B 文件类型
    uint32_t f_size;   // 4B 文件大小
    uint32_t index[11];//44B 文件索引. [0~7]直接索引块 [8]:一级间接索引块 [9]:二级间接索引块 [10]:三级间接索引块
}PACKED;//64B

struct index_block
{
    uint32_t sector[1024];//512*8B 一级、二级、三级间接文件索引块(每块128个文件索引)
}PACKED;//512*8B

#endif /* __EPFS_H_ */
