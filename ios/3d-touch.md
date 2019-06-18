# 3D Touch

* Home Screen Quick Actions （主屏快捷行为入口）
* peek and pop （预览和弹出）
* Force Properties （按压力度）
* Web view peek and pop API (HTML链接预览功能)

## Home Screen Quick Actions

`Info.plist` 添加

```xml
<key>UIApplicationShortcutItems</key>
<array>
  <dict>
    <key>UIApplicationShortcutItemIconType</key>
    <string>UIApplicationShortcutIconTypeSearch</string>
    <key>UIApplicationShortcutItemSubtitle</key>
    <string>shortcutSubtitle1</string>
    <key>UIApplicationShortcutItemTitle</key>
    <string>shortcutTitle1</string>
    <key>UIApplicationShortcutItemType</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER).First</string>
    <key>UIApplicationShortcutItemUserInfo</key>
    <dict>
      <key>firstShorcutKey1</key>
      <string>firstShortcutKeyValue1</string>
    </dict>
  </dict>
  <dict>
    <key>UIApplicationShortcutItemIconType</key>
    <string>UIApplicationShortcutIconTypeShare</string>
    <key>UIApplicationShortcutItemSubtitle</key>
    <string>shortcutSubtitle2</string>
    <key>UIApplicationShortcutItemTitle</key>
    <string>shortcutTitle2</string>
    <key>UIApplicationShortcutItemType</key>
    <string>$(PRODUCT_BUNDLE_IDENTIFIER).Second</string>
    <key>UIApplicationShortcutItemUserInfo</key>
    <dict>
      <key>secondShortcutKey1</key>
      <string>secondShortcutValue1</string>
    </dict>
  </dict>
</array>
```

## iOS 模拟器支持 3D Touch

参考 <https://stackoverflow.com/a/32533162>，模拟器设置里没有 `3D Touch` 的设置，但是如果 Mac 支持 `3D Touch`，就可以直接用 Mac 的 `3D Touch`。

## References

* [Getting Started with 3D Touch](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/Adopting3DTouchOniPhone/index.html)
* [Take Advantage of 3D Touch](https://developer.apple.com/ios/3d-touch/)
* [iOS 3D touch开发(一) Home Screen Quick Actions](http://liuyanwei.jumppo.com/2016/03/21/iOS-3DTouch-1.html)
