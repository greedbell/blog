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

## References

* [为Mac添加开机启动脚本](http://liuley.cn/%E6%8A%80%E6%9C%AF/2016/03/25/autorun-shellscript-when-start-mac.html)
