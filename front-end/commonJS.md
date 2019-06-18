# CommonJS

* [官网](http://www.commonjs.org/)

JavaScript 是一种模板规范，NodeJS是这种规范的实现

1. 所有要输出的对象统统挂载在 module.exports 上，然后暴露给外界
2. 通过 require 加载别的模块，require 的返回值就是模块暴露的对象
3. CommonJS 是一个单对象输出，单对象加载的模型
