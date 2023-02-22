# 支持 Mac Catalyst

iPad 应用移植到 macOS

## New Build System

工程切换到新的编译系统，否则会报错：

```
Building for Mac Catalyst is not supported by the legacy build system.
```

Xcode > File > Workspace Settings > Build System: New Build System

## Bundle ID

需要给 macOS 包设置 Bundle ID。

https://developer.apple.com > 找到对应 iOS 的 Bundle ID > Mac Catalyst > Edit

## XCFrameworks

XCFramework 使将多个平台（包括 iOS 设备，iOS 模拟器和 Mac Catalyst）的二进制框架或库捆绑到一个可分发的 .xcframework 捆绑包中，.framework 和 .a 不支持 Mac Catalyst

## Cocoapods

升级到 1.9 以上，支持打包成 XCFrameworks

<https://stackoverflow.com/a/60612984>

## References

- [Mac Catalyst 初步体验+排坑](https://zhuanlan.zhihu.com/p/88189492)
