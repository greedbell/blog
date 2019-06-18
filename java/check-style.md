# CheckStyle

* [GitHub](https://github.com/checkstyle/checkstyle)
* [官网](https://checkstyle.org/)
* [配置文档](https://checkstyle.org/checks.html)
* [CheckStyle 检查规则中文翻译](https://www.cnblogs.com/huaxingtianxia/p/7059661.html)

## CheckStyle 配置

从 [Checkstyle configuration for 'Google Java Style'](https://github.com/checkstyle/checkstyle/blob/master/src/main/resources/google_checks.xml) 下载 Google Java Style Guide 的 CheckStyle 配置文件，并做一些修改后存储到 `~/shimo-ot-check-style.xml`

## IDEA 安装 CheckStyle-IDEA 插件

安装插件

```
IntelliJ IDEA > Preferences > Plugins: 搜索 CheckStyle-IDEA > Install
```

配置插件

```
IntelliJ IDEA > Preferences > CheckStyle > Configuration File > + > ~/shimo-ot-check-style.xml > OK
```

## Gradle 集成 CheckStyle

* [The Checkstyle Plugin](https://docs.gradle.org/current/userguide/checkstyle_plugin.html)
* [How to add Checkstyle and FindBugs plugins in a gradle based project](https://medium.com/@raveensr/how-to-add-checkstyle-and-findbugs-plugins-in-a-gradle-based-project-51759aa843be)

修改 `build.gradle` 如下：

```
apply plugin: 'checkstyle'
checkstyle {
    toolVersion '7.8.1'
    configFile file("config/checkstyle/checkstyle.xml")
}
checkstyleMain {
    source ='src/main/java'
}
checkstyleTest {
    source ='src/test/java'
}
```

运行 `./gradlew check` 命令时会运行 `checkstyleMain` 和 `checkstyleTest` 两个任务

## git commit 自动运行 CheckStyle
