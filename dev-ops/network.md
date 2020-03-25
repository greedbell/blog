# 网络相关命令

## netperf

网络性能测试

```sh
# server
service netperf start

# client
# 测试tcp吞吐
netperf -t TCP_STREAM -H ip_of_server -l 10
```

## iperf

测试带宽

```sh
# server
iperf -s

# client
iperf -c ip_of_server
```

## netcat

```sh
# server
nc -l -p 22222 < /dev/zero

# client
nc ip_of_server 22222 > | pv
```

## nmap

扫描 IP 端口等信息

```sh
nmap -v -sn 172.16.1-254.1-254
```

ping 172.16.1.1 到 172.16.254.254 范围内的所有 IP

## References

* [netperf 与网络性能测量](https://www.ibm.com/developerworks/cn/linux/l-netperf/)
* [通过netcat或iperf测试网络带宽](https://blog.tankywoo.com/linux/2014/03/18/test-bandwidth-by-netcat.html)
