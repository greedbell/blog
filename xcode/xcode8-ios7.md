# Xcode8 兼容iOS7以及低版本系统

## 安装 Xcode7

```sh
gem install xcode-install
xcversion install 7.3.1
```

## 拷贝 Xcode7 的 iOS7 的配置文件到 Xcode 8 目录下

```sh
sudo cp -rf /Applications/Xcode-7.3.1.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/7.0 /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/
```

## 修改 SDKSettings.plist

拷贝到其它目录并打开

```sh
cp /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/SDKSettings.plist ~/
open ~/SDKSettings.plist
```

做如下修改

```
DefaultProperties > DEPLOYMENT_TARGET_SUGGESTED_VALUES 添加 7.0
```

拷贝回原目录

```sh
sudo cp ~/SDKSettings.plist /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/
```

## 重启 Xcode

## Questions

1: `Shadow memory range interleaves with an existing memory mapping. ASan cannot proceed correctly. ABORTING.`

> 把Scheme里面 取消勾选 Address Sanitizer
