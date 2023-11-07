# POI

解析 Office java 库

- https://poi.apache.org/

## 文件类型

参考 [Apache POI - Text Extraction](https://poi.apache.org/text-extraction.html)

- HWPF: doc WordPress
  - doc: `Word 97 - Word 2003`: `org.apache.poi.hwpf.extractor.WordExtractor`
  - doc: `Word 6 and Word 95`: `org.apache.poi.hwpf.extractor.Word6Extractor`
- XWPF: docx
  - docx: `org.apache.poi.xwpf.extractor.XPFFWordExtractor`
- HSSF: xls `org.apache.poi.hssf.extractor.ExcelExtractor,`
- XSSF: xlsx `org.apache.poi.xssf.extractor.XSSFExcelExtractor`
- SXSSF: 大表格解决方案
- SL: ppt `org.apache.poi.sl.extractor.SlideShowExtractor.SlideShowExtractor`
- HPSF: pptx
