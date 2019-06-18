# 搜索

## sphinx

c++开发,简单高性能

## Apache Lucene

java开发,包括solr和elasticsearch

Lucene更像是一个SDK。 有完整的API族以及对应的实现。你可以利用这些在自己的应用里实现高级查询（基于倒排索引技术的）

## solr

Solr是一个有HTTP接口的基于Lucene的查询服务器

* [官网](http://lucene.apache.org/solr/)
* [Apache Solr Reference Guide](https://cwiki.apache.org/confluence/display/solr/Apache+Solr+Reference+Guide)
* [Solr参考指南](https://two8g.gitbooks.io/solr-reference-guide/content/)

### 数据同步 DIH

* DIH全量同步(全表数据)（一般做第一次数据同步）
* DIH增量同步(新增数据)（常用模式）

参考

* [solr系列3——solr数据同步(全量、增量)](http://www.jianshu.com/p/c0b06643a467)
* [Data Import Request Handler](https://wiki.apache.org/solr/DataImportHandler)
* [Uploading Structured Data Store Data with the Data Import Handler](https://cwiki.apache.org/confluence/display/solr/Uploading+Structured+Data+Store+Data+with+the+Data+Import+Handler)

#### 局部更新

* [Updating Parts of Documents](https://cwiki.apache.org/confluence/display/solr/Updating+Parts+of+Documents)

## ElasticSearch

基于Lucene这个非常成熟的索引方案

* [Elasticsearch 权威指南](http://www.learnes.net/)
* [Mastering Elasticsearch(中文版)](http://udn.yyuap.com/doc/mastering-elasticsearch/index.html)

### 数据库同步到 ES 问题

用 river 同步到 ES

* [MongoDB 数据自动同步到 ElasticSearch](https://segmentfault.com/a/1190000003773614)
* [River](https://www.elastic.co/blog/the-river)
* [elasticsearch-river-mongodb](https://github.com/richardwilly98/elasticsearch-river-mongodb)
* [elasticsearch-jdbc](https://github.com/jprante/elasticsearch-jdbc)

## Reference

* [使用 Apache Lucene 和 Solr 4 实现下一代搜索和分析](https://www.ibm.com/developerworks/cn/java/j-solr-lucene/)
* [开源搜索引擎评估:lucene sphinx elasticsearch](http://lutaf.com/158.htm)
* [Elasticsearch与Solr](http://i.zhcy.tk/blog/elasticsearchyu-solr/)
* [Apache Solr vs Elasticsearch](http://solr-vs-elasticsearch.com/)
