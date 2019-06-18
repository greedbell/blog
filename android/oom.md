# 内存溢出

## 查看内存

Android Studio 开启 monitor

```
Android Studio > Tools > Android > Enable ADB Integration
```

查看内存使用情况

```
Android Studio > Android Monitor > Monitors > Memory
```

Memory 的 `Dump java heap` 按钮可以导出并查看内存堆栈

## 解决内存溢出

`AndroidManifest.xml` 中添加

```xml
<!-- 关闭硬件加速 -->
android:hardwareAccelerated="false"
<!-- 请求系统为Dalvik虚拟机分配更大的内存空间 -->
android:largeHeap="true"
```

参考 <https://stackoverflow.com/a/32245018/6283925>

## References

* [在Android中解决内存溢出 – OutOfMemoryError](http://blog.chengdazhi.com/index.php/89)
* [ Android高效加载大图、多图解决方案，有效避免程序OOM ](http://blog.csdn.net/guolin_blog/article/details/9316683)
