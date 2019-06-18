# Q&A

## TypeError: Cannot convert object to primitive value

当 object 不是字符串时
```js
console.log("string" + object);
```

改成

```js
console.log(object);
```

## 文件路径

* [浅析 NodeJs 的几种文件路径](https://github.com/imsobear/blog/issues/48)

只有在 `require()` 时才使用相对路径(./, ../) 的写法，其他地方一律使用绝对路径，如下：

```js
// 当前目录下
path.dirname(__filename) + '/test.js';
// 相邻目录下
path.resolve(__dirname, '../lib/common.js');
```

## Not compatible with your operating system or architecture: fsevents

Since `fsevents` is an API in OS X allows applications to register for notifications of changes to a given directory tree. Running:

`npm install --no-optional`

* <http://stackoverflow.com/questions/36725181/not-compatible-with-your-operating-system-or-architecture-fsevents1-0-11>
