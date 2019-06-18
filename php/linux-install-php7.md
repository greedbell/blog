# Linux + nginx + PHP7 环境

* [Unix 系统下的 Nginx 1.4.x](http://php.net/manual/zh/install.unix.nginx.php)

## 步骤

### root 用户登录


### 下载压缩文件

从 [php mirror](http://php.net/get/php-7.1.1.tar.gz/from/a/mirror) 下载 php-7.1.1

### 安装 openssl

### 安装依赖

```sh
yum install libc-client-devel libc-client
ln -s /usr/lib64/libc-client.so /usr/lib/libc-client.so
```

### 安装 PHP

```sh
cd php-7.1.1.tar.gz
./configure --with-libxml-dir --with-openssl  --with-zlib --with-curl --enable-dba --with-imap-ssl  --with-imap --enable-intl --enable-zip --with-pear --with-pdo-mysql --enable-fpm --enable-mbstring  --with-kerberos=/usr

make
make test
make install
```

```log

Installing shared extensions:     /usr/local/lib/php/extensions/no-debug-non-zts-20160303/
Installing PHP CLI binary:        /usr/local/bin/
Installing PHP CLI man page:      /usr/local/php/man/man1/
Installing PHP FPM binary:        /usr/local/sbin/
Installing PHP FPM config:        /usr/local/etc/
Installing PHP FPM man page:      /usr/local/php/man/man8/
Installing PHP FPM status page:   /usr/local/php/php/fpm/
Installing phpdbg binary:         /usr/local/bin/
Installing phpdbg man page:       /usr/local/php/man/man1/
Installing PHP CGI binary:        /usr/local/bin/
Installing PHP CGI man page:      /usr/local/php/man/man1/
Installing build environment:     /usr/local/lib/php/build/
Installing header files:           /usr/local/include/php/
Installing helper programs:       /usr/local/bin/
  program: phpize
  program: php-config
Installing man pages:             /usr/local/php/man/man1/
  page: phpize.1
  page: php-config.1
Installing PEAR environment:      /usr/local/lib/php/
[PEAR] Archive_Tar    - already installed: 1.4.0
[PEAR] Console_Getopt - already installed: 1.4.1
[PEAR] Structures_Graph- already installed: 1.1.1
[PEAR] XML_Util       - already installed: 1.3.0
[PEAR] PEAR           - already installed: 1.10.1
Warning! a PEAR user config file already exists from a previous PEAR installation at '/root/.pearrc'. You may probably want to remove it.
Wrote PEAR system config file at: /usr/local/etc/pear.conf
You may want to add: /usr/local/lib/php to your php.ini include_path
/root/download/php-7.1.1/build/shtool install -c ext/phar/phar.phar /usr/local/bin
ln -s -f phar.phar /usr/local/bin/phar
Installing PDO headers:           /usr/local/include/php/ext/pdo/
```

安装后

`/usr/local/bin/php-config` 部分内容

```
extension_dir='/usr/local/lib/php/extensions/no-debug-non-zts-20160303'
configure_options=" '--with-libxml-dir' '--with-openssl' '--with-zlib' '--with-curl' '--enable-dba' '--with-imap-ssl' '--with-imap' '--enable-intl' '--enable-zip' '--with-pear' '--with-pdo-mysql' '--enable-fpm' '--enable-mbstring' '--with-kerberos=/usr'"
```

### 配置

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

修改 `/usr/local/etc/php-fpm.conf`

```
include=etc/php-fpm.d/*.conf
```

```sh
cp /usr/local/etc/php-fpm.d/www.conf.default /usr/local/etc/php-fpm.d/www.conf
```

修改 `/usr/local/etc/php-fpm.d/www.conf `

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

参考  `/usr/local/bin/php-config`

```sh
prefix=/usr/local
exec_prefix=${prefix}

php_fpm_BIN=${exec_prefix}/sbin/php-fpm
php_fpm_CONF=${prefix}/etc/php-fpm.conf
php_fpm_PID=${prefix}/var/run/php-fpm.pid
```

### 启动 php-fpm

```sh
/etc/init.d/php-fpm start
```

## 不重装PHP安装PHP模块/扩展

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

### 安装 zlib

```sh
$ cd php-7.1.1/ext/zlib
$ cp config0.m4 config.m4
$ /usr/local/bin/phpize
$ ./configure --with-php-config=/usr/local/bin/php-config
$ make
$ make test
$ make install
Installing shared extensions:     /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
```

`/usr/local/lib/php.ini` 添加

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

### 安装 gmp

```sh
$ cd php-7.1.1/ext/gmp
$ cp config0.m4 config.m4
$ /usr/local/bin/phpize
$ ./configure --with-php-config=/usr/local/bin/php-config
$ make
$ make test
$ make install
Installing shared extensions:     /usr/local/lib/php/extensions/no-debug-non-zts-20131226/
```

`/usr/local/lib/php.ini` 添加

```
extension = "gmp.so"
```

重启 php

```sh
/etc/init.d/php-fpm restart
```

查看是否生效

```sh
php -m | grep gmp
```

### Questions

1. configure: error: Unable to locate gmp.h

> yum install -y gmp-devel

2. configure: WARNING: You will need re2c 0.13.4 or later if you want to regenerate PHP parsers.

> yum install -y re2c

## pecl

```sh
pecl install xdebug
pecl install mongodb
pecl install redis
```
