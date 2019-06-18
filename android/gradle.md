# Gradle

* [官网](https://gradle.org/)
* [官方文档](https://docs.gradle.org/current/userguide/userguide.html)
* [中文文档](http://wiki.jikexueyuan.com/project/gradle/)
* [Gradle Android插件用户指南翻译](http://avatarqing.github.io/Gradle-Plugin-User-Guide-Chinese-Verision/)
* [精通 Groovy](http://www.ibm.com/developerworks/cn/education/java/j-groovy/j-groovy.html)
* [DSL](https://docs.gradle.org/current/dsl/)
* [Android Plugin for Gradle Release Notes](https://developer.android.com/studio/releases/gradle-plugin.html)
* [Gradle vs Maven Feature Comparison](https://gradle.org/maven_vs_gradle/)

* [2.10 版本的官方文档](https://docs.gradle.org/2.10/userguide/userguide.html)

一个基于JVM的构建工具。基于 groovy，其 build 脚本使用 groovy DSL 编写

<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Gradle](#gradle)
  * [安装](#安装)
    * [通过 SDKMAN 安装 gradle](#通过-sdkman-安装-gradle)
    * [Gradle 安装 Gradle Wrapper](#gradle-安装-gradle-wrapper)
    * [通过 Gradle Wrapper 安装 gradle](#通过-gradle-wrapperhttpsdocsgradleorgcurrentuserguidegradle_wrapperhtml-安装-gradle)
    * [从本地安装 Gradle](#从本地安装-gradle)
  * [配置](#配置)
    * [gradle.properties](#gradlepropertieshttpsdocsgradleorgcurrentuserguidebuild_environmenthtmlproperties)
    * [build.gradle](#buildgradlehttpsdocsgradleorgcurrentuserguideartifact_dependencies_tutorialhtml)
      * [repositories](#repositorieshttpsdocsgradleorgcurrentuserguideartifact_dependencies_tutorialhtmln10660)
        * [JCenter](#jcenter)
        * [mavenCentral](#mavencentral)
  * [Maven](#maven)
  * [版本](#版本)
  * [使用](#使用)

<!-- tocstop -->

## 安装

### 通过 SDKMAN 安装 gradle

* [Download Gradle](https://gradle.org/gradle-download/)

```shell
$ curl -s https://get.sdkman.io | bash
$ sdk install gradle 4.9
```

### Gradle 安装 Gradle Wrapper

```sh
gradle wrapper --gradle-version 3.4.1
gradle wrapper --gradle-version 2.14.1
```

或者

配置 `build.gradle`

```DSL
task wrapper(type: Wrapper) {
    gradleVersion = '4.9.0'
}
```

然后运行

```sh
$ gradle wrapper
```

之后用 `./gradlew` 命令来运行 gradle

### 通过 [Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html) 安装 gradle

* <http://stormzhang.com/devtools/2015/01/05/android-studio-tutorial5/>

* 可以使得项目组成员不必预先安装好gradle
* 便于统一项目所使用的gradle版本

在 gradle wrapper 配置好的前提下，运行 `./gradlew` 安装指定版本的 Gradle 到 `~/.gradle/wrapper/dists/`

### 从本地安装 Gradle

 <http://stackoverflow.com/questions/27375807/how-to-reuse-gradle-wrapper>

* 下载 `gradle-2.10-all.zip` 到 `{project.dir}\gradle\wrapper` 目录下
* `{project.dir}\gradle\wrapper\gradle-wrapper.properties` 修改 `distributionUrl=gradle-2.10-all.zip`
* `./gradlew`

## 配置

### [gradle.properties](https://docs.gradle.org/current/userguide/build_environment.html#properties)

属性、常量（如版本号）

### [build.gradle](https://docs.gradle.org/current/userguide/artifact_dependencies_tutorial.html)

构建脚本

#### [repositories](https://docs.gradle.org/current/userguide/artifact_dependencies_tutorial.html#N10660)

##### JCenter

<https://bintray.com/bintray/jcenter>

##### mavenCentral

<http://search.maven.org/>

## Maven

* [Gradle 修改 Maven 仓库地址](http://www.yrom.net/blog/2015/02/07/change-gradle-maven-repo-url/)
* <https://docs.gradle.org/current/userguide/init_scripts.html>

## 版本

gradle 插件版本

```
dependencies {
    classpath 'com.android.tools.build:gradle:2.2.3'
}
```

gradle 版本

`/gradle/wrapper/gradle-wrapper.properties` 的 `distributionUrl=https\://services.gradle.org/distributions/gradle-2.14.1-all.zip`

引用  [Android Plugin for Gradle Release Notes](https://developer.android.com/studio/releases/gradle-plugin.html) 版本对应关系

| Plugin version | 	Required Gradle version |
| :------------- | :------------- |
| 1.0.0 - 1.1.3 | 2.2.1 - 2.3 |
| 1.2.0 - 1.3.1 | 2.2.1 - 2.9 |
| 1.5.0 | 2.2.1 - 2.13 |
| 2.0.0 - 2.1.2 | 2.10 - 2.13 |
| 2.1.3 - 2.2.3 | 2.14.1+ |
| 2.3.0+	| 3.3+ |

## 使用

1. 先保证工程根目录下有 `local.properties`
2. `gradle tasks` 列出所有任务
