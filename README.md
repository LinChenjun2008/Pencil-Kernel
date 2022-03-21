Pencil-Kernel
=
### Pencil-Kernel
`Pencil-Kernel`,简称`PKn`,是一个小型的操作系统内核.
`Pencil-Kernel`被设计为一个跨平台内核,
当前支持平台:`x86` <br />
在`Pencil-Kernel`开发完成时,预计是一个由硬盘引导、
页式内存管理,有键盘、鼠标等设备的驱动程序、
支持用户进程、有自己的文件系统,使用图形界面和文本界面作为交互方式的
32位分时多任务微内核操作系统.

***
`Pencil-Kernel`,abbreviation `PKn`,it is a tiny operating system kernel.
`Pencil-Kernel`is designed to a multiple platforms kernels,
current support:`x86` <br />

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
|    +---进入内核
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

### 目标 Goal
进行中:<br />
- [x] 实现线程切换
***
- [ ] 在文件系统中加载loader和内核
- [x] 在虚拟机中通过硬盘启动
- [x] 实现GUI

- [ ] 支持ACPI关机
- [x] 在物理电脑上运行
- [ ] 微内核
- [ ] ~~打倒Linux~~
### 更多 More
[[运行截图 Run screenshot]](doc/image/Readme.md)<br />
***
### 联系方式 Contact details
网站: ~~https://pencil.cnurl.tk~~ (暂时关闭中)<br/>
E-mail: zpojia@hotmail.com<br />
bilibili: @Linevtnpu
***
(注意:LICENSE不适用于tools目录中的程序)
***
&copy; 2021-2022 Pencil-Kernel developers,All rights reserved.
