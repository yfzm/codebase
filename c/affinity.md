```c
#include <pthrad.h>
#include <sched.h>

/* Bind current thread to CPU 0 */
cpu_set_t cpuset;
CPU_ZERO(&cpu_set);
CPU_SET(0, &cpu_set);
sched_setaffinity(pthread_self(), sizeof(cpuset), &cpuset);
```
