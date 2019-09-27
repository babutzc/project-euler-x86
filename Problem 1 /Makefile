all: main

main-object.o:	problem1.asm  
	nasm -f elf32 -F stabs  -o main-object.o problem1.asm
main: main-object.o
	gcc -m32 main-object.o -o main
