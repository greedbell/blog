# 崩溃


<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [崩溃](#崩溃)
  * [说明](#说明)
    * [Exception Type](#exception-type)
      * [EXC_BAD_ACCESS](#exc_bad_access)
      * [EXC_BAD_INSTRUCTION](#exc_bad_instruction)
      * [EXC_ARITHMETIC](#exc_arithmetic)
  * [崩溃追踪](#崩溃追踪)
    * [1、add all](#1-add-all)
    * [2、add especiall](#2-add-especiall)
    * [other](#other)
    * [启用NSZombieEnabled调试EXC_BAD_ACCESS](#启用nszombieenabled调试exc_bad_access)
    * [Clang Address Sanitizer](#clang-address-sanitizer)
  * [相关](#相关)

<!-- tocstop -->


## 说明

### Exception Type

#### EXC_BAD_ACCESS

此类型的Excpetion是我们最常碰到的Crash，通常用于访问了不改访问的内存导致。一般EXC_BAD_ACCESS后面的"()"还会带有补充信息。

* SIGSEGV: 通常由于重复释放对象导致，这种类型在切换了ARC以后应该已经很少见到了。
* SIGABRT:  收到Abort信号退出，通常Foundation库中的容器为了保护状态正常会做一些检测，例如插入nil到数组中等会遇到此类错误。

* SEGV:（Segmentation  Violation），代表无效内存地址，比如空指针，未初始化指针，栈溢出等；
* SIGTRAP: 代码里面触发了调试指令, 该指令可能由编译器提供的trap方法触发, 如'__builtin_trap()'

* SIGBUS：总线错误，与 SIGSEGV 不同的是，SIGSEGV 访问的是无效地址，而 SIGBUS 访问的是有效地址，但总线访问异常(如地址对齐问题)

* SIGILL：尝试执行非法的指令，可能不被识别或者没有权限

#### EXC_BAD_INSTRUCTION

此类异常通常由于线程执行非法指令导致

#### EXC_ARITHMETIC

除零错误会抛出此类异常

## 崩溃追踪

崩溃后直接跳到main函数

### 1、add all

### 2、add especiall

### other

### 启用NSZombieEnabled调试EXC_BAD_ACCESS

当你对已释放的对象发送消息（90%的可能是对引用计数为0的对象再release）或release那些autorelease对象时，就会出现报EXC_BAD_ACCESS这样的错误。
默认设置下 Xcode不会给你定位具体是哪一行代码不该去使用已释放的对象，或者release用错了。
Product -> Edit Scheme（option+command+R） -> Diagnostics -> 勾选 **Enable Zombie Objects**。
设置NSZombieEnabled环境变量后，一个对象销毁时会被转化为_NSZombie；设置NSZombieEnabled后，当你向一个已经释放的对象发送消息，这个对象就不只是报EXC_BAD_ACCESS Crash，还会放出一个错误消息，然后以一种可预测的可以产生debug断点的方式消失， 因此我们可以找到具体或者大概是哪个对象被错误的释放或引用了。
注意：NSZombieEnabled只能在调试的时候使用，千万不要忘记在产品发布的时候去掉，因为NSZombieEnabled不会真正去释放dealloc对象的内存，一直开启后果自负！

### Clang Address Sanitizer

Clang的地址消毒剂

```
编辑scheme，点击Diagnostics标签页，选中"Enable Address Sanitizer"选项
```

* [Xcode 7 调试野指针利器 Address sanitizer ](https://my.oschina.net/u/1244672/blog/617516)
* [在Xcode 7上直接使用Clang Address Sanitizer](http://www.cocoachina.com/ios/20150730/12830.html)
* [Xcode7 新特性 AddressSanitizer](http://ios.jobbole.com/92502/)
* [Xcode7中你一定要知道的炸裂调试神技](http://www.jianshu.com/p/70ed36cf8a98?utm_campaign=maleskine&utm_content=note&utm_medium=writer_share&utm_source=weibo&url_type=39&object_type=webpage&pos=1)

## 相关

* <http://blog.csdn.net/zhuzhihai1988/article/details/7749022>
* <http://blog.csdn.net/phunxm/article/details/17044337>
* [iOS Crash文件的解析（一）](http://www.cnblogs.com/smileEvday/p/Crash1.html)
