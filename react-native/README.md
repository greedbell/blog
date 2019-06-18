# react-native

* [GitHub](https://github.com/facebook/react-native)
* [文档](http://facebook.github.io/react-native/docs/getting-started.html)
* [中文文档](http://reactnative.cn/)

## 开发环境

只能在 Mac 下开发，所以 Windows 需要用 VMWare 安装 mac OS.

## 新建工程

* [react-native-cli](https://github.com/facebook/react-native/tree/master/react-native-cli)
* [Use yarn when available](https://github.com/facebook/react-native/pull/10626)

new react-native - uses yarn

```shell
To run your app on iOS:
   cd /Users/Bell/react-native/ytest
   react-native run-ios
   - or -
   Open /Users/Bell/react-native/ytest/ios/ytest.xcodeproj in Xcode
   Hit the Run button
To run your app on Android:
   Have an Android emulator running (quickest way to get started), or a device connected
   cd /Users/Bell/react-native/ytest
   react-native run-android
```

## IDE

推荐用 WebStorm。

* File->Settings->Languages&Frameworks->JavaScript
JavaScript language version选择JSX Harmony

* [Using External tools: ESLint autofix and React Native](https://blog.jetbrains.com/webstorm/2016/08/using-external-tools/)

## 热更新

* [CodePush](https://microsoft.github.io/code-push/)

## 布局

* [FLex](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html) css3 新属性

## 框架

* [Flux](https://facebook.github.io/flux/) 单向数据流动,即永远只有从模型到视图的数据流动
* [Redux](https://github.com/reactjs/redux) 由 Flux 演变而来，后来受 Elm 启发，去掉了 Flux 的复杂性

* [Redux 中文文档](http://cn.redux.js.org/)

## Issue

* [ListView渲染问题](https://github.com/facebook/react-native/issues/499)

## 异常收集

* [sentry for react native](https://docs.sentry.io/clients/react-native/)
* [bugsnag for react native](https://blog.bugsnag.com/bugsnag-react-native/)
* [Add Crashlytics to your React Native iOS app](https://medium.com/delivery-com-engineering/add-crashlytics-to-your-react-native-ios-app-69a983a9062a) CLS_LOG 在崩溃的时候把 console 日志显示出来
* [react-native-fabric-crashlytics](https://github.com/mikelambert/react-native-fabric-crashlytics) 利用 Crashlytics 记录 js 异常信息

生成 `source map`

```sh
react-native bundle --platform ios --entry-file index.ios.js --dev false --bundle-output ./ios/main.jsbundle --assets-dest ./ios --sourcemap-output ./ios/sourcemap.js
```

## 源码分析

### Android

* [React Native与Android原生通信交互详情 ](http://www.lcode.org/react-native-android/)
* [React Native Android 从学车到补胎和成功发车经历 ](http://blog.csdn.net/yanbober/article/details/53071792)
* [React Native Android 源码框架浅析（主流程及 Java 与 JS 双边通信） ](http://blog.csdn.net/yanbober/article/details/53157456)
* [ReactNative Android源码分析](http://www.jianshu.com/p/02be425d7b13)
* [React Native通讯原理](http://www.jianshu.com/p/17d6f6c57a5c)

### iOS

* [ReactNative iOS源码解析（一） ](http://awhisper.github.io/2016/06/24/ReactNative%E6%B5%81%E7%A8%8B%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%90/)
* [ReactNative iOS源码解析（二） ](http://awhisper.github.io/2016/07/02/ReactNative%E6%BA%90%E7%A0%81%E5%88%86%E6%9E%902/)
* [Talk about ReactNative Image Component ](http://awhisper.github.io/2016/07/17/Talk-about-ReactNative-Image-Component/)
