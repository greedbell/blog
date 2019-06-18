# mongodb 使用

## [Aggregation](https://docs.mongodb.com/manual/aggregation/)

利用管道串行操作

```
db.patches.aggregate([
  {$match: {project_id: "57bfebadd2dbc1cea6430f8b"}},
  {$group: {_id: "$project_version"}},
  {$sort : {project_version : 1}}
])
```

## 过滤

### [$elemMatch](https://docs.mongodb.com/manual/reference/operator/projection/elemMatch/)

筛选条件

### [$](https://docs.mongodb.com/manual/reference/operator/projection/positional/)

列表中取出第一个满足条件的

### [$slice](https://docs.mongodb.com/manual/reference/operator/projection/slice/)

### [$group](https://docs.mongodb.com/manual/reference/operator/aggregation/group/)

分组

```
db.books.aggregate(
   [
     { $group : { _id : "$author", books: { $push: "$$ROOT" } } }
   ]
)
```

## [update](https://docs.mongodb.com/manual/reference/method/db.collection.update/)

更新操作

### 更新所有

### 只更新传入部分

```
{
     $set: {
       item: "ABC123",
     }
   }
```
