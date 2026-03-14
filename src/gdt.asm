global gdt_descriptor

gdt_start:

dq 0x0
dq 0x00AF9A000000FFFF
dq 0x00AF92000000FFFF

gdt_end:

gdt_descriptor:
dw gdt_end - gdt_start - 1
dd gdt_start
