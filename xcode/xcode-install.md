# Xcode 安装

## AppStore 安装

缺点：

- 下载经常失败，还不支持断点续传。
- 下载后的安装包不好复用。

## 下载安装包安装

- 打开 [developer.apple.com](https://developer.apple.com/download/all/)
- 下载对应版本的 Xcode
- 安装下载好的 Xcode
- 下载对应版本的 iOS SDK
- 参考 [Installing and managing Simulator runtimes](https://developer.apple.com/documentation/xcode/installing-additional-simulator-runtimes) 安装 iOS SDK

### 手动安装 iOS SDK 的方法

```
xcode-select -s /Applications/Xcode-beta.app
xcodebuild -runFirstLaunch
xcrun simctl runtime add "~/Downloads/watchOS 9 beta Simulator Runtime.dmg"
```
