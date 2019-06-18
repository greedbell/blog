# CSS

* [MDN-CSS](https://developer.mozilla.org/zh-CN/docs/Web/CSS)

## [visibility](https://developer.mozilla.org/zh-CN/docs/Web/CSS/visibility)

* `hidden` 隐藏元素，但是其他元素的布局不改变

## [display](https://developer.mozilla.org/zh-CN/docs/Web/CSS/display)

* `inline` 该元素生成一个或多个行内元素盒。容器随内容变化
* `block` 该元素生成一个块元素盒。容器固定
* `inline-block` 该元素生成一个块状盒，该块状盒随着周围内容流动，如同它是一个单独的行内盒子（表现更像是一个被替换的元素）
* `flex` [弹性盒子](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes)

## [float](https://developer.mozilla.org/zh-CN/docs/CSS/float)

* 可以使一个元素脱离正常的文档流，然后被安放到它所在容器的的左端或者右端，并且其他的文本和行内元素围绕它安放.
* inline 会被修改成 block。
* 清除浮动最简单的方法就是给新的标题元素使用clear属性

## [overflow](https://developer.mozilla.org/zh-CN/docs/Web/CSS/overflow)

* `visible` 默认值。内容不会被修剪，会呈现在元素框之外。
* `hidden` 内容会被修剪，并且其余内容是不可见的。
* `scroll` 内容会被修剪，并且浏览器会使用滚动条，无论内容什么内容被裁减。这避免了在动态环境中滚动条的出现和消失问题。打印机会打印溢出的内容。
* `auto` 取决于用户代理。浏览器，例如火狐，会在内容溢出时提供滚动条。

## [position](https://developer.mozilla.org/zh-CN/docs/Web/CSS/position)

设置元素的定位方式

* `static` 元素使用正常的表现
* `relative` 相对正常位置位移。即会适应该元素的位置，也不改变布局（这样会在此元素原本所在的位置留下空白）
* `absolute` 不为元素预留空间，元素位置通过指定其与它最近的非static定位的祖先元素的偏移来确定
* `fixed` 不为元素预留空间。通过指定相对于屏幕视窗的位置来指定元素的空间，并且该元素的位置在屏幕滚动时不会发生改变。
