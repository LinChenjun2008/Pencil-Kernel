include config.txt

# 编译所有文件
%.o: %.c
	@$(ECHO) compile $*.c
	@"$(CC)" $(INCLUDE_DIR) -nostdlib -nostdinc $(CFLAGS) -c -o $*.o $*.c

# 链接内核文件
%.sys: $(KERNEL_SRC:c=o)
	@$(ECHO) link
	@"$(LD)" -T $(KERNEL_LDS) -Map $(KERNEL_DIR)kernel.map -o $(KERNEL_OBJ) $^

	@"$(NM)" -n $(KERNEL_OBJ) > kernel.sym
	@"$(KALLSYMS)" kernel.sym .tmp_kallsymc.c
	@"$(CC)" .tmp_kallsymc.c -c -o .tmp_kallsymc.o

	@$(ECHO) relink
	@"$(LD)" -T $(KERNEL_LDS) -Map $(KERNEL_DIR)kernel.map -o $(KERNEL_OBJ) $^ .tmp_kallsymc.o
#	@$(RM) kernel.sym .tmp_kallsymc.c .tmp_kallsymc.o
	@"$(OBJCOPY)" -I $(KERNEL_OBJ_FORMAT) --strip-debug -S -R ".eh_frame" -R ".comment" -O $(KERNEL_OUTPUT_FORMAT) $(KERNEL_OBJ) $@

%.efi: $(UEFI_SRC) $(UEFI_DIR)/boot.h
	@$(ECHO) compile BootLoader...
	@"$(Mingw_CC)" -Wall -Wextra -Werror $(INCLUDE_DIR) -e UefiMain -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 -fno-stack-protector -O0 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -fpic -o $@ $^

.PHONY: bootloader config.txt
bootloader: $(UEFI_OUTPUT)

.PHONY: kernel
kernel: $(KERNEL_SRC:c=o) $(KERNEL_OUTPUT)

.PHONY: run
run: bootloader kernel config.txt
	-"$(QEMU)" $(QEMU_FLAGS)
#	-monitor stdio

.PHONY: debug
debug: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) config.txt
	-@"$(QEMU)" $(QEMU_FLAGS) -S -s

.PHONY: dump
dump: kernel
	"$(OBJDUMP)" -D -S $(KERNEL_OBJ) > kernel.dump

.PHONY: install
install: $(PHYSICAL_UEFI_OUTPUT) $(PHYSICAL_KERNEL_OUTPUT)
	@echo [[[[[ Done. ]]]]]

.PHONY: uninstall
uninstall:
	$(RM) $(PHYSICAL_UEFI_OUTPUT) $(PHYSICAL_KERNEL_OUTPUT)

.PHONY: clean
clean:
	-$(RM) -f $(KERNEL_SRC:c=o) $(KERNEL_DIR)kernel.map \
	kernel.sym .tmp_kallsymc.c .tmp_kallsymc.o \
	$(UEFI_OUTPUT)