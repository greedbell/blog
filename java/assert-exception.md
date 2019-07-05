# 断言与异常

* 断言是用来检查非法情况而不是错误情况的，用来帮开发者快速定位问题的位置。
* 异常处理用于对程序发生异常情况的处理，增强程序的健壮性和容错性。

## assert

### assert 特性

* assert默认是不启用的
* assert抛出的异常AssertionError是继承自Error的

### 使用 assert 的三种情况

* 在私有方法中放置assert作为输入参数的校验
* 流程控制中不可能达到的区域
* 建立程序探针

## References

* [断言（Assert）与异常（Exception）](https://blog.csdn.net/zhaofuxiang/article/details/53379394)
