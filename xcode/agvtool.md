# 利用 agvtool 更新 Version 和 build

更新 Version 和 build

## 使用

### 修改`Build Setting`

* Build Setting > Versioning System 设置为 Apple Generic
* Build Setting > Current Project Version 设置为0

### Version

#### 初始化

```shell
$ agvtool new-marketing-version 3.2.0
```

#### 查看

```shell
$ agvtool what-marketing-version
```

#### 自增

```shell
$ agvtool new-marketing-version
```

### Build

#### 初始化

```shell
$ agvtool new-version -all 19
```

#### 查看

```shell
$ agvtool what-version
```

### 自增

```shell
$ agvtool next-version
```

## 修改 Info.plist 的 CFBundleVersion

`agvtool next-version` 只会修改 `Build Settings` 里的 `Current Project Version`,不会修改 Info.plist 里的 `CFBundleVersion`，所以需要 PlistBuddy 来修改。

进入工程根目录，运行下面的脚本

```shell
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion `agvtool what-version | awk 'NR==2{print}' `"  Info.plist
```

## Reference

* <https://developer.apple.com/library/mac/qa/qa1827/_index.html>
* <https://segmentfault.com/a/1190000002423661>
