#! /bin/sh

IMAGE_SIZE_MB=1

BOOTLOADER_SRC="bootloader.asm"
BOOTLOADER_OUT="build/bootloader"

IMAGE="build/os.img"

dd if=/dev/zero of="$IMAGE" bs=1024000 count="$IMAGE_SIZE_MB" && \
    nasm -f bin "$BOOTLOADER_SRC" -o "$BOOTLOADER_OUT" && \
    dd conv=notrunc if="$BOOTLOADER_OUT" of="$IMAGE" && \
#    dd conv=notrunc if="$BOOTLOADER_OUT" of="$IMAGE" bs=512 count=1 seek=0 && \
    #nasm -f bin "$SAMPLE_SRC" -o "$SAMPLE_OUT" && \
    #dd conv=notrunc if="$SAMPLE_OUT" of="$IMAGE" bs=512 count=1 seek=1 && \
    echo "Done."

