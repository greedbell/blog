# laravel

* [官网](https://laravel.com/)
* [官方文档](https://laravel.com/docs)
* [中文文档](https://laravel-china.org/docs/home)

目录

<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [laravel](#laravel)
  * [搭建环境](#搭建环境)
    * [安装依赖](#安装依赖)
    * [新建工程](#新建工程)
  * [中间件](#中间件)
  * [路由](#路由)
  * [PhpStorm](#phpstorm)
    * [IntelliJ IDEA / PhpStorm Laravel Plugin](#intellij-idea-phpstorm-laravel-pluginhttpsgithubcomhaehnchenidea-php-laravel-plugin)
    * [barryvdh/laravel-ide-helper](#barryvdhlaravel-ide-helperhttpsgithubcombarryvdhlaravel-ide-helper)
    * [PhpStorm Laravel Live Templates](#phpstorm-laravel-live-templateshttpsgithubcomkoomaiphpstorm-laravel-live-templates)
  * [artisan 命令](#artisan-命令)
  * [调试](#调试)

<!-- tocstop -->

## 搭建环境

### 安装依赖

* PHP >= 5.6.4
* OpenSSL PHP Extension
* PDO PHP Extension
* Mbstring PHP Extension
* Tokenizer PHP Extension
* XML PHP Extension

### 新建工程

安装 laravel

```sh
composer global require "laravel/installer"
```

添加 laravel 到环境变量:

把 `export PATH="$PATH:$HOME/.composer/vendor/bin" # Add composer to PATH for scripting` 添加到 ~/.bashrc

新建工程

```sh
composer create-project --prefer-dist laravel/laravel blog
```

## 中间件

* 构造方法 `__construct(Application $app, Encrypter $encrypter)`
* 运行方法 `handle($request, Closure $next, $guard = null)`

## 路由

在路由中可使用冒号 : 来区隔中间件名称与指派参数，多个参数可使用逗号作为分隔：

## PhpStorm

* [Laravel Development using PhpStorm](https://blog.jetbrains.com/phpstorm/2015/01/laravel-development-using-phpstorm/)
* [Laravel Development using PhpStorm](https://confluence.jetbrains.com/display/PhpStorm/Laravel+Development+using+PhpStorm)

### [IntelliJ IDEA / PhpStorm Laravel Plugin](https://github.com/Haehnchen/idea-php-laravel-plugin/)

laravel PhpStorm 插件

### [barryvdh/laravel-ide-helper](https://github.com/barryvdh/laravel-ide-helper)

PhpStorm 支持 laravel 语法

安装依赖

```bash
composer require --dev barryvdh/laravel-ide-helper
```

`app/Providers/AppServiceProvider.php` 添加

```PHP
public function register()
{
    if ($this->app->environment() !== 'production') {
        $this->app->register(\Barryvdh\LaravelIdeHelper\IdeHelperServiceProvider::class);
    }
    // ...
}
```

到 `providers` 最后

* 为 Laravel Facades 生成自动提示文档。 生成 `_ide_helper.php`

```bash
php artisan ide-helper:generate
```

* 为 Laravel 模型 生成自动提示文档

```bash
# 先安装dbal
composer require doctrine/dbal
php artisan ide-helper:models Post
```

生成 `.phpstorm.meta.php` 添加提示

```sh
php artisan ide-helper:meta
```

### [PhpStorm Laravel Live Templates](https://github.com/koomai/phpstorm-laravel-live-templates)

模板

## artisan 命令

`php artisan tinker` 进入命令行

## 调试

* [Laravel Debugbar](https://github.com/barryvdh/laravel-debugbar)

安装后只能在网页上看可视化的调试信息。API 方式的请求日志可以打开 `storage/debugbar/` 文件夹下的日志文件，格式化后查看
