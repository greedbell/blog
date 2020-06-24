# Centos 上安装和使用 nginx

## 安装

* 参考 <http://nginx.org/en/linux_packages.html>

### 添加 key

* 下载 [key](http://nginx.org/keys/nginx_signing.key)
* `sudo rpm --import nginx_signing.key`


### 更新源

To set up the yum repository for RHEL/CentOS, create the file named `/etc/yum.repos.d/nginx.repo` with the following contents:

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
gpgcheck=0
enabled=1
```

Replace “OS” with “rhel” or “centos”, depending on the distribution used, and “OSRELEASE” with “5”, “6”, or “7”, for 5.x, 6.x, or 7.x versions, respectively.

### 安装 nginx

```
# yum install nginx
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

### 开机自启动 nginx

```
chkconfig nginx on
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
  server_name  *.efg.com;
  location / {
    proxy_pass http://127.0.0.1:8080;
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

## Questions

## Q 1

> (13: Permission denied) while connecting to upstream

```
setsebool httpd_can_network_connect on
```

* <http://stackoverflow.com/a/31403848/5541472>
