# gem

## 安装

<https://github.com/FIRHQ/fir-cli/blob/master/doc/install.md>

## 源

* 官方 <https://rubygems.org/>
* 淘宝 <https://ruby.taobao.org/>
* Ruby China <https://gems.ruby-china.org/>

最近淘宝源一直没更新。。。建议切换到`Ruby China`

```shell
$ gem sources -a https://gems.ruby-china.org/ -r https://ruby.taobao.org/
$ gem sources -u
```

换回官方源

```shell
$ gem sources -a https://rubygems.org/ -r https://ruby.taobao.org/
$ gem sources -u
```


## gem install

安装指定版本

```
gem install -v <version> <package>
```
