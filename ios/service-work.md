# iOS 开启 Service Worker

WKWebView 开启 service worker 的源码参考 [WKWebView.mm#L559-L564](https://github.com/WebKit/WebKit/blob/releases/Apple/Safari-15.6-iOS-15.6/Source/WebKit/UIProcess/API/Cocoa/WKWebView.mm#L559-L564)

```cpp
#if PLATFORM(IOS_FAMILY) && ENABLE(SERVICE_WORKER)
    bool hasServiceWorkerEntitlement = (WTF::processHasEntitlement("com.apple.developer.WebKit.ServiceWorkers") || WTF::processHasEntitlement("com.apple.developer.web-browser")) && ![_configuration preferences]._serviceWorkerEntitlementDisabledForTesting;
    if (!hasServiceWorkerEntitlement && ![_configuration limitsNavigationsToAppBoundDomains])
        pageConfiguration->preferences()->setServiceWorkersEnabled(false);
    pageConfiguration->preferences()->setServiceWorkerEntitlementDisabledForTesting(!![_configuration preferences]._serviceWorkerEntitlementDisabledForTesting);
#endif
```

从源码分析，开启 Service Worker 的方法有：

## com.apple.developer.WebKit.ServiceWorkers

参考 [Enabling WKWebView ServiceWorker on real device](https://developer.apple.com/forums/thread/722160)，加该配置后无法在真机上运行

## com.apple.developer.web-browser

参考 [Preparing your app to be the default browser or email client](https://developer.apple.com/documentation/xcode/preparing-your-app-to-be-the-default-browser-or-email-client) 需要把 app 设为默认浏览器，而且需要发邮件给苹果申请

## limitsNavigationsToAppBoundDomains

iOS 14 后设置 `limitsNavigationsToAppBoundDomains` 为 `YES` 可以开启 Service Work，但是会有很多限制。

### limitsNavigationsToAppBoundDomains

- `NO`（默认）: 不限制只能跳转到 `WKAppBoundDomains` 列表的域名，如果配置了 `WKAppBoundDomains` 会限制 JS 注入等功能。
- `YES`: 限制只能跳转到 `WKAppBoundDomains` 列表的域名，不限制 JS 注入等功能。

### WKAppBoundDomains

只要配置了 `WKAppBoundDomains`

- 本地加载的静态资源默认添加到 `WKAppBoundDomains` 列表。
- 所有 `WKWebView` 实例都将默认不允许使用 `JavaScript injection, custom style sheets, cookie manipulation, and message handler` 等功能。如果要开启需要配置 `webViewConfiguration.limitsNavigationsToAppBoundDomains = YES;`

## 修改 WebKit 源码

- https://github.com/WebKit/WebKit/blob/releases/Apple/Safari-15.6-iOS-15.6/Source/WebKit/UIProcess/WebsiteData/Cocoa/WebsiteDataStoreCocoa.mm
- https://github.com/WebKit/WebKit/blob/releases/Apple/Safari-15.6-iOS-15.6/Source/WebKit/UIProcess/API/Cocoa/WKWebView.mm#L560

尝试使用 runtime 强制开启 service worker，但是 runtime 没法执行 c++ 的方法 `pageConfiguration->preferences()->setServiceWorkersEnabled(true);`

## References

- [App-Bound Domains](https://webkit.org/blog/10882/app-bound-domains/)
- [Workers at Your Service](https://webkit.org/blog/8090/workers-at-your-service/)
