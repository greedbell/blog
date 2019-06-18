#!/bin/bash
#Auth: bell@greedlab.com
#
# push to github
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## blog 目录
BLOG_DIRECTORY=${SCRIPT_DIR}/..

cd ${BLOG_DIRECTORY}

greed-summary -t "Bell's Blog" -i '[scripts,resource,Resource,Publish,_book,docs,node_modules,assets]' -d  ${BLOG_DIRECTORY}/ -o  ${BLOG_DIRECTORY}/README.md -S github -a
greed-summary -t "Bell's Blog" -i '[scripts,resource,Resource,Publish,_book,docs,node_modules,assets]' -d  ${BLOG_DIRECTORY}/ -o  ${BLOG_DIRECTORY}/SUMMARY.md -S gitbook -a

# git push
git fetch origin master
git merge origin/master
git add . --all
git commit -a -m "update"
git push origin master

cd ${CURRENT_DIR}
