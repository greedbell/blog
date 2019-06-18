# 面试


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [面试](#面试)
	* [面试资料](#面试资料)
	* [Java 相关](#java-相关)
		* [public,private,protected,private 的区别](#publicprivateprotectedprivate-的区别)
		* [Java 内存管理机制](#java-内存管理机制)
		* [== 与 equals 的区别](#与-equals-的区别)
		* [final,finally,finalize的区别](#finalfinallyfinalize的区别)
		* [面向对象设计的头 5 大原则](#面向对象设计的头-5-大原则)
		* [面向对象的三个基本特征](#面向对象的三个基本特征)
		* [如何原地交换两个变量的值？](#如何原地交换两个变量的值)
		* [Overload 和 Override 的区别](#overload-和-override-的区别)
		* [反射](#反射)
	* [Android 相关](#android-相关)
		* [四大基本组件](#四大基本组件)
			* [Service](#service)
				* [根据启动方式分为两类](#根据启动方式分为两类)
				* [按服务性质分](#按服务性质分)
				* [按实现方法分类](#按实现方法分类)
				* [按前后台分](#按前后台分)
				* [IntentService](#intentservice)
		* [布局方式](#布局方式)
		* [视图](#视图)
		* [Activity、Window、View三者的差别，fragment的特点？](#activity-window-view三者的差别fragment的特点)
		* [Handler、Thread、Looper、HandlerThread](#handler-thread-looper-handlerthread)
		* [HandlerThread、 AsyncTask、 EventBus](#handlerthread-asynctask-eventbus)
			* [EventBus](#eventbus)
		* [Jpg 和 Png](#jpg-和-png)
		* [Switch能否用string做参数？](#switch能否用string做参数)
		* [多线程](#多线程)
		* [Android 事件分发机制原理](#android-事件分发机制原理)
		* [Android 绘图机制原理](#android-绘图机制原理)
		* [WindowManager](#windowmanager)
		* [进程间传输方式](#进程间传输方式)
		* [Activity与Fragment的生命周期](#activity与fragment的生命周期)
		* [Activity缓存方法](#activity缓存方法)
		* [动画有哪两类，各有什么特点？三种动画的区别](#动画有哪两类各有什么特点三种动画的区别)
		* [Android的数据存储形式。](#android的数据存储形式)
		* [你用过什么框架，是否看过源码，是否知道底层原理。](#你用过什么框架是否看过源码是否知道底层原理)
			* [Retrofit](#retrofit)
			* [EventBus](#eventbushttpsgithubcomgeniusvjrlearningnotesblobmasterpart1androideventbuse794a8e6b395e8afa6e8a7a3md)
			* [Android-Universal-Image-Loader 图片框架](#android-universal-image-loaderhttpsgithubcomnostra13android-universal-image-loader-图片框架)
			* [打补丁框架](#打补丁框架)
		* [Android 高版本 API 方法在低版本系统上的兼容性处理](#android-高版本-api-方法在低版本系统上的兼容性处理)
		* [Service 种类](#service-种类)
		* [下拉刷新，上拉获取更多 怎么实现](#下拉刷新上拉获取更多-怎么实现)
		* [嵌套滑动](#嵌套滑动)
		* [SurfaceView](#surfaceview)
		* [MVC MVP MVVM](#mvc-mvp-mvvm)
		* [Binder机制](#binder机制)
		* [JSON](#json)
		* [序列化](#序列化)
		* [打包，固化](#打包固化)

<!-- /code_chunk_output -->


## 面试资料

* [Android面试题整理 ](https://ydmmocoo.github.io/2016/06/22/Android%E9%9D%A2%E8%AF%95%E9%A2%98%E6%95%B4%E7%90%86/)
* [LearningNotes](https://github.com/GeniusVJR/LearningNotes)
* [面试心得与总结---BAT、网易、蘑菇街 ](http://mp.weixin.qq.com/s?__biz=MzI0MjE3OTYwMg==&mid=2649547962&idx=1&sn=85a1fc344644a3d6af9c46dae485a24c&scene=21#wechat_redirect)
* [面试时，问哪些问题能试出一个 Android 应用开发者真正的水平？](https://www.zhihu.com/question/19765032)

1. Java水平

基本上就是 Effective Java 那本书里提到的东西，如果你背完那本书里的问题，并且对答如流，没问题，就要你这样的。其实也会考察关于final用法，反射原理，注解原理，java编译过程，GC等一些常见问题。

2. Android经验

比如Activity、View、Window的理解，各LaunchMode的使用场景，View的绘制流程，Touch事件机制，Android动画的原理，Handler, Looper的理解，Android跨进程通讯的方式，Binder的理解，Android Mashup设计的理解等等。 AsyncTask

## Java 相关

### public,private,protected,private 的区别

* public 公共修饰符，表示任意类都可以访问。
* protected 为受保护的修饰符，表示同类、同包以及子类可以访问。
* default 或者不写表示默认修饰符，或者称为package修饰符，该修饰符表示只有同类或同包下的类可以访问，出了这个包就不能访问了。
* private 为私有修饰符，表示只有同类中可以访问，出了这个类就不能访问了。

### Java 内存管理机制

* java 的内存泄露
* 自动垃圾回收机制（GC）
* 强引用、软引用、弱引用和虚引用

### == 与 equals 的区别

==比较两个对象在内存里是不是同一个对象，就是说在内存里的存储位置一致。两个String对象存储的值是一样的，但有可能在内存里存储在不同的地方 .

### final,finally,finalize的区别

 final: 常量声明。 finally: 处理异常。 finalize: Object类的方法，帮助进行垃圾回收。

### 面向对象设计的头 5 大原则

参考 [S.O.L.I.D：面向对象设计的头 5 大原则](http://blog.jobbole.com/86267/)

```
S – 单一职责原则
O – 开放封闭原则
L – 里氏替换原则
I – 接口隔离原则
D – 依赖倒置原则
```

### 面向对象的三个基本特征

* 封装：把客观事物封装成抽象的类
* 继承：使用现有类的所有功能，并在无需重新编写原来的类的情况下对这些功能进行扩展
* 多态：覆盖，重载
    * 覆盖：是指子类重新定义父类的虚函数的做法。
    * 重载：是指允许存在多个同名函数，而这些函数的参数表不同（或许参数个数不同，或许参数类型不同，或许两者都不同）。

### 如何原地交换两个变量的值？

```
a=a+b; b=a-b; a=a-b;
```

或

```
a = a ^ b;
b = a ^ b;
a = a ^ b;
```

### Overload 和 Override 的区别

重载 (Overload)  表示同一个类中可以有多个名称相同的方法，但这些方法的参数列表各不相同（即参数个数、类型或顺序不同）。

重写 (Override)  表示子类中的方法可以与父类中的某个方法的名称 和参数完全相同，通过子类创建的实例对象调用这个方法时，将调用子类中的定义方法，这相当于把父类中定义的那 个完全相同的方法给覆盖了，这也是面向对象编程的多态性的一种表现。

### 反射

通过反射API可以获取程序在运行时刻的内部结构

Java 动态代理：可以在运行期动态的创建接口的实现。

* [Java 反射机制](http://wiki.jikexueyuan.com/project/java-reflection/)
* [深入浅出反射](http://www.jianshu.com/p/5db744d8fcd0)

## Android 相关

### 四大基本组件

* Activity
* BroadcastReceive 广播接收器
* Service 服务
* Content Provider 内容提供者

4大基本组件都需要注册才能使用

#### Service

* 默认在主线程
* 可配置 `android:process` 新开进程
* 可创建子线程

##### 根据启动方式分为两类

* Started 启动后不关闭,开启新进程
* Bound 绑定的所有任务结束后关闭，原进程

##### 按服务性质分

* Local Service 用于应用程序内部
* Remote Service　用于android系统内部的应用程序之间

##### 按实现方法分类

* Java Service
* Native Service 用c和c++，实现的系统级的服务我们可以把它当成在library内层。

##### 按前后台分

* 普通Service 会一直有一个正在运行的图标在系统的状态栏显示
* 前台Service

##### IntentService

IntentService是Service的子类，比普通的Service增加了额外的功能。先看Service本身存在两个问题：  

* Service不会专门启动一条单独的进程，Service与它所在应用位于同一个进程中；  
* Service也不是专门一条新线程，因此不应该在Service中直接处理耗时的任务；  

IntentService特征

* 会创建独立的worker线程来处理所有的Intent请求；  
* 会创建独立的worker线程来处理`onHandleIntent()`方法实现的代码，无需处理多线程问题；  
* 所有请求处理完成后，IntentService会自动停止，无需调用stopSelf()方法停止Service；  
* 为Service的onBind()提供默认实现，返回null；  
* 为Service的onStartCommand提供默认实现，将请求Intent添加到队列中；

### 布局方式

* [LinearLayout](https://developer.android.com/guide/topics/ui/layout/linear.html?hl=zh-cn) 线性布局
* [Relative Layout](https://developer.android.com/guide/topics/ui/layout/relative.html?hl=zh-cn) 相对而局
* AbsoluteLayou 绝对布局
* TableLayout 表格布局
* FrameLayout 框架布局，所有界面从最左上开始
* DrawerLayout 侧滑菜单，属于Support Library包

### 视图

ViewGroup 的子 View

* [ListView](https://developer.android.com/guide/topics/ui/layout/listview.html?hl=zh-cn) 列表视图
* [GridView](https://developer.android.com/guide/topics/ui/layout/gridview.html?hl=zh-cn) 网格视图
* [Recycler View](https://developer.android.com/reference/android/support/v7/widget/RecyclerView.html) 谷歌V7包下新增的控件,用来替代ListView的使用，只管回收与复用View，其他的你可以自己去设置。
* `NavigationView` Android5.0之后，侧拉菜单滑出来的那一部分
* `ViewDragHelper` v4的支持包中提供，用来开发自定义ViewGroup，定义了一组有用的操作和状态追踪，

### Activity、Window、View三者的差别，fragment的特点？

 Activity像一个工匠（控制单元），Window像窗户（承载模型），View像窗花（显示视图） LayoutInflater像剪刀，Xml配置像窗花图纸。在Activity中调用attach，创建了一个Window

### Handler、Thread、Looper、HandlerThread

参考 [ Android中Thread、Handler、Looper、MessageQueue的原理分析 ](http://blog.csdn.net/bboyfeiyu/article/details/38555547)

android.os.Handler可以通过Looper对象实例化，并运行于另外的线程中，Android提供了让Handler运行于其它线程的线程实现，也是就HandlerThread。HandlerThread对象start后可以获得其Looper对象，并且使用这个Looper对象实例Handler。

一个Looper类似一个消息泵。它本身是一个死循环，不断地从MessageQueue中提取Message或者Runnable。而Handler可以看做是一个Looper的暴露接口，向外部暴露一些事件，并暴露sendMessage()和post()函数。

### HandlerThread、 AsyncTask、 EventBus

* HandlerThread继承自Thread，就是Thread加上一个Looper
* AsyncTask是谷歌对Thread和Handler的进一步封装，完全隐藏起了这两个概念，而用doInBackground(Params... params)取而代之。但需要注意的是AsyncTask的效率不是很高而且资源代价也比较重，只有当进行一些小型操作时为了方便起见使用。
由于AsyncTask会持续地运行下去（即使启动它们的Activity/Fragment已经被销毁了）。这样，一旦你在onPostExecute方法中试图对UI进行更新，那么最终将导致抛出一个IllegalStateException异常。
* 使用EventBus不仅使代码变得清晰，而且增强了类型安全（type-safe）

#### EventBus

```java
// 注册
EventBus.getDefault().register(this);
// 注销
EventBus.getDefault().unregister(this);
// 发送事件
EventBus.getDefault().post()
```

```
onEvent(T event)：运行在和被发送事件相同的线程中。
onEventMainThread(T event)：运行在主（UI）线程中，不管事件从哪个线程中被发送过来。
onEventBackgroundThread(T event)：如果发送事件的线程不是UI线程，则运行在该线程中。如果发送事件的是UI线程，则它运行在由EventBus维护的一个单独的线程中。多个事件会同步地被这个单独的后台线程所处理。
onEventAsync(T event)：运行在单独的线程中，即非UI线程，也非发送事件的线程。
```

### Jpg 和 Png

* alpha 你是否真的需要？如果需要 alpha 通道，那么没有别的选择，用 png。
* 你的图色值丰富还是单调？就像刚才提到的，如果色值丰富，那么用jpg，如果作为按钮的背景，请用 png。
* 对安装包大小的要求是否非常严格？如果你的 app 资源很少，安装包大小问题不是很凸显，看情况选择 jpg 或者 png（不过，我想现在对资源文件没有苛求的应用会很少吧。。）
* 目标用户的 cpu 是否强劲？jpg 的图像压缩算法比 png 耗时。这方面还是要酌情选择，前几年做了一段时间 Cocos2dx，由于资源非常多，项目组要求统一使用 png，可能就是出于这方面的考虑。

### Switch能否用string做参数？

java 7 支持，string hashCode() 后实现的

### 多线程

### Android 事件分发机制原理

### Android 绘图机制原理

### WindowManager

### 进程间传输方式

###  Activity与Fragment的生命周期

### Activity缓存方法

### 动画有哪两类，各有什么特点？三种动画的区别

* tween 补间动画。通过指定View的初末状态和变化时间、方式，对View的内容完成一系列的图形变换来实现动画效果。 Alpha Scale Translate Rotate。

* frame 帧动画 AnimationDrawable 控制 animation-list xml布局

* PropertyAnimation 属性动画

### Android的数据存储形式。

* SQLite：SQLite是一个轻量级的数据库，支持基本的SQL语法，是常被采用的一种数据存储方式。 Android为此数据库提供了一个名为SQLiteDatabase的类，封装了一些操作数据库的api

* SharedPreference： 除SQLite数据库外，另一种常用的数据存储方式，其本质就是一个xml文件，常用于存储较简单的参数设置。

* File： 即常说的文件（I/O）存储方法，常用语存储大数量的数据，但是缺点是更新数据将是一件困难的事情。

* ContentProvider: Android系统中能实现所有应用程序共享的一种数据存储方式，由于数据通常在各应用间的是互相私密的，所以此存储方式较少使用，但是其又是必不可少的一种存储方式。例如音频，视频，图片和通讯录，一般都可以采用此种方式进行存储。每个Content Provider都会对外提供一个公共的URI（包装成Uri对象），如果应用程序有数据需要共享时，就需要使用Content Provider为这些数据定义一个URI，然后其他的应用程序就通过Content Provider传入这个URI来对数据进行操作。

### 你用过什么框架，是否看过源码，是否知道底层原理。

#### Retrofit

Retrofit 是一个 RESTful 的 HTTP 网络请求框架的封装

Retrofit 2.0 开始内置 OkHttp

简易的接口配置、强大的扩展支持、优雅的代码结构

原生的 HttpUrlConnection > 经典的 Apache 的 HttpClient > OkHttp > Square 公司开源的 Retrofit

#### [EventBus](https://github.com/GeniusVJR/LearningNotes/blob/master/Part1/Android/EventBus%E7%94%A8%E6%B3%95%E8%AF%A6%E8%A7%A3.md)

EventBus是一款针对Android优化的发布/订阅（publish/subscribe）事件总线。主要功能是替代Intent,Handler,BroadCast在Fragment，Activity，Service，线程之间传递消息。

#### [Android-Universal-Image-Loader](https://github.com/nostra13/Android-Universal-Image-Loader) 图片框架

#### 打补丁框架

### Android 高版本 API 方法在低版本系统上的兼容性处理

参考 [Android 高版本 API 方法在低版本系统上的兼容性处理 ](https://www.liaohuqiu.net/cn/posts/using-high-api-level-method-compatibly/)

* 用 @TargeApi($API_LEVEL) 显式表明方法的API level要求，使编译通过, 不建议使用 @SuppressLint("NewApi");
* 运行时判断系统版本，在低版本系统不调用此方法

### Service 种类

### 下拉刷新，上拉获取更多 怎么实现

* 系统方法 `SwipeRefreshLayout` 没有上拉获取更多
* 自定义上拉获取更多添加嵌套滑动

### 嵌套滑动

NestedScrollingChild
NestedScrollingParent

嵌套滑动机制是在 Android 发布 Lollipop 之后提供的
不过同样在Support v7 中同样支持了

RecycleView  以及 Android 5.0 以上的系统原声View 大部分都已经支持 嵌套滑动了

### SurfaceView

SurfaceView中包含一个Surface对象，而Surface是可以在后台线程中绘制的。Surface属于 OPhone 底层显示系统。SurfaceView的性质决定了其比较适合一些场景：需要界面迅速更新、对帧率要求较高的情况。

例如显示摄像头数据。

SuraceView的主要优势

1、SurfaceView的刷新处于主动，有利于频繁的更新画面。
2、SurfaceView的绘制在子线程进行，避免了UI线程的阻塞。
3、SurfaceView在底层实现了一个双缓冲机制，效率大大提升。

### MVC MVP MVVM

* MVC: Model > View > Controller > Model
* MVP: Model <> Presenter <> View
* MVVM ~= MVP

Presenter :作为View与Model交互的中间纽带，处理与用户交互的负责逻辑。

优点：

* 降低耦合度，实现了Model和View真正的完全分离，可以修改View而不影响Modle
* 模块职责划分明显，层次清晰
* 隐藏数据
* Presenter可以复用，一个Presenter可以用于多个View，而不需要更改Presenter的逻辑（当然是在View的改动不影响业务逻辑的前提下）
* 利于测试驱动开发。
* View可以进行组件化。
* 代码灵活性

缺点：

* Presenter中除了应用逻辑以外，还有大量的View->Model，Model->View的手动同步逻辑，造成Presenter比较笨重，维护起来会比较困难。
* 由于对视图的渲染放在了Presenter中，所以视图和Presenter的交互会过于频繁。
* 如果Presenter过多地渲染了视图，往往会使得它与特定的视图的联系过于紧密。一旦视图需要变更，那么Presenter也需要变更了。
* 额外的代码复杂度及学习成本。

### Binder机制

Binder是Android系统进程间通信(IPC)方式之一。

Binder使用Client－Server通信方式。

### JSON

* JSONObject 可以实现 JSON 字符串与 JSONObject 互转功能

 JSONObject -> json string：toString()
 json string -> JSONObject：new JSONObject()

* google-gson 可以实现 JSONObject 或 JSON 字符串 与 模型互转的功能

object -> json string `gson.toJson(obj)`
json string -> object `gson.fromJson(json, BagOfPrimitives.class)`

### 序列化

界面传数据不能直接传对象，需要序列化之后才能传。需要 Intent 需要序列化

Android序列化对象主要有两种方法：

* 实现Serializable接口,实现Serializable接口是JavaSE本身就支持的;

* 实现Parcelable接口,Parcelable是Android特有的功能，效率比实现Serializable接口高，像用于Intent数据传递也都支持，而且还可以用在进程间通信(IPC)，除了基本类型外，只有实现了Parcelable接口的类才能被放入Parcel中。

### 打包，固化

gym 360加固
