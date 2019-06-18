# NodeJS服务崩溃的解决办法

## 使用uncaughtException

```js
process.on(＇uncaughtException＇, function (err) {
  //打印出错误
  console.log(err);
  //打印出错误的调用栈方便调试
  console.log(err.stack)；
});
```

## 使用 try/catch

```js
var http = require(＇http＇);

http.createServer(function(req, res) {
  try {
    handler(req, res);
  } catch(e) {
    console.log(＇
＇, e, ＇
＇, e.stack);
    try {
      res.end(e.stack);
    } catch(e) { }
  }
}).listen(8080, ＇127.0.0.1＇);

console.log(＇Server running at http://127.0.0.1:8080/＇);

var handler = function (req, res) {
  //Error Popuped
  var name = req.params.name;

  res.writeHead(200, {＇Content-Type＇: ＇text/plain＇});
  res.end(＇Hello ＇ + name);
};
```

这种方案的好处是，可以将错误和调用栈直接输出到当前发生的网页上。

## 守护NodeJS进程和记录错误日志

## 使用shell启动脚本守护node

## reference

<http://www.weste.net/2014/10-20/99529.html>
