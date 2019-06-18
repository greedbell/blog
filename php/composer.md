# Composer

PHP依赖管理工具

* [官网](https://getcomposer.org/)
* [中文文档](http://docs.phpcomposer.com/)

## 下载 Composer

* [Download Composer](https://getcomposer.org/download/)

```sh
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir="/usr/local/bin/"
php -r "unlink('composer-setup.php');"
```

### Xdebug 警告

如果安装了 Xdebug 会有下面的警告

```
You are running composer with xdebug enabled. This has a major impact on
runtime performance.
```

解决方法

`~/.bash_profile ` 中加入

```
alias composer='php -n /usr/local/bin/composer.phar'
```

运行 ` source ~/.bash_profile`

使用 `composer` 替换 `composer.phar`

## 使用

查看版本

```sh
composer -v
```

查看所有命令

```sh
composer -l
```

不安装开发依赖

```sh
composer install --no-dev
```

## Autoload

* [Composer autoload](https://getcomposer.org/doc/04-schema.md#autoload)
* [Composer autoload 中文](http://docs.phpcomposer.com/01-basic-usage.html#Autoloading)
* [深入 Composer autoload](https://laravel-china.org/topics/1002)

你可以在 composer.json 的 autoload 字段中增加自己的 autoloader。

```JSON
{
    "autoload": {
        "psr-4": {"Acme\\": "src/"}
    }
}
```

添加 autoload 字段后，你应该再次运行 install 命令来生成 vendor/autoload.php 文件。

## Questions

1. You are running composer with xdebug enabled. This has a major impact on runtime performance.

* 参考 <https://segmentfault.com/a/1190000006835525>

composer 不调用任何 php 配置文件

`~/.bashrc` 中添加

```sh
# Without php.ini
alias composer='php -n /usr/local/bin/composer.phar'
```

```sh
source ~/.bashrc
```

```sh
composer -v
```

2. Failed to decode response: zlib_decode(): data error
Retrying with degraded mode, check https://getcomposer.org/doc/articles/troubleshooting.md#degraded-mode for more info

`composer self-update` 后重新安装
