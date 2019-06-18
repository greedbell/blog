# UI测试

* [官方文档](http://masilotti.com/xctest-documentation/index.html)

## 系统通知

都用`addUIInterruptionMonitorWithDescription`来实现

```objc

    XCUIApplication *app = [[XCUIApplication alloc] init];

    // 定位
    [self addUIInterruptionMonitorWithDescription:@"Location Dialog" handler:^BOOL(XCUIElement * _Nonnull interruptingElement) {
        XCUIElement *button = interruptingElement.buttons[@"Allow"];
        if ([button exists]) {
            [button tap];
            return YES;
        }
        return NO;
    }];

    // 通知
    [self addUIInterruptionMonitorWithDescription:@"User Notifications" handler:^BOOL(XCUIElement * _Nonnull interruptingElement) {
        XCUIElement *button = interruptingElement.buttons[@"OK"];
        if ([button exists]) {
            [button tap];
            return YES;
        }
        return NO;
    }];
```

## Q1:自动录制的中文报错

> 输出的中文都是unicode编码的,`\U`需要改成`\u`才能用

## Q2: UI Testing Failure - Failure getting list of active applications: AX error -25205

> <https://forums.developer.apple.com/thread/20611> 重启Xcode好了

## Reference

* <http://mdsa.51cto.com/art/201507/485053.htm>
* <http://masilotti.com/ui-testing-xcode-7/>
