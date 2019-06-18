# webpack

react 的项目用 webpack 还不错，目前非react 项目 还是以gulp＋webpack 来搞，webpack仅被用来是代替 browerify 来做JS的模块化

* [GitHub](https://github.com/webpack/webpack)
* [官方文档](https://webpack.js.org/)
* [中文文档](https://wohugb.gitbooks.io/webpack/)

## 安装

```sh
npm install --save-dev webpack@beta
```

## 插件

* [webpack 常用插件](http://www.jianshu.com/p/1eefaeaf6874)

### UglifyJsPlugin

解析/压缩/美化所有的js chunk

```js
new webpack.optimize.UglifyJsPlugin([options])
```

### ExtractTextPlugin

该插件会提取entry chunk中所有的 `require('*.css')`，分离出独立的css文件。

```js
var ExtractTextPlugin = require("extract-text-webpack-plugin");
new ExtractTextPlugin([id: string], filename: string, [options])
```

### DedupePlugin

找出并删除重复的依赖

```js
new webpack.optimize.DedupePlugin()
```

### NoErrorsPlugin

跳过编译时出错的代码并记录，使编译后运行时的包不会发生错误。

```js
new webpack.NoErrorsPlugin()
```

### ProvidePlugin

定义标识符，当遇到指定标识符的时候，自动加载模块。

```js
new webpack.ProvidePlugin(definitions)
```

### CommonsChunkPlugin

提取代码中的公共模块，然后将公共模块打包到一个独立的文件中，以便在其他的入口和模块中使用。

```js
new webpack.optimize.CommonsChunkPlugin(options)
```

### DefinePlugin

变量替换

```js
new webpack.DefinePlugin({
  'process.env.NODE_ENV': JSON.stringify('production'),
  __SERVER__: false
})
```
## 使用

### CSS

* [Code Splitting - CSS](https://webpack.js.org/guides/code-splitting-css/)

css-loader + extract-text-webpack-plugin 把CSS单独输出到文件

* [css-loader](https://github.com/webpack/css-loader) 遍历 CSS 文件，然后找到 url() 表达式然后处理他们,css-loader?modules这个参数来开启CSS Modules
* [style-loader](https://github.com/webpack/style-loader)
把原来的 CSS 代码插入页面中的一个 style 标签中
* [extract-text-webpack-plugin](https://github.com/webpack/extract-text-webpack-plugin) 把CSS输出为单独的文件，而不是直接嵌入HTML里面

```sh
npm install --save-dev css-loader
npm install --save-dev style-loader
npm install --save-dev extract-text-webpack-plugin@beta
```

### 依赖的模块

* [Code Splitting - Libraries](https://webpack.js.org/guides/code-splitting-libraries/)

```js
var webpack = require('webpack');
module.exports = function(env) {
    return {
        entry: {
            main: './index.js',
            vendor: 'moment'
        },
        output: {
            filename: '[chunkhash].[name].js',
            path: './dist'
        },
        plugins: [
            new webpack.optimize.CommonsChunkPlugin({
                names: ['vendor', 'manifest'] // Specify the common bundle's name.
            })
        ]
    }
};
```

利用 `CommonsChunkPlugin` 插件把 `moment` 模块输出为 `vendor.js`，还有 `manifest.js`

### webpack-merge

合并配置

* [GitHub](https://github.com/survivejs/webpack-merge)

### 配置

参考 [Configuration](https://webpack.js.org/configuration/)

#### entry

入口

#### output

输出

* filename: 输出的文件名。开发环境 用 `[name].js`;生产环境用 `[name].[chunkhash].js`
* publicPath: html 中 url路径

#### devtool

#### module

[模块](https://webpack.js.org/configuration/module/)

##### loaders

加载器

##### rules

[规则](https://webpack.js.org/configuration/module/#rule)

* `test` 必须遵守的规则, 正则表达式
* `include` 必须遵守的规则, string or array
* `exclude` 例外的, string or array
* `query` == `options` == `use` url带的 query 参数

* `query.limit` 限制文件大小，单件 byte

#### resolve

更改模块的解析方式,配置应用层的模块（要被打包的模块）解析

* resolve.alias 添加别名(添加相对路径的根目录)
* resolve.extensions require 或 import 的时候扫描的文件后缀，默认 `extensions: [".js", ".json"]`
* resolve.modules 第三方依赖库存储的目录，默认 `modules: ["node_modules"]`

#### resolveLoader

更改模块的解析方式,配置 loader 模块的解析,

默认:

```js
{
    modulesDirectories: ["web_loaders", "web_modules", "node_loaders", "node_modules"],
    extensions: ["", ".webpack-loader.js", ".web-loader.js", ".loader.js", ".js"],
    packageMains: ["webpackLoader", "webLoader", "loader", "main"]
}
```

#### plugins

插件

## References

* [webpack之热更新](https://gmiam.com/post/webpack-hot-replacement.html)
