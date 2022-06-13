# GIT

```sh
# Set config
git config --global http.proxy http://<username>:<password>@<ip>:<port>

# Clear config
git config --global --unset http.proxy

# Test config
git config --global --get http.proxy

# FIX: loose object is corrupt
find .git/objects/ -size 0 -exec rm -f {} \;
git fetch origin

# No Fast Forward (Create a new commit node even without any confilct)
git merge --no-ff <branch>
```
