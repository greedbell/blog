# Masonry权值

<http://www.bubuko.com/infodetail-1149793.html>

最大值 1000
Masonry默认 UILayoutPriorityDefaultHigh = 750


```objc
// 调整label随内容变化的权重
  [label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
```