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

* 基本信息
* Magic               :用于识别文件系统
* StartSec            :分区起始扇区
* TotSec              :用于记录分区总扇区数
* BytesPerSector      :每扇区字节数(应该都是512吧?)

* inode信息
* InodeCnt            :inode数量
* InodeStartSec       :inode起始扇区
* InodeSectors        :inode占用扇区数
* RootDirInodeNo      :根目录的inode编号

* bitmap
* BlockBitmapStartSec :用于记录块使用信息的bitmap
* BlockBitmapSectors  :块bitmap占用的扇区数
* InodeBitmapStartSec :用于记录inode使用情况的bitmap
* InodeBitmapSectors  :inode bitmap占用的扇区数

* 数据区
* DataStartSec        :数据区起始扇区
*/

struct index_block
{
    /* 基本信息 */
    uint8_t Magic[8];             /* 用于识别文件系统 */
    uint32_t StartSec;            /* 分区起始扇区 */
    uint32_t TotSec;              /* 用于记录分区总扇区数 */
    uint32_t BytesPerSector;      /* 每扇区字节数(应该都是512吧?) */

    /* inode信息 */
    uint32_t InodeCnt;            /* inode数量 */
    uint32_t InodeStartSec        /* inode起始扇区 */
    uint32_t InodeSectors         /* inode占用扇区数 */
    uint32_t RootDirInodeNo       /* 根目录的inode编号 */

    /* bitmap */
    uint32_t BlockBitmapStartSec; /* 用于记录块使用信息的bitmap */
    uint32_t BlockBitmapSectors;  /* 块bitmap占用的扇区数 */
    uint32_t InodeBitmapStartSec; /* 用于记录inode使用情况的bitmap */
    uint32_t InodeBitmapSectors;  /* inode bitmap占用的扇区数 */

    /* 数据区 */
    uint32_t DataStartSec;        /* 数据区起始扇区 */
    uint8_t pad[512 - (8 + 4*12)];/* 凑满512字节 */
}PACKED;//512B

/* inode结构 
* i_no   :i节点编号,就是在inode数组的下标
* owner  :文件所有者
* f_type :文件类型(普通文件还是目录)
* year   :最后一次写入的年份
* date   :最后一次写入的日期(高4位是月份,低4位是天)
* time   :最后一次写入的时间(距离当天早上00:00的秒数)
* index  :文件索引,就是文件在磁盘的扇区号(存储的是 实际扇区号-分区起始扇区号)
*/
struct file_desc
{
    uint32_t i_no;   /* i节点编号,就是在inode数组的下标 */
    uint16_t owner;  /* 文件所有者 */
    uint8_t f_type   /* 文件类型(普通文件还是目录) */
    uint16_t year;   /* 最后一次写入的年份 */
    uint8_t date;    /* 最后一次写入的日期(高4位是月份,低4位是天) */
    uint16_t time;   /* 最后一次写入的时间(距离当天早上00:00的秒数) */
    uint32_t index[] /* 文件索引,就是文件在磁盘的扇区号(存储的是 实际扇区号-分区起始扇区号) */
}PACKED;//64B

struct index_block
{
    uint32_t sector[1024];//512*8B 一级、二级、三级间接文件索引块(每块128个文件索引)
}PACKED;//512*8B

#endif /* __EPFS_H_ */
