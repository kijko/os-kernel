#! /bin/sh

BOOTLOADER_SRC="bootloader.asm"
BOOTLOADER_OUT="build/bootloader"

MAIN_SRC="main.asm"
MAIN_OUT="build/main"

IMAGE="build/os.img"

dd if=/dev/zero of="$IMAGE" bs=512 count=2880 && \
    nasm -f bin "$BOOTLOADER_SRC" -o "$BOOTLOADER_OUT" && \
    dd conv=notrunc if="$BOOTLOADER_OUT" of="$IMAGE" bs=512 count=1 seek=0 && \
    nasm -f bin "$MAIN_SRC" -o "$MAIN_OUT" && \
    dd if="$MAIN_OUT" of="$IMAGE" bs=512 count=1 seek=1 && \
#    dd conv=notrunc if="$BOOTLOADER_OUT" of="$IMAGE" bs=512 count=1 seek=0 && \
    #nasm -f bin "$SAMPLE_SRC" -o "$SAMPLE_OUT" && \
    #dd conv=notrunc if="$SAMPLE_OUT" of="$IMAGE" bs=512 count=1 seek=1 && \
    echo "Done."

