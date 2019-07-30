# Mac OSX的开机启动配置

* [OSX的开机启动配置](http://www.tanhao.me/talk/1287.html/)

## 用户与群组 设置

## Launchd Daemon

* [Launch Daemons and Agents](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html#//apple_ref/doc/uid/10000172i-SW7-BCIEDDBJ)

### plist 文件存在的目录

#### 在使用者登入时载入

* ~/Library/LaunchAgents  由用户自己定义的任务项
* /Library/LaunchAgents 由管理员为用户定义的任务项
* /System/Library/LaunchAgents  由 Mac OS X 为用户定义的任务项

#### 在开机时载入

* /Library/LaunchDaemons 由管理员为用户定义的守护进程任务项
* /System/Library/LaunchDaemons 由 Mac OS X 定义的守护进程任务项

### 任务操作

* 加载任务 `launchctl load -w ***.plist` ；-w 选项会将plist文件中无效的key覆盖掉，建议加上
* 删除任务 `launchctl unload -w ***.plist`
* 查看任务列表 `launchctl list`；列表会显示很多任务，建议过滤一下：launchctl list | grep '任务的部分名字'

### launchd plist 文件说明

* Label: 任务名称，唯一的 Key
* ProgramArguments: 程序运行参数，第一个为需要执行的程序路径
* inetdCompatibility:
* KeepAlive: 是否始终运行
* RunAtLoad: 是否开启自启动
* StartCalendarInterval: 运行的时间，单个时间点使用dict，多个时间点使用 array <dict>
* StartInterval: 时间间隔，与StartCalendarInterval使用其一，单位为秒
* StandardInPath、StandardOutPath、StandardErrorPath：标准的输入输出错误文件，这里建议不要使用 .log 作为后缀，会打不开里面的信息。


## StartupItems

StartupItems一般存放在以下两个路径下：

1）/System/Library/StartupItems

2）/Library/StartupItems
