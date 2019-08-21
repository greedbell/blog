# Let's Encrypt

官方推荐 Let's Encrypt 用 certbot 实现

* [Let's Encrypt 官网](https://letsencrypt.org/)
* [certbot 官网](https://certbot.eff.org/)
* [certbot GitHub](https://github.com/certbot/certbot)
* [certbot 文档](https://certbot.eff.org/docs/using.html)

## ubuntu nginx 配置 Let's Encrypt

[certbot 官网](https://certbot.eff.org/) 选择 `nginx` `ubuntu`版本,打开 [Nginx on Ubuntu (other)](https://certbot.eff.org/lets-encrypt/ubuntuother-nginx)

### 安装依赖

```sh
$ wget https://dl.eff.org/certbot-auto
$ chmod a+x certbot-auto
$ ./certbot-auto
```

### 模式选择

* standalone 模式

> 这个模式虽然可以配置好服务器，但是以后Renew的时候，需要让服务停止一下，再启动

* webroot 模式

> 这个模式需要指定服务根目录 `--webroot-path` 并在该目录下生成 `.well-known` 文件夹

* nginx 模式

> 这个模式配置最简单，直接 `./certbot-auto --nginx` 全部搞定，不过这是 `alpha` 版，使用前最好先备份 `nginx` 配置

### nginx 模式

```sh
./certbot-auto --nginx
```

* 配置路径 `/var/lib/letsencrypt` 和 `/etc/letsencrypt/`

### webroot 模式

#### 创建证书

```sh
$ ./certbot-auto certonly
```

#### nginx启用443端口

新建一个443端口的server配置：

```conf
server {
        listen 443 ssl;
        listen [::]:443 ssl ipv6only=on;

        ssl_certificate /etc/letsencrypt/live/your.domain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/your.domain.com/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/your.domain.com/chain.pem;

        // ... other settings ...
}
```

```
nginx -s reload
```

现在就可以用 https 方式访问了

### 自动更新证书

let's encrypt 证书有效期为 90 天，所以要定期更新，`crontab -e` 中添加

```shell
./certbot-auto renew
```

## Reference

* [Mozilla, Google, Apple 都已决定不再信任 WoSign 和 StartCom](https://ruby-china.org/topics/31494)
* [Let's Encrypt 给网站加 HTTPS 完全指南](https://ksmx.me/letsencrypt-ssl-https/)
