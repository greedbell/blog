# Lombok

* [GitHub](https://github.com/rzwitserloot/lombok)
* [官网](https://projectlombok.org/)

## 安装

### Gradle

参考 <https://projectlombok.org/setup/gradle>

```
repositories {
	mavenCentral()
}

dependencies {
	compileOnly 'org.projectlombok:lombok:1.18.8'
	annotationProcessor 'org.projectlombok:lombok:1.18.8'
}
```

### IDEA 插件

参考 <https://projectlombok.org/setup/intellij> 安装插件

* Go to File > Settings > Plugins
* Click on Browse repositories...
* Search for Lombok Plugin
* Click on Install plugin
* Restart IntelliJ IDEA

参考 [Setting up Lombok with Eclipse and Intellij](https://www.baeldung.com/lombok-ide) 配置插件

需要 `Settings > Build > Compiler > Annotation Processors` 开启 `Annotation Processing`
