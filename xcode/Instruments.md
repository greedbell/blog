# Instruments

* [官方文档](http://help.apple.com/instruments/mac/8.0/)

## Time Profiler

分析代码的执行时间，找出导致程序变慢的原因。

### CallTree

勾选`Call Tree`中`Separate Thread`和`Hide System Libraries`两个选项

#### Separate By Thread

线程分离,只有这样才能在调用路径中能够清晰看到占用CPU最大的线程.

#### Invert Call Tree

从上到下跟踪堆栈信息.这个选项可以快捷的看到方法调用路径最深方法占用CPU耗时,比如FuncA{FunB{FunC}},勾选后堆栈以C->B->A把调用层级最深的C显示最外面.

#### Hide Missing Symbols

如果dSYM无法找到你的APP或者调用系统框架的话，那么表中将看到调用方法名只能看到16进制的数值,勾选这个选项则可以隐藏这些符号，便于简化分析数据.

#### Hide System Libraries

勾选后耗时调用路径只会显示app耗时的代码,性能分析普遍我们都比较关系自己代码的耗时而不是系统的.基本是必选项.注意有些代码耗时也会纳入系统层级，可以进行勾选前后前后对执行路径进行比对会非常有用.

#### Flatten Recursion

递归函数, 每个堆栈跟踪一个条目

#### Top Functions

一个函数花费的时间直接在该函数中的总和，以及在函数调用该函数所花费的时间的总时间。因此，如果函数A调用B，那么A的时间报告在A花费的时间加上B花费的时间,这非常真有用，因为它可以让你每次下到调用堆栈时挑最大的时间数字，归零在你最耗时的方法。

## Allocations

监测内存使用/分配情况

## Leaks

找到引发内存泄漏的起点

## Cocoa Layout

观察约束变化，找出布局代码的问题所在。

## Network

跟踪 TCP / IP和 UDP / IP 连接。

## Automations

创建和编辑测试脚本来自动化 iOS 应用的用户界面测试。

## 打开Instruments

`Xcode run`>`Show the Debug Navagitor`>`Profile in Instruments`

## 相关资料
* [Instruments中文文档](http://cdn.cocimg.com/bbs/attachment/Fid_6/6_24457_90eabb4ed5b3863.pdf)
* <http://www.cocoachina.com/ios/20150225/11163.html>
