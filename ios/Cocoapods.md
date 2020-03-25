# Cocoapods

* [官网](https://cocoapods.org/)
* [podspec文档](https://guides.cocoapods.org/syntax/podspec.html)
* [podfile文档](https://guides.cocoapods.org/syntax/podfile.html)

## 安装

```sh
gem install cocoapods
```

## Podfile

* `use_frameworks!` 使用 frameworks，而不使用静态库
* `inhibit_all_warnings!` 继承所有警告，Xcode 中显示 cocoapods 工程的警告

## lib

开发 pod 库

### 用Cocoapods的模板

```
$ pod lib create GreedAppleWallet
```

### 用自定义的模板

```
$ pod lib create GreedAppleWallet --template-url=https://github.com/GreedBell/pod-template
```

### lint

```
pod lib lint GreedAppleWallet.podspec
```

## trunk

发布 pod 库
