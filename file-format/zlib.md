# Zlib

是一种数据格式，用于存储压缩后的数据，采用压缩算法 Deflate 来压缩数据。Inflate 是与 Deflate 对应的解压缩算法。

## 结构

| 名字            | 长度     | 说明                     |
| --------------- | -------- | ------------------------ |
| CMF             | 1 byte   |                          |
| FLG             | 1 byte   |                          |
| DICTID          | 4 byte   | FLG.FDICT 为 1 时才有    |
| compressed data | variable | Deflate 算法压缩后的数据 |
| ADLER32         | 4 byte   | Adler-32 checksum        |

## References

- [ZLIB Compressed Data Format Specification version 3.3](https://www.rfc-editor.org/rfc/rfc1950)
- [ZLIB 压缩数据格式规范 v3.3](https://blog.csdn.net/ftswsfb/article/details/114594641)
