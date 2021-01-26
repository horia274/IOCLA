global runAssemblyCode

section .text
runAssemblyCode:
    xor eax, eax
    mov esi, [esp + 4]
    mov ecx, [esp + 8]
compute_sum:
    add eax, [esi + 4 * ecx - 4]
    dec ecx
    jnz compute_sum
    ret