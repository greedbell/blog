# XLS 文件

* [Extracting Metadata from an XLS(X) File](https://help.gooddata.com/cloudconnect/manual/metadata-from-xlsx-file.html)
* [[MS-CFB]: Compound File Binary File Format](https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-cfb/53989ce4-7b05-4f8d-829b-d08d6148375b)
* [[MS-XLS]: Excel Binary File Format (.xls) Structure](https://docs.microsoft.com/en-us/openspecs/office_file_formats/ms-xls/cd03cb5f-ca02-4934-a391-bb674cb8aa06)

## XLS 转 XLSX

### jodconverter

依赖 LibreOffice 或者 OpenOffice

### ASPOSE

收费

## Other

常见的表格格式（XLS, XLSX/M, XLSB, ODS）都是ZIP或CFB的压缩文件。 这两种格式都不会将目录结构声明放在文件的开头，ZIP文件将中央目录记录放置在逻辑文件的末尾，而CFB文件可以将FAT结构放置在文件的任何位置！ 因此，如果要正确处理这些格式，流式传输功能必须在开始之前缓冲整个文件。 因为要缓冲整个文件，这样就违背了流式读取的初衷，所以模块不提供流式读取文件的功能。

OpenOffice 和 JodConvert 将既有的各种 Office 文件转换为 Pdf 文件

## References

* [How to convert .xls to .xlsx](http://apache-poi.1045710.n5.nabble.com/How-to-convert-xls-to-xlsx-td2310988.html)
* [jodconverter](https://github.com/sbraconnier/jodconverter)
* [ASPOSE](https://www.aspose.com/)
* [文档转换示例工程(Document -> PDF)](https://github.com/sjyuan-cc/document-to-pdf-demo/blob/master/README.MD)
