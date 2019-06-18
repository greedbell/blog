# mac  安装 PHP7.1

* [Homebrew/homebrew-php](https://github.com/Homebrew/homebrew-php)

删除自带的php

```
$ sudo mv /usr/bin/php /usr/bin/php.back
```

## 安装 nginx

```
$ brew install nginx
```

/usr/local/etc/nginx/nginx.conf 8080 改 80

## 安装 PHP 依赖

```sh
brew install libz
xcode-select --install
```

## 安装 tap

```sh
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
```

## 查看安装参数

```sh
brew options php71
```

## 安装 php

```sh
$ brew install php71 --with-pear --with-debug --with-mssql --with-homebrew-curl --with-imap --with-phpdbg
```

```
The php.ini file can be found in:
    /usr/local/etc/php/7.1/php.ini

✩✩✩✩ PEAR ✩✩✩✩

If PEAR complains about permissions, 'fix' the default PEAR permissions and config:
    chmod -R ug+w /usr/local/opt/php71/lib/php
    pear config-set php_ini /usr/local/etc/php/7.1/php.ini system

✩✩✩✩ Extensions ✩✩✩✩

If you are having issues with custom extension compiling, ensure that
you are using the brew version, by placing /usr/local/bin before /usr/sbin in your PATH:

      PATH="/usr/local/bin:$PATH"

PHP71 Extensions will always be compiled against this PHP. Please install them
using --without-homebrew-php to enable compiling against system PHP.

✩✩✩✩ PHP CLI ✩✩✩✩

If you wish to swap the PHP you use on the command line, you should add the following to ~/.bashrc,
~/.zshrc, ~/.profile or your shell equivalent configuration file:

      export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

✩✩✩✩ FPM ✩✩✩✩

To launch php-fpm on startup:
    mkdir -p ~/Library/LaunchAgents
    cp /usr/local/opt/php71/homebrew.mxcl.php71.plist ~/Library/LaunchAgents/
    launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php71.plist

The control script is located at /usr/local/opt/php71/sbin/php71-fpm

OS X 10.8 and newer come with php-fpm pre-installed, to ensure you are using the brew version you need to make sure /usr/local/sbin is before /usr/sbin in your PATH:

  PATH="/usr/local/sbin:$PATH"

You may also need to edit the plist to use the correct "UserName".

Please note that the plist was called 'homebrew-php.josegonzalez.php71.plist' in old versions
of this formula.

With the release of macOS Sierra the Apache module is now not built by default. If you want to build it on your system
you have to install php with the --with-httpd24 option. See  brew options php71  for more details.

To have launchd start homebrew/php/php71 now and restart at login:
  brew services start homebrew/php/php71
```

配置 php.ini

```sh
vi /usr/local/etc/php/7.1/php.ini
```

```php
date.timezone = Asia/Shanghai
```

加入launchctl启动控制

```sh
mkdir -p ~/Library/LaunchAgents
cp /usr/local/opt/php71/homebrew.mxcl.php71.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php71.plist
```

启动服务

```sh
brew services start homebrew/php/php71
```

停止服务

```sh
brew services stop homebrew/php/php71
```

重启服务

```sh
brew services restart homebrew/php/php71
```

## 安装 php-xdebug

```sh
brew install --build-from-source php71-opcache php71-xdebug
```
