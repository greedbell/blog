# 为普通用户添加 sudo 权限

```sh
# sudoedit /etc/sudoers
```

找到 root ALL=(ALL) ALL这一行，在后面再加上一行就可以了（不用引号）：
“username ALL=(ALL) ALL”
