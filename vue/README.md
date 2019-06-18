# Vue.js

* [GitHub](https://github.com/vuejs/vue)
* [官网](https://cn.vuejs.org/)
* [官方文档](https://cn.vuejs.org/v2/guide/)

* [webpack-simple](https://github.com/vuejs-templates/webpack-simple) Vue 使用 webpack 简单例子
* [vue-webpack-boilerplate](https://github.com/vuejs-templates/webpack) Vue 使用 webpack 例子
* [vue-webpack-boilerplate 文档](http://vuejs-templates.github.io/webpack/)
* [vue-cli](https://github.com/vuejs/vue-cli) Vue 命令行工具
* [vue-devtools](https://github.com/vuejs/vue-devtools) Vue 开发工具
* [vue-router](https://github.com/vuejs/vue-router) Vue 路由
* [vuex](https://github.com/vuejs/vuex) 状态管理
* [vue-server-renderer](https://www.npmjs.com/package/vue-server-renderer) 服务端渲染
* [element-ui](https://github.com/ElemeFE/element) 后台组件库
* [vue-strap](https://github.com/yuche/vue-strap) 桌面 UI 组件
* [vux](https://github.com/airyland/vux) 移动端UI组件库
* ~~[vue-resource](https://github.com/pagekit/vue-resource) 网络请求~~
* [axios](https://github.com/mzabriskie/axios) 网络请求
* <https://medium.com/the-vue-point/retiring-vue-resource-871a82880af4#.4mzjlwaij>

## 安装

```sh
# 全局安装 vue-cli
$ npm install --global vue-cli
# 创建一个基于 webpack 模板的新项目
$ vue init webpack my-project
# 安装依赖，走你
$ cd my-project
$ npm install
$ npm run dev
```

## IDE

* WebStorm 安装 VUE 插件

## styles

* [ 在Vue工作流中使用CSS Modules](https://segmentfault.com/a/1190000007468604)

Vue-loader在v9.8.0之后加入了对CSS Modules的支持。

## 语法

### v-bind

类似于用 v-bind 绑定 HTML 特性到一个表达式，也可以用 v-bind 动态绑定 props 的值到父组件的数据中。每当父组件的数据变化时，该变化也会传导给子组件：

v-bind: 可缩写为 :

### 计算属性 Methods Watched-Property

* 计算属性: 只有在它的相关依赖发生改变时才会重新取值,更好的方式是
* method: 每当重新渲染的时候，method 调用总会执行函数,只有纯粹的数据逻辑，而不是去处理 DOM 事件细节
* watch: 通常更好的办法是使用计算属性而不是一个命令式的 $watch 回调
* 事件修饰符: 处理 DOM 事件细节

### [v-if vs v-show](https://cn.vuejs.org/v2/guide/conditional.html#v-if-vs-v-show)

* v-if 是真实的条件渲染，因为它会确保条件块在切换当中适当地销毁与重建条件块内的事件监听器和子组件。
* v-show 简单得多——元素始终被编译并保留，只是简单地基于 CSS 切换。

v-if 有更高的切换消耗而 v-show 有更高的初始渲染消耗。因此，如果需要频繁切换使用 v-show 较好，如果在运行时条件不大可能改变则使用 v-if 较好。

### 组件

Vue 组件的 API 来自三部分

* Props 允许外部环境传递数据给组件
* Events 允许组件触发外部环境的副作用
* Slots 允许外部环境将额外的内容组合在组件中。

组件需要的一切都是通过上下文传递，包括：

* props: 提供props 的对象
* children: VNode 子节点的数组
* slots: slots 对象
* data: 传递给组件的 data 对象
* parent: 对父组件的引用

### [过渡效果概述](https://cn.vuejs.org/v2/guide/transitions.html#%E6%A6%82%E8%BF%B0)

* v-enter: 定义进入过渡的开始状态。在元素被插入时生效，在下一个帧移除。
* v-enter-active: 定义进入过渡的结束状态。在元素被插入时生效，在 transition/animation 完成之后移除。
* v-leave: 定义离开过渡的开始状态。在离开过渡被触发时生效，在下一个帧移除。
* v-leave-active: 定义离开过渡的结束状态。在离开过渡被触发时生效，在 transition/animation 完成之后移除。

## References

* [随心DevOps前端之三：使用element-UI构建vuejs通用模板（顶部、左侧导航）](https://zhuanlan.zhihu.com/p/24649773)
* [10 Best Vue.js based UI Frameworks for Building Mobile Apps](https://superdevresources.com/vuejs-mobile-frameworks/)
