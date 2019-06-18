# Mac OSX的开机启动配置

* [OSX的开机启动配置](http://www.tanhao.me/talk/1287.html/)

## 用户与群组 设置

## Launchd Daemon

plist文件存在的目录

* ~/Library/LaunchAgents  由用户自己定义的任务项
* /Library/LaunchAgents 由管理员为用户定义的任务项
* /System/Library/LaunchAgents  由Mac OS X为用户定义的任务项

当登录之后启动的进程

* ~/Library/LaunchDaemons 由管理员定义的守护进程任务项
* /Library/LaunchDaemons
* /System/Library/LaunchDaemons 由Mac OS X定义的守护进程任务项

任务操作

* 加载任务 `launchctl load -w ***.plist` ；-w选项会将plist文件中无效的key覆盖掉，建议加上
* 删除任务 `launchctl unload -w ***.plist`
* 查看任务列表 `launchctl list`；列表会显示很多任务，建议过滤一下：launchctl list | grep '任务的部分名字'

2.直接创建、修改、删除相关目录下面的plist文件。

## StartupItems

StartupItems一般存放在以下两个路径下：

1）/System/Library/StartupItems

2）/Library/StartupItems


## crash

```

BSD process name corresponding to current thread: plugin-container

Mac OS version:
16D32

Kernel version:
Darwin Kernel Version 16.4.0: Thu Dec 22 22:53:21 PST 2016; root:xnu-3789.41.3~3/RELEASE_X86_64
Kernel UUID: C67A8D03-DEAC-35B8-8F68-06FF7B687215
Kernel slide:     0x0000000002200000
Kernel text base: 0xffffff8002400000
__HIB  text base: 0xffffff8002300000
System model name: MacBookPro11,4 (Mac-06F11FD93F0323C5)

System uptime in nanoseconds: 24790762300817
last loaded kext at 1166571048252: com.apple.iokit.IOBluetoothUSBDFU	5.0.3f1 (addr 0xffffff7f85408000, size 12288)
last unloaded kext at 1651656867550: com.apple.driver.usb.cdc	5.0.0 (addr 0xffffff7f85401000, size 28672)
loaded kexts:
com.apple.driver.AudioAUUC	1.70
```
