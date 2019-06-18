# fabric

工具集

* [官网](https://get.fabric.io)
* [官方文档](https://docs.fabric.io/)

## digits 短信验证

* [Digits](https://fabric.io/kits/ios/digits/summary)

## Crashlytics 崩溃统计

* [文档](https://docs.fabric.io/apple/crashlytics/overview.html)

### 自定义日志

崩溃的时候可以看到自定义的日志

#### iOS

参考 [Custom Logs](https://docs.fabric.io/apple/crashlytics/enhanced-reports.html?highlight=cls_log#custom-logs)

* `Objective-C` 用 `CLS_LOG`
* `Swift` 用 `CLSLogv`

#### Android

参考 [Custom Logging](https://docs.fabric.io/android/crashlytics/enhanced-reports.html#custom-logging)

* `Crashlytics.log(msg)`
* `Crashlytics.log(int priority, String tag, String msg);`

## retention 留存率

* DAU (Daily Active Users) 日活用户
* WAU (Week Active Users) 周活用户
* MAU (Month Active Users) 月活用户
