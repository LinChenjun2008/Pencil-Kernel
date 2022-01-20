# Pencil-Kernel Makefile

# tools
TOOLPATH := ../../../tools/
AS := $(TOOLPATH)as
CC1 := $(TOOLPATH)cc1
DD := $(TOOLPATH)dd
LD := $(TOOLPATH)ld
MAKE := $(TOOLPATH)make -r
NASM := $(TOOLPATH)nasm
OBJCOPY :=$(TOOLPATH)objcopy
#IMGCOPY := $(TOOLPATH)/imgcopy/imgcopy

#src path
BOOTPATH := boot/
INCLUDE := include/
KERNELPATH := kernel/
LIB := lib/
#exec
BOOT := $(BOOTPATH)boot.bin
LOADER := $(BOOTPATH)loader.bin

#obj
LIBS := $(LIB)bitmap.co $(KERNELPATH)debug.co $(LIB)list.co $(LIB)string.co 
OBJ_FILE := $(KERNELPATH)start.ao $(KERNELPATH)main.co $(LIBS)
KERNEL_OBJ_FILE := kernel.o
KERNEL := kernel.bin
#file
v_disk := a.vhd

#other
OBJ_FORMAT := elf32-i386

#command
COPY := copy
CD := cd
DELET := del
ECHO := echo
#.asm to .bin
%.bin: %.asm
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -I $(INCLUDE) -I ../ -o $*.bin $*.asm
#.asm to .ao (elf)
%.ao: %.asm
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -f elf -I $(INCLUDE) -I ../ -o $*.ao $*.asm

#.c to .co (elf)
%.co: %.c
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(CC1) -I $(INCLUDE) -I ../ -Os -Wall -quiet -fno-builtin -o $*.s $*.c
	$(AS) -I $(INCLUDE) -I ../ -o $*.co $*.s

#command:
#all: make all
#mkvhd: make a virtual disk
#build: compile all file
#run: start qenu
#clean: delet all obj file
.PHONY: all build clean mkvhd run system
all: $(BOOT) $(LOADER) $(OBJ_FILE)

build: all
	$(DD) if=$(BOOT) of=$(v_disk) bs=512 count=1 conv=notrunc
	$(DD) if=$(LOADER) of=$(v_disk) bs=512 count=200 seek=2 conv=notrunc

clean:
	$(CD) $(BOOTPATH) && $(DELET) *.bin
	$(CD) $(KERNELPATH) && $(DELET) *.co
	$(CD) $(KERNELPATH) && $(DELET) *.s
	$(CD) $(LIB) && $(DELET) *.ao
	$(CD) $(LIB) && $(DELET) *.co
	$(CD) $(LIB) && $(DELET) *.s
mkvd:
	$(NASM) -o $(v_disk) vhd.asm

run: build
	$(COPY) $(v_disk) ..\..\..\tools\qemu\fdimage0.bin
	$(TOOLPATH)qemu\qemu-system-i386 -m 32 -drive file=$(v_disk),index=0,if=floppy,format=raw -boot a

system: $(OBJ_FILE)
	$(LD) -b $(OBJ_FORMAT) -z muldefs -o $(KERNEL_OBJ_FILE) $(OBJ_FILE) -T kernel.lds
	$(OBJCOPY) -I $(OBJ_FORMAT) -S -R ".eh_frame" -R ".comment" -O binary $(KERNEL) $(KERNEL_OBJ_FILE)
