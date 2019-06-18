# Babel

* [Babel 中文网](http://babeljs.cn/)
* [GitHub](https://github.com/babel/babel)
* [Babel 入门教程](http://www.ruanyifeng.com/blog/2016/01/babel.html)
* [在node中使用babel6的一些简单分享](https://cnodejs.org/topic/56460e0d89b4b49902e7fbd3)

## 安装命令行

```shell
$ npm install -g babel-cli
$ npm install -g babel-node
```

## 安装

```shell
$ npm install --save-dev babel-core
```

## 插件

```shell
$ npm install --save-dev babel-preset-es2015
```

对于 export default {} 支持不好，还得加个插件 babel-plugin-add-module-exports：
"plugins": [
"add-module-exports"
]

### [babel-polyfill](http://babeljs.io/docs/usage/polyfill/)

includes a custom regenerator [runtime](https://github.com/facebook/regenerator/blob/master/runtime.js) and [core-js](https://github.com/zloirock/core-js).

必须放在程序总入口

## .babelrc

* [官方文档](https://babeljs.io/docs/usage/babelrc/)
* [参数说明](http://babeljs.io/docs/usage/options/)

### presets

设定转码规则，代表需要启动什么样的预设转码，预设了6种，分别是

```
es2015
stage-0
stage-1
stage-2
stage-3
react
```

### plugins

## async

babel-plugin-transform-async-to-generator 和 babel-polyfill

## babel的polyfill和runtime的区别

* [babel的polyfill和runtime的区别](https://segmentfault.com/q/1010000005596587/a-1020000005603764)
* [babel-plugin-transform-runtime](https://babeljs.io/docs/plugins/transform-runtime/)

需要修改内置api才能达成的功能(eg：扩展String.prototype)需要用 babel-polyfill
