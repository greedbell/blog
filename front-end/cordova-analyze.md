# Cordova 分析


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Cordova 分析](#cordova-分析)
  * [Cordova-Android](#cordova-android)
    * [Web > Native](#web-native)
      * [Cordova-Android 监听 JS](#cordova-android-监听-js)
      * [Web > Web 插件](#web-web-插件)
      * [Web 插件 > Cordova-Android](#web-插件-cordova-android)
      * [Cordova-Android > Native 插件](#cordova-android-native-插件)
      * [Native 插件 > Cordova-Android](#native-插件-cordova-android)
      * [Cordova-Android > Web](#cordova-android-web)
  * [Cordova-iOS](#cordova-ios)
    * [Web > Native](#web-native-1)
      * [Cordova-iOS 注册 Native 插件](#cordova-ios-注册-native-插件)
      * [Web > Web 插件](#web-web-插件-1)
      * [Web 插件 > Cordova-iOS](#web-插件-cordova-ios)
      * [Cordova-iOS > Native 插件](#cordova-ios-native-插件)
      * [Native 插件 > Cordova-iOS](#native-插件-cordova-ios)

<!-- tocstop -->

## Cordova-Android

* [apache/cordova-android](https://github.com/apache/cordova-android)

### Web > Native

实现过程

#### Cordova-Android 监听 JS

```java
SystemExposedJsApi exposedJsApi = new SystemExposedJsApi(bridge);
        webView.addJavascriptInterface(exposedJsApi, "_cordovaNative");
```

#### Web > Web 插件

Web 调用 Web 插件自定义的函数

#### Web 插件 > Cordova-Android

```JS
cordova.exec()
```

#### Cordova-Android > Native 插件

```JS
window._cordovaNative.exec() > SystemExposedJsApi.exec()
```

#### Native 插件 > Cordova-Android

```java
execute()
```

#### Cordova-Android > Web

执行 Web 定义的 Callback

```JS
SystemExposedJsApi.execute() > callbackContext.sendPluginResult(r)
```

## Cordova-iOS

* [apache/cordova-ios](https://github.com/apache/cordova-ios)

### Web > Native

实现过程

#### Cordova-iOS 注册 Native 插件

把 Native 插件中继承 CDVPlugin 的类注册到 Cordova

#### Web > Web 插件

Web 调用 Web 插件自定义的函数

#### Web 插件 > Cordova-iOS

```JS
cordova.exec()
```

#### Cordova-iOS > Native 插件

```JS
exec.js 的 pokeNative() 以 iframe 方式发送请求 > UIWebViewDelegate 的 shouldStartLoadWithRequest 监听请求 > CDVPlugin
```

#### Native 插件 > Cordova-iOS

* 继承 `CDVPlugin` 的类实现 `Web 插件` 定义的方法
* 调用 `CDVCommandDelegate` 的 `- (void)sendPluginResult:(CDVPluginResult*)result callbackId:(NSString*)callbackId` 方法实现回调
