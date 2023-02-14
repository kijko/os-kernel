BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

build:
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.asm build
	nasm -f elf $< -F dwarf -g -o $@
	ld -m elf_i386 -T bootloader.lds $@ -o $@.elf
	objcopy -O binary $(BUILD_DIR)/bootloader.o.elf $@

clean: build
	rm $(BUILD_DIR)/*

