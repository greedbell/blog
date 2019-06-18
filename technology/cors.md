# CORS

* [跨域资源共享 CORS 详解](http://www.ruanyifeng.com/blog/2016/04/cors.html)

## 问题

Q1: 如何实现多域名跨域

* `Access-Control-Allow-Origin` 只能有一个值，`*` 或者无通配符域名
* `Access-Control-Allow-Origin` 为 `*` 时 `Access-Control-Allow-Credentials` 只能为 `false` 不能带 cookie

> 如果请求的 `origin` 允许访问，把 `Access-Control-Allow-Origin` 设为该 `origin`
