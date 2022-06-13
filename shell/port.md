```bash
# Show port are occupied by which process
sudo netstat -tunlp | grep <port num>
	# -t: tcp only
	# -u: udp only
	# -n: no alias (all number)
	# -l: listening only
	# -p: show program
```
