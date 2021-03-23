# 触摸事件和手势



<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

- [触摸事件和手势](#触摸事件和手势)
  - [JS](#js)
  - [Android](#android)
    - [TouchEvent](#touchevent)
    - [PanResponder](#panresponder)
  - [iOS](#ios)
    - [RCTView](#rctview)
    - [关于sendInputEventWithName事件名自定义](#关于sendinputeventwithname事件名自定义)
  - [References](#references)

<!-- /code_chunk_output -->

## JS

* Event.target 点击的组件 reactTag
* Event.currentTarget 响应的组件 reactTag

```js
var { getInstanceFromNode, getFiberCurrentPropsFromNode } = require('ReactNativeComponentTree');
// 获取按钮 node
var currentTargetNode = getInstanceFromNode(e.currentTarget);
// 获取按钮 props
var currentTargetProps = getFiberCurrentPropsFromNode(currentTargetNode.stateNode);
```

## Android

### TouchEvent

```java
public static TouchEvent obtain(
      int viewTag,
      TouchEventType touchEventType,
      MotionEvent motionEventToCopy,
      long gestureStartTime,
      float viewX,
      float viewY,
      TouchEventCoalescingKeyHelper touchEventCoalescingKeyHelper)
```

* viewTag 视图 ID
* touchEventType 触屏事件类型
* motionEventToCopy 系统的 MotionEvent
* gestureStartTime 手势开始时间
* viewX 当前X坐标
* viewY 当前Y坐标

dispatchEvent 发送 TouchEvent

接收 TouchEvent

```js
BackHandler.addEventListener('hardwareBackPress', this._handleBackAction);
```

### PanResponder

## iOS

### RCTView

##### hitTest:withEvent

### 关于sendInputEventWithName事件名自定义

* RCTDirectEventBlock:直接事件,这种事件类型作为不影响UI的一些事件，比如“图片加载失败”。
* RCTBubblingEventBlock:冒泡事件,就和操作DOM一样，影响UI的事件，比如“点击按钮事件”。

## References


* [ React-Native系列Android——Touch事件原理及状态效果 ](http://blog.csdn.net/megatronkings/article/details/51069333)
* [React Native 触摸事件处理详解](https://www.race604.com/react-native-touch-event/)
