BITS 32

global idt_descriptor
global idt_start
extern isr_timer

section .data

idt_start:
times 256 dq 0

idt_end:

idt_descriptor:
    dw idt_end - idt_start - 1
    dd idt_start

section .text

setup_idt:

    mov eax, isr_timer

    mov word [idt_start + 32*8 + 0], ax
    mov word [idt_start + 32*8 + 2], 0x08
    mov byte [idt_start + 32*8 + 4], 0
    mov byte [idt_start + 32*8 + 5], 10001110b
    shr eax,16
    mov word [idt_start + 32*8 + 6], ax

    ret