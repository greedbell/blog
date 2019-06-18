# ubuntu 上安装和使用 nginx

## 安装

* 参考 <http://nginx.org/en/linux_packages.html>

### 添加 key

* 下载 [key](http://nginx.org/keys/nginx_signing.key)
* `sudo apt-key add nginx_signing.key`

### 更新源

把

```
deb http://nginx.org/packages/ubuntu/ codename nginx
deb-src http://nginx.org/packages/ubuntu/ codename nginx
```

codename 替换为 [codename](http://nginx.org/en/linux_packages.html#distributions) 中对应的 codename

Ubuntu 14.04 替换后为

```
deb http://nginx.org/packages/ubuntu/ trusty nginx
deb-src http://nginx.org/packages/ubuntu/ trusty nginx
```

再追加到 `/etc/apt/sources.list`

运行

```
apt-get update
```

### 安装 nginx

```
# apt-get install nginx
```

## 使用

* <http://nginx.org/en/docs/beginners_guide.html>
* <https://www.nginx.com/resources/admin-guide/>

### 查看帮助

```
nginx -h
```

### 启动 nginx

```
/etc/init.d/nginx start
```

#### nginx -s signal

* stop — fast shutdown
* quit — graceful shutdown
* reload — reloading the configuration file
* reopen — reopening the log files

### 配置

默认配置 `/etc/nginx/conf.d/default.conf`
手动配置 `/etc/nginx/nginx.conf`

#### 添加反向代理

`/etc/nginx/conf.d` 下添加新的 .conf 文件，添加如下内容

```
server {
  listen       81;
  server_name  yourdomain.com;
  location / {
    proxy_pass http://localhost:8080;
    proxy_set_header   Host    $host;
    proxy_set_header   X-Real-IP   $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

测试配置是否正确

```
nginx -t
```

重新加载配置

```
nginx -s reload
```
