# Questions

## Q1: This version of Android Studio is incompatible with the Gradle Plugin used. Try disabling Instant Run(or updating either the IDE or the Gradle plugin to the latest version)

`Android Studio > Preferences > Build,Execution,Deployment > Instant Run > 取消勾选所有`

## Q2: com.android.server.job.controllers.JobStatus.getUid()-->NullPointerException

<https://issuetracker.google.com/issues/37018640> Android 系统 Bug。

解决方法：

```java
Change:
    public boolean onStartJob(JobParameters params) {
        Log.i(TAG, "ON START JOB: " + params.getJobId());
        jobFinished(params, false);
        return false;
    }

to :
public boolean onStartJob(JobParameters params) {
        Log.i(TAG, "ON START JOB: " + params.getJobId());
        return false;
    }

or:
public boolean onStartJob(JobParameters params) {
        Log.i(TAG, "ON START JOB: " + params.getJobId());
        jobFinished(params, false);
        return true;
    }
```

## Q3: Fatal Exception: java.lang.IllegalArgumentException: pointerIndex out of range

## Q4: A problem occurred starting process 'command 'node'

因为没找到 `/usr/local/bin/node`，所以手动创建

```sh
$ command -v node
/Users/bell/.nvm/versions/node/v8.9.1/bin/node
$ ln -s /Users/bell/.nvm/versions/node/v8.9.1/bin/node /usr/local/bin/node
```

## Q5: gradle sync failed caused: java.lang.NullPointerException

File -> Invalidate Caches / Restart -> Invalidate and Restart
Build -> Clean Project

## Q6: ParseError at [row,col]:[1,1] Message: 前言中不允许有内容。

`./gradlew app:shrinkReleaseRes` 可能报如下错：

```java
* What went wrong:
Execution failed for task ':app:shrinkShimoReleaseRes'.
> Multiple task action failures occurred:
   > A failure occurred while executing com.android.build.gradle.internal.transforms.ShrinkProtoResourcesAction
      > ParseError at [row,col]:[1,1]
        Message: 前言中不允许有内容。
```

参考 [SAX Error – Content is not allowed in prolog](https://mkyong.com/java/sax-error-content-is-not-allowed-in-prolog/) 出现这个问题的原因有两个

### 1. XML 文件最前面带有非 < 字符

### 2. XML 编码方式为 UTF-8 With BOM

参考 [Elegant way to search for UTF-8 files with BOM?](https://stackoverflow.com/questions/204765/elegant-way-to-search-for-utf-8-files-with-bom) 在 Mac 上执行

```bash
find . -name "*.xml" |while read file;do [ "`head -c3 -- "$file"`" == $'\xef\xbb\xbf' ] && echo "found BOM in: $file";done
```

找出所有 `UTF-8 with BOM` 编码的 XML 文件，然后用 vscode 转成 UTF-8 编码

1. 点击对应文件点击右下角的 `UTF-8 with BOM`
2. 选择 `Save with Encoding`
3. 选择 `UTF-8`
