# adb 命令

## 安装 apk

```sh
# 查看设备列表
adb devices
# 安装 apk
adb install <apk path>
```

## shell

```sh
# 获取 root 权限，否则 adb shell 后运行任何命令提示 “Permission denied”
adb root
# 查看设备列表
adb devices
# 进入设备 shell
adb -s emulator-5554 shell
```

## logcat

## 传输文件

获取文件

```sh
adb pull
```

上传文件

```sh
adb push
```

[Android File Transfer](https://www.android.com/filetransfer/) 图形界面上传获取文件