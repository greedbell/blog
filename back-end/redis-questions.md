# redis-questions

## hash expire

* <https://github.com/antirez/redis/issues/167>

```
redis 127.0.0.1:6379> hset expire:me name tom
(integer) 0
redis 127.0.0.1:6379> hget expire:me name
"tom"

redis 127.0.0.1:6379> expire expire:me 10
(integer) 1
redis 127.0.0.1:6379> ttl expire:me
(integer) 8

...
...
...

redis 127.0.0.1:6379> ttl expire:me
(integer) -1
redis 127.0.0.1:6379> hget expire:me name
(nil)
```
