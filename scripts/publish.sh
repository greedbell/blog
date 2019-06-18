#!/bin/bash
#Auth: bell@greedlab.com
#
# build.sh and deploy.sh
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

## blog 目录
BLOG_DIRECTORY=${SCRIPT_DIR}/..

cd ${BLOG_DIRECTORY}

# 更新
git add . --all
git reset --hard
git pull --rebase

bash ${SCRIPT_DIR}/build.sh
bash ${SCRIPT_DIR}/deploy.sh

cd ${CURRENT_DIR}
