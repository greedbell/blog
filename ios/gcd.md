# GCD

## dispatch_suspend/dispatch_resume

在GCD中dispatch_suspend和dispatch_resume提供了“挂起、恢复”队列的功能，简单来说，就是可以暂停、恢复队列上的任务。但是这里的“挂起”，并不能保证可以立即停止队列上正在运行的block，未执行的block会被“挂起”。
