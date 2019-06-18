# WKWebView 的问题


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [WKWebView 的问题](#wkwebview-的问题)
  * [不能管理 cookies](#不能管理-cookies)
  * [缓存问题](#缓存问题)
  * [WKWebView发起的资源请求也是不经过NSURLProtocol](#wkwebview发起的资源请求也是不经过nsurlprotocol)
  * [POST请求无法发送参数](#post请求无法发送参数)
  * [`alert()` 不起作用](#alert-不起作用)
  * [跨域](#跨域)
  * [一个可点击的标签带有 `target='_blank'` 时，导致WKWebView无法加载点击后的网页的问题](#一个可点击的标签带有-target_blank-时导致wkwebview无法加载点击后的网页的问题)
  * [一些特殊应用：tel://，mailto://，微信的，自定义协议 不会跳转](#一些特殊应用telmailto微信的自定义协议-不会跳转)
  * [不支持 `keyboardDisplayRequiresUserAction`](#不支持-keyboarddisplayrequiresuseraction)
  * [没有 `scalesPageToFit` 参数](#没有-scalespagetofit-参数)
  * [本地文件 `iframe` 间通信报跨域错误](#本地文件-iframe-间通信报跨域错误)
  * [Other](#other)
  * [References](#references)

<!-- tocstop -->


## 不能管理 cookies

> 每次 request 的时候把 cookies 设置进去

## 缓存问题

```
WKWebView会忽视默认的网络存储， NSURLCache, NSHTTPCookieStorage, NSCredentialStorage。 目前是这样的，WKWebView有自己的进程，同样也有自己的存储空间用来存储cookie和cache， 其他的网络类如NSURLConnection是无法访问到的。导致无法自定义请求。这样导致了在使用时遇到了H5页面修改了，APP却没有更新到，想清理缓存却无从下手，
```

> 方法一：url后面加上时间戳，
> 方法二：iOS9之后WKWebView才有清除缓存的方法：

```
if ([[[UIDevicecurrentDevice] systemVersion]intValue ] > 8) {
      NSArray * types =@[WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeDiskCache]; // 9.0之后才有的　
      NSSet *websiteDataTypes = [NSSetsetWithArray:types];
      NSDate *dateFrom = [NSDatedateWithTimeIntervalSince1970:0];
      [[WKWebsiteDataStoredefaultDataStore] removeDataOfTypes:websiteDataTypesmodifiedSince:dateFrom completionHandler:^{
      }];
  }else{
      NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES) objectAtIndex:0];
      NSString *cookiesFolderPath = [libraryPathstringByAppendingString:@"/Cookies"];
      NSLog(@"%@", cookiesFolderPath);
      NSError *errors;
      [[NSFileManagerdefaultManager] removeItemAtPath:cookiesFolderPatherror:&errors];

  }
```

## WKWebView发起的资源请求也是不经过NSURLProtocol

> [让 WKWebView 支持 NSURLProtocol ](https://blog.yeatse.com/2016/10/26/support-nsurlprotocol-in-wkwebview/)

## POST请求无法发送参数

> 1. 使用NSURLSession解决WKWebView无法POST参数的问题（性能和结果都可能有问题，不推荐使用）
> 2. 使用JavaScript解决WKWebView无法发送POST参数问题

## `alert()` 不起作用

> 要实现 `WKUIDelegate` 的 `- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler` 方法

## 跨域

> `WKNavigationDelegate` 的 `- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler`

## 一个可点击的标签带有 `target='_blank'` 时，导致WKWebView无法加载点击后的网页的问题

> 解决办法：

参考 [WKWebView遇到_blank的处理方法](http://www.jianshu.com/p/3a75d7348843)  

```
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (!navigationAction.targetFrame.isMainFrame) {
        [webView evaluateJavaScript:@"var a = document.getElementsByTagName('a');for(var i=0;i<a.length;i++){a[i].setAttribute('target','');}" completionHandler:nil];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
```

## 一些特殊应用：tel://，mailto://，微信的，自定义协议 不会跳转

> 解决办法：

```
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
  NSURL *URL = navigationAction.request.URL;
          if ([self externalAppRequiredToOpenURL:URL]) {
              if ([[UIApplication sharedApplication] canOpenURL:URL]) {
                  [[UIApplication sharedApplication] openURL:URL];
                  decisionHandler(WKNavigationActionPolicyCancel);
                  return;
              }
          } else {
              if (!navigationAction.targetFrame) {
                  [webView loadRequest:navigationAction.request];
                  decisionHandler(WKNavigationActionPolicyCancel);
                  return;
              }
          }
          decisionHandler(WKNavigationActionPolicyAllow);
}


/**
 是否为打开外部 App

 @param URL URL description
 @return YES: 是的
 */
- (BOOL)externalAppRequiredToOpenURL:(NSURL *)URL {
    NSString *scheme = URL.scheme;
    if (scheme.length) {
        NSSet *validSchemes = [NSSet setWithArray:@[@"http", @"https"]];
        return ![validSchemes containsObject:URL.scheme];
    } else {
        return NO;
    }
}
```

## 不支持 `keyboardDisplayRequiresUserAction`

添加

```
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // support keyboardDisplayRequiresUserAction
        SEL sel = sel_getUid("_startAssistingNode:userIsInteracting:blurPreviousNode:userObject:");
        Class WKContentView = NSClassFromString(@"WKContentView");
        Method method = class_getInstanceMethod(WKContentView, sel);
        IMP originalImp = method_getImplementation(method);
        IMP imp = imp_implementationWithBlock(^void(id me, void* arg0, BOOL arg1, BOOL arg2, id arg3) {
            ((void (*)(id, SEL, void*, BOOL, BOOL, id))originalImp)(me, sel, arg0, TRUE, arg2, arg3);
        });
        method_setImplementation(method, imp);
    });
}
```

## 没有 `scalesPageToFit` 参数

## 本地文件 `iframe` 间通信报跨域错误

```
SecurityError (DOM Exception 18): Blocked a frame with origin "null" from accessing a frame with origin "null". Protocols, domains, and ports must match.
```

解决不了

## Other

忘了是做什么用的了

```
if (navigationAction.navigationType == WKNavigationTypeLinkActivated && [url.scheme isEqualToString:@"https"]) {
    [[UIApplication sharedApplication] openURL:url];
    decisionHandler(WKNavigationActionPolicyCancel);
    return;
}
```

## References

* [WKWebView我跨过去的坑](http://www.jianshu.com/p/f21508368f8c)
* [why (for instance) Google Chrome for iOS still uses UIWebView](https://bugs.chromium.org/p/chromium/issues/detail?id=423444)
* [WKWebView的使用和各种坑的解决方法（OC＋Swift）](http://www.jianshu.com/p/403853b63537)
* [浅谈iOS中WKWebView和UIWebView的清除缓存问题 ](http://blog.csdn.net/u010105969/article/details/53943101)
* [WKWebView从入门到趟坑](http://www.jianshu.com/p/90a90bd13aac)
