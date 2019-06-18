# Jenkins

* 官网 <http://jenkins-ci.org/>
* 文档 <https://wiki.jenkins-ci.org/display/JENKINS/Use+Jenkins>


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [Jenkins](#jenkins)
	* [centos 安装](#centos-安装)
		* [yum 方式安装](#yum-方式安装)
			* [Start/Stop](#startstop)
		* [docker 方式安装](#docker-方式安装)
	* [mac 安装](#mac-安装)
		* [方法一：](#方法一)
		* [方法二：](#方法二)
	* [启动](#启动)
	* [账户](#账户)
		* [开启用户注册](#开启用户注册)
		* [注册用户](#注册用户)
		* [设置权限](#设置权限)
	* [环境变量](#环境变量)
	* [插件](#插件)
	* [添加 git ssh 证书](#添加-git-ssh-证书)
	* [新建job](#新建job)
		* [源码管理](#源码管理)
		* [构建](#构建)
		* [注意](#注意)
	* [Poll SCM](#poll-scm)
	* [关闭](#关闭)
	* [Reference](#reference)

<!-- /code_chunk_output -->


## centos 安装

### yum 方式安装

* <https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Red+Hat+distributions>

```
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
```

#### Start/Stop

sudo service jenkins start/stop/restart
sudo chkconfig jenkins on

### docker 方式安装

* <https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+with+Docker>

```shell
docker pull jenkins:latest
```

```shell
docker run -d --name jenkins -p 8080:8080 -v /srv/docker/jenkins -t jenkins:latest
```

## mac 安装

### 方法一：

mac最新版下载 <http://mirrors.jenkins-ci.org/osx-stable/latest>

### 方法二：

```shell
$ brew install jenkins
```

## Mac 环境自启动

```sh
# 停止 Jenkins
$ sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist

# 开启 Jenkins
$ sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
```

## 启动

```shell
$ nohup jenkins > ~/.jenkins/run.log 2>&1 &
```
登录 <http://localhost:8080/> 访问`jenkins`.

## 账户

### 开启用户注册

系统管理 > Configure Global Security（全局安全配置） > 启用安全 > `jenkins 专有用户数据库 > 允许用户注册。  任何用户可以做任何事(没有任何限制)`  保存

### 注册用户

系统管理 > 管理用户 > 新建用户

### 设置权限

系统管理 > Configure Global Security（全局安全配置） > 项目矩阵授权策略

## 环境变量

系统管理->节点管理,选择节点，配置从节点

```sh
Node Properties
- PATH
- $PATH:/usr/local/bin
```

## 插件

系统管理 > 插件管理 > 高级 > 右下角：立即获取

* `Gitlab Hook Plugin`
* `GitLab Plugin`
* Xcode插件 `Xcode integration`
* 签名证书管理插件 `Credentials Plugin`
* 签名证书管理插件 `Keychains and Provisioning Profiles Management`
* 脚本插件 `Post-Build Script Plug-in`
* 邮件插件 `Email Extersion Plugin`
* `CocoaPods Jenkins Integration`
* [fir.im插件](http://blog.fir.im/jenkins/)
* JDK 插件 [JDK Parameter](https://wiki.jenkins.io/display/JENKINS/JDK+Parameter+Plugin)
* [Build Name Setter Plugin](https://wiki.jenkins.io/display/JENKINS/Build+Name+Setter+Plugin) 修改构建名字
* [Description Setter Plugin](https://wiki.jenkins.io/display/JENKINS/Description+Setter+Plugin) 修改构建说明

`Xcode插件`,`签名证书管理插件` 可以不用装，Jenkins会默认使用本机的。`Xcode插件`,`CocoaPods`,`fir.im插件`的功能都可以直接用`shell 脚本`实现

## 添加 git ssh 证书

`Jenkins > Credentials > System > Global credentials (unrestricted) > Add Credentials`

然后输入以下信息

```
Kind: SSH Username with private key
Scope: Global
Username: gitlab 的用户名
Private Key > Enter directly : 输入私钥
ID： 唯一 ID
Description：介绍
```

## 新建job

构建一个自由风格的软件项目。

### 源码管理

`源码管理 > Git`

 * `Repositories > Repository URL` 输入ssh方式的git地址
 * `Credentials` 选择之前添加的 `git ssh 证书`
 * `Additional Behaviours` Add `Clean before checkout`

### 构建

添加构建步骤 > Xcode

### 注意

工程的`scheme`必须设置成`Shared`才能在`Jenkins`上编译

## Poll SCM

定时检查源码变更（根据SCM软件的版本号），如果有更新就checkout最新code下来，然后执行构建动作。

<https://stackoverflow.com/a/9921495/6283925>

## 关闭

`jobs`查看后台任务号，`kill NUM`结束任务

## Reference

* <http://www.cnblogs.com/zz0412/p/jenkins_jj_14.html>
* <http://www.jianshu.com/p/c69deb29720d>
* <http://www.jianshu.com/p/a17167274463>
