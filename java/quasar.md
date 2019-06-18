# Quasar

* [Github](https://github.com/puniverse/quasar)

在调度方面，Quasar中默认使用了JDK7以上才有的ForkJoinPool，它的优势就在于空闲的线程会去从其他线程任务队列尾部”偷取”任务来自己处理，因此也叫work-stealing功能。这个功能可以大大的利用CPU资源，不让线程白白空闲着。
