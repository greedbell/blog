# UIViewController 管理

## addChildViewController

* [对addChildViewController的一点理解](https://www.jianshu.com/p/0d81ba13af37)

在添加子View时顺带使用addchildViewcontroller把管理该视图的视图控制器作为子控制器添加进来。并且当我们暂时不需要显示这个子视图时可以只执行addchildViewController操作，而不执行addsubview操作，当需要显示时再调用transitionFromViewController:toViewController:duration:options:animations:completion 方法将子视图显示出来。
另外，当收到系统的 Memory Warning 的时候，系统也会自动把当前没有显示的 subview unload 掉，以节省内存。

## UIViewController

### definesPresentationContext

是否用当前视图控制器做背景，默认 NO

从原始的展示视图控制器开始（就是发送presentViewController:animated:completion:这个消息的视图控制器），从父视图控制器链向上查找哪个视图控制器的definesPresentationContext属性为YES。如果找到一个，那这个就是要找的，这个视图控制器将是正在展示的制图控制器，它的视图会被要展示的视图控制器的视图取代。

如果找不到一个，那么就按照modalPresentationStyle属性为UIModalPresentationFullScreen来处理。

如果找到了一个definesPresentationContext属性为YES的视图控制器，那么还会判断这个视图控制器的providesPresentationContextTransitionStyle属性是否也为YES。如果是，那么这个视图控制器的modalTransitionStyle属性将会用来执行这个转换动画，而不是使用正在展示的视图控制器的modalTransitionStyle属性。

### transitionFromViewController

切换 ViewController

会调用 `[fromViewController.view removeFromSuperview]`

## UIPresentationController

Custom 模式的 Modal 转场里，使用默认的 UIPresentationController

### shouldRemovePresentersView

presentingView 是否在 presentation 转场结束后被移除, 默认 NO
