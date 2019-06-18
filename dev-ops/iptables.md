# iptables

Linux防火墙

## 查看

```shell
# iptables -L
```

## 开启与关闭

### 重启系统生效

#### 开启

```shell
# chkconfig iptables on
```  

#### 关闭

```shell
# chkconfig iptables off
```  

### 即时生效，重启后失效

#### 开启

```shell
# service iptables start
```  

#### 关闭

```shell
# service iptables stop
```  

## 配置文件

/etc/sysconfig/iptables

## 添加端口

iptables -A INPUT -p tcp -m tcp --dport 3001 -j ACCEPT

service iptables restart
