# 自动发布脚本

## push.sh

生成 gitbook 目录 SUMMARY.md 和 GitHub 首页 README.md，再把所有修改提交到 GitHub

## dependences.sh

安装发布需要的依赖

## build.sh

markdown 文件编译成 html 文件，并存储到 `_book` 目录

## deploy.sh

把编译好的 html 文件，上传到 gh-pages 分支

## publish.sh

执行 `build.sh` 和 `deploy.sh` 并删除临时文件。

## push-docs.sh

编译生成静态资源、上传静态资源到 docs 目录
