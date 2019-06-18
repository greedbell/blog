# 布局



## 五大布局

### FrameLayout

层布局，整个界面被当成一块空白备用区域，所有的子元素都不能被指定放置的位置，它们统统放于这块区域的左上角，并且后面的子元素直接覆盖在前面的子元素之上，将前面的子元素部分和全部遮挡

### LinearLayout

线性布局,它包含的子控件将以横向或竖向的方式排列，按照相对位置来排列所有的widgets或者其他的containers,超过边界时，某些控件将缺失或消失。因此一个垂直列表的每一行只会有一个widget或者是container，而不管他们有多宽，而一个水平列表将会只有一个行高（高度为最高子控件的高度加上边框高度）。LinearLayout保持其所包含的widget或者是container之间的间隔以及互相对齐（相对一个控件的右对齐、中间对齐或者左对齐）。

#### Android:layout_weight

权重，只在 `LinearLayout` 有效，一旦View设置了该属性(假设有效的情况下)，那么该 View的宽度等于原有宽度(android:layout_width)加上剩余空间的占比！

### RelativeLayout

相对布局,允许子元素指定它们相对于其父元素或兄弟元素的位置，这是实际布局中最常用的布局方式之一。它灵活性大很多，当然属性也多，操作难度也大，属性之间产生冲突的的可能性也大，使用相对布局时要多做些测试。

### AbsoluteLayout

绝对位置布局，在此布局中的子元素的android:layout_x和android:layout_y属性将生效，用于描述该子元素的坐标位置。屏幕左上角为坐标原点（0,0），第一个0代表横坐标，向右移动此值增大，第二个0代表纵坐标，向下移动，此值增大。在此布局中的子元素可以相互重叠。在实际开发中，通常不采用此布局格式，因为它的界面代码过于刚性，以至于有可能不能很好的适配各种终端。

### TableLayout

表格布局，适用于N行N列的布局格式。一个TableLayout由许多TableRow组成，一个TableRow就代表TableLayout中的一行。

## fill_parent wrap_content match_parent 区别

### fill_parent

设置一个构件的布局为fill_parent将强制性地使构件扩展，以填充布局单元内尽可能多的空间。设置一个顶部布局或控件为fill_parent将强制性让它布满整个屏幕。

### wrap_content

设置一个视图的尺寸为wrap_content将强制性地使视图扩展以显示全部内容。以TextView和ImageView控件为例，设置为wrap_content将完整显示其内部的文本和图像。布局元素将根据内容更改大小。

### match_parent

Android2.2中match_parent和fill_parent是一个意思 .两个参数意思一样，match_parent更贴切，于是从2.2开始两个词都可以用。那么如果考虑低版本的使用情况你就需要用fill_parent了

## xmlns

xmlns 就是 xml 命名空间

### `http://schemas.Android.com/apk/res/<package-name>`

引入自定义控件在layout中需要包含packagename，格式是<package-name>.<customize-class_name>

自定义属性风格需要在layout或者view的属性列加载，格式是xmlns:<style-name>=“http://schemas.Android.com/apk/res/<package-name>”

使用自定义属性的格式是<style-name>:<attrs-name>

### `http://schemas.android.com/apk/res-auto`

自动寻找

### Reference

* [Android中如何使用xmlns](http://blog.csdn.net/lihenair/article/details/41009711)

## 【Android】@+id与@id的区别

@+id：表示新增一个id，所以一般用在定义一个控件的id的时候。比如，android:id="@+id/textView1"，表示新增一个叫做textView1的id，并且设置当前这个控件的id叫做textView1。

@id：表示引用一个id，一般用来指定某一个控件。比如，当放置一个B控件位于A控件的左边的时候，可以使用android:layout_toLeftOf="@id/A"，这里就是通过引用A的id来指明相对于哪个控件进行布局。
