# STL

## map

```c
map<char, string> m {
    {'2', "abc"}, {'3', "def"}, {'4', "ghi"}, {'5', "jkl"}, {'6', "mno"},
    {'7', "pqrs"}, {'8', "tuv"}, {'9', "wxyz"}
};

unordered_map<string, vector<string>> m;
// if (m.count(s) == 0) {
//     m.insert({{s, vector<string>()}});
// }
m[s].push_back(str);
```

## two dimensional vector

```c
vector<vector<int>> tv(len_row, vector<int>(len_col, 0));
```
