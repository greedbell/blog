# 远程推送

## UIApplicationDelegate

```objc
/*
App 未启动的时候，点击推送消息启动 App，launchOptions 会带推送信息。
*/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0);
```

```objc
/*
* App 在后台的时候，点击推送消息调用。
* App 在前台的时候，收到推送调用。
*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_DEPRECATED_IOS(3_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate willPresentNotification:withCompletionHandler:] or -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:] for user visible notifications and -[UIApplicationDelegate application:didReceiveRemoteNotification:fetchCompletionHandler:] for silent remote notifications");
```

```objc
/*
未开启 remote-notification 时：
* App 未启动的时候，点击推送消息启动 App 时调用
* App 在后台的时候，点击推送消息调用。
* App 在前台的时候，收到推送调用。

开启 remote-notification 时：
* 不管 App 有没有启动，只要有推送消息过来都会调用
*/
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler NS_AVAILABLE_IOS(7_0);
```

## UNUserNotificationCenterDelegate

```objc
/*
App 在前台的时候，有推送消息过来时调用。
* 如果 delegate 没有实现该方法，会弹系统默认的弹框
* 如果 delegate 实现了该方法，不会弹系统默认的弹框
*/
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0) __TVOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0);
```

```objc
/*
不管 App 有没有启动，点击推送消息时调用。
@注意 UNUserNotificationCenterDelegate 必须在 application:didFinishLaunchingWithOptions: return 之前注册。
*/
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler __IOS_AVAILABLE(10.0) __WATCHOS_AVAILABLE(3.0) __TVOS_PROHIBITED;
```
