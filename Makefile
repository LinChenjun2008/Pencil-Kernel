##code
SRCPATH := src/
ARCHPATH := $(SRCPATH)arch/
PLATFORM := x86
BOOTPATH := $(ARCHPATH)$(PLATFORM)/boot/
KERNELPATH := $(SRCPATH)kernel/
INCLUDE := $(SRCPATH)include/ -I $(BOOTPATH)

#tool
TOOLPATH := tool/
AS := $(TOOLPATH)as
CC1 := $(TOOLPATH)cc1
DD := $(TOOLPATH)dd
LD := $(TOOLPATH)ld
MAKE := $(TOOLPATH)make -r
NASM := $(TOOLPATH)nasm

VHD := dingst.img

BOOT := $(BOOTPATH)boot.bin
LOADER := $(BOOTPATH)loader.bin
KERNEL_FILE := $(KERNELPATH)main.co
KERNEL := $(KERNELPATH)kernel.sys
ALL_FILE := $(BOOT) $(LOADER) $(KERNEL_FILE)

%.bin: %.asm
	$(NASM)  -I $(INCLUDE) -I ../ -o $*.bin $*.asm

%.co: %.c
	$(CC1) -I $(INCLUDE) -I ../ -Os -Wall -quiet -o $*.s $*.c
	$(AS) -I $(INCLUDE) -I ../ -o $*.co $*.s

mkvhd:
	$(NASM) -o $(VHD) vhd.asm
    

vhd: $(ALL_FILE)
	$(DD) if=$(BOOT) of=$(VHD) bs=512 count=1 seek=0 conv=notrunc
	$(DD) if=$(LOADER) of=$(VHD) bs=512 count=200 seek=2 conv=notrunc

run: $(ALL_FILE)
	copy $(VHD) tool\qemu\fdimage0.bin
	$(MAKE) -C $(TOOLPATH)qemu

moved:
	$(NASM) -o $(VHD) vhd.asm
