# git branch

* `git branch` 列出本地已经存在的分支
* `git branch -r` 列出远程分支
* `git branch -a` 列出本地分支和远程分支
* `git branch -a` 列出本地分支和远程分支
* `git branch -d <branch>` 删除分支
* `git branch -D <branch>` 强制删除分支

## 创建分支

```
git branch <newbranch> / 基于当前HEAD创建<newbranch>分支
git checkout <newbranch>
git push origin <newbranch>
```

## 本地分支与远程分支对应

### git branch

```shell
git branch (--set-upstream-to=<upstream> | -u <upstream>) [<branchname>]
```

### git push

`-u` == `--set-upstream`

```shell
git push -u <remote> <branch>
```

### 查看

```shell
git branch -vv
```
