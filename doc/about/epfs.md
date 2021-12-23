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
    
}
```
