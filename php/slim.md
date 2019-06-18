# Slim

PHP 微型框架，适用于 Restfull API

* [GitHub](https://github.com/slimphp/Slim)
* [官网](http://www.slimframework.com/)
* [官方文档](https://www.slimframework.com/docs/)
* [中文网](http://www.slimphp.net/)
* [中文文档](http://www.slimphp.net/docs/)
* [awesome](https://github.com/xssc/awesome-slim)

## 路由

* [容器识别](http://www.slimphp.net/docs/objects/router.html#container-resolution)

会先判断 `is_callable`， 如果不可以以 callback 方式调用，就用 `容器识别`

## 中间件

* 中间件先执行后添加的
* 会先判断 `is_callable`， 如果不可以以 callback 方式调用，就用 `容器识别`

### DAO

* Migrate Up 迁移
* Migrate Down 回滚

#### 相关库

* [Eloquent](https://laravel.com/docs/5.3/eloquent) 进行数据库相关操作，建立模型后用脚本很容易生成 `CRUD`
* [illuminate/database](https://github.com/illuminate/database)
* [slim-eloquent](https://github.com/kladd/slim-eloquent)
* [Slim-PDO](https://github.com/FaaPz/Slim-PDO) 数据库操作
* [robmorgan/phinx](https://github.com/robmorgan/phinx) 数据迁移填充

#### 总结

* [How to use Eloquent ORM migrations outside Laravel](https://siipo.la/blog/how-to-use-eloquent-orm-migrations-outside-laravel)

用 Eloquent 的 Model 进行数据库操作。Eloquent 的 迁移填充功能在 laravel 才可以用，所以用 phinx 实现迁移填充功能

### other

* [slim-jwt-auth](https://github.com/tuupola/slim-jwt-auth) json web token
* [slim-json-api](https://github.com/entomb/slim-json-api) 输出json格式字符串

## Eloquent

先参考 [laravel Installation](https://laravel.com/docs/5.3/installation) 安装 `laravel`，并创建 laravel 工程

```sh
composer global require "laravel/installer"
composer create-project --prefer-dist laravel/laravel laravel_demo
```

进入 laravel_demo 创建模板

```sh
cd laravel_demo
php artisan make:model Flight
```

* migrate 数据迁移
* seed 数据填充

## Cookies

* [Cookies](https://www.slimframework.com/docs/start/upgrade.html#cookies)

使用 [FIG Cookies](https://github.com/dflydev/dflydev-fig-cookies) 管理 Cookies

## Reference

* [Slim容器分析](http://duranchen.github.io/2016/08/06/Slim%E5%AE%B9%E5%99%A8%E7%9A%84%E5%AE%9E%E7%8E%B0/)

## Questions

### PhpStorm 中容器没有代码提示

参考

* [PhpStorm Container Interop Code Completion](https://xtreamwayz.com/blog/2015-12-14-phpstorm-container-interop-code-completion)
* [PhpStorm Advanced Metadata](https://confluence.jetbrains.com/display/PhpStorm/PhpStorm+Advanced+Metadata)
