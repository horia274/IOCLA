#include <stdio.h>
#include <stdlib.h>

void main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max = v[0];
	int i = 0;
	int dim = sizeof(v) / sizeof(*v);

loop:
	if (++i >= dim)
		goto exit;
	if (v[i] > max)
		max = v[i];
	goto loop;


exit:
	printf("%d\n", max);
	exit(0);

}
