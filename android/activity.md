# Activity



# launchMode

启动模式

* [ 基础总结篇之二：Activity的四种launchMode ](http://blog.csdn.net/liuhe688/article/details/6754323)

## standard

默认的启动模式

每次跳转系统都会在task中生成一个新的FirstActivity实例，并且放于栈结构的顶部，当我们按下后退键时，才能看到原来的FirstActivity实例。

这就是standard启动模式，不管有没有已存在的实例，都生成新的实例。

## singleTop

跳转时系统会先在栈结构中有一个FirstActivity实例且位于栈顶，则不再生成新的，而是直接使用，否则重新生成

## singleTask

如果发现有对应的Activity实例，则使此Activity实例之上的其他Activity实例统统出栈，使此Activity实例成为栈顶对象，显示到幕前。

## singleInstance

启用一个新的栈结构，将Acitvity放置于这个新的栈结构中，并保证不再有其他Activity实例进入。
