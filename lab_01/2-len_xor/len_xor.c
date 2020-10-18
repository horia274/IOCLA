#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char *str)
{
	char *p = (char*)str;
	int count = 0;
	while(*p != '\0') {
		count++;
		p++;
	}
	return count;
}

void equality_check(const char *str)
{
	char *p = (char*)str;
	int n = my_strlen(str);
	for(int i = 0; i < n; i++) {
		if(!(*(p + i) ^ *(p + (i + (1 << i)) % n))) {
			printf("Address of %c: %p\n", *(p + i), p + i);
		}
	}
	printf("\n");
}

int main(void)
{
	const char *str1 = "aac";
	printf("length = %d\n", my_strlen(str1));
	equality_check(str1);

	const char *str2 = "ababababacccbacbacbacbacbabc";
	printf("length = %d\n", my_strlen(str2));
	equality_check(str2);
	return 0;
}
