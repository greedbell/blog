# WebStorm

## 生成命令行工具

```
Preferences > Tools > Create Command-line Launcher
```

## 自动生成jsdoc格式的注释

写好函数,输入 /** 加回车

## 快捷键

| 苹果符号 | 苹果键盘 | PC键盘 |
| :--- | :--- | :--- |
| ⌘ | Command | Window |
| ⌥ | Option | Control |
| ⇧ | Shift | Shift |
| ⌃ | Ctrl | Alt |

| 快捷键 | 功能 |
| :---: | :---: |
| ⌘ + F12 | 打开 Structure |
| ⌘ + 1 | 打开 Project |
| ⌘ + ↓ | 打开 Code |
| ⌃ + F12 | 打开 Terminal |

## 配置 node.js

WebStorm > Preferences > Languages & Frameworks > JavaScript > Node.js and NPM > 选择指定的 node.js 版本，并 enable Core library.

## Live Template

模板

* [官方文档](https://www.jetbrains.com/help/webstorm/2016.2/live-templates.html)

### 创建模板

```
Webstorm > Preferences > Editor > Live Templates > +
```

### 分享模板

* [Sharing Live Templates](https://www.jetbrains.com/help/webstorm/2016.2/sharing-live-templates.html)

模板路径：

* Windows: `<your_user_home_directory>.WebStorm<version_number>\config\templates\<group_name>.xml`
* Linux: `~WebStorm<version>\config\templates\<group_name>.xml`
* OS X: `~/Library/Preferences/WebStorm<version>/templates\<group_name>.xml`

#### 分享方法一

直接分享 `<group_name>.xml` 文件，导入的时候保存到对应目录

#### 分享方法二

导出配置：

```
File > Export Settings > 只勾上 Live templates > 选择保存路径 > OK
```

导入配置：

```
File > Import Settings > 选择配置文件 > 勾上 Live templates > OK
```

## 文件模板

```
Webstorm > Preferences > Editor > File and Code Templates
```

## 写插件

* [IntelliJ Platform SDK Documentation](http://www.jetbrains.org/intellij/sdk/docs/index.html)

WebStorm 插件和 IntelliJ 插件一样

## 实时预览

1. chrome 安装 [JetBrains IDE Support](https://chrome.google.com/webstore/detail/jetbrains-ide-support/hmhgeddbohgjknpmjagkdomcpobmllji)
2. WebStorm > Run > Debug

### References

* [Using JetBrains Chrome Extension](https://www.jetbrains.com/help/webstorm/2016.3/using-jetbrains-chrome-extension.html)
