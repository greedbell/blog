# 前端开发

html,css,javascript


node + express+React+redux+Babel

## 自适应 Web 设计

* [响应式 Web 设计 - Viewport](http://www.runoob.com/css/css-rwd-viewport.html)
* [为什么百度、淘宝之类的大公司网页不使用响应式，而是独立开发一套手机页面？](https://www.zhihu.com/question/38065402)

## LESS

LESSCSS是一种动态样式语言，属于CSS预处理语言的一种，它使用类似CSS的语法，为CSS的赋予了动态语言的特性，如变量、继承、运算、函数等，更方便CSS的编写和维护。

<http://www.1024i.com/demo/less/>

## LESS VS SASS

* [SASS用法指南](http://www.ruanyifeng.com/blog/2012/06/sass.html)

使用 .scss 方式的 SASS,语法比较习惯

## Grunt VS Gulp

选择Gulp，因为语法像写代码

## 优化原则

* 按需加载
* 将脚本放在底部
* 将样式表放在头部

## 静态资源

静态资源在上线后需要添加hash戳作为版本标识

## 后端的包管理器

> npm

## 前端的包管理器

### npm + browserify

* [基于 Gulp + Browserify 构建 ES6 环境下的自动化前端项目](https://segmentfault.com/a/1190000004917668)

#### 优点

browserify 基于 pipe 的方式更加干净而且灵活性也更高,尤其适合和 gulp 一起使用，[而 gulp 的官方 recipes 也是只有 browserify 的] <https://github.com/gulpjs/gulp/tree/master/docs/recipes>

#### 缺点

npm不太适用于web，代码依赖层级太复杂，很多库几行代码的函数都要依赖别人的，很多冗余代码，而且编译很慢

### gulp

## 模块管理

* [面向未来的前端模块化开发与包管理](http://div.io/topic/950)
* [System.js VS Webpack](https://www.zhihu.com/question/36679304)

### 对比

* seajs / require : 是一种在线"编译" 模块的方案，相当于在页面上加载一个 CMD/AMD 解释器。这样浏览器就认识了 define、exports、module 这些东西。也就实现了模块化。
* browserify / webpack : 是一个预编译模块的方案，相比于上面 ，这个方案更加智能。没用过browserify，这里以webpack为例。首先，它是预编译的，不需要在浏览器中加载解释器。另外，你在本地直接写JS，不管是 AMD / CMD / ES6 风格的模块化，它都能认识，并且编译成浏览器认识的JS。

### webpack

预编译模块方案 Webpack 允许你使用不同的模块管理器，不只是 CommonJS，甚至支持 ES6 模块。

Webpack 通过 babel-loader 也可以支持 ES2015。除此之外，webpack 的 loader 生态远比 System.js 繁荣，热替换，完善的 source map，优化插件，以及更小的 runtime library size（webpack 的额外代码量几乎可以忽略，而 System.js 压缩后居然还要 45kb，你是在逗我？）开发中的 Webpack 2 也将支持用 System.import 替代 AMD 语法作为模块异步加载点. 相比之下 SystemJS 的唯一特点就是不需要构建，然而即使如此，开发体验也远不如 webpack-dev-server。同时，除非你所有用户的浏览器都支持 HTTP/2，不然你最终还是要打包... 理想中的美好世界还是个没谱的事儿，所以综合来说现阶段 Webpack 完爆 SystemJS...

react 的项目用 webpack 还不错，目前非react 项目 还是以gulp＋webpack 来搞，webpack仅被用来是代替 browerify 来做JS的模块化

比如，你的工程模块依赖很简单，不需要把js或各种资源打包，只需要简单的合并、压缩，在页面中引用就好了。那就不需要Browserify、Webpack。Gulp就够用了。

反过来，如果你的工程庞大，页面中使用了很多库（SPA很容易出现这种情况），那就可以选择某种模块化方案。至于是用Browserify还是Webpack就需要根据其他因素来判断了。比如团队已经在使用了某种方案，大家都比较熟悉了。再比如，你喜欢Unix小工具协作的方式，那就Browserify。

1. “还有就是如果我的项目不是SPA，而是很多Pages，然后我不希望所有文件最终都打包成一个bundle.js”
> 那就分page打包啊，至于是不是也适合用Webpack或Browserify，我只能说都可以。不过推荐使用webpack

### systemjs

动态的模块加载器，可以导入任何流行格式的模块（CommonJS、UMD、AMD、ES6）

Webpack + SystemJS

### [JSPM](http://jspm.io/)

基于SystemJS的Javascript包 package管理器，基于动态的ES6模块加载器之上构建。

### Redux

展示数据

## mp3

* [jPlayer](https://github.com/happyworm/jPlayer) 音频视频播放器
* [SoundManager2](https://github.com/scottschiller/SoundManager2/) 音频 + RTMP 播放器

## Service Workers

Web 支持离线功能，目前支持的浏览器不多，而且支持的浏览器也是在试验阶段

* [Service Worker API](https://developer.mozilla.org/zh-CN/docs/Web/API/Service_Worker_API)
* [Service Workers: an Introduction](https://developers.google.com/web/fundamentals/getting-started/primers/service-workers)
* [页面守护者：Service Worker](http://imweb.io/topic/56592b8a823633e31839fc01)
