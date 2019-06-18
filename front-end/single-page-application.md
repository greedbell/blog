# 单页应用 (SPA)

在一个页面上集成多种功能，甚至整个系统就只有一个页面，所有的业务功能都是它的子模块，通过特定的方式挂接到主界面上。它是AJAX技术的进一步升华，把AJAX的无刷新机制发挥到极致，因此能造就与桌面程序媲美的流畅用户体验。

* [构建单页Web应用](https://github.com/xufei/blog/issues/5)
* [pjax](https://github.com/defunkt/jquery-pjax) [pushState](https://developer.mozilla.org/zh-CN/docs/DOM/Manipulating_the_browser_history) + AJAX

pjax出现之前就有人用hash代替(就是#号)，做全页面ajax跳转。

pushState的功能具体来说就是修改url而页面无跳转，并且该url会被存放在历史记录中

## WEB 端

* [react.js](https://github.com/facebook/react) 推荐
* [angular.js](https://github.com/angular/angular)

### 缺陷

不利于SEO

* [单页应用（Single Page Application）的搜索引擎优化](http://zhanzhang.baidu.com/college/articleinfo?id=294)
* [Isomorphic JavaScript](http://nerds.airbnb.com/isomorphic-javascript-future-web-apps/) 同构 JS,后端前端都可渲染

## PC 端

### [electron](https://github.com/electron/electron) 推荐.

* [electron-vue](https://github.com/SimulatedGREG/electron-vue) 用Vue.js作为UI框架的脚手架

原 `atom-shell`.Electron生成的程序实在是太大

* [NodObjC](https://github.com/TooTallNate/NodObjC)  Node.js ⇆ Objective-C
* [edge](https://github.com/tjanczuk/edge)  .NET ⇆ Node.js

### [nw.js](https://github.com/nwjs/nw.js)

原 `node-webkit`

### 缺点

#### 包太大

安装包包含 nodejs 与 webkit。
打包是移除掉运行时不需要的，例如 devDependencies ，通过`npm i --production`可以只安装 dependencies 包 或者 webpack 后只复制 C++ Modules ；
还有发布时压缩成 zip 包，可以把大小减少到 40-60MB ，如果压缩成 7z 包，可以减少到 30MB 。

#### 运行速度比原生慢，比网页快

#### 启动速度慢

### [Cordova](http://cordova.apache.org/)

* 主打移动端，PC 端插件不足。支持平台 [Platform Support](https://cordova.apache.org/docs/en/latest/guide/support/index.html)
* 支持 Web 端，electron 和 nw.js 都是基于 node 所以不能运行在 Web 端。所以性能不如 electron 和 nw.js

### 总结

* 架构不清楚，如果要兼容XP就只能用nw.js。其它情况都首推Electron。
* nw 对 xp 虽然支持，但还是很蛋疼，我们当时 XP 和 Win7+是分别打包的……
* 用 electron 的有 Atom, visual studio Code

electron+backbone+react
Electron + React + Node.js + ES2015
