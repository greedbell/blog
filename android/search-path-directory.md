# Android 文件路径

应用在被卸载后，这些目录下文件都会被删除

* `getFilesDir()`: `/data/data/<package name>/files` 内存上的文件目录
* `getCacheDir()`: `/data/data/<package name>/cache` 内存上的缓存目录，空间不足时会被删掉
* `getExternalFilesDir(String)`: `/storage/sdcard0/Android/data/<package name>/files/` 外部存储的文件目录，不会扫描到媒体
* `getExternalCacheDir()`: `/storage/sdcard0/Android/data/<package name>/cache/` 外部存储的缓存目录，空间不足时会被删掉，不会扫描到媒体

应用在被卸载后，这些目录下文件不会被删除

* `Environment.getDataDirectory()`：`/data` （无权限访问）
* `Environment.getDownloadCacheDirectory()`：`/cache` 下载缓存路径，（无权限访问）
* `Environment.getRootDirectory()`：`/system` （无权限访问）
* `Environment.getExternalStorageDirectory()`：`/storage/sdcard0`

## 外部存储相关操作

* `Environment.getExternalStorageState(File)`: 获取外部存储状态
* `Environment.isExternalStorageEmulated`: 设备的外存是否是用内存模拟的
* `Environment.isExternalStorageRemovable()`: 设备的外存是否是可以拆卸的

```java
/**
 * 判断外部存储是否可用.
 *
 * @return boolean
 */
public static boolean hasSDCardMounted() {
    String state = Environment.getExternalStorageState();
    if (state != null && state.equals(Environment.MEDIA_MOUNTED)) {
        return true;
    } else {
        return false;
    }
}
```

## 权限相关

* `READ_EXTERNAL_STORAGE`: 外部存储读权限
* `WRITE_EXTERNAL_STORAGE`: 外部存储写权限

如果设备运行的是 Android 6.0（API 级别 23），并且应用的 targetSdkVersion 是 23 或更高版本。需要动态获取权限

参考 [READ_EXTERNAL_STORAGE](https://developer.android.com/reference/android/Manifest.permission.html?hl=zh-cn#READ_EXTERNAL_STORAGE) API >= 19 时，`getExternalFilesDir(String)` 和 `getExternalCacheDir()` 不需要开启权限 `READ_EXTERNAL_STORAGE` 和 `WRITE_EXTERNAL_STORAGE` 权限

读写 `Environment.getExternalStorageDirectory()` 时，需要开启 `READ_EXTERNAL_STORAGE` 和 `WRITE_EXTERNAL_STORAGE` 权限

外部 App 只能打开 SD 卡上的文件

## References

* <https://developer.android.com/reference/android/content/Context.html>
* <https://developer.android.com/reference/android/Manifest.permission.html>
* <https://developer.android.com/reference/android/os/Environment.html>
