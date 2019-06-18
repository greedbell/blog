# PhpStorm

* 选择 PHP 版本: `Preferences > Language & Frameworks > PHP > PHP language level: 5.6`
* 选择 PHP 解释器: `Preferences > Language & Frameworks > Interpreter > PHP language level: 5.6`

## Debug

* Xdebug: `Preferences > Language & Frameworks > PHP > Debug > Xdebug`
* Servers: `Preferences > Language & Frameworks > PHP > Servers`
* 添加 Config ``

## 修改 copyright

```
Preferences > Editor > Copyright > Includes > PHP File Header
```

## 修改文件头

```
Preferences > Editor > File and Code Templates > Includes > PHP File Header
```

## 自动添加 namespaces

* [PHP Namespaces and PSR Support in PhpStorm](https://confluence.jetbrains.com/display/PhpStorm/PHP+Namespaces+and+PSR+Support+in+PhpStorm)

`Preferences > Directories`

## Built-In Web Server

* [PHP Built-In Web Server](https://www.jetbrains.com/help/phpstorm)

## 魔术方法代码补全

* [Code Completion for private/protected member variables when using magic __get()](http://stackoverflow.com/questions/3814733/code-completion-for-private-protected-member-variables-when-using-magic-get/3815198#3815198)

类加上 `@property` 注释就可以

## 变量提示

```php
/**
  * @var $admin Admin
  */
  $admin;
```

## Database

* `command + shift + F10`，可以写 SQL 语句，会智能提示
* `Alt + Enter` > `Convert String literal to HEREDOC` > `Edit SQL Fragment` 写 SQL 语句

## 快捷键

* `command + e` 打开最近的文件
* `command + shift + o` 快速查询文件
* `command + .` 折叠或展开选中的代码
* `command + n` 快事为每个成员属性生成 getter 及 setter 方法 注释
