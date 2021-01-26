%include "../utils/printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

print_format: db "Substring found at index: %d", 13, 10, 0

section .text
extern printf

global main

first_index:
    push ebp
    mov ebp, esp

    xor ecx, ecx
    mov edi, [ebp + 8]          ; source
    mov esi, [ebp + 12]         ; substring

compute_index:
    cmp byte [edi + ecx], 0
    je exit

    lea ebx, [edi + ecx]
    cmp ebx, esi
    je exit
    
    inc ecx
    jmp compute_index

exit:
    mov eax, ecx
    leave
    ret

main:
    push ebp
    mov ebp, esp

    push substring
    push source_text
    call first_index
    add esp, 8

    push eax
    push print_format
    call printf
    add esp, 8


    ; TODO: Print the start indices for all occurrences of the substring in source_text

    leave
    ret
