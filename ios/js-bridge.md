# iOS JS Bridge

## javaScriptCore

* JS 线程安全，所有 JS 任何同步执行。
* 在哪个线程执行 JS，JS 执行的 Native 代码也在对应线程。

### Native > JS

注册 JS 方法

```
JSContext *context;
[self.context evaluateScript:@"module.nativeToJS = () => {};"]
```

OC 调用 JS 注册的方法

```
JSContext *context;
JSValue *module = context[@"module"];
[module invokeMethod:@"nativeToJS" withArguments:@[]];
```

### JS > Native

#### JSExport 方式实现

#### Block 方式实现

注册 Native 回调

```
JSContext *context;
JSValue *module = [JSValue valueWithNewObjectInContext:self.context];
[module setValue:^(id message) {} forProperty:@"jsToNative"];
context[@"module"] = module;
```

JS 调用 Native 注册的方法

```JS
module.jsToNative();
```
