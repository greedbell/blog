# kotlin

* [官网](https://kotlinlang.org/)
* [Kotlin 语言中文站](https://www.kotlincn.net/)
* [Kotlin 语言中文站教程](https://www.kotlincn.net/docs/reference/)
* [Kotlin 官方维护的 awesome](KotlinBy/awesome-kotlin)

## 语法

### const VS val

### public VS open

## Lint

* [ktlint](https://github.com/shyiko/ktlint)

## kotlin native

### iOS

参考 [Creating an iOS framework with Kotlin](https://viteinfinite.com/2018/02/creating-an-ios-framework-with-kotlin/)
kotlin 生成  `Example.framework` `Example.framework.dSYM` 文件
Xcode 工程配置：

* `Example.framework` `Example.framework.dSYM` 拖到工程
* Framework Search Path 添加 `Example.framework` 所在路径
* Build Phases > + > New Copy Files Phase > + > 选择 `Example.framework` `Example.framework.dSYM`

这样 framework 报错的时候会有可读的错误日志。

* [xcode-kotlin](https://github.com/touchlab/xcode-kotlin) Xcode 支持调试 kotlin 的插件
* [DroidconKotlin](https://github.com/touchlab/DroidconKotlin/) Xcode 支持调试 kotlin 的例子
