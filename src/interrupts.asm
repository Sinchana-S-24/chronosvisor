global isr_default

isr_default:

pusha

mov al,'I'
out 0xE9,al

popa
iret
