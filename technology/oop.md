# 面向对象编程

* [wiki](https://zh.wikipedia.org/wiki/%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E7%A8%8B%E5%BA%8F%E8%AE%BE%E8%AE%A1)
* [面向对象六大原则](http://blog.csdn.net/bboyfeiyu/article/details/50103471)

面向对象程序设计（英语：Object-oriented programming，缩写：OOP）

## 特征

* 分享非面向对象程序前身语言
  * 变量
  * 程序
* 类与对象
  * 类(Class)
  * 对象(Object)
* 动态配置与消息传递机制
  * 动态配置（dynamic dispatch）是指方法会随着实例动态的改变
  * 消息传递机制（Message Passing）是指一个对象通过接受消息、处理消息、传出消息或使用其他类的方法来实现一定功能
* 封装性（Encapsulation）
* 继承（Inheritance）
* 多态（Polymorphism）
* 抽象性（Abstraction

## 原则

* 优化代码的第一步——单一职责原则

> 单一职责原则的英文名称是Single Responsibility Principle，简称SRP。它的定义是：就一个类而言，应该仅有一个引起它变化的原因。简单来说，一个类中应该是一组相关性很高的函数、数据的封装。

* 让程序更稳定、更灵活——开闭原则

> 开闭原则的英文全称是Open Close Principle，简称OCP。开闭原则的定义是：软件中的对象（类、模块、函数等）应该对于扩展是开放的，但是，对于修改是封闭的。

* 构建扩展性更好的系统——里氏替换原则

> 里氏替换原则英文全称是Liskov Substitution Principle，简称LSP。只要父类能出现的地方子类就可以出现，而且替换为子类也不会产生任何错误或异常

* 让项目拥有变化的能力——依赖倒置原则

> 依赖倒置原则英文全称是Dependence Inversion Principle，简称DIP。
> * 高层模块不应该依赖低层模块，两者都应该依赖其抽象；
> * 抽象不应该依赖细节；
> * 细节应该依赖抽象。

* 系统有更高的灵活性——接口隔离原则

> 接口隔离原则英文全称是InterfaceSegregation Principles，简称ISP。它的定义是：客户端不应该依赖它不需要的接口。

* 更好的可扩展性——迪米特原则

> 迪米特原则英文全称为Law of Demeter，简称LOD，也称为最少知识原则（Least Knowledge Principle）。一个对象应该对其他对象有最少的了解。

Bob大叔（Robert C Martin）在21世纪早期将单一职责、开闭原则、里氏替换、接口隔离以及依赖倒置（也称为依赖反转）5个原则定义为SOLID原则，指代了面向对象编程的5个基本原则。

在应用开发过程中，最难的不是完成应用的开发工作，而是在后续的升级、维护过程中让应用系统能够拥抱变化。拥抱变化也就意味着在满足需求且不破坏系统稳定性的前提下保持`高可扩展性、高内聚、低耦合`，在经历了各版本的变更之后依然保持`清晰、灵活、稳定`的系统架构。当然，这是一个比较理想的情况，但我们必须要朝着这个方向去努力，那么遵循面向对象六大原则就是我们走向灵活软件之路所迈出的第一步。
