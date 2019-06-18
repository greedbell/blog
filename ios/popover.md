# Popover

## UIPopoverController

> NS_CLASS_DEPRECATED_IOS(3_2, 9_0, "UIPopoverController is deprecated. Popovers are now implemented as UIViewController presentations. Use a modal presentation style of UIModalPresentationPopover and UIPopoverPresentationController.")

`UIPopoverController` 在 iOS9 以上被弃用，建议把 `UIViewController` 的 style 设置为 `UIModalPresentationPopover` 就可以用 `UIPopoverPresentationController`

## UIPopoverPresentationController

### UIPopoverPresentationContriller 使用

```objc
UITableViewController tabCon = [[UITableViewController alloc]initWithStyle:UITableViewStylePlain];
//设置跳转模式为popover模式
tabCon.modalPresentationStyle = UIModalPresentationPopover;
//获取到UIPopoverPresentationController对象
UIPopoverPresentationController* con = tabCon.popoverPresentationController;
//设置弹出的基准视图
con.sourceView = self.view;
[self presentViewController:tabCon animated:YES completion:nil];
```

### 视图控制器类

```
@interface UIViewController

//设置内容控制器大小
@property (nonatomic) CGSize preferredContentSize

 //模态显示类型
 @property(nonatomic,assign) UIModalPresentationStyle modalPresentationStyle

 @end
```

### 视图控制器分类(适配显示)

```
@interface UIViewController (UIAdaptivePresentations)

//管理模态窗口的显示控制器(presentingViewController、presentedViewController)
@property (nonatomic,readonly) UIPresentationController *presentationController;

//模态弹出窗控制器
@property (nonatomic,readonly) UIPopoverPresentationController *popoverPresentationController ;

 @end
```

### UIPopoverPresentationController 的属性

```objc
//设置代理
@property (nullable, nonatomic, weak) id <UIPopoverPresentationControllerDelegate> delegate;
//设置允许的箭头方向
@property (nonatomic, assign) UIPopoverArrowDirection permittedArrowDirections;
//设置基准视图
@property (nullable, nonatomic, strong) UIView *sourceView;
//设置基准区域
@property (nonatomic, assign) CGRect sourceRect;
//设置是否覆盖基准视图区域
@property (nonatomic, assign) BOOL canOverlapSourceViewRect NS_AVAILABLE_IOS(9_0);
//设置基准BarButtonItem
@property (nullable, nonatomic, strong) UIBarButtonItem *barButtonItem;
//设置可以进行用户交互的视图
@property (nullable, nonatomic, copy) NSArray<UIView *> *passthroughViews;
//设置背景颜色
@property (nullable, nonatomic, copy) UIColor *backgroundColor;
//设置Margin，苹果 Bug，设置无效
@property (nonatomic, readwrite) UIEdgeInsets popoverLayoutMargins;
//设置自定义视图
@property (nullable, nonatomic, readwrite, strong) Class <UIPopoverBackgroundViewMethods> popoverBackgroundViewClass;
```

首先根据sourceView.在sourceView描绘出一块 sourceRect 的区域,然后箭头指向这块区域的中心点.

### UIPopoverPresentationControllerDelegate中的方法

```
//控制器将要弹出时调用
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController;
//控制器将要消失时调用
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController;
//控制器已经消失时调用
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController;
//控制器接收到弹出消息时调用
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view;
```

### 使用

### References

* [UIPopoverPresentationController](https://developer.apple.com/documentation/uikit/uipopoverpresentationcontroller)
* [iOS8新特性:UIPopoverPresentationController](http://www.jianshu.com/p/52dd6dec3e9b)
* [Customizing UIPopover with UIPopoverBackgroundView](http://www.scianski.com/customizing-uipopover-with-uipopoverbackgroundview/)
* [iOS中UIPopoverController使用详解](https://my.oschina.net/u/2340880/blog/711242)
