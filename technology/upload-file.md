# 上传文件

Multipart/form-data POST文件上传

* [rfc2388](https://tools.ietf.org/html/rfc2388)

## curl 上传文件

* 参考 <http://charlee.li/upload-with-curl.html>
* 参考 `$ man curl`

如果使用了-F参数，curl就会以 multipart/form-data 的方式发送POST请求。

-F key=@file 上传文件。key=value 上传字符串

```
curl -F 'file=@"localfile";filename="nameinpost"' url.com
```

## node.js 上传文件服务

* [multer
](https://github.com/expressjs/multer)
* [koa-multer](https://github.com/koa-modules/multer)

## ajax 上传文件

* 参考 <http://yunzhu.iteye.com/blog/2177923>
* [使用FormData对象](https://developer.mozilla.org/zh-CN/docs/Web/Guide/Using_FormData_Objects)
