# 让界面更流畅

## 不透明

不透明可以减少颜色合成计算

## 离屏渲染

离屏渲染合成计算是非常昂贵的

GPU屏幕渲染有以下两种方式：

* On-Screen Rendering
意为当前屏幕渲染，指的是GPU的渲染操作是在当前用于显示的屏幕缓冲区中进行。

* Off-Screen Rendering
意为离屏渲染，指的是GPU在当前屏幕缓冲区以外新开辟一个缓冲区进行渲染操作。

## References

* [Getting Pixels onto the Screen](https://www.objc.io/issues/3-views/moving-pixels-onto-the-screen/#the-hardware-players)
* [绘制像素到屏幕上](https://objccn.io/issue-3-1/) `Getting Pixels onto the Screen` 翻译
* [iOS 保持界面流畅的技巧](http://blog.ibireme.com/2015/11/12/smooth_user_interfaces_for_ios/)
* [AsyncDisplayKit](https://github.com/facebook/AsyncDisplayKit)
* [YYKit](https://github.com/ibireme/YYKit)
