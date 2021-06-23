# M1 适配

## Xcode

### `building for iOS Simulator, but linking in object file built for iOS, for architectur`

* 方法一: Xcode > 右击 > 使用 Rosetta 打开
* 方法二: Xcode > Buil Settings > Build Options - Validate Workspace 改为Yes

### 运行在 My Mac（Designed for iPad）

要运行在 Mac 上必须满足下面条件

* Xcode 不要使用 Rosetta 打开
* developer.apple.com 添加 M1 设备 ID，Provisioning Profiles 添加对应设备
