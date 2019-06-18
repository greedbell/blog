# C 编译器的工作过程

* [编译器的工作过程](http://www.ruanyifeng.com/blog/2014/11/compiler.html)

```
配置（configure）> 编译（Compilation） > 连接（Linking）
```

## 编译

源码转成二进制的机器码，生成后缀名为.lib和.a的文件

## 连接

把外部函数的代码（通常是后缀名为.lib和.a的文件），添加到可执行文件中

### 静态连接（static linking）

把外部函数库，拷贝到可执行文件中

### 动态连接（dynamic linking）

外部函数库不进入安装包

* Linux平台是后缀名为.so的文件
* Windows平台是.dll文件
* Mac平台是.dylib文件
