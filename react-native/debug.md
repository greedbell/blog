# 调试

* [React Native调试技巧与心得](https://github.com/crazycodeboy/RNStudyNotes/blob/master/React%20Native%E8%B0%83%E8%AF%95%E6%8A%80%E5%B7%A7%E4%B8%8E%E5%BF%83%E5%BE%97/React%20Native%E8%B0%83%E8%AF%95%E6%8A%80%E5%B7%A7%E4%B8%8E%E5%BF%83%E5%BE%97.md)


* 打开 <http://localhost:8081/debugger-ui> 开始调试

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
