# xcconfig

## `XX.xcconfig`

xcconfig是一个保存xcode工程各种配置的纯文本文件,如果被使用,会覆盖掉相同的配置项,我们可以利用它进行管理工程使得同样的工程使用不同的预定义参数或编译期产生其他行为。

### 新建

File > New-File > iOS > Other > Configuration Setting File

### 参数

`Xcode Document` 中搜索 `Xcode Build Setting Reference: Build Setting Reference`，有所有参数说明

相关资料:

* <http://blog.csdn.net/fengsh998/article/details/8307424>

#### Targeted device family

目标平台

`TARGETED_DEVICE_FAMILY`

* 1：iPhone/iPod touch. (Default)
* 2：iPad.
* 1，2：iPad.

```
TARGETED_DEVICE_FAMILY = 1,2
```

### Runpath Search Paths

Space-separated list of directory paths. Specifies the run-path locations at which the dynamic loader searches for the product’s run-path dependent libraries. See * Dynamic Library Programming Topics. *

`LD_RUNPATH_SEARCH_PATHS`

```
LD_RUNPATH_SEARCH_PATHS = $(inherited) @executable_path/Frameworks
```

### Precompile Prefix Header

是否用pch文件

`GCC_PRECOMPILE_PREFIX_HEADER`

* YES: Target generates a prefix header when the prerequisite is met.
* NO: Target does not generate a prefix header.

```
GCC_PRECOMPILE_PREFIX_HEADER = YES
```

### Prefix Header

pch文件路径

`GCC_PREFIX_HEADER`

```
GCC_PREFIX_HEADER = MyProduct_Prefix.pch
```

### info.plist File

Info.plist文件路径

`INFOPLIST_FILE`

```
INFOPLIST_FILE = Info.plist
```

### PRODUCT_NAME

包名

`PRODUCT_NAME`

```
PRODUCT_NAME = PRODUCT_NAME
```

#### Build Active Architecture Only

Specifies whether the product includes only object code for the native architecture

`ONLY_ACTIVE_ARCH`

* YES: The product includes only code for the native architecture (NATIVE_ARCH).
* NO: The product includes code for the architectures specified in ARCHS (Architectures).

### 使用

如果用了`Cocoapods`，要加上 `Pods/Target Support Files/Pods/Pods.debug.xcconfig` 或 `Pods/Target Support Files/Pods/Pods.release.xcconfig`

` Xcode > Project > Info > Configurations `

修改各个Taget 的 Debug 和 Release 对应的xcconfig文件

## 运行脚本

### 新建

File > New-File > iOS > Other > Shell Script

### 使用

Xcode > TARGETS > Build Phases > + > New Run Script Phase


## 相关资料

* <http://www.hongtaozhy.com/2014/04/04/xcconfig/>
* <http://www.jianshu.com/p/44c82630bd50>
* [Xcode:用于管理多个 target 配置的 XCConfig 文件](http://www.daizi.me/2015/11/24/Xcode-%E7%94%A8%E4%BA%8E%E7%AE%A1%E7%90%86%E5%A4%9A%E4%B8%AA%20target%20%E9%85%8D%E7%BD%AE%E7%9A%84%20XCConfig%20%E6%96%87%E4%BB%B6/)
