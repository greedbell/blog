# travis

* <https://github.com/travis-ci/travis-ci>

## CLI安装

* <https://github.com/travis-ci/travis.rb>

```shell
$ gem install travis
```

## 登录

```shell
$ travis login
```

## 验证`.travis.yml`合法性

```shell
$ travis lint
```

## 加密

* <https://docs.travis-ci.com/user/encryption-keys/>

## 添加环境变量

* <https://docs.travis-ci.com/user/environment-variables/>

## 添加`git push`权限

* <http://scurker.com/automated-deploys-with-travis/>
* <https://zespia.tw/blog/2015/01/21/continuous-deployment-to-github-with-travis/>

### 生成`SSH Key`

```shell
$ cd ~/.ssh
$ ssh-keygen -t rsa -C "bell@greedlab.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/bell/.ssh/id_rsa): ssh_key
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ssh_key.
Your public key has been saved in ssh_key.pub.
```

## 进入仓库本地目录

## 公钥加到仓库

把`ssh_key.pub`添加到`GreedBell/blog > Settings > Deploy keys > add deploy key`

## 加密私钥

```shell
$ travis encrypt-file ~/.ssh/ssh_key --add -r GreedBell/blog
```

## 修改`.travis.yml`

* 把`-out ssh_key`改为`-out ~/.ssh/id_rsa`

* 修改`id_rsa`权限

```
- chmod 600 ~/.ssh/id_rsa
```

* 设置用户

```
git config user.email "bell@greedlab.com"
git config user.name "Bell"
```
