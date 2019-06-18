# PlistBuddy 操作 Plist 文件

```
/usr/libexec/PlistBuddy
```

## 使用

```
1.添加

/usr/libexec/PlistBuddy -c 'Add :Software:Gallery:Version string "1.0"' ~/Desktop/com.sample.plist

2.输出

/usr/libexec/PlistBuddy -c "Print" ~/Desktop/com.sample.plist

3.修改

/usr/libexec/PlistBuddy -c 'Set :Software:Gallery:Version "1.1"' ~/Desktop/com.sample.plist

4.删除

/usr/libexec/PlistBuddy -c 'Delete :Software:Gallery:Version' ~/Desktop/com.sample.plist

5.合并

/usr/libexec/PlistBuddy -c "Merge ~/Desktop/Global.plist :Software:Gallery" ~/Desktop/com.sample.plist
```

### 打印Build号

```
/usr/libexec/PlistBuddy -c "Print CFBundleVersion" ./Info.plist
```
