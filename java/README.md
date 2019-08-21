# Java

* [教程](http://www.runoob.com/java/java-tutorial.html)

## 编码规范

* [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
* [Google Java编程风格指南](http://www.hawstein.com/posts/google-java-style.html) 《Google Java Style Guide》翻译
* [Google Java编程风格规范](https://jervyshi.gitbooks.io/google-java-styleguide-zh/content/)
* [Style guides for Google-originated open-source projects ](https://github.com/google/styleguide)
* [java-code-styles](https://github.com/square/java-code-styles)

## 书籍推荐

* 《Effective java 中文版（第2版）》 java 78 条值得注意的地方
* 《Java编程思想(第4版)》
* 《JAVA 2核心技术卷II：高级特性(原书第7版)》
* 《Java Web开发详解--XML+XSLT+Servlet+JSP深入剖析与实例应用》

## 在线教程

* [IBM Java 编程入门](https://www.ibm.com/developerworks/cn/java/intro-to-java-course/index.html)

## java分三个方向

* J2ME,嵌入式设备，安卓就是目前最大的J2ME平台，不过其使用的不是JVM，而是谷歌自己开发的虚拟机
* J2SE，桌面编程，基本没落，需要JVM支持
* J2EE，web方向的编程

## Java修饰符

类

|  | 类内部	| 本包 | 子类 | 外部包 |
| :---: | :---: | :---: | :---: | :---: |
| public | √ | √ | √ | √ |
| protected | √ | √ | √	| × |
| no modifier | √ | √ | × | × |
| private | √ | × | × | × |

方法

|  | 类内部	| 本包 | 子类 | 外部包 |
| :---: | :---: | :---: | :---: | :---: |
| public | √ | √ | √ | √ |
| protected | √ | √ | √	| × |
| no modifier | √ | √ | × | × |
| private | √ | × | × | × |

`no modifier` = `package-private`，不加修饰语

## Java变量

* `局部变量`：在方法、构造方法或者语句块中定义的变量被称为局部变量。变量声明和初始化都是在方法中，方法结束后，变量就会自动销毁。
* `成员变量`：成员变量是定义在类中，方法体之外的变量。这种变量在创建对象的时候实例化。成员变量可以被类中方法、构造方法和特定类的语句块访问。
* `类变量`：类变量也声明在类中，方法体之外，但必须声明为static类型。

## 继承关键字

### extends 关键字

 extends 只能继承一个类

### implements 关键字

可以同时继承多个接口（接口跟接口之间采用逗号分隔）

## final static

* [ Java关键字final、static使用总结 ](http://lavasoft.blog.51cto.com/62575/18771)

### final

* final 类不能被继承，没有子类，final类中的方法默认是final的。
* final 方法不能被子类的方法覆盖，但可以被继承。
* final 成员变量表示常量，只能被赋值一次，赋值后值不再改变。
* final 不能用于修饰构造方法。
* 注意：父类的private成员方法是不能被子类方法覆盖的，因此private类型的方法默认是final类型的。

### static

static 表示不要实例化就可以使用

* 被static修饰的成员变量和成员方法独立于该类的任何对象。
* 用public修饰的static成员变量和成员方法本质是全局变量和全局方法，当声明它类的对象时，不生成static变量的副本，而是类的所有实例共享同一个static变量。

## Java 集合框架

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

数组与链表的区别：
数组固定的长度顺序存储。如果想删除一个元素，同样需要移动大量元素去填掉被移动的元素。如果应用需要快速访问数据，很少或不插入和删除元素，就应该用数组。
链表中的元素在内存中不是顺序存储的，而是通过存在元素中的指针联系到一起。如果要访问链表中一个元素，需要从第一个元素开始，一直找到需要的元素位置。但是增加和删除一个元素对于链表数据结构就非常简单了，只要修改元素中的指针就可以了。

所以如果除了在末尾外不能在其他位置插入或者删除元素，那么ArrayList效率更高，如果需要经常插入或者删除元素，就选择LinkedList。

### Map

参考 [Initialize a HashMap in Java](https://www.baeldung.com/java-initialize-hashmap)

#### size 为 0 或 1 不可变

```java
// size 为 0
Collections.emptyMap();
// size 为 0
Collections.singletonMap("Key", "value");
```

#### 其它情况

使用 Guava，`ImmutableMap.of` 有长度限制

```java
// 不可变 Map
ImmutableMap.of("Title", "My New Article", "Title2", "Second Article");
// 可变 Map
Maps.newHashMap(ImmutableMap.of("Title", "My New Article", "Title2", "Second Article"))
```

### List


## JSON to java bean

* [jsonschema2pojo](http://www.jsonschema2pojo.org/)
* [sodhanalibrary](http://pojo.sodhanalibrary.com/)

## 嵌套类

* 静态成员类：非内部类，最好当作普通类
* 非静态成员类：内部类，
* 匿名类：内部类，
* 局部类：内部类，

## 泛型

## 通配符的使用

* [Java 泛型总结（三）：通配符的使用](https://segmentfault.com/a/1190000005337789)

### 上边界限定通配符

```java
class Fruit {}
class Apple extends Fruit {}

// 使用通配符 flist 可以放 Fruit 和其子类。
List<? extends Fruit> flist = new ArrayList<Apple>();

// 这行会报 Compile Error: can’t add any type of object: 错
// 使用通配符失去了向这个 List 添加任何对象的能力
flist.add(new Apple());
```

### 下边界限定通配符

* 生产者用 `<? extends T>`
* 消费者用 `<? super T>`


```java
public class Collections {
  public static <T> void copy(List<? super T> dest, List<? extends T> src)
  {
      for (int i=0; i<src.size(); i++)
        dest.set(i,src.get(i));
  }
}
```

### 无边界通配符

`List<?> list` 表示 list 是持有某种特定类型的 List，但是不知道具体是哪种类型。那么我们可以向其中添加对象吗？当然不可以，因为并不知道实际是哪种类型，所以不能添加任何类型，这是不安全的。

## 引用

Java中存在四种引用，它们由强到弱依次是：强引用、软引用、弱引用、虚引用。下面我们简单介绍下除弱引用外的其他三种引用：

* 强引用（Strong Reference）：通常我们通过new来创建一个新对象时返回的引用就是一个强引用，若一个对象通过一系列强引用可到达，它就是强可达的(strongly reachable)，那么它就不被回收
* 软引用（Soft Reference）：软引用和弱引用的区别在于，若一个对象是弱引用可达，无论当前内存是否充足它都会被回收，而软引用可达的对象在内存不充足时才会被回收，因此软引用要比弱引用“强”一些
* 弱引用(Weak Reference)：弱引用对象的存在不会阻止它所指向的对象变被垃圾回收器回收。弱引用最常见的用途是实现规范映射(canonicalizing mappings，比如哈希表）。
* 虚引用（Phantom Reference）：虚引用是Java中最弱的引用，那么它弱到什么程度呢？它是如此脆弱以至于我们通过虚引用甚至无法获取到被引用的对象，虚引用存在的唯一作用就是当它指向的对象被回收后，虚引用本身会被加入到引用队列中，用作记录它指向的对象已被销毁。

## 注解

* [深入理解Java注解类型(@Annotation)](https://blog.csdn.net/javazejian/article/details/71860633)
* [深入浅出Java注解](https://www.jianshu.com/p/5cac4cb9be54)

### 注解的作用

* 格式检查：告诉编译器信息，比如被@Override标记的方法如果不是父类的某个方法，IDE会报错；
* 减少配置：运行时动态处理，得到注解信息，实现代替配置文件的功能；
* 减少重复工作：比如第三方框架xUtils，通过注解@ViewInject减少对findViewById的调用，类似的还有（JUnit、ActiveAndroid等）；

### 注解的申明

```java
// @Target(ElementType.METHOD) 申请注解只能用在 方法
@Target(ElementType.METHOD)
// @Retention(RetentionPolicy.RUNTIME) 表示该注解生存期是运行时
@Retention(RetentionPolicy.RUNTIME)
// @interface Test 声明了 Test 注解
public @interface Test {

}
```

## 重载与重写

* `override` 重写、覆盖，替换父类的方法
* `overload` 重载，方法名相同，但是参数类型或数量不同

## 常量、注解和枚举

* 纯常量场景：常量只是作为全局配置数据使用；
* 分组常量场景：归属于同一分组的常量；
* 分组且存在对应关系的常量场景：常量归属于同一分组，且另一方面常量之间存在对应关系。

参考 [优先使用注解，慎用枚举](https://blog.csdn.net/My_TrueLove/article/details/70519234) 枚举性能很差，所以优先使用枚举

## JavaDoc

* [Javadoc Tool](https://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html)
* [How to Write Doc Comments for the Javadoc Tool](https://www.oracle.com/technetwork/articles/java/index-137868.html)

## IOC

控制反转

## DI

依赖注入（Dependency Injection）

依赖注入(DI)和控制反转(IOC)是从不同的角度的描述的同一件事情，就是指通过引入IOC容器，利用依赖关系注入的方式，实现对象之间的解耦

## AOP

面向切面编程
