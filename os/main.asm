ORG 0x500
SECTION .text
jmp init

init:
    mov si, msg
    call print_string
    hlt

%include "../utils/io.asm"

SECTION .data
    msg: db "[STAGE2]: Hello world...",  0x0, 0x0D, 0x0A
    times 512 - ($-$$) db 0x3F

