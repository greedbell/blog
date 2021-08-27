# 崩溃日志解析

## 崩溃日志查看

### Xcode

1. 手机连上 Mac 电脑
2. Xcode > Window > Devices and Simulators > Devices > 选择对应手机 > 找到对应崩溃日志 > 下载下来
3. 在打包的电脑（确保符号文件未删除）上用 Xcode 打开崩溃日志，就可以解析崩溃日志

### symbolicatecrash

### atos

## UUID

### dSYM

```bash
#获取.dsym文件的UUID，值可能包含armv7/arm64两组
$ dwarfdump --uuid XX.app.dSYM
#获取.app文件的UUID，值可能包含armv7/arm64两组
$ dwarfdump --uuid XX.app/XX
```

### crash 文件

```bash
$ grep “appName armv” *crash
# 或者
$ grep --after-context=2 “Binary Images:” *crash
```
