# 高并发

## 进程-线程-协程 区别

* Process(进程): 一个 Tomcat 实例是一个进程。一个 JVM 对应一个进程
* Thread(线程): Tomcat BIO 模式的每个请求是一个线程。每个请求可以创建多个线程同时处理多个业务
* Coroutine(协程): Fiber 或者 GreenThread

### 任务

* Runnable: 无返回的任务
* Callable: 有返回的任务
* Future: 保存异步处理结果

#### FutureTask

构造方法一：`public FutureTask(Runnable runnable, V result)`

`Future.get()` 得到 `FutureTask` 构建方法里的 `result`

构造方法二：`public FutureTask(Callable<V> callable)`

`Future.get()` 得到 `Callable` 的返回值

## 线程

* 中断线程
* 守护线程

## 守护线程

```java
t.setDaemon(true)
```

守护线程的唯一作用就是为其他线程提供服务。java虚拟机退出时Daemon线程中的finally代码块并不一定会执行

## 线程同步

### synchronized

### Lock

* Lock
* ReentrantLock 重入锁

## 线程间通信

### synchronied 关键字等待/通知机制

### 条件对象的等待/通知机制

## Java 并发编程

* java.util.concurrent
* Executor 框架

## 异步转同步

* 使用wait和notify方法
* 使用条件锁
* Future
* CountDownLatch: 需要知道有多少个任务
* CyclicBarrier: 需要知道有多少个任务
* Phaser: 可动态 register

## Future

### CompletableFuture

Java8 CompletableFuture: 相当于 OC 的 dispatch_queue，JS 的 Promise

## ForJoinPool

## 同步器

## 生产者消费者

* BlockingQueue
* [Disruptor](https://github.com/LMAX-Exchange/disruptor)

### Disruptor

使用 CAS 实现无锁设计

### References

* [Java 实现生产者 – 消费者模型](http://www.importnew.com/27063.html)
* [高性能队列——Disruptor](https://tech.meituan.com/2016/11/18/disruptor.html)

## ThreadLocal

### 使用场景

* 实现单个线程单例以及单个线程上下文信息存储，比如交易id等
* 实现线程安全，非线程安全的对象使用ThreadLocal之后就会变得线程安全，因为每个线程都会有一个对应的实例
* 承载一些线程相关的数据，避免在方法中来回传递参数

## 书籍

* 《Java并发编程的艺术》
* 《实战Java高并发程序设计》
* 《Java性能权威指南》

### 书籍下载

* <https://github.com/DeppWang/Java-Books>
* <https://github.com/guanpengchn/awesome-books>

## References

* 《Java核心技术 卷 Ⅰ》 第 14 章  并发
* [通过实例理解 JDK8 的 CompletableFuture](https://www.ibm.com/developerworks/cn/java/j-cf-of-jdk8/index.html)
