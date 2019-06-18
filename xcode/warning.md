# Xcode 警告信息

## Xcode 编译警告设置

`Build Settings > Apple LLVM [Version] - Warning ***** ` 配置警告设置，`Quick Help`查看每个设置的帮助。


### Reference

* [Compiler Warnings for Objective-C Developers](http://oleb.net/blog/2013/04/compiler-warnings-for-objective-c-developers/)
* [Warnings-xcconfig](https://github.com/boredzo/Warnings-xcconfig/wiki/Warnings-Explained)
* [
jonreid/XcodeWarnings
](https://github.com/jonreid/XcodeWarnings)

## `#pragma message`

预处理指令

不支持中文，在`issue navagitor`中提示

```
#pragma message("<TODO> to do")
#pragma message("<FIXME> fix me")
#pragma message("<???> do not known")
#pragma message("<!!!> important")
```

## `#warning`

同 `#pragma message`

```
#warning <TODO> to do
```

## 注释

支持中文，在`Symbols list`中显示

```
// TODO:
// FIXME:
// !!!:
// ???:
```

`Build Phases` 添加 `run script`

```
KEYWORDS="TODO|FIXME|\?\?\?:|\!\!\!:"
find . -name *.[h,m] ! -path "./Pods/*" ! -path "./Example/*" | xargs egrep --with-filename --line-number --only-matching ${KEYWORDS} | perl -p -e "s/($KEYWORDS)/ warning: \$1/"
```

所有变成warning

## 相关资料
