#include <stdio.h>
#include <stdlib.h>

void main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
	int mid;

binary_search:
	mid = (start + end) / 2;
	if (v[mid] == dest)
		goto exit;
	if (v[mid] > dest)
		end = mid - 1;
	if (v[mid] < dest)
		start = mid + 1;
	goto binary_search;

exit:
	printf("%d\n", mid);
	exit(0);

}
