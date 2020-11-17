# 开机自启动

## loginwindow

该方法最多只能设置一个执行脚本，且已经不被Apple推荐

添加自启动项

```sh
sudo defaults write com.apple.loginwindow LoginHook /path/to/script.sh
```

查看自启动项

```sh
sudo defaults read com.apple.loginwindow LoginHook
```

删除自启动项

```sh
sudo defaults delete com.apple.loginwindow LoginHook
```

添加退出时自动运行脚本

```sh
sudo defaults write com.apple.loginwindow LogoutHook /path/to/script.sh
```

## brew services

## launchctl

## 用户自启动

1. 自己新建个shell文件，编写shell脚本；
2. 点击shell文件，右键，点击“显示简介”，选择终端；注意：如果“推荐的应用程序”里没有终端，可以选择“所有应用程序”；
3. 打开“系统偏好设置”，点击“用户与群组”，然后切换到“登录项”tab，添加刚才创建的shell文件；

## References

* [为Mac添加开机启动脚本](http://liuley.cn/%E6%8A%80%E6%9C%AF/2016/03/25/autorun-shellscript-when-start-mac.html)
* [mac开机启动自动运行shell脚本](https://blog.csdn.net/enjoyinwind/article/details/86470674)
