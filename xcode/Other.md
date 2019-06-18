# Other

## Edit all in Scope

选定一个想要修改的字符串，然后选择 Edit－Edit all in Scope，然后在你输入的时候，所有该字符出现的地方都进行同步更改

## cocoapods

开发库添加文件，pod update之后才能用

> 添加软链接到 `/Pods/Headers/Public`

## 修改XCode编译时使用的线程数

```shell
$ defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks `sysctl -n hw.ncpu`
```
