# ClangFormat

Xcode代码格式化工具

* [ClangFormat-Xcode](https://github.com/travisjeffery/ClangFormat-Xcode) 新版 Xcode 上已不可用
* [XcodeClangFormat](https://github.com/mapbox/XcodeClangFormat) 新版 Xcode 上可用，第三方扩展方式安装

### 配置 ClangFormat-Xcode

在工程目录或者workspace目录下创建一个".clang-format"文件，添加类似于以下内容的参数：

```
# 基础样式  
BasedOnStyle: LLVM  

# 缩进宽度  
IndentWidth: 4  

# 圆括号的换行方式  
BreakBeforeBraces: Attach  

# 支持一行的if  
AllowShortIfStatementsOnASingleLine: true  

# switch的case缩进  
IndentCaseLabels: true  

# 针对OC的block的缩进宽度  
ObjCBlockIndentWidth: 4  

# 针对OC，属性名后加空格  
ObjCSpaceAfterProperty: true  

# 每行字符的长度  
ColumnLimit: 0  

# 注释对齐  
AlignTrailingComments: true  

# 括号后加空格  
SpaceAfterCStyleCast: true  

# 不在小括号里加空格  
SpacesInParentheses: false  

# 不在中括号里加空格  
SpacesInSquareBrackets: false  
```

### 参考资料

* [.clang-format 文档](http://clang.llvm.org/docs/ClangFormatStyleOptions.html)
* [.clang-format 参数](http://clangformat.com/)
* <http://blog.csdn.net/zhangao0086/article/details/42872263>
