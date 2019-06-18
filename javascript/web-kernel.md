# Web 内核

* [MDN JS 引擎比较](https://developer.mozilla.org/zh-CN/docs/Mozilla/Projects/SpiderMonkey/Comparision_of_JS_engines)
* [wiki](https://en.wikipedia.org/wiki/JavaScript_engine)
* [v8](http://v8project.blogspot.hk/)
* [apple javascriptcore](https://developer.apple.com/reference/javascriptcore)
* [javascriptcore](http://trac.webkit.org/wiki/JavaScriptCore)
* [主流浏览器内核介绍（前端开发值得了解的浏览器内核历史）](http://web.jobbole.com/84826/)

浏览器内核又可以分成两部分：渲染引擎(layout engineer 或者 Rendering Engine)和 JS 引擎。

* 渲染引擎 负责取得网页的内容（HTML、XML、图像等等）、整理讯息（例如加入 CSS 等），以及计算网页的显示方式，然后会输出至显示器或打印机。
* JS 引擎则是解析 Javascript 语言，执行 javascript 语言来实现网页的动态效果。

## 内核

* Gecko（firefox）
* Trident（IE）
* WebKit (Safari chrome 等）： 由渲染引擎 WebCore 和 JS 解释引擎 JSCore 组成
* Presto（前opera)

## 渲染引擎

* WebCore
* Blink (chrome): WebKit 的分支

## Javascript 引擎

* KJS
* JSCore
* V8
