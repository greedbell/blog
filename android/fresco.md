# Fresco

* [GitHub](https://github.com/facebook/fresco)
* [中文文档](https://www.fresco-cn.org/)


- [Fresco](#fresco)
  - [说明](#%E8%AF%B4%E6%98%8E)
  - [Config](#config)
    - [ImagePipelineConfig](#imagepipelineconfig)
      - [Downsample](#downsample)
    - [DiskCacheConfig](#diskcacheconfig)
    - [DraweeConfig](#draweeconfig)
  - [使用](#%E4%BD%BF%E7%94%A8)
    - [RN 中使用 Fresco.initialize()](#rn-%E4%B8%AD%E4%BD%BF%E7%94%A8-frescoinitialize)
      - [方法一](#%E6%96%B9%E6%B3%95%E4%B8%80)
      - [方法二](#%E6%96%B9%E6%B3%95%E4%BA%8C)
    - [ResizeOptions](#resizeoptions)
  - [分析](#%E5%88%86%E6%9E%90)
    - [ImagePipeline](#imagepipeline)

## 说明

* `ImageRequest` 负责图片下载处理
* `image pipeline` 负责完成图像加载
* `Drawees` 负责图片显示

## Config

```java
DraweeConfig draweeConfig = DraweeConfig.newBuilder()
                .build();
        DiskCacheConfig diskCacheConfig = DiskCacheConfig.newBuilder(context)
                .setMaxCacheSize(100 * ByteConstants.MB)
                .build();
        ImagePipelineConfig imagePipelineConfig = ImagePipelineConfig.newBuilder(context)
                .setDownsampleEnabled(true)
                .setMainDiskCacheConfig(diskCacheConfig)
                .build();
        Fresco.initialize(context, imagePipelineConfig, draweeConfig);
```

### ImagePipelineConfig

图片下载修改配置

#### Downsample

默认 resize 不支持 jpeg 以外的格式，开启向下采样可以使 resize 支持 jpeg 以外的格式:

```
ImagePipelineConfig config = ImagePipelineConfig.newBuilder(context)
    .setDownsampleEnabled(true)
    .build();
Fresco.initialize(context, config);
```

* [代码实现](https://github.com/facebook/fresco/blob/v1.11.0/imagepipeline/src/main/java/com/facebook/imagepipeline/producers/DownsampleUtil.java#L35)

### DiskCacheConfig

磁盘缓存配置

```java
// 普通的最大磁盘缓存
private long mMaxCacheSize = 40 * ByteConstants.MB;
// 小磁盘的最大磁盘缓存
private long mMaxCacheSizeOnLowDiskSpace = 10 * ByteConstants.MB;
// 极小磁盘的最大磁盘缓存
private long mMaxCacheSizeOnVeryLowDiskSpace = 2 * ByteConstants.MB;
```

默认最大缓存为 40 MB

### DraweeConfig

显示配置

## 使用

### RN 中使用 Fresco.initialize()

在 RN 中，FrescoModule 初始化时调用 `Fresco.initialize()`，会替换掉 `MainApplication` 中 `Fresco.initialize()` 的配置。所以需要特殊处理。

#### 方法一

`MainPackageConfig.setFrescoConfig()` 设置 ImagePipelineConfig,

MainApplication.getPackages 返回 `new MainReactPackage(mainPackageConfig)`

Example:

```java
@Override
protected List<ReactPackage> getPackages() {
    return Arrays.asList(
            new MainReactPackage(getMainPackageConfig()),
          );
}

private MainPackageConfig getMainPackageConfig() {
    ImagePipelineConfig imagePipelineConfig;
    return new MainPackageConfig.Builder().setFrescoConfig(imagePipelineConfig).build();
}
```

这种方式无法直接使用 `FrescoModule.getDefaultConfigBuilder()`，因为没有 ReactContext。

#### 方法二

创建个原生模块，添加如下的 `initializeFresco` 方法。然后在 JS 代码中调用 `initializeFresco`。替换 FrescoModule 中的配置

```java
@ReactMethod
private void initializeFresco() {
    ReactApplicationContext context = getReactApplicationContext();
    ImagePipelineConfig.Builder builder = FrescoModule.getDefaultConfigBuilder(context);

    DiskCacheConfig diskCacheConfig = DiskCacheConfig.newBuilder(context)
            .setMaxCacheSize(1000 * ByteConstants.MB)
            .setMaxCacheSizeOnLowDiskSpace(800 * ByteConstants.MB)
            .setMaxCacheSizeOnVeryLowDiskSpace(500 * ByteConstants.MB)
            .build();

    ImagePipelineConfig imagePipelineConfig = builder.setDownsampleEnabled(true)
            .setMainDiskCacheConfig(diskCacheConfig)
            .build();

    Fresco.initialize(context, imagePipelineConfig);
}
```
### ResizeOptions

参考 [缩放和旋转图片](https://www.fresco-cn.org/docs/resizing-rotating.html)

`ResizeOptions.java` 的默认最大图片大小 `maxBitmapSize = MAX_BITMAP_SIZE = 2048f`。RN 使用了默认值，且不可配，所以如果开启了 resize，也就是 `resizeMethod: 'resize'` 时，图片会被压缩到 2M 以下。

## 分析

### ImagePipeline

是 Fresco 读取数据的整个调度系统

* 检查内存缓存
* 检查磁盘缓存
* 文件读取或网络请求，并存储到各个缓存。

流程

```java
// 读取硬盘缓存
BufferedDiskCache.readFromDiskCache()
```
