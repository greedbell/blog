# iOS 原生与 JS 互相调用


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [iOS 原生与 JS 互相调用](#ios-原生与-js-互相调用)
	* [Java​Script​Core](#javascriptcore)
		* [原生调用 JS 函数](#原生调用-js-函数)
		* [JS 调用原生 block](#js-调用原生-block)
		* [调试](#调试)
		* [Other](#other)
		* [References](#references)
	* [React Native 与 Java​Script​Core](#react-native-与-javascriptcore)
		* [RCTBridge](#rctbridge)

<!-- /code_chunk_output -->


## Java​Script​Core

* JSContext 是 JavaScript 的运行上下文，他主要作用是执行js代码和注册native方法接口
* JSValue 是 JSContext 执行后的返回结果，他可以是任何js类型（比如基本数据类型和函数类型，对象类型等），并且都有对象的方法转换为native对象。
* JSManagedValue 是JSValue的封装，用它可以解决js和原声代码之间循环引用的问题
* JSVirtualMachine 管理JS运行时和管理js暴露的native对象的内存
* JSExport 是一个协议，通过实现它可以完成把一个native对象暴漏给js


### 原生调用 JS 函数

```js
JSValue *tripleFunction = context[@"triple"];
JSValue *result = [tripleFunction callWithArguments:@[@5] ];
NSLog(@"Five tripled: %d", [result toInt32]);
```

### JS 调用原生 block

```js
context[@"simplifyString"] = ^(NSString *input) {
   NSMutableString *mutableString = [input mutableCopy];
   CFStringTransform((__bridge CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, NO);
   CFStringTransform((__bridge CFMutableStringRef)mutableString, NULL, kCFStringTransformStripCombiningMarks, NO);
   return mutableString;
};

NSLog(@"%@", [context evaluateScript:@"simplifyString('안녕하새요!')"]);
```

### 调试

* <https://github.com/bang590/JSPatch/wiki/JS-%E6%96%AD%E7%82%B9%E8%B0%83%E8%AF%95>
* [Debugging JavaScriptCore using Safari Web Inspector](https://reality.hk/debugging-javascriptcore-using-safari-web-inspector/)

### Other

JavaScriptCore API是线程安全的，比如：我们能够在任意线程创建一个JSValue对象，或者执行script（evaluate scripts），所有其他的线程尝试使用相同的虚拟机都将进行等待。为了执行JavaScript多线程的并发，为每一个线程使用一个独立的 JSVirtualMachine。

### References

* [Java​Script​Core - nshipster](https://nshipster.com/javascriptcore/)
* [实现一个 JavaScriptCore 的 debugger —— iOS 篇 ](http://taobaofed.org/blog/2018/01/23/implement-javascriptcore-debugger-ios/)
* [JavaScriptCore全面解析 （上篇）](https://cloud.tencent.com/developer/article/1004875)
* [JavaScriptCore全面解析 （下篇）](https://cloud.tencent.com/developer/article/1004876)

## React Native 与 Java​Script​Core

in RCTCxxBridge.m

```
- (JSValue *)callFunctionOnModule:(NSString *)module
                           method:(NSString *)method
                        arguments:(NSArray *)arguments
                            error:(NSError **)error;
```

in JSCWrapper.h of jschelper

```
#include <JavaScriptCore/JavaScript.h>
JSC_WRAPPER_METHOD(JSEvaluateScript);
```

in JSBase.h

```
JS_EXPORT JSValueRef JSEvaluateScript(JSContextRef ctx, JSStringRef script, JSObjectRef thisObject, JSStringRef sourceURL, int startingLineNumber, JSValueRef* exception);
```

### RCTBridge
