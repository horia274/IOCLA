%include "../utils/printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    xor ebx, ebx

push_elements:
    mov eax, dword [input + 4 * ebx]
    push eax
    inc ebx
    cmp ebx, ARRAY_LEN
    jb push_elements

    ; TODO retrieve the elements (pop) from the stack into the output array
    xor ebx, ebx

pop_elements:
    pop eax
    mov dword [output + 4 * ebx], eax
    inc ebx
    cmp ebx, ARRAY_LEN
    jb pop_elements

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
