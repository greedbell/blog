# Activity 四种启动模式

## standard

应用内，每次打开 Activity 都新建一个 Activity

* 用于可以打开多个的 Activity
* 用于 MainActivity，这样每次通过桌面打开应用不会重新新建一个 Activity

## singleTop

应用内，如果 Activity 在任务栈栈顶，直接打开，不重新创建

多用于打开 App，但不做任何处理

## singleTask

应用内和多应用之间，如果 Activity 在任务栈中，把该 Activity 顶部的所有 Activity 移除。

## singleInstance

应用内和多应用之间，开启新的栈，使用同一个 Activity

## 用例

singleTask 和 singleInstance 多用于接受其它 App 打开的 Activity，也就是 `android:exported="true"` 的 Activity，这样不会从任务列表看到多个任务栈

* MainActivity: standard
* FirstActivity: standard
* ShareReceiverActivity: singleInstance | singleTask

## References
