# iperf 2

## Server Side

```sh
iperf -s
# Options:
#	-m			print MSS/MTU (Max Segment Size/Max Transmission Unit)
#	-M <num>	set MSS to <num>
```

## Client Side

```sh
iperf -c <server-ip>
# Options:
#	-u			UDP mode, even do not need server (no ack)
```
