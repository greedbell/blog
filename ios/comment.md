# iOS 注释

## 生成文档工具比较

### HeaderDoc

只支持 HTML 输出，Xcode 自带的文档生成工具

### Doxygen

支持 HTML，PDF, LaTeX 还有很多其它格式，功能强大，适于生成html文档与pdf文档。

### appledoc

基于 Doxygen，简单方便，适于生成apple风格的html文档，及直接集成到xcode帮助（docset）

## appledoc

* [GitHub](https://github.com/tomaz/appledoc)
* [文档](https://github.com/tomaz/appledoc/wiki/index)

### 安装

方法一：

```sh
$ brew install appledoc
```

方法二：

```sh
git clone git://github.com/tomaz/appledoc.git
cd appledoc
sudo sh install-appledoc.sh -b /usr/local/bin/ -t ~/Library/Application\ Support/appledoc
```

### 使用

```sh
appledoc --output output/path/ --project-name "project name" --project-company "greedlab" --company-id "com.greedlab" --clean-output source/path/
```

然后打开 `output/path/` 下的文件有提示 `.docset` 文件路径，用 Dash 打开 `.docset` 文件。

## Xcode

Xcode 支持的注释

### swift 和 play ground

Xcode 支持的 swift 和 play ground 注释

* [Markup Formatting Reference](xcdoc://?url=developer.apple.com/library/etc/redirect/xcode/content/1189/documentation/Xcode/Reference/xcode_markup_formatting_ref/index.html)

### objective C

Xcode 支持的 object C 注释

#### 支持的注释

```
///
```

```
/**

*/
```

```
/*!

*/
```

#### 支持的 Tag

##### 没标题的

```objc
/**
 DES
 @brief brief
 @discussion discussion
 @param param
 @code
 I am code
 @endcode
 @return Bool whether
 */
```

* `@brief` 简介。 代码自动补全是提示


##### 有标题的

```objc
/**
 DES
 @author author
 @copyright copyright
 @version version
 @remark remark
 @date date
 */
```
