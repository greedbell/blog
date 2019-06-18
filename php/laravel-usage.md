# laravel 使用

<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [laravel 使用](#laravel-使用)
  * [架构分析](#架构分析)
    * [服务容器 (Service Container)](#服务容器-service-container)
    * [服务提供者 (Service Providers)](#服务提供者-service-providers)
    * [容器接口(Facades)](#容器接口facades)
      * [原理](#原理)
    * [接口契约(Contracts)](#接口契约contracts)
    * [路由](#路由)
    * [中间件](#中间件)
  * [References](#references)

<!-- tocstop -->

## 架构分析

### 服务容器 (Service Container)

```PHP
Illuminate\Foundation\Application extends Illuminate\Container\Container
```

* IoC(Inversion of Control) 是面向对象编程中的一种设计原则
* DI(Dependency Injection) IoC 的一种实现

IoC 容器

Laravel 服务容器是管理类依赖和运行依赖注入的有力工具。依赖注入是一个花俏的名词，它实质上是指：类的依赖通过构造器或在某些情况下通过「setter」方法进行「注入」。

* bind 方法创建实例不是单例模式，而是创建新的实例。
* singleton 创建实例使用的是单例模式，每次返回同一个实例。
* instance 绑定一个已经存在的对象至容器中,后面的调用都会从容器中返回指定的实例
* 绑定初始数据

singleton方法其实也是调用bind方法，只是最后一个参数是true，表示单例模式。

### 服务提供者 (Service Providers)

```PHP
Illuminate\Support\ServiceProvider
```

往容器里边注入依赖

### 容器接口(Facades)

```PHP
Illuminate\Support\Facades\*
```

为应用程序的 服务容器 中可用的类提供了一个「静态」接口

> 在开发第三方扩展包时，如果需要使用和 Laravel 交互的扩展包，最好是注入 Laravel contracts 而不是使用 facades，因为扩展包不是在 Laravel 内部使用的，无法使用 Laravel 的 facades 的测试辅助函数。

#### 原理

`Facade` 类利用了 `__callStatic()` 这个魔术方法来延迟调用容器中的对象的方法。

### 接口契约(Contracts)

```PHP
Illuminate\Contracts\*
```

是一组定义了框架核心服务的接口

> Laravel 的 facades 提供一个简单的方法来使用服务，而不需要使用类型约束和在服务容器之外解析 contracts。大多数情况下，每个 facade 都有一个相应的 contract。

### 路由

* 对应 facade `\Illuminate\Support\Facades\Route`
* 对应 Contract `\Illuminate\Routing\Router`

### 中间件

```PHP
App\Http\Middleware
```

## References

* [解释清楚Laravel的Service Container, Service Provider，Contracts和Facade之间的关系](http://laravelbase.com/show/79)
* [依赖注入与控制反转的PHP实现](http://www.xiaomlove.com/2015/05/11/%E4%BE%9D%E8%B5%96%E6%B3%A8%E5%85%A5%E4%B8%8E%E6%8E%A7%E5%88%B6%E5%8F%8D%E8%BD%AC%E7%9A%84php%E5%AE%9E%E7%8E%B0/)
* [再看控制反转(IoC)容器与依赖注入](http://www.xiaomlove.com/2016/03/27/have-a-look-at-inversion-of-control-container-and-the-dependency-injection-again/)
