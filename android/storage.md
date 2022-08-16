# 存储

* [Android中关于外部存储的一些重要函数 ](http://hubingforever.blog.163.com/blog/static/1710405792012816103948907/)
* [Android中关于内部存储的一些重要函数](http://hubingforever.blog.163.com/blog/static/171040579201281895042802/)

## 访问外部存储的权限

　　从Android 1.0开始，写操作受权限WRITE_EXTERNAL_STORAGE保护。

　　从Android 4.1开始，读操作受权限READ_EXTERNAL_STORAGE保护。

　　从Android 4.4开始，应用可以管理在它外部存储上的特定包名目录，而不用获取WRITE_EXTERNAL_STORAGE权限。

　　比如，一个包名为com.example.foo的应用，可以自由访问外存上的Android/data/com.example.foo/目录。

## Android 存储目录

### Environment.getExternalCacheDir()
