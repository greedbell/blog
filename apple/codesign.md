# 代码签名

* codesign： 代码签名
* Signing Identity： 证书名
* provisioning profiles： 描述文件

codesign 使用 Signing Identity 对应的证书来签名

```sh
code sign -s <Signing Identity> <app path>
```

## 重新签名ipa

从描述文件导出 entitlements.plist

```sh
security cms -D -i <mobileprovision file> > entitlements_full.plist
/usr/libexec/PlistBuddy -x -c 'Print:Entitlements' entitlements_full.plist > entitlements.plist
```

**生成的 plist 文件内容不能修改，因为 App 安装的时候会检验 entitlements 是否和描述文件一致，不一致就会安装失败**

查看可以签名的证书

```sh
security find-identity -v -p codesigning
```

### 使用 fastlane 重新签名

单目标

```sh
fastlane sigh resign shimo.ipa -e entitlements.plist -i "iPhone Distribution: Company (UFAYDHAUP)" -p <mobileprovision file>
```

多标题

苹果开发者网站从新建立了三个AppID，然后将三个AppID装在一个group中，然后生成hoc Provisioning Profiles

```sh
fastlane sigh resign Quip.ipa  -i "iPhone Developer: XXXXXX" -p com.quip.Quip="Development_Test_Quip.mobileprovision" -p com.quip.Quip.DocumentProvider=".mobileprovision"  -p com.quip.Quip.DocumentProviderFileProvider=".mobileprovision" --use_app_entitlements
```

### 使用 codesign 重新签名

### References

* [重新签名ipa](http://www.jianshu.com/p/470f7c2ecc07)
* [使用 Xcode 调试第三方应用](http://bbs.iosre.com/t/xcode/8567)
* <https://stackoverflow.com/a/36890405>
* [代码签名探析](https://objccn.io/issue-17-2/)
* [Xcode 9's Manual Provisioning Changes](http://martiancraft.com/blog/2017/07/manual-provisioning/)
* [ipa多目标重签名流程](https://blog.csdn.net/qq896953198/article/details/71158610)
