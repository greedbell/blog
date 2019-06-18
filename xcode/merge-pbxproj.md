# 解决 pbxproj 合并冲突

* [A Better Way to Automatically Merge Changes in Your XCode Project Files](https://articles.mattoakes.net/a-better-way-to-automatically-merge-changes-in-your-xcode-project-files-3d83b3583fe4#.usdtppver)

```sh
brew install mergepbx
git mergetool --tool=mergepbx PROJECT.pbxproj
```
