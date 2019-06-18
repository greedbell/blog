#!/bin/bash
# Auth:bell@greedlab.com

PATH=$PATH:$HOME/bin
PATH=$PATH:/usr/sbin
echo $PATH

# 远程服务器的地址
AUTO_SSH_ADDRESS=""
# 登录远程服务器的用户名
AUTO_SSH_USER=""
# 本地端口
AUTO_SSH_PORT=7070
# 日志路径
AUTO_SSH_LOG_FILE=~/log/ss5.log

function startssh()
{
  echo $(date): ssh to $AUTO_SSH_USER@$AUTO_SSH_ADDRESS
  AUTO_SSH_SCRIPT="ssh -D 0.0.0.0:$AUTO_SSH_PORT -p22 -N $AUTO_SSH_USER@$AUTO_SSH_ADDRESS"
  echo $(date): $AUTO_SSH_SCRIPT
  nohup ${AUTO_SSH_SCRIPT} >> $AUTO_SSH_LOG_FILE 2>&1 &
  echo $(date): connected
}

AUTO_SSH_RESULT=$(netstat -AaLlnW | grep $AUTO_SSH_PORT |wc -l)
if [[ $AUTO_SSH_RESULT -eq 0 ]]; then
  echo $(date): ssh is stoped
  startssh
else
  echo $(date): ssh is running
fi
