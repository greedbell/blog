# 混淆（Proguard）

* [压缩代码和资源](https://developer.android.com/studio/build/shrink-code.html?hl=zh-cn)


```
buildTypes {
        debug {

        }
        release {
            minifyEnabled true // 是否混淆
            shrinkResources true // 是否去除无效的资源文件
            // 混淆的配置文件
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
```

## 说明

应用程序经过proguard混淆处理后会输出一个mapping.txt文件，该文件可用于恢复混淆前的堆栈信息。proguard提供了一个方便的恢复工具（retrace），通过这些文件我们可以方便的还原出混淆之前的堆栈信息，从而更好的定位出问题。

* mapping.txt —> 表示混淆前后代码的对照表
* dump.txt —> 描述apk内所有class文件的内部结构
* seeds.txt —> 列出了没有被混淆的类和成员
* usage.txt —> 列出了源代码中被删除在apk中不存在的代码

## 结论

一般直接加固就可以了，不用混淆

## References

* [APK反逆向之二：四种基本加固方式 ](https://segmentfault.com/a/1190000007314624)
