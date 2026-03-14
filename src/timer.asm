global isr_timer

isr_timer:

pusha

mov al,'T'
out 0xE9,al

mov al,0x20
out 0x20,al

popa
iret

global init_timer

init_timer:

mov al,00110100b
out 0x43,al

mov ax,1193
out 0x40,al
mov al,ah
out 0x40,al

ret