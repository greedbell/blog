# New Build System

## Building for iOS Simulator, but the linked and embedded framework 'IdcardQuality.framework'

参考

* <https://blog.csdn.net/MinggeQingchun/article/details/117628041>
* [为什么在 Xcode 12.3 及之后版本中使用 iOS 模拟器构建项目会失败？](https://docs.agora.io/cn/All/faq/ios_simulator_problem)

方法一：

在 Build Settings - Excluded Source File Names - Debug 添加 Any iOS Simulator: IdcardQuality.framework

引用的位置最好用TARGET_OS_SIMULATOR判断一下

方法二：

在 Xcode 中，进入 TARGETS > Project Name > Build Settings > Build Options 菜单，将 Validate Workspace 设置为 Yes。
