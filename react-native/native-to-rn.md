# Native 调用 RN 组件

## 实现过程

JS 注册所有组件

```js
AppRegistry.registerComponent('name', () => Component);
```

iOS 根据注册的组件生成 `RCTRootView`

```js
RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                    moduleName:@"name"
                                             initialProperties:nil
                                                 launchOptions:launchOptions];
```

这样 Native 可以在任何地方使用任何 RN 组件

## 具体过程

JS Redux > JSCore > Native

## 利用原生模块实现 Native 与 RN 互相调用

### RN 调原生

原生模块自定义的方法 RN 可以直接调用

### 原生调RN

#### 方法一

iOS 利用 bridge 的 enqueueJSCall 方法

iOS in RCTBridge.h

```
/**
 * This method is used to call functions in the JavaScript application context.
 * It is primarily intended for use by modules that require two-way communication
 * with the JavaScript code. Safe to call from any thread.
 */
- (void)enqueueJSCall:(NSString *)moduleDotMethod args:(NSArray *)args;
- (void)enqueueJSCall:(NSString *)module method:(NSString *)method args:(NSArray *)args completion:(dispatch_block_t)completion;
```

Android:

参考 <https://stackoverflow.com/a/46035341/5266652>

To call a JavaScript method from Java, do something like this:

```java
ReactInstanceManager reactInstanceManager = reactNativeHost.getReactInstanceManager();
ReactContext reactContext = reactInstanceManager.getCurrentReactContext();

CatalystInstance catalystInstance = reactContext.getCatalystInstance();
WritableNativeArray params = new WritableNativeArray();
params.pushString("Parameter 1");
params.pushString("Parameter 3");
catalystInstance.callFunction("JavaScriptVisibleToJava", "nameOfJsMethod", params);
```

The JavaScript method you want to call must be defined and made visible to Java:

```js
import BatchedBridge from "react-native/Libraries/BatchedBridge/BatchedBridge";

export class ExposedToJava {
  nameOfJsMethod(message) {
    alert(message);
  }
}

const exposedToJava = new ExposedToJava();
BatchedBridge.registerCallableModule("JavaScriptVisibleToJava", exposedToJava);
```

### 方法二

直接使用事件

缺点，没有回调
