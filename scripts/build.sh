#!/bin/bash
#Auth: bell@greedlab.com
#
# 编译 markdown 文件，生成 _book
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## blog 目录
BLOG_DIRECTORY=${SCRIPT_DIR}/..

cp ${BLOG_DIRECTORY}/README.md ${BLOG_DIRECTORY}/README-BACK.md
cp ${BLOG_DIRECTORY}/SUMMARY.md ${BLOG_DIRECTORY}/README.md

rm -rf ${BLOG_DIRECTORY}/_book

cd ${BLOG_DIRECTORY}
echo "building..."
gitbook build

mv ${BLOG_DIRECTORY}/README-BACK.md ${BLOG_DIRECTORY}/README.md

cd ${CURRENT_DIR}
