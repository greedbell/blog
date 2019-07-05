# JVM

## GC

垃圾回收策略

### MinorGC

虚拟机在进行minorGC之前会判断老年代最大的可用连续空间是否大于新生代的所有对象总空间

1、如果大于的话，直接执行minorGC

2、如果小于，判断是否开启HandlerPromotionFailure，没有开启直接FullGC

3、如果开启了HanlerPromotionFailure, JVM会判断老年代的最大连续内存空间是否大于历次晋升平均值的大小，如果小于直接执行FullGC

4、如果大于的话，执行minorGC

### FullGC

* 老年代空间不足

 如果创建一个大对象，Eden区域当中放不下这个大对象，会直接保存在老年代当中，如果老年代空间也不足，就会触发Full GC。为了避免这种情况，最好就是不要创建太大的对象。

* 持久代空间不足

如果有持久代空间的话，系统当中需要加载的类，调用的方法很多，同时持久代当中没有足够的空间，就出触发一次Full GC

* YGC出现promotion failure

promotion failure发生在Young GC, 如果Survivor区当中存活对象的年龄达到了设定值，会就将Survivor区当中的对象拷贝到老年代，如果老年代的空间不足，就会发生promotion failure， 接下去就会发生Full GC.

* 统计YGC发生时晋升到老年代的平均总大小大于老年代的空闲空间

  在发生YGC是会判断，是否安全，这里的安全指的是，当前老年代空间可以容纳YGC晋升的对象的平均大小，如果不安全，就不会执行YGC,转而执行FullGC。

* 显示调用System.gc

这里调用了 System.gc  并不一定会立马就触发FullGC
