# VisualVM

## 线程状态

* NEW: 新建
* RUNNABLE: 可运行
* BLOCKED: 阻塞: synchronized 或者 Object.wait()
* WAITING: 无限期等待: Object.wait(),Thread.join(),LockSupport.park()
* TIMED_WAITING: 限期等待
* TERMINATED: 结束

## VisualVM 状态

* 运行: RUNNABLE
* 休眠: TIMED_WAITING (sleeping)
* 等待: WAITING (on object monitor): 状态是在等待一段时间 或者 唤醒动作的发生，进入“等待”状态是主动的
* 驻留: WAITING (parking)、TIMED_WAITING (parking):
* 监视: BLOCKED (on object monitor):
