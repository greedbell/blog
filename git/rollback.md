# 代码回滚

## `git revert`

是生成一个新的提交来撤销某次提交，此次提交之前、之后的commit都会被保留

* 添加新的提交记录，可以提交到远程仓库
* `git revert <commit id>` 后的冲突通过 `git mergetool` 解决

## `git reset`

是回到某次提交，提交及之前的commit都会被保留，但是此次之后的修改都会被退回到暂存区

* 用于查看历史记录，切换到历史记录后不能提交到远程仓库

### `git reset --hard`

撤销这次修改，之前本地的，没有提交的修改，都撤销


## Reference

* <http://blog.csdn.net/fyh2003/article/details/6869804>
