# arcanist

* arc 全称是 arcanist，百度给出的中文翻译是：巧匠。
* arc 是Facebook的Phabricator系统中用户端的命令行工具，配合pha提交变更评审的。

## 使用

```sh
# 切换要开发的分支
git checkout develop
# 创建临时分支
git checkout -b temp-branch
# 修改代码
git add . --all
git commit -m "commit log"
# 创建 revision，等待 review
arc diff develop
# 如果有问题重新修改再 commit, arc diff
# acceped 之后上传代码
arc land --onto develop

# if 有冲突
git checkout develop
git pull origin develop
git checkout dev-android
git rebase develop
git status
# 如果有冲突，处理冲突
git mergetool --tool=opendiff
git rebase --continue
# 提交代码，并删除临时分支
arc land --onto develop
```

## References

* [git与phabricator](http://www.jianshu.com/p/e8d520f65916)
* [Arcanist User Guide](https://secure.phabricator.com/book/phabricator/article/arcanist/)
* [GitHub](https://github.com/phacility/arcanist)
