# git diff 的使用

`git diff`后者对前者的修改

## 比较两个分支

bell分支相对master分支的修改

```
$ git diff origin/master origin/bell
```

## 比较两个tag

```
$ git diff 0.0.1 0.0.2
```

0.0.1,0.0.2为tag

## 工作目录与上次提交时之间的差别

```shell
$ git diff HEAD
```

## 用其它工具查看 diff

```sh
git difftool
```

## Reference

* <http://www.cnblogs.com/wish123/p/3963224.html>
