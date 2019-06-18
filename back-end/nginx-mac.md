# mac 安装 nginx

先禁用 apache

```sh
sudo apachectl stop
```


```
$ brew install nginx

Docroot is: /usr/local/var/www

The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
nginx can run without sudo.

nginx will load all files in /usr/local/etc/nginx/servers/.

To have launchd start nginx now and restart at login:
  brew services start nginx
Or, if you don't want/need a background service you can just run:
  nginx
```

/usr/local/etc/nginx/nginx.conf 8080 改 80

运行 nginx

```sh
$ sudo nginx  #打开 nginx
$ sudo nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
$ sudo nginx -t   #测试配置是否有语法错误

# 因为用到了 80 端口，所以必须用 sudo
sudo brew services restart nginx
sudo brew services stop nginx
```

加入 launchctl 启动控制


```sh
mkdir -p ~/Library/LaunchAgents

cp /usr/local/opt/nginx/homebrew.mxcl.nginx.plist ~/Library/LaunchAgents/

launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
```

## nginx 配置 fastcgi

```
location ~ \.php$ {
    root           html;
    fastcgi_pass   127.0.0.1:9000;
    fastcgi_index  index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include        fastcgi_params;
}
```

```sh
sudo nginx -V
```

查看 nginx 配置
