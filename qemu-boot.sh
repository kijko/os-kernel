#! /bin/bash

MACHINE=q35
OS_IMAGE=build/os.img

DEBUG="$1"

if [ "$DEBUG" == "-d" ];
then
    qemu-system-i386 \
        -machine "$MACHINE" \
        -hda "$OS_IMAGE" \
        -gdb tcp::26000 -S
else
    qemu-system-i386 \
        -machine "$MACHINE" \
        -hda "$OS_IMAGE"
fi

