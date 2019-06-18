# 本地通知

## AlarmManager

全局定时器（又称为闹钟），在特定的时刻为我们广播一个指定的Intent

## Notification


## Intent

Intent是一个意图，一个描述了想要启动一个Activity、Broadcast或是Service的意图。

## PendingIntent

PendingIntent可以认为是对Intent的包装，实际上就是，供当前App或之外的其他App调用，而常见的是供外部App使用，外部App执行这个 PendingIntent时，间接地调用里面的Intent,即外部App延时执行PendingIntent中描述的Intent及其最终行为

## References

* [AlarmManager+Notification实现定时通知提醒功能](https://www.jianshu.com/p/fdb4e8c009b7)
