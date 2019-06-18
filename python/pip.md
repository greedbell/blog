# pip

python 依赖工具

* [文档](https://pip.pypa.io/en/stable/)

## 安装

参考 [Installation](https://pip.pypa.io/en/stable/installing/)

```sh
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
```

### Questions

#### Q1

```
InvalidSchema: Missing dependencies for SOCKS support.
```

A1:

不能用 SOCKS 代理 ，关掉代理

#### Q2

```
OSError: [Errno 13] Permission denied: '/Library/Python/2.7/site-packages/pip'
```

A2:

无权限创建 `无权限创建` 文件夹，运行 `sudo chmod a+w /Library/Python/2.7/site-packages`
