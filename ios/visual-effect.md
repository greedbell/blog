# iOS上实现毛玻璃效果

iOS7默认支持毛玻璃效果，只对navBar,tabBar等系统控件有效。如果要对自定义控件实现毛玻璃效果需要做下面几步操作

## scrollIndicatorInsets

`UIScrollView`滚动条在scrollerView中的位置

## contentInset

`UIScrollView`视图在scrollView中的位置

## automaticallyAdjustsScrollViewInsets

是否自动设置`UIScrollView`的`contentInset`。设置为`NO`,自定义的`contentInset`才会生效

```objc
self.automaticallyAdjustsScrollViewInsets=NO;
```

## 自定义View实现毛玻璃效果

有两种方法实现毛玻璃效果

1. 生成毛玻璃效果的图片

<https://developer.apple.com/library/ios/samplecode/UIImageEffects/Introduction/Intro.html>

2. UIVisualEffectView

```objc
self.backgroundColor = [UIColor clearColor];
UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
[self addSubview:effectview];
```

## 相关资料

* <http://stackoverflow.com/questions/19065393/ios7-uiscrollview-contentinset-not-working>
* <http://stackoverflow.com/questions/21043375/change-uitableview-contentinset-ios-7>
