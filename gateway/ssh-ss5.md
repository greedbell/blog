# ssh方式实现ss5代理

该方法简单，且不需要远程服务器做任务配置，有ssh权限就行。很适合有ssh权限的虚拟主机。eg:`bluehost`

## 修改Host

`localhost`对应IP改成`0.0.0.0`，这样局域网内其它IP可以连上本机架设的代理

```
#127.0.0.1	localhost
0.0.0.0	localhost
```

## 建立互信

拷贝本地的`id_rsa.pub`到远程服务器的`authorized_keys`

## 启动ss5代理

```
$ ssh -D 0.0.0.0:$AUTO_SSH_PORT -p22 -N $AUTO_SSH_USER@$AUTO_SSH_ADDRESS
```

## 查看代理是否生效

```shell
$ netstat -AaLlnW | grep $AUTO_SSH_PORT
```

或者

```shell
$ lsof -i :$AUTO_SSH_PORT
```

## 定时任务

> 上面方法架的代理服务,如果一段时间没有任务包传输ssh会自动断开，导致代理服务停止，所以需要建立定时任务，定时检测连接是否断开，如果断开就重新连接。

* 启动代理的脚本: [Resource/autossh.sh](Resource/autossh.sh).
使用前先设好`AUTO_SSH_ADDRESS`和`AUTO_SSH_USER`.并拷贝到`~/bin`目录下

添加定时任务

```shell
$ crontab -e
```

```
#second hour    day     month   week    commond
*/10   *       *       *       *       /Users/[username]/bin/autossh.sh >> /Users/[username]/log/ss5.log 2>&1
```

## 停止代理

```shell
$ ps -ef | grep ssh
$ kill -9 $PID_NUM
```

`$PID_NUM`为对应ssh -d 的进程id

## 使用代理

### Firefox

Firefox > 设置 > 高级 > 网络 > 连接 > 设置 > 手动配置代理 > SOCKS 主机：localhost, 端口：$AUTO_SSH_PORT，勾选 SOCKS v5 > 确定

### MAC

设置 > 网络 > 高级 > 代理 > SOCKS 代理 > SOCKS 代理服务器：localhost, 端口：$AUTO_SSH_PORT，不要设用户名密码 > 确定
