# MS-DOC

Word (.doc) Binary File Format 是一种 MS-CFB 文件。

还依赖以下文件结构：

- [MS-ODRAW] for the persistence format for shapes.
- [MS-OVBA] for the persistence format for macros.
- [MS-OFFCRYPTO] for the persistence format for document signing, information rights management, document encryption, and obfuscation.
- [MS-OSHARED] for the persistence format for additional common structures.

## Structures

### File Structure（文件结构）

- WordDocument Stream：除表格外的所有数据
- 1Table Stream or 0Table Stream：表格数据
- Data Stream：FIB 或文件的其它部分指向的数据
- ObjectPool Storage：用于内嵌的 OLE 对象

### Fundamental Concepts（基本概念）

- Character：字符，可以是文本字符或非文本字符
- CP（Character Position）：字符位置，表示一个无符号 32 位整数，用作文档文本中字符的从零开始的索引。无法直接检索文件中每个字符的位置和大小，需要使用预先指定的算法计算。人物包括：
  - 文件的文本
  - 对象的锚点，例如脚注或文本框
  - 控制字符，例如段落标记和表格单元格标记
- PLC：PLC 结构是一个 CP 数组，后跟一个数据元素数组。任何 PLC 的数据元素必须是相同大小的零个或多个字节，因此，CP 的数量必须比数据元素的数量多 1。 PLC 结构具有不同的类型，其中每种类型都指定该类型是否允许重复的 CP。 PLC 结构包括：
  - aCP（可变长度）： CP 元素的数组。每种类型的 PLC 结构都指定了 CP 元素的含义和允许的范围。
  - aData（可变长度）： 每种类型的 PLC 结构都指定了数据元素的结构和含义，对数据元素数量的任何限制，以及对其中包含的数据的任何限制。它还规定了数据元素和相应的 CP 之间的关系。
- Valid Selection：有效选择， .DOC 文件结构主要由一系列 CP 描述。
- STTB（string table）：STTB 是一个字符串表，它由一个标头组成，后跟一个元素数组。 cData 值指定数组中包含的元素数量。
- FIB（File Information Block）：文件信息块：FIB 结构包含有关文档的信息，并指定指向构成文档的各个部分的文件指针。 Fib 是可变长度结构。除了大小固定的基本部分之外，每个部分前面都有一个计数字段，用于指定下一个部分的大小。
- Property Storage：属性存储，一个 word 文件可能有不同的元素，如文本、段落、表格、图片和部分，每个元素都可以有自己的属性。这些属性作为与默认值的差异存储在 Word 文件中。此类差异由 PR1 指定，该 PR1 由单个属性修饰符 (Sprm) 及其操作数组成。应用程序可以通过应用 Prls 列表来确定最终的属性集。
  - Sprm（Single Property Modifiers）
  - Prl：Prl 结构是 Sprm 后面加一个 操作数
- Encryption and Obfuscation，密码保护，Word 文件也可以使用密码保护，可以使用以下机制之一。

  - XOR 混淆
  - Office 二进制文件 RC4 加密
  - Office 二进制文件 RC4 CryptoAPI 加密

### Document Parts

文档被分为多个逻辑部分，并按顺序存储。

| 顺序 | 部分             | 位置 | 长度                 |
| ---- | ---------------- | ---- | -------------------- |
| 0    | Main Document    | 0    | FibRgLw97.ccpText    |
| 1    | Footnotes        | -    | FibRgLw97.ccpFtn     |
| 2    | Headers          | -    | FibRgLw97.ccpHdd     |
| 3    | Comments         | -    | FibRgLw97.ccpAtn     |
| 4    | Endnotes         | -    | FibRgLw97.ccpEdn     |
| 5    | Textboxes        | -    | FibRgLw97.ccpTxbx    |
| 6    | Header Textboxes | -    | FibRgLw97.ccpHdrTxbx |

### Document Content（文档内容）

文档内容获取的算法

- Retrieving Text：获取文字
- Determining Paragraph Boundaries：确定段落边框
- Overview of Tables：表格概述
- Determining Cell Boundaries：确定表格单元格边框
- Determining Row Boundaries：确定表格行边框
- Applying Properties：应用属性
  - Direct Paragraph Formatting：段落格式
  - Direct Character Formatting：字符格式
  - Determining List Formatting of a Paragraph
  - Determining Level Number of a Paragraph
  - Determining Properties of a Style：确定样式属性
  - Determining Formatting Properties： 确定格式属性
- Application Data For VtHyperlink：超链接数据

### The File Information Block（文件信息块）

### PLCs（字符位置数组的结构）

### Basic Types（数据结构的基本类型）

## Reference

- [[MS-DOC]: Word (.doc) Binary File Format](https://learn.microsoft.com/en-us/openspecs/office_file_formats/ms-doc);
- [什么是一 .doc 文件？](https://docs.fileformat.com/zh/word-processing/doc/)
- [MS-DOC 文件格式概述](https://blog.csdn.net/xywlzd/article/details/7958156)
