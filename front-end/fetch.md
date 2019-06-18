# Fetch

取代 ajax

* [MDN Fetch API](https://developer.mozilla.org/zh-CN/docs/Web/API/Fetch_API)
* [GitHub](https://github.com/github/fetch) npm 包叫 `whatwg-fetch`，bower 包叫 `fetch`
* [isomorphic-fetch](https://github.com/matthew-andrews/isomorphic-fetch)  whatwg-fetch 包了一层 可以跑在node 和 浏览器里面

## 使用

### mode

参考  
* [Request.mode](https://developer.mozilla.org/en-US/docs/Web/API/Request/mode)
* [fetch API 简介](http://bubkoo.com/2015/05/08/introduction-to-fetch/)

cors, no-cors, cors-with-forced-preflight, same-origin, or navigate.

* `same-origin` 该模式很简单，如果一个请求是跨域的，那么将返回一个 error，这样确保所有的请求遵守同源策略。
* `no-cors` 该模式允许来自 CDN 的脚本、其他域的图片和其他一些跨域资源，但是首先有个前提条件，就是请求的 method 只能是HEAD、GET 或 POST。此外，如果 ServiceWorkers 拦截了这些请求，它不能随意添加或者修改除这些之外 Header 属性。第三，JS 不能访问 Response 对象中的任何属性，这确保了跨域时 ServiceWorkers 的安全和隐私信息泄漏问题。
* `cors` 该模式通常用于跨域请求，用来从第三方提供的 API 获取数据。该模式遵守 CORS 协议，并只有有限的一些 Header 被暴露给 Response 对象，但是 body 是可读的。例如，获取一个 Flickr 最感兴趣的照片的清单：

## 优点

* 使用 Promise，配合 async/await 写起来超爽

## Fetch 常见坑

* Fetch 请求默认是不带 cookie 的，需要设置 fetch(url, {credentials: 'include'})
* 服务器返回 400，500 错误码时并不会 reject，只有网络错误这些导致请求不能完成时，fetch 才会被 reject。

## References

* [传统 Ajax 已死，Fetch 永生](https://github.com/camsong/blog/issues/2)
