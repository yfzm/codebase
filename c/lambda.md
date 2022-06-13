> ref: https://docs.microsoft.com/en-us/cpp/cpp/lambda-expressions-in-cpp

```c
[=] () mutable throw() -> int {
    int n = x + y;

    x = y;
    y = n;

    return n;
}


auto cmp = [](string left, string right) {
    return left + right > right + left;
};
sort(str.begin(),str.end(), cmp);
```
