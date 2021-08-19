# 加速编译

## Xcode

显示编译计时器

```
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
```

Parallel Build

```
Xcode > Edit Scheme >  Build > 勾选 Parallel Build
```

修改并发编译数

```
defaults write com.apple.dt.Xcode PBXNumberOfParallelBuildSubtasks `sysctl -n hw.ncpu`
defaults write com.apple.dt.Xcode IDEBuildOperationMaxNumberOfConcurrentCompileTasks `sysctl -n hw.ncpu`

defaults read com.apple.dt.Xcode
```

## xcodebuild

修改并发编译数

```
defaults write com.apple.dt.xcodebuild PBXNumberOfParallelBuildSubtasks `sysctl -n hw.ncpu`
defaults write com.apple.dt.xcodebuild IDEBuildOperationMaxNumberOfConcurrentCompileTasks `sysctl -n hw.ncpu`

defaults read com.apple.dt.xcodebuild
```

### -parallelizeTargets

开启并发编译无依赖的构建任务

### -jobs NUMBER

并发编译数

## distcc

分布式编译工具

* [GitHub](https://github.com/distcc/distcc)


### 安装

```bash
brew install distcc
```

生成 `~/.distcc/hosts`


## ccache

编译缓存

* [GitHub](https://github.com/ccache/ccache)
* [官网](https://ccache.dev/)
* [官方文档](https://ccache.dev/manual/latest.html)

### Config

查看配置，查看缓存

```bash
$ ccache -s
```


配置文件 `~/.ccache/ccache.conf`

```txt
# Modules requires both direct and depend mode.
run_second_cpp = true
depend_mode = true
direct_mode = true

# Faster file copying (cloning) on APFS.
file_clone = true
inode_cache = true

# Accept more file changes before recompiling.
sloppiness = modules, include_file_mtime, include_file_ctime, time_macros, pch_defines, file_stat_matches, clang_index_store, system_headers

max_size = 100.0G
```

自定义 clang `ccache-clang`

```bash
#!/bin/sh
if type -p ccache >/dev/null 2>&1; then
  export CCACHE_MAXSIZE=10G
  export CCACHE_CPP2=true
  export CCACHE_HARDLINK=true
  export CCACHE_SLOPPINESS=file_macro,time_macros,include_file_mtime,include_file_ctime,file_stat_matches
  exec ccache /usr/bin/clang "$@"
else
  exec clang "$@"
fi
```

自定义 clang++ `ccache-clang++`

```bash
#!/bin/sh
if type -p ccache >/dev/null 2>&1; then
  export CCACHE_MAXSIZE=10G
  export CCACHE_CPP2=true
  export CCACHE_HARDLINK=true
  export CCACHE_SLOPPINESS=file_macro,time_macros,include_file_mtime,include_file_ctime,file_stat_matches
  exec ccache /usr/bin/clang++ "$@"
else
  exec clang++ "$@"
fi
```

CC = "$(SRCROOT)/../Resources/ccache-clang";

### 测试

1. `command+shift+k` 清除缓存
2. `command+b` 编译
3. `command+9` 选择编译任务 > 查看编译时间
5. 运行 `ccache -s` 查看 `cache hit rate`
4. 重复 1 2 3 操作，对比两次编译时间和`cache hit rate`


## References

* [Crazy Fast Builds Using distcc](https://pspdfkit.com/blog/2017/crazy-fast-builds-using-distcc/)
* [Using Ccache for Fun and Profit](https://pspdfkit.com/blog/2015/ccache-for-fun-and-profit/)
* [Faster Compilation with Ccache 4.0](https://pspdfkit.com/blog/2020/faster-compilation-with-ccache/)
* [Xcode Build Optimization: A Definitive Guide](https://flexiple.com/ios/xcode-build-optimization-a-definitive-guide/)
* [Improving the Speed of Incremental Builds](https://developer.apple.com/documentation/xcode/improving-the-speed-of-incremental-builds)
* [Xcode分布式编译调研distcc](https://punmy.cn/2019/06/11/distcc_on_xcode.html)
* [XCode加速编译最佳实践](https://www.jianshu.com/p/4d4af684f0ae)
* [用ccache让Xcode运行、打包飞起来](https://m.vlambda.com/wz_1sI3gNpSk6.html)
* [iOS如何把编译速度稳定地提高10倍以上](https://zhuanlan.zhihu.com/p/143775034)
* [cocoapods-imy-bin](https://github.com/MeetYouDevs/cocoapods-imy-bin)
