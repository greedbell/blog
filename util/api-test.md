# 创建客户端测试接口

介绍一些可以迅速创建测试数据供客户端前期开发用的工具。

## 1、json-server

<https://github.com/typicode/json-server>

只可以获取数据，不能从客户端进行删除、更新等操作。

### 安装

```
$ npm install -g json-server
```

### 创建数据

创建 `db.json `,该文件定义了所有的数据。eg:

```JSON
{
  "posts": [
    { "id": 1, "title": "json-server", "author": "typicode" }
  ],
  "comments": [
    { "id": 1, "body": "some comment", "postId": 1 }
  ],
  "profile": { "name": "typicode" }
}
```

### 启动服务

```
$ json-server --watch db.json
```

### 使用

<http://localhost:3000/db>

返回`db.json`定义的所有JSON

<http://localhost:3000/posts>

返回`db.json`定义的`posts `

## 2、lowdb

<https://github.com/typicode/lowdb>

可以进行获取、删除、更新等操作。

利用`JavaScript `工具 [lodash](https://github.com/lodash/lodash) 操作服务器上的数据.

## 3、jsonplaceholder

<https://github.com/typicode/jsonplaceholder>

可以进行获取、删除、更新等操作。
利用 `GET, POST, PUT, PATCH, DELETE` 等来进行获取、添加、更新、删除等操作
默认的数据存储在`/usr/local/lib/node_modules/jsonplaceholder/data.json`

### 安装

```bash
$ npm install -g jsonplaceholder
```

### 启动

```bash
$ jsonplaceholder
```

### 使用

<https://github.com/typicode/jsonplaceholder#how-to>

## 总结

**json-server**