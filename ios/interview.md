#., 面试

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [面试](#面试)
	* [Objective-C](#objective-c)
		* [`weak` `strong` `assign` `copy` 区别](#weak-strong-assign-copy-区别)
		* [ivar、getter、setter](#ivar-getter-setter)
		* [`@protocol` 和 `category` 中如何使用 `@property`](#protocol-和-category-中如何使用-property)
		* [`mutableCopy` 和 `copy`](#mutablecopy-和-copy)
		* [`NSHashTable` VS `NSMapTable`](#nshashtable-vs-nsmaptable)
		* [`[obj foo]` 和 `objc_msgSend()` 关系](#obj-foo-和-objc_msgsend-关系)
		* [`ARC` 和 `MRC`](#arc-和-mrc)
		* [`self` `super` 区别](#self-super-区别)
		* [`@synthesize` 和 `@dynamic` 区别](#synthesize-和-dynamic-区别)
		* [GCD](#gcd)
			* [`dispatch_barrier_async`](#dispatch_barrier_async)
			* [`dispatch_group_async`](#dispatch_group_async)
			* [`dispatch_semaphore_*`](#dispatch_semaphore_)
		* [有哪些方法实现异步、延时](#有哪些方法实现异步-延时)
		* [KVO 和 KVC](#kvo-和-kvc)
		* [runtime](#runtime)
		* [runloop](#runloop)
		* [`+(void)load` 和 `+(void)initialize` 的区别](#voidload-和-voidinitialize-的区别)
	* [iOS](#ios)
		* [`lldb` 常用命令](#lldb-常用命令)
		* [Xcode 调试技巧](#xcode-调试技巧)
		* [iOS 装载和运行机制](#ios-装载和运行机制)
		* [iOS 性能调优](#ios-性能调优)
		* [AutoLayout 和 UIViewAutoresizing](#autolayout-和-uiviewautoresizing)
		* [autoreleasePool](#autoreleasepool)
		* [UIViewController 多次 push pop 后，内存会怎样？](#uiviewcontroller-多次-push-pop-后内存会怎样)
		* [UIScrollView 使用 AutoLayout 布局注意事项](#uiscrollview-使用-autolayout-布局注意事项)
		* [点击事件传递机制](#点击事件传递机制)
		* [iPhoneX 适配](#iphonex-适配)
		* [MVC 和 MVVM，MVP](#mvc-和-mvvmmvp)
		* [数据持久化的几个方案](#数据持久化的几个方案)
		* [`UITableview` 的优化方法（缓存高度，异步绘制，减少层级，hide，避免离屏渲染）](#uitableview-的优化方法缓存高度异步绘制减少层级hide避免离屏渲染)
		* [第三方框架](#第三方框架)
		* [设计模式](#设计模式)
	* [References](#references)

<!-- /code_chunk_output -->

## Objective-C

### `weak` `strong` `assign` `copy` 区别

assign 的“设置方法”只会执行针对“纯量类型” (scalar type，例如 CGFloat 或 NSlnteger 等)的简单赋值操作。

`block` 中的 `weak`

`Masonry` 需要用 `weak` 么，为什么？

### ivar、getter、setter

`@property` 的本质是

```objc
@property = ivar + getter + setter;
```

“属性” (property)有两大概念：ivar（实例变量）、存取方法（access method ＝ getter + setter）

### `@protocol` 和 `category` 中如何使用 `@property`

`objc_setAssociatedObject` 和 `objc_getAssociatedObject`

### `mutableCopy` 和 `copy`

### `NSHashTable` VS `NSMapTable`

* NSHashTable 是 NSSet 的通用版本。可以弱引用、copy
* NSMapTable 是 NSDictionary 的通用版本。可以弱引用、copy

### `[obj foo]` 和 `objc_msgSend()` 关系

* `[obj foo]` 在objc编译时，会被转意为：`objc_msgSend(obj, @selector(foo))`
* `[obj foo]` 如果 foo 方法不存在会怎么处理

### `ARC` 和 `MRC`

`retain count` `autoreleasePool`

### `self` `super` 区别

其实 super 是一个 Magic Keyword， 它本质是一个编译器标示符，和 self 是指向的同一个消息接受者！他们两个的不同点在于：self 先从本类找，super 先从父类找。

所以 `[self class]` 和 `[super class]` 返回值一样，因为 `class` 方法都在 `NSObject` 对象实现。

### `self->_para` 和 `_para` 还有 `self.para` 的区别

### `@synthesize` 和 `@dynamic` 区别

* `@dynamic` :修饰的属性，其getter和setter方法编译器是不会自动帮你生成。必须自己是实现的。
* `@synthesize`：修饰的属性，其getter和setter方法编译器是会自动帮你生成。不必自己实现，可以指定与属性相对应的成员变量。

### GCD

* `DISPATCH_QUEUE_SERIAL`: 串行的队列，每次只能执行一个任务，并且必须等待前一个执行任务完成
* `DISPATCH_QUEUE_CONCURRENT`: 一次可以并发执行多个任务，不必等待执行中的任务完成

#### `dispatch_barrier_async`

一般叫做“栅栏函数”，它就好像栅栏一样可以将多个操作分隔开，在它前面追加的操作先执行，在它后面追加的操作后执行。

#### `dispatch_group_async`

我们使用队列组来开辟线程时，队列组中的队列任务是并发，当所有的队列组中的所有任务完成时候，才可以调用队列组完成任务。

#### `dispatch_semaphore_*`

信号：Semaphore是通过‘计数’的方式来标识线程是否是等待或继续执行的。

### 有哪些方法实现异步、延时

### KVO 和 KVC

### runtime

* runtime 为 category 扩展属
* runtime 修改方法
* NSDictionary to Object
* message_send

### runloop

各个模式的区别

* 每个线程（包括主线程）都有一个对应的 Runloop 对象。我们并不能自己创建 Runloop 对象，但是可以获取到系统提供的 Runloop 对象。
* 主线程的 Runloop 会在应用启动的时候完成启动，其他线程的 Runloop 默认并不会启动，需要我们手动启动。

References

[Runloop](https://hit-alibaba.github.io/interview/iOS/ObjC-Basic/Runloop.html)

### `+(void)load` 和 `+(void)initialize` 的区别

load 是只要类所在文件被引用就会被调用，而 initialize 是在类或者其子类的第一个方法被调用前调用。

## iOS

### `lldb` 常用命令

### Xcode 调试技巧

Zombile Objects 开启僵尸对象，在对象释放（retainCount为0)时，使用一个内置的Zombie对象，替代原来被释放的对象。无论向该对象发送什么消息（函数调用），都会触发异常，抛出调试信息。

### iOS 装载和运行机制

### iOS 性能调优

instruments

* Allocations：监测内存使用/分配情况
* leaks：找到引发内存泄漏的起点
* Time Profiler：分析代码的执行时间，找出导致程序变慢的原因。

### AutoLayout 和 UIViewAutoresizing

### autoreleasePool

### UIViewController 多次 push pop 后，内存会怎样？

### UIScrollView 使用 AutoLayout 布局注意事项

contentView 不能由 AutoLayout 撑起来

### 点击事件传递机制

* [iOS 点击事件传递及响应 ](http://blog.flight.dev.qunar.com/2016/10/28/ios-event-mechanism-summary/)

事件的传递过程：

```
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
```

事件响应：

```
//只要点击控件,就会调用touchBegin,如果没有重写这个方法,自己处理不了触摸事件
// 上一个响应者可能是父控件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
// 默认会把事件传递给上一个响应者,上一个响应者是父控件,交给父控件处理
[super touchesBegan:touches withEvent:event];
// 注意不是调用父控件的touches方法，而是调用父类的touches方法
// super是父类 superview是父控件
}
```

一次完整的触摸事件的传递响应过程为：

UIApplication–>UIWindow–>递归找到最合适处理的控件–>控件调用touches方法–>判断是否实现touches方法–>没有实现默认会将事件传递给上一个响应者–>找到上一个响应者–>找不到方法作废

### iPhoneX 适配

safe area

### MVC 和 MVVM，MVP

* MVC:简单来说就是，逻辑、试图、数据进行分层，实现解耦。
* MVVM:是Model-View-ViewMode模式的简称。由视图(View)、视图模型(ViewModel)、模型(Model)三部分组成.比MVC更加释放控制器臃肿，将一部分逻辑(耗时，公共方法，网络请求等)和数据的处理等操作从控制器里面搬运到ViewModel中

### 数据持久化的几个方案

* plist,存储字典，数组比较好用
* preference：偏好设置，实质也是plist
* NSKeyedArchiver：归档，可以存储对象
* sqlite：数据库，经常使用第三方来操作，也就是fmdb
* coreData:也是数据库储存，苹果官方的

### `UITableview` 的优化方法（缓存高度，异步绘制，减少层级，hide，避免离屏渲染）

### 第三方框架

* `SDWebImage`
* `Masonry`
* `MJPullRefresh`
* `MJExtension`
* `FMDB`
* `AFNetwork`

### 设计模式

`iOS` 用到了哪些典型的设计模式

## References

* [招聘一个靠谱的 iOS](http://blog.sunnyxx.com/2015/07/04/ios-interview/)
* [《招聘一个靠谱的 iOS》—参考答案](https://github.com/ChenYilong/iOSInterviewQuestions)
* [2017年iOS面试题总结](http://www.jianshu.com/p/f9eb6b315c08)
* [2017年5月iOS招人心得（附面试题）](https://juejin.im/post/5938dfdb8d6d810058481572)
