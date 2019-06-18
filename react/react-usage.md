# React 使用

## state VS prop

参考 [动态交互式用户界面](http://reactjs.cn/react/docs/interactivity-and-dynamic-uis-zh-CN.html)

大部分组件的工作应该是从 props 里取数据并渲染出来。但是，有时需要对用户输入、服务器请求或者时间变化等作出响应，这时才需要使用 State。

原则上不可修改 props

## Refs

参考 [对组件的refs](http://reactjs.cn/react/docs/more-about-refs-zh-CN.html)

Refs是一种很好的发送消息给特定子实例(通过流式的Reactive props 和 state来做会不方便)的方式。

## Inline Styles

## 搭建环境

* 在用户第一次访问页面时，由服务端路由处理，输出相关页面内容
* 客户端用户点击链接跳转，由客户端路由处理，渲染相关组件并展示
* 用户在前端跳转后刷新页面，此时被服务端路由截获，并由服务端处理渲染并返回页面内容

参考

* [Koa2 + React + Redux + antd 同构直出探索](http://coderlt.coding.me/2016/11/25/isomorphism-koa2-react-antd/)
* [Server Rendering](https://github.com/ReactTraining/react-router/blob/master/docs/guides/ServerRendering.md)
* [React koa2 同构应用实践](https://www.zeroling.com/react-koa2-isomorphic-practise/)

参考项目

* []()

### 初始化 package.json

```sh
npm init
```

### eslint

```sh
npm install --save-dev eslint
npm install --save-dev eslint-plugin-react
```

### WebStorm

* `Preferences > Languages & Frameworks > Node.js and NPm > Node interperter:v6.9.1 | enable Node.js Core library`
* `Preferences > Languages & Frameworks > JavaScript > JavaScript language version >  React JSX`
* `Preferences > Languages & Frameworks > JavaScript > Code Quality Tools > ESLint > Enable`

### Koa2

```sh
npm install --save koa@next
npm install --save koa-router@next
npm install --save koa-favicon@next
npm install --save koa-logger@next
npm install --save koa-compress@next
npm install --save request
```

## react

```sh
npm install --save react
npm install --save react-dom
```

### gulp

```shell
npm install -g gulp
npm install --save-dev gulp-babel
npm install --save-dev gulp-changed
npm install --save-dev gulp-clean-css
npm install --save-dev gulp-htmlmin
npm install --save-dev gulp-imagemin
npm install --save-dev gulp-livereload
npm install --save-dev gulp-plumber
npm install --save-dev gulp-react
npm install --save-dev gulp-rename
npm install --save-dev gulp-rev
npm install --save-dev gulp-rev-collector
npm install --save-dev gulp-sass
npm install --save-dev gulp-sourcemaps
npm install --save-dev gulp-uglify
npm install --save-dev gulp-watch
npm install --save-dev imagemin-pngquant
npm install --save-dev run-sequence
```

### webpack

```sh
npm install --save-dev webpack
```

### babel

```sh
npm install -g babel-cli
npm install -g babel-node
npm install --save babel-polyfill
npm install --save-dev babel-core
npm install --save-dev babel-eslint
npm install --save-dev babel-plugin-transform-async-to-module-method
npm install --save-dev babel-preset-es2015
npm install --save-dev babel-preset-stage-0
```

### other

```sh
npm install --save bluebird
```
