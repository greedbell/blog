# Linux + nginx + PHP 环境

* [Unix 系统下的 Nginx 1.4.x](http://php.net/manual/zh/install.unix.nginx.php)

## 步骤

### 1

root 用户登录

### 2

从 [php mirror](http://php.net/get/php-5.6.28.tar.gz/from/a/mirror) 下载 [php-5.6.28](http://cn2.php.net/distributions/php-5.6.28.tar.gz)

### 3

先安装 openssl

```sh
wget http://cn2.php.net/distributions/php-5.6.28.tar.gz
tar zxvf php-5.6.28.tar.gz
cd php-5.6.28
./configure --enable-fpm --with-mysql --with-pdo-mysql --with-openssl --with-zlib --enable-zip --with-curl --enable-intl --enable-mbstring
make
make test
make install
```

安装后

`/usr/local/bin/php-config` 部分内容

```
extension_dir='/usr/local/lib/php/extensions/no-debug-non-zts-20131226'
configure_options=" '--enable-fpm' '--with-mysql' '--with-openssl' '--with-zlib' '--enable-zip' '--with-curl' '--enable-intl'"
```

### 4

#### 配置 php.ini

查看 php.ini 位置

```sh
# php --ini
```

```
Configuration File (php.ini) Path: /usr/local/lib
Loaded Configuration File:         /usr/local/lib/php.ini
Scan for additional .ini files in: (none)
Additional .ini files parsed:      (none)
```

```sh
cp php.ini-development /usr/local/lib/php.ini
```

修改

```sh
vim /usr/local/lib/php.ini
```

```sh
cgi.fix_pathinfo=0
date.timezone = Asia/Shanghai
```

#### 配置 php-fpm.conf

```sh
cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
```

```sh
vim /usr/local/etc/php-fpm.conf
```

修改

```
; Unix user/group of processes
; Note: The user is mandatory. If the group is not set, the default user's group
;       will be used.
user = nobody
group = nobody
```

添加 nobody 群组

```sh
groupadd nobody
```

#### 配置 php-fpm

```sh
cp sapi/fpm/php-fpm /usr/local/bin
```

#### 配置 php 启动脚本

```sh
cp sapi/fpm/init.d.php-fpm.in /etc/init.d/php-fpm
chmod a+x /etc/init.d/php-fpm
```

```sh
vim /etc/init.d/php-fpm
```

```sh
prefix=/usr/local
exec_prefix=${prefix}

php_fpm_BIN=${exec_prefix}/sbin/php-fpm
php_fpm_CONF=${prefix}/etc/php-fpm.conf
php_fpm_PID=${prefix}/var/run/php-fpm.pid
```

### 5 启动 php-fpm

```sh
/etc/init.d/php-fpm start
```

## 不重装PHP安装PHP模块/扩展

以安装 zlib 为例.

得到 `php-config` 路径

```sh
$ command -v php-config
/usr/local/bin/php-config
```

得到 `phpize` 路径

```sh
$ command -v phpize
/usr/local/bin/phpize
```

```sh
$ cd php-5.6.28/ext/zlib
$ cp config0.m4 config.m4
$ /usr/local/bin/phpize
$ ./configure --with-php-config=/usr/local/bin/php-config
$ make
$ make test
$ make install
Installing shared extensions:     /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
```

`/usr/local/php/php.ini` 添加

```
extension = "zlib.so"
```

重启 php

```sh
/etc/init.d/php-fpm restart
```

查看是否生效

```sh
php -m | grep zlib
```

## Questions

### 1

```
checking for location of ICU headers and libraries... not found
configure: error: Unable to detect ICU prefix or no failed. Please verify ICU install prefix and make sure icu-config works.
```

解决方法：

```
yum install -y icu libicu libicu-devel
```

### 2

```
configure: error: xml2-config not found. Please check your libxml2 installation.
```

解决方法：

ubuntu

```
apt-get install libxml2-dev
```

CentOS

```
yum install libxml2-devel
```

### 3

```
error: Unable to detect ICU prefix or no failed. Please verify ICU install prefix and make sure icu-config works.
```

On RedHat/CentOS:

```sh
# yum install libicu-devel
```

On Debian/Ubuntu:

```sh
# apt-get install libicu-dev
```
