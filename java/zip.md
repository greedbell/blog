# zip

## zip

* [ZIP压缩算法详细分析及解压实例解释](https://www.cnblogs.com/esingchan/p/3958962.html)

## java zip

* ZipOutputStream

### 压缩多个文件

```java
public void zipFolder(String sourceFileFolder, String zipFilePath) throws Exception {
    FileOutputStream fos = new FileOutputStream(zipFilePath);
    ZipOutputStream zipOut = new ZipOutputStream(fos);
    for (File fileToZip : new File(sourceFileFolder).listFiles()) {
        FileInputStream fis = new FileInputStream(fileToZip);
        ZipEntry zipEntry = new ZipEntry(fileToZip.getName());
        zipOut.putNextEntry(zipEntry);

        byte[] bytes = new byte[1024];
        int length;
        while ((length = fis.read(bytes)) >= 0) {
            zipOut.write(bytes, 0, length);
        }
        fis.close();
    }
    zipOut.close();
    fos.close();
}
```

## Apache Commons Compress

* ZipArchiveOutputStream

## References

* [Zipping and Unzipping in Java](https://www.baeldung.com/java-compress-and-uncompress)
* [Apache Commons Compress](https://commons.apache.org/proper/commons-compress/zip.html)
