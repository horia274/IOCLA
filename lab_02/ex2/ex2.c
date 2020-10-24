#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* delete_first(char *s, char *pattern) {
	char *q, *p = s;
	int i, ok, found = 0;
	for (; *p; p++) {
		if (!found) {
			if (*p == *pattern) {
				q = pattern;
				ok = 1;
				i = 0;
				for (; *q; q++) {
					if (*q != *(p + (i++))) {
						ok = 0;
						break;
					}
				}
				if (ok) {
					found = 1;
				}
			}
		} else {
			break;
		}
	}
	p--;
	for (; *(p + i - 1); p++) {
		*p = *(p + i);
	}
	return s;
}

int main(){
	char *s = strdup("Ana are mere");
	char *pattern = "re";

	// Decomentati linia dupa ce ati implementat functia delete_first.
	printf("%s\n", delete_first(s, pattern));
	free(s);

	return 0;
}
