# Disruptor

* [GitHub](https://github.com/LMAX-Exchange/disruptor)
* [Examples](https://github.com/LMAX-Exchange/disruptor/tree/master/src/test/java/com/lmax/disruptor/example)
* [Document](https://github.com/LMAX-Exchange/disruptor/wiki)

使用 CAS 实现无锁设计

## 核心概念

参考 [Core Concepts](https://github.com/LMAX-Exchange/disruptor/wiki/Introduction#core-concepts)

### 基本概念

#### Ring Buffer

缓冲区，事件存储和更新。

#### Sequence

事件的序号

#### Sequencer

此接口有两个实现类 SingleProducerSequencer、MultiProducerSequencer ，它们定义在生产者和消费者之间快速、正确地传递数据的并发算法。

#### Sequence Barrier

由Sequencer生成，并且包含了已经发布的Sequence的引用，这些的Sequence源于Sequencer和一些独立的消费者的Sequence。它包含了决定是否有供消费者来消费的Event的逻辑。

#### Wait Strategy

等待下一个事件的策略

#### Event

生产者和消费者之间进行交换的数据的事件

### EventHandler 相关的概念

所有生产者和消费者串行或并行处理 每个 Event

#### EventHandler

事件消费者

实现事件处理的逻辑

#### EventProcessor

事件处理器

`BatchEventProcessor`

包含了 event loop 有效的实现，并且将回调到一个 EventHandler 接口的实现对象。

#### Producer

事件消费者

调用 `RingBuffer::publish`，把 `sequence` 标记为可执行

### WorkHandler 相关的概念

每个 Event 只会被一个生产者和消费者使用

#### WorkHandler

Work 消费者

#### WorkProcessor

确保每个 sequence 只被一个 processor 消费，在同一个 WorkPool 中的处理多个 WorkProcessor， 不会消费同样的 sequence。

#### WorkerPool

WorkProcessor 池，其中 WorkProcessor 将消费 Sequence，所有任务可以在实现 WorkHandler 接口的 worker 之间移交。

第一个 Event 只会被生成一次、消费一次

#### LifecycleAware

当 BatchEventProcessor 启动和停止时，实现这个接口用于接收通知。

### ExceptionHandler

## 生产者模式

### SingleProducerSequencer

适用于只有一个 Producer，非线程安全

### MultiProducerSequencer

适用于只有多个 Producer，线程安全，使用 CAS 做了线程安全处理

## RingBuffer Size

生产者插入数据到 RingBuffer 的时候，如果 RingBuffer 已满，就等待 RingBuffer 空间

## WaitStrategy

等待策略

* BlockingWaitStrategy 是最低效的策略，但其对CPU的消耗最小并且在各种不同部署环境中能提供更加一致的性能表现；
* SleepingWaitStrategy 的性能表现跟 BlockingWaitStrategy 差不多，对 CPU 的消耗也类似，但其对生产者线程的影响最小，适合用于异步日志类似的场景；  （spin， then yield，然后sleep(LockSupport.parkNanos(1L))在性能和CPU占用率之间做了平衡。）
* YieldingWaitStrategy 适合用于低延迟的系统。在要求极高性能且事件处理线数小于 CPU 逻辑核心数的场景中，推荐使用此策略；例如，CPU开启超线程的特性。  （使用spin, Thread.yield()方式）
* BusySpinWaitStrategy 这种策略有最高的性能，但也有最高的部署边境限制。这种等待策略应该只用于事件处理者线程小于CPU物理核心数。

## References

* [JAVA并发编程 之 LMAX Disruptor使用实例（高效解决生产者与消费者问题）](https://blog.csdn.net/a78270528/article/details/79925404)
