# Java 协程（coroutine）

 Java 编写程序都运行在在 Java 虚拟机(JVM)中，在 JVM 的内部，程序的多任务是通过线程来实现的。
 多线程： java web

* [kilim](https://github.com/kilim/kilim) 很久没维护
* [Quasar](https://github.com/puniverse/quasar)
* [vert.x](https://github.com/eclipse-vertx/vert.x/)

## 说明

* 单线程控制权交替
* 协程的好处是减少上下文的切换，用户态线程

你敢开1w个协程跑，你开1w个线程试试，光上下文切换就是一比不小的开销
他底层一般还是多线程之类在调度

IO密集型应用: 多进程->多线程->事件驱动->协程
CPU密集型应用:多进程-->多线程

## 使用

* Java and Kotlin 使用 [Quasar](https://github.com/puniverse/quasar) 实现协程
* Kotlin 协程
* Java 的 Future

### 注意

协程需要 NIO，不能用 BIO，否则会阻塞线程

## 阻塞

* I\O: 网络请求等待，读写文件
* CPU: 计算

## 异步工具库

* Netty: 是异步网络通信库
* AsynchronousFileChannel: 异步文件 I/O
* Vert.x3： 封装了Netty4，封装了AsynchronousFileChannel，而且Vert.x官方也出了一个相对应的封装了Quasar的库vertx-sync

## References

* [漫画：什么是协程？](https://www.itcodemonkey.com/article/4620.html)
* [次时代Java编程(一) Java里的协程](https://segmentfault.com/a/1190000005342905)
