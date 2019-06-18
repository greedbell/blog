# express

Express 基于 Node.js 平台，快速、开放、极简的 web 开发框架

* [express 中文](http://www.expressjs.com.cn/)
* [第三方中间件](http://www.expressjs.com.cn/resources/middleware.html)
* [express Github](https://github.com/expressjs/express)
* <https://segmentfault.com/a/1190000003766092>

## 安装

```shell
$ npm install express --save
```

## Express 应用生成器

通过应用生成器工具 express 可以快速创建一个应用的骨架。

### 安装

```shell
$ npm install express-generator -g
```

### 使用

```shell
$ express myapp
```

## session & cookie

[express-session](https://github.com/expressjs/session)

### session 存储

* redis存储 [connect-redis](https://github.com/tj/connect-redis)
* 文件存储 [session-file-store](https://github.com/valery-barysok/session-file-store)

## body

* [body-parser](https://github.com/expressjs/body-parser)

## Other

* [serve-favicon](https://github.com/expressjs/serve-favicon) 自定义 favicon.ico
