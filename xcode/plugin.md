# plugin

## Alcatraz

> 插件管理工具

* [插件地址](https://github.com/alcatraz/Alcatraz)

### 安装

```shell
curl -fsSL https://raw.github.com/alcatraz/Alcatraz/master/Scripts/install.sh | sh
```

## clang-format

> 代码格式化工具

* [插件地址](https://github.com/travisjeffery/ClangFormat-Xcode)

### 命令行安装

```shell
$ brew install clang-format
```

* [文档](http://clang.llvm.org/docs/ClangFormat.html)

使用

```shell
$ clang-format target_file > temp_file
$ cat temp_file > target_file
```

## VVDocumenter-Xcode

> 注释工具

* [插件地址](https://github.com/onevcat/VVDocumenter-Xcode)

## 自定义快捷键

`Preferences > Keyboard > Shortcuts > App Shortcuts > Click +
`

## 插件失效更新

获取`Xcode`路径

```shell
$ xcode-select -p
```

```
/Applications/Xcode-7.3.app/Contents/Developer
```

获取`DVTPlugInCompatibilityUUID`

```shell
$ defaults read /Applications/Xcode-7.3.app/Contents/Info DVTPlugInCompatibilityUUID
```

```
ACA8656B-FEA8-4B6D-8E4A-93F4C95C362C
```

更新`DVTPlugInCompatibilityUUID`

```shell
$ find ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | xargs -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add DVTPlugInCompatibilityUUID
```
只需在命令行输入一行命令即可(注意：这段代码貌似仅支持Xcode6以上)


## plugin

* [alcatraz](http://alcatraz.io/) 插件管理工具, Xcode8不支持
* [ClangFormat-Xcode](https://github.com/travisjeffery/ClangFormat-Xcode) 代码格式化, Xcode8不支持

### XcodeClangFormat

* [XcodeClangFormat](https://github.com/mapbox/XcodeClangFormat)

Xcode8 代码格式化插件， 安装好后

* `系统设置 > 扩展` 开启扩展
* `系统设置 > 键盘 > 快捷键` 添加快捷键
