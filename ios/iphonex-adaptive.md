# iPhoneX 适配

safe area

## UIViewController

```objc

/* Custom container UIViewController subclasses can use this property to add to the overlay
 that UIViewController calculates for the safeAreaInsets for contained view controllers.
 */
@property(nonatomic) UIEdgeInsets additionalSafeAreaInsets API_AVAILABLE(ios(11.0), tvos(11.0));
// These objects may be used as layout items in the NSLayoutConstraint API
@property(nonatomic,readonly,strong) id<UILayoutSupport> topLayoutGuide API_DEPRECATED_WITH_REPLACEMENT("-[UIView safeAreaLayoutGuide]", ios(7.0,11.0), tvos(7.0,11.0));
@property(nonatomic,readonly,strong) id<UILayoutSupport> bottomLayoutGuide API_DEPRECATED_WITH_REPLACEMENT("-[UIView safeAreaLayoutGuide]", ios(7.0,11.0), tvos(7.0,11.0));

- (void)viewSafeAreaInsetsDidChange NS_REQUIRES_SUPER API_AVAILABLE(ios(11.0), tvos(11.0));

```

## UIView

```objc
@property (nonatomic) BOOL insetsLayoutMarginsFromSafeArea API_AVAILABLE(ios(11.0),tvos(11.0));  // Default: YES
@property (nonatomic,readonly) UIEdgeInsets safeAreaInsets
@property(nonatomic,readonly,strong) UILayoutGuide *safeAreaLayoutGuide

- (void)safeAreaInsetsDidChange
```

## react native

初始化 和 `safeAreaInsetsDidChange` 的时候，

1. 设置 `statusBar` height 和 paddingTop，适配 top。

```
paddingTop = safeArea.top。
height += paddingTop
```

2. 设置 `tabBar` height 和 paddingBottom，适配 bottom。

```
paddingBottom = safeArea.bottom
height += paddingBottom
```

3. `scrollview` 及所有子类，例如 `flatList` `listView`，设置  `contentInset` 或 `scrollIndicatorInsets` 属性，适配 bottom

```
scrollview.contentInset = {0, 0, safeArea.bottom, 0}
```

或

```
scrollview.scrollIndicatorInsets = {top: 0, left: 0, bottom: safeArea.bottom, right: 0}
```

两个效果是一样的，原生调用的同样的代码

4. `webview` 设置 `contentInset`

```
webview.contentInset = {top: 0, left: 0, bottom: safeArea.bottom, right: 0}
```

## References

* [Human Interface Guidelines - iPhoneX](https://developer.apple.com/ios/human-interface-guidelines/overview/iphone-x/)
* [Positioning Content Relative to the Safe Area](https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area)
* [iOS 指纹识别常见问题汇总](http://www.jianshu.com/p/d44b7d85e0a6)
