# SVN 客户端使用

* [Subversion 与版本控制的在线主页](http://svnbook.red-bean.com/)
* [Version Control with Subversion 翻译](http://svnbook.red-bean.com/nightly/zh/svn-book.html)


## 命令

* [svn 子命令](http://svnbook.red-bean.com/nightly/zh/svn-book.html#svn.ref.svn.c)

### checkout (co)

从版本库取出一个工作副本

```sh
svn checkout file:///var/svn/repos/test mine
```

### merge

应用两组源文件的差别到工作副本路径

```sh
svn merge --reintegrate \
            http://svn.example.com/repos/calc/branches/my-calc-branch
```

### update (up)

更新你的工作副本

```sh
svn update
```

### add

添加文件, 目录或符号链。

```sh
svn add * --force
```

### commit (ci)

将修改从工作副本发送到版本库

```sh
svn commit -m "added howto section."
```

### status (stat, st)

```sh
svn status
```

* K 文件锁定在工作副本。

### unlock

解锁工作副本路径或URL

### revert

取消所有的本地编辑

```sh
svn revert .
```
