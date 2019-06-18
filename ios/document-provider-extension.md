# Document Provider

**Attention** iOS 11 弃用，改用 File Provider

## 介绍

Document Provider Extension 是 iOS 8 出的功能，允许 app 和其它 app 进行文件传送、接收交互。

为了实现应用间共享数据，iOS 使用了两种单独的扩展。

* Document Picker:当另一个app启动iCloud file picker时呈现出的view controller。

* File Provider: 一个由NSFileCoordinator协调在host app与extension apps之间移动数据的非UI组件。NSFileCoordinator，正如其名，协调读取文件。它也允许多线程操作，例如host app及containing app,可以同时获取文件而不用彼此叨扰。

## References

* [Document Provider Extension](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/FileProvider.html) 官方文档
* [Document Provider Extensions](https://www.jianshu.com/p/3e3674630190)
* [App Extension编程指南（iOS8/OS X v10.10）：扩展类型--Document Provider](http://www.cocoachina.com/ios/20141007/9835.html)
* [App Extension Programming Guide ](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/index.html) App 扩展编程指南
