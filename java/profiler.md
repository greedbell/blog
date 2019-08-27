# Profiler

性能分析器

## JDK 监控和故障处理工具

* jps 显示指定系统内所有的 HotSpot 虚拟机进程
* jstat 收集 HotSpot 虚拟机各方面的运行数据
* jinfo 显示虚拟机配置信息
* jmap 生成虚拟机的内存转储快照（heapdump 文件）
* jhat 用于分析 headpdump 文件，可以用更强大的 VisualVM 替代
* jstack 显示虚拟机的线程快照

## JConsole

```
jconsole
```

## VisualVM

自带的

```
jvisualvm
```

Debug 断点的时候无法抽样，可以用 sleep() 代替。

## JProfiler

## dump

先获取进度 ID

```
# ps -ef | grep java
root         1     0  1 19:32 ?        00:00:31 /usr/local/java/jre/bin/java
```

### heap dump：

JDK 自带工具 `jmap`

```
jmap -dump:format=b,file=heap.hprof 1
```

### thread dump：

JDK 自带工具 `jstack`

```
jstack 1 > thread.txt
```

## remote

jstatd

* [jstatd - Virtual Machine jstat Daemon](https://docs.oracle.com/javase/7/docs/technotes/tools/share/jstatd.html)

## jstack

内存 dump 到本地

```
jstack <pid> > memory.dump
```

## JetBrains JVM Debugger Memory View plugin

IntelliJ IDEA 自带的 JVM 调试器

## References

* [Top 5 Java Profilers Revealed: Real world data with VisualVM, JProfiler, Java Mission Control, YourKit and Custom tooling.](https://zeroturnaround.com/rebellabs/top-5-java-profilers-revealed-real-world-data-with-visualvm-jprofiler-java-mission-control-yourkit-and-custom-tooling/)
