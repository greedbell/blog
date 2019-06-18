# Cordova

* [官网](http://cordova.apache.org/)
* [官方文档](http://cordova.apache.org/docs/en/latest/)
* [cordova-tutorial](https://github.com/ccoenraets/cordova-tutorial)
* [cordova-plugman](https://github.com/apache/cordova-plugman) `platform-centered workflow` 方式开发时的 Cordova 插件管理工具

为 Web 提供与原生交互的能力

<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Cordova](#cordova)
  * [文件/文件夹说明](#文件文件夹说明)
  * [开发方式](#开发方式)
    * [Cross-platform (CLI) workflow](#cross-platform-cli-workflow)
      * [Android](#android)
      * [iOS](#ios)
    * [Platform-centered workflow](#platform-centered-workflow)
      * [iOS 集成](#ios-集成)
      * [Android 集成](#android-集成)
  * [使用](#使用)
    * [Android 使用 X5 内核](#android-使用-x5-内核)
  * [插件](#插件)
    * [写插件](#写插件)

<!-- tocstop -->

## 文件/文件夹说明

* [Directory structure](http://cordova.apache.org/docs/en/6.x/reference/cordova-cli/index.html#directory-structure) 各目录作用
* [Cordova那些事儿（一）——Cordova相关目录结构](http://www.jianshu.com/p/b84e29228ae8)

目录

* `config.xml` 是一些跨平台的通用配置
* [merges/](http://cordova.apache.org/docs/en/6.x/reference/cordova-cli/index.html#merges) 不同平台要分开处理时，在这里分平台写代码
* `platforms/<platform>/platform_www/` 平台相关的 Web 内容
* `platforms/<platform>/www` 自定义的 Web 内容 + platform_www/ 中的内容

## 开发方式

* [Development Paths](http://cordova.apache.org/docs/en/latest/guide/overview/index.html#development-paths)

1. Cross-platform(CLI) workflow : CLI是一个High-Level的工具，可以允许你在多个平台上只建立一次工程。
2. Platform-centered workflow : 以Native为中心，使用WebView的形式嵌入。

### Cross-platform (CLI) workflow

参考 [Create your first Cordova app](http://cordova.apache.org/docs/en/latest/guide/cli/index.html)

```sh
npm install -g cordova
# cordova create <PATH> [ID [NAME [CONFIG]]] [options]
ordova create hello com.example.hello HelloWorld
cd hello
cordova platform add ios --save
cordova platform add android@6.2 --save # 6.2 以下的有 Bug
cordova platform add browser --save
cordova platform ls
# 拷贝相应文件到各个平台
cordova prepare
# 检查依赖
cordova requirements
# 编译
cordova compile
```

安装插件

```sh
cordova plugin add cordova-plugin-device --save
```

编译、运行 建议在各个平台用对应 IDE 完成

#### Android

* [Android Platform Guide](http://cordova.apache.org/docs/en/latest/guide/platforms/android/index.html#requirements-and-support)

```sh
# 拷贝 local.properties 到 Android 平台
cp local.properties ./
# 安装全局 gradle
sdk install gradle
# 安装当前工程的 wrapper
gradle wrapper
# 安装当前工程对应版的 gradle，并编译
./gradlew
```

#### iOS

* [iOS Platform Guide](http://cordova.apache.org/docs/en/latest/guide/platforms/ios/index.html#requirements-and-support)

### Platform-centered workflow

* [Embedding WebViews](http://cordova.apache.org/docs/en/latest/guide/hybrid/webviews/index.html)

#### iOS 集成

* [iOS WebViews](http://cordova.apache.org/docs/en/latest/guide/platforms/ios/webview.html)
* [Embedding the Webview](http://docs.phonegap.com/tutorials/develop/1-embed-webview/ios/)
* [Cordova那些事儿（二）——App中集成Cordova的正确姿势（iOS）](http://www.jianshu.com/p/47de57a454d3)

PhoneGap 文档写的比较详细，请参考 [Embedding the Webview - iOS](http://docs.phonegap.com/tutorials/develop/1-embed-webview/ios/)

方法一

```
1. 创建原生工程；pod 引入 Cordova
2. 使用Cordova-CLI创建Cordova工程；
3. 从“Cordova工程”的“原生平台工程”中，提取需要的文件，主要是以下几部分：
    config.xml
    ios.json 或 android.json
    platform_www 文件夹
    插件的原生部分代码
4. 加入到之前创建的原生工程中。
```

方法二

```
1. 创建原生工程；pod 引入 Cordova 和 plugins
2. 使用Cordova-CLI创建Cordova工程；
3. Cordova工程写代码
3. 从“Cordova工程”的“原生平台工程”中，拷贝 www 到原生工程中。
```

方法三 plugman 管理插件

安装 cordova 插件

```sh
plugman install --platform ios --project . --plugin cordova-plugin-device
```

#### Android 集成

* [Android WebViews](http://cordova.apache.org/docs/en/latest/guide/platforms/android/webview.html)

PhoneGap 文档写的比较详细，请参考 [Embedding the Webview - Android](http://docs.phonegap.com/tutorials/develop/1-embed-webview/android/)

Android Studio 安装 cordova 插件 `PhoneGap/Cordova Plugin`

安装 cordova 插件

```sh
plugman install --platform android --project . --plugin cordova-plugin-device
```

## 使用

1. 创建工程
2. 在工程根目录下的 `www` 目录下写代码
3. `cordova prepare` `www` 和 `plugins` 目录下文件会编译到 `platforms`
3. `cordova compile <platform>`  编译 `platforms` 下对应平台
4. `cordova run <platform>` 指定平台运行

其它

* build -> cordova prepare && cordova compile
* emulate -> cordova run --emulator
* 不要直接改 platforms/ 下的文件，因为 prepare 的时候会被覆盖

### Android 使用 X5 内核

* [offbye/cordova-plugin-x5engine-webview
](https://github.com/offbye/cordova-plugin-x5engine-webview)

## 插件

* [Plugin Development Guide](http://cordova.apache.org/docs/en/latest/guide/hybrid/plugins/index.html)

### 写插件

* 创建插件工程
* `cordova plugin add --link ../cordova-plugin-example`
* 运行对应 platform 工程
