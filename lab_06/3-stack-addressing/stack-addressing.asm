%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    ; push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    sub esp, 1
    mov byte [esp], 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are "
    sub esp, 4
    mov dword [esp], "Ana "
    ; push 0
    ; push "mere"
    ; push "are "
    ; push "Ana "

    lea esi, [esp]
    PRINTF32 `%s\n\n\x0`, esi

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above
    mov eax, esp

print_values:
    PRINTF32 `%x : %hhd\n\x0`, eax, byte [eax]
    inc eax
    cmp eax, ebp
    jb print_values

    ; TODO 3: print the string
    PRINTF32 `\n\x0`
    xor ebx, ebx
    mov eax, esp

print_string:
    PRINTF32 `%x : %c\n\x0`, eax, byte [eax]
    inc eax
    inc ebx
    cmp ebx, 13
    jb print_string

    ; TODO 4: print the array on the stack, element by element.
    PRINTF32 `\n\x0`
    add esp, 13
    mov eax, esp

print_array:
    PRINTF32 `%x : %d\n\x0`, eax, dword [eax]
    add eax, 4
    cmp eax, ebp
    jb print_array

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
