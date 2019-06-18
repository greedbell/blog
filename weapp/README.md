# 微信小程序

* [微信公众平台](https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1474632113_xQVCl&token=&lang=zh_CN)
* [官方文档](https://mp.weixin.qq.com/wiki/)
* [微信小程序资源汇总整理](https://github.com/Aufree/awesome-wechat-weapp)
* [微信小程序开发资源汇总](https://github.com/justjavac/awesome-wechat-weapp)
* [W3Cschool 微信小程序开发手册](http://www.w3cschool.cn/weixinapp)
* [微信小程序开发三宗罪和解决方案](https://segmentfault.com/a/1190000007017985) 推荐用 [labrador-cli](https://github.com/maichong/labrador-cli) 支持 async/await

## 使用 WebStorm

* [Matchmaker](https://github.com/lypeer/Matchmaker) IntelliJ IDEA 插件
* [Matchmaker Plugin](https://plugins.jetbrains.com/plugin/8644?pr=webStorm)
* [写 WebStorm 插件](https://confluence.jetbrains.com/display/IDEADEV/PluginDevelopment)

## 标签

* [modal](https://mp.weixin.qq.com/debug/wxadoc/dev/component/modal.html?t=1475052052547) 模态弹窗

## ES6 语法

* [官方文档](https://mp.weixin.qq.com/debug/wxadoc/dev/framework/app-service/module.html?t=1476197491461)

### 内核

* iOS JavaScriptCore
* Android [X5](http://x5.tencent.com)
* 开发工具 nwjs(chrome内核）

### 注意

JavaScriptCore 和 X5 不支持 ES6,所以ES6必须用 babel 转 ES5 后使用。

默认不支持 fetch 和 Promise

使用 CommonJS 模板规范

* [ exports 和 module.exports 的区别 ](http://cnodejs.org/topic/5231a630101e574521e45ef8) exports就是module.exports的引用

## 模块化

* [官方文档](https://mp.weixin.qq.com/debug/wxadoc/dev/framework/app-service/module.html?t=1476197491461)

require 引入  ：module.exports 来暴露模块接口

## 网络请求

* [wx-fetch](https://github.com/Brooooooklyn/wx-fetch)

## 拷贝 node_modules 中用到的文件

1. gulp-require-modules 遍历依赖的 node_modules 下的文件，并保存到指定的 manifest 文件。manifest 文件拷贝依赖的文件到指定目录
2. gulp-require-modules-collector 根据 manifest 文件修改对应文件。

## flex 布局

小程序支持 flex 布局

* [Flex 布局教程：语法篇](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
* [Flex 布局教程：实例篇](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)
* [MDN Flex](https://developer.mozilla.org/zh-CN/docs/Web/CSS/flex)

## Questions

### wx.request

wx.request 方法只要带上 header 就不会有回调
