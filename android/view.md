# View

## 说明

Android的UI界面都是由View和ViewGroup及其派生类组合而成的。其中，View是所有UI组件的基类，而ViewGroup是容纳这些组件的容器，其本身也是从View派生出来的。

* ViewGroup 可以包含作为叶子节点的 View，View 的子类
* View 不能有子 View
* Layout 是 ViewGroup 的子类，用来控制视图布局
* 小部件（Widget）是微型的应用程序视图，它可以被嵌入到其它应用程序中（比如桌面）并接收周期性的更新。你可以通过一个App Widget Provider来发布一个Widget。

## 组件

### [List View](https://developer.android.com/guide/topics/ui/layout/listview.html)

ListView 是一个显示一列可滚动项目的视图组。 系统使用 Adapter 自动将列表项目插入列表，适配器从来源（例如数组或数据库查询）提取内容，并将每个项目结果转换为视图放置到列表中。

### [Grid View](https://developer.android.com/guide/topics/ui/layout/gridview.html)

网格视图，它按照行列的方式来显示内容的。常用于九宫格内容显示。

### Selector

selector就是状态列表（StateList）， 它分为两种，一种Color-Selector 和Drawable-Selector。

selector中文的意思选择器，在Android中常常用来作组件的背景，这样做的好处是省去了用代码控制实现组件在不同状态下不同的背景颜色或图片的变换。使用十分方便。

* [Drawable-Selector](https://developer.android.com/guide/topics/resources/drawable-resource.html#StateList)
* [Color-Selector](https://developer.android.com/guide/topics/resources/color-list-resource.html)

### [ViewPager](https://developer.android.com/reference/android/support/v4/view/ViewPager.html)

用于滑动切换视图。对应适配器 [PagerAdapter](PagerAdapter)

* [Using ViewPager for Screen Slides](https://developer.android.com/training/animation/screen-slide.html)
