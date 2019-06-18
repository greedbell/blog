# phpdoc

* [官网](https://phpdoc.org)
* [文档](https://phpdoc.org/docs/latest/index.html)

## 安装

* [Installing](https://phpdoc.org/docs/latest/getting-started/installing.html)

安装的依赖

* >= PHP 5.3.3
* PHP intl 扩展
* graphviz
* 有些模板需要 PHP xsl 扩展

```sh
pear channel-discover pear.phpdoc.org
pear install phpdoc/phpDocumentor
```

## 生成文档

```sh
$ phpdoc run -d [directory to parse] -t [output directory]
$ phpdoc -d ./src -t ./docs/api
```
