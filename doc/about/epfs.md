EPFS
=
***
[返回目录](dir.md)
***
一个简单的文件系统.
***
epfs基于inode类文件系统,但有一些不同.
下面为各位详细介绍.
***
### 引导扇区
在epfs.h中,可以看到:
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
这就是epfs的引导扇区, PACKED是__attribute__((packed)) 的宏定义, 目的是防止结构体被压缩,
导致大小与512Byte不符.<br/>
TotSec: 总扇区数<br/>
BytesPerSec: 每扇区字节数,一般是512<br/>
