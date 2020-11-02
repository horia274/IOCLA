%include "../io.mac"

section .data
    myString: db "Hello, World!", 0
    newString: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    ja print                        ; TODO1: eax > ebx?
    ret

print:
    PRINTF32 `%s\n\x0`, myString
    dec ecx
    jnz print
    PRINTF32 `%s\n\x0`, newString
                                    ; TODO2.2: afisati "Hello, World!" de N ori
                                    ; TODO2.1: afisati "Goodbye, World!"

    ret
