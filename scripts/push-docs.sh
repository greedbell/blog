#!/bin/bash
#Auth: bell@greedlab.com
#
# 静态资源发布到 docs 目录
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## blog 目录
BLOG_DIRECTORY=${SCRIPT_DIR}/..

cd ${BLOG_DIRECTORY}

# build
echo gitbook build

cp ${BLOG_DIRECTORY}/README.md ${BLOG_DIRECTORY}/README_GITHUB.md
cp ${BLOG_DIRECTORY}/SUMMARY.md ${BLOG_DIRECTORY}/SUMMARY_GITHUB.md

greed-summary -t "Bell's Blog" -i '[scripts,resource,Resource,Publish,_book,docs,node_modules,assets]' -d  ${BLOG_DIRECTORY} -o  ${BLOG_DIRECTORY}/SUMMARY.md -S gitbook -a

cp ${BLOG_DIRECTORY}/SUMMARY.md ${BLOG_DIRECTORY}/README.md

rm -rf ${BLOG_DIRECTORY}/_book

gitbook build

mv ${BLOG_DIRECTORY}/README_GITHUB.md ${BLOG_DIRECTORY}/README.md
mv ${BLOG_DIRECTORY}/SUMMARY_GITHUB.md ${BLOG_DIRECTORY}/SUMMARY.md

# deploy the gh-pages
echo Deploy to docs

rm -rf docs
mv -f _book docs || exit 1
git add . --all
git commit -m "Deploy to GitHub by Script"
git push -q origin master

cd ${CURRENT_DIR}
