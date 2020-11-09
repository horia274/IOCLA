%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    dword_array dd 1392, 12544, 7992, 6992, 7202, 27187, 28789, 17897, 12988, 17992
    print_format db "Array sum is ", 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor ebx, ebx            ; Use ebx to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.
    xor eax, eax

add_dword_array_element:
    mov ax, word [dword_array + ecx * 4 - 4]
    mov dx, ax
    mul dx
    shl edx, 16
    add edx, eax
    add ebx, edx
    loop add_dword_array_element ; Decrement ecx, if not zero, add another element.

    PRINTF32 `%s\x0`, print_format
    PRINTF32 `%u\n\x0`, ebx

    leave
    ret
