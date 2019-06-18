#!/bin/bash
#Auth: bell@greedlab.com
#
# Installing Dependencies
#

# 当前目录
CURRENT_DIR=${PWD}

# 脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

# 进入工程根目录
cd ${SCRIPT_DIR}/..

hash gitbook || ( npm install -g gitbook-cli )
hash greed-summary || ( gem install greed-summary )

# npm install
gitbook install

cd ${CURRENT_DIR}
