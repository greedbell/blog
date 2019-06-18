# mermaid

* [Github](https://github.com/knsv/mermaid)
* [文档](http://knsv.github.io/mermaid/)
* [在线编辑器](http://knsv.github.io/mermaid/live_editor/)
* [Atom安装mermaid插件](https://atom.io/packages/atom-mermaid)

# 安装

```shell
$ npm install mermaid -g
```

# 使用

## mermaid CLI

<http://knsv.github.io/mermaid/> 搜索`mermaid CLI`

先安装[phantomjs](https://github.com/ariya/phantomjs)

```shell
$ npm install -g phantomjs@1.9
```

生成图片

```
$ mermaid test.mmd
```

## code

<http://knsv.github.io/mermaid/> 搜索`Flowcharts - Basic Syntax`

* graph 流程图
* [sequenceDiagram](http://knsv.github.io/mermaid/#sequence-diagrams) 时序图
* [Gant diagrams](http://knsv.github.io/mermaid/) 甘特图

### Test

```
{% mermaid src="Resource/test.mmd" %}
{% endmermaid %}
```
