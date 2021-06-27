# pm2

node.js 任务管理，生产环境用。

- [GitHub](https://github.com/Unitech/pm2)

## 安装

```shell
$ npm install pm2 -g
```

## 启动

Start an app using all CPUs available + set a name

```shell
$ pm2 start app.js -i 0 --name "api"
```

```shell
$ pm2 start npm --name "app name" -- start
```

## 停止任务

```shell
$ pm2 stop 0
```

## 删除任务

```shell
$ pm2 delete test
```

### --watch [paths]

文件变化重新启动

## 查看任务

```shell
$ pm2 list
```

## 自启动

- 使用 pm2 启动 node ：# pm2 start /home/wwwroot/web.js --name <name> --watch
- # mkdir -p /var/lock/subsys
- dump 这些进程列表：＃ pm2 save
- 生成自启动脚本：＃ pm2 startup centos
- 赋予权限：＃ chmod +x /etc/init.d/pm2-init.sh
- 添加服务：

### 添加服务

```
＃ chkconfig --add pm2-init.sh
```

如果在 ubuntu 上提示不能用 chkconfig 就换下面的命令

```
# cd /etc/init.d
# update-rc.d pm2-init.sh defaults
```

#### 删除服务

```
# update-rc.d -f pm2-init.sh remove
```

## 日志管理

- 日志存储路径：`~/.pm2/logs/`

### 查看所有日志

```
$ pm2 logs
```

### 查看某个任务的日志

```
$ pm2 logs [id|name]
```

#### 与`bunyan`一起查看日志

- [Can I use "pm2 logs" to view access/out logs also?](https://github.com/Unitech/pm2/issues/422)

查看错误日志

```sh
tail -n 2000 /USER/.pm2/logs/app-err-0.log
```

查看正常日志

```sh
tail -n 2000 /USER/.pm2/logs/app-err-0.log | bunyan
```

### 删除所有日志

```
$ pm2 flush
```
