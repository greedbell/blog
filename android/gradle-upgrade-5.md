# gradle 升级到 5

## 升级

参考 [The Gradle Wrapper](https://docs.gradle.org/current/userguide/gradle_wrapper.html)，运行

```bash
$ gradle wrapper --gradle-version 5.5 --distribution-type all
```

升级到 5.5

## 问题

### 问题 1

```bash
$ ./gradlew  --stacktrace
Caused by: java.lang.NoSuchMethodError: org.gradle.api.tasks.TaskInputs.dir(Ljava/lang/Object;)Lorg/gradle/api/tasks/TaskInputs;
        at org.jetbrains.kotlin.gradle.plugin.KotlinPluginKt.configureJavaTask(KotlinPlugin.kt:667)
```

解决

升级 `kotlin-gradle-plugin` 到最新版
