# PHP

* [官网](http://www.php.net/)
* [官方手册](http://php.net/manual/zh/)
* [PHP-FPM](http://php-fpm.org/)

## 一些说明

### CGI

* 协议
* CGI是为了保证web server传递过来的数据是标准格式的，方便CGI程序的编写者。

### Fastcgi

* 协议
* Fastcgi是用来提高CGI程序性能的。

### php-cgi

PHP的解释器。php-cgi只是个CGI程序，他自己本身只能解析请求，返回结果，不会进程管理

### PHP-FPM

* 实现了 Fastcgi 协议
* 调度 php-cgi 进程的程序

### php-cli

命令行方式执行 php

```php
$ php test.php
```

## PHP 语法

### variables

* PHP 中全局变量在函数中使用时必须声明为 global

### object

* extends 继承 类(class) 或者 接口(interface)，只可继承一个类，但可以继承多个接口
* implements 实现 接口(interface)

### Heredoc

```php
$str = <<<EOT
My name is "$name". I am printing some $foo->foo.
Now, I am printing some {$foo->bar[1]}.
This should print a capital 'A': \x41
EOT;
```

Heredoc 结构就象是没有使用双引号的双引号字符串，这就是说在 heredoc 结构中单引号不用被转义,不可以用在任意的静态数据环境中

### Nowdoc

```php
public $var = <<<'EOD'
Example of string
spanning multiple lines
using nowdoc syntax.
EOD;
```

Nowdoc 结构是类似于单引号字符串的,可以用在任意的静态数据环境中，最典型的示例是用来初始化类的属性或常量

### public,private,protected的区别

* public:权限是最大的，可以内部调用，实例调用等。
* protected: 受保护类型，用于本类和继承类调用。
* private: 私有类型，只有在本类中使用。

###  回调

* <https://old-oomusou.goodjack.tw/php/closure/>

#### 匿名函数

没有指定名称的函数

#### Closure

也叫闭包, 用 `匿名函数` 做参数

#### Callback

伪类型,利用 Closure 实现回调

#### Callable

* [Callable 官方文档](http://php.net/manual/zh/language.types.callable.php)

* is_callable

伪类型,替代 Callback，支持以下四种格式

* method string
* closure
* [Class,method string]
* [object,method string]

调用 callable

* call_user_func($callable);
* call_user_func_array($callable, [par1,par2]);

```php

/**
* The callable types and normalizations are given in the table below:
*
*  Callable                        | Normalization                   | Type
* ---------------------------------+---------------------------------+--------------
*  function (...) use (...) {...}  | function (...) use (...) {...}  | 'closure'
*  $object                         | $object                         | 'invocable'
*  "function"                      | "function"                      | 'function'
*  "class::method"                 | ["class", "method"]             | 'static'
*  ["class", "parent::method"]     | ["parent of class", "method"]   | 'static'
*  ["class", "self::method"]       | ["class", "method"]             | 'static'
*  ["class", "method"]             | ["class", "method"]             | 'static'
*  [$object, "parent::method"]     | [$object, "parent::method"]     | 'object'
*  [$object, "self::method"]       | [$object, "method"]             | 'object'
*  [$object, "method"]             | [$object, "method"]             | 'object'
* ---------------------------------+---------------------------------+--------------
*  other callable                  | idem                            | 'unknown'
* ---------------------------------+---------------------------------+--------------
*  not a callable                  | null                            | false
*
* If the "strict" parameter is set to true, additional checks are
* performed, in particular:
*  - when a callable string of the form "class::method" or a callable array
*    of the form ["class", "method"] is given, the method must be a static one,
*  - when a callable array of the form [$object, "method"] is given, the
*    method must be a non-static one.
*
*/
```

#### 打印

* echo 输出一个或者多个字符串或变量值
* print()用于输出一个或多个字符串或变量值的信息。它只能打印出简单类型变量的值(如int,string)，不能打印数组和对象。
* var_export()函数用于输出或返回一个变量的字符串表示。
* var_dump()函数用于显示关于一个或多个表达式的结构信息，包括表达式的类型与值。

### other

* [指令分隔符](http://php.net/manual/zh/language.basic-syntax.instruction-separation.php) 文件末尾的 PHP 代码段结束标记可以不要，有些情况下当使用 include 或者 require 时省略掉会更好些，这样不期望的空白符就不会出现在文件末尾，之后仍然可以输出响应标头。在使用输出缓冲时也很便利，就不会看到由包含文件生成的不期望的空白符。
* [require](http://php.net/manual/zh/function.require.php) require 和 include 几乎完全一样，除了处理失败的方式不同之外。require 在出错时产生 E_COMPILE_ERROR 级别的错误。换句话说将导致脚本中止而 include 只产生警告（E_WARNING），脚本会继续运行。

## 加密

* [密码散列安全](http://php.net/manual/zh/faq.passwords.php)
* [password_hash](http://php.net/manual/zh/function.password-hash.php) 创建密码的哈希
* [password_verify](http://php.net/manual/zh/function.password-verify.php) 验证密码是否和哈希匹配

## 类型比较

* [PHP 类型比较表](http://php.net/manual/zh/types.comparisons.php)
* [比较运算符](http://php.net/manual/zh/language.operators.comparison.php)

## Reference

* [在2016 年做PHP 开发是一种什么样的体验？（一） - V2EX](https://www.v2ex.com/t/312651)
