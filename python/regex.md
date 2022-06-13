```python
import re

pattern = re.compile(r'^(.*)\((.*)\)')

# `match` searches only from beginning
m = pattern.match("test_string(test, test)")

# `search` searches the whole string
m = pattern.search("test_string(test, test)")

"""
m is None if mismatch
m.group(0) returns the whole match
m.group(N) returns the Nth group match
"""
```
