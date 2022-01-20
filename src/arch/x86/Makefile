# Pencil-Kernel Makefile

# tools
TOOLPATH := ../../../tools/
AS := $(TOOLPATH)as
CC1 := $(TOOLPATH)cc1
DD := $(TOOLPATH)dd
NASM := $(TOOLPATH)nasm
IMGCOPY := $(TOOLPATH)/imgcopy/imgcopy

#src path
BOOTPATH := boot/
INCLUDE := include/
LIB := lib/
#exec
BOOT := $(BOOTPATH)boot.bin
LOADER := $(BOOTPATH)loader.bin

#obj
LIBS := $(LIB)bitmap.co $(LIB)list.co $(LIB)string.co 
obj_file := $(KERNELPATH)main.co $(LIBS)
#file
v_disk := a.vhd

#command
COPY := copy
CD := cd
DELET := del

#.asm to .bin
%.bin: %.asm
	$(NASM) -I $(INCLUDE) -o $*.bin $*.asm

#.asm to .ao (elf)
%.ao: %.asm
	$(NASM) -f elf -I $(INCLUDE) -o $*.ao $*.asm

#.c to .co (elf)
%.co: %.c
	$(CC1) -I $(INCLUDE) -I ../ -Os -Wall -quiet -o $*.s $*.c
	$(AS) -I $(INCLUDE) -I ../ -o $*.co $*.s

#command:
#all: make all
#mkvhd: make a virtual disk
#build: compile all file
#run: start qenu
#clean: delet all obj file
.PHONY: all mkvhd build run clean
all: $(BOOT) $(LOADER) $(obj_file)

mkvd:
	$(NASM) -o $(v_disk) vhd.asm

build: all
	$(DD) if=$(BOOT) of=$(v_disk) bs=512 count=1 conv=notrunc
	$(DD) if=$(LOADER) of=$(v_disk) bs=512 count=200 seek=2 conv=notrunc

run: build
	$(COPY) $(v_disk) ..\..\..\tools\qemu\fdimage0.bin
	$(TOOLPATH)qemu\qemu-system-i386 -m 32 -drive file=$(v_disk),index=0,if=floppy,format=raw -boot a

clean:
	$(CD) $(BOOTPATH) && $(DELET) *.bin
	$(CD) $(LIB) && $(DELET) *.ao
	$(CD) $(LIB) && $(DELET) *.co
