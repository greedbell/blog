# Jenkins 高级使用

- [Jenkins 高级使用](#jenkins-%E9%AB%98%E7%BA%A7%E4%BD%BF%E7%94%A8)
  - [ssh 远程](#ssh-%E8%BF%9C%E7%A8%8B)
    - [安装插件](#%E5%AE%89%E8%A3%85%E6%8F%92%E4%BB%B6)
    - [配置 SSH](#%E9%85%8D%E7%BD%AE-ssh)
    - [使用 SSH](#%E4%BD%BF%E7%94%A8-ssh)
  - [Keychains 管理](#keychains-%E7%AE%A1%E7%90%86)
  - [curl 修改 build 信息](#curl-%E4%BF%AE%E6%94%B9-build-%E4%BF%A1%E6%81%AF)
  - [Jenkins 命令行](#jenkins-%E5%91%BD%E4%BB%A4%E8%A1%8C)
  - [任务类型](#%E4%BB%BB%E5%8A%A1%E7%B1%BB%E5%9E%8B)
    - [构建一个自由风格的软件项目](#%E6%9E%84%E5%BB%BA%E4%B8%80%E4%B8%AA%E8%87%AA%E7%94%B1%E9%A3%8E%E6%A0%BC%E7%9A%84%E8%BD%AF%E4%BB%B6%E9%A1%B9%E7%9B%AE)
    - [Pipeline 流水线|管道](#pipeline-%E6%B5%81%E6%B0%B4%E7%BA%BF%E7%AE%A1%E9%81%93)
    - [MultiBranch Pipeline](#multibranch-pipeline)
  - [Pipeline](#pipeline)
  - [Jenkinsfile](#jenkinsfile)
    - [Git](#git)
  - [References](#references)

## ssh 远程

### 安装插件

* <https://plugins.jenkins.io/>

安装 [SSH 插件](https://wiki.jenkins-ci.org/display/JENKINS/SSH+plugin)。


### 配置 SSH

`Jenkins > 系统管理 > 系统设置 > SSH remote hosts`

### 使用 SSH

`构建 > 添加构建步骤 > Execute shell script on remote host using ssh`

## Keychains 管理

参考 [Keychains and Provisioning Profiles Plugin](https://wiki.jenkins.io/display/JENKINS/Keychains%20and%20Provisioning%20Profiles%20Plugin)

允许访问密码： `Keychains > 登录 > 密码 > 选择需要设置的密码 双击 > 访问控制 > 允许所有的应用程序访问此项目 > 存储更改`

Release Code Signing 改为手动：
```text
Xcode > Project > Build Settings > Code Signing Style > Release > Manual
Xcode > Project > Build Settings > Code Signing Identity > Release > iOS Distribution
```

## curl 修改 build 信息

```
# 获取 build 信息
curl -s --user "$USER:$PASSWORD" --data-urlencode "tree=description" \
    "$jenkins_url/job/$job_name/$build_number/api/json
```

```
# 修改
if curl -u $USER:$PASSWORD   --data-urlencode "description=$new_description" \
    --data-urlencode "Submit=Submit" \
    "$jenkins_url/job/$job_name/$build_number/submitDescription"
then
    echo "Description successfully changed on Build #$build_number in Jenkins job $job_name"
else
    echo "WARNING: Description was not set. Manually change the descripiton of the build"
    echo "         for Build #$build_number in Jenkins job $job_name"
fi
```

## Jenkins 命令行

* <http://localhost:8080/cli>

## 任务类型

### 构建一个自由风格的软件项目

### Pipeline （流水线|管道）

* [流水线](https://www.jenkins.io/zh/doc/book/pipeline/)

* `Declarative Pipeline` 相对简单，而且不需要学习groovy语法，对于日常的一般任务完全够用，
* `Scripted Pipeline` 可通过Groovy语言的强大特性做任何你想做的事情。

可以在 Jenkinsfile 中 clone 多个 repo 实现一个任务多仓库功能

### MultiBranch Pipeline（多分支流水线）

MultiBranch Pipeline可以理解为是针对某个工程所有分支代码的pipeline集合，jenkins会自动发现源代码中的jenkinsfile配置文件生成对应的分支job。
而MultiBranch Pipeline要求jenkinsfile配置文件存放在源代码的方式，也是符合Pipeline as Code的理念。虽然这也会给一些没有代码提交权限的devops工程师带来困扰。

## Pipeline

* [Pipeline Plugin](https://wiki.jenkins.io/display/JENKINS/Pipeline+Plugin)
* [Pipeline](https://jenkins.io/doc/book/pipeline/)

通过编写 Jenkinsfile 自动执行任务

## Jenkinsfile

* [Using a Jenkinsfile](https://jenkins.io/doc/book/pipeline/jenkinsfile/)

### Git

Jenkinsfile 中实现 `git clone` 功能：

使用 `checkout` 命令参考 [Pipeline: SCM Step](https://jenkins.io/doc/pipeline/steps/workflow-scm-step)

```groovy
 checkout([  
            $class: 'GitSCM',
            branches: [[name: 'refs/heads/master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [[$class: 'CloneOption', timeout: 120]],
            submoduleCfg: [],
            userRemoteConfigs: [[credentialsId: '6463627-ab54-4e42-bc29-123458', url: 'https://github.com/AtlasBID/CalibrationResults.git']]
])
```

或者使用 `git` 命令参考 [Pipeline Git plugin](https://jenkins.io/doc/pipeline/steps/git/)，只能使用 url，branch，changelog，credentialsId，poll 这几个参数

```groovy
git(
    url: 'git@git.shimo.im:shimo/baboon.git',
    branch: "$master"
)
```

## References

* [Automatically install Android dependencies in CI](http://vgaidarji.me/blog/2017/05/31/automatically-accept-android-sdkmanager-licenses/)
