org 0x7c00
bits 16

%define ENDL 0x0D, 0x0A
%define ENDS 0x00

start:
    jmp main

printstr:
    push si
    push ax

.loop:
    lodsb
    or al, al
    jz .done
    mov ah, 0Eh
    mov bh, 0
    int 10h
    
jmp .loop

.done:
    pop ax
    pop si
    
    ret

cls:
    pusha
    mov al, 0x03
    mov ah, 0x00
    int 0x10
    popa
    ret

main:
    call cls
    mov si, string
    call printstr

string: db "Hello world!", ENDL, ENDS

times 510 - ($-$$) db 0
dw 0xAA55

