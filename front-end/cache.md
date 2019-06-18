# Web缓存

* [浅谈Web缓存](http://www.alloyteam.com/2016/03/discussion-on-web-caching/)
* [HTTP 缓存](https://developers.google.cn/web/fundamentals/performance/optimizing-content-efficiency/http-caching?hl=zh-cn)
* [浏览器缓存知识小结及应用](https://www.cnblogs.com/lyzg/p/5125934.html)

## header

页面的缓存状态是由header决定的，header的参数有四种：

### Cache-Control

* max-age

### Expires

### Last-modified

### ETag

## 强缓存和协商缓存

* 当浏览器对某个资源的请求命中了强缓存时，返回的http状态为200，在chrome的开发者工具的network里面size会显示为from cache
* 当浏览器对某个资源的请求没有命中强缓存，就会发一个请求到服务器，验证协商缓存是否命中，如果协商缓存命中，请求响应返回的http状态为304并且会显示一个Not Modified的字符串

## chrome

* chrome 开发工具 > Network > Disable cache 开启关闭缓存
* 查看 chrome 缓存: <chrome://cache/>
* [Chrome cache View](https://my.oschina.net/xiaojichao/blog/137538) 查看二进制 chrome 缓存文件

## 用户操作行为与缓存

## References

* [js清除浏览器缓存的几种方法](http://www.haorooms.com/post/js_llq_hc)
