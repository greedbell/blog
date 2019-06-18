# Mongoose

node.js mongodb 库

## Built-in Promises

* <http://mongoosejs.com/docs/promises.html>
* <http://stackoverflow.com/questions/38138445/node3341-deprecationwarning-mongoose-mpromise>

mongoose 默认返回的是 [mpromise](https://github.com/aheckmann/mpromise), mongoose推荐使用原生的 `global.Promise` 或者第三方的promise,例如： `require('bluebird')`

## 自定义 `_id`

```
var Post = new mongoose.Schema({
    _id: Number,
    title: String,
    content: String,
    tags: [ String ]
});
```

OR

```
var Post = new mongoose.Schema({
    title: String,
    content: String,
    tags: [ String ]
}, { _id: false });
```

## array to json

> lean()

```
Collection.find().lean();
```
