# Pencil_Kernel
#### 介绍
支持UEFI引导的Pencil-Kernel
#### 编译环境
##### 编译器
使用GCC编译<br />
Windows下,可以用`Mingw`编译`UEFI`程序,使用`x86_64-elf64-gcc`编译内核.<br />
Linux下编译UEFI需要用交叉编译器.<br />
```bash
sudo apt install gcc-mingw-w64-x86-64
```
##### EDK2
只需要`EDK2`中的`MedPkg/Include`下的文件.
#### 编译命令
```bash
# UEFI
# $(CC)为编译器,$(INCLUDE_DIR)是uefi所用头文件目录,$(ENTRY_POINT)为UEFI入口地址
# $(OUTPUT)是编译后的efi程序,$(SRC)为源代码
$(CC) -Wall -Wextra -I$(INCLUDE_DIR) -e $(ENTRY_POINT) -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -o $(OUTPUT) $(SRC)
```
```bash
# Kernel
# $(CC)为编译器,$(INCLUDE_DIR)是所用头文件的目录,
# $(OUTPUT)是编译后的efi程序,$(SRC)为源代码
# -c :只编译,不链接
# -fPIC :使生成的程序可以被加载到任意地址
$(CC) $(SRC) -c -o $(OUTPUT) -Wall -ffreestanding -fPIC -I$(UEFI_INCLUDE_DIR) \
        -nostdlib -nostdinc -mcmodel=large -fno-builtin -fno-strict-aliasing \
        -Wall -m64 -march=x86-64 -O0
```