```sh
hb do_init_module
hb do_one_initcall

add-symbol-file test_mods/e1000/iso_e1000.ko 0xffffffffc05f2000 -s .callgate.text 0xffffffffc05f1000
add-symbol-file test_mods/e1000/iso_e1000.ko -s .text 0xffffffffc055d000

add-symbol-file test_mods/dummy_net/iso_dummy.ko 0xffffffffc0583000 -s .callgate.text 0xffffffffc0582000

hb dummy_get_stats64_callgate
hb dummy_dev_init_callgate
```
