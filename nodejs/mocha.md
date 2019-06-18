# mocha.js

node.js 测试框架

* [官网](http://mochajs.org)
* [GitHub](https://github.com/mochajs/mocha)
* [GitHub wiki](https://github.com/mochajs/mocha/wiki)
* [测试框架 Mocha 实例教程](http://www.ruanyifeng.com/blog/2015/12/a-mocha-tutorial-of-examples.html)

## 安装

```
$ npm install --global mocha
```

## 使用

测试脚本命名

* `.test.js` 测试
* `.spec.js` 规格

默认入口

* `test/*.test.js`

参数

* `--recursive` 测试 `test` 目录下面所有的测试用例(不管在哪一层).默认只测试 `test` 目录下的测试用例
* `--reporter, -R` 默认是`spec`格式 ,[其它格式](http://mochajs.org/#reporters)
