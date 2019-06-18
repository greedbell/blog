# 发布 Android 库

发布到 jCenter 和 Maven

## jar or aar

* .jar：只包含了class文件与清单文件，不包含资源文件，如图片等所有res中的文件。
* .aar：包含所有资源，class以及res资源文件全部包含

如果你只是一个简单的类库那么使用生成的*.jar文件即可；如果你的是一个UI库，包含一些自己写的控件布局文件以及字体等资源文件那么就只能使用*.aar文件。

## Javadoc

* [javadoc task ](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.javadoc.Javadoc.html)
* [jar task](https://docs.gradle.org/current/dsl/org.gradle.api.tasks.bundling.Jar.html)

## 发布到 [jCenter](https://bintray.com/)

[bintray](https://bintray.com/) 注册账号 > 创建 repo > SET ME UP! > Deploying with Gradle > Uploading > Deploying with Gradle

* [gradle-bintray-plugin](https://github.com/bintray/gradle-bintray-plugin)
* [gradle-bintray-plugin-examples](https://github.com/bintray/bintray-examples/tree/master/gradle-bintray-plugin-examples)

## 发布到 [MavenCentral](http://central.sonatype.org/)

* [Maven Central requirements](http://central.sonatype.org/pages/requirements.html)
* [Maven Central Producers](http://central.sonatype.org/pages/producers.html)
* [Deploying to OSSRH with Gradle](http://central.sonatype.org/pages/gradle.html

### [Sonatype OSSRH](https://oss.sonatype.org)

> Sonatype's Open Source Software Repository Hosting

Sonatype OSSRH使用Nexus 为开源项目提供仓库管理服务，该仓库就是所谓maven的中央仓库，OSSRH允许我们向Maven中央仓库提交二进制文件。

1. 提交(deploy)开发版本的二进制文件（snapshorts)
2. 阶段性的发布版本
3. 发布一个release,然后同步他们到中央仓库。

### 申请权限

1. [sonatype](https://issues.sonatype.org/secure/Dashboard.jspa) 注册账号
2. [sonatype](https://issues.sonatype.org/secure/Dashboard.jspa) 创建 Project 为 `Community Support - Open Source Project Repository Hosting` 的 issue， 状态变更为 `RESOLVED` 才可以提交包

### GPG 签名

[GnuPG Download](https://www.gnupg.org/download/index.html) 下载
* [signing](https://docs.gradle.org/current/userguide/signing_plugin.html)
* [Working with PGP Signatures](http://central.sonatype.org/pages/working-with-pgp-signatures.html)


1. 生成密钥 `gpg --gen-key`
2. 查看公钥 `gpg --list-keys` ,`pub   2048R/` 后 8 们为 `signing.keyId`
3. 查看私钥 `gpg --list-secret-keys` ,`signing.secretKeyRingFile`的值取私钥路径
4. 上传公钥 `gpg --keyserver hkp://pool.sks-keyservers.net --send-keys <signing.keyId>` 上传的公钥用来验证发布时的文件
5. 输出公钥 `gpg -a --export your-email@your-mailbox.com > public_key_sender.asc`
6. 输出私钥 `gpg -a --export-secret-key your-email@your-mailbox.com > private_key_sender.asc`

### build.gradle

参考 <http://central.sonatype.org/pages/gradle.html>

### 发布

```
gradle uploadArchives
```

发布成功后参考 [release](http://central.sonatype.org/pages/releasing-the-deployment.html) 从 [stagingRepositories](https://oss.sonatype.org/#stagingRepositories) 可以找到上传的包，勾选 > Close > Release 发布到 [Maven Central Repository ](https://oss.sonatype.org/content/repositories/releases/)

## Questions

* Could not upload to 'https://*****.pom': HTTP/1.1 400 Bad Request [message:Unable to upload files: Maven group, artifact or version defined in the pom file do not match the file path '****.pom']

> 这个问题一般都是你的module的名字和你在project.properties
配置的artifactId不一致导致的，手动配置 artifactId 解决

```
version = PROJ_VERSION
group = PROJ_GROUP
archivesBaseName = PROJ_NAME
```

## Reference

* [How to distribute your own Android library through jCenter and Maven Central from Android Studio](https://inthecheesefactory.com/blog/how-to-upload-library-to-jcenter-maven-central-as-dependency/en)
* [如何使用Android Studio把自己的Android library分享到jCenter和Maven Central](http://jcodecraeer.com/a/anzhuokaifa/androidkaifa/2015/0623/3097.html)
* [拥抱 Android Studio 之四：Maven 仓库使用与私有仓库搭建](http://www.androidchina.net/4354.html)
* [向maven中央仓库提交jar](http://www.cnblogs.com/gaoxing/p/4359795.html)
