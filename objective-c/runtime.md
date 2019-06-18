# runtime

## Method

### class_copyMethodList

拷贝类的所有方法

* 不会取父类的方法

### method_getTypeEncoding

获取方法的返回值和参数类型

* [Type Encodings](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html)

### NSMethodSignature

```
SEL selector = method_getName(method);
NSMethodSignature *signature = [class instanceMethodSignatureForSelector:selector];

NSUInteger numberOfArguments = [signature numberOfArguments];

for (int i=0 ; i<numberOfArguments ; i++)
{
    // 参数类型
    NSString *type = [NSString stringWithUTF8String:[signature getArgumentTypeAtIndex:i]];
    NSLog(@"type:%@", type);
}
```
