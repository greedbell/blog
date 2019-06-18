# iOS开发过程中遇到的问题


<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [iOS开发过程中遇到的问题](#ios开发过程中遇到的问题)
	* [Q1:Category中重写dealloc导致通知、KVO未注销](#q1category中重写dealloc导致通知-kvo未注销)
	* [Q2:Assertion failure in -[UITableView layoutSublayersOfLayer:]](#q2assertion-failure-in-uitableview-layoutsublayersoflayer)
	* [Q3: `UIScrollView`中添加`UITableView`，`viewWidthUpdated`无限循环。](#q3-uiscrollview中添加uitableviewviewwidthupdated无限循环)
	* [Q4](#q4)
		* [question](#question)
		* [answer](#answer)
		* [reference](#reference)
	* [Q5: 浮点数精度问题](#q5-浮点数精度问题)
	* [Q6: View 获取他的 viewController](#q6-view-获取他的-viewcontroller)

<!-- /code_chunk_output -->


## Q1:Category中重写dealloc导致通知、KVO未注销

* `Category `如果要重写方法，必须用`runtime`修改该方法。
* 建议不要在`Category `中重写`dealloc`,应该扩展出一个释放资源的方法。
在`ARC`中，`dealloc`的时候不能调`[super dealloc]`,但是会调用`[super dealloc]`。

## Q2:Assertion failure in -[UITableView layoutSublayersOfLayer:]

<http://stackoverflow.com/questions/31340603/assertion-failure-in-uitableview-layoutsublayersoflayer-on-ios-7>

iOS7的tableView的子View不能设置约束。

## Q3: `UIScrollView`中添加`UITableView`，`viewWidthUpdated`无限循环。

`UITableView`宽度、高度不能对`UIScrollView`做约束。


## Q4

### question

> 构建新的 App 和 App 更新时，必须使用公共（GM）版 Xcode 6 或更高版本、OS X 以及 iOS SDK。请勿提交使用 Beta 版软件，包括 Beta 版 OS X 构建的 App。

环境：

Xcode: 7.3.1
OS X: 10.11.5 (15F34)

### answer

用 Xcode 7.3 打包

Product > Archive > 右键 > Show in Finder > 显示包内容 > Products /Applications /xxx.app /Info.plist BuildMachineOSBuild 修改为 15D21

### reference

* <http://blog.csdn.net/minjing_lin/article/details/51085361>

## Q5: 浮点数精度问题

question

```objc
NSString *str = @"37.3336";
float f = [str floatValue]; // f = 37.3335991
```

NSJSONSerialization 转 NSDictionary float 出错

answer

```objc
NSString *str = @"37.3336";
float f = [str doubleValue]; // f = 37.3336
```

explain

因为float类型无法精准保存, 系统会选一个接近的值来代替.而double类型则可以有更好的精度,但还是会出现类似问题。更精确的方式是使用 `NSDecimalNumber`

NSJSONSerialization 的问题只能服务器返回字符串

* <http://stackoverflow.com/questions/9328260/converting-nsstring-to-float-adds-in-decimal-places>

Your issue seems to be that you don't understand how floats are stored in memory and don't know that floats aren't precise.

Exact values often can't be stored and so the system picks the closest number it can to represent it. If you look carefully, you can see that each of the outputted numbers is very close to your inputted values.

For better accuracy, try using double instead. Double does encounter the same problems, but with better precision. Floats have about 6 significant digits; doubles have more than twice that.Source

Here are some other StackOverflow answers and external articles you should read:

* [What Every Computer Scientist Should Know About Floating-Point Arithmetic](http://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
* [Floating Points on Wikipedia](http://en.wikipedia.org/wiki/Floating_point)
* [This answer on a similar question](http://stackoverflow.com/questions/5523446/why-is-my-float-division-off-by-0-00390625)
* [float、double(浮点数)区别还有和decimal(定点数)的比较](http://www.cnblogs.com/itcomputer/articles/4716024.html)


## Q6: View 获取他的 viewController

```OC
- (UIViewController *)reactViewController
{
  id responder = [self nextResponder];
  while (responder) {
    if ([responder isKindOfClass:[UIViewController class]]) {
      return responder;
    }
    responder = [responder nextResponder];
  }
  return nil;
}
```

参考：

* [获取当前viewcontroller响应事件传递](http://blog.csdn.net/maggiezzzzz/article/details/51605585)
