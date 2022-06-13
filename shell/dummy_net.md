> REF: https://wiki.networksecuritytoolkit.org/index.php/Dummy_Interface

```bash
# Create interface (may ignore, since iso_dummy0 is already set)
sudo ip link add iso_dummy1 type iso_dummy

# Bind IP address
sudo ip addr add 13.14.11.11 dev iso_dummy0

# Bring interface up
sudo ip link set iso_dummy0 up

# Unbind interface
sudo ifconfig iso_dummy0 down

# Set route
sudo ip route add 11.11.11.11 dev iso_dummy0
# Then test with 
iperf -u -c 11.11.11.11
```
