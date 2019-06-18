# iOS 文件夹路径


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [iOS 文件夹路径](#ios-文件夹路径)
	* [直接调用方法获取](#直接调用方法获取)
	* [通过 NSSearchPathForDirectoriesInDomains 方法获取](#通过-nssearchpathfordirectoriesindomains-方法获取)
		* [directory](#directory)
		* [domainMask](#domainmask)
		* [expandTilde](#expandtilde)

<!-- /code_chunk_output -->

## 直接调用方法获取

* `NSHomeDirectory(void)`: `<App Root>` App 沙盒根路径
* `NSTemporaryDirectory(void)`: `/tmp` 存放临时文件，iTunes 不会备份和恢复此目录，此目录下文件可能会在应用退出后删除，iPhone 重启时该目录下的文件会丢失

## 通过 NSSearchPathForDirectoriesInDomains 方法获取

```objc
FOUNDATION_EXPORT NSArray<NSString *> *NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde);
```

### directory

iOS开发是在沙盒中开发的，对一些部分的文件的读写进行了限制，只能在下面的目录下读写文件：

* `NSLibraryDirectory`: `<App Root>/Library` 存储程序的默认设置或其它状态信息，iTunes会自动备份该目录
* `NSDocumentDirectory`: `<App Root>/Documents` 应用中用户数据可以放在这里，iTunes备份和恢复的时候会包括此目录
* `NSCachesDirectory`: `<App Root>/Library/Caches` 存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除，空间不足时会删除
* `NSDocumentionDirectory`： 对应于程序中的Library/Documentation路径，这个路径是没有读写权限的，所以看不到文件生成。

### domainMask

```objc
typedef NS_OPTIONS(NSUInteger, NSSearchPathDomainMask) {
    NSUserDomainMask = 1,       // user's home directory --- place to install user's personal items (~)
    NSLocalDomainMask = 2,      // local to the current machine --- place to install items available to everyone on this machine (/Library)
    NSNetworkDomainMask = 4,    // publically available location in the local area network --- place to install items available on the network (/Network)
    NSSystemDomainMask = 8,     // provided by Apple, unmodifiable (/System)
    NSAllDomainsMask = 0x0ffff  // all domains: all of the above and future items
};
```

### expandTilde

是否把 `~` 转成绝对路径。YES 转
