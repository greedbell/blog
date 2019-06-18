# web 调试


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [web 调试](#web-调试)
	* [移动设备web页在PC上调试](#移动设备web页在pc上调试)
		* [chrome](#chrome)
		* [safari](#safari)
	* [iOS 真机调试](#ios-真机调试)
		* [使用 Safari 调试](#使用-safari-调试)
		* [ios_webkit_debug_prox](#ios_webkit_debug_prox)
		* [remotedebug-ios-webkit-adapter](#remotedebug-ios-webkit-adapter)
		* [重新签名打 develop 包](#重新签名打-develop-包)
	* [Android 真机调试](#android-真机调试)

<!-- /code_chunk_output -->

## 移动设备web页在PC上调试

### chrome

command + shift + m

### safari

开发 > 进入响应式设计模式

## iOS 真机调试

### 使用 Safari 调试

手机端：设置 > Safari > 高级 > Web 检查器 > 开。
iOS 11 及以上可以进入 设置 > Safari > 高级 > Experimental Features > 开启你需要调试的选项。

Safari打开开发模式：Safari > 偏好设置 > 高级 > 勾选 在菜单栏中显示“开发”菜单

Safari调试：开发 > iOS 设备的名称 > 其子菜单项即为移动设备上 Safari 的所有标签页，点击任意一个开始调试。

有时候会出现 Safari 找不到设备或者设备不显示网站列表的情况。重启 Mac Safari。

这种方式只适用于 Safari 浏览器，和 debug 模式 App 内嵌的 webview，生产模式内嵌的 webview 无法调试

### ios_webkit_debug_prox

这种方式可以有更多的调试工具选择。但是 safari 不能调试还是不能调试。

* [ios-webkit-debug-proxy](https://github.com/google/ios-webkit-debug-proxy)

### remotedebug-ios-webkit-adapter

是基于 ios_webkit_debug_prox 的封装
* [remotedebug-ios-webkit-adapter](https://github.com/RemoteDebug/remotedebug-ios-webkit-adapter)

使用方法：

安装 ios-webkit-debug-proxy

```
brew update
brew unlink libimobiledevice ios-webkit-debug-proxy usbmuxd
brew uninstall --force libimobiledevice ios-webkit-debug-proxy usbmuxd
brew install --HEAD libimobiledevice
brew install --HEAD usbmuxd
brew install --HEAD ios-webkit-debug-proxy
```

安装 remotedebug-ios-webkit-adapter

```
npm install remotedebug-ios-webkit-adapter -g
```

打开模拟器或真机
必须在启动 remotedebug-ios-webkit-adapter 前打开
```
经测试，iOS12 模拟器不可用，其它模拟器如果出现无法调试问题，请 Hardware > Erase All Content and Settings... 后重试
```

开启调试权限
```
Settings > Safari > Advanced > Web Inspector = ON
```

启动 remotedebug-ios-webkit-adapter

```
remotedebug_ios_webkit_adapter --port=9000
```

chrome 添加 9000 端口监听
```
chrome://inspect/#devices > Discover network targets Configure > 添加 localhost:9000
```

### 重新签名打 develop 包

`fastlane sigh resign` 使用 develop 的描述文件重新签名发包。 这样就可以调试 App 内嵌的 webview。

## Android 真机调试

Chrome inspect 可以直接调试模拟器中的 webview

chrome 中输入 [chrome://inspect](chrome://inspect) 选择设备，开始调试

[参考]

* <https://developer.chrome.com/devtools/docs/remote-debugging>
* [打造最舒适的webview调试环境](https://github.com/riskers/blog/issues/11)
