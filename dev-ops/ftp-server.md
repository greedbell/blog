# centos启用ftp功能

## 安装

```
$ yum -y install vsftpd
```

## 自启动

```
chkconfig vsftpd on
```

## 启动

```
service vsftpd start
```

## 停止

```
service vsftpd stop
```

## 配置

```
/etc/vsftpd/vsftpd.conf
/etc/pam.d/vsftpd
```

```
# useradd vsftpd -s /sbin/nologin
# useradd overlord -s /sbin/nologin

```

### 禁用selinux

* <http://unix.stackexchange.com/questions/79743/what-are-the-settings-to-correct-vsftpd-500-oops-cannot-change-directory-erro>

### 基于虚拟用户的配置


### 取消匿名登陆

```
anonymous_enable=NO
```

### 用户

默认有 `ftp` 用户对应 `/var/ftp` 根目录

## Questions

1. 500 OOPS: could not read chroot() list file:/etc/vsftpd/chroot_list

修改 `/etc/vsftpd/vsftpd.conf`

```
#chroot_list_enable=YES
#chroot_list_file=/etc/vsftpd.chroot_list
```

## Reference

* [我见过最好的vsftpd配置教程](https://segmentfault.com/a/1190000000438443)
* <http://os.51cto.com/art/201408/448630.htm>
* <http://www.pythontab.com/html/2014/linuxkaiyuan_0722/832.html>
