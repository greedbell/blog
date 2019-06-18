# php 使用 redis

* [phpredis/phpredis](https://github.com/phpredis/phpredis)
* [ukko/phpredis-phpdoc](https://github.com/ukko/phpredis-phpdoc)

## PHP 安装 redis 扩展

[phpredis/phpredis](https://github.com/phpredis/phpredis/releases) 查看版本

```sh
$ wget https://github.com/phpredis/phpredis/archive/3.1.1RC1.tar.gz
$ tar zxvf 3.1.1RC1.tar.gz
$ cd phpredis-3.1.1RC1/                   # 进入 phpredis 目录
$ /usr/local/bin/phpize              # php安装后的路径
$ ./configure --with-php-config=/usr/local/bin/php-config
$ make
$ make test
$ make install
```

php.ini 中添加

```PHP
; redis
extension=redis.so
```

重启 PHP

```sh
/etc/init.d/php-fpm restart
```

## Mac 安装 redis 模块

```sh
brew install --build-from-source php56-redis
```

## 安装代码提示

```sh
composer require --dev ukko/phpredis-phpdoc:dev-master
```

## connect 和 pconnect

* connect：脚本结束之后连接就释放了。
* pconnect：脚本结束之后连接不释放，连接保持在php-fpm进程中。

 所以使用pconnect代替connect，可以减少频繁建立redis连接的消耗。
