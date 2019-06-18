# 子模块

* [Git-工具-子模块](https://git-scm.com/book/zh/v2/Git-%E5%B7%A5%E5%85%B7-%E5%AD%90%E6%A8%A1%E5%9D%97)

> 子模块允许你将一个 Git 仓库作为另一个 Git 仓库的子目录。 它能让你将另一个仓库克隆到自己的项目中，同时还保持提交的独立

## 添加子模块

```
$ git submodule add --name DbConnector https://github.com/chaconinc/DbConnector DbConnector
```

## 克隆含有子模块的项目

### 方法一

```
$ git clone https://github.com/chaconinc/MainProject
$ cd MainProject
$ git submodule init
$ git submodule update
```

### 方法二

```
$ git clone --recursive https://github.com/chaconinc/MainProject
```

## 更新子模块

```
$ git submodule update --remote
```

## 删除子模块


```sh
git submodule deinit -f -- a/submodule    
rm -rf .git/modules/a/submodule

git rm -rf a/submodule
# Note: a/submodule (no trailing slash)

# or, if you want to leave it in your working tree
git rm --cached a/submodule
```

```sh
git submodule add --name RSKImageCropper https://github.com/shimo-react-native/RSKImageCropper.git ios/RSKImageCropper

git submodule deinit -f -- ios/RSKImageCropper
rm -rf .git/modules/ios/RSKImageCropper
git rm -rf ios/RSKImageCropper
git rm --cached ios/RSKImageCropper
```
