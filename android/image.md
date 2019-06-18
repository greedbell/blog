# 图片相关

## 最大能显示的图片 size

参考 <https://stackoverflow.com/a/26823209/6283925>，由于 OpenGL 限制，所以最大能显示的图片 size 可以由下面的方法计算出

```java
public static int getMaxTextureSize() {
    // Safe minimum default size
    final int IMAGE_MAX_BITMAP_DIMENSION = 2048;

    // Get EGL Display
    EGL10 egl = (EGL10) EGLContext.getEGL();
    EGLDisplay display = egl.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);

    // Initialise
    int[] version = new int[2];
    egl.eglInitialize(display, version);

    // Query total number of configurations
    int[] totalConfigurations = new int[1];
    egl.eglGetConfigs(display, null, 0, totalConfigurations);

    // Query actual list configurations
    EGLConfig[] configurationsList = new EGLConfig[totalConfigurations[0]];
    egl.eglGetConfigs(display, configurationsList, totalConfigurations[0], totalConfigurations);

    int[] textureSize = new int[1];
    int maximumTextureSize = 0;

    // Iterate through all the configurations to located the maximum texture size
    for (int i = 0; i < totalConfigurations[0]; i++) {
        // Only need to check for width since opengl textures are always squared
        egl.eglGetConfigAttrib(display, configurationsList[i], EGL10.EGL_MAX_PBUFFER_WIDTH, textureSize);

        // Keep track of the maximum texture size
        if (maximumTextureSize < textureSize[0])
            maximumTextureSize = textureSize[0];
    }

    // Release
    egl.eglTerminate(display);

    // Return largest texture size found, or default
    return Math.max(maximumTextureSize, IMAGE_MAX_BITMAP_DIMENSION);
}
```

## Resize

```java
    // Calculate inSampleSize
    options.inSampleSize = calculateInSampleSize(options, reqWidth, reqHeight);

    // Decode bitmap with inSampleSize set
    options.inJustDecodeBounds = false;
    BitmapFactory.decodeResource(res, resId, options);
```


### inSampleSize

参考 <https://stackoverflow.com/a/17074670/5266652> 和 [fresco DownsampleUtil.determineSampleSize](https://github.com/facebook/fresco/blob/v1.11.0/imagepipeline/src/main/java/com/facebook/imagepipeline/producers/DownsampleUtil.java#L35_L64) JPG 的 inSampleSize 必须是 2 的阶乘，PNG 整数就行。 但是碰到有的 PNG 图片不用 2 的阶乘就闪退。

### References

* [Loading Large Bitmaps Efficiently ](https://developer.android.com/topic/performance/graphics/load-bitmap)
* [Android之图片压缩](https://blog.csdn.net/xiaohanluo/article/details/52485037)

## maxBitmapSize

## BitmapRegionDecoder

只取图片指定区域的图片