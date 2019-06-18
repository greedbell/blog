# `travis-ci`自动更新`gh-pages`分支

> 用`https`方式push

### 生成`token`

<https://github.com/settings/tokens> > 勾上`public_repo` > `Generate token`

### Travis添加`GITHUB_API_KEY`的环境变量

* 方法一

`https://travis-ci.org/<me>/<myrepo>/settings`  添加`GITHUB_API_KEY=<token>`, "Display value in build log" 设置为 "Off".

* 方法二

进入仓库根目录下运行 `travis encrypt -a GITHUB_API_KEY <token>` `GITHUB_API_KEY`会自动加到`.travis.yml`

#### .travis.yml

```ruby
after_success:
- "./scripts/deploy.sh"
```
#### deploy.sh

* 方法一

> git push -f 方式直接替换仓库文件

```shell
cd ${BLOG_DIRECTORY}/_book
git init
git config user.email "bell@greedlab.com"
git config user.name "Bell"
git add .
git commit -m "Deploy to GitHub Pages by travis"
git push -f -q https://GreedBell:${GITHUB_API_KEY}@${GITHUB_REF} HEAD:gh-pages > /dev/null 2>&1
```

* 方法二

> git remote add upstream 方式添加远程仓库，更新仓库

```shell
cd ${BLOG_DIRECTORY}/_book
git init
git config user.email "bell@greedlab.com"
git config user.name "Bell"
git remote add upstream https://GreedBell:${GITHUB_API_KEY}@${GITHUB_REF}
git fetch upstream
git reset upstream/gh-pages
git add .
git commit -m "Deploy to GitHub Pages by travis"
git push -q upstream HEAD:gh-pages
```

### Reference

* <https://github.com/steveklabnik/automatically_update_github_pages_with_travis_example>
* <https://gist.github.com/domenic/ec8b0fc8ab45f39403dd>
* <http://stackoverflow.com/questions/23277391/how-to-publish-to-github-pages-from-travis-ci>
* <https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db>
