BITS 32

section .multiboot
align 4
    dd 0x1BADB002
    dd 0x00000000
    dd -(0x1BADB002 + 0x00000000)

section .text
global _start

_start:

    mov edi, 0xb8000
    mov esi, message

print:
    lodsb
    cmp al, 0
    je halt

    mov [edi], al
    inc edi
    mov byte [edi], 0x07
    inc edi

    jmp print

halt:
    cli
    hlt

message db "ChronosVisor booting...",0