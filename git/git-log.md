# 提交记录

## 查看提交记录

```shell
$ git log
```

### graph

```shell
$ git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
```

## 查看记录详情

```shell
$ git show <commit>
```

## 切换到指定版本

```shell
$ git checkout  <commit>
```

`<commit>` 为`git log`对应的`commit`
