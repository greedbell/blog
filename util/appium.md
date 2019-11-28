# appium

* [官网](http://appium.io)

## iOS

手机上装好 WebDriver 所有应用市场的包都测

fruitstrap 已不再维护，打包用 Fastlane

## Android

任何 Apk 包都可以测

## 安装

### appium server

```bash
npm install -g appium
npm install -g appium-doctor
```

### appium client

* [List of client libraries with Appium server support](http://appium.io/docs/en/about-appium/appium-clients/index.html)

## 查看 app 元素

### app-inspector

* [app-inspector](https://github.com/macacajs/app-inspector)

#### 安装依赖

```bash
npm install macaca-cli -g
# 检测必须全部通过
macaca doctor
npm install app-inspector -g
```

```bash
brew install usbmuxd
brew install ios-webkit-debug-proxy
```

获取 Device ID 参考 [ Get the Device ID](https://macacajs.github.io/app-inspector/guide/get-device-id.html#ios)

#### iOS 真机使用

先获取你的 `Team ID` 和 `Bundle Identifier`

再打开 `XCTestWD`，XCTestWD 工程安装位置：`~/.nvm/versions/node/v8.11.0/lib/node_modules/app-inspector/node_modules/xctestwd/XCTestWD/XCTestWD.xcodeproj`

做如下配置：

* `XCTestWD > XCTestWD > General` 配置 `Team` 和 `Bundle Identifier`
* `XCTestWD > XCTestWDUITests > General` 配置 `Team`
* `XCTestWD > XCTestWDUnitTest > General` 配置 `Team`

编译 `XCTestWDUnitTest`，如果没报错就可以运行 `app-inspector -u DEVICE_ID` 在真机上测试了

### appium-desktop

* [appium-desktop](https://github.com/appium/appium-desktop)

## 多设备同时测试

启动多个不同端口的 appium 服务，每个端口对应一个设备.

* [Appium +IOS 自动化测试多设备并行执行实现](https://blog.csdn.net/zhusongziye/article/details/81609603)

## References

* [WebDriverAgent](https://github.com/facebook/WebDriverAgent)
