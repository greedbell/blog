# RN Compoent 转 Native


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [RN Compoent 转 Native](#rn-compoent-转-native)
	* [RN](#rn)
		* [AppContainer](#appcontainer)
		* [AppRegistry](#appregistry)
			* [registerComponent](#registercomponent)
			* [runApplication](#runapplication)
			* [unmountApplicationComponentAtRootTag](#unmountapplicationcomponentatroottag)
	* [iOS](#ios)
		* [RCTBridge](#rctbridge)
		* [RCTRootView](#rctrootview)
		* [过程](#过程)
	* [Android](#android)
		* [ReactRootView](#reactrootview)
	* [原生直接调用 RN 的 JS 方法](#原生直接调用-rn-的-js-方法)
	* [References](#references)

<!-- /code_chunk_output -->

## RN

### AppContainer
?

### AppRegistry

#### registerComponent

```
/**
 注册组件

 从组件的 props 获取 runApplication 传过来的参数。

 @param appKey 组件 Key
 @param componentProvider 组件 Class
 */
static registerComponent(appKey, componentProvider, section?)
```

原生可能通过 appKey 得到相应原生 View

#### runApplication

```
/*
 启动 appKey 对应的组件

 @param appKey 组件 Key
 @param appParameters 传给组件的参数
 */
static runApplication(appKey, appParameters)
```

原生的 `RCTRootView` 在加载成功后会调用

#### unmountApplicationComponentAtRootTag

```
// 注销已经启动的组件
static unmountApplicationComponentAtRootTag(rootTag)
```

原生的 `RCTRootContentView` 在注销时会调用

## iOS

### RCTBridge

实现部分大部分在 `RCTCxxBridge`

```
/**
初始化 RCTBridge

这里会初始化所有原生模块。

@param delegate 获取 bundleURL 的代理
@param launchOptionslaunchOptions 启动参数
*/
- (instancetype)initWithDelegate:(id<RCTBridgeDelegate>)delegate
                   launchOptions:(NSDictionary *)launchOptions;

/**
初始化 RCTBridge 【弃用】

这里会初始化所有原生模块。

@param bundleURL bundle 包
@param launchOptionslaunchOptions 启动参数
*/
- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                   moduleProvider:(RCTBridgeModuleListProvider)block
                    launchOptions:(NSDictionary *)launchOptions;


/**
异步调用原生模块提供的方法

通过回调获取结果
*/
- (void)enqueueJSCall:(NSString *)module method:(NSString *)method args:(NSArray *)args completion:(dispatch_block_t)completion;

/**
同步执行原生模块里的方法

直接返回结果
*/
- (JSValue *)callFunctionOnModule:(NSString *)module
                           method:(NSString *)method
                        arguments:(NSArray *)arguments
                            error:(NSError **)error;
```

### RCTRootView

```
// 对应 AppRegistry.registerComponent 的 appKey
@property (nonatomic, copy, readonly) NSString *moduleName;
// 初始化参数，最终会传给 AppRegistry.registerComponent 注册的组件
@property (nonatomic, copy, readwrite) NSDictionary *appProperties;
// JS 加载阶段的 placeholder view，默认为 nil，可以设值
@property (nonatomic, strong) UIView *loadingView;
// 隐藏 loadingView 的延时，默认 0.25
@property (nonatomic, assign) NSTimeInterval loadingViewFadeDelay;
// 隐藏 loadingView 的持续时间，默认 0.25
@property (nonatomic, assign) NSTimeInterval loadingViewFadeDuration;

/**
创建有多个 RootView 的工程时用下面的初始化方法

@param initialProperties 初始化参数，最终会传给 AppRegistry.registerComponent 注册的组件
*/
- (instancetype)initWithBridge:(RCTBridge *)bridge
                    moduleName:(NSString *)moduleName
             initialProperties:(NSDictionary *)initialProperties

/**
创建只有一个 RootView 的工程时用下面的初始化方法
*/
- (instancetype)initWithBundleURL:(NSURL *)bundleURL
                       moduleName:(NSString *)moduleName
                initialProperties:(NSDictionary *)initialProperties
                    launchOptions:(NSDictionary *)launchOptions
```

`RCTRootView` 加载过程：

1. RCTJavaScriptDidLoadNotification JS Bundle 下载成功
2. RCTBridgeDidDownloadScriptNotification JS 加载成功
3. RCTDidInitializeModuleNotification 每个原生模块加载成功
4. 所有原生模块加载成功就可以当成功处理。

### 过程

1. RN `AppRegistry.registerComponent` 注册多个 Component
2. 初始化唯一的 `RCTBridge`
3. 初始化多个包含 `RCTRootView` 的 `ViewController`

## Android

### ReactRootView

```java
private void defaultJSEntryPoint() {
  // ...
  // 调用 JS 的 AppRegistry.runApplication 方法
  catalystInstance.getJSModule(AppRegistry.class).runApplication(jsAppModuleName, appParams);
}
```

## 原生直接调用 RN 的 JS 方法

RN 注册 Class.method 方法

```
const method = () => {
  // do some thing
}

BatchedBridge.registerCallableModule('Class', {
  method
});
```

iOS 调用 RN 注册的 Class.method 方法

```
[bridge enqueueJSCall:@"Class"
               method:@"method"
                 args:nil
          completion:nil];
```

Android 调用 RN 注册的 Class.method 参考 <https://github.com/facebook/react-native/blob/59aada873e13bf0b1f5e3a10cfe9a5a45c28f9fb/ReactAndroid/src/main/java/com/facebook/react/ReactRootView.java#L492>

```
String jsAppModuleName = getJSModuleName();
catalystInstance.getJSModule(Class.class).method(jsAppModuleName, null);
```

## References

* [AppRegistry](https://facebook.github.io/react-native/docs/appregistry.html)
