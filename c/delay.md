```c
long rdtscp() {
        unsigned long lo, hi;
        asm volatile("rdtsc": "=a"(lo), "=d"(hi));
        return (hi << 32 | lo);
}

void delay(unsigned long cycles) {
	unsigned long s, t;

	if (cycles == 0)
		return;
	s = rdtscp();
	while (1) {
		t = rdtscp();
		if (t > s + cycles)
			break;
	}
}
```
