# Android studio 使用 JavaDoc

## 安装 JavaDoc 插件

```
Preference > Plugins > Browse repositories > 搜索 javadoc > Install
```

## 写注释

* [The Java API Documentation Generator](http://docs.oracle.com/javase/1.5.0/docs/tooldocs/solaris/javadoc.html)
* [Javadoc Tool](http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html)
* [How to Write Doc Comments for the Javadoc Tool](http://www.oracle.com/technetwork/java/javase/documentation/index-137868.html)

tag

```
@author (classes and interfaces only, required)
@version (classes and interfaces only, required. See footnote 1)
@param (methods and constructors only)
@return (methods only)
@exception (@throws is a synonym added in Javadoc 1.2)
@see
@since
@serial (or @serialField or @serialData)
@deprecated (see How and When To Deprecate APIs)
```

## 使用 JavaDoc 插件

`Preference > Keymap > Plug-ins > JavaDoc` 查看 javadoc 快捷键

* 对一个元素注释：把鼠标移动到元素中，然后 `shift + alt + G` 或者 `shift + option + G`。
* 对所有方法元素注释：`shift + alt ctrl + + G` 或者 `shift + option + control + G`
* 撤销当前/选择：`shift + alt + Z` 或者 `shift + option + Z`
* 撤销所有注释：`shift + alt + ctrl + Z` 或者 `shift + option + control + G`

## 生成 JavaDoc 文档

```
Tools > Generate JavaDoc
```

* `Output directory` 输出文档目录
* `Other Command line arguments:` 设为 `-encoding utf-8 -charset utf-8`

## Reference

* [Android studio JavaDoc的使用](http://blog.csdn.net/dreamlivemeng/article/details/51499675)
