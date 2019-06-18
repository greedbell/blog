# openshift  搭建 node.js 服务

* <https://openshift.redhat.com>

## rhc

openshift 命令行管理工具

* <https://developers.openshift.com/managing-your-applications/client-tools.html>

### 安装

```shell
$ rvm gemset use global
$ gem install rhc
```

### 登录

```shell
$ rhc setup
```

### 查看app

```shell
$ rhc apps
```

Git URL: 为对应 app 的git 地址

### 代码管理

```shell
$ git clone <Git URL>
```

`git push` 会自动重启服务。

## 更新

clone openshift 上的代码，并 merge github上的代码，然后 push,会自动重启 node.js 服务。

## 端口 ip 监听

* <https://developers.openshift.com/managing-your-applications/port-binding-routing.html>

server.listen 的端口应该为 8080，ip 为 'localhost',ip 必须要设，否则会与 haproxy 监听 8080 端口冲突。具体可以参考 [openshift-cartridge-nodejs](https://github.com/icflorescu/openshift-cartridge-nodejs/blob/master/usr/template/app.js#L41)

## 访问

<https://name-org.rhcloud.com/>

## 区域选择

> The OpenShift Online Bronze and Silver plans are available in: North America (U.S. and Canada) Europe (EU member states, Iceland, Israel, Norway, Switzerland, and Russia)

免费版只能选 aws美国东部的。升级到 Bronze 或 Silver 计划才可以用包括aws亚洲在内的其它节点。
