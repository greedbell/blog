# tar

范例一：将整个 /etc 目录下的档案全部打包成为 /tmp/etc.tar 

```sh
[root@linux ~]# tar -cvf /tmp/etc.tar /etc  <==仅打包，不压缩！
[root@linux ~]# tar -czvf /tmp/etc.tar.gz /etc  <==打包后，以 gzip 压缩
[root@linux ~]# tar -cjvf /tmp/etc.tar.bz2 /etc  <==打包后，以 bzip2 压缩
```

范例二：查阅上述 /tmp/etc.tar.gz 档案内有哪些档案？

```sh
[root@linux ~]# tar -tzvf /tmp/etc.tar.gz 
```

范例三：将 /tmp/etc.tar.gz 档案解压缩在 /usr/local/src 底下

```sh
[root@linux ~]# cd /usr/local/src
[root@linux src]# tar -xzvf /tmp/etc.tar.gz
```