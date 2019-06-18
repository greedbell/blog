# 前后端分离

## 基于NodeJS的全栈式开发

* [Web 研发模式演变](https://github.com/lifesinger/blog/issues/184)
* [淘宝UED-前端技术](http://ued.taobao.org/blog/category/bowen/frontend/) 前后端分离的思考与实践1-6
* [结构图](http://2014.jsconf.cn/slides/herman-taobaoweb/index.html#/69)
* [ModelProxy--轻量级的接口配置建模框架](https://github.com/carlisliu/modelproxy)

主要思路就是,后端提供 RESETfull api,前端通过 node.js 获取 JSON 数据，再输出 html 文件到浏览器。界面相关的逻辑都在 node.js 层实现。

## 框架

* [express](https://github.com/expressjs/express)

## 请求数据

* [request](https://github.com/request/request)

## 多终端适配

* [基于前后端分离的多终端适配](http://ued.taobao.org/blog/2014/05/cross-platform-tpl/)
* [User Agent 特征库和探测工具](https://wiki.mozilla.org/Compatibility/UADetectionLibraries)
* [ua-parser-js](https://github.com/faisalman/ua-parser-js)

Router 根据 User Agent 选择对应的 Controller,然后用同一套 Model,渲染不同的 View.

## 模板引擎

* [artTemplate](https://github.com/aui/artTemplate)

## 日志

* [node-bunyan](https://github.com/trentm/node-bunyan)
* [winston](https://github.com/winstonjs/winston)
* [log4js-node](https://github.com/nomiddlename/log4js-node)
* [morgan](https://github.com/expressjs/morgan) express默认

## cookie & session

* [cookie-parser](https://github.com/expressjs/cookie-parser) express默认
* [express-session](https://github.com/expressjs/session)
* [session-file-store](https://github.com/valery-barysok/session-file-store)

## 调试

* [debug](https://github.com/visionmedia/debug) express默认
