# node.js

Node.js 是一个开放源代码、跨平台的、用于服务器端和网络应用的运行环境。

* [官网](https://nodejs.org/)
* [Node.js 究竟是什么？](http://www.ibm.com/developerworks/cn/opensource/os-nodejs/)
* [Node.js 教程](http://www.runoob.com/nodejs/nodejs-tutorial.html)
* [cnodejs](https://cnodejs.org/)

[Node.js静态文件服务器实战](http://www.infoq.com/cn/news/2011/11/tyq-nodejs-static-file-server)

## 安装

### brew 方式安装

<https://nodejs.org/en/download/package-manager/#osx>

```shell
brew install node
```

### nvm 方式安装

[Github](https://github.com/creationix/nvm)

安装 nvm

```shell
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
```

查看可用 node.js 版本

```shell
$ nvm ls-remote
```

查看 node.js 稳定版本

```
https://semver.io/node/stable
```

安装 node.js

```shell
$ nvm install 5.11.1
```

## IDE

* [webstorm](https://www.jetbrains.com/webstorm/download/)

## npm

NodeJS包管理和分发工具

## bower

NPM 主要运用于 Node.js 项目的内部依赖包管理，安装的模块位于项目根目录下的 node_modules 文件夹内。而 Bower 大部分情况下用于前端开发，对于CSS/JS/模板等内容进行依赖管理，依赖的下载目录结构可以自定义。

* [官网](http://bower.io/)

## Express

Express 是一个简洁而灵活的 node.js Web应用框架, 提供了一系列强大特性帮助你创建各种 Web 应用，和丰富的 HTTP 工具。

### 安装

```shell
$ npm install express --save
```

## JXcore

JXcore 是一个支持多线程的 Node.js 发行版本，基本不需要对你现有的代码做任何改动就可以直接线程安全地以多线程运行。

## 查看Node支持哪些新特性

```shell
$ node -e 'console.log(process.versions)'
{ http_parser: '2.7.0',
  node: '6.1.0',
  v8: '5.0.71.35',
  uv: '1.9.0',
  zlib: '1.2.8',
  ares: '1.10.1-DEV',
  icu: '56.1',
  modules: '48',
  openssl: '1.0.2h' }
```

## Cookie

### node.js 方式

* [node.js操作Cookie](http://www.cnblogs.com/rubylouvre/archive/2012/08/19/2645644.html?utm_source=tuicool&utm_medium=referral)
* [Cookie Management in Express](https://www.codementor.io/nodejs/tutorial/cookie-management-in-express-js)

### 第三方中间方式

```shell
$ npm install cookie-parser
```

```js
var express = require('express');
var app = express();
var cookieParser = require('cookie-parser');

// 加载用于解析 cookie 的中间件
app.use(cookieParser());
```

## request 请求

* [request](https://github.com/request/request)
* [Request —— 让 Node.js http请求变得超简单](http://www.thinksaas.cn/topics/0/347/347193.html)

## Node.js进程管理

* [PM2](https://github.com/Unitech/PM2)

## 相关资料

* [NPM vs Bower 的区别](http://www.hlqf.net/archives/139.html)
