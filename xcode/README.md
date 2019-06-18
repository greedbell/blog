# Xcode

## Debug View Hierarchy

显示app视图结构

## Profile

编译 > 运行 > Instruments

## Analyze

静态代码分析

Analyze 主要分析以下四种问题

1. 逻辑错误：访问空指针或未初始化的变量等；
2. 内存管理错误：如内存泄漏等； 比如ARC下,内存管理不包括core foundation
3. 声明错误：从未使用过的变量；
4. Api调用错误：未包含使用的库和框架。

## Clang Static Analyzer

命令行方式静态代码分析

* [Clang Static Analyzer](https://clang-analyzer.llvm.org/)
* [Running the analyzer within Xcode](https://clang-analyzer.llvm.org/xcode.html)

### 安装

从 <https://clang-analyzer.llvm.org/release_notes.html> 下载安装对应版本

### 工具

#### scan-build

静态代码分析工具

Xcode Analyze 工具

* [使用方法](https://clang-analyzer.llvm.org/scan-build)

Example:

```sh
scan-build xcodebuild -configuration Debug -sdk iphonesimulator12.1
```

#### scan-view

查看 scan-build 生成的日志文件

Example:

```
scan-view /var/folders/j5/rp29_qg91ll9dg817j_9l1qw0000gn/T/scan-build-2018-12-17-153756-7659-1
```

## 编译出错常用处理方法

1. `<React/RCTBridge.h> are not found`

Edit Scheme > Build > 取消勾选 Parallelize Build

2. `'Masonry.h' file not found`

CocoaPods 相关的头文件找不到。
解决方法一：
Target 切换到 Generic iOS Device > Build > 再切回原 target 统计
：
解决方法二：
ONLY_ACTIVE_ARCH 设为 NO，再编译

## Questions

1. Quick Help 不显示注释

> 删掉 `~/Library/Caches/com.apple.dt.Xcode`, 再重启 Xcode

2.  Problems with glog (config.h missing) and gflags/gflags.h on Xcode 10

```
cd ./node_modules/react-native/third-party/glog-0.3.4 && ../../scripts/ios-configure-glog.sh
```

参考 <https://github.com/facebook/react-native/issues/19774#issuecomment-397910801>

## References

* [苹果开发者的Mac大瘦身](https://welkinx.com/2016/04/16/0/)
* [Managing Xcode](https://pewpewthespells.com/blog/managing_xcode.html)
