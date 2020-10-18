#include <stdio.h>
#include <stdlib.h>

void helper_binary(int number, int *count)
{
	if(number <= 1) {
		(*count)++;
		if((*count & 7)) {
			for(int i = 0; i < 8 - ((*count & 7)); i++) {
				printf("0");
			}
		}
		printf("%d", number);
		return;
	}
	(*count)++;
	helper_binary(number >> 1, count);
	printf("%d", number & 1);
}

void helper_hexa(int number, int *count)
{
	char *v = "FEDCBA9876543210";
	if(number <= 15) {
		(*count)++;
		for(int i = 0; i < 8 - ((*count & 7)); i++) {
			printf("0");
		}
		printf("%c", v[15-number]);
		return;
	}
	(*count)++;
	helper_hexa(number >> 4, count);
	printf("%c", v[15-(number & 15)]);
}

void print_binary(int number, int nr_bits)
{
	int count;
	if(nr_bits ^ 2 && nr_bits ^ 16) {
		return;
	} else if(!(nr_bits ^ 2)) {
		printf("0b");
		count = 0;
		helper_binary(number, &count);
	} else {
		printf("0x");
		count = 0;
		helper_hexa(number, &count);
	}
	
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	for(int i = 0; i < n; i++) {
		if(*(numbers + i) & 1) {
			print_binary(*(numbers + i), 16);
		} else {
			print_binary(*(numbers + i), 2);
		}
	}
}

int main()
{
	int numbers[5] = {214, 71, 84, 134, 86};
	check_parity(numbers, 5);
	return 0;
}
