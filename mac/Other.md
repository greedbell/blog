# Other

## 在mac中修改主机名

```shell
sudo scutil --set HostName servername.example.com
```

## BasicIPv6ValidationError

$ networksetup -setv6off Ethernet

## 更新 Numbers 等系统自带但收费的App

如果换了 Apple ID ，从 App Store 的更新界面更新需要之前的 Apple ID 。解决方法：

> 从 App Store 的已购项目中更新

## 更新系统时提示 未能验证

* [mac更新sierra public beta6失败提示“未能验证”解决办法](http://blog.sina.com.cn/s/blog_a7a3f3920102wxln.html)

```sh
sudo rm -rf /Library/Updates/​031-89979/
```


```sh
softwareupdate -l​
```

进入mac app store点击系统更新​按钮

## Finder 显示隐藏文件

```SH
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```
