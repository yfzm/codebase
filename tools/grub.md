```bash
# Install required packages
sudo apt install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison

# Show installed kernels
grep -E "^\\s*(menuentry|submenu) " /boot/grub/grub.cfg

# Build and install kernel
make -jN
sudo make moudules_install
sudo make install

# Update grub config
sudo vim /etc/default/grub
sudo update-grub

# Error: No rule to make target '***.pem', needed by 'certs/x509_certificate_list'. Stop.
# Solution: Commenting out the `CONFIG_SYSTEM_TRUSTED_KEYS` line from `.config`
sed -ri '/CONFIG_SYSTEM_TRUSTED_KEYS/s/=.+/=""/g' .config

# Strip unused modules
cd /lib/modules/<new_kernel>
find . -name *.ko -exec strip --strip-unneeded {} +
sudo update-initramfs -u -k <new_kernel>
sudo update-grub2
```
