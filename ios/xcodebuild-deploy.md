# 自动打包并发布应用

## `xcodebuild `打包

### 各参数使用说明

`$ man xcodebuild` 查看`xcodebuild`所有用法

#### -workspace

指定`workspace`.
必须和“-scheme”一起使用，构建该workspace下的一个scheme。

#### -project

指定`project`.
当根目录下有多个project的时候，必须使用“-project”指定project，

#### -target

指定target

#### -scheme

指定scheme.
和“-workspace”一起使用，指定构建的scheme。

#### -showsdks

列出可用的`SDK`

```shell
$ xcodebuild -showsdks
```

#### -sdk

设置`SDK`

```
-sdk iphoneos9.2
```

#### -list

列出所有可用的`Targets`、`Build Configurations`、`Schemes`

```shell
// 列出默认Project的
$ xcodebuild -list
// 列出指定workspace的
$ xcodebuild -list -workspace <NAME>.xcworkspace/
```

#### -configuration

编译的方式,Release,Debug,Adhoc 等

#### -destination

`generic/platform=iOS`

#### ONLY_ACTIVE_ARCH

ONLY_ACTIVE_ARCH=NO

### 构建行为

* clean:清除build目录下的
* build: 编译
* test: 测试某个scheme，必须和"-scheme"一起使用
* archive:打包，必须和“-scheme”一起使用

### scheme

用到的scheme都要设置成share

### 编译

```shell
$ xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${SCHEME_NAME} -sdk ${SDK_VERSION} -configuration ${CONFIGURATION} ONLY_ACTIVE_ARCH=NO build
```

### 打包

#### clean

```shell
$ xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${SCHEME_NAME} -sdk ${SDK_VERSION} -configuration ${CONFIGURATION} ONLY_ACTIVE_ARCH=NO clean
```

#### archive

导出.xcarchive该文件

```shell
$ xcodebuild -workspace ${WORKSPACE_NAME}.xcworkspace -scheme ${SCHEME_NAME} -sdk ${SDK_VERSION} -configuration ${CONFIGURATION} -destination ${ARCHIVE_DESTINATION} -archivePath ${APP_DIR}/${APP_NAME}.xcarchive ONLY_ACTIVE_ARCH=NO archive
```

#### export ipa

导出ipa文件

##### -exportProvisioningProfile

描述该文件名称,描述该文件`<key>Name</key>`对应的值

#### -exportOptionsPlist

plist文件路径。
```$ xcodebuild --help```plist文件参数

##### eg:

```shell
$ TIMESTAMP=`date "+%Y_%m_%d_%H_%M_%S"`
$ IPA_PATH_NO_SUFFIX=${APP_DIR}/${APP_NAME}_${TIMESTAMP}
$ xcodebuild -exportArchive -archivePath ${APP_DIR}/${APP_NAME}.xcarchive -exportPath ${IPA_PATH_NO_SUFFIX} -exportProvisioningProfile "${PROFILE_NAME}" -exportFormat ipa -verbose
```

## 发布到fir.im

### 安装cli

<https://github.com/FIRHQ/fir-cli/blob/master/README.md>

```shell
$ ruby -v # > 1.9.3
$ gem install fir-cli
```

### 发布ipa

```shell
fir publish ${IPA_PATH_NO_SUFFIX}.ipa -T ${FIR_TOKEN} || failed "fir publish"
```

## 常见问题

### Q1

```
** ARCHIVE FAILED **


The following build commands failed:
	CompileC ***** normal armv7 objective-c com.apple.compilers.llvm.clang.1_0.compiler
(1 failure)
```

### A1

直接用`Archive `:`Xode` > `Product` > `Archive`，可以提示具体的代码错误。

## 实例

[Example](https://github.com/GreedBell/resource/tree/master/shell/iosPublish)

## 相关资料

* [xcodebuild's new exportOptionsPlist flag](http://www.matrixprojects.net/p/xcodebuild-export-options-plist/)
* [构建iOS持续集成平台（一）——自动化构建和依赖管理](http://www.infoq.com/cn/articles/build-ios-continuous-integration-platform-part1/)
* [xcodebuild详细的命令行](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/xcodebuild.1.html)
* [使用 xcodebuild 从 archive 导出 ipa](http://blog.reohou.com/how-to-export-ipa-from-archive-using-xcodebuild/)
* <http://blog.octo.com/en/automating-over-the-air-deployment-for-iphone/>
* <https://fir.im/>
* <http://blog.reohou.com/how-to-export-ipa-from-archive-using-xcodebuild/>
* <http://www.tuicool.com/articles/FBbmEn>
* <http://magicalboy.com/xcodebuild-usage/>
