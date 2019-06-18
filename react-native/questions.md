# 问题

## `cannot be cast to com.facebook.react.uimanager.ViewGroupmanager`

A:

ViewManager 换成 ViewGroupManager

## 调试模式下 `setTimeout` 不会执行

A：RN Bug

## `com.squareup.SocketRocket.NetworkThread (9): EXC_BAD_ACCESS (code=EXC_I386_GPFLT)`

参考 <https://react-native.canny.io/feature-requests/p/crash-in-rctsrwebsocketm>

URL 后面加上 `&dev=false` 或者合 <https://github.com/facebook/react-native/commit/b00c77af8066cf74f05ccaca2b08c8952e1ae8a6>
