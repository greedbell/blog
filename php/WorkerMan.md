# WorkerMan

<http://www.workerman.net/>

实现websocket

# 安装
先安装[Composer](http://www.phpcomposer.com/),Composer需要PHP 5.3.2+才能运行。
## Composer安装
```shell
$ curl -sS https://getcomposer.org/installer | php
```
这个命令会将composer.phar下载到当前目录。PHAR（PHP 压缩包）是一个压缩格式，可以在命令行下直接运行。
你可以使用--install-dir选项将Composer安装到指定的目录，例如：

```shell
$ curl -sS https://getcomposer.org/installer | php -- --install-dir=bin
```
当然也可以进行全局安装：

```shell
$ curl -sS https://getcomposer.org/installer | php
$ mv composer.phar /usr/local/bin/composer
```
在Mac OS X下也可以使用homebrew安装：

```shell
brew tap josegonzalez/homebrew-php   brew install josegonzalez/php/composer
```
不过通常情况下只需将composer.phar的位置加入到PATH环境变量就可以，不一定要全局安装。

## Workerman安装
```shell
composer require workerman/workerman
```
workerman会被安装在`vendor/workerman/workerman`

```shell
cd vendor/workerman
```

## websocket服务

`server.php`

```php
<?php
use Workerman\Worker;
require_once './workerman/Autoloader.php';

// Create a Websocket server
$ws_worker = new Worker("websocket://0.0.0.0:2346");

// 4 processes
$ws_worker->count = 4;

// Emitted when new connection come
$ws_worker->onConnect = function($connection)
{
    echo "New connection\n";
 };

// Emitted when data received
$ws_worker->onMessage = function($connection, $data)
{
    // Send hello $data
    $connection->send('hello ' . $data);
};

// Emitted when connection closed
$ws_worker->onClose = function($connection)
{
    echo "Connection closed\n";
};

// Run worker
Worker::runAll();

```
## 启动服务

```shell
php server.php start // debug调试模式，用于开发调试问题，当终端关闭后Workerman会随之关闭。
php server.php start -d // daemon守护进程模式，终端关闭不会影响Workerman。
php server.php stop
php server.php restart
php server.php reload
```
## 客户端请求

client.php

```php
<?php
use Workerman\Worker;
$worker = new Worker('tcp://0.0.0.0:1234');
$worker->count=3;
$worker->onMessage = function($connection, $data)
{
    $connection->send("HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nServer: workerman\1.1.4\r\n\r\nhello");
};
Worker::runAll();
```
