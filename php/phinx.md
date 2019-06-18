# phinx

数据迁移填充工具

* [GitHub](https://github.com/robmorgan/phinx)
* [官网](https://phinx.org/)
* [官方文档](http://docs.phinx.org/en/latest/)

## Column Types

[Valid Column Types](http://docs.phinx.org/en/latest/migrations.html#valid-column-types)

* biginteger
* binary
* boolean
* date 日期
* datetime 日期时间
* decimal
* float
* integer 默认 int(11)
* string
* text
* time 时间
* timestamp 时间戳
* uuid

MySQL 还支持 enum, set, blob, json (json MySQL 5.7 及以上支持)

## questions

### 清除 `phinx status` 记录

参考 <https://github.com/robmorgan/phinx/issues/206>

* check your database for a table called phinxlog.
* remove the ** MISSING ** columns.
