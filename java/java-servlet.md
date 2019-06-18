# Java Servlet

* [Java Servlet完全教程](http://www.importnew.com/14621.html)
* [Servlet 简介](http://www.runoob.com/servlet/servlet-intro.html)

Servlet 单例多线程


Servlet如何处理多个请求访问？
Servlet容器默认是采用单实例多线程的方式处理多个请求的：
1.当web服务器启动的时候（或客户端发送请求到服务器时），Servlet就被加载并实例化(只存在一个Servlet实例)；
2.容器初始化化Servlet主要就是读取配置文件（例如tomcat,可以通过servlet.xml的<Connector>设置线程池中线程数目，初始化线程池通过web.xml,初始化每个参数值等等。
3.当请求到达时，Servlet容器通过调度线程(Dispatchaer Thread) 调度它管理下线程池中等待执行的线程（Worker Thread）给请求者；
4.线程执行Servlet的service方法；
5.请求结束，放回线程池，等待被调用；
（注意：避免使用实例变量（成员变量），因为如果存在成员变量，可能发生多线程同时访问该资源时，都来操作它，照成数据的不一致，因此产生线程安全问题）

## References

* [Java面试题：Servlet是线程安全的吗？](https://www.cnblogs.com/chanshuyi/p/5052426.html)
