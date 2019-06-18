# Gradle 使用

## gradle.properties

* 关联对象类型:

配置环境变量

* [Chapter 11. The Build Environment](https://docs.gradle.org/current/userguide/build_environment.html)

## local.properties

* 存放的是各插件需要的本机相关的信息, 例如 Android gradle 插件可能需要 SDK 路径, NDK 路径, 别的插件需要的可能就是其他配置信息.
* 存放敏感数据, 例如某些插件需要 用户名, 密码, api_key 等, 与隐私相关的数据.

```
Properties properties = new Properties()
properties.load(project.rootProject.file('local.properties').newDataInputStream())
def ndkdir = properties.getProperty('ndk.dir', null)
```

## settings.gradle

引入各个 Project 或 Module

## build.gradle

编译配置

* [Chapter 23. Dependency Management](https://docs.gradle.org/current/userguide/dependency_management.html)

## 统一依赖版本号

参考 [Blacklisting a particular version with a replacement](https://docs.gradle.org/4.4.1/userguide/dependency_management.html#sec:blacklisting_version)

```DSL
configurations.all {
    resolutionStrategy.eachDependency { DependencyResolveDetails details ->
        if (details.requested.group == 'org.software' && details.requested.name == 'some-library') {
            //prefer different version which contains some necessary fixes
            details.useVersion '1.2.1'
        }
    }
}
```

## gradle 命令

编译不 lint，不测试

```sh
./gradlew build -x lint -x test
```

刷新依赖

```bash
./gradlew build --refresh-dependencies
```

## test

* [Testing in Java & JVM projects](https://docs.gradle.org/current/userguide/java_testing.html)

```sh
 ./gradlew test -Dtest.single=MyTestClass -Dtest.debug
```

### test with debug

```bash
./gradle test --no-daemon -Dorg.gradle.debug=true -Dtest.single=MyTestClass -Dtest.debug

./gradle test --no-daemon -Dorg.gradle.debug=true -Dtest.single=PivotTableImportTest.testGetExcelData -Dtest.debug
```

## Reference

* [Gradle脚本基础全攻略](http://blog.csdn.net/yanbober/article/details/49314255)
