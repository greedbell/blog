# oclint

静态分析代码工具

* [官网](http://oclint.org/)
* [规则](http://docs.oclint.org/en/stable/rules/index.html)

- [oclint](#oclint)
  - [常见的阈值](#%E5%B8%B8%E8%A7%81%E7%9A%84%E9%98%88%E5%80%BC)
  - [安装](#%E5%AE%89%E8%A3%85)
    - [先安装`xctool`](#%E5%85%88%E5%AE%89%E8%A3%85xctool)
    - [安装`oclint`](#%E5%AE%89%E8%A3%85oclint)
  - [使用](#%E4%BD%BF%E7%94%A8)
    - [1](#1)
    - [2](#2)
    - [3](#3)
  - [参考资料](#%E5%8F%82%E8%80%83%E8%B5%84%E6%96%99)
  - [Test](#test)

## 常见的阈值

参考 [available-thresholds](https://oclint-docs.readthedocs.io/en/stable/howto/thresholds.html#available-thresholds) OCLint 里面一些常见的阈值：

|名称|描述|默认值|
| ------------- |:-------------| -----|
| CYCLOMATIC_COMPLEXITY |循环嵌套数限制|10|
| LONG_CLASS |类行数限制|1000|
| LONG_LINE |每行的字符限制|100|
| LONG_METHOD |方法行数限制|50|
| LONG_VARIABLE_NAME |参数名字符限制|20|
| MAXIMUM_IF_LENGTH |if 的行数限制|15|
| MINIMUM_CASES_IN_SWITCH |switch case 的最小数目|3|
| NPATH_COMPLEXITY |通过该方法的非循环执行路径数量限制|200|
| NCSS_METHOD |连续未注释行数限制|30|
| NESTED_BLOCK_DEPTH |block 嵌套层数限制|5|
| SHORT_VARIABLE_NAME |变量名的最小字符数限制|3|
| TOO_MANY_FIELDS |类成员限制|20|
| TOO_MANY_METHODS |类方法数限制|30|
| TOO_MANY_PARAMETERS |参数个数限制|10|

## 安装

### 先安装`xctool`

```shell
$ brew install xctool
```

### 安装`oclint`

```shell
$ brew install Caskroom/cask/oclint
```

## 使用

### 1

` File > New > Target > Other > Aggregate ` 添加一个名为`OClint`的`Aggregate`

### 2

`OClint > Build Phases > + > New Run Script Phase`

Shell中写入以下内容，`YourProject.xcodeproj`,`YourScheme`换成对应的内容
```
source ~/.bash_profile
cd ${SRCROOT}
xctool \
  -project YourProject.xcodeproj \
  -scheme YourScheme \
  -reporter json-compilation-database:compile_commands.json \
  build
oclint-json-compilation-database \
-e Pods \
-- -rc=LONG_LINE=100 \
-rc=NCSS_METHOD=60 \
| sed 's/\(.*\.\m\{1,2\}:[0-9]*:[0-9]*:\)/\1 warning:/'
```

* `xctool`导出`compile_commands.json`文件
* [oclint-json-compilation-database](http://docs.oclint.org/en/stable/manual/oclint-json-compilation-database.html) 解析`compile_commands.json`文件
* [oclint参数](http://docs.oclint.org/en/stable/manual/oclint.html)
* [oclint -rc](http://docs.oclint.org/en/stable/howto/thresholds.html)

### 3

scheme 选择 OClint > build

## 参考资料

* [Using OCLint in Xcode](http://docs.oclint.org/en/stable/guide/xcode.html)
* [Using OCLint with xctool](http://docs.oclint.org/en/stable/guide/xctool.html)
* <https://segmentfault.com/a/1190000002547015>


- [] todo
- [] todo

- [] todo- [] todo- [] todo- [] todo- [] todo

## Test