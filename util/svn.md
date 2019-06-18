# SVN

* [Subversion](https://subversion.apache.org/)
* [TortoiseSVN](https://tortoisesvn.net/)
* [Subversion 与版本控制的在线主页](http://svnbook.red-bean.com/)
* [Version Control with Subversion 翻译](http://svnbook.red-bean.com/nightly/zh/svn-book.html)

## 服务端

### Install

* [Apache Subversion Binary Packages](https://subversion.apache.org/packages.html)

```
yum install subversion
yum install mod_dav_svn
```

### 创建 svn 用户

```
# useradd -m svn
```

### 为 svn 用户设置密码

```
# passwd svn
```

### 切换到 svn 用户

```
# su - svn
```

### 创建仓库

```
$ mkdir ~/test
$ svnadmin create ~/test/
```

### 配置

* [Built-in Authentication and Authorization](http://svnbook.red-bean.com/en/1.6/svn-book.html#svn.serverconfig.svnserve.auth)

`~/test/conf` 下面三个是配置文件

#### svnserve.conf

* `password-db` 存放用户名密码的配置文件 eg:`password-db = passwd`
* `authz-db` 存放用户权限的配置文件 eg:`authz-db = authz`
* `realm` 仓库的验证身份域，默认为仓库的 uuid
* `anon-access` 未认证用户权限 `none`，`read`，`write`
* `auth-access` 认证用户权限 `read`，`write`

注意每行配置末尾不能有空格

### passwd

存放用户名密码

### authz

存放用户权

* [Path-Based Authorization](http://svnbook.red-bean.com/en/1.6/svn-book.html#svn.serverconfig.pathbasedauthz)

```
$authenticated = rw
```

所有认证用户有读写权限

### 启动SVN服务

```
$ svnserve -d -r /home/svn
```

监听 3690 端口

### 结束 SVN 服务

```
$ ps -ef |grep svnserve
$ kill -9 <对应进程 ID>
```

## 客户端

### 登录

```
svn
```

```
$ svn co svn://<svn address>/test
```

## Reference

* [Linux(centOS6.5)下SVN的安装、配置及开机启动](http://www.blogjava.net/rockblue1988/archive/2014/11/19/420246.aspx)
