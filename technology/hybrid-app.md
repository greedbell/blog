# 混合 App

Web 与 原生交互


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [混合 App](#混合-app)
  * [通过 JS 与原生交互](#通过-js-与原生交互)
    * [缺点](#缺点)
    * [UIWebView JS 调 OC](#uiwebview-js-调-oc)
    * [OC 调 UIWebView JS](#oc-调-uiwebview-js)
    * [WKWebview JS 调 OC](#wkwebview-js-调-oc)
    * [OC 调 WKWebview JS](#oc-调-wkwebview-js)
    * [Android](#android)
    * [第三方实现](#第三方实现)
  * [通过 URL 与原生交互](#通过-url-与原生交互)
    * [优点](#优点)
    * [缺点](#缺点-1)
    * [Android](#android-1)
    * [iOS UIWebView](#ios-uiwebview)
    * [iOS WKWebView](#ios-wkwebview)
  * [通过 XHR/Ajax 与原生交互](#通过-xhrajax-与原生交互)
    * [优点](#优点-1)
    * [缺点](#缺点-2)
    * [Android](#android-2)
      * [References](#references)
    * [iOS](#ios)
    * [References](#references-1)
  * [Cordova](#cordova)
    * [使用方法](#使用方法)
    * [UI 库](#ui-库)
    * [存储](#存储)
    * [热更新](#热更新)
  * [第三方引擎](#第三方引擎)
    * [iOS](#ios-1)
    * [Android](#android-3)
      * [基于chrome webkit的crosswalk WebView](#基于chrome-webkit的crosswalk-webview)
      * [X5内核的WebView](#x5内核的webview)
      * [References](#references-2)
  * [Other](#other)
  * [References](#references-3)

<!-- tocstop -->


## 通过 JS 与原生交互

### 缺点

* 同步，会阻塞线程

### UIWebView JS 调 OC

* UIWebView JavaScriptCore

### OC 调 UIWebView JS

* stringByEvaluatingJavaScriptFromString

### WKWebview JS 调 OC

* `window.webkit.messageHandlers.<name>.postMessage(<messageBody>)`

### OC 调 WKWebview JS

* `[_webView evaluateJavaScript:source completionHandler:nil];`
* callWithArguments

### Android

* 4.2 以下 addJavascriptInterface 有安全隐患

参考

* [JS与WebView交互存在的一些问题](http://www.jianshu.com/p/93cea79a2443)
* [Android WebView调用JS](http://unclechen.github.io/2015/11/26/Android-WebView%E8%B0%83%E7%94%A8JS/)
* [Android 4.4 中 WebView 使用注意事项](https://github.com/cundong/blog/blob/master/Android%204.4%20%E4%B8%AD%20WebView%20%E4%BD%BF%E7%94%A8%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A1%B9.md)

### 第三方实现

* Android [JsBridge](https://github.com/lzyzsd/JsBridge) 自定义 `window.WebViewJavascriptBridge` 方式实现

* iOS [WebViewJavascriptBridge](https://github.com/marcuswestin/WebViewJavascriptBridge) iframe 中 `https://__bridge_loaded__` 实现

JsBridge 和 WebViewJavascriptBridge 实现的原理:

* Web > 原生： `原生监听 URL > Web 请求对应 URL，并定义唯一ID，监听对应ID的响应 > 原生收到 URL 后，做相应响应发起对应唯一ID的 URL 请求 > Web 响应回调`
* 原生 > Web: `Web 监听 URL > 原生 请求对应 URL，并定义唯一ID，监听对应ID的响应 > Web 收到请求后，做相应响应发起对应唯一ID的 URL 回调 > 原生 响应回调`

## 通过 URL 与原生交互

### 优点

* 相比 JS 调 原生，全平台统一
* 无回调，没有阻塞线程问题

### 缺点

* 只适用于 Web 调 原生
* 所有跳转都会判断是否满足要求
* 不支持链接会 404
* 没有回调

### Android

在该方法替换返回数据

```java
@Override publicboolean shouldOverrideUrlLoading(WebView view,String
 url)
```
### iOS UIWebView

```objc
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
```

### iOS WKWebView

```objc
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;
```

## 通过 XHR/Ajax 与原生交互

* 最好用自定义 scheme 的方式处理

### 优点

* 相比 URL 会引起页面刷新
* 相比 URL 有回调
* 相比 JS 异步、接口统一

### 缺点

* 只适用于 Web 调 原生

### Android

没有办法再`shouldOverrinding`中拦截并用`webView.loadUrl(String url,HashMap headers)`方法添加请求头

一个临时的办法解决：
首先需要在url中加特殊标记/协议, 如在`onWebViewResource`方法中拦截对应的请求，然后将要添加的请求头，以get形式拼接到url末尾
在`shouldInterceptRequest()`方法中,可以拦截到所有的网页中资源请求，比如加载JS，图片以及Ajax请求等等

#### References

* [Android WebView常见问题及解决方案汇总](http://www.2cto.com/kf/201311/255576.html)
* [Android中WebView中拦截所有请求并替换URL](https://github.com/cnzx219/my-note/blob/master/2015/android-webview-intercept-request.md)

### iOS

使用 `NSURLProtocol` 实现

参考

* [iOS WebView使用Ajax与iOS的交互 ](https://my.oschina.net/ososchina/blog/735693)
* [NSURLProtocol-WebKitSupport](https://github.com/yeatse/NSURLProtocol-WebKitSupport)
* [让 WKWebView 支持 NSURLProtocol ](https://blog.yeatse.com/2016/10/26/support-nsurlprotocol-in-wkwebview/)

### References

* [android webview中js异步调用native接口实现](http://www.html-js.com/article/2440)

## Cordova

### 使用方法

1. Cross-platform(CLI) workflow : CLI是一个High-Level的工具，可以允许你在多个平台上只建立一次工程。
2. Platform-centered workflow : 以Native为中心，使用WebView的形式嵌入。

### UI 库

使用基于 VUE 的 UI 库

* [Vux](https://github.com/airyland/vux)
* [Mint UI](https://github.com/ElemeFE/mint-ui/)
* [framework7-vue](http://vue.framework7.cn/)
* [Onsen UI for Vue 2](https://onsen.io/vue/)

> 可以结合一起用，取长补短

使用 基于 AngularJS 的 UI 库

* [Ionic](http://ionicframework.com/)
* [Ionic Github](https://github.com/driftyco/ionic)

### 存储

数据少时用 `localstorage`，数据多时用 `SQLite`

* [cordova Storage](http://cordova.apache.org/docs/en/6.x/cordova/storage/storage.html)
* [ionic SQLite](https://ionicframework.com/docs/v2/native/sqlite/)
* [Cordova-sqlite-storage](https://github.com/litehelpers/Cordova-sqlite-storage)

### 热更新

* [cordova-hot-code-push](https://github.com/nordnet/cordova-hot-code-push) 热更新插件
* [ordova-hot-code-push-cli](https://github.com/nordnet/cordova-hot-code-push-cli) cordova-hot-code-push 命令行工具, 热更新服务器
* [cordova-app-loader](https://github.com/markmarijnissen/cordova-app-loader) 热更新插件-只更新修改部分

这种方式热更新不会被苹果拒

## 第三方引擎

### iOS

* 苹果不让用

### Android

4.4 以下 WebView 用的 WebKit 内核，性能很差

#### 基于chrome webkit的crosswalk WebView

性能最好，但是太大

#### X5内核的WebView

* [官网](http://x5.tencent.com)

> 不过我建议使用腾讯的X5内核，我项目目前在使用，腾讯浏览服务，你不用把整个内核集成到你的APP去，而是如果你的手机有安装手机QQ或者微信，它就会自行调用他们的内核，另外现在还提供下载内核的功能。项目使用以来没有出现什么大问题，平稳使用中。

18.请问下x5中js调用android怎么实现？

> 跟系统内核下一样，都借助 addjavainterface 实现

#### References

* [Android WebView的几种选择对比](https://lingenliu.com/2016/09/03/something-about-android-webview/)

## Other

* [cordova-plugin-wkwebview-engine](https://github.com/apache/cordova-plugin-wkwebview-engine)
* [微信JS-SDK说明文档](http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html)

## References

* [用Cordova封装hybrid app的性能能接受吗](https://github.com/airyland/vux/issues/723)
* [Crosswalk comes to Ionic](http://blog.ionic.io/crosswalk-comes-to-ionic/)
