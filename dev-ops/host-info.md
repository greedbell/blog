# 查看主机信息

查看内核操作系统版本

````shell
# uname -a
Linux cp-43.webhostbox.net 2.6.32-531.23.3.lve1.3.6.el5h.x86_64 #1 SMP Mon Sep 29 18:16:21 CEST 2014 x86_64 x86_64 x86_64 GNU/Linux
# cat /proc/version
Linux version 2.6.32-531.23.3.lve1.3.6.el5h.x86_64 (mockbuild@build.cloudlinux.com) (gcc version 4.1.2 20080704 (Red Hat 4.1.2-54)) #1 SMP Mon Sep 29 18:16:21 CEST 2014
# getconf LONG_BIT
64
````

查看glibc版本
﻿
```shell
rpm -qi glibc
rpm -qa | grep glibc
ls -l /lib/libc.so.6
# ls -l /lib/libc.so.*
lrwxrwxrwx 1 root root 11 08-18 00:01 /lib/libc.so.6 -> libc-2.5.so*
# ls -l /lib64/libc.so.*
lrwxrwxrwx 1 root root 11 08-18 00:01 /lib64/libc.so.6 -> libc-2.5.so*
```
