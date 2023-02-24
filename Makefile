BUILD_DIR=build
BOOTLOADER=$(BUILD_DIR)/bootloader/bootloader.o
OS=$(BUILD_DIR)/os
DISK_IMG=$(BUILD_DIR)/os.img

all: bootdisk

build:
	mkdir -p $(BUILD_DIR)

bootloader: build
	make -C bootloader

os: build
	make -C os

bootdisk: bootloader os build
	dd              if=/dev/zero     of=$(DISK_IMG) bs=512 count=2880
	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0
	dd conv=notrunc if=$(OS)     	 of=$(DISK_IMG) bs=512 count=$$(($(shell stat --printf="%s" $(OS))/512)) seek=1

clean: build
	rm -fr $(BUILD_DIR)

