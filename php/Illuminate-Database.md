# Illuminate Database

* [GitHub](https://github.com/illuminate/database)
* [文档](https://laravel.com/docs/5.3/eloquent)
* [中文文档](https://laravel-china.org/docs/5.3/eloquent)

* [运行原生 SQL 语句](https://laravel-china.org/docs/5.3/database#running-queries)

## Connection

连接数据库和操作数据库

```PHP
Illuminate\Database\Connection
```

## Scope

范围，相当于 sql 语句中加 where 约束

* [Query Scopes](https://laravel.com/docs/5.3/eloquent#query-scopes)

```PHP
Illuminate\Database\Eloquent\Scope
```

## Model

模型

* [Eloquent: Mutators](https://laravel.com/docs/5.3/eloquent-mutators)
* [Eloquent: Serialization](https://laravel.com/docs/5.3/eloquent-serialization)

```PHP
\Illuminate\Database\Eloquent\Model
```

### SoftDeletes

如果需要软删除功能，Model 添加

```PHP
/**
 * 使用软删除
 */
use SoftDeletes;

/**
 * 以时间的方式存储的字段.
 *
 * @var array
 */
protected $dates = ['deleted_at'];

/**
 * 用时间戳形式存储时间.
 *
 * @var string
 */
protected $dateFormat = 'U';
```

## Builder

拼装 sql 语句并执行

```PHP
\Illuminate\Database\Query\Builder
```

* `getModel()` 获取模型

## Collection

Builder select 的结果

```PHP
\Illuminate\Database\Eloquent\Collection
```

* [Eloquent: Collections](https://laravel.com/docs/5.3/eloquent-collections)

## 错误

### MassAssignmentException

* [Mass Assignment](https://laravel.com/docs/5.3/eloquent#mass-assignment)

laravel保护我们不能直接插入记录。比如，在一些特殊情况下我们需要直接利用表单的信息填充数据库记录，但是如果我们并没有在表单中添加密码字段，而黑客产生了密码字段连同我们的其他字段一起送回服务器，这将产生修改密码的危险，所以我们必须明确的告诉laravel我们的模型那些字段是可以直接填充的。

```PHP
protected $fillable = [
    'title',
    'body',
    'published_at'
];
```

表示，title, body, published_at 是可以直接填充的。
