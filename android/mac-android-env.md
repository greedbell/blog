# Mac 搭建 Android 开发环境

## 下载 android studio

<https://developer.android.com/studio/install.html> 需要翻墙

## SDK

`Android Studio > Preferences > Apperence & Behavior > System Setting > Android SDK`

## JDK

<http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html>

## AVD (Android Virtual Device)

` Unable to create a virtual device: Missing system image required for an AVD setup `

* <https://developer.android.com/studio/run/managing-avds.html>

`Tools > Android > AVD Manager.`

## Genymotion

> 比 AVD 更快，占资源更少的模拟器

* <https://www.genymotion.com>

1. 注册下载安装免费版
2. Android Studio > Preferences > Plugins > 搜索 genymotion > install
3. 安装 [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
4. 配置 VirtualBox > 偏好设置 > 网络 > 仅主机网络 > 右击 > 编辑： 除 IP 外，其它配置成和电脑一样
5. Genymotion > 添加设备
6. Genymotion > Settings > ADB > Use custom Android SDK tools : ～/Library/Android/sdk

重启 `Android Studio` 和 `Genymotion`

## CLI

> 命令行

```
$ cd ～/Library/Android/sdk/tools
```

## Plugins

`Android Studio > Preferences > Plugins > Browse Repositories`
