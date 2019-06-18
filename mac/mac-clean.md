# Mac 删除临时文件

## 清除缓存文件

```shell
cd ~/Library/Caches/
du -hs * | sort -h
rm -rf ~/Library/Caches/*
```

## References

* [Mac OS X删除临时文件释放空间](https://blog.csdn.net/x_focus/article/details/50042385)
