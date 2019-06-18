# PHP Mongo

## mongo VS mongodb

### mongo

老的 mongodb 驱动

* [MongoDB](http://php.net/manual/zh/book.mongo.php)
* [mongodb/mongo-php-driver-legacy](https://github.com/mongodb/mongo-php-driver-legacy)

### mongodb

新的 mongodb 驱动，推荐

* [MongoDB driver](http://docs.php.net/manual/zh/set.mongodb.php)
* [mongo-php-library](https://github.com/mongodb/mongo-php-library) 对 `MongoDB driver` 封闭
* [PHP LIBRARY MANUAL](https://docs.mongodb.com/php-library/master/) `mongo-php-library` 的文档


## Mac OS 安装驱动

```sh
brew reinstall --build-from-source php56-mongodb
```

## [mongo-php-library](https://github.com/mongodb/mongo-php-library) 使用

```sh
composer require mongodb/mongodb --ignore-platform-reqs
```

## [MongoDB driver](http://docs.php.net/manual/zh/set.mongodb.php) 使用

* [MongoDB\Driver\Command](http://docs.php.net/manual/zh/class.mongodb-driver-command.php) 对应 [Database Commands](https://docs.mongodb.com/manual/reference/command/)
* [MongoDB\Driver\BulkWrite](http://docs.php.net/manual/zh/class.mongodb-driver-bulkwrite.php) 对应 [Bulk Operation Methods](https://docs.mongodb.com/manual/reference/method/js-bulk/)
