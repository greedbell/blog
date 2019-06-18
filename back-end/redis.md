# redis

* [官网](http://redis.io/)
* [官方文档](https://redis.io/documentation)
* [GitHhb](https://github.com/antirez/redis)
* [node_redis](https://github.com/NodeRedis/node_redis)
* [Redis 命令参考](http://redisdoc.com/)
* [Redis 教程](http://www.runoob.com/redis/redis-tutorial.html)
* [docker redis](https://hub.docker.com/_/redis/)

## 安装

* <http://redis.io/download>

### 安装

```
$ wget http://download.redis.io/releases/redis-3.2.3.tar.gz
$ tar xzf redis-3.2.3.tar.gz
$ cd redis-3.2.3
$ make
```

### ubuntu/CentOS 下安装

```
$ wget http://download.redis.io/releases/redis-3.2.3.tar.gz
$ tar xzf redis-3.2.3.tar.gz
$ cd redis-3.2.3
$ sudo apt-get install make gcc tcl
$ make MALLOC=libc
```

### 测试MM

```
$ make test
```

### 安装

```
$ make install
```

## 配置

```
$ sudo mkdir /etc/redis
$ sudo chmod 777 redis/
$ cp redis.conf /etc/redis/
```

### redis.conf

* [Redis configuration](https://redis.io/topics/config)

* `port` 端口，默认 6379
* `bind` 绑定redis服务器网卡IP，默认 127.0.0.1

## 启动

```
$ redis-server /etc/redis/redis.conf
```

## 开机自启动

```
#设置为开机自启动服务器
chkconfig redisd on
#打开服务
service redisd start
#查看运行状态
service redisd status
#关闭服务
service redisd stop
```

## 设置密码

## 命令

## redis-cli

* [redis-cli, the Redis command line interface](https://redis.io/topics/rediscli)

### 连接远程服务器

 ```sh
redis-cli -h host -p port -a password
 ```

### set string

```SH
SET KEY_NAME VALUE
```

### get string

```sh
GET key
```

### 列出所有 KEY

```sh
KEYS  *
```

### 删除 KEy

```sh
DEL KEY_NAME
```
