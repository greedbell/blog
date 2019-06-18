# cookie

* [HTTP cookies](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Cookies)
* [Document.cookie](https://developer.mozilla.org/zh-CN/docs/Web/API/Document/cookie)

## Questions

Q1：本地前端调试远程接口，跨域无法读 cookie

> `/etc/hosts` 添加与接口地址顶级域名相同的二级域名对应 `127.0.0.1`，接口 `cookie` `domain` 设为 `.<顶级域名>`
