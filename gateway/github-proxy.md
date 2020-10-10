# Github 代理

## Http 代理

### HTTP

```bash
git config --global http.proxy "http://127.0.0.1:8080"
git config --global https.proxy "http://127.0.0.1:8080"
```

### socks5

```bash
git config --global http.proxy "socks5://127.0.0.1:1080"
git config --global https.proxy "socks5://127.0.0.1:1080"
```

### 取消代理

```bash
git config --global --unset http.proxy
git config --global --unset https.proxy
```

## SSH 代理

需要先安装 socat 或 nc

 ```bash
 brew install socat
 ```

 或

```bash
brew install nc
```

### 配置

`vi ~/.ssh/config`

输入下面内容：

```TXT
# 必须是 github.com
Host github.com
   HostName github.com
   User git
   # 走 HTTP 代理
   # ProxyCommand socat - PROXY:127.0.0.1:%h:%p,proxyport=8080
   # 走 socks5 代理（如 Shadowsocks）
   # ProxyCommand nc -v -x 127.0.0.1:1080 %h %p
```

## References

[macOS 给 Git(Github) 设置代理（HTTP/SSH）](https://gist.github.com/chuyik/02d0d37a49edc162546441092efae6a1)
