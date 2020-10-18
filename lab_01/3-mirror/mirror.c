#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void swap(char *x, char *y) {
	*x = *x ^ *y;
	*y = *y ^ *x;
	*x = *x ^ *y;
}

void mirror(char *s)
{
	int n = strlen(s);
	for(int i = 0; i < (int) n / 2; i++) {
		swap(s + i, s + n - 1 - i);
	}
}

int main()
{
	/* TODO: Test function */
	char *s;
	s = strdup("AnaAreMere");
	printf("%s --> ", s);
	mirror(s);
	printf("%s\n", s);
	free(s);

	return 0;
}

