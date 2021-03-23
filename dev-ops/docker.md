# docker

* [官网](https://www.docker.com/)
* [Docker 中文指南](http://docker.widuu.com/index.html)

- [docker](#docker)
  - [镜像](#%E9%95%9C%E5%83%8F)
  - [centos 上安装](#centos-%E4%B8%8A%E5%AE%89%E8%A3%85)
  - [启动](#%E5%90%AF%E5%8A%A8)
  - [停止](#%E5%81%9C%E6%AD%A2)
  - [安装 docker-compose](#%E5%AE%89%E8%A3%85-docker-compose)
  - [docker 命令](#docker-%E5%91%BD%E4%BB%A4)
    - [查看正在运行的容器](#%E6%9F%A5%E7%9C%8B%E6%AD%A3%E5%9C%A8%E8%BF%90%E8%A1%8C%E7%9A%84%E5%AE%B9%E5%99%A8)
    - [删除所有容器](#%E5%88%A0%E9%99%A4%E6%89%80%E6%9C%89%E5%AE%B9%E5%99%A8)
    - [查看存在的镜像](#%E6%9F%A5%E7%9C%8B%E5%AD%98%E5%9C%A8%E7%9A%84%E9%95%9C%E5%83%8F)
    - [docker常用命令总结](#docker%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4%E6%80%BB%E7%BB%93)
      - [查询容器、镜像、日志](#%E6%9F%A5%E8%AF%A2%E5%AE%B9%E5%99%A8%E9%95%9C%E5%83%8F%E6%97%A5%E5%BF%97)
      - [删除容器与镜像](#%E5%88%A0%E9%99%A4%E5%AE%B9%E5%99%A8%E4%B8%8E%E9%95%9C%E5%83%8F)
      - [启动停止容器](#%E5%90%AF%E5%8A%A8%E5%81%9C%E6%AD%A2%E5%AE%B9%E5%99%A8)
  - [免 sudo 使用 docker](#%E5%85%8D-sudo-%E4%BD%BF%E7%94%A8-docker)
  - [容器](#%E5%AE%B9%E5%99%A8)
  - [在容器内使用命令](#%E5%9C%A8%E5%AE%B9%E5%99%A8%E5%86%85%E4%BD%BF%E7%94%A8%E5%91%BD%E4%BB%A4)


## 镜像

* [官方镜像](https://hub.docker.com/)
* [alauda 镜像](https://hub.alauda.cn/)
* [daocloud 镜像](https://hub.daocloud.io/)

## centos 上安装

* [How To Install Docker on CentOS 6](http://www.liquidweb.com/kb/how-to-install-docker-on-centos-6/)

```shell
# rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
# yum update -y
# yum -y install docker-io
```

* [Install Docker on CentOS](https://docs.docker.com/engine/installation/linux/centos/)

## 启动

```shell
# service docker start
```

## 停止

```shell
# service docker stop
```

## 安装 docker-compose

* <https://docs.docker.com/compose/install/>

```shell
$ curl -L https://github.com/docker/compose/releases/download/1.7.1/run.sh > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose
```

## docker 命令

### 查看正在运行的容器

```shell
docker ps -a
```

### 删除所有容器

```shell
docker rm -f $(docker ps -a -q)
```

### 查看存在的镜像

```shell
$ docker images
```

### docker 常用命令总结

* docker pull <镜像名:tag> #从官网拉取镜像
* docker search <镜像名> #搜索在线可用镜像名
* docker build Dockerfile #编译镜像

#### 查询容器、镜像、日志

* docker top <container> #显示容器内运行的进程
* docker images #查询所有的镜像，默认是最近创建的排在最上。
* docker ps #查看正在运行的容器
* docker ps -l #查看最后退出的容器的ID
* docker ps -a #查看所有的容器，包括退出的。
* docker logs {容器ID|容器名称} #查询某个容器的所有操作记录。
* docker logs -f {容器ID|容器名称} #实时查看容易的操作记录。

#### 删除容器与镜像

* docker rm$(docker ps -a -q) #删除所有容器
* docker rm <容器名or ID> #删除单个容器
* docker rmi <ID> #删除单个镜像
* docker rmi$(docker images | grep none | awk '{print $3}' | sort -r) #删除所有镜像

#### 创建容器

```sh
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

* -p: 指定端口映射，格式为：主机(宿主)端口:容器端口

#### 启动停止容器

* docker stop <容器名 or ID> #停止某个容器
* docker start <容器名 or ID> #启动某个容器
* docker kill <容器名 or ID> #杀掉某个容器

## 免 sudo 使用 docker

* <http://www.tuicool.com/articles/QrqamyN>
如果还没有 docker group 就添加一个：
    sudo groupadd docker
    将用户加入该 group 内。然后退出并重新登录就生效啦。
    sudo gpasswd -a ${USER} docker
    重启 docker 服务
    sudo service docker restart
    切换当前会话到新 group 或者重启 X 会话
    newgrp - docker
    OR
    pkill X
注意，最后一步是必须的，否则因为 groups 命令获取到的是缓存的组信息，刚添加的组信息未能生效，所以 docker images 执行时同样有错。

## 容器

`docker ps -a` 可以查看所有在运行容器 ID.

容器的本地存储路径为 `/var/lib/docker/containers/<CONTAINER ID + >`

容器 mnt 路径为 `/var/lib/docker/devicemapper/mnt/<CONTAINER ID + >`

## 在容器内使用命令

```
docker exec -it <CONTAINER ID + > bash
```

## 窗口与本机之间拷贝文件

```shell
# 拷贝到本机
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|
# 拷贝到容器
docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH
```
