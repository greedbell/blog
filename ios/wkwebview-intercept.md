# WKWebView 请求拦截

WKWebView 在独立于 app 进程之外的进程中执行网络请求，请求数据不经过主进程，因此，在 WKWebView 上直接使用 NSURLProtocol 无法拦截请求。

## WKURLSchemeHandler

正常情况下，无法拦截标准 scheme，只能拦截自定义 scheme。添加如下代码才支持

```objc
@interface WKWebView (SHMSchemeHandler)

@end

@implementation WKWebView (SHMSchemeHandler)

// 强制返回 NO，所有 scheme 都可以用 [WKWebViewConfiguration setURLSchemeHandler:forURLScheme:] 自定义处理
+ (BOOL)handlesURLScheme:(NSString *)urlScheme {
    return NO;
}

@end
```

## References

- [WKWebView 请求拦截探索与实践](https://segmentfault.com/a/1190000039111381)
- [WKWebView 完美网络请求拦截](https://juejin.cn/post/6844904154629046280)
