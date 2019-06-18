# Mac 安装 redis

## 安装

```sh
$ brew install redis
```

日志：

==> Downloading https://homebrew.bintray.com/bottles/redis-3.2.8.sierra.bottle.tar.gz

curl: (6) Could not resolve host: akamai.bintray.com
Error: Failed to download resource "redis"
Download failed: https://homebrew.bintray.com/bottles/redis-3.2.8.sierra.bottle.tar.gz
Warning: Bottle installation failed: building from source.
==> Using the sandbox
==> Downloading http://download.redis.io/releases/redis-3.2.8.tar.gz
######################################################################## 100.0%
==> make install PREFIX=/usr/local/Cellar/redis/3.2.8 CC=clang
Error: The `brew link` step did not complete successfully
The formula built, but is not symlinked into /usr/local
Could not symlink bin/redis-benchmark
Target /usr/local/bin/redis-benchmark
already exists. You may want to remove it:
  rm '/usr/local/bin/redis-benchmark'

To force the link and overwrite all conflicting files:
  brew link --overwrite redis

To list all files that would be deleted:
  brew link --overwrite --dry-run redis

Possible conflicting files are:
/usr/local/bin/redis-benchmark
/usr/local/bin/redis-check-aof
/usr/local/bin/redis-check-rdb
/usr/local/bin/redis-cli
/usr/local/bin/redis-sentinel -> /usr/local/bin/redis-server
/usr/local/bin/redis-server
==> Caveats
To have launchd start redis now and restart at login:
  brew services start redis
Or, if you don not want/need a background service you can just run:
  redis-server /usr/local/etc/redis.conf
==> Summary
🍺  /usr/local/Cellar/redis/3.2.8: 11 files, 1.7M, built in 29 seconds


## 强制 link redis

```sh
brew link --overwrite redis
```

## 启动 redis

```sh
brew services start redis
brew services restart redis
brew services stop redis
```

## 自启动

```sh
cp $(brew --prefix redis)/homebrew.mxcl.redis.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

## 配置

配置文件路径  `/usr/local/etc/redis.conf`

设置密码

```
#requirepass foobared  
```
