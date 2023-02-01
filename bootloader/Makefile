BUILD_DIR=../build/bootloader

BOOTLOADER_SRCS := $(wildcard *.asm)
BOOTLOADER_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

all: $(BOOTLOADER_OBJS)

build:
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.asm build
	nasm -f bin $< -o $@

clean: build
	rm $(BUILD_DIR)/*

