# 用户和群组管理

* <http://www.cnblogs.com/xd502djj/archive/2011/11/23/2260094.html>

## 创建用户

```shell
# useradd -s /bin/bash -m user
# passwd user
```

## 删除用户

```
# userdel user
```

## 创建群组

```sh
# groupadd group
```

## 给已有的用户增加工作组

```shell
# gpasswd -a user group
```

或

```shell
# usermod -a -G group user
```

## 查看用户所在群组

```shell
$ groups
```

或

```shell
# groups user
```

## 配置文件

/etc/passwd 注：用户（user）的配置文件；
/etc/shadow 注：用户（user）影子口令文件；
/etc/group 注：用户组（group）配置文件；
/etc/gshadow 注：用户组（group）的影子文件；
