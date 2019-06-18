# 原生模块分析

## iOS 如何实现

`RCTBridgeModule.h` 中定义了

```
#define RCT_EXPORT_MODULE(js_name) \
RCT_EXTERN void RCTRegisterModule(Class); \
+ (NSString *)moduleName { return @#js_name; } \
+ (void)load { RCTRegisterModule(self); }
```

模块 load 时调用 `RCTRegisterModule(self)` 注册模块
