# 存储

## Application Cache

* [使用应用缓存](https://developer.mozilla.org/zh-CN/docs/Web/HTML/Using_the_application_cache)

***该特性已经从 Web 标准中删除，虽然一些浏览器目前仍然支持它，但也许会在未来的某个时间停止支持，请尽量不要使用该特性。***

## Service Workers

* [使用 Service Workers](https://developer.mozilla.org/zh-CN/docs/Web/API/Service_Worker_API/Using_Service_Workers)

替换 `Application Cache`

很多浏览器不支持，特别是 safari

## FileSystem

* [FileSystem](https://developer.mozilla.org/zh-CN/docs/Web/API/FileSystem)

***该特性是非标准的，请尽量不要在生产环境中使用它！***

## Cookie

大多数浏览器对 Cookie 大小限制为 4K

## SessionStorage

* [Window.sessionStorage](https://developer.mozilla.org/zh-CN/docs/Web/API/Window/sessionStorage)
* [大小限制](https://www.html5rocks.com/en/tutorials/offline/quota-research/#toc-overview)


为每一个给定的源（given origin）维持一个独立的存储区域，该存储区域在页面会话期间可用（即只要浏览器处于打开状态，包括页面重新加载和恢复）。

## localForage

* [localForage](https://github.com/localForage/localForage)
* [大小限制](https://www.html5rocks.com/en/tutorials/offline/quota-research/#toc-overview)

特性

* 同步的
* 仅支持字符串
* 支持所有现代浏览器（包括 IE8 及更高版本）
* 支持 IndexedDB，WebSQL 和 localStorage 三种存储模式；
* 在浏览器关闭，然后重新打开后数据仍然存在

## Web SQL Database

没有被所有的主流的浏览器厂商支持

## IndexedDB

* [IndexedDB](https://developer.mozilla.org/zh-CN/docs/Web/API/IndexedDB_API)

IndexedDB 是一种用于客户端存储大量结构化数据（包括文件/ blob）的低级API。此API使用索引来启用此数据的高性能搜索。

很多浏览器还不支持

## References

[基于 HTML5 中的 Web SQL Database 来构建应用程序](https://www.ibm.com/developerworks/cn/web/1108_zhaifeng_websqldb/)
* [Web Storage API](https://developer.mozilla.org/zh-CN/docs/Web/API/Web_Storage_API)
