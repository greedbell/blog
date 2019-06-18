# Android 原生与 JS 互相调用

## V8

## React Native

app/build.gradle:

```
apply from: "../../node_modules/react-native/react.gradle"
```

react.gradle:

```

def cliPath = config.cliPath ?: "node_modules/react-native/local-cli/cli.js"
def bundleAssetName = config.bundleAssetName ?: "index.android.bundle"
def entryFile = config.entryFile ?: "index.android.js"
def bundleCommand = config.bundleCommand ?: "bundle"


def jsBundleFile = file("$jsBundleDir/$bundleAssetName")

if (Os.isFamily(Os.FAMILY_WINDOWS)) {
    commandLine("cmd", "/c", *nodeExecutableAndArgs, cliPath, bundleCommand, "--platform", "android", "--dev", "${devEnabled}",
            "--reset-cache", "--entry-file", entryFile, "--bundle-output", jsBundleFile, "--assets-dest", resourcesDir, *extraArgs)
} else {
    commandLine(*nodeExecutableAndArgs, cliPath, bundleCommand, "--platform", "android", "--dev", "${devEnabled}",
            "--reset-cache", "--entry-file", entryFile, "--bundle-output", jsBundleFile, "--assets-dest", resourcesDir, *extraArgs)
}
```

打包生成 `assets/index.android.bundle`

in Activity.java

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    mReactRootView = new ReactRootView(this);

    mReactInstanceManager = ReactInstanceManager.builder()
            .setApplication(getApplication())
            .setBundleAssetName("index.android.bundle")
            .setJSMainModuleName("index.android")
            .addPackage(new MainReactPackage())
            .setUseDeveloperSupport(BuildConfig.DEBUG)
            .setInitialLifecycleState(LifecycleState.RESUMED)
            .build();

    mReactRootView.startReactApplication(mReactInstanceManager, "Basic", null);

    setContentView(mReactRootView);
}
```

* ReactInstanceManager.java: 创建和管理 CatalyInstance 的实例
* `CatalystInstanceImpl.runJSBundle()` 加载 JS Bundle
* JavaScriptExecutor 	JS执行器，将JS的调用传给C++层

in CatalystInstanceImpl.cpp

```cpp
void CatalystInstanceImpl::jniLoadScriptFromAssets(
) {

}
```

in Instance.cpp

```cpp
nativeToJsBridge_->loadApplication(std::move(bundleRegistry), std::move(string),
std::move(sourceURL));
```

in NativeToJsBridge.cpp

```cpp
executor->loadApplicationScript(std::move(*startupScript),
                                    std::move(startupScriptSourceURL));
```

in JSCExecutor.cpp

```cpp
void JSCExecutor::loadApplicationScript(std::unique_ptr<const JSBigString> script, std::string sourceURL) {

	...
	//使用Webkit JSC去解释执行JS
	evaluateSourceCode(m_context, bcSourceCode, jsSourceURL);
	flush();
}
```

in JSIExecutor.cpp

```

```

in JSCRuntime.cpp

```
#include <JavaScriptCore/JavaScript.h>
```

in
```
#include <JavaScriptCore/JavaScript.h>
```

### JavaScriptCore

RN 使用了 [webkit/Source/JavaScriptCore/API/](https://github.com/WebKit/webkit/tree/master/Source/JavaScriptCore/API)

## References

* [react-native 启动流程原理解析](https://juejin.im/post/5a60036f5188257333661701)
* [ReactNative源码篇：启动流程](https://www.jianshu.com/p/58bb960541e2)
* [ReactNative源码分析-加载JSBundle](https://fsilence.github.io/2018/01/09/react-native-load-jsbundle/)
