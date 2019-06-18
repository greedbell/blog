# RESTful API

* [RESTful API 设计指南](http://www.ruanyifeng.com/blog/2014/05/restful_api.html)
* [理解RESTful架构](http://www.ruanyifeng.com/blog/2011/09/restful.html)
* [REST API 安全设计指南](http://blogread.cn/it/article/7555?f=wb)
* [GitHub API](https://developer.github.com/v3/)

## 请求唯一性

请求添加下面两个参数

| 参数 | 说明 | 备注 |
| :---: | :---: | :---: |
| timestamp | 时间戳 | 精确到毫秒 |
| uuid | 设备唯一 ID | web:[如何用JavaScript生成一个GUID/UUID](https://github.com/simongong/js-stackoverflow-highest-votes/blob/master/questions1-10/how-to-create-a-UUID-in-javascript.md)生成 UUID 并存储到 cookies |

服务器缓存所有请求。如果有 timestamp 和 uuid 都相同的请求，则返回失败。

## HTTP 状态码

```
200 ok  - 成功返回状态，对应，GET,PUT,PATCH,DELETE.
201 created  - 成功创建。
304 not modified   - HTTP缓存有效。
400 bad request   - 请求格式错误。
401 unauthorized   - 未授权。
403 forbidden   - 鉴权成功，但是该用户没有权限。
404 not found - 请求的资源不存在
405 method not allowed - 该http方法不被允许。
410 gone - 这个url对应的资源现在不可用。
415 unsupported media type - 请求类型错误。
422 unprocessable entity - 校验错误时用。
429 too many request - 请求过多。
```

## URI 设计

参考 <https://api.github.com/>

* 使用－而不是空格或下划线来连接单词
* 资源数目一般来说都是多个的，所以，对于某种资源的命名，一般使用复数，例如/conversations。
* 除非目的是查询（或有查询的含意），否则不要把参数放在URL的查询部分（？之后）
* 一些跟上下文有关的资源，可以在URI中添加me或my这样的单词来加以区别。例如对于用户的信息资源，普通用户只能看自己的信息，而管理员可以看所有用户的信息，那么管理员可以使用/users/{user_id}/info来获取用户信息，而普通用户则使用/users/my/info来获取。
