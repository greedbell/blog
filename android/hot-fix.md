# 热更新

## Dalvik VS ART

* Dalvik 运行dex文件，自Android 2.2开始，Dalvik支持JIT（just-in-time，即时编译技术）。
* ART 即Android Runtime

ART 5.0 之后开始支持， 的机制与 Dalvik 不同。在Dalvik下，应用每次运行的时候，字节码都需要通过即时编译器（just in time ，JIT）转换为机器码，这会拖慢应用的运行效率，而在ART 环境中，应用在第一次安装的时候，字节码就会预先编译成机器码，使其成为真正的本地应用。这个过程叫做预编译（AOT,Ahead-Of-Time）。这样的话，应用的启动(首次)和执行都会变得更加快速。

ART 缺点：
1.机器码占用的存储空间更大
2.应用的安装时间会变长。

## android dex 分包方案

manifest 中比较找出有修改的 .class

### 生成 .class 文件

```
javac dynamic.java
```

### 制作 jar 包

```
cd ~/gitlab/bell/wanfantian/app/build/intermediates/classes/home/debug
jar cvf dynamic.jar -C ./com/deyi/wanfantian/untils/AppWebViewJavaScript*.class
```

### jar 包转换成 Dalvik byte code

dx 工具目录 `<Android SDK 目录>/build-tools/<build-tools 版本号>/dx`

```
/Users/Bell/Library/Android/sdk/build-tools/23.0.2/dx --dex --output=dex.jar dynamic.jar
```

### 打补丁

一个ClassLoader可以包含多个dex文件，每个dex文件是一个Element，多个dex文件排列成一个有序的数组dexElements，当找类的时候，会按顺序遍历dex文件，然后从当前遍历的dex文件中找类，如果找类则返回，如果找不到从下一个dex文件继续查找。
理论上，如果在不同的dex中有相同的类存在，那么会优先选择排在前面的dex文件的类 ，所以，把有问题的类打包到一个dex（patch.dex）中去，然后把这个dex插入到Elements的最前面 就可以实现打补丁功能。

Android的类加载机制：

Android的类加载器分为两种,PathClassLoader和DexClassLoader，两者都继承自BaseDexClassLoader

* PathClassLoader 用来加载系统类和应用类
* DexClassLoader 用来加载jar、apk、dex文件.加载jar、apk也是最终抽取里面的Dex文件进行加载.
* LexClassLoader 阿里的

```java
if(hasLexClassLoader()) {
    injectInAliyunOs(context, patchDexFile);
} else if(hasDexClassLoader()) {
    injectAboveEqualApiLevel14(context, patchDexFile);
} else {
    injectBelowApiLevel14(context, patchDexFile);
}
```

* 如果支持 `dalvik.system.LexClassLoader`（阿里自己的ClassLoader，补丁后缀 .lex） 则用 LexClassLoader 方式打包，
* 如果支持 `dalvik.system.BaseDexClassLoader` （API 大于等于 14 ） 则用 BaseDexClassLoader 方式打包
* API 小于 14

## 框架选择

参考 [Android 热修复方案对比 ](http://jaeger.itscoder.com/android/2016/08/28/android-hot-fix.html)

* 基于 Xposed 实现的无侵入的运行时 AOP (Aspect-oriented Programming)  框架，可以实现在线修复 Bug，修复粒度方法级别，但是由于对 ART 虚拟机不支持，导致其对 Android 5.0、6.0 均不支持，使用局限性太大。目前基于这一原理实现的解决方案是手淘团队开源的 Dexposed 项目。

## 问题

```
Conversion to Dalvik format failed:Unable to execute dex: method ID not in [0, 0xffff]: 65536
```

A：

参考 [配置方法数超过 64K 的应用](https://developer.android.com/studio/build/multidex.html)

Dalvik Executable 规范将可在单个 DEX 文件内可引用的方法总数限制在 65,536，其中包括 Android 框架方法、库方法以及您自己代码中的方法。

Android 5.0（API 级别 21）之前的平台版本使用 Dalvik 运行时来执行应用代码。默认情况下，Dalvik 限制应用的每个 APK 只能使用单个 classes.dex 字节码文件。要想绕过这一限制，您可以使用 Dalvik 可执行文件分包支持库，它会成为您的应用主要 DEX 文件的一部分，然后管理对其他 DEX 文件及其所包含代码的访问。

方法数超过 65536，编译的时候不再是单纯编译到一个 Dex 文件中去，而是切分成多个 Dex 文件。

## Reference

* [Tinker](https://github.com/Tencent/tinker) 推荐
* [Nuwa](https://github.com/jasonross/Nuwa) Android dex,作者好久都没维护了
* [RocooFix](https://github.com/dodola/RocooFix) Android dex
* [AndFix](https://github.com/alibaba/AndFix) 替换方法，无法添加类和字段
* [dexposed](https://github.com/alibaba/dexposed) 替换方法，无法添加类和字段
* [Android dex分包方案](http://my.oschina.net/853294317/blog/308583)
* <http://www.cnblogs.com/over140/archive/2011/11/23/2259367.html>
* [Android Patch 方案与持续交付](http://wereadteam.github.io/2016/07/26/AndroidPatch/)
* [各大热补丁方案分析和比较](http://blog.zhaiyifan.cn/2015/11/20/HotPatchCompare/)
* [安卓App热补丁动态修复技术介绍](https://zhuanlan.zhihu.com/p/20308548)
* [Android热修复学习之旅——HotFix完全解析](http://blog.csdn.net/u012124438/article/details/62511438)
* [Android 热修复其实很简单 ](http://blog.csdn.net/qq_31530015/article/details/51785228)
