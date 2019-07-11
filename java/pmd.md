# PMD

## 安装

### gradle

gradle 配置参考

* [Gradle 插件](https://docs.gradle.org/current/userguide/pmd_plugin.html)
* [pmdMain pmdTest pmdSourceSet 任务配置](https://docs.gradle.org/current/dsl/org.gradle.api.plugins.quality.Pmd.html)
* [pmd 任务配置](https://docs.gradle.org/current/dsl/org.gradle.api.plugins.quality.PmdExtension.html)

```groovy
apply plugin: 'pmd'

pmd {
    toolVersion = "6.16.0"
    ruleSets = [] // Remove built-in rule sets，必须有，否则 ruleSet.xml 有些规划无法生效
    ruleSetFiles file("${project.rootDir}/config/pmd/ruleset.xml")
}

pmdMain {
    source = 'src/main/java'
    excludes = [
            "**/*.kt",
            "**/package/example/*.java",
            "**/FileExample.java"
    ]
}

pmdTest {
    source = 'src/test/java'
    excludes = ["**/*.kt"]
}
```

### 规则

参考文档 [PMD 官方文档](https://pmd.github.io/pmd-6.16.0/)

```xml
<?xml version="1.0"?>

<ruleset name="Shimo PMD Rules"
         xmlns="http://pmd.sourceforge.net/ruleset/2.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://pmd.sourceforge.net/ruleset/2.0.0 https://pmd.sourceforge.io/ruleset_2_0_0.xsd">

    <description>
        Shimo PMD Rules
    </description>

    <!-- Your rules will come here -->

    <rule ref="category/java/errorprone.xml">
        <exclude name="DataflowAnomalyAnalysis"/>
        <exclude name="NonStaticInitializer"/>
        <exclude name="BeanMembersShouldSerialize"/>
        <exclude name="AvoidLiteralsInIfCondition"/>
        <exclude name="AvoidDuplicateLiterals"/>
        <exclude name="NullAssignment"/>
        <exclude name="CloseResource"/>
        <exclude name="ConstructorCallsOverridableMethod"/>
        <exclude name="AvoidBranchingStatementAsLastInLoop"/>
        <exclude name="AvoidFieldNameMatchingMethodName"/>
        <exclude name="SimpleDateFormatNeedsLocale"/>
    </rule>

    <rule ref="category/java/codestyle.xml">
        <exclude name="MethodArgumentCouldBeFinal"/>
        <exclude name="FieldNamingConventions"/>
        <exclude name="OnlyOneReturn"/>
        <exclude name="LocalVariableCouldBeFinal"/>
        <exclude name="UseUnderscoresInNumericLiterals"/>
        <exclude name="LongVariable"/>
        <exclude name="CommentDefaultAccessModifier"/>
        <exclude name="ShortVariable"/>
        <exclude name="ConfusingTernary"/>
        <exclude name="ClassNamingConventions"/>
        <exclude name="DontImportJavaLang"/>
        <exclude name="UnnecessaryConstructor"/>
        <exclude name="EmptyMethodInAbstractClassShouldBeAbstract"/>
        <exclude name="AtLeastOneConstructor"/>
        <exclude name="UselessParentheses"/>
        <exclude name="LocalVariableNamingConventions"/>
        <exclude name="PackageCase"/>
        <exclude name="TooManyStaticImports"/>
        <exclude name="PrematureDeclaration"/>
        <exclude name="UseDiamondOperator"/>
        <exclude name="LinguisticNaming"/>
    </rule>

    <rule ref="category/java/codestyle.xml/ShortClassName">
        <properties>
            <property name="minimum" value="3"/>
        </properties>
    </rule>

    <rule ref="category/java/codestyle.xml/ShortMethodName">
        <properties>
            <property name="minimum" value="3"/>
        </properties>
    </rule>

    <rule ref="category/java/codestyle.xml/FieldDeclarationsShouldBeAtStartOfClass">
        <properties>
            <property name="ignoreEnumDeclarations" value="true" />
            <property name="ignoreAnonymousClassDeclarations" value="true" />
            <property name="ignoreInterfaceDeclarations" value="true" />
        </properties>
    </rule>

</ruleset>
```

### 安装 IDEA 插件

安装：

```
IntelliJ IDEA > Preferences > Plugins > Marketplace > 搜索 PMDPlugin > Install
```

垃圾。不支持 exclude 文件，也不能查看 gradle 生成的文件。

## 使用

### 生成报告

只检查 pmd main

```bash
$ ./gradlew pmdMain
```

检查所有的

```bash
$ ./gradlew check
```

报告文件目录： `build/reports/pmd/main.html`

## References

* [GitHub](https://github.com/pmd/pmd)
* [Documentation](https://pmd.github.io/latest/)
