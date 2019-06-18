# ubuntu 安装 mysql

<http://dev.mysql.com/downloads/mysql/> 下载APT Repo 或 deb 包

```sh
wget http://dev.mysql.com/get/mysql-apt-config_0.8.1-1_all.deb
```

安装所得 deb 包

```sh
dpkg -i mysql-apt-config_0.8.1-1_all.deb
```

安装 mysql

```sh
apt-get update
apt-get install mysql-server
```
