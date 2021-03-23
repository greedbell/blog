# iOS App 运行在 Mac 上

## 运行在 Mac 上的方案

iOS App 运行在 Mac 上有两种方案

1. `Mac Catalyst` App 可以运行在任何 `macOS Big Sur` 以上的版本
2. 普通 iOS App 可以运行在 `Apple silicon` 架构的 macOS 上

### Mac Catalyst

需要开启 Mac 兼容

### Apple silicon

不用做任何适配

## 如何运行在 Mac 上

* TestFlight 不支持 Mac
* Mac 上双击 AdHoc 包 可以直接安装

### Xcode 直接在 Mac 上运行 App

只支持 `Mac Catalyst`，普通 iOS App 没法直接运行在 Mac 上

* 在 <developer.apple.com> 添加 Device ID
* 在 <developer.apple.com> 添加对应的 `macOS App Development` 描述文件
* 运行的时候选择 Mac 真机

## Other

判断当前是否运行在 Mac 上

```
[NSProcessInfo processInfo].macCatalystApp || [NSProcessInfo processInfo].isiOSAppOnMac
```

## References

* [Running Your iOS Apps on macOS](https://developer.apple.com/documentation/apple-silicon/running-your-ios-apps-on-macos)
* [Distributing Your App to Registered Devices](https://developer.apple.com/documentation/xcode/distributing_your_app_to_registered_devices?language=objc)
