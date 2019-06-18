# 升级 react native 到 0.47 遇到的问题

```sh
react-native upgrade
```

## `Command /bin/sh failed with exit code 1`

退出重新打开 Xcode

## `'boost/iterator/iterator_adaptor.hpp' file not found`

参考 <https://github.com/facebook/react-native/issues/14423>

1.

从 <https://sourceforge.net/projects/boost/files/boost/1.63.0/> 下载 `boost_1_63_0.tar.gz` 到 `~/.rncache/boost_1_63_0.tar.gz`，如果存在就替换它

2.

```
rm -rf node_modules
```

3.

`command + shift + K`

4.

`command + B`
