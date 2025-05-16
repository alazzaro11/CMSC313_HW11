AUTHORING: Antonio Lazzaro/UMBC/CMSC 313/10:00/(5/16/25)

PURPOSE: The assembly file takes bytes of data taken from the input buffer and displays them in the console.

FILES: hw11.asm - The input buffer takes any number of bytes in hex format, and converts them to their ASCII values and displays them in the console

BUILD INSTRUCTIONS: To build this file from the console, use the following commands -
nasm -f elf hw11.asm
ld -m elf_i386 -o hw11 hw11.o

TESTING METHODOLOGY: The bytes taken from the assignment were used for the testing of this program.

ADDITIONAL INFORMATION: For the bytes given in the assignment, the output should be "83 6A 88 DE 9A C3 54 9A"
