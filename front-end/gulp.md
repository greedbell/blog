# Gulp

> 任务自动管理工具

合并文件、压缩代码、检查语法错误、将Sass代码转成CSS代码等等

* [Gulp 中文网](http://www.gulpjs.com.cn/)
* [Gulp 文档](http://www.gulpjs.com.cn/docs/)
* [Gulp 文档 GitHub](https://github.com/lisposter/gulp-docs-zh-cn)
* [GitHub](https://github.com/gulpjs/gulp)
* [前端构建工具gulpjs的使用介绍及技巧](http://www.cnblogs.com/2050/p/4198792.html)

## 原理

Gulp 通过 `流模块` 的方式 pipe() 到其它插件或者写到文件中，不需要频繁的生成临时文件

### Stream VS Buffer

Stream: 在一个应用程序中，流是一组有序的、有起点和终点的字节数据的传输手段。
Buffer: 用于创建一个专门存放二进制数据的缓存区

在后端中应用，因为在后端与前端、后端的IO中，很大机会会出现文件太大，不能一次性读取的问题。因此在前端中使用的方法：整体读取后再进行操作，会导致程序的等待时间过长，因此，流操作（stream）便营运而生。

在数据传输过程中，如果需要把其中一段Stream截取并且进行修改查看，则需要Buffer类来进行协助，并且转化成其他的人类可理解对象

* [gulp-buffer](https://github.com/jeromew/gulp-buffer)

file.contents 以 buffer 方式存储，有些情况不适合用流的方式处理，譬如文件倒序时必须读取整个文件内容才能实现。

* [gulp-stream](https://github.com/jeromew/gulp-stream)

file.contents 以 stream 方式存储

### gulp.src()

gulp.src()方法正是用来获取流的，但要注意这个流里的内容不是原始的文件流，而是一个虚拟文件对象流(Vinyl files)，这个虚拟文件对象中存储着原始文件的路径、文件名、内容等信息，可以用这个方法来读取你需要操作的文件就行了。

* [gulp.src(globs[, options])](https://github.com/lisposter/gulp-docs-zh-cn/blob/master/API.md#gulpsrcglobs-options)

options.buffer 默认值是 true，所以默认以 buffer 方式返回 file.contents

## 安装

```shell
$ npm install --global gulp
```

## 插件

* <http://gulpjs.com/plugins/>
* [gulp plugins 插件介绍](http://colobu.com/2014/11/17/gulp-plugins-introduction/)
* [write gulp plugin guide lines](https://github.com/gulpjs/gulp/blob/master/docs/writing-a-plugin/guidelines.md)
* [编写插件](http://www.gulpjs.com.cn/docs/writing-a-plugin/)
* [stream-handbook 翻译](https://github.com/jabez128/stream-handbook)

## 只处理修改过的文件

有多种方法实现,这里推荐用 `方法一`

### 方法一

gulp.watch + [gulp-changed](https://github.com/sindresorhus/gulp-changed) + [gulp-changed-in-place](https://github.com/alexgorbatchev/gulp-changed-in-place#gulp-changed-in-place)

gulp-changed: 用于处理后的结果输出到不同文件的情况。
gulp-changed-in-place: 用于处理后的结果输出到当前文件的情况

参考 <http://www.gulpjs.com.cn/docs/recipes/only-pass-through-changed-files/>

### 方法二

gulp.watch + [gulp-cached](https://github.com/wearefractal/gulp-cached) + [gulp-remember](https://github.com/ahaurw01/gulp-remember)

参考 <http://www.gulpjs.com.cn/docs/recipes/incremental-builds-with-concatenate/>

### 方法三

[gulp-watch](https://github.com/floatdrop/gulp-watch)

## 文件加后缀

[gulp-rev](https://github.com/sindresorhus/gulp-rev) 文件加后缀并生成 manifest 文件 + [gulp-rev-collector](https://github.com/shonny-ua/gulp-rev-collector) 根据 gulp-rev 生成的 manifest 文件修改所有依赖的文件

## css 自动加前缀

[gulp-autoprefixer](https://github.com/sindresorhus/gulp-autoprefixer)

## Questions

### gulp.watch 监控不到文件的增加

监听路径不要以 './' 开头
