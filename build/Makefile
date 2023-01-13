include config.txt

$(KERNEL_OBJ): $(KERNEL_SRC) Makefile
	$(CC) -Wall -Wextra -Werror $(INCLUDE_DIR) -nostdlib -nostdinc \
	-finput-charset=UTF-8 -fexec-charset=UTF-8 \
	-fno-builtin -fno-strict-aliasing -fpic -mno-red-zone \
	-m64 -mcmodel=large -march=x86-64 \
	-Wl,-Map,$(KERNEL_DIR)kernel.map,-T,$(KERNEL_LDS) -Os -o $@ $(KERNEL_SRC)

%.sys: $(KERNEL_OBJ)
	$(OBJCOPY) -I $(KERNEL_OBJ_FORMAT) -S -R ".eh_frame" -R ".comment" -O $(KERNEL_OUTPUT_FORMAT) $< $@

%.efi: $(UEFI_SRC) Makefile
	$(CC) -Wall -Wextra  -Werror $(INCLUDE_DIR) -e UefiMain -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -fpic -o $@ $(UEFI_SRC)

uefi: $(UEFI_OUTPUT)

kernel: $(KERNEL_OUTPUT)

run: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) Makefile config.txt
	-$(QEMU) -m 4096 -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-device usb-kbd \
	-monitor stdio
	-$(MAKE) -r clean

install: $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)
	$(MAKE) -r clean
	@echo [[[[[ Done. ]]]]]

uninstall:
	$(RM) $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)

clean:
	-$(RM) $(KERNEL_OBJ) $(KERNEL_DIR)kernel.map