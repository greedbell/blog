# iOS框架设计

因为各个模块都是分不同组开发，最后用pod整合。
模块间的跳转都是由一个路由控制
对复杂的table使用工厂
脚本啥也挺多的，自动化打包啥

把跳转逻辑写在每个模块的总代理，注册在客户端的壳中，由路由进行派发，客户端其实就是壳，然后由pod组成

头文件什么的都可以不暴露在vc

普遍使用MVVM
