#compile all c codes
gcc -ffreestanding -nostdlib -c -o kernel.o kernel.c
gcc -ffreestanding -nostdlib -c -o video.o video.c
gcc -ffreestanding -nostdlib -c -o window.o window.c

#link kernel
ld -o kernel.bin -T linker.ld kernel.o video.o window.o

#link for c
gcc -o kernel.bin kernel.o video.o window.o -ffreestanding -nostdlib -T linker.ld

#now please read "PROBLEM.TXT"