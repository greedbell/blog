# 清理磁盘

```sh
# 查看当前目录下所有文件（夹）占用空间大小，并按大小排序
du -hs * | sort -rh
```

## 模拟器

清除 `~/Library/Developer/CoreSimulator/Devices/` 下不需要的模拟器

```sh
# 列出所有设备
xcrun simctl list devices
# 删除无用设备
xcrun simctl delete unavailable
```

```sh
# 删除模拟器日志
rm -rf ~/Library/Logs/CoreSimulator/*
```

## Archives

影响：不可恢复；Adhoc 或者 App Store 版本会被删除。建议备份 dSYM 文件夹

路径：`~/Library/Developer/Xcode/Archives`

## DerivedData

可重新生成；会删除 build 生成的项目索引、build 输出以及日志。重新打开项目时会重新生成，大的项目会耗费一些时间。

路径：`~/Library/Developer/Xcode/DerivedData`

## Other

- Xcode 下载缓存目录： `~/Library/Caches/com.apple.dt.Xcode/Downloads`
- Xcode 支持的系统：`~/Library/Developer/Xcode/iOS\ DeviceSupport/`

## References

- <http://blog.csdn.net/epeaktop/article/details/25295565>
- [Xcode 卡顿解决方案](http://www.cnblogs.com/songxing10000/p/5012604.html)
- [Xcode 磁盘空间大清理](https://www.iwangke.me/2013/09/09/clean-xcode-to-free-up-disk-space/)
