#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {
    int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};

    unsigned char* char_ptr = (unsigned char*)&v;
    for (int i = 0; i < sizeof(v) / sizeof(*char_ptr); i++) {
        printf("%p --> 0x%02X\n", char_ptr, *char_ptr);
        char_ptr++;
    }
    printf("\n");

    unsigned short* short_ptr = (unsigned short*)&v;
    for (int i = 0; i < sizeof(v) / sizeof(*short_ptr); i++) {
        printf("%p --> 0x%04X\n", short_ptr, *short_ptr);
        short_ptr++;
    }
    printf("\n");

    unsigned int* int_ptr = (unsigned int*)&v;
    for (int i = 0; i < sizeof(v) / sizeof(*int_ptr); i++) {
        printf("%p --> 0x%08X\n", int_ptr, *int_ptr);
        int_ptr++;
    }

    return 0;
}
