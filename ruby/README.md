# Ruby

- [官网](https://www.ruby-lang.org)
- [Ruby China](https://ruby-china.org/)
- [Ruby 教程](http://www.runoob.com/ruby/ruby-tutorial.html)

## 安装

### brew

```sh
brew install ruby@2.6
brew link --overwrite ruby
```

### rvm

[Github](https://github.com/rvm/rvm)

安装 rvm

```shell
$ curl -sSL https://get.rvm.io | bash -s stable
```

更新 rvm

```shell
$ rvm get stable
```

把其它方式安装的 ruby 添加到 rvm

```shell
$ rvm automount
```

查看已安装的 ruby

```shell
$ rvm list
```

查看稳定版本

<http://www.ruby-lang.org/zh_cn/downloads/>

安装 ruby

```shell
$ rvm install 2.6
```

选择版本

```shell
$ rvm use 2.6
```

### arm64

参考 [nickymarino.com](https://nickymarino.com/2021/12/17/install-ruby-273-on-m1/)

```shell
brew install openssl@1.1

export PATH="$(brew --prefix)/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib"
export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="$(brew --prefix)/opt/openssl@1.1/lib/pkgconfig"

rvm autolibs disable

export RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC
export optflags="-Wno-error=implicit-function-declaration"

rvm install 2.7.6 --with-openssl-dir=$(brew --prefix)/opt/openssl@1.1
```
