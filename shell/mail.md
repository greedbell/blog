# mail命令使用

可以发送或查看邮件

## 发送邮件

### 发送给系统用户

```shell
$ echo "content" | mail -s "subject" user
```

或

```shell
$ mail -s "subject" user < content.file
```

### 发送给指定`email`

> NON

## 查看收件箱

> 运行`mail`进入`mail`命令行

### help

> 查看`mail`命令行下的帮助

### h

> 列出未读邮件列表

`>` 表示当前所在的邮件。`U`表示未读

### t

> 查看当前邮件

### n

> 查看下一封邮件

### d

> `d`删除当前邮件
> `d2`删除第二封邮件
> `d 1-100` 删除第1到100封邮件

### q

> 保存操作并退出

### x

> 不保存操作并退出
