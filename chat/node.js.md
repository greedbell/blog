# node.js

<https://nodejs.org/en/download/>

需要python2.6 or 2.7


## 编译好的文件安装

```shell
wget https://nodejs.org/dist/v4.2.2/node-v4.2.2-linux-x64.tar.gz --no-check-certificate
tar zxvf node-v4.2.2-linux-x64.tar.gz
mv node-v4.2.2-linux-x64 node
./node/bin/npm --version
```

## 源码安装

```shell
wget https://nodejs.org/dist/v4.2.2/node-v4.2.2.tar.gz --no-check-certificate

tar zxvf node-v4.2.2.tar.gz
mv node-v4.2.2-linux-x64 node
./node/bin/npm --version
```

## Q

```
Error: Python executable "python2" is v2.4.3, which is not supported by gyp.
```

# 版本选择

`bluehost`的`python`版本是`Python 2.4.3`,` node-v4.2.2`需要`Python 2.6 or 2.7`
