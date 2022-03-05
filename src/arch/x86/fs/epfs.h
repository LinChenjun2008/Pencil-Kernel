/* epfs.h
* EPFS文件系统
*/
#ifndef __EPFS_H_
#define __EPFS_H_

#include "stdint.h"

/* packed属性:不对数据进行对齐,确保结构体大小 */
#ifndef PACKED
    #define PACKED __attribute__((packed))
#endif /* PACKED */

/* 
* EPFS改进后大概有以下结构:

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
}PACKED;/* 大小要刚好512字节(一扇区) */

/* inode结构 
* i_no   :i节点编号,就是在inode数组的下标
* owner  :文件所有者
* f_type :文件类型(普通文件还是目录)
* f_size :文件大小
* year   :最后一次写入的年份
* time   :最后一次写入的时间
* index  :文件索引,就是文件在磁盘的扇区号(存储的是 实际扇区号-分区起始扇区号)
*/
struct inode
{
    uint32_t i_no;      /*  4 i节点编号,就是在inode数组的下标 */
    uint8_t owner;      /*  1 文件所有者 */
    uint8_t f_type;     /*  1 文件类型(普通文件还是目录) */
    uint32_t f_size;    /*  4 文件大小 */
    uint16_t year;      /*  2 最后一次写入的年份 */
    uint32_t time;      /*  4 0~3bit:十毫秒 4~9bit:秒 10~15bit:分 16~21bit:时 22~27bit:日 28~31bit:月 */
    uint32_t index[12]; /* 48 文件索引,就是文件在磁盘的扇区号(存储的是 实际扇区号-分区起始扇区号) */
}PACKED;/* 一个inode刚好64字节,一个扇区放8个inode */

struct index_block
{
    uint32_t index[1024];//512*8B 一级、二级、三级间接文件索引块(每块128个文件索引)
}PACKED;//512*8B

#endif /* __EPFS_H_ */
