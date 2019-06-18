# Office Open XML

Office Open XML(OOXML) Office 文件格式

OOXML文件的文档属性其实存在于docProps目录下，比较重要的有三个文件

* app.xml：记录文档的属性，内容类似之前的DocumentSummaryInformation。
* core.xml：记录文档核心的属性，比如创建时间、最后修改时间等等，内容类似之前的SummaryInformation。
* `thumbnail.*`：文档的缩略图，不同文件存储的是不同的格式，比如Word为emf，Excel为wmf，PowerPoint为jpeg。

## 工具

* [OOXMl Tools](https://chrome.google.com/webstore/detail/ooxml-tools/bjmmjfdegplhkefakjkccocjanekbapn)
* [TODO] VS Code 插件

## poi-ooxml

java 版本处理 OOXML

### 文件格式

* POIFS 基本的文件格式
* HPSF (Horrible Property Set Format) 文档
* XWPT 文档
* HSSF (Horrible SpreadSheet Format) 2007 版本表格
* XSSF (Excel file) 2013 版本表格
* SXSSF XSSF 流模式，解决大表格问题
* SS (Spread Sheet) HSSF XSSF 兼容
* XSLF (Slide File) 幻灯片
* sl (slide) 幻灯片
* XDGF (Visio File) Visio

### References

* [POI各Jar包的作用](https://blog.csdn.net/szwangdf/article/details/39053859)
* [Apache POI](https://poi.apache.org/)

## References

* [OOXML 规范](http://officeopenxml.com/)
* [欢迎使用 Open XML SDK 2.5 for Office](https://docs.microsoft.com/zh-cn/office/open-xml/open-xml-sdk)
* [SpreadsheetML 文档的结构 (Open XML SDK)](https://docs.microsoft.com/zh-cn/office/open-xml/structure-of-a-spreadsheetml-document)
* [Microsoft Open Specifications](https://docs.microsoft.com/en-us/openspecs/main/ms-openspeclp/3589baea-5b22-48f2-9d43-f5bea4960ddb)
