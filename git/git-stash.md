# git stash

* [6.3 Git 工具 - 储藏（Stashing）](https://git-scm.com/book/zh/v1/Git-%E5%B7%A5%E5%85%B7-%E5%82%A8%E8%97%8F%EF%BC%88Stashing%EF%BC%89)

经常有这样的事情发生，当你正在进行项目中某一部分的工作，里面的东西处于一个比较杂乱的状态，而你想转到其他分支上进行一些工作。问题是，你不想提交进行了一半的工作，否则以后你无法回到这个工作点。解决这个问题的办法就是 `git stash` 命令。

## 使用

存储

```sh
git stash
```

查看存储列表

```sh
git stash list
```

查看某个存储的具体修改

```sh
git stash show 0
```

取出存储

```sh
git stash pop
```
