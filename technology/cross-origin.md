# 跨域

同源策略， 即JavaScript或Cookie只能访问同域下的内容

## 解决跨域方法

### JSONP

Jsonp(JSON with Padding) 是 json 的一种"使用模式"，可以让网页从别的域名（网站）那获取资料，即跨域读取数据。

#### 缺点

只能是get形式，承载的信息量有限

### CORS

跨域资源共享，Cross-Origin Resource Sharing

* [HTTP访问控制(CORS)](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)

#### 缺点

老版本浏览器不支持

#### node.js 实现

* [cors](https://github.com/expressjs/cors)
* [koa-cors](https://github.com/evert0n/koa-cors)
