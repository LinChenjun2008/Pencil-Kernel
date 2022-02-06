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
### 目标 Goal
- [x] 在文件系统中加载loader和内核
- [ ] 实现GUI
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
