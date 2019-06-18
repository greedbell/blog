# redux

管理 state

* [GitHub](https://github.com/reactjs/redux)
* [官方文档](http://redux.js.org/)
* [中文文档](http://cn.redux.js.org/)

## 安装

```sh
npm install --save redux
```

## React + redux

* [搭配 React](http://cn.redux.js.org/docs/basics/UsageWithReact.html)

```sh
npm install --save react-redux
```

## router

```sh
npm install --save react-router-redux
```

## 说明

### Store

* 整个应用只有一个唯一的 Store
* Store 对应的状态树（State），由调用一个 reducer 函数（root reducer）生成
* 状态树上的每个字段都可以进一步由不同的 reducer 函数生成
* Store 包含了几个方法比如 dispatch, getState 来处理数据流
* Store 的状态树只能由 dispatch(action) 来触发更改

### Redux 的数据流

* action 是一个包含 { type, payload } 的对象
* reducer 函数通过 store.dispatch(action) 触发
* reducer 函数接受 (state, action) 两个参数，返回一个新的 state
* reducer 函数判断 action.type 然后处理对应的 action.payload 数据来更新状态树

所以对于整个应用来说，一个 Store 就对应一个 UI 快照，服务器端渲染就简化成了在服务器端初始化 Store，将 Store 传入应用的根组件，针对根组件调用 renderToString 就将整个应用输出成包含了初始化数据的 HTML。

### Reducer

Store 是由 reducer 产生的，所以 reducer 实际上反映了 Store 的状态树结构

### Action

### Selector

参考 [Reselect](https://github.com/reduxjs/reselect)
