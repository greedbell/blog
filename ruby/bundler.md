# bundle 管理 gem 包

管理 gem 包依赖

* [bundler官网](http://bundler.io/)
* [官方文档](http://ruby-doc.org/docs/ruby-doc-bundle/)

## 安装 bundler

```shell
$ gem install bundler
```

## 初始化`Gemfile`

```ruby
$  bundle init
```

利用 `.gemspec`生成`Gemfile`

## 安装依赖包

```ruby
$ bundle install
```

根据`Gemfile`安装依赖包

## 创建 rubygem

```ruby
$ bundle gem my_gem
```

查看帮助：

```ruby
$ bundle help gem
```

## 编译 gem

```ruby
$ gem build my_gem.gemspec
```

## 发布到 rubygems

<http://guides.rubygems.org/publishing/>

```ruby
$ gem push my_gem-0.1.0.gem
```

* [详细使用](http://bundler.io/rubygems.html)

### Reference

* <http://blog.csdn.net/kucss/article/details/7163563>
