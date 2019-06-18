# rsync

同步文件

```sh
rsync [OPTION]... [SRC]... [USER@]HOST::DEST
```

## 参数

```
-a, --archive 归档模式，表示以递归方式传输文件，并保持所有文件属性，等于-rlptgoD。
-v, --verbose 详细模式输出。
-r, --recursive 对子目录以递归模式处理。
-z, --compress 传递的时候先压缩
--delete 删除那些DST中SRC没有的文件。
--delete-excluded 同样删除接收端那些被该选项指定排除的文件。
--exclude=PATTERN 指定排除不需要传输的文件模式。
--include=PATTERN 指定不排除而需要传输的文件模式。
```

## Reference

* [rsync命令](http://man.linuxde.net/rsync)
