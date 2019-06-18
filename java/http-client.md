# HttpClient

## 同步 & 异步

* HttpAsyncClients 利用 NIO 实现异步非阻塞 IO
* HttpClients 利用 BIO 实现同步阻塞 IO

## 连接池

* PoolingHttpClientConnectionManager BIO
* PoolingNHttpClientConnectionManager NIO

第个 host 建立连接后 keep alive，之后所有该 host 的请求使用同一个连接

## 多线程

参考 [Chapter 2. Connection management](http://hc.apache.org/httpcomponents-client-ga/tutorial/html/connmgmt.html)  `2.4. Multithreaded request execution`

需要在建立请求时使用多线程

## 上传文件

### BIO

* MultipartEntity

### NIO

```
MultipartEntity is inherently blocking. It can only generate its content
by writing it out to an OutputStream through #writeTo() method. It does
not support #getContent() method, which makes it impossible to use with
a non-blocking I/O model without buffering.

You can wrap the MultipartEntity instance with BufferedHttpEntity in
order to make it compatible with the HttpAsyncClient's non-blocking I/O
model.
```

* EntityAsyncContentProducer
* BufferedHttpEntity

#### References

* <https://github.com/mfornos/glaze-http/blob/master/glaze-core/src/main/java/glaze/client/async/DefaultAsyncClient.java#L283>
