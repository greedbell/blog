# Mac 安装 Mysql

* [Download MySQL Community Server](https://dev.mysql.com/downloads/mysql/)

## 安装

```sh
$ brew install mysql
Updating Homebrew...
==> Downloading https://homebrew.bintray.com/bottles/mysql-5.7.17.sierra.bottle.1.tar.gz
######################################################################## 100.0%
==> Pouring mysql-5.7.17.sierra.bottle.1.tar.gz
==> Using the sandbox
==> Caveats
We've installed your MySQL database without a root password. To secure it run:
    mysql_secure_installation

To connect run:
    mysql -uroot

To have launchd start mysql now and restart at login:
  brew services start mysql
Or, if you don't want/need a background service you can just run:
  mysql.server start
==> Summary
🍺  /usr/local/Cellar/mysql/5.7.17: 321 files, 234.4M
```

## 启动 mysql

```sh
brew services start mysql
brew services restart mysql
```

## 自启动

```sh
mkdir -p ~/Library/LaunchAgents
cp /usr/local/Cellar/mysql/5.7.17/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```

## 设置 root 密码

```sh
mysql_secure_installation
```

## 修改 root 密码

```sh
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass4!';
```

## 配置 mysql

查看配置文件路径

```sh
$ mysql --help | grep my.cnf
Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf /usr/local/etc/my.cnf ~/.my.cnf
The following groups are read: mysql client
```

参考配置文件路径

```sh\
ls $(brew --prefix mysql)/support-files/my-*
```

拷贝配置文件到有效路径

```sh
cp $(brew --prefix mysql)/support-files/my-default.cnf /usr/local/etc/my.cnf
```

## Questions

### 1 没有 mysql 数据库

清除mysql 数据，重新安装

```sh
brew uninstall mysql
rm -rf /usr/local/Cellar/mysql
rm -rf /usr/local/var/mysql
sudo rm -rf /tmp/mysql.sock*
brew install mysql
```
