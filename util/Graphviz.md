# Graphviz

程序员画流程图利器

* [官网](http://www.graphviz.org/)
* [官方文档](http://www.graphviz.org/documentation/)

## mac 安装 命令行工具

```shell
$ brew install graphviz
```

## Atom 插件插件

* [graphviz-preview](https://atom.io/packages/graphviz-preview) dot 预览插件，`ctrl-d`
* [language-dot](https://atom.io/packages/language-dot) dot 编辑插件
* [graphviz-preview-plus](https://atom.io/packages/graphviz-preview-plus) dot 预览插件，`ctrl-shift-v`

后缀用 `.dot`

## mac 安装 GUI 工具

只能查看，不能编辑

* [Install Graphviz on Mac OSX](http://macappstore.org/graphviz-2/)

* 安装 [macports](https://www.macports.org/install.php)
* `source ~/.bash_profile`
* `sudo port install graphviz-gui`

## Web 显示

Graphviz 文件转成 svg 文件，再显示

* [GraphvizOnline](https://github.com/dreampuf/GraphvizOnline/) 在线显示 Graphviz

## 语法

### 3种元素

* 图 `graph`
* 顶点 `node`
* 边 `edge`

#### graph 分类

* graph 无向图，线上无箭头
* digraph 有向图，线上无箭头
* subgraph 子图

#### 属性

参考 [Node, Edge and Graph Attributes](http://www.graphviz.org/content/attrs)

* shap 形状，[Node Shapes](http://www.graphviz.org/doc/info/shapes.html) eg：box，record
* rankdir 箭头方向，eg：LR、TB
* style 样式，eg：filled
* color 颜色
* fillcolor
* image
* label

### other

* 子图的名称必须以 `cluster` 开头

### 布局

* dot 默认布局方式，主要用于有向图
* neato 基于spring-model(又称force-based)算法
* twopi 径向布局
* circo 圆环布局
* fdp 用于无向图

## Reference

* <http://blog.csdn.net/zhangskd/article/details/8250470>
* [使用graphviz绘制流程图（2015版）](http://icodeit.org/2015/11/using-graphviz-drawing/)
