# Action Extension

扩展 UIActivityViewController 第二排操作，只会弹出窗口，不能跳转到 Containing App

## 创建

### 有界面

### 无界面

无界面的  Action Extension 取不到 UIResponder，所以无法打开 Host App

## Info.plist

* `CFBundleDisplayName`: 显示名称

## 设置图标

Xcode > Target > action > Build Settings > `Asset Catalog App Icon Set Name`: 设置为 `AppIcon`

## References

* [Understand Action Extensions](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/Action.html)
* [Sharing and Actions](https://developer.apple.com/design/human-interface-guidelines/ios/extensions/sharing-and-actions/)
* [【iOS扩展开发攻略】Action Extension](https://www.jianshu.com/p/37f23426bb04)
* [iOS Action Extension开发教程，实现跨APP的数据共享](https://www.jianshu.com/p/7f8472a97aa6)
