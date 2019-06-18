# CI服务器与自动化部署

目前，业界比较流行的，支持iOS构建的CI服务器有Travis CI和Jenkins

## Travis CI

只支持gitHub

## Jenkins

### 安装

```shell
brew install jenkins
```

###启动

```shell
jenkins
```

默认为8080端口，自定义端口：

```shell
defaults write /Library/Preferences/org.jenkins-ci httpPort 7072
```

### 打开

<http://localhost:8080>

### 使用
