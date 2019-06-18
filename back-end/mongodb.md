# mongodb

* [官网](https://www.mongodb.com/)
* [官方文档](https://docs.mongodb.com/manual/)
* [官方下载](https://www.mongodb.com/download-center)
* [安装](https://docs.mongodb.com/manual/installation/)

## 官方工具

* [MongoDB Enterprise Advanced](https://www.mongodb.com/zh/products/mongodb-enterprise-advanced) MongoDB 企业版
* [MongoDB Professional](https://www.mongodb.com/products/mongodb-professional) MongoDB 专业版
* [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) 在线MongoDB，收费
* [MongoDB Ops Manager](https://www.mongodb.com/products/ops-manager) 可本地安装的 MongoDB 监控工具
* [MongoDB Cloud Manager](https://www.mongodb.com/cloud/cloud-manager) MongoDB 云端监控工具，收费
* [MongoDB Compass](https://www.mongodb.com/products/compass) 图形界面管理探索和操纵你的MongoDB。
* [MongoDB Connector for BI](https://www.mongodb.com/products/bi-connector) 在线分析和数据挖掘
* [MongoDB Connector for Apache Spark](https://www.mongodb.com/products/spark-connector) Spark 连接器。

## mac 下安装社区版

```
$ brew install mongodb --with-openssl
```

### 自启动

```sh
cp $(brew --prefix mongodb)/homebrew.mxcl.redis.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

## ubuntu 安装企业版

* [Install MongoDB Enterprise on Ubuntu](https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-on-ubuntu/?_ga=1.215756126.83439519.1470730476#install-mongodb-enterprise)

## CentOS 安装企业版

* [Install MongoDB Enterprise on Red Hat Enterprise or CentOS¶](https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-on-red-hat/)

## 配置

* <https://docs.mongodb.com/manual/administration/configuration-and-maintenance/>

* 默认配置文件路径 `/etc/mongod.conf`

### 用户

* <https://docs.mongodb.com/manual/tutorial/create-users/>

#### 创建用户

```
mongo
use admin
db.createUser(
  {
    user: "myUserAdmin",
    pwd: "abc123",
    roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
  }
)
```

#### 登录用户

```
mongo
use admin
db.auth("myUserAdmin", "abc123" )
```

## mongodb

* [manage-mongodb-processes](https://docs.mongodb.com/manual/tutorial/manage-mongodb-processes/)

### 启动

```shell
./bin/mongod --dbpath ~/mongodb/db --fork --logpath ~/mongodb/log/mongodb.log --logappend
```

### 查看状态

```shell
$ ./bin/mongostat
```

### 关闭

```shell
$ ./bin/mongo
> use admin
> db.shutdownServer()
```

或

```shell
$ ./bin/mongod --shutdown
```

> available only on Linux systems

## mongo shell

* [The mongo Shell](https://docs.mongodb.com/manual/mongo/)

### 进入命令行模式

```shell
$ cd <mongodb installation dir>
$ ./bin/mongo
```

### 创建数据库

```shell
use <db_name>
```

### 查看所有的 collection

```shell
show collections
```

### 查看 collection 所有数据

```shell
db.foo.find()
```

foo 为对应 collection 名字

## Questions

### 1 启动警告

```
2016-12-13T13:58:04.601+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/enabled is 'always'.
2016-12-13T13:58:04.601+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
2016-12-13T13:58:04.601+0800 I CONTROL  [initandlisten]
2016-12-13T13:58:04.601+0800 I CONTROL  [initandlisten] ** WARNING: /sys/kernel/mm/transparent_hugepage/defrag is 'always'.
2016-12-13T13:58:04.601+0800 I CONTROL  [initandlisten] **        We suggest setting it to 'never'
```

解决方法：

/etc/rc.local 中写入

```
if test -f /sys/kernel/mm/transparent_hugepage/enabled; then  
   echo never > /sys/kernel/mm/transparent_hugepage/enabled  
fi  
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then  
   echo never > /sys/kernel/mm/transparent_hugepage/defrag  
fi  
```

### 2 最大文件数太小

```
** WARNING: soft rlimits too low. rlimits set to 1024 processes, 100000 files. Number of processes should be at least 50000 : 0.5 times number of files.
```

解决方法：

参考 [Recommended ulimit Settings](https://docs.mongodb.com/manual/reference/ulimit/#recommended-ulimit-settings)

```
ulimit -n 64000
ulimit -u 64000
```

### 3

```
** WARNING: Access control is not enabled for the database.
**          Read and write access to data and configuration is unrestricted.
```

解决方法：

参考 [ security.authorization](https://docs.mongodb.com/v3.2/reference/configuration-options/#security.authorization)

/etc/mongod.conf 配置：

```
security:
  authorization: enabled
```
