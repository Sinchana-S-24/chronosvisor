all: build

build:
	nasm -f elf32 src/boot.asm -o build/boot.o
	ld -m elf_i386 -T linker.ld build/boot.o -o build/kernel.bin
	cp build/kernel.bin iso/boot/
	grub-mkrescue -o chronosvisor.iso iso

run: build
	qemu-system-x86_64 -cdrom chronosvisor.iso

clean:
	rm -rf build/*.o build/*.bin chronosvisor.iso
