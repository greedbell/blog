# 外网访问内网

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [外网访问内网](#外网访问内网)
	* [DDNS](#ddns)
	* [localtunnel](#localtunnel)
		* [安装](#安装)
		* [使用](#使用)
		* [后台使用](#后台使用)
	* [ngrok](#ngrok)
	* [autossh + Nginx](#autossh-nginx)

<!-- /code_chunk_output -->

## DDNS

路由器动态上传 IP 到服务器，域名指向该 IP

电信禁止外网访问动态 IP，所以该方法无法实现

## localtunnel

* [GitHub](https://github.com/localtunnel/localtunnel)

可行，访问比较慢

### 安装

```sh
npm install -g localtunnel
```

### 使用

```sh
lt --port 8080
```

### 后台使用

```sh
nohup lt -p 8080 >> ${HOME}/.lt.log g 2>&1 &
```

## ngrok

* <https://ngrok.com/>

## autossh + Nginx
