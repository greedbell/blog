# CentOS 下安装 ss5

## 下载

<https://www.inet.no/dante/download.html>

## 配置

<http://www.inet.no/dante/doc/latest/config/index.html>

## 安装

```shell
wget https://www.inet.no/dante/files/dante-1.4.1.tar.gz
tar zxvf dante-1.4.1.tar.gz
cd dante-1.4.1
./configure
make
make install
```

```
/etc/sockd.conf
```

## 查看端口占用情况

```
netstat -lp
kill -0 [pid]
```
## 关闭进程

```
killall sockd
```
# 连不上啊
