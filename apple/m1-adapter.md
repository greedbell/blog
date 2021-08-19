# M1 适配

## Xcode

### `building for iOS Simulator, but linking in object file built for iOS, for architectur`

* 方法一: Xcode > 右击 > 使用 Rosetta 打开
* 方法二: Xcode > Buil Settings > Build Options - Validate Workspace 改为Yes

### 运行在 My Mac（Designed for iPad）

要运行在 Mac 上必须满足下面条件

* Xcode 不要使用 Rosetta 打开
* developer.apple.com 添加 M1 设备 ID，Provisioning Profiles 添加对应设备

## node

### npm i 特别慢

参考 <https://stackoverflow.com/a/66242029/6283925> 升级 node 到 14 以上，可以加速很多

## M1 上字体变小问题

没找到解决方法

## Android Studio

* 参考 <https://stackoverflow.com/a/65176867>
* [Android Emulator Apple Silicon Preview](https://androidstudio.googleblog.com/2020/12/android-emulator-apple-silicon-preview.html)
