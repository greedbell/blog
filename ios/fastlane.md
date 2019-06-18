# fastlane

> ios，android工具集

* [Github](https://github.com/fastlane/fastlane)
* [官网](https://fastlane.tools/)
* [官方文档](https://docs.fastlane.tools/)
* [Fastlane for Android](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Android.md)

<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [fastlane](#fastlane)
  * [安装](#安装)
  * [子工具](#子工具)
  * [使用](#使用)
    * [初始化`fastlane`](#初始化fastlane)
    * [snapshot](#snapshothttpsgithubcomfastlanefastlanetreemastersnapshot)
      * [模拟启动失败](#模拟启动失败)
    * [deliver](#deliverhttpsgithubcomfastlanefastlanetreemasterdeliver)
    * [frameit](#frameithttpsgithubcomfastlanefastlanetreemasterframeit)
      * [frameit setup](#frameit-setup)
      * [frameit](#frameit)
      * [frameit silver](#frameit-silver)
      * [自定义title](#自定义title)
    * [scan 测试](#scanhttpsgithubcomfastlanefastlanetreemasterscan-测试)
      * [scan init](#scan-init)
      * [scan](#scan)
    * [cert 管理证书](#certhttpsgithubcomfastlanefastlanetreemastercert-管理证书)
      * [`cert` OR `cert create`](#cert-or-cert-create)
    * [`cert revoke_expired`](#cert-revoke_expired)
    * [sigh 管理描述文件](#sighhttpsgithubcomfastlanefastlanetreemastersigh-管理描述文件)
      * [sigh manage](#sigh-manage)
      * [sigh repair](#sigh-repair)
      * [sigh download_all](#sigh-download_all)
    * [gym 打包](#gymhttpsgithubcomfastlanefastlanetreemastergym-打包)
      * [gym init](#gym-init)
      * [gym](#gym)
    * [pilot 管理TestFlight](#pilothttpsgithubcomfastlanefastlanetreemasterpilot-管理testflight)
      * [上传ipa包](#上传ipa包)
    * [match git管理描述文件](#match-git管理描述文件)
      * [Q1](#q1)
      * [Q2](#q2)
      * [Q3](#q3)
  * [Reference](#reference)
* [<http://www.cocoachina.com/ios/20150728/12733.html>](#httpwwwcocoachinacomios2015072812733html)

<!-- tocstop -->

## 安装

```shell
$ gem install fastlane --verbose
```

## 子工具

* deliver: 上传截图, 元数据, app应用程序到App Store
* supply: 上传Android app应用程序和元数据到Google Play
* snapshot: 自动捕获iOS app应用程序本地截图
* screengrab: 自动捕获Android app应用程序本地截图
* frameit: 快速截屏并将截屏放入设备中
* pem: 自动生成和更新推送通知配置文件
* sigh: 开发证书和描述文件下载
* produce: 使用命令行在iTunes Connect上创建新的app和开发入口
* cert: 自动创建和配置iOS代码签名证书
* spaceship: Ruby 库访问 Apple开发者中心和 iTunes Connect
* pilot: 最好的方式管理你的TestFlight 测试人员和从终端构建
* boarding: 最简单的方式邀请你的TestFlight beta测试人员
* gym: iOS app打包签名自动化工具
* match: 使用Git同步你的团队证书和配置文件
* scan: 最简单方式测试你的 iOS 和 Mac apps


 [fastlane-credentials](https://github.com/fastlane/fastlane/tree/master/credentials_manager): 管理用户名密码。

## 使用

### 初始化`fastlane`

自动生成`Fastfile` `Appfile`

```shell
$ cd [your_project_folder]
$ fastlane init
```

### [snapshot](https://github.com/fastlane/fastlane/tree/master/snapshot)

> 截屏

初始化：

```shell
$ snapshot init
```

生成`Snapfile`和`SnapshotHelper.swift`

添加`SnapshotHelper.swift`到`UITest`工程，会自动提示添加桥接文件。

#### 模拟启动失败

```shell
$ snapshot reset_simulators
```

### [deliver](https://github.com/fastlane/fastlane/tree/master/deliver)

> 上传截图，ipa到 `iTunes Connect`

初始化：

```shell
$ cd [your_project_folder]
$ deliver init
```

> 会自动从`iTunes Connect`下载所有配置到`metadata`和`screenshots`,并生成`Deliverfile`。

[Deliverfile文档](https://github.com/fastlane/fastlane/blob/master/deliver/Deliverfile.md)

### [frameit](https://github.com/fastlane/fastlane/tree/master/frameit)

> 自动给截屏加上设备边框

安装`imagemagick`

```
$ brew install imagemagick
```

#### frameit setup

> 配置frameit,会提示从 <https://developer.apple.com/app-store/marketing/guidelines/#images> 下载对应的框架并解压到 `~/.frameit/devices_frames`，然后制作带边框的截图

#### frameit

> 创建太空灰边框的框架,在fastlane目录下运行

#### frameit silver

> 创建银色边框的框架,在fastlane目录下运行

#### 自定义title

参考 <https://github.com/fastlane/examples/tree/master/MindNode/screenshots>

* `title.string`和`keyword.string`必须是`UTF-16 BE`编码，并且第一行换行
* `.ttf` 字体文件从系统`字体册`中找
* 例子中的`Framefile.json`的`zcmn-Hans`改成`zh-Hans`
* `title`为图片名后部分，EG`1_ipad_1.1`取`1.1`

### [scan](https://github.com/fastlane/fastlane/tree/master/scan) 测试

> 测试并导出错误报告

#### scan init

> 生成 fastlane/Scanfile

#### scan

> 开始测试


### [cert](https://github.com/fastlane/fastlane/tree/master/cert) 管理证书

#### `cert` OR `cert create`

> 创建证书

### `cert revoke_expired`

> 删除过期证书

### [sigh](https://github.com/fastlane/fastlane/tree/master/sigh) 管理描述文件

> 创建刷新描述文件

#### sigh manage

> 列出所有描述文件

#### sigh repair

> 修复所有失效或者过期的描述文件

#### sigh download_all

> 下载并安装所有描述文件

### [gym](https://github.com/fastlane/fastlane/tree/master/gym) 打包

> 打包

#### gym init

> 生成fastlane/Gymfile

#### gym

> 开始打包

### [pilot](https://github.com/fastlane/fastlane/tree/master/pilot) 管理TestFlight

> 管理TestFlight.管理测试用户、上传ipa包

#### 上传ipa包

```shell
$ pilot upload
```

### match git管理描述文件

用 git 管理描述文件

#### Q1

`Provisioning profile 'a8950521-d017-410b-a23a-07a8b823922f' is not available on the Developer Portal`

> 删掉管理描述文件 git 上的 profiles 目录。再重新 match

#### Q2

`Certificate 'C76G4T85S7' (stored in your git repo) is not available on the Developer Portal`

>

#### Q3

`Could not create another Distribution certificate, reached the maximum number of available Distribution certificates.`

> 删掉苹果开发者网站上 match_ 开头的描述文件后重新  match

## Reference

# <http://www.cocoachina.com/ios/20150728/12733.html>
