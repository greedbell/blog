
# Mac 下配置 PHP 环境

## 准备

关闭系统自带的apache

```
$ sudo apachectl stop
```

如果你的apache已经加入了launchctl，使用下面的命令来关闭

```
$ sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
```

删除自带的php

```
$ sudo rm -r /usr/bin/php
```

## nginx

```
$ brew install nginx

Docroot is: /usr/local/var/www

The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
nginx can run without sudo.

nginx will load all files in /usr/local/etc/nginx/servers/.

To have launchd start nginx now and restart at login:
  brew services start nginx
Or, if you don't want/need a background service you can just run:
  nginx
```

/usr/local/etc/nginx/nginx.conf 8080 改 80

运行 nginx

```sh
$ sudo nginx  #打开 nginx
$ sudo nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
$ sudo nginx -t   #测试配置是否有语法错误
```

加入launchctl启动控制


```sh
mkdir -p ~/Library/LaunchAgents
cp /usr/local/opt/nginx/homebrew.mxcl.nginx.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
```

## php

* [Homebrew/homebrew-php](https://github.com/Homebrew/homebrew-php)

brew 默认没有 php 安装包：

```sh
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
```

查看安装参数

```sh
brew options php56
```

安装 php

```sh
brew install php56 --with-imap --with-debug --enable-opcache

The php.ini file can be found in:
    /usr/local/etc/php/5.6/php.ini
```

配置 php.ini

```php
date.timezone = Asia/Shanghai
```

加入launchctl启动控制

```sh
mkdir -p ~/Library/LaunchAgents
cp /usr/local/opt/php56/homebrew.mxcl.php56.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php56.plist
```

启动服务

```sh
brew services start homebrew/php/php56
```

停止服务

```sh
brew services stop homebrew/php/php56
```

重启服务

```sh
brew services restart homebrew/php/php56
```

### 安装 php-xdebug

```sh
brew install --build-from-source php56-opcache
brew install --build-from-source php56-xdebug

* /usr/local/etc/php/5.6/conf.d/ext-xdebug.ini was created,
  do not forget to remove it upon extension removal.
* Validate installation via one of the following methods:
*
* Using PHP from a webserver:
* - Restart your webserver.
* - Write a PHP page that calls "phpinfo();"
* - Load it in a browser and look for the info on the xdebug module.
* - If you see it, you have been successful!
*
* Using PHP from the command line:
* - Run `php -i "(command-line 'phpinfo()')"`
* - Look for the info on the xdebug module.
* - If you see it, you have been successful!
```

### PhpStorm 设置 Servers

设置运行、调试时用的服务
```
PhpStorm > Preferences > Language & Frameworks > Servers
```

端口必须是空闲的

### PhpStorm 开始调试

```
PhpStorm > Run > Edit Configurations > + > PHP Web Application`
```


#### Questions

问题

Cannot load Xdebug - it was built with configuration API220131226,NTS, whereas running engine is API220131226,NTS,debug

解决方法

* 参考 <https://github.com/Homebrew/homebrew-php/issues/1320>

```sh
brew reinstall --build-from-source php56-opcache
brew reinstall --build-from-source php56-xdebug
```

### 安装 php-fpm

## Reference

* [Mac OS使用brew安装Nginx、MySQL、PHP-FPM的LAMP开发环境](https://segmentfault.com/a/1190000002963355)
