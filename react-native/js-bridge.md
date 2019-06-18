# RN JS Bridge 过程


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [RN JS Bridge 过程](#rn-js-bridge-过程)
	* [JS 端](#js-端)
	* [iOS 端](#ios-端)
		* [JS > Native](#js-native)
			* [注册 JS 调用的 Native 方法](#注册-js-调用的-native-方法)
			* [JS 调用 Native 方法](#js-调用-native-方法)
		* [Native > JS](#native-js)
			* [注册 Native 调用的 JS 方法](#注册-native-调用的-js-方法)
			* [Native 调用 JS 方法](#native-调用-js-方法)

<!-- /code_chunk_output -->

## JS 端

BatchedBridge

## iOS 端

### JS > Native

#### 注册 JS 调用的 Native 方法

满足 RCTBridgeModule 协议的类得到 RCTMethodInfo

RCTMethodInfo > RCTModuleMethod

RCTModuleData 包含 moduleName 和 `NSArray<id<RCTBridgeMethod>> *methods`

#### JS 调用 Native 方法

### Native > JS

#### 注册 Native 调用的 JS 方法

EventEmitter.js
```JS
emit(eventType: string){}
```

#### Native 调用 JS 方法

```
[_bridge enqueueJSCall:@"RCTDeviceEventEmitter"
                method:@"emit"
                  args:body ? @[eventName, body] : @[eventName]
            completion:NULL];
```
