# 字体自适应

## UILabel

UITextView UITextField 同样适用

### 方法一：preferredFontForTextStyle

只能设置 UIFontTextStyleBody UIFontTextStyleTitle1 等固定字体，各个 UIFontTextStyle 对应字体参考 [Dynamic Type sizes](https://developer.apple.com/design/human-interface-guidelines/foundations/typography/#specifications)

```objc
label.adjustsFontForContentSizeCategory = YES;
label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
```


### 方法二：UIFontMetrics

可以设置任意字体，然后中气系统设置自动缩放。

```objc
label.adjustsFontForContentSizeCategory = YES;
label.font = [UIFontMetrics.defaultMetrics scaledFontForFont:[UIFont systemFontOfSize:12]];
```

## WKWebView

参考 [Dynamic fonts in WKWebView](https://dev.to/gualtierofr/dynamic-fonts-in-wkwebview-2c0f)

### 方法一：-apple-system-body

修改 root 的 font 修改字号，这种方法只支持苹果字体，没法用其它字体

```css
:root {
   font: -apple-system-body;
}
```

### 方法一：font-size

 修改 root 的 font-size 来修改字号，这种方法只支持字号用 em ex 定义字号的情况，字号直接用 px 时不支持。

```css
:root {
    font-size:16px;
}
h1 {
    font-size: 2rem;
    color: red;
}
p {
    font-size: 1.5rem;
}
```

## References

* [Scaling Fonts Automatically](https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically?language=objc)
* [Dynamic Type & In-App Font Scaling](https://lickability.com/blog/dynamic-type-and-in-app-font-scaling/)
* [Specifying a system font in web content to support platform text resize without browser or platform assistive technology zoom.](https://www.w3.org/WAI/GL/mobile-a11y-tf/wiki/Specifying_a_system_font_in_web_content_to_support_platform_text_resize_without_browser_or_platform_assistive_technology_zoom.)
