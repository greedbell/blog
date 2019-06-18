# Git合并其它仓库的代码

## 增加新仓库

```shell
$ git remote add pod-template git@github.com:CocoaPods/pod-template.git
```

`pod-template`为本地新增加的仓库

## 查看新仓库

```
$ git remote -v
origin	git@github.com:GreedBell/pod-template.git (fetch)
origin	git@github.com:GreedBell/pod-template.git (push)
pod-template	git@github.com:CocoaPods/pod-template.git (fetch)
pod-template	git@github.com:CocoaPods/pod-template.git (push)
```

多了`pod-template`

## fetch 新仓库

```
$ git fetch pod-template
```

## 合并新仓库

```
$ git merge pod-template/master
```

## 提交

### 提交到自己仓库

```
$ git push origin master
```

### 提交到新仓库

如果有权限的话

```
$ git push pod-template master
```

## 相关资料

* <http://blog.sina.com.cn/s/blog_411fed0c0102vhlb.html>
