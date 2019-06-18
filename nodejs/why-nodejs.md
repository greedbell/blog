# 为什么选 node.js

* [Node.js适用于哪些场景](https://github.com/simongong/js-stackoverflow-highest-votes/blob/master/questions1-10/when-to-use-nodejs.md)

## 优点

不再使用多进程、线程来处理多个web请求，而是使用多事件、队列来处理。这样就不存在资源瓶颈问题。

## 缺点

对计算密集型请求处理能力较弱.如图形处理、音频处理、编码、物理仿真、加密。 使用 [Web Workers](http://www.w3school.com.cn/html5/html_5_webworkers.asp) 模式来解决，开启一个子进程来处理计算密集型任务。
