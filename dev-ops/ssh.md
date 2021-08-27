# SSH

## SSH 互信

```shell
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 755 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

## 配置 SSH 不自动关闭

在服务端

打开
/etc/ssh/sshd_config
找到
ClientAliveInterval
参数，如果没有就自己加一行
数值是秒，比如你设置为540，就是9分钟.
ClientAliveInterval 540

对于
ClientAliveCountMax
指如果发现客户端没有相应，则判断一次超时，这个参数设置允许超时的次数。比如10
ClientAliveInterval 540
ClientAliveCountMax 10;

则代表允许超时 5400秒 = 90分钟

```
service sshd restart
```

## ssh-agent

在 Mac OS X 上，当系统重新启动后，ssh-agent 再次启动时会 “忘记” 这个密钥。不过您可以通过以下命令将您的 SSH 密钥导入到密钥链中：

```sh
eval `ssh-agent -s`
ssh-add -K 您的密钥
```

## References

* [SSH keys (简体中文)](https://wiki.archlinux.org/index.php/SSH_keys_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
