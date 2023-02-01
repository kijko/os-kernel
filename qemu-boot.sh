#! /bin/bash

MACHINE=q35
OS_IMAGE=build/os.img

DEBUG="$1"

        # -drive file="$OS_IMAGE",format=raw \
if [ "$DEBUG" == "-d" ];
then
    qemu-system-i386 \
        -machine "$MACHINE" \
        -fda "$OS_IMAGE" \
        -gdb tcp::26000 -S
else
    qemu-system-i386 \
        -machine "$MACHINE" \
        -fda "$OS_IMAGE"
fi

