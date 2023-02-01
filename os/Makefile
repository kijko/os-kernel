BUILD_DIR=../build/os

OS_SRCS := $(wildcard *.asm)
OS_OBJS := $(patsubst %.asm, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS_OBJS)

build:
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.o: %.asm build
	nasm -f bin $< -o $@

