# React Native Network 实现过程

## Network

### XMLHttpRequest

[RCTNetworking.mm](https://github.com/facebook/react-native/blob/master/Libraries/Network/RCTNetworking.mm) 实现原生的网络请求

[RCTNetworking.ios.js](https://github.com/facebook/react-native/blob/master/Libraries/Network/RCTNetworking.ios.js) 实现 JS 调用的 RCTNetworking

[XMLHttpRequest.js](https://github.com/facebook/react-native/blob/master/Libraries/Network/XMLHttpRequest.js) 实现 JS 调用的 XMLHttpRequest

### fetch

[whatwg-fetch.js](https://github.com/facebook/react-native/blob/master/Libraries/vendor/core/whatwg-fetch.js#L484) 使用 XMLHttpRequest 实现 fetch

[fetch.js](https://github.com/facebook/react-native/blob/master/Libraries/Network/fetch.js) 申明 fetch 模块
```JS
module.exports = {fetch, Headers, Request, Response};
```

[setUpXHR.js](https://github.com/facebook/react-native/blob/master/Libraries/Core/setUpXHR.js) 把 fetch 注册到 JS 全局环境
```JS
polyfillGlobal('fetch', () => require('fetch').fetch);
```
