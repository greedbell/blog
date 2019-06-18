# 面试

* [前端开发面试题](https://github.com/markyun/My-blog/tree/master/Front-end-Developer-Questions)
* [Front-end-Developer-Interview-Questions](https://github.com/h5bp/Front-end-Developer-Interview-Questions)

## CSS

### CSS 选择器

* .class
* #id
* element
* `[attribute=value]`

### CSS隐藏元素的几种方法

* Opacity:元素本身依然占据它自己的位置并对网页的布局起作用。它也将响应用户交互;
* Visibility:与 opacity 唯一不同的是它不会响应任何用户交互。此外，元素在读屏软件中也会被隐藏;
* Display:display 设为 none 任何对该元素直接打用户交互操作都不可能生效。此外，读屏软件也不会读到元素的内容。这种方式产生的效果就像元素完全不存在;
* Position:不会影响布局，能让元素保持可以操作;
* Clip-path:clip-path 属性还没有在 IE 或者 Edge 下被完全支持。如果要在你的 clip-path 中使用外部的 SVG 文件，浏览器支持度还要低;

### 请解释一下为什么需要清除浮动？清除浮动的方式

清除浮动是为了清除使用浮动元素产生的影响。浮动的元素，高度会塌陷，而高度的塌陷使我们页面后面的布局不能正常显示。

clear: both;

### 实现不使用 border 画出1px高的线，在不同浏览器的标准模式与怪异模式下都能保持一致的效果。

```
<div style="height:1px;overflow:hidden;background:red"></div>
```

* [overflow](https://developer.mozilla.org/zh-CN/docs/Web/CSS/overflow) 指定当内容溢出其块级容器时,是否剪辑内容，显示滚动条或显示溢出的内容。

### 如何居中div？

水平居中：

```css
div{
 width:200px;
 margin:0 auto;
 }
```

水平垂直居中一:

```css
div {
 position: relative;		/* 相对定位或绝对定位均可 */
 width:500px;
 height:300px;
 top: 50%;
 left: 50%;
 margin: -150px 0 0 -250px;     	/* 外边距为自身宽高的一半 */
 background-color: pink;	 	/* 方便看效果 */

 }
```

水平垂直居中二：

```css
div {
 position: absolute;		/* 相对定位或绝对定位均可 */
 width:500px;
 height:300px;
 top: 50%;
 left: 50%;
 transform: translate(-50%, -50%);
 background-color: pink;	 	/* 方便看效果 */

}
```

水平垂直居中三：

```css
.container {
 display: flex;
 align-items: center; 		/* 垂直居中 */
 justify-content: center;	/* 水平居中 */

}
.container div {
 width: 100px;
 height: 100px;
 background-color: pink;		/* 方便看效果 */
}
```

### 用纯CSS创建一个三角形的原理是什么？

把上、左、右三条边隐藏掉（颜色设为 transparent）

```css
#demo {
  width: 0;
  height: 0;
  border-width: 20px;
  border-style: solid;
  border-color: transparent transparent red transparent;
}
```

## JavaScript

### JavaScript原型，原型链 ? 有什么特点？

每个对象都会在其内部初始化一个属性，就是prototype(原型)，当我们访问一个对象的属性时，
如果这个对象内部不存在这个属性，那么他就会去prototype里找这个属性，这个prototype又会有自己的prototype，
于是就这样一直找下去，也就是我们平时所说的原型链的概念。
关系：`instance.constructor.prototype = instance.__proto__`

特点：
JavaScript对象是通过引用来传递的，我们创建的每个新对象实体中并没有一份属于自己的原型副本。当我们修改原型时，与之相关的对象也会继承这一改变。


 当我们需要一个属性的时，Javascript引擎会先看当前对象中是否有这个属性， 如果没有的话，
 就会查找他的Prototype对象是否有这个属性，如此递推下去，一直检索到 Object 内建对象。

```js
function Func(){}
Func.prototype.name = "Sean";
Func.prototype.getInfo = function() {
  return this.name;
}
var person = new Func();//现在可以参考var person = Object.create(oldObject);
console.log(person.getInfo());//它拥有了Func的属性和方法
//"Sean"
console.log(Func.prototype);
// Func { name="Sean", getInfo=function()}
```

### ["1", "2", "3"].map(parseInt) 答案是多少？

参考 <http://blog.csdn.net/justjavac/article/details/19473199>

```js
[1, NaN, NaN]
```

### 如何解决跨域问题?

jsonp、 iframe、window.name、window.postMessage、服务器上设置代理页面

### call apply bind

call()方法的作用和 apply() 方法类似，只有一个区别，就是 call()方法接受的是若干个参数的列表，而apply()方法接受的是一个包含多个参数的数组。

* `func.apply(thisArg, [argsArray])`
* `fun.call(thisArg, arg1, arg2, ...)`
* `fun.bind(thisArg[, arg1[, arg2[, ...]]])` fun 的 this 指向 thisArg

apply call 结果：

```js
thisArg.func(...args)
```

## FlexBox

* flex-direction:决定项目的排列方向。
* flex-wrap:即一条轴线排不下时如何换行。
* flex-flow:是flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap。
* justify-content:定义了项目在主轴上的对齐方式。(justify)
* align-items:定义项目在交叉轴上如何对齐。
* align-content:定义了多根轴线的对齐方式。如果项目只有一根轴线，该属性不起作用。(换行会产生多轴)

## React

### React 生命周期

渲染过程调用到的生命周期函数，主要几个要知道：

* constructor
* getInitialState
* getDefaultProps
* componentWillMount
* render
* componentDidMount

更新过程

* componentWillReceiveProps
* shouldComponentUpdate
* componentWillUpdate
* render
* componentDidUpdate

卸载过程

componentWillUnmount

### 调用 setState 之后发生了什么？

在代码中调用setState函数之后，React 会将传入的参数对象与组件当前的状态合并，然后触发所谓的调和过程（Reconciliation）。经过调和过程，React 会以相对高效的方式根据新的状态构建 React 元素树并且着手重新渲染整个UI界面。在 React 得到元素树之后，React 会自动计算出新的树与老树的节点差异，然后根据差异对界面进行最小化重渲染。在差异计算算法中，React 能够相对精确地知道哪些位置发生了改变以及应该如何改变，这就保证了按需更新，而不是全部重新渲染。

### Component 与 PureComponent 区别

### Redux

## 其它

### 请描述一下 cookies，sessionStorage 和 localStorage 的区别？

cookie是网站为了标示用户身份而储存在用户本地终端（Client Side）上的数据（通常经过加密）。
cookie数据始终在同源的http请求中携带（即使不需要），记会在浏览器和服务器间来回传递。
sessionStorage和localStorage不会自动把数据发给服务器，仅在本地保存。

存储大小：
  cookie数据大小不能超过4k。
  sessionStorage和localStorage 虽然也有存储大小的限制，但比cookie大得多，可以达到5M或更大。

有期时间：
  localStorage    存储持久数据，浏览器关闭后数据不丢失除非主动删除数据；
  sessionStorage  数据在当前浏览器窗口关闭后自动删除。
  cookie          设置的cookie过期时间之前一直有效，即使窗口或浏览器关闭

### 懒加载（lazyload）

核心是按需加载

在什么场合中应用比较合适：
涉及到图片，falsh资源 , iframe, 网页编辑器(类似FCK)等占用较大带宽，且这些模块暂且不在浏览器可视区内,因此可以使用lazyload在适当的时候加载该类资源.避免网页打开时加载过多资源，让用户等待太久.

### 设计模式 知道什么是singleton, factory, strategy, decrator么?
