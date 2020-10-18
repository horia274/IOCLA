#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void mirror(char *s)
{
	char c;
	int n = strlen(s);
	for(int i = 0; i < (int) n / 2; i++) {
		c = *(s + i);
		*(s + i) = *(s + n - 1 - i);
		*(s + n - 1 - i) = c;
	}
}

int main()
{
	/* TODO: Test function */
	char *s;//, *s2, *s3;
	s = strdup("AnaAreMere");
	printf("%s --> ", s);
	mirror(s);
	printf("%s\n", s);
	free(s);

	return 0;
}

