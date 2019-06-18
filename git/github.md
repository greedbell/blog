# GitHub

* [logo](https://github.com/logos)
* [Markdown](https://guides.github.com/features/mastering-markdown/)

## issue

用于管理开发进度、Bug修复进度

* [Mastering Issues](https://guides.github.com/features/issues/)

### label

`issue` 的标签

### milestone

是对`issue`的集合，譬如某个版本的功能列表

### assignee

`issue` 负责人

### commit

 commit 后加上“Fixes”, “Fixed”, “Fix”, “Closes”, “Closed”, or “Close” #<issue number> 将会关闭 issue

## Pull Request

贡献代码

* [Collaborating on projects using issues and pull requests](https://help.github.com/categories/collaborating-on-projects-using-issues-and-pull-requests/)
* [Pull Request的正确打开方式](http://blog.csdn.net/zhangdaiscott/article/details/17438153)

先 fork ，再建立新的对应某个任务的分支 <fix-an-error>，再把该分支 pull request 到原分支。之后再修改<fix-an-error> 分支，如果 pull request 没 close，会自动提交。

## comment code

GitHub 不可以直接对仓库的文件评论，可以对相应的 commit 评论。所以如果如果要评论某段代码，需要 Blame 或者 History 找出对应的 commit ，然后从该 commit 中评论对应的代码。

## compare

Branch,tag,commit 之间的比较

1. 在仓库首页 URL 后面加上 `/compare` 进入比较页面
2. 左边: 输入被比较的 Branch,tag 或 commit
3. 右边: 输入比较的 Branch,tag 或 commit
