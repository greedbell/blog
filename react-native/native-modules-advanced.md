# 原生模块高级篇


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [原生模块高级篇](#原生模块高级篇)
	* [UI 模块直接加到父级组件上](#ui-模块直接加到父级组件上)
	* [UI 模块不是直接加到父级组件上](#ui-模块不是直接加到父级组件上)
		* [iOS](#ios)
		* [Android](#android)
	* [原生模块集成 CocoaPods](#原生模块集成-cocoapods)

<!-- /code_chunk_output -->

## UI 模块直接加到父级组件上

// TODO

## UI 模块不是直接加到父级组件上

### iOS

参考 react native 的 Modal 组件，Modal 实现方式是加载的时候 present 一个 controller，所有 subview 都加到 controller.view 上，移除的时候 dismiss controller。

这种情况需要修改 view 的如下方法

* `didMoveToWindow` 参考 [RCTModalHostView.didMoveToWindow](https://github.com/facebook/react-native/blob/0.47-stable/React/Views/RCTModalHostView.m#L120-L141)，`self.window` 不为空的时候自定义加载操作
* `didMoveToSuperview` 参考 [RCTModalHostView.didMoveToSuperview](https://github.com/facebook/react-native/blob/0.47-stable/React/Views/RCTModalHostView.m#L143-L150)，`self.superview` 为空的时候自定义移除操作
* `insertReactSubview:atIndex:` 自定义 subview 加载到 view
* `removeReactSubview:` 自定义 subview 从 view 移除

由于 UI 模块的加载和移除方式都已自定义，所以需要实现 `RCTInvalidating` 协议的 `invalidate` 方法，实现 UI 模块从从父组件移除的处理。实现过程如下：

* `Manager.view` 参考 [RCTModalHostViewManager.view](https://github.com/facebook/react-native/blob/0.47-stable/React/Views/RCTModalHostViewManager.m#L58-L67) 把所有 view 缓存到一个 `NSHashTable`
* `Manager.invalidate` 参考 [RCTModalHostViewManager.invalidate](https://github.com/facebook/react-native/blob/0.47-stable/React/Views/RCTModalHostViewManager.m#L98-L104) 调用所有 view 的 `invalidate` 方法
* `View.invalidate` 参考 [RCTModalHostView.invalidate](https://github.com/facebook/react-native/blob/0.47-stable/React/Views/RCTModalHostView.m#L152-L157) 实现从父组件移除

由于自定义了加载过程，所以所有 subview 的手势不会传递到 `reactRootView`，JS 就监听不到 subview 的动作。这个时候需要用上 `RCTTouchHandler` ，使用方法参考 `RCTModalHostView` ：

* `initWithBridge:` 调用 `_touchHandler = [[RCTTouchHandler alloc] initWithBridge:bridge];` 创建 `_touchHandler`
* `insertReactSubview:atIndex` 调用 `[_touchHandler attachToView:subview];` subview 添加手势
* `removeReactSubview:` 调用 `[_touchHandler detachFromView:subview];` 移除 subview 的手势

### Android

// TODO

## 原生模块集成 CocoaPods

1. target 名必须和 project 名一致，否则 link 的时候会报 `Error: Cannot read property 'match' of undefined` 参考 <https://github.com/Microsoft/react-native-code-push/issues/1085#issuecomment-346389824>
