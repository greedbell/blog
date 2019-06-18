# Questions



<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [Questions](#questions)
	* [Q1: This version of Android Studio is incompatible with the Gradle Plugin used. Try disabling Instant Run(or updating either the IDE or the Gradle plugin to the latest version)](#q1-this-version-of-android-studio-is-incompatible-with-the-gradle-plugin-used-try-disabling-instant-runor-updating-either-the-ide-or-the-gradle-plugin-to-the-latest-version)
	* [Q2: com.android.server.job.controllers.JobStatus.getUid()-->NullPointerException](#q2-comandroidserverjobcontrollersjobstatusgetuid-nullpointerexception)
	* [Q3: Fatal Exception: java.lang.IllegalArgumentException: pointerIndex out of range](#q3-fatal-exception-javalangillegalargumentexception-pointerindex-out-of-range)
	* [Q4: A problem occurred starting process 'command 'node'](#q4-a-problem-occurred-starting-process-command-node)
	* [Q5: gradle sync failed caused: java.lang.NullPointerException](#q5-gradle-sync-failed-caused-javalangnullpointerexception)

<!-- /code_chunk_output -->


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
