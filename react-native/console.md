# Console 实现原理

## JS

* [console.js] global.console > getNativeLogFunction > global.nativeLoggingHook

## iOS

* [JSCExecutorFactory.cpp] createJSExecutor > bindNativeLogger
* [RCTLog.mm] _RCTLogJavaScriptInternal -- 判断日志等级 RCTGetLogThreshold() --> RCTGetLocalLogFunction > RCTGetLogFunction

## Android

* [OnLoad.cpp] installBindings > bindNativeLogger > [JSCLogging.cpp] reactAndroidLoggingHook

### RCTLog.mm

打印日志函数

```
RCTLogFunction RCTDefaultLogFunction = ^(
  RCTLogLevel level,
  __unused RCTLogSource source,
  NSString *fileName,
  NSNumber *lineNumber,
  NSString *message
)
{
  NSString *log = RCTFormatLog([NSDate date], level, fileName, lineNumber, message);
  fprintf(stderr, "%s\n", log.UTF8String);
  fflush(stderr);
};
```

### RCTAssert.m

assert 会抛异常

```
void RCTFatal(NSError *error)
{
  @throw [[NSException alloc]  initWithName:name reason:message userInfo:userInfo];
}
```


## JS

JS

iOS
