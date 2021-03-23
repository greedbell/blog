# Jenkins Q&A

## No valid crumb was included in the request

### Q1

Gitlab web hook 的时候提示 `No valid crumb was included in the request`

A:

* <https://github.com/jenkinsci/jenkins/commit/37111bf12e5038fcd240bbefb3aa9474e45585c2>
* <https://wiki.jenkins-ci.org/display/JENKINS/Remote+access+API>
* <http://doc.gitlab.com/ee/integration/jenkins.html>

Jenkins 的 Post 请求必须带 crumb。或者关闭 jenkins 的 防止跨站点请求

`Jenkins > 系统管理 > Configure Global Security > 取消勾选 防止跨站点请求伪造`

#### Q2

```
unknown error -1=ffffffffffffffff
```

参考 <https://www.jianshu.com/p/b03e59560d31>，codesign 命令需要进行签名的时候，会访问 keychain 来获取打包脚本中对应的证书。通过 ssh 这种方式访问的时候，是没有访问权限的。需要运行如下命令来获得访问权限：

```sh
$ security list-keychains
    "/Users/Shared/Jenkins/Library/Keychains/login.keychain-db"
    "/Library/Keychains/System.keychain"
$ security unlock -p <password> ~/Library/Keychains/login.keychain-db
```

补充：由于这个解锁并不是永久的，所以每次在执行打包脚本时，必须先执行解锁命令后执行打包脚本。

#### Q3

```
Xcode couldn't find any iOS App Development provisioning profiles matching
```

Xcode 可以自动选择描述文件进行签名，Jenkins 命令行没法实现，需要把 code sign 改成手动模式。或者可以切换到 jenkins 用户，Xcode 打开工程 > target > general > Signing 自动管理签名


#### Q4

```
ERROR: Timeout after 10 minutes
```

Git clone 超时，解决办法参考 https://stackoverflow.com/a/22661553

```
Edit your job configuration, and under git plugin section:

* Click "Add"
* Click "Advanced clone behaviours"
* Set the number of minutes you want in "Timeout (in minutes) for clone and fetch operation"

I recommend checking also the "shallow clone" option. It fetches only the last state of the repository (without the history), so it's much faster.
```
