```c
#include <stdlib.h>

static inline void rand_init(unsigned short *seed)
{
	seed[0] = (unsigned short)rand();
	seed[1] = (unsigned short)rand();
	seed[2] = (unsigned short)rand();
}

/* Usage */
unsigned short _seed[3];
rand_init(_seed);

var = (long)(erand48(_seed) * range);


/******** C++ ********/
mt19937 rnd;
uniform_int_distribution<int> dist;

dist.param(uniform_int_distribution<>::param_type {1, sum});

int num = dist(rnd);
```
