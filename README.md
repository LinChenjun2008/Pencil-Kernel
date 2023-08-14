# Table of contents
* [Platforms](#platforms)
* [Dependencies](#dependencies)
* [Compiling](#compiling)
* [Install](#install)
* [Run in qemu](#run-in-qemu)
# Platforms

You should be able to compile Pencil-Kernel successfully on the following
platforms:
* Windows 7 or later

# Dependencies
To compile Pencil-Kernel you will need:
* Mingw64
* [x86_64-elf-tools](https://github.com/lordmilko/i686-elf-tools/releases/tag/7.1.0)
* make

To run Pencil-Kernel you will need:
* [qemu-system-x86_64](https://www.qemu.org)
* Ovmf

# Compiling
1. Get the [source code](https://github.com/linchenjun2008/pencil-kernel),put it in a folder like`C:\pencil-kernel\`.
and creat `esp` folder to get result of the compilation process.
2. Enter in the `esp` folder,creat `EFI\Boot\` and `Kernel`folder.
```sh
cd .\esp
mkdir EFI
mkdir Kernel
cd .\EFI
mkdir Boot
```
3. Open `pencil-kernel\build\config.txt` and configure the following:
* `DISK`:The `esp` folder created above.
* `PHYSICAL_DISK`: The physical disk which you want install pencil-kernel.(Optional).

example:
```makefile
DISK = C:\pencil-kernel\esp
PHYSICAL_DISK = E:\
```
* `Mingw_CC`: Mingw GCC paths.
* `CC`: x86_64-elf-tools GCC paths.
* `LD`: x86_64-elf-tools linker path.
* `GDB`: gdb debugger(Optional).
* `NM`
* `OBJCOPY`
* `OBJDUMP`
* `RM`:(Optional).
* `QEMU`:qemu simulator
* `UEFI_BIOS`:Ovmf

example:
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
4. Enter in the `pencil-kernel\build\` directory and execute `make bootoader`and`make kernel`.

example:
```
cd C:\pencil-kernel\build
make bootloader
make kernel
```
if everything is successful,you can find the result in `esp` directory.
# Install
1. Enter in the folder `esp\Kernel`
2. Create `resource` folder.
3. Put a bitmap font typeface(optional) and a truetypeface(.ttf) file in `resource` directory.Edit `src\bootloader\boot.h` then go to the `penc-kernel\build\` directory and execute `make bootoader` to recompile the bootloader.
```c
struct Files Files[] =
{
    {L"Kernel\\kernel.sys",0x100000,AllocateAddress,0x80000001},
    // Change the file path to the bitmap font
    {L"Kernel\\typeface.sys",0x600000,AllocateAddress,0x80000002},
    // Change the file path to the truetypeface font
    {L"Kernel\\resource\\typeface.ttf",0x800000,AllocateAddress,0x80000003}
};

```
4. Copy the files in `esp` to a physical disk which you want install.
# Run in qemu
1. follow the step`1-3` in process [Install](#install)
2. Enter in the `pencil-kernel\build\` directory and execute `make run`