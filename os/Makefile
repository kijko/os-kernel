BUILD_DIR=../build
OS=$(BUILD_DIR)/os

CFLAGS+=-ffreestanding -nostdlib -gdwarf-4 -m32 -ggdb3

OS_SRCS := $(wildcard *.c)
OS_OBJS := $(patsubst %.c, $(BUILD_DIR)/%.o, $(OS_SRCS))

all: $(OS)

$(BUILD_DIR)/%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

$(OS): $(OS_OBJS)
	gold -m elf_i386 -nmagic -Tos.lds $(OS_OBJS) -o $@

