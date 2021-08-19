# shadowsocks

- [GitHub](https://github.com/shadowsocks/shadowsocks/wiki)
- [ShadowsocksX-NG](https://github.com/shadowsocks/ShadowsocksX-NG) shadow socks Mac 客户端
- [撰写 Adblock Plus 过滤规则](https://adblockplus.org/zh_CN/filters)

## PHP 安装服务端

### 安装 pip

<http://www.centoscn.com/image-text/install/2015/0129/4585.html>

https://pip.pypa.io/en/stable/installing/

### 安装

Debian / Ubuntu:

```
apt-get install python3-pip
pip install shadowsocks
```

### 后台运行

sudo ssserver -p 443 -k password -m rc4-md5 --user nobody -d start

### 停止

sudo ssserver -d stop

### 开机自启动

创建脚本 `/etc/init.d/ssserver-start.sh`，内容如下：

```sh
#!/bin/bash
#author: bell
sudo ssserver -p 443 -k password -m rc4-md5 --user nobody -d start
```

## libev 方式安装服务端

Debian & Ubuntu

安装

```
sudo apt update
sudo apt install shadowsocks-libev
```

配置

```
# Edit the configuration file
# "server": 127.0.0.1 改为 0.0.0.0 允许非本机访问
sudo vim /etc/shadowsocks-libev/config.json


# Edit the default configuration for debian
sudo vim /etc/default/shadowsocks-libev

```

启动

```
# Start the service
sudo /etc/init.d/shadowsocks-libev start    # for sysvinit, or
sudo systemctl start shadowsocks-libev      # for systemd
```

## mac 终端使用

- [OS X 终端使用配置 socks5 代理](http://www.jianshu.com/p/16d7275ec736)
- [用 shadowsocks 加速 git clone](http://www.jianshu.com/p/024e535cbb53)

在 `~/.bash_profile` 中添加

```sh
# 设置代理
function setproxy() {
    # export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:3128" 也可以设置http代理
    export ALL_PROXY=socks5://127.0.0.1:1086
}

# 取消代理
function unsetproxy() {
    # unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
}

# 测试代理
function testproxy() {
    curl -s ip.cn
}
```

## 客户端下载

- <https://shadowsocks.org/en/download/clients.html>
