# ssh 方式架设 git 服务

## 服务器

### 创建 git 用户


### 初始化 /git 目录

```shell
$ sudo mkdir /git
$ sudo chown -R git:staff /git/
```

### 初始化仓库

```shell
$ su - git
$ git init --bare --shared=group /git/test.git
```

## 客户端

这里都以服务器在本地为例，所以在使用的时候记得把 localhost 换成对应服务器地址。

### 建立 ssh 互信

拷贝本地公钥到服务器的`/home/git/.ssh/authorized_keys`

```shell
$ ssh git@localhost "mkdir ~/.ssh"
$ scp ~/.ssh/id_rsa.pub git@localhost:~/.ssh/id_rsa.pub.back
$ ssh git@localhost "cat ~/.ssh/id_rsa.pub.back >> ~/.ssh/authorized_keys"
```

### 如果是重新创建新仓库，直接 clone

```shell
$ git clone ssh://git@localhost/git/test.git
```

### 如果要在原有仓库基础上转移到新的仓库

添加 remote

```shell
$ git remote add ssh ssh://git@localhost/git/test.git
```

push 到新的仓库

```shell
$ git push ssh master
```
