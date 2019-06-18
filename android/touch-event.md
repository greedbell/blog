# 触摸事件处理

## TouchEvent

* `public boolean dispatchTouchEvent(MotionEvent ev)` 这个方法用来分发TouchEvent， 返回值：true 时继续接受动作序列中的后续事件，如move、up
* `public boolean onInterceptHoverEvent(MotionEvent ev)` 用来拦截事件的，如果返回值为true，表示拦截，事件会传递到自己的`onTouchEvent()`。否则不拦截。
* `public boolean onTouchEvent(MotionEvent ev)` 的传递层级是由子视图向父视图，通常用作事件处理。如果返回值为true表示消耗该事件。否则无法再接收同一个序列的事件。

同一个序列的事件是：DOWN事件－－》多个MOVE事件－－》UP事件。

## References

* [消息分发知识基础](http://www.cnblogs.com/ghj1976/archive/2012/04/13/2445561.html)
* [Android中TouchEvent触摸事件机制](http://blog.csdn.net/iispring/article/details/50364126)

## MotionEvent

* getPointerCount()：返回MotionEvent中表示了多少手指数
getPointerId(int pointerIndex)： 返回指针索引关联的指针ID
* getX(int pointerIndex)和getY(int pointerIndex)：由这两个函数获得的x,y值是相对的坐标值，相对于消费这个事件的视图的左上点的坐标。
* getRawX(int pointerIndex)和getRawY(int pointerIndex):有这两个函数获得的x,y值是绝对坐标，是相对于屏幕的。
* getHistorySize():返回某跟手指触摸事件的历史位置的记录数，只有在 ACTION_MOVE 中有效，其它为 0
* getHistoricalX (int pointerIndex, int pos)：返回指定指针索引的手指上一次的X坐标位置，只针对移动事件。参数pos是指第几个旧位置，这个值不能超过getHistorySize()返回的值
* getHistoricalY (int pointerIndex, int pos)：返回指定指针索引的手指上一次的Y坐标位置，只针对移动事件。参数pos是指第几个旧位置，这个值不能超过getHistorySize()返回的值

### 动作序列的三个事件

TouchEvent 分三种事件:down、move、up。

move事件的一个操作是由down到up的动作序列

如果Down事件不归你处理，那这个动作序列的move，up也不归你处理

### References

* [Android MotionEvent详解](http://www.jianshu.com/p/0c863bbde8eb)
