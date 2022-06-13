```c
#include <sys/time.h>

struct timeval start, end;
gettimeofday(&start, NULL);
gettimeofday(&end, NULL);

// ms
int duration = (end.tv_sec * 1000 + end.tv_usec / 1000) -
			   (start.tv_sec * 1000 + start.tv_usec / 1000); 
```
