# child_process 模块中 spawn 和 exec 的区别

child_process.spaen会返回一个带有stdout和stderr流的对象。你可以通过stdout流来读取子进程返回给Node.js的数据。stdout拥有’data’,’end’以及一般流所具有的事件。当你想要子进程返回大量数据给Node时，比如说图像处理，读取二进制数据等等，你最好使用spawn方法。

child_process.spawn方法在子进程开始执行时，它就开始从一个流总将数据从子进程返回给Node。

## options

`options.stdio` 用于定义主线程与子线程之间怎么交互

## Reference

* [官方文档](https://nodejs.org/dist/latest-v6.x/docs/api/child_process.html#child_process_child_process)
* [说说Node.js child_process模块中的spawn和exec方法 ](http://www.html-js.com/article/A-day-to-learn-to-talk-about-JavaScript-spawn-and-exec-Nodejs-in-the-childprocess-module?utm_source=tuicool&utm_medium=referral)
