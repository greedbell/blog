# 原生模块基础篇

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [原生模块基础篇](#原生模块基础篇)
	* [创建原生库](#创建原生库)
		* [手动创建原生库](#手动创建原生库)
			* [创建 Example 工程](#创建-example-工程)
			* [创建 iOS 原生模块](#创建-ios-原生模块)
			* [创建 Android 原生模块](#创建-android-原生模块)
				* [Questions](#questions)
			* [Link](#link)
				* [Link 方法一](#link-方法一)
				* [Link 方法二 (推荐)](#link-方法二-推荐)
				* [Link 方法三](#link-方法三)
		* [react-native-create-library 创建原生模块](#react-native-create-library-创建原生模块)
			* [安装](#安装)
			* [使用](#使用)
			* [Questions](#questions-1)
			* [References](#references)
		* [react-native-create-bridge 创建原生模块 (不推荐)](#react-native-create-bridge-创建原生模块-不推荐)
			* [References](#references-1)
	* [iOS 原生模块](#ios-原生模块)
		* [UI 库](#ui-库)
		* [Module](#module)
		* [给Javascript发送事件](#给javascript发送事件)
		* [添加 cocoapods 依赖](#添加-cocoapods-依赖)
		* [注意事项](#注意事项)
		* [References](#references-2)
	* [Android 原生模块](#android-原生模块)
		* [普通模块](#普通模块)
		* [ViewManager 创建 UI 组件](#viewmanager-创建-ui-组件)
		* [Package 注册模块、UI 组件](#package-注册模块-ui-组件)
		* [发送事件到JavaScript](#发送事件到javascript)
		* [添加 Maven 依赖](#添加-maven-依赖)
		* [References](#references-3)

<!-- /code_chunk_output -->


## 创建原生库

可以手动一步一步创建原生库，也可以直接使用工具

### 手动创建原生库

#### 创建 Example 工程

```sh
cd <react-native-example-module>
npm init
mkdir ios
mkdir android
```

创建 Example 工程

```sh
react-native init Example
cd <react-native-example-module>/Example
npm install
```

#### 创建 iOS 原生模块

```sh
cd <react-native-example-module>/Example
```

创建原生模块

```sh
react-native new-library --name RNExampleModule
```

拷贝文件到 ios 目录

```sh
cp -a Libraries/RNExampleModule/*.{h,m,xcodeproj} ../ios/
cp Libraries/RNExampleModule/*.js ../
```

删除临时文件

```sh
rm -rf Libraries/RNExampleModule
```

#### 创建 Android 原生模块

```sh
cd <react-native-example-module>/Example
```

打开 Example Android 工程

```sh
studio android
```

创建模块

```
File > New > New Module > 选择 Android Library > Next >
Application/Library Name 输入模块名:Example Module，
Module name 输入模块名:react-native-example-module，
Package name 输入包名:im.shimo.baidumjt，
Minimum SDK:API 16
> Finish
```

build.gradle 做如下修改

* 由于 RN 用的老版本的 Gradle，不支持最新的语法。所以 build.gradle 中的 implementation api 要换成 compile，
* compileSdkVersion 26
* buildToolsVersion "26.0.2"
* dependencies 添加 `compile 'com.facebook.react:react-native:+'`

创建基础的 Module 和 Package 文件。必须要有，否则 link 找不到模块。

拷贝 Android 模块到 android 目录

```sh
cp -a android/react-native-example-module/* ../android
```

AndroidStudio 按下面步骤删除刚创建的模块：

```sh
File > Project Structure > 选择 react-native-example-module，点上面的 - 号
```

删除临时文件

```sh
rm -rf android/react-native-example-module
```

##### Questions

Q: Could not find common.jar

修改 Gradle Scripts --->build.gradle(Project:项目名)--->allprojects｛｝如下：

```
repositories {
		maven{url"https://maven.google.com"}
		jcenter()
		maven{url 'https://jitpack.io'}
}
```

#### Link

原生模块 link 到 Example 工程。

##### Link 方法一

> 适用于 npm5 以下

```sh
cd <react-native-example-module>/Example
```

1. `package.json` 的 `dependencies` 添加 `"react-native-example-module": "../"`
2. `npm install`

安装原生库到 Example 工程

```
react-native link
```

然后在 `node_modules/react-native-example-module/` 目录下写原生库代码

写好后再拷贝到工程目录

```sh
cp -a node_modules/react-native-example-module/ios/* ../ios/
cp -a node_modules/react-native-example-module/android/* ../android/
cp node_modules/react-native-example-module/*.js ../
```

##### Link 方法二 (推荐)

> 适用于 npm5 及以上

```sh
cd <react-native-example-module>/Example
```

```sh
npm i ../
react-native link
```

由于 Example 工程依赖的 react-native-example-module 用的软链接，在上级目录下，所以 Xcode 的
`Header Search Paths` 需要添加 `$(SRCROOT)/../Example/node_modules/react-native/React` `non-recursive`

之后就可以直接在 Example 工程中写原生模块了，相比方法一，不用移动代码。

[有可能会报下面的错]：

1. error: bundling failed: "Unable to resolve module `react`

是因为运行 `npm i ../` 会创建从 `../` 到 `node_modules/react-native-example-module/` 的软链接。`react` 查找路径有可能会出错，需要在 <react-native-example-module> 目录安装 react

```sh
cd <react-native-example-module>
npm i --no-save react@16.2.0
```

##### Link 方法三

参考 [manual-linking](https://facebook.github.io/react-native/docs/linking-libraries-ios.html#manual-linking) 手动添加依赖

`Header Search Paths` 添加 `$(SRCROOT)/../../ios` `non-recursive`

然后直接在 Example 中写原生库

### react-native-create-library 创建原生模块

#### 安装

```sh
npm install -g react-native-create-library
```

#### 使用

以创建 react-native-key-command 模块为例

创建原生模块

```sh
react-native-create-library --package-identifier im.shimo.keycommand --platforms ios,android KeyCommand
mv KeyCommand react-native-key-command
```

创建 Example 工程

```sh
cd react-native-key-command
react-native init Example
cd Example
npm install
```

安装 react-native-key-command 到 Example 工程，参考 [Link 方法二 (推荐)](#link-方法二-推荐)

#### Questions

模块的 AndroidManifest.xml 会报 `URI is not registered` 错误

> 试了很多方法，都修不了，但是不影响使用

#### References

* [react-native-create-library](https://github.com/frostney/react-native-create-library)

### react-native-create-bridge 创建原生模块 (不推荐)

生成的原生模块直接在 RN 主工程里面，不是主工程通过 npm 方式引入。不推荐

#### References

* [react-native-create-bridge](https://github.com/peggyrayzis/react-native-create-bridge)

## iOS 原生模块

### UI 库

类名就是 Javascript 中访问的名字

### Module

* 定义个实现 `RCTBridgeModule` 协议的 Manager
* Manager 用宏 `RCT_EXPORT_MODULE()` 添加一个参数用来指定在Javascript中访问这个模块的名字
* Manager 用宏 `RCT_EXPORT_METHOD()` 声明要给Javascript导出的方法
* `- (NSDictionary *)constantsToExport` 导出常量

### 给Javascript发送事件

* [iOS 给Javascript发送事件](http://reactnative.cn/docs/0.44/native-modules-ios.html#%E7%BB%99javascript%E5%8F%91%E9%80%81%E4%BA%8B%E4%BB%B6)

### 添加 cocoapods 依赖

先生成 xcodeproj 工程

```sh
pod try AFNetworking
```

[注意] 并不是对所有 cocoapods 库都支持 `pod try`

再把依赖工程导入主工程，然后写 Module

### 注意事项

* 回调必须要以 on 开头

### References

* [如何封装原生模块的高级向导](http://reactnative.cn/docs/0.44/native-modules-ios.html#content)
* [ReactNative之原生模块开发并发布——iOS篇](http://www.liuchungui.com/blog/2016/05/02/reactnativezhi-yuan-sheng-mo-kuai-kai-fa-bing-fa-bu-iospian/)

## Android 原生模块

### 普通模块

> 为 js 提供方法

定义继承 `ReactContextBaseJavaModule` 的 Module 类

定义模块名

```java
@Override
public String getName() {
  return "ToastAndroid";
}
```

添加属性

```java
@ReactProp 或 @ReactPropGroup
```

添加方法

```java
@ReactMethod
public void show(String message, int duration) {
  Toast.makeText(getReactApplicationContext(), message, duration).show();
}
```

方法中的参数和返回传不能用 `Map`，需要用 `ReadableMap` 或者 `WritableMap`：

* `WritableMap` 一般是用于从原生传给 RN 的数据。接口，对应实现 `ReadableNativeMap`
* `ReadableMap` 一般是用于 RN 传向原生的数据。接口，对应实现 `WritableNativeMap`

导出常量

```java
/**
 * @return a map of constants this module exports to JS. Supports JSON types.
 */
public @Nullable Map<String, Object> getConstants() {
  return null;
}
```

### ViewManager 创建 UI 组件

> 为 js 提供组件，管理组件，`ReactShadowNode` 管理组件属性

* `createViewInstance` 创建视图
* `@ReactProp` `@ReactPropGroup` 导出视图属性的设置方法

### Package 注册模块、UI 组件

定义实际接口 `ReactPackage` 的 Package 类

`createNativeModules` 方法中添加 Module

```java
@Override
public List<NativeModule> createNativeModules(
                            ReactApplicationContext reactContext) {
  List<NativeModule> modules = new ArrayList<>();
  modules.add(new ToastModule(reactContext));
  return modules;
}
```

`createViewManagers` 方法添加 UI 组件

```java
@Override
public List<ViewManager> createViewManagers(
                          ReactApplicationContext reactContext) {
  return Arrays.<ViewManager>asList(
    new ReactImageManager()
  );
}
```

`ReactShadowNode` 添加修改布局的方法

`MainApplication.java` 中添加 Package

```java
protected List<ReactPackage> getPackages() {
    return Arrays.<ReactPackage>asList(
            new MainReactPackage(),
            new AnExampleReactPackage()); // <-- 添加这一行，类名替换成你的Package类的名字.
}
```

### 发送事件到JavaScript

* [Android 发送事件到JavaScript](http://reactnative.cn/docs/0.44/native-modules-android.html#%E5%8F%91%E9%80%81%E4%BA%8B%E4%BB%B6%E5%88%B0javascript)

RN JS 层通过 `NativeEventEmitter` 接收原生事件

### 添加 Maven 依赖

build.gradle 中添加 Maven 依赖，再写 Module ViewManager Package 就可以了

### References

* [ReactNative之原生模块开发并发布——android篇](http://www.liuchungui.com/blog/2016/05/08/reactnativezhi-yuan-sheng-mo-kuai-kai-fa-bing-fa-bu-androidpian/)
* [React-Native的Native UI Components整理 ](http://lrdcq.com/me/read.php/61.htm)
* [ React Native 封装Android UI组件 ](http://panda912.com/2017/01/17/React-Native-%E5%B0%81%E8%A3%85Android-UI%E7%BB%84%E4%BB%B6/)
