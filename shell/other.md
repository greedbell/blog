# 杂七杂八

## 脚本当前目录

```shell
$(cd "$(dirname "$0")"; pwd)
```

## find

### 查看当前目录下除了Pods和Example的所有.h .m文件

```
$ find . -name *.[h,m] ! -path "./Pods/*" ! -path "./Example/*"
```

### 配合egrep

```
KEYWORDS="TODO|FIXME|\?\?\?:|\!\!\!:"
find . -name *.[h,m] ! -path "./Pods/*" ! -path "./Example/*" | xargs egrep --with-filename --line-number --only-matching ${KEYWORDS}
```

## 判断是不是整数

<http://mywiki.wooledge.org/BashFAQ/054>

## sed

* [sed 简明教程](https://coolshell.cn/articles/9104.html)

## awk
