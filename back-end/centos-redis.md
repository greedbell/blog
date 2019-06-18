# CentOS 安装 redis

```sh
yum install redis
```

配置文件路径：`/etc/redis.conf`

## 开机自启动

```
#设置为开机自启动服务器
chkconfig redis on
#打开服务
service redis start
#查看运行状态
service redis status
#关闭服务
service redis stop
```
