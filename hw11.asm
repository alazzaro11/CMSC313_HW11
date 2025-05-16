section .data
    inputBuf    db  0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
    inputSize   equ $ - inputBuf
    
    hex_chars   db  "0123456789ABCDEF"
    space       db  " "
    newline     db  10
    
section .bss
    outputBuf   resb 80

section .text
    global _start

_start:
    ;Initialize registers
    xor ecx, ecx
    mov esi, inputBuf ;Source pointer
    mov edi, outputBuf ;Destination pointer

convert_loop:
    ;Check if all input bytes processed
    cmp ecx, inputSize
    jge print_result
    
    ;Get current byte
    mov eax, byte [esi + ecx]
    
    ;Extract high nibble
    mov ebx, eax
    shr ebx, 4
    and ebx, 0xF
    mov bl, byte [hex_chars + ebx]
    mov [edi], bl
    inc edi
    
    ;Extract low nibble
    mov ebx, eax
    and ebx, 0xF
    mov bl, byte [hex_chars + ebx]
    mov [edi], bl
    inc edi
    
    ;Add space between bytes
    cmp ecx, inputSize - 1
    je next
    jmp convert_loop
    mov byte [edi], ' '
    inc edi

;This function increments the loop if the exiting condition hasn't been met
next:
    inc ecx
    jmp convert_loop

;This function prints the result of the translation
print_result:
    ;Add newline
    mov byte [edi], 10
    inc edi
    
    ;Calculate length of the output
    mov eax, edi
    sub eax, outputBuf

    ;Print the contents of outputBuf
    mov edx, eax
    mov ecx, outputBuf
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    ;Exit program
    END
