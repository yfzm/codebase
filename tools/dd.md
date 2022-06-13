# dd

```sh
dd if=/dev/zero of=image.img iflag=fullblock bs=1M count=100 && sync

dd if=/dev/urandom of=rand.img bs=1G count=5 iflag=fullblock
```
