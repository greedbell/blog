# EditorConfig

EditorConfig 是一套用于统一代码格式的解决方案

* [官网](http://editorconfig.org)
* [EditorConfig介绍翻译](http://www.alloyteam.com/2014/12/editor-config/)
* [EditorConfig 介绍](http://www.jianshu.com/p/712cea0ef70e)

## 解释

* indent_style：tab为hard-tabs，space为soft-tabs。
* indent_size：设置整数表示规定每级缩进的列数和soft-tabs的宽度（译注：空格数）。如果设定为tab，则会使用tab_width的值（如果已指定）。
* tab_width：设置整数用于指定替代tab的列数。默认值就是indent_size的值，一般无需指定。
* end_of_line：定义换行符，支持lf、cr和crlf。
* charset：编码格式，支持latin1、utf-8、utf-8-bom、utf-16be和utf-16le，不建议使用uft-8-bom。
* trim_trailing_whitespace：设为true表示会除去换行行首的任意空白字符，false反之。
* insert_final_newline：设为true表明使文件以一个空白行结尾，false反之。
* root：表明是最顶层的配置文件，发现设为true时，才会停止查找.editorconfig文件。

## Example

```
root = true

[*]
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
indent_style = space
indent_size = 2
```
