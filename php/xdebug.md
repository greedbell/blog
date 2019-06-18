# Xdebug

* [官网](https://xdebug.org/)
* [官方文档](https://xdebug.org/docs/all)
* [PHP调试工具-Xdebug](http://guojianxiang.com/posts/2015-09-06-PHP_Debug_Tool-Xdebug.html)
* [XDebug Helper for Google Chrome](https://github.com/mac-cain13/xdebug-helper-for-chrome)
* [Remote Debugging](https://xdebug.org/docs/remote)

## 安装

### mac 环境

```sh
brew install php56-xdebug
```

php xdebug 相关的配置被存储在 `/usr/local/etc/php/5.6/conf.d/ext-xdebug.ini`

### centos 环境

```sh
# pecl install xdebug
Build process completed successfully
Installing '/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so'
install ok: channel://pecl.php.net/xdebug-2.5.0
configuration option "php_ini" is not set to php.ini location
You should add "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" to php.ini
```

## 配置

php.ini

```PHP
zend_extension=xdebug.so

;允许远程IDE调试
xdebug.remote_enable = 1

;与许远程IDE连接方式
xdebug.remote_handler = "dbgp"

;远程调试时此处填写IDE所在客户机ip地址(允许调试的客户端IP)
xdebug.remote_host=localhost

;多人进行远程调试，将尝试连接到发出HTTP请求的客户端,开启后 remote_host 失效
;xdebug.remote_connect_back=1

;xdebug服务器回调客户端的端口，默认 9000，如果本机开着php并运行在9000端口上，应该换一个端口
xdebug.remote_port = 9001
xdebug.idekey = PHPSTROM

;远程调试日志
xdebug.remote_log="/var/log/xdebug/remote.log"
```

重启 PHP

```sh
/etc/init.d/php-fpm restart
```

## PhpStorm 配置

1. `Preferences > Languages & Frameworks > PHP > DEBUG`: Xdebug : Debug port 设为 9001
2. `Preferences > Languages & Frameworks > PHP > DEBUG > DBGp proxy`： `IDE key` 设为 `PHPSTORM`,`Host` 设为 需要调试的服务的 Host，`Port` 设为 需要调试的服务的端口
3. `Preferences > Languages & Frameworks > PHP > Servers > `: 添加远程服务地址，勾上 `Use path mappings`,指定本文件对应远程文件路径。
4. 两种方法
> 方法一. `Run > Edit Configurations > + > PHP Remote Debug`: 1. 设置 Name，2. 选择刚创建的 Server, 3. `ide key` 设为 `PHPSTORM`
>
> 方法二. `Run > Edit Configurations > + > PHP Web Application`: 1. 设置 Name，2. 选择刚创建的 Server, 3. `Start URL` 设为 `/`
5. `Run > Start Listening for PHP Debug Connections` 开始监听
6. PhpStorm 中添加断点
7. 浏览器打开需要调试的站点 并带上 `XDEBUG_SESSION_START=<session name>`

eg: <http://wftmaterialapibell.greedlab.com/?XDEBUG_SESSION_START=1112>

### curl 使用 xdebug

```sh
curl -i -X POST -d '{"some":"data"}' http://your-local-domain -b XDEBUG_SESSION=PHPSTORM
```
