# Sonatype Nexus Repository Manager

创建本地Maven仓库。使用的时候如果本地库没有就会从远程库找，找到后再更新到本地.

* [官方文档](http://books.sonatype.com/nexus-book/reference/index.html)

## 安装

* <https://hub.docker.com/r/sonatype/nexus/>

这里采用 docker 方式安装。docker-nexus 已经包含了 maven 和 jdk，所以只需参考下面的方式安装就可以。

```shell
# docker pull sonatype/nexus:latest
# docker run -d -p 8081:8081 --name nexus sonatype/nexus:latest
```

## 访问

<http://localhost:8081>

* `Central` 对应 <http://jcenter.bintray.com/>
* `3d party` 对应本地`thirdparty`目录下的
* `Apache Snapshots` 对应 <https://repository.apache.org/snapshots/>
* `Releases` 对应本地`releases`目录下的

## 同步索引

1. Repositories > Central > Configuration > 修改Download Remote Indexes项的值为True > save

2. 右键点击Central，弹出菜单中点击Repair Index。Repair Index过程可能较慢，等待一会儿，进度可以通过 `Administration > Logging > log` 查看。

## 定时更新索引

1. Administration > Scheduled Tasks > Add
2. 任务类型选择：Update Repositories Index，Repository/Group选择要更新的仓库，Recurrence选择计划任务的周期类型

## Reference

* [Maven 使用Nexus创建私服](http://my.oschina.net/cloudcoder/blog/179055)
* [Nexus私服使Maven更加强大](http://blog.csdn.net/liujiahan629629/article/details/39272321)
