# 增量更新方案

通过最后修改时间dateline来判断是否已更新。如果有更新就重新获取

## 服务端如何获取dateline

所有表添加最后修改时间字段dateline,每次修改或添加项的时候都要对dateline写入最后修改时间。如果有关联表，获取id的dateline的时候取表及需要的关联表dateline的最大值。

## 获取列表

### 列表里的数据不可删除且不可修改

每项加个dateline，客户端请求的时候带上最新的dateline，服务端返回dateline之后新增加的项

### 列表里的数据可变

客户端需要两张表，一张只有id和dateline的列表表(listTable)，当然也可以包含title等简单字段在未加载详情时展示用。另一张包含所有数据的详情表(listDetailTable)。先从服务器获取列表里所有项的id和dateline并存储在listTable，这里不做增量。然后对listTable每一项和listDetailTable对比，如果listDetailTable中没有listTable中id对应的项或者dateline不一致就获取对应id的详情并存储到listDetailTable，否则不做任何处理。这样做有个明显的缺点，就是请求次数过多。可以修改下获取数据详情的接口，客户端带上多个id，服务端返回多个id的详情。

## 获取详情

客户端有张详情表(detailTable)，包含id和dateline在内的所有数据。获取id对应详情的时候，客户端先通过id和dateline向服务器请求数据，服务端对比dateline，如果不一致就返回所有数据，否则则返回一个标致位表示没有更新。


## 相关资料

* <http://blog.cnbang.net/tech/2258/>

## GreedLab原创
