# iOS 导入导出文档

## 导出文档

UIActivityViewController 和 UIDocumentInteractionController 都可以实现。

UIActivityViewController 相比 UIDocumentInteractionController 优势

* 可以配置 excludedActivityTypes 添加额外的自定义服务，它还提供了非常好的原生服务的定制化功能。
* 自定义UIActivity服务

## 从 PC 端 iTunes 导入文档

`UIFileSharingEnabled` 设为 YES，iTunes 可以访问 NSDocumentDirectory 目录。

获取导入的文档

```objc
NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
NSFileManager *manager = [NSFileManager defaultManager];
NSArray *fileList = [manager contentsOfDirectoryAtPath:documentsDirectory error:nil];
NSMutableString *filesStr = [NSMutableString stringWithString:@"Documents文件夹中文件的名称： \n"];
```

## 应用间的文件交换

参考 [Uniform Type Identifiers Reference](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html#//apple_ref/doc/uid/TP40009259-SW1) CFBundleDocumentTypes 设置支持的格式，其它 App 调用 `UIDocumentInteractionController` 或 `UIActivityViewController` 时就会有 App 的 icon。

* Document Types 已知格式
* Imported UTIs 添加新的格式

## References

* [iOS-实现文件导入和导出](https://www.jianshu.com/p/c9484a4e9fc8)
* [UTType](https://developer.apple.com/documentation/mobilecoreservices/uttype?language=objc)
* [Introduction to Uniform Type Identifiers Reference](https://developer.apple.com/library/archive/documentation/Miscellaneous/Reference/UTIRef/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009258-SW1)
* [Introduction to Uniform Type Identifiers Overview](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/understanding_utis/understand_utis_intro/understand_utis_intro.html#//apple_ref/doc/uid/TP40001319-CH201-SW1)
* [通过iTunes共享文件到Document目录](https://www.jianshu.com/p/de59aafe1947)
