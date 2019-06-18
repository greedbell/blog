# 循环引用

是否会引起循环引用你只要看函数内部是否copy了这个block就知道了,如果没有copy 使用完就释放了 是不会造成循环引用的.

## FBRetainCycleDetector
循环引用次数计算工具：[FBRetainCycleDetector](https://github.com/facebook/FBRetainCycleDetector)

## ARC 计算引用次数

```
id obj = [[NSObject alloc]init];
printf("retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(obj)));
```

需要注意的是，这里要用__bridge来转换，如果用__bridge_retained来转换的话，实际上，生成了一个Core Foundation对象，并且retain了一次原来的Objective-C对象，造成引用计数比真实值大一。

## weak

### weak & strong

* `@weakify` 相当于 `__weak __typeof(self)self_weak_ = self`
* `@strongify(self)`  相当于 `__strong typeof(self) self = self_weak_;`

```objc
__weak __typeof__(self) weakSelf = self;
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [weakSelf doSomething];
    [weakSelf doOtherThing];
});
```

在doSomething中，weakSelf不会变成nil，不过在doSomething执行完成，调用第二个方法doOtherThing的时候，weakSelf有可能被释放。

### dispatch_async 的 block 里面需要 `__weak self` 吗

参考 <https://github.com/ibireme/YYKit/issues/41>

dispatch_async 官方文档说明：

* @param block
* The block to submit to the target dispatch queue. This function performs
* Block_copy() and Block_release() on behalf of callers.
* The result of passing NULL in this parameter is undefined.

block参数系统会自动调用copy，保证self不被释放，在block执行结束后会release。所以没必要传__weak self。 如果传__weak self，就无法保证block在执行时，self是否被释放，反而会出现错误。所以不能传__weak self。

## Other

block 里面加 strong 会在 block 结束后 retain count 减一，是因为 block 是在一个 runloop 里面，结束后 autoreleasepool 会清空

## Reference

* <http://blog.reigndesign.com/blog/debugging-retain-cycles-in-objective-c-four-likely-culprits/>
* <https://www.bignerdranch.com/blog/actually-finding-a-memory-management-error-with-instruments/>
