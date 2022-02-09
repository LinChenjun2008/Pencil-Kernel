Pencil-Kernel
=
### Pencil-Kernel
`Pencil-Kernel`,简称`PKn`,是一个小型的操作系统内核.
`Pencil-Kernel`被设计为一个跨平台内核,
当前支持平台:`x86` <br />
***
`Pencil-Kernel`,abbreviation `PKn`,it is a tiny operating system kernel.
`Pencil-Kernel`is designed to a multiple platforms kernels,
current support:`x86` <br />
### 文件结构
```
doc:相关文档
src:源代码
 |
 +--arch:平台
     |
     +--x86:Intel 80x86平台
LICENSE:开源协议
tools:开发工具(windows系统中)
```
[详细信息](doc/question.md)
### 启动流程
```
+mbr.bin(仅限硬盘)
|
+boot.bin
|
+loader.bin
|    |
|    +---检测内存大小
|    +---加载setup
|    +---设置VBE模式
|    +---进入保护模式
|    +---开启分页
|    +---运行setup
|
+setup.bin(暂时没有)
|    |
|    +---加载kernel
|    +---运行kernel
|
+kernel.bin
...

```
### 编译命令
```bash
> make all   # 编译全部内容
> make build # 同样是编译全部内容
> make clean # 删除编译的中间文件
> make run   # 启动qemu运行Pencil-Kernel
> #具体请看Makefile
```
下载源代码后从编译到运行应使用的命令
```bash
> make vhd   #或make img(make vhd是硬盘,make img是软盘)
>            #make run包含了make build,所以下面两步可以只使用make run
> make build #或make all
> make run
```
### 制作进度
#### 2022.2.6
正在进行的是内存管理,但这个有些复杂,所以现在打算先进行图形模式的研究.<br />
还有,进入图形模式后可以显示中文,
但要显示中文的话要载入字库,字库会用掉磁盘很大空间,所以打算接着实现硬盘启动和完善EPFS(EPFS是Pencil-Kernel专用文件系统)
以便加载字库.
#### 2022.2.7
成功进入图形模式.但一往帧缓存写数据就会重启,猜测是帧缓存区映射的问题.
看来要修改页表的映射关系了.
#### 2022.2.8
想到了一个解决方法:目前支持的最大分辨率的VBE模式帧缓冲区大概有16MB,
相当于4096页,那么在映射时把第1016到1019个页目录分配给帧缓存区,
就可以通过0xfe000000~0xfebfffff这段内存来访问帧缓存区了,问题应该会解决,下午进行测试.
#### 2022.2.9
今天有以下更新:<br />
(1)文本模式下的print相关函数用C语言版来替换汇编版.
(2)成功进入图形模式并显示出画面.
(3)在图形界面和文本界面的相关函数中添加对当前显示模式的判断.
### 目标 Goal
- [x] 在文件系统中加载loader和内核
- [ ] 实现GUI(快了)
- [ ] 在物理电脑上运行
- [ ] 实现微内核
- [ ] ~~打倒Linux~~
### 更多 More
[[运行截图 Run screenshot]](doc/image/Readme.md)<br />
***
### 联系方式 Contact details
网站: ~~https://pencil.cnurl.tk~~ (暂时关闭中)<br/>
E-mail: zpojia@hotmail.com<br />
bilibili: @Linevtnpu
***
&copy; 2021-2022 Pencil-Kernel developers,All rights reserved.
