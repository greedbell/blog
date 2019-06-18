# 使用源码编译

## Android

fort react-native，然后 checkout fork 后仓库的代码。运行如下的命令

```sh
# 安装 npm 依赖
npm i
# 编译
./gradlew :ReactAndroid:build -x test -x lint
# 生成 maven 包到 android 目录
./gradlew :ReactAndroid:installArchives -x test -x lint
```

把 android 从 .gitignore 去掉，再 push 到仓库

参考 [shimo-react-native/react-native](https://github.com/shimo-react-native/react-native/tree/0.47-shimo)

## Questions

### react native 指向了 0.20.1 版

因为本地库 `$rootDir/../node_modules/react-native/android` 没有找到 `react-native` jar 包，所以使用了 [jCenter](http://jcenter.bintray.com/com/facebook/react/react-native/) 上的最新包，也就是 `0.20.1` 版。
