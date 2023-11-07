# ZIP

ZIP 是一种归档文件格式，多个经过 zlib 压缩的文件可以存放到一个.zip 文件中。采用压缩算法 Deflate 来压缩数据。Inflate 是与 Deflate 对应的解压缩算法。

## 文件结构

ZIP 文件大致可以分为三个部分：数据存储区（File Entry）和中心目录区（Central Directory）以及一个目录结束标识（End of central directory record）组成。

### 数据存储区（File Entry）

包含一个或多个文件实体

#### 文件实体（File Entry）

Deflate 算法压缩后的数据

##### 实体文件头（Local File Header）

- 以 `50 4B 03 04` 开头

```
local file header signature     4 bytes  (0x04034b50)
version needed to extract       2 bytes
general purpose bit flag        2 bytes
compression method              2 bytes
last mod file time              2 bytes
last mod file date              2 bytes
crc-32                          4 bytes
compressed size                 4 bytes
uncompressed size               4 bytes
file name length                2 bytes
extra field length              2 bytes

file name (variable size)
extra field (variable size)
```

##### 文件数据（File Data）

- 以 `66 6C` 开头
- Zlib
- 以 `0A` 结尾

##### 数据描述符（Data descriptor）

表示文件压缩结束

- 以 `50 4B 07 08` 开头
- 只有在文件实体头中通用标记位的第 3Bit 位为 1 时才会出现

结构：

```
crc-32                          4 bytes
compressed size                 4 bytes
uncompressed size               4 bytes
```

### 中心目录区（Central Directory）

包含一个或多个文件头，主要记录被压缩文件的目录结构，以及被压缩文件的属性，包括文件长度，压缩之后的长度，文件注释等。一个文件实体与一个文件头相对应。

#### 文件头（File Head）

- 以 `50 4b 01 02` 开头

结构：

```
central file header signature   4 bytes  (0x02014b50)
version made by                 2 bytes
version needed to extract       2 bytes
general purpose bit flag        2 bytes
compression method              2 bytes
last mod file time              2 bytes
last mod file date              2 bytes
crc-32                          4 bytes
compressed size                 4 bytes
uncompressed size               4 bytes
file name length                2 bytes
extra field length              2 bytes
file comment length             2 bytes
disk number start               2 bytes
internal file attributes        2 bytes
external file attributes        4 bytes
relative offset of local header 4 bytes

file name (variable size)
extra field (variable size)
file comment (variable size)
```

#### 数字签名（Digital Signature）

- 以 `50 4B 05 05` 开头

结构：

```
header signature                4 bytes  (0x05054b50)
size of data                    2 bytes
signature data (variable size)
```

### 目录结束标识（End of central directory record）

- 以 `50 4b 05 06` 开头
- 只有一个

```
zip64 end of central dir
signature                       4 bytes  (0x06064b50)
size of zip64 end of central
directory record                8 bytes
version made by                 2 bytes
version needed to extract       2 bytes
number of this disk             4 bytes
number of the disk with the
start of the central directory  4 bytes
total number of entries in the
central directory on this disk  8 bytes
total number of entries in the
central directory               8 bytes
size of the central directory   8 bytes
offset of start of central
directory with respect to
the starting disk number        8 bytes
zip64 extensible data sector    (variable size)
```

## References

- [ZIP File Format Specification](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT)
- [ZIP 文件结构解析](https://goodapple.top/archives/700)
- [Zip 文件数据结构说明](http://www.leeon.me/a/zip-data-struct)
