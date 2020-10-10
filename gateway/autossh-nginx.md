# 使用 autossh 建立反向 SSH 隧道管理内网 Mac 主机

* 内网主机 Web 服务端口 8080
* 分配的域名 xxxxx.greedlab.com
* 外网主机 7770 端口对应内网主机 8080 端口

## 建立从内网主机到公网主机的 ssh 互信


## 内网主机安装 autossh

```ssh
brew install autossh
```

## 内网主机将本机的 8080 端口映射到外网主机 7070 端口

```sh
autossh -M 8001 -fCNR 7770:localhost:8080 bell@node.greedlab.com
```

* -M 8001 : 负责通过 8001 端口监视连接状态，连接有问题时就会自动重连
* -C ：启动数据压缩传输
* -q ：安静模式运行，忽略提示和错误
* -T ：不占用shell
* -f ：后台运行
* -n ：配合 -f 参数使用
* -N ：不执行远程命令，专为端口转发度身打造
* -R ：将远程主机(服务器)的某个端口转发到本地端指定机器的指定端口
* -L ：将本地机(客户机)的某个端口转发到远端指定机器的指定端口
* 7770:localhost:8080 ：公网主机 7770 端口数据转发到内网主机 8080 端口

## 测试 autossh

内网主机

```ssh
lsof -i tcp:8001
```

## 外网主机的 nginx 配置反向代理

```
server {
    listen 80;
    server_name  xxxxx.greedlab.com;

    location / {
     proxy_pass http://localhost:7770;
     proxy_set_header   Host    $host;
     proxy_set_header   X-Real-IP   $remote_addr;
     proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

现在 xxxxx.greedlab.com 就可以访问内网主机 8080 端口的服务了。

## 配置 ssh 断开重连

配置外网主机的 `/etc/ssh/sshd_config`

```text
# 30表示30s给客户端发送一次心跳
ClientAliveInterval 30
# 3此客户端没有返回心跳，则会断开连接
ClientAliveCountMax 3
```
