# MS-CFB

MS-CFB（Microsoft Compound File Binary）微软复合文件二进制的文件格式

特点：

- 单个文件
- 单个文件实现层级关系

## 扇区

一个 Compound File 分为多个长度相同的扇区（sector），扇区是磁盘的最小寻址单位，一个扇区 512 字节。

扇区类型:

| 扇区类型                         | 单个元素长度             | 大小                                                  | 用途                                                                            |
| -------------------------------- | ------------------------ | ----------------------------------------------------- | ------------------------------------------------------------------------------- |
| Header                           | 非固定                   | 512 字节（实际有效 76 字节，剩余 436 字节用于 DIFAT） | 包含这个复合文件的初始元数据，由 offset 0 处开始                                |
| DIFAT                            | 4 字节（共 128 个元素）  | 4109 + 419                                            | 用于 FAT 寻址                                                                   |
| FAT                              | 4 字节（共 128 个元素 ） | 4 \_ 128 = 512 字节                                   | OLE 中的主要 Allocator，用于 mini FAT、directory、mini stream 等扇区寻址        |
| Mini FAT                         | 4 字节（共 128 个元素）  | 512 字节                                              | mini stream 用户数据的 Allocator                                                |
| Directory                        | 128 字节                 | 128 \_ 4 = 512 字节                                   | 包含 storage 对象或 stream 对象的元数据                                         |
| 用户自定义数据（即 mini stream） | 非固定                   |                                                       | stream 对象的用户自定义数据                                                     |
| Rang Lock                        | 非固定                   |                                                       | 用于管理对复合文件的并发访问的单个扇区。此扇区 必须包含文件偏移量  0x7FFFFFFF。 |
| Unallocated Free                 | 非固定                   |                                                       | OLE 的未分配空间                                                                |

扇区名称：

| Sector name    | Integer value           | Description                                                     |
| -------------- | ----------------------- | --------------------------------------------------------------- |
| REGSECT        | 0x00000000 - 0xFFFFFFF9 | Regular sector number.                                          |
| MAXREGSECT     | 0xFFFFFFFA              | Maximum regular sector number.                                  |
| Not applicable | 0xFFFFFFFB              | Reserved for future use.                                        |
| DIFSECT        | 0xFFFFFFFC              | Specifies a DIFAT sector in the FAT.                            |
| FATSECT        | 0xFFFFFFFD              | Specifies a FAT sector in the FAT.                              |
| ENDOFCHAIN     | 0xFFFFFFFE              | End of a linked chain of sectors.                               |
| FREESECT       | 0xFFFFFFFF              | Specifies an unallocated sector in the FAT, Mini FAT, or DIFAT. |

## Reference

- [[MS-CFB]: Compound File Binary File Format](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-cfb);
