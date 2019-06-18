# WKWebView 的使用


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [WKWebView 的使用](#wkwebview-的使用)
  * [WKNavigationDelegate](#wknavigationdelegate)
  * [WKUIDelegate](#wkuidelegate)
  * [WKWebViewConfiguration](#wkwebviewconfiguration)
    * [WKProcessPool](#wkprocesspool)
    * [WKPreferences](#wkpreferences)
    * [WKUserContentController](#wkusercontentcontroller)
      * [WKUserScript](#wkuserscript)
    * [WKWebsiteDataStore](#wkwebsitedatastore)
  * [NSURLProtocol](#nsurlprotocol)
  * [加载进度](#加载进度)
  * [相关资料](#相关资料)

<!-- tocstop -->

## WKNavigationDelegate

网页跳转间的导航管理协议，这个协议可以监听网页的活动

* [【iOS开发】WKWebView学习笔记(2)－WKNavigationDelegate](http://www.jianshu.com/p/f9c0ef72b01e)

```objc
//请求之前，决定是否要跳转:用户点击网页上的链接，需要打开新页面时，将先调用这个方法。
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler;
//接收到相应数据后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler;
//页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation;
// 主机地址被重定向时调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(null_unspecified WKNavigation *)navigation;
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation;
// 页面加载完毕时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;
//跳转失败时调用
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error;
// 如果需要证书验证，与使用AFN进行HTTPS证书验证是一样的
- (void)webView:(WKWebView *)webView didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential *__nullable credential))completionHandler;
//9.0才能使用，web内容处理中断时会触发
- (void)webViewWebContentProcessDidTerminate:(WKWebView *)webView NS_AVAILABLE(10_11, 9_0);
```

## WKUIDelegate

用于交互处理JavaScript中的一些弹出框

* [【iOS开发】WKWebView学习笔记(3)－WKUIDelegate](http://www.jianshu.com/p/5f4bba47e323)
* [WebKit(WKUIDelegate) ](http://blog.csdn.net/y550918116j/article/details/50134853)

```
// 新建WKWebView
- (nullable WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures;

// 关闭WKWebView
- (void)webViewDidClose:(WKWebView *)webView NS_AVAILABLE(10_11, 9_0);

// 对应js的Alert方法
/**
 *  web界面中有弹出警告框时调用
 *
 *  @param webView           实现该代理的webview
 *  @param message           警告框中的内容
 *  @param frame             主窗口
 *  @param completionHandler 警告框消失调用
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler;

// 对应js的confirm方法
- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL result))completionHandler;

// 对应js的prompt方法
- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * __nullable result))completionHandler;
```

## WKWebViewConfiguration

WKWebView 配置

```objc
WKWebView * WK;
WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
WK = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-40) configuration:config];
[WK loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
```

```objc
//设置是否将网页内容全部加载到内存后再渲染
config.suppressesIncrementalRendering = NO;
//设置HTML5视频是否允许网页播放 设置为NO则会使用本地播放器
config.allowsInlineMediaPlayback =  YES;
//设置是否允许ariPlay播放
config.allowsAirPlayForMediaPlayback = YES;
//设置视频是否需要用户手动播放  设置为NO则会允许自动播放
config.requiresUserActionForMediaPlayback = NO;
//设置是否允许画中画技术 在特定设备上有效
config.allowsPictureInPictureMediaPlayback = YES;
//设置选择模式 是按字符选择 还是按模块选择
/*
typedef NS_ENUM(NSInteger, WKSelectionGranularity) {
    //按模块选择
    WKSelectionGranularityDynamic,
    //按字符选择
    WKSelectionGranularityCharacter,
} NS_ENUM_AVAILABLE_IOS(8_0);
*/
config.selectionGranularity = WKSelectionGranularityCharacter;
//设置请求的User-Agent信息中应用程序名称 iOS9后可用
config.applicationNameForUserAgent = @"HS";
// 确定哪些媒体类型需要用户手势开始播放。
config.media​Types​Requiring​User​Action​For​Playback = WKAudiovisualMediaTypeNone;
```

### WKProcessPool

配置进程池，与网页视图的资源共享有关

```objc
//设置进程池
WKProcessPool * pool = [[WKProcessPool alloc]init];
config.processPool = pool;
```

### WKPreferences

偏好设置

```objc
//进行偏好设置
WKPreferences * preference = [[WKPreferences alloc]init];
//最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
preference.minimumFontSize = 0;
//设置是否支持javaScript 默认是支持的
preference.javaScriptEnabled = YES;
//设置是否允许不经过用户交互由javaScript自动打开窗口
preference.javaScriptCanOpenWindowsAutomatically = YES;
config.preferences = preference;
```

### WKUserContentController

主要用来做native与JavaScript的交互管理

```objc
//设置内容交互控制器 用于处理JavaScript与native交互
WKUserContentController * userController = [[WKUserContentController alloc]init];
//设置处理代理并且注册要被js调用的方法名称
[userController addScriptMessageHandler:self name:@"name"];
//js注入，注入一个测试方法。
NSString *javaScriptSource = @"function userFunc(){window.webkit.messageHandlers.name.postMessage( {\"name\":\"HS\"})}";
WKUserScript *userScript = [[WKUserScript alloc] initWithSource:javaScriptSource injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:YES];// forMainFrameOnly:NO(全局窗口)，yes（只限主窗口）
[userController addUserScript:userScript];
config.userContentController = userController;
```

监听 js

```
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //这里可以获取到JavaScript传递进来的消息
}
```

#### WKUserScript

注入 Web 的 JS 对象

```
// 注入时间
/*! @abstract 初始化.
 @param source 脚本内容.
 @param injectionTime 注入时机.
 @param forMainFrameOnly 是否只针对主界面注入.
 */
- (instancetype)initWithSource:(NSString *)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly;
```

### WKWebsiteDataStore

iOS9以后才能用这个类，是代表webView不同的数据类型，cookies、disk、memory caches、WebSQL、IndexedDB数据库和本地存储。

```
//设置数据存储store
config.websiteDataStore = [WKWebsiteDataStore defaultDataStore];
```

```
//获取默认的存储器 此存储器为持久性的会被写入磁盘
+ (WKWebsiteDataStore *)defaultDataStore;
//获取一个临时的存储器
+ (WKWebsiteDataStore *)nonPersistentDataStore;
//存储器是否是临时的
@property (nonatomic, readonly, getter=isPersistent) BOOL persistent;
//所有可以存储的类型
+ (NSSet<NSString *> *)allWebsiteDataTypes;
```

数据存储类型

```
/*! @constant 外存 caches. */
WK_EXTERN NSString * const WKWebsiteDataTypeDiskCache API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant 内存 caches. */
WK_EXTERN NSString * const WKWebsiteDataTypeMemoryCache API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant WKWebsiteDataTypeOfflineWebApplicationCache HTML offline web application caches. */
WK_EXTERN NSString * const WKWebsiteDataTypeOfflineWebApplicationCache API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant Cookies. */
WK_EXTERN NSString * const WKWebsiteDataTypeCookies API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant session. */
WK_EXTERN NSString * const WKWebsiteDataTypeSessionStorage API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant HTML local storage. */
WK_EXTERN NSString * const WKWebsiteDataTypeLocalStorage API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant WebSQL databases. */
WK_EXTERN NSString * const WKWebsiteDataTypeWebSQLDatabases API_AVAILABLE(macosx(10.11), ios(9.0));

/*! @constant IndexedDB databases. */
WK_EXTERN NSString * const WKWebsiteDataTypeIndexedDBDatabases API_AVAILABLE(macosx(10.11), ios(9.0));

```

## NSURLProtocol

只能通过私有方法获取

NSURLProtocol在拦截NSURLSession的POST请求时不能获取到Request中的HTTPBody

这个方法还是只适合注册自己定义的 scheme，不适合用来拦 http(s) 请求

* [让 WKWebView 支持 NSURLProtocol ](https://blog.yeatse.com/2016/10/26/support-nsurlprotocol-in-wkwebview/)
* [iOS 开发中使用 NSURLProtocol 拦截 HTTP 请求](http://draveness.me/intercept/)
* [iOS WKWebView (NSURLProtocol)拦截js、css，图片资源](http://www.jianshu.com/p/4fc13d4d5607)
* [iOS开发之NSURLProtocol的那些坑](http://www.voidcn.com/blog/xanxus46/article/p-6123061.html)
* [NSURLProtocol-WebKitSupport](https://github.com/yeatse/NSURLProtocol-WebKitSupport)

## 加载进度

> estimatedProgress

通过`KVO`监听

## 相关资料

* <http://nshipster.cn/wkwebkit/>
* <http://www.brighttj.com/ios/ios-wkwebview-new-features-and-use.html>
