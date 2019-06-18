# 全面屏

1.声明 Maximum Aspect Ratio

Android 标准接口中，支持应用声明其支持的最大屏幕高宽比（maximum aspect ratio）。具体声明如下，其中的 ratio_float 被定义为是高除以宽，以 16:9 为例，ratio_float = 16/9 = 1.778 (18.5:9则为2.056)。

若开发者没有声明该属性，ratio_float 的默认值为1.86

```xml
<meta-data android:name="android.max_aspect"
android:value="ratio_float" />
```

## References

* [支持多种屏幕](https://developer.android.com/guide/practices/screens_support.html)
* [小米文档中心-全面屏及虚拟键适配说明](https://dev.mi.com/console/doc/detail?pId=1160)
