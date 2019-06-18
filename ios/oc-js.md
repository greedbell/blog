# js 与 oc 间调用

使用 `JavaScriptCore.framework`

```objc
#import <JavaScriptCore/JavaScriptCore.h>
```

## oc 调 js

### UIWebView

```objc
- (nullable NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;
```

只能在主线程执行

### WKWebview

```objc
- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void (^ _Nullable)(_Nullable id, NSError * _Nullable error))completionHandler;
```

### UIWebView JavaScriptCore

WKWebView 不支持通过如下的KVC的方式创建JSContext

#### evaluateScript

```objc
JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
NSString *textJS = @"showAlert('这里是JS中alert弹出的message')";
[context evaluateScript:textJS];
```

#### callWithArguments

```objc
JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

[context[@"payResult"] callWithArguments:@[@"支付弹窗"]];
```

## js 调 oc

### UIWebView

### WKWebview

[MessageHandler](http://www.jianshu.com/p/433e59c5a9eb)

### UIWebView JavaScriptCore

```objc
// 获取webView上的js
    JSContext *contest = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    contest[@"test"] = ^(){
        NSLog(@"test按钮被点击了!!");
        // 这里网页上的按钮被点击了, 客户端可以在这里拦截到,并进行操作
    };
```

block中是在子线程，因此执行UI操作，控制台有警告，需要回到主线程再操作UI。

## References

* [WebViewJavascriptBridge](https://github.com/marcuswestin/WebViewJavascriptBridge)
* [UIWebView和WKWebView的使用及js交互](http://liuyanwei.jumppo.com/2015/10/17/ios-webView.html)
