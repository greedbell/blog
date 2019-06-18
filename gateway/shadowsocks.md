# shadowsocks

* [GitHub](https://github.com/shadowsocks/shadowsocks/wiki)
* [ShadowsocksX-NG](https://github.com/shadowsocks/ShadowsocksX-NG) shadow socks Mac 客户端
* [撰写 Adblock Plus 过滤规则](https://adblockplus.org/zh_CN/filters)

## 安装pip
<http://www.centoscn.com/image-text/install/2015/0129/4585.html>

https://pip.pypa.io/en/stable/installing/

## 安装

pip install shadowsocks

## 后台运行

sudo ssserver -p 443 -k password -m rc4-md5 --user nobody -d start

## 停止

sudo ssserver -d stop

## 开机自启动

创建脚本 `/etc/init.d/ssserver-start.sh`，内容如下：

```sh
#!/bin/bash
#author: bell
sudo ssserver -p 443 -k password -m rc4-md5 --user nobody -d start
```

## mac 终端使用

* [OS X终端使用配置socks5 代理](http://www.jianshu.com/p/16d7275ec736)
* [用shadowsocks加速git clone](http://www.jianshu.com/p/024e535cbb53)

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
