# spotbugs

参考 [The FindBugs Plugin](https://docs.gradle.org/current/userguide/findbugs_plugin.html)，FindBugs 将不支持 java9、Gradle 6.0，使用 SpotBugs 替代

## 安装

参考 [official Gradle Plugin page](https://plugins.gradle.org/plugin/com.github.spotbugs) 插入

```groovy
plugins {
  id "com.github.spotbugs" version "1.6.9"
}
```

到 `build.gradle`

[注意] 文章编辑日只有 1.6.9 版本可以使用，更高版本会报 `Could not create an instance of type com.github.spotbugs.internal.spotbugs.SpotBugsExecutor.` 错误

### 配置

参考 [configure-gradle-plugin](https://spotbugs.readthedocs.io/en/stable/gradle.html#configure-gradle-plugin)

```groovy
spotbugs {
    toolVersion = "3.1.12"
    sourceSets = [sourceSets.main]
    ignoreFailures = true
    reportsDir = file("$project.buildDir/spotbugsReports")
    effort = "max"
    reportLevel = "high"
    visitors = ["FindSqlInjection", "SwitchFallthrough"]
    omitVisitors = ["FindNonShortCircuit"]
    includeFilter = file("$rootProject.projectDir/config/spotbugs/includeFilter.xml")
    excludeFilter = file("$rootProject.projectDir/config/spotbugs/excludeFilter.xml")
}
```

进行配置

#### Filter

* [Chapter 8. Filter Files](http://findbugs.sourceforge.net/manual/filter.html)

### 安装 IDEA 插件

```
IntelliJ IDEA > Preferences > Plugins > Marketplace > 搜索 FindBugs-IDEA > Install
```

`FindBugs-IDEA` 插件支持 SpotBugs

## 使用

### 生成报告

只检查 spotbugs main

```bash
$ ./gradlew spotbugsMain
```

检查所有的

```bash
$ ./gradlew check
```

报告文件目录： `build/spotbugsReports/main.xml`

#### IDEA 查看报告

```
IDEA 下方 FindBugs-IDEA > 导入按钮（Import previous saved Bug Collection > 选择刚刚生成的报告文件
```

## References

* [GitHub](https://github.com/spotbugs/spotbugs)
* [官方文档](https://spotbugs.readthedocs.io/en/stable/)
* [official Gradle Plugin page](https://plugins.gradle.org/plugin/com.github.spotbugs)
