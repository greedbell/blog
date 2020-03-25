# 调试

* [React Native调试技巧与心得](https://github.com/crazycodeboy/RNStudyNotes/blob/master/React%20Native%E8%B0%83%E8%AF%95%E6%8A%80%E5%B7%A7%E4%B8%8E%E5%BF%83%E5%BE%97/React%20Native%E8%B0%83%E8%AF%95%E6%8A%80%E5%B7%A7%E4%B8%8E%E5%BF%83%E5%BE%97.md)


* 打开 <http://localhost:8081/debugger-ui> 开始调试

## 真机调试

### Android

默认加载 js 包的地址是 `localhost:8081`，真机和电脑不是一个 IP，所以需要处理后才能用，参考  [(Android 5.0 及以上)使用 adb reverse 命令](https://reactnative.cn/docs/running-on-device/#android-50-%E5%8F%8A%E4%BB%A5%E4%B8%8A-%E4%BD%BF%E7%94%A8-adb-reverse-%E5%91%BD%E4%BB%A4)

```
 adb -s <device id> reverse tcp:8081 tcp:8081
```

### iOS

iOS 编译的时候会生成包含本地 IP 的 'ip.txt' 文件，文件会拷贝到 ipa 包中，`RCTBundleURLProvider:guessPackagerHost` 方法会从该文件读取 IP 地址。

### Questions

内网不通的情况，可以开启 Mac 的互联网共享。具体做法如下：

1. Mac 端：设置 > 共享 > 互联网共享 > 来源选 Wifi，端口选 iPhone USB
2. iPhone 端：USB 连接 Mac > 关闭 WIFI > 关闭蜂窝网络 > 完成

## 工具

* [reactotron](https://github.com/infinitered/reactotron)
* [react-native-debugger](https://github.com/jhen0409/react-native-debugger)

## 打印日志

### iOS

Debug 环境只打印在浏览器 console，Release 环境可以打印到 Xcode Console

### Android

可以直接在 Android Studio 的 logcat 查看

## React Native 远程调试实现原理

### RN

```
$ npm star
node node_modules/react-native/local-cli/cli.js start
```

[react-native/local-cli/server/runServer.js](https://github.com/facebook/react-native/blob/1151c096dab17e5d9a6ac05b61aacecd4305f3db/local-cli/server/runServer.js) 启动 WebSocket 服务

[react-native/local-cli/server/util/debugger-ui/index.html connectToDebuggerProxy](https://github.com/facebook/react-native/blob/1151c096dab17e5d9a6ac05b61aacecd4305f3db/local-cli/server/util/debugger-ui/index.html#L112) 创建调试 WebSocket 服务


```
const ws = new WebSocket('ws://' + window.location.host + '/debugger-proxy?role=debugger&name=Chrome');
```



RN `rxjs/src/observable/dom/WebSocketSubject.ts` 启动 `ws://localhost:8081` websocket 服务

RCTWebSocketExecutor

### iOS

连接

1. `DevSupport` 模块 `RCTInspectorDevServerHelper` 的 `+ (void)connectForContext:withBundleURL` 方法

`http://localhost:8081/index.ios.bundle?platform=ios&dev=true&minify=false`

2. `Inspector` 模块 `RCTInspectorPackagerConnection` 的 `- (void)connect` 方法， 创建 `RCTSRWebSocket` 连接

ws://127.0.0.1:9101/devtools/page/4


3. `RCTWebSocketExecutor` setUp
http://localhost:8081/debugger-proxy?role=client


/launch-js-devtools -- http://localhost:8081/debugger-proxy?role=client


RCT_ENABLE_INSPECTOR

## Questions

### 1

react-native debug 的时候 chrome 报 `No 'Access-Control-Allow-Origin' header is present on the requested resource` 错。

参考 <https://stackoverflow.com/questions/48445514/react-native-js-debugger-issues-with-cors-ios>

* 解决方法一： 安装 [Allow CORS: Access-Control-Allow-Origin](https://chrome.google.com/webstore/detail/allow-cors-access-control/lhobafahddgcelffkeicbaginigeejlf/related) 插件
