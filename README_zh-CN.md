# 目录
* [平台](#平台)
* [依赖](#依赖)
* [编译](#编译)
* [安装](#安装)
* [在qemu中运行](#在qemu中运行)
# 平台

你应该能在以下平台成功编译Pencil-Kernel:
* Windows 7 或更高版本

# 依赖
要编译Pencil-Kernel,你需要:
* Mingw64
* [x86_64-elf-tools](https://github.com/lordmilko/i686-elf-tools/releases/tag/7.1.0)
* make

要运行Pencil-Kernel,你需要:
* [qemu-system-x86_64](https://www.qemu.org)
* Ovmf

# 编译
1. 获取[源代码](https://github.com/linchenjun2008/pencil-kernel),放在类似`C:\pencil-kernel\`的目录中.
并创建`esp`文件夹以获取编译结果.
2. 进入`esp`目录,创建`EFI\Boot\`和`Kernel`文件夹.
```sh
cd .\esp
mkdir EFI
mkdir Kernel
cd .\EFI
mkdir Boot
```
3. 打开 `pencil-kernel\build\config.txt` 并配置以下内容:
* `DISK`:上文创建的`esp`目录.
* `PHYSICAL_DISK`: 用于安装Pencil-Kernel的物理磁盘(可选).

示例:
```makefile
DISK = C:\pencil-kernel\esp
PHYSICAL_DISK = E:\
```
* `Mingw_CC`: Mingw GCC 的路径.
* `CC`: x86_64-elf-tools GCC 的路径.
* `LD`: x86_64-elf-tools 连接器的路径.
* `GDB`: gdb 调试器(可选).
* `NM`
* `OBJCOPY`
* `OBJDUMP`
* `RM`:(可选).
* `QEMU`:qemu模拟器
* `UEFI_BIOS`:Ovmf文件

示例:
```makefile
LD        = x86_64-elf-tools/x86_64-elf/bin/ld.exe
GDB       = MinGW64/bin/gdb.exe
NM        = x86_64-elf-tools/x86_64-elf/bin/nm.exe
OBJCOPY   = x86_64-elf-tools/x86_64-elf/bin/objcopy.exe
OBJDUMP   = x86_64-elf-tools/x86_64-elf/bin/objdump.exe
RM        = rm.exe
QEMU      = qemu/qemu-system-x86_64.exe
UEFI_BIOS = vm/ovmf.bin
```
4. 进入`pencil-kernel\build\`目录并执行`make bootoader`和`make kernel`.

示例:
```
cd C:\pencil-kernel\build
make bootloader
make kernel
```
如果一切顺利,你可以在`esp`文件夹中找到编译结果.
# 安装
1. 进入`esp\Kernel`目录
2. 创建`resource`文件夹.
3. 将点阵字体文件(可选)和truetype(.ttf)格式的字体文件放在`resource`目录中.修改`src\bootloader\boot.h`,然后进入`pencil-kernel\build\`目录并执行`make bootoader`重新编译bootloader
```c
struct Files Files[] =
{
    {L"Kernel\\kernel.sys",0x100000,AllocateAddress,0x80000001},
    // 改为点阵字体文件路径
    {L"Kernel\\typeface.sys",0x600000,AllocateAddress,0x80000002},
    // 改为truetype字体路径
    {L"Kernel\\resource\\typeface.ttf",0x800000,AllocateAddress,0x80000003}
};

```
4. 将`esp`复制到用于安装Pencil-Kernel的磁盘中.
# 在qemu中运行
1. 按照[安装](#安装)过程的`1-3`步执行
2. 进入`pencil-kernel\build\`目录并执行`make run`.