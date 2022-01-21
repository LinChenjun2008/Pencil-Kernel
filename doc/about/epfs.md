EPFS
=
***
[返回目录](dir.md)
***
### 简介
EPFS,一个简单的文件系统,是通过将inode和fat类文件系统结合而来的一个文件系统.
## 基本信息
最大支持磁盘空间: 16TiB<br/>
单文件最大大小:4TiB(实际占用约4.004TiB)<br/>
读取单位:4kib(约8扇区)
***
### 引导扇区
以下内容来自epfs.h:
```c
struct index_block
{
    uint8_t JmpCmd[5];                         //  5B 跳转到引导程序的指令
    uint8_t magic[8];                          //  8B 文件系统名称
    uint32_t TotSec;                           //  4B 总扇区数
    uint32_t BytesPerSector;                   //  4B 每扇区大小(byte)
    uint32_t BitmapStartSec;                   //  4B bitmap的起始扇区
    uint32_t BitmapSectors;                    //  4B bitmap占用的扇区数
    uint32_t DataStartSec;                     //  4B 数据区起始扇区
    uint32_t DataSectors;                      //  4B 数据区大小
    uint32_t RootDirStartSec;                  //  4B 根目录起始扇区
    uint32_t RootDirSectors;                   //  4B 根目录占用扇区数
    uint8_t ipl[510 - ((4 * 8)+(5 + 8))];      //465B 引导程序
    uint8_t end[2];                            //  2B 结束标志0x55,0xaa
}PACKED;//512B
```
|变量名          |作用                |取值
----------------|-------------------|-------
|TotSec         |总扇区数             |磁盘扇区数
|BytesPerSec    |每扇区字节数         |512
|BitmapStartSec |bitmap的起始扇区     |1
|BitmapSectors  |bitmap占用的扇区数   |(bitmap.btmp_bytes_len+511)/512

epfs文件系统的磁盘布局:
```
           ----------------------------------------------------------------------------------------
           |Boot |Bitmap        |RootDir                     |other...                            |
           ----------------------------------------------------------------------------------------
扇区号(LBA) 0     1              BitmapStartSec+BitmapSectors RootDirStartSec + RootDirSectors     TotSec-1
                 BitmapStartSec DataStartSec                                                      DataStartSec + DataSectors
                                RootDirStartSec                                                   
```
### EPFS的磁盘管理方式
(未完待续...)
