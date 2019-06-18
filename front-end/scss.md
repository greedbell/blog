# scss

* [官网](http://sass-lang.com/)
* [教程](http://www.ruanyifeng.com/blog/2012/06/sass.html)

.sass和.scss。这两种的区别在于.sass文件对代码的排版有着非常严格的要求，而且没有大括号，没有分号,以缩进方式显示。推荐用 scss

## 变量

所有变量以$开头

## 计算功能

## 嵌套


## 继承

@extend

## Mixin

代码块

使用@include命令，调用这个mixin。

## 颜色函数

```
lighten(#cc3, 10%) // #d6d65c
darken(#cc3, 10%) // #a3a329
grayscale(#cc3) // #808080
complement(#cc3) // #33c
```

## 插入文件

@import

## 高级用法

@if @else @for @while @each

## 自定义函数

@function @return
