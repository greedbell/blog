# JavaScript

* [w3school 教程](http://www.w3school.com.cn/js/)
* [mozilla 教程](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript)
* [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
* [Airbnb JavaScript Style Guide ES6/ES2015 翻译](https://github.com/sivan/javascript-style-guide)
* [Airbnb JavaScript Style Guide React/JSX 翻译](https://github.com/JasonBoy/javascript/tree/master/react)
* [深入理解JavaScript系列](http://www.cnblogs.com/TomXu/archive/2011/12/15/2288411.html)

## ES2015

ES6 + ES7的一部分 + JSX

## call apply bind 区别

* [call](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/call)
* [apply](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)
* [bind](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)

* 对于 apply、call 二者而言，作用完全一样，只是接受参数的方式不太一样。

EG:
```JS
var func = function(arg1, arg2) {

};
func.call(this, arg1, arg2);
func.apply(this, [arg1, arg2])
```

call 需要把参数按顺序传递进去，而 apply 则是把参数放在数组里。

* apply 、 call 、bind 三者都是用来改变函数的this对象的指向的；
* apply 、 call 、bind 三者第一个参数都是this要指向的对象，也就是想指定的上下文；
* apply 、 call 、bind 三者都可以利用后续参数传参；
bind 是返回对应函数，便于稍后调用；apply 、call 则是立即调用 。

## 语法

### [Object](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Object)
#### prototype

向对象添加属性或方法


### [立即执行函数](http://www.cnblogs.com/TomXu/archive/2011/12/31/2289423.html)

匿名闭包

```
(function () {
    // ... 所有的变量和function都在这里声明，并且作用域也只能在这个匿名闭包里
    // ...但是这里的代码依然可以访问外部全局的对象
}());
```

匿名函数有了自己的作用域或“闭包”。 这允许我们从父（全局）命名空间隐藏变量.这种方法的好处在于，你可以在函数内部使用局部变量，而不会意外覆盖同名全局变量，但仍然能够访问到全局变量

匿名闭包函数传入全局变量。这种方法的好处是可以预先声明好全局变量，让你的代码更加清晰可读。

## &&

`A && B`

```JS
如果 A 成立返回 B，如果 A 不成立返回 A

```


#### 作用

* 防止对象或者变量的覆盖
* 解决闭包冲突
* 模拟单例

### [Module模式](http://www.cnblogs.com/TomXu/archive/2011/12/30/2288372.html)

变量作用域已分模块，不需要再用 立即执行函数 了

## DOM事件流（event  flow)

* 事件捕获（event  capturing）：通俗的理解就是，当鼠标点击或者触发dom事件时，浏览器会从根节点开始由外到内进行事件传播，即点击了子元素，如果父元素通过事件捕获方式注册了对应的事件的话，会先触发父元素绑定的事件。
* 事件冒泡（dubbed  bubbling）：与事件捕获恰恰相反，事件冒泡顺序是由内到外进行事件传播，直到根节点。

```js
addEventListener(event, listener, useCapture)　　

·参数定义：event---（事件名称，如click，不带on，listener---事件监听函数，useCapture---是否采用事件捕获进行事件捕捉，默认为false，即采用事件冒泡方式
```
