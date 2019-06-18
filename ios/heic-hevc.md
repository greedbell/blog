# HEIF/HEVC

* HEIF AVFileTypeHEIF 是一种图像文件封装格式
* HEVC/HEIC AVFileTypeHEIC 是一种视频编码标准

```objc

/*!
 @constant AVFileTypeHEIC
 @abstract A UTI for the high efficiency image file format containing HEVC compressed images.
 @discussion
 The value of this UTI is @"public.heic".
 Files are identified with the .heic extension.
 */
AVF_EXPORT AVFileType const AVFileTypeHEIC NS_AVAILABLE(10_13, 11_0);


/*!
 @constant AVFileTypeHEIF
 @abstract A UTI for the high efficiency image file format containing images compressed with any codec.
 @discussion
 The value of this UTI is @"public.heif".
 Files are identified with the .heif extension.
 */
AVF_EXPORT AVFileType const AVFileTypeHEIF NS_AVAILABLE(10_13, 11_0);
```

AVAssetExportSession 视频压缩

##

```
if ([dataUTI isEqualToString:@"public.heif"] || [dataUTI isEqualToString:@"public.heic"]) {
    CIImage *ciImage = [CIImage imageWithData:imageData];
    CIContext *context = [CIContext context];
    imageData = [context JPEGRepresentationOfImage:ciImage colorSpace:ciImage.colorSpace options:@{}];
}
```

iOS 11 设置 > 相机 > 格式 设置为高效的时候，照片用的 HEIF 格式，视频用的 HEVC 格式，之前的图片选择库不支持

## References

* [开发者该知道的 HEVC 与 HEIF ](https://xiaozhuanlan.com/topic/4958231670)
* [Working with HEIF and HEVC](https://anotheren.com/2017/06/15/Working-with-HEIF-and-HEVC/)
* [iOS 11 HEIF/HEIC图片转JPG、UIImage加载HEIF](https://www.jianshu.com/p/a63c7d5d98a9)
