# 集合

参考 [Java - 集合框架完全解析](http://www.jianshu.com/p/63e76826e852)

* Collection接口：处理对象集合的根接口
   * List：允许重复的有序集合
       * ArrayList：用数组存储元素，这个数组可以动态创建
       * LinkedList：链表中存储元素
   * Set：不包含重复的元素
       * HashSet
       * LinkedHashSet
       * TreeSet
   * Queue：先进先出的数据结构，元素在队列末尾添加，在队列头部删除。
* Map接口：存储键值对映射的容器类
   * HashMap：基于哈希表的Map接口的非同步实现
   * TreeMap: 基于红黑树的 Map，key 排序

数组与链表的区别：
数组固定的长度顺序存储。如果想删除一个元素，同样需要移动大量元素去填掉被移动的元素。如果应用需要快速访问数据，很少或不插入和删除元素，就应该用数组。
链表中的元素在内存中不是顺序存储的，而是通过存在元素中的指针联系到一起。如果要访问链表中一个元素，需要从第一个元素开始，一直找到需要的元素位置。但是增加和删除一个元素对于链表数据结构就非常简单了，只要修改元素中的指针就可以了。

所以如果除了在末尾外不能在其他位置插入或者删除元素，那么ArrayList效率更高，如果需要经常插入或者删除元素，就选择LinkedList。

## Map

### TreeMap

TreeMap是一个有序的key-value集合，基于红黑树（Red-Black tree）的 NavigableMap实现。

1. TreeMap是根据key进行排序的，它的排序和定位需要依赖比较器或覆写Comparable接口，也因此不需要key覆写hashCode方法和equals方法，就可以排除掉重复的key，而HashMap的key则需要通过覆写hashCode方法和equals方法来确保没有重复的key。
2. TreeMap的查询、插入、删除效率均没有HashMap高，一般只有要对key排序时才使用TreeMap。
3. TreeMap的key不能为null，而HashMap的key可以为null。
4. TreeMap不是同步的。如果多个线程同时访问一个映射，并且其中至少一个线程从结构上修改了该映射，则其必须 外部同步。

#### References

* [java集合系列——Map之TreeMap介绍（九）](https://blog.csdn.net/u010648555/article/details/60476232)
## Queue

### BlockingQueue

放入数据：

* offer(anObject):表示如果可能的话,将anObject加到BlockingQueue里,即如果BlockingQueue可以容纳,
　　　　则返回true,否则返回false.（本方法不阻塞当前执行方法的线程）
* offer(E o, long timeout, TimeUnit unit),可以设定等待的时间，如果在指定的时间内，还不能往队列中
　　　　加入BlockingQueue，则返回失败。
* `put`(anObject):把anObject加到BlockingQueue里,如果BlockQueue没有空间,则调用此方法的线程被阻断
　　　　直到BlockingQueue里面有空间再继续.

获取数据：
* poll(time):取走BlockingQueue里排在首位的对象,若不能立即取出,则可以等time参数规定的时间,
　　　　取不到时返回null;
* poll(long timeout, TimeUnit unit)：从BlockingQueue取出一个队首的对象，如果在指定时间内，
　　　　队列一旦有数据可取，则立即返回队列中的数据。否则知道时间超时还没有数据可取，返回失败。
* `take`():取走BlockingQueue里排在首位的对象,若BlockingQueue为空,阻断进入等待状态直到
　　　　BlockingQueue有新的数据被加入;
* `drainTo`():一次性从BlockingQueue获取所有可用的数据对象（还可以指定获取数据的个数），
　　　　通过该方法，可以提升获取数据效率；不需要多次分批加锁或释放锁。

#### LinkedBlockingQueue

线程安全的阻塞队列，实现了先进先出等特性，是作为生产者消费者的首选

### ConcurrentLinkedQueue

线程安全的非阻塞队列．Queue中元素按FIFO原则进行排序．采用CAS操作，来保证元素的一致性。
