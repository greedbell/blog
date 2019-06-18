## Android

```java
ClipboardManager clipboard = getClipboardService();
// 不管粘贴板内容有没有变，内存地址都变化
ClipData clipData = clipboard.getPrimaryClip();

// 粘贴板内容复制时间，每次复制都不一样，可以当唯一 ID
// API 26 支持
long timestamp = clipData.getDescription().getTimestamp();

ClipData.Item firstItem = clipboard.getPrimaryClip().getItemAt(0);

// 粘贴板字符串
firstItem.getText()
```

### References

* [Copy and Paste](https://developer.android.com/guide/topics/text/copy-paste.html)
* [Android 剪贴板详解](https://github.com/MyLifeMyTravel/AndroidDemo/tree/master/clipboard)

## iOS


```objc
// 不管粘贴板内容有没有变，内存地址都不变
UIPasteboard *clipboard = [UIPasteboard generalPasteboard];

// 粘贴板字符串
NSString string = clipboard.string;

// 粘贴板计算，每复制一次次数加1，可以当唯一 ID
NSInteger changeCount = clipboard.changeCount;
```
