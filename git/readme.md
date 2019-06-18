# Git

* [官方中文文档](https://git-scm.com/book/zh/v2)
* [PDF 版](resource/progit-zh.936.pdf)
* [gitflow](https://github.com/nvie/gitflow)

## 命令

### cherry-pick

合并指定 commit

Example：

```sh
git cherry-pick <commit id>
```

## 代理

* [git 设置和取消代理](https://gist.github.com/laispace/666dd7b27e9116faece6)

```sh
git config --global http.proxy http://127.0.0.1:1080
git config --global https.proxy https://127.0.0.1:1080

git config --global --unset http.proxy

git config --global --unset https.proxy


npm config delete proxy
```
