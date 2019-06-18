# Android

* [官网](https://www.android.com/)
* [Android开发者网站](https://developers.google.com/android/)
* [Android开发者网站大陆镜像](http://androiddoc.qiniudn.com/)
* [android studio](https://developer.android.com/studio/index.html)

## 学习

* [Android 学习路线图](http://diycode.cc/topics/122)
* [Android官方培训课程中文版](http://hukai.me/android-training-course-in-chinese/index.html)

## RxJava

* <http://rxjava.yuxingxin.com/index.html>


## .9.png

* <http://isux.tencent.com/android-ui-9-png.html>

## sp：

为了将字体更好的在不同的设备间很好的显示，修改原理跟dp上述基本一样，只是文字基本是矢量的，只要设置尺寸即可，不需要重新制作资源。

Scale-independent Pixels - 一般情况下（不修改系统字体大小），sp和dp是一个值。

如果修改了系统字体大小，sp和dp就不同了。注意要用getResources()获取。

## Android 中 Parcelable 接口的使用

对象序列化

* <http://www.cnblogs.com/liuling/p/2015-10-14-01.html>

## EventBus

发布 / 订阅的事件总线，包含4个成分：发布者，订阅者，事件，总线

* [GitHub](https://github.com/greenrobot/EventBus)
* [官方文档](http://greenrobot.org/eventbus/documentation/how-to-get-started/)

## Adapter

适配器，数据和界面绑定

## Presenter

MVP 的 P。 逻辑层，业务逻辑，用于 请求数据、存储数据、读取数据等等

## Data Binding Library

* [Data Binding Library](https://developer.android.com/topic/libraries/data-binding/index.html?hl=zh-cn)
* [Data Binding 用户指南（Android](https://segmentfault.com/a/1190000002876984)

## Network

### [volley](https://android.googlesource.com/platform/frameworks/volley)

install from [JCenter](https://bintray.com/android/android-utils/com.android.volley.volley)

```
compile 'com.android.volley:volley:1.0.0'
```

## Context

凡是跟UI相关的，都应该使用Activity做为Context来处理

* [Android Context 上下文 你必须知道的一切 ](http://blog.csdn.net/lmj623565791/article/details/40481055)
