# 清理磁盘

## 模拟器

清除 `~/Library/Developer/CoreSimulator/Devices/` 下不需要的模拟器

```sh
# 列出所有设备
xcrun simctl list devices
# 删除无用设备
xcrun simctl delete unavailable
```

## Archives

影响：不可恢复；Adhoc或者App Store版本会被删除。建议备份dSYM文件夹

路径：`~/Library/Developer/Xcode/Archives`

## DerivedData

可重新生成；会删除build生成的项目索引、build输出以及日志。重新打开项目时会重新生成，大的项目会耗费一些时间。

路径：`~/Library/Developer/Xcode/DerivedData`

## Other

* Xcode 下载缓存目录： `~/Library/Caches/com.apple.dt.Xcode/Downloads`
* Xcode 支持的系统：`~/Library/Developer/Xcode/iOS\ DeviceSupport/`

## References

* <http://blog.csdn.net/epeaktop/article/details/25295565>
* [Xcode卡顿解决方案](http://www.cnblogs.com/songxing10000/p/5012604.html)
* [Xcode磁盘空间大清理](https://www.iwangke.me/2013/09/09/clean-xcode-to-free-up-disk-space/)
