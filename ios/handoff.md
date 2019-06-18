# Handoff

## Mac 浏览器打开手机 App 上的 URL

创建一个 NSUserActivity，activityType 设为自己 App 的 Bundle ID，webpageURL 设为需要 mac 浏览器打开的 URL。mac 上如果没有对应 Bundle ID 的 App，则使用默认浏览器打开

eg:

```objc
NSUserActivity* myActivity = [[NSUserActivity alloc]
                  initWithActivityType: @"com.company.myapp"];

myActivity.webpageURL = [NSURL URLWithString:@"http://www.google.co.uk"];
```

## References

* [Handoff Programming Guide](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/Handoff/HandoffFundamentals/HandoffFundamentals.html)
* [How does one do a Native App to Web Browser Handoff?](https://stackoverflow.com/a/26260016/6283925)
* [react-native-handoff](https://github.com/IzaakSultan/react-native-handoff)
* [使用“连续互通”连接 Mac、iPhone、iPad、iPod touch 和 Apple Watch](https://support.apple.com/zh-cn/HT204681)
