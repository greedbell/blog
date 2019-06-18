# iPAd 分屏

## 如果支持分屏

1. `Target > General > Devices > iPad`
2. 不勾选 `Require full screen`

## 如何监听屏幕变化

```objc
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    CGFloat newViewWidth = self.view.frame.size.width;
    if (newViewWidth != _oldViewWidth) {
        self.oldViewWidth = newViewWidth;
        [self viewWidthUpdatedFromDidLayoutSubviews];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self viewWidthUpdated];
        });
    }
}
```

## 注意

UIWindow 需要用`keyWindow`
