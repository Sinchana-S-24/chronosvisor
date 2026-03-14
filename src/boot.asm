BITS 32

section .multiboot
align 4
    dd 0x1BADB002
    dd 0x00000000
    dd -(0x1BADB002 + 0x00000000)

extern gdt_descriptor
extern idt_descriptor
extern init_timer
extern setup_idt

section .text
global _start

load_gdt:
    lgdt [gdt_descriptor]
    ret

load_idt:
    lidt [idt_descriptor]
    ret

_start:

    call load_gdt
    call setup_idt
    call load_idt
    call init_timer
    sti

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