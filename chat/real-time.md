# 实时聊天的实现

用 websocket 就可以了吧,如果不用 php 做后端的话，最简单的方案就是用 socket.io,或者架一个 mqtt 协议的服务器,现在http 的话新的方法就是基于 websocket 的,不用 http 的话可以考虑 mqtt 协议,http 长连接/websocket 方案用 swoole 或者 socket.io 都可以实现，mqtt 协议就找个 mqtt 服务器端来改，客户端有相应的 mqtt 库

## php

用`websocket`。`Swoole` ， `Workerman` 可实现websocket,swoole需要编译，虚拟机上没法实现，Workerman需要php cli

Workerman <https://github.com/walkor/Workerman>
php

ape <http://ape-project.org/>
C,编译不了

socketo <https://github.com/ratchetphp/Ratchet>
php

### php+websocket

php有可用的websocket库，不需要php-fpm。
目前比较成熟的有swoole（swoole.com），和workman（workman.net）
swoole是c写的php扩展， 效率比nodejs还要高，workman是纯php实现，两者都号称可以实现并发百万TCP连接。

## 非php

` socket.io` ,`mqtt`

### socket.io

* 服务器

基于 Node.js 实现

<http://socket.io/>

* 客户端

自动使用 WebSocket、轮循

<http://socket.io/docs/faq/>

### SockJS

只有js版

## 总结

socket.io
