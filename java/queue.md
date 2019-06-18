# Queue

队列

> Collection
>> Set
>>
>> List
>>
>> `Queue`: 队列
>>> `Deque`: 双端队列，在 Queue 接口的基础上增加了一些针对双端添加和删除元素的方法。
>>>
>>> `AbstractQueue`: 非阻塞队列
>>>> `PriorityQueue`: 类实质上维护了一个有序列表。加入到 Queue 中的元素根据它们的天然排序（通过其 java.util.Comparable 实现）或者根据传递给构造函数的 java.util.Comparator 实现来定位。
>>>>
>>>> `ConcurrentLinkedQueue`: 是基于链接节点的、线程安全的队列。并发访问不需要同步。
>>>
>>> `BlockingQueue`: 阻塞队列
>>>>
>>>> `ArrayBlockingQueue` ：一个由数组支持的有界队列。
>>>>
>>>> `LinkedBlockingQueue` ：一个由链接节点支持的可选有界队列。
>>>>
>>>> `PriorityBlockingQueue` ：一个由优先级堆支持的无界优先级队列。
>>>>
>>>> `DelayQueue` ：一个由优先级堆支持的、基于时间的调度队列。
>>>>
>>>> `SynchronousQueue` ：一个利用 BlockingQueue 接口的简单聚集（rendezvous）机制。


## References

* [java队列——queue详细分析](https://www.cnblogs.com/lemon-flm/p/7877898.html)
* [Java集合（七） Queue详解](https://juejin.im/post/5a3763ed51882506a463b740)
