# Java 后端技术栈

## 开发框架

* Spring

## 测试框架

* JUnit

## Java Web 容器

* tomcat
* jetty

## 网络

* Netty: 异步网络通信库

### 介绍

本质上是一个 servlet 容器，即可以在其上运行 Java Web 的应用程序

## 消息队列

* kafka
* RabbitMq

## RPC 框架

* dubbo

### 介绍

RPC 是指远程过程调用，也就是说两台服务器A，B，一个应用部署在A服务器上，想要调用B服务器上应用提供的函数/方法，由于不在一个内存空间，不能直接调用，需要通过网络来表达调用的语义和传达调用的数据。

* 核心知识点
  * 注册中心，服务注册、服务发现、负载均衡、序列化、反序列化、编码、解码等核心概念

* 适用场景
  * 在相对复杂的应用服务网络中，扮演服务治理，服务解耦，负责均衡，简化服务调用方式的作用

## 日志

* Log4j
* SLF4J


## References

* [Java后端技术栈梳理](https://zhuanlan.zhihu.com/p/47914139)
