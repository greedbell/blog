# Xcode10

## 常见问题

### library not found for -lstdc++.6.0.9

因为 Xcode10 不再自带 libstdc++，需要从 Xcode9 拷贝过来

```
// 真机用
sudo cp /Applications/Xcode-9.4.1.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libstdc++.* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/

// 模拟器用
// 对于模拟器来说由于iOS12的模拟器将libstdc++.6.tbd & libstdc++.6.0.9.tbd已经删除，即使复制了文件，依然会报错
sudo cp /Applications/Xcode-9.4.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator11.4.sdk/usr/lib/libstdc++.* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.0.sdk/usr/lib/

sudo cp /Applications/Xcode-9.4.1.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/libstdc++.* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/
```

```sh
cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
sudo ln -s libstdc++.6.0.9.tbd libstdc++.6.tbd
sudo ln -s libstdc++.6.0.9.tbd libstdc++.tbd
```

拷贝结果

```
$ cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
$ ls -l libstdc++.*
-rw-r--r--@ 1 root  wheel  209673 10  8 21:22 libstdc++.6.0.9.tbd
lrwxr-xr-x  1 root  wheel      19 10  8 21:23 libstdc++.6.tbd -> libstdc++.6.0.9.tbd
lrwxr-xr-x  1 root  wheel      19 10  8 21:23 libstdc++.tbd -> libstdc++.6.0.9.tbd
```



### ld: symbol(s) not found for architecture x86_64

## RN 问题

### file can not found libfishhook.a

Libraries > RCTWebSocket > Build Phases > libfishhook.a 删了再添加

### 编译 glog 的时候 can not found config.h

运行下面脚本，配置 glog，再编译工程

```sh
cd node_modules/react-native/third-party/glog-0.3.4
../../scripts/ios-configure-glog.sh
```

或者

```sh
cd node_modules/react-native/third-party/glog-0.3.4
./configure --host arm-apple-darwin
```
### Cycle in dependencies between targets 'Lottie_iOS' and 'Communication';

 command + shift + k 清空缓存

### error: Multiple commands produce libReact.a

参考 https://stackoverflow.com/questions/51071090/multiple-commands-produced-error-xcode-10
方法一：
File > Project/Workspace settings > Build System 设置为 Legacy Build System
方法二：
target > Build phase > Copy Bundle Resource/Compile Sources > 删除 libReact.a

### signalhandler.cc:78:28: `no member named '__rip' in '__darwin_arm_thread_state'`

参考 https://github.com/facebook/react-native/issues/16106#issuecomment-401662200
node-module/react-native/third-party/glog-0.3.4/src/signalhandler.cc 78 行直接返回 NULL

## 新功能

### New Build System

https://stackoverflow.com/a/51205222/5266652


There is an (as of yet undocumented) flag in xcodebuild: -UseModernBuildSystem=<value>. The value can be either 0 or NO to use the legacy ("original") build system, or 1 or YES to use the new build system.
