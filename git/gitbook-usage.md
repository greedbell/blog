# GitBook

* [GitHub](https://github.com/GitbookIO/gitbook)
* [文档](http://developer.gitbook.com/)
* [Help](http://help.gitbook.com/)
* [本地编辑器](https://www.gitbook.com/blog/releases)

## 安装

```shell
$ npm install -g gitbook-cli
```

更新

```sh
$ gitbook update
```

安装依赖

```sh
$ gitbook install
```

编译

```sh
$ gitbook build
```

## book.json

gitbook配置，配置插件。。。
```
例子：
{
    "gitbook": "2.x.x" ,
    "title": "Bell's blog",
    "plugins": ["github"],
    "pluginsConfig": {
        "github": {
         "url": "https://github.com/GreedBell/blog"
        }
    }
}

```

## 插件

<http://zhangjikai.com/gitbook-use/plugins.html>

添加插件后运行

```
$ cd ~
$ gitbook install
```

安装插件到用户目录

### disqus

> 评论

* [插件地址](https://plugins.gitbook.com/plugin/disqus)
* [官网](https://disqus.com/)
* [安装](https://zjuguxi.gitbooks.io/hard-way-to-python/content/week/disqus.html)

### 多说

> 评论

* [插件地址](https://plugins.gitbook.com/plugin/duoshuo)
* [官网](http://duoshuo.com/)

### mermaid

> 画流程图

* [插件地址](https://github.com/JozoVilcek/gitbook-plugin-mermaid)

### adsense

> google 广告

* [插件地址](https://plugins.gitbook.com/plugin/adsense)

### gitbook-plugin-anchors

加描点

### [gitbook-plugin-anchor-navigation-ex](https://github.com/zq99299/gitbook-plugin-anchor-navigation-ex)

添加toc到侧边悬浮导航

### [gitbook-plugin-splitter](https://plugins.gitbook.com/plugin/splitter)

侧边栏可以滑动

### [expandable-chapters](https://plugins.gitbook.com/plugin/expandable-chapters)

收起或展开章节目录中的父节点。

## webhooks

* 向slack发消息 [slack-incoming-webhooks](https://api.slack.com/incoming-webhooks)

## 相关资料

* [Gitbook 的使用和常用插件](http://zhaoda.net/2015/11/09/gitbook-plugins/)
